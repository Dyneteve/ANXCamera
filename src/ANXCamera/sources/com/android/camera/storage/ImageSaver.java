package com.android.camera.storage;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.location.Location;
import android.net.Uri;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.Exif;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawJPEGAttribute;
import com.android.camera.effect.renders.SnapshotEffectRender;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.watermark.WaterMarkData;
import com.android.camera2.ArcsoftDepthMap;
import com.android.gallery3d.exif.ExifInterface;
import com.xiaomi.camera.base.Constants.ShotType;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.liveshot.CircularMediaRecorder.VideoClipSavingCallback;
import java.util.List;
import java.util.Locale;
import java.util.Queue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class ImageSaver implements SaverCallback, ParallelCallback, VideoClipSavingCallback {
    private static final Executor CAMERA_SAVER_EXECUTOR;
    private static final int HOST_STATE_DESTROY = 2;
    private static final int HOST_STATE_PAUSE = 1;
    private static final int HOST_STATE_RESUME = 0;
    private static final int QUEUE_BUSY_SIZE = 40;
    private static final String TAG = ImageSaver.class.getSimpleName();
    private static final BlockingQueue<Runnable> mSaveRequestQueue = new LinkedBlockingQueue(128);
    private static final ThreadFactory sThreadFactory = new ThreadFactory() {
        private final AtomicInteger mCount = new AtomicInteger(1);

        public Thread newThread(Runnable runnable) {
            StringBuilder sb = new StringBuilder();
            sb.append("camera-saver-");
            sb.append(this.mCount.getAndIncrement());
            Thread thread = new Thread(runnable, sb.toString());
            thread.setPriority(10);
            return thread;
        }
    };
    /* access modifiers changed from: private */
    public ActivityBase mActivity;
    private Context mContext;
    private SnapshotEffectRender mEffectProcessor;
    private final Object mEffectProcessorLock = new Object();
    private Handler mHandler;
    private int mHostState;
    private volatile boolean mIsBusy;
    private boolean mIsCaptureIntent;
    private Uri mLastImageUri;
    private final Queue<ParallelTaskData> mLiveShotPendingTaskQueue = new ConcurrentLinkedQueue();
    private MemoryManager mMemoryManager;
    private Thumbnail mPendingThumbnail;
    private ParallelTaskData mStoredTaskData;
    private ThumbnailUpdater mUpdateThumbnail = new ThumbnailUpdater();
    private final Object mUpdateThumbnailLock = new Object();

    private class ThumbnailUpdater implements Runnable {
        private boolean mNeedAnimation = true;

        public ThumbnailUpdater() {
        }

        public void run() {
            ImageSaver.this.mActivity.getScreenHint().updateHint();
            ImageSaver.this.updateThumbnail(this.mNeedAnimation);
        }

        public void setNeedAnimation(boolean z) {
            this.mNeedAnimation = z;
        }
    }

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(4, 4, 10, TimeUnit.SECONDS, mSaveRequestQueue, sThreadFactory);
        threadPoolExecutor.allowCoreThreadTimeOut(true);
        CAMERA_SAVER_EXECUTOR = threadPoolExecutor;
    }

    public ImageSaver(ActivityBase activityBase, Handler handler, boolean z) {
        this.mActivity = activityBase;
        this.mHandler = handler;
        this.mIsCaptureIntent = z;
        this.mMemoryManager = new MemoryManager();
        this.mMemoryManager.initMemory();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
    }

    private void addSaveRequest(SaveRequest saveRequest) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addSaveRequest: host is being destroyed.");
            }
            if (isSaveQueueFull()) {
                this.mIsBusy = true;
            }
            addUsedMemory(saveRequest.getSize());
            saveRequest.setContextAndCallback(this.mContext, this);
            try {
                CAMERA_SAVER_EXECUTOR.execute(saveRequest);
            } catch (RejectedExecutionException e) {
                this.mIsBusy = true;
                Log.w(TAG, "stop snapshot due to thread pool is full");
            }
        }
    }

    private DrawJPEGAttribute getDrawJPEGAttribute(byte[] bArr, int i, int i2, int i3, boolean z, int i4, int i5, Location location, String str, int i6, int i7, float f, String str2, boolean z2, String str3, List<WaterMarkData> list, boolean z3, PictureInfo pictureInfo, int i8, int i9) {
        int i10 = i4;
        int i11 = i5;
        Location location2 = location;
        DrawJPEGAttribute drawJPEGAttribute = new DrawJPEGAttribute(bArr, z, i10 > i11 ? Math.max(i, i2) : Math.min(i, i2), i11 > i10 ? Math.max(i, i2) : Math.min(i, i2), i10, i11, i3, EffectController.getInstance().copyEffectRectAttribute(), location2 == null ? null : new Location(location2), str, System.currentTimeMillis(), i6, i7, f, pictureInfo.isFrontMirror(), str2, z2, pictureInfo, list, CameraSettings.isDualCameraWaterMarkOpen(), CameraSettings.isTimeWaterMarkOpen() ? str3 : null, z3, i8, i9);
        return drawJPEGAttribute;
    }

    private void insertMimojiCaptureTask(ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int jpegRotation = dataParameter.getJpegRotation();
        addImage(jpegImageData, parallelTaskData.isNeedThumbnail(), Util.createJpegName(System.currentTimeMillis()), null, System.currentTimeMillis(), null, dataParameter.getLocation(), width, height, null, jpegRotation, false, false, true, false, false, Util.ALGORITHM_NAME_MIMOJI_CAPTURE, dataParameter.getPictureInfo(), parallelTaskData.getPreviewThumbnailHash());
    }

    /* JADX WARNING: Removed duplicated region for block: B:15:0x008e  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x01a3  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x01ac  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x01de  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void insertNormalDualTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        ParallelTaskDataParameter parallelTaskDataParameter;
        int[] iArr;
        byte[] bArr;
        byte[] bArr2;
        byte[] bArr3;
        ParallelTaskDataParameter parallelTaskDataParameter2;
        Object obj;
        int[] iArr2;
        byte[] bArr4;
        byte[] bArr5;
        byte[] bArr6;
        boolean isDepthMapData = ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] portraitRawData = parallelTaskData.getPortraitRawData();
        byte[] portraitDepthData = parallelTaskData.getPortraitDepthData();
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        int filterId = dataParameter.getFilterId();
        boolean z = EffectController.getInstance().hasEffect() || filterId != FilterInfo.FILTER_ID_NONE;
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        ExifInterface exif = ExifInterface.getExif(jpegImageData);
        int orientation = ExifInterface.getOrientation(exif);
        int jpegRotation = dataParameter.getJpegRotation();
        if (parallelTaskData.isAdaptiveSnapshotSize()) {
            width = ExifInterface.getImageWidth(exif);
            height = ExifInterface.getImageHeight(exif);
        } else if ((jpegRotation + orientation) % 180 != 0) {
            i = width;
            i2 = height;
            StringBuilder sb = new StringBuilder();
            sb.append(Util.createJpegName(System.currentTimeMillis()));
            sb.append(dataParameter.getSuffix());
            String sb2 = sb.toString();
            byte[] bArr7 = null;
            if (!z) {
                Object obj2 = this.mEffectProcessorLock;
                synchronized (obj2) {
                    try {
                        if (this.mEffectProcessor != null) {
                            obj = obj2;
                            int i3 = filterId;
                            ParallelTaskDataParameter parallelTaskDataParameter3 = dataParameter;
                            DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, dataParameter.getPreviewSize().getWidth(), dataParameter.getPreviewSize().getHeight(), filterId, parallelTaskData.isNeedThumbnail(), i2, i, dataParameter.getLocation(), sb2, dataParameter.getShootOrientation(), orientation, dataParameter.getShootRotation(), dataParameter.getAlgorithmName(), true, dataParameter.getTimeWaterMarkString(), dataParameter.getFaceWaterMarkList(), false, dataParameter.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), -1);
                            this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                            byte[] bArr8 = drawJPEGAttribute.mData;
                            byte[] bArr9 = drawJPEGAttribute.mDataOfTheRegionUnderWatermarks;
                            int[] iArr3 = drawJPEGAttribute.mCoordinatesOfTheRegionUnderWatermarks;
                            if (isDepthMapData) {
                                ParallelTaskDataParameter parallelTaskDataParameter4 = parallelTaskDataParameter3;
                                parallelTaskDataParameter = parallelTaskDataParameter4;
                                iArr2 = iArr3;
                                bArr5 = bArr9;
                                bArr4 = bArr8;
                                DrawJPEGAttribute drawJPEGAttribute2 = getDrawJPEGAttribute(portraitRawData, parallelTaskDataParameter4.getPreviewSize().getWidth(), parallelTaskDataParameter4.getPreviewSize().getHeight(), i3, parallelTaskData.isNeedThumbnail(), i2, i, parallelTaskDataParameter4.getLocation(), sb2, parallelTaskDataParameter4.getShootOrientation(), orientation, parallelTaskDataParameter4.getShootRotation(), parallelTaskDataParameter4.getAlgorithmName(), false, parallelTaskDataParameter4.getTimeWaterMarkString(), parallelTaskDataParameter4.getFaceWaterMarkList(), true, parallelTaskDataParameter4.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), -1);
                                this.mEffectProcessor.processorJpegSync(drawJPEGAttribute2, false);
                                bArr6 = drawJPEGAttribute2.mData;
                            } else {
                                iArr2 = iArr3;
                                bArr4 = bArr8;
                                parallelTaskDataParameter = parallelTaskDataParameter3;
                                bArr5 = bArr9;
                                bArr6 = portraitRawData;
                            }
                            portraitRawData = bArr6;
                            bArr7 = bArr5;
                            jpegImageData = bArr4;
                        } else {
                            obj = obj2;
                            parallelTaskDataParameter = dataParameter;
                            Log.d(TAG, "insertNormalDualTask(): mEffectProcessor is null");
                            iArr2 = null;
                        }
                        bArr = bArr7;
                        bArr2 = portraitRawData;
                        iArr = iArr2;
                    } catch (Throwable th) {
                        th = th;
                        throw th;
                    }
                }
            } else {
                parallelTaskDataParameter = dataParameter;
                bArr = null;
                iArr = null;
                bArr2 = portraitRawData;
            }
            byte[] bArr10 = jpegImageData;
            if (!isDepthMapData) {
                parallelTaskDataParameter2 = parallelTaskDataParameter;
                bArr3 = Util.composeDepthMapPicture(bArr10, portraitDepthData, bArr2, bArr, iArr, parallelTaskDataParameter2.isHasDualWaterMark(), parallelTaskDataParameter2.getLightingPattern(), parallelTaskDataParameter2.getTimeWaterMarkString(), parallelTaskDataParameter2.getOutputSize().getWidth(), parallelTaskDataParameter2.getOutputSize().getHeight(), parallelTaskDataParameter2.isMirror(), parallelTaskDataParameter2.isBokehFrontCamera(), parallelTaskDataParameter2.getPictureInfo());
            } else {
                parallelTaskDataParameter2 = parallelTaskDataParameter;
                bArr3 = Util.composeMainSubPicture(bArr10, bArr, iArr);
            }
            addImage(bArr3, parallelTaskData.isNeedThumbnail(), sb2, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i2, i, null, orientation, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), -1);
        }
        i2 = width;
        i = height;
        StringBuilder sb3 = new StringBuilder();
        sb3.append(Util.createJpegName(System.currentTimeMillis()));
        sb3.append(dataParameter.getSuffix());
        String sb22 = sb3.toString();
        byte[] bArr72 = null;
        if (!z) {
        }
        byte[] bArr102 = jpegImageData;
        if (!isDepthMapData) {
        }
        addImage(bArr3, parallelTaskData.isNeedThumbnail(), sb22, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i2, i, null, orientation, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), -1);
    }

    private void insertParallelBurstTask(ParallelTaskData parallelTaskData) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("insertParallelBurstTask: path=");
        sb.append(parallelTaskData.getSavePath());
        Log.d(str, sb.toString());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] dataOfTheRegionUnderWatermarks = parallelTaskData.getDataOfTheRegionUnderWatermarks();
        int[] coordinatesOfTheRegionUnderWatermarks = parallelTaskData.getCoordinatesOfTheRegionUnderWatermarks();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(jpegImageData);
        int jpegRotation = dataParameter.getJpegRotation();
        Log.d(TAG, String.format(Locale.ENGLISH, "insertParallelBurstTask: %d x %d, %d : %d", new Object[]{Integer.valueOf(width), Integer.valueOf(height), Integer.valueOf(jpegRotation), Integer.valueOf(orientation)}));
        if ((jpegRotation + orientation) % 180 != 0) {
            int i = height;
            height = width;
            width = i;
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("insertParallelBurstTask: result = ");
        sb2.append(width);
        sb2.append("x");
        sb2.append(height);
        Log.d(str2, sb2.toString());
        String fileTitleFromPath = Util.getFileTitleFromPath(parallelTaskData.getSavePath());
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("insertParallelBurstTask: ");
        sb3.append(fileTitleFromPath);
        Log.d(str3, sb3.toString());
        boolean isNeedThumbnail = parallelTaskData.isNeedThumbnail();
        byte[] composeMainSubPicture = Util.composeMainSubPicture(jpegImageData, dataOfTheRegionUnderWatermarks, coordinatesOfTheRegionUnderWatermarks);
        boolean isNeedThumbnail2 = parallelTaskData.isNeedThumbnail();
        long currentTimeMillis = System.currentTimeMillis();
        Location location = dataParameter.getLocation();
        String algorithmName = dataParameter.getAlgorithmName();
        PictureInfo pictureInfo = dataParameter.getPictureInfo();
        addImage(composeMainSubPicture, isNeedThumbnail2, fileTitleFromPath, null, currentTimeMillis, null, location, width, height, null, orientation, false, false, isNeedThumbnail, false, true, algorithmName, pictureInfo, -1);
    }

    private void insertParallelDualTask(ParallelTaskData parallelTaskData) {
        byte[] composeMainSubPicture;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("addParallel: path=");
        sb.append(parallelTaskData.getSavePath());
        Log.d(str, sb.toString());
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        byte[] dataOfTheRegionUnderWatermarks = parallelTaskData.getDataOfTheRegionUnderWatermarks();
        int[] coordinatesOfTheRegionUnderWatermarks = parallelTaskData.getCoordinatesOfTheRegionUnderWatermarks();
        if ((6 == parallelTaskData.getParallelType() || 8 == parallelTaskData.getParallelType() || 7 == parallelTaskData.getParallelType()) && ArcsoftDepthMap.isDepthMapData(parallelTaskData.getPortraitDepthData())) {
            composeMainSubPicture = Util.composeDepthMapPicture(parallelTaskData.getJpegImageData(), parallelTaskData.getPortraitDepthData(), parallelTaskData.getPortraitRawData(), dataOfTheRegionUnderWatermarks, coordinatesOfTheRegionUnderWatermarks, dataParameter.isHasDualWaterMark(), dataParameter.getLightingPattern(), dataParameter.getTimeWaterMarkString(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), dataParameter.isMirror(), dataParameter.isBokehFrontCamera(), dataParameter.getPictureInfo());
        } else if (parallelTaskData.isLiveShotTask()) {
            composeMainSubPicture = Util.composeLiveShotPicture(jpegImageData, dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), parallelTaskData.getMicroVideoData(), parallelTaskData.getCoverFrameTimestamp(), dataParameter.isHasDualWaterMark(), dataParameter.getTimeWaterMarkString(), dataOfTheRegionUnderWatermarks, coordinatesOfTheRegionUnderWatermarks);
        } else {
            composeMainSubPicture = Util.composeMainSubPicture(jpegImageData, dataOfTheRegionUnderWatermarks, coordinatesOfTheRegionUnderWatermarks);
        }
        ParallelSaveRequest parallelSaveRequest = new ParallelSaveRequest(composeMainSubPicture, parallelTaskData.getTimestamp(), dataParameter.getLocation(), dataParameter.getJpegRotation(), parallelTaskData.getSavePath(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), parallelTaskData.isNeedThumbnail(), dataParameter.getAlgorithmName(), dataParameter.getPictureInfo());
        addSaveRequest(parallelSaveRequest);
    }

    private synchronized void insertParallelTaskData(ParallelTaskData parallelTaskData) {
        switch (parallelTaskData.getParallelType()) {
            case ShotType.MIMOJI_PREVIEW_SHOT /*-4*/:
                insertMimojiCaptureTask(parallelTaskData);
                break;
            case -3:
            case -2:
            case 0:
                insertSingleTask(parallelTaskData);
                break;
            case -1:
                insertPreviewShotTask(parallelTaskData);
                break;
            case 2:
                insertNormalDualTask(parallelTaskData);
                break;
            case 5:
            case 6:
            case 7:
            case 8:
                insertParallelDualTask(parallelTaskData);
                break;
            case 9:
                insertParallelBurstTask(parallelTaskData);
                break;
            default:
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown shot type: ");
                sb.append(parallelTaskData.getParallelType());
                throw new RuntimeException(sb.toString());
        }
    }

    private void insertPreviewShotTask(ParallelTaskData parallelTaskData) {
        PictureInfo pictureInfo;
        String str;
        int i;
        int i2;
        int i3;
        Location location;
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        if (dataParameter != null) {
            int width = dataParameter.getOutputSize().getWidth();
            int height = dataParameter.getOutputSize().getHeight();
            Location location2 = dataParameter.getLocation();
            String algorithmName = dataParameter.getAlgorithmName();
            PictureInfo pictureInfo2 = dataParameter.getPictureInfo();
            i = dataParameter.getOrientation();
            i3 = width;
            i2 = height;
            location = location2;
            str = algorithmName;
            pictureInfo = pictureInfo2;
        } else {
            location = null;
            str = null;
            pictureInfo = null;
            i3 = 0;
            i2 = 0;
            i = 0;
        }
        addImage(jpegImageData, false, Util.getFileTitleFromPath(parallelTaskData.getSavePath()), null, System.currentTimeMillis(), null, location, i3, i2, null, i, false, false, true, false, true, str, pictureInfo, -1);
    }

    private void insertSingleTask(ParallelTaskData parallelTaskData) {
        int i;
        int i2;
        ParallelTaskDataParameter parallelTaskDataParameter;
        int i3;
        String str;
        int[] iArr;
        ParallelTaskDataParameter parallelTaskDataParameter2;
        String str2;
        Object obj;
        ParallelTaskData parallelTaskData2 = parallelTaskData;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        int filterId = dataParameter.getFilterId();
        boolean z = EffectController.getInstance().hasEffect() || filterId != FilterInfo.FILTER_ID_NONE;
        byte[] jpegImageData = parallelTaskData.getJpegImageData();
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        ExifInterface exif = ExifInterface.getExif(jpegImageData);
        int orientation = ExifInterface.getOrientation(exif);
        int jpegRotation = dataParameter.getJpegRotation();
        if (parallelTaskData.isAdaptiveSnapshotSize()) {
            int imageWidth = ExifInterface.getImageWidth(exif);
            i = ExifInterface.getImageHeight(exif);
            i2 = imageWidth;
        } else if ((jpegRotation + orientation) % 180 == 0) {
            i2 = width;
            i = height;
        } else {
            i = width;
            i2 = height;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(Util.createJpegName(System.currentTimeMillis()));
        sb.append(dataParameter.getSuffix());
        String sb2 = sb.toString();
        byte[] bArr = null;
        if (z) {
            Object obj2 = this.mEffectProcessorLock;
            synchronized (obj2) {
                try {
                    if (this.mEffectProcessor != null) {
                        obj = obj2;
                        str = sb2;
                        i3 = orientation;
                        parallelTaskDataParameter = dataParameter;
                        DrawJPEGAttribute drawJPEGAttribute = getDrawJPEGAttribute(jpegImageData, dataParameter.getPreviewSize().getWidth(), dataParameter.getPreviewSize().getHeight(), filterId, parallelTaskData.isNeedThumbnail(), i2, i, dataParameter.getLocation(), sb2, dataParameter.getShootOrientation(), orientation, dataParameter.getShootRotation(), dataParameter.getAlgorithmName(), true, dataParameter.getTimeWaterMarkString(), dataParameter.getFaceWaterMarkList(), false, dataParameter.getPictureInfo(), parallelTaskData.getCurrentModuleIndex(), parallelTaskData.getPreviewThumbnailHash());
                        this.mEffectProcessor.processorJpegSync(drawJPEGAttribute, false);
                        jpegImageData = drawJPEGAttribute.mData;
                        i2 = drawJPEGAttribute.mWidth;
                        i = drawJPEGAttribute.mHeight;
                        bArr = drawJPEGAttribute.mDataOfTheRegionUnderWatermarks;
                        iArr = drawJPEGAttribute.mCoordinatesOfTheRegionUnderWatermarks;
                    } else {
                        obj = obj2;
                        str = sb2;
                        i3 = orientation;
                        parallelTaskDataParameter = dataParameter;
                        Log.d(TAG, "insertSingleTask(): mEffectProcessor is null");
                        iArr = null;
                    }
                } catch (Throwable th) {
                    th = th;
                    throw th;
                }
            }
        } else {
            str = sb2;
            i3 = orientation;
            parallelTaskDataParameter = dataParameter;
            iArr = null;
        }
        int i4 = i2;
        int i5 = i;
        if (!parallelTaskData.isLiveShotTask()) {
            byte[] composeMainSubPicture = Util.composeMainSubPicture(jpegImageData, bArr, iArr);
            if (composeMainSubPicture == null || composeMainSubPicture.length < jpegImageData.length) {
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Failed to compose main sub photos: ");
                str2 = str;
                sb3.append(str2);
                Log.e(str3, sb3.toString());
            } else {
                jpegImageData = composeMainSubPicture;
                str2 = str;
            }
            parallelTaskDataParameter2 = parallelTaskDataParameter;
        } else {
            str2 = str;
            parallelTaskDataParameter2 = parallelTaskDataParameter;
            byte[] composeLiveShotPicture = Util.composeLiveShotPicture(jpegImageData, width, height, parallelTaskData.getMicroVideoData(), parallelTaskData.getCoverFrameTimestamp(), parallelTaskDataParameter2.isHasDualWaterMark(), parallelTaskDataParameter2.getTimeWaterMarkString(), bArr, iArr);
            if (composeLiveShotPicture == null || composeLiveShotPicture.length < jpegImageData.length) {
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Failed to compose LiveShot photo: ");
                sb4.append(str2);
                Log.e(str4, sb4.toString());
            } else {
                StringBuilder sb5 = new StringBuilder();
                sb5.append(parallelTaskDataParameter2.getPrefix());
                sb5.append(str2);
                str2 = sb5.toString();
                jpegImageData = composeLiveShotPicture;
            }
        }
        if (parallelTaskData.getParallelType() == -2 || parallelTaskData.getParallelType() == -3) {
            ParallelTaskData parallelTaskData3 = parallelTaskData;
            parallelTaskData3.refillJpegData(jpegImageData);
            storeJpegData(parallelTaskData3, i4, i3);
            return;
        }
        addImage(jpegImageData, parallelTaskData.isNeedThumbnail(), str2, null, System.currentTimeMillis(), null, parallelTaskDataParameter2.getLocation(), i4, i5, null, i3, false, false, true, false, false, parallelTaskDataParameter2.getAlgorithmName(), parallelTaskDataParameter2.getPictureInfo(), parallelTaskData.getPreviewThumbnailHash());
    }

    private boolean isLastImageForThumbnail() {
        return true;
    }

    private void releaseEffectProcessor() {
        synchronized (this.mEffectProcessorLock) {
            if (this.mEffectProcessor != null && !ModuleManager.isCapture() && !ModuleManager.isPortraitModule()) {
                this.mEffectProcessor.releaseIfNeeded();
                this.mEffectProcessor = null;
            }
        }
    }

    private void releaseResourcesIfQueueEmpty() {
        releaseEffectProcessor();
        if (this.mHostState == 2 && mSaveRequestQueue.size() <= 0 && this.mLiveShotPendingTaskQueue.size() <= 0) {
            synchronized (this.mEffectProcessorLock) {
                if (this.mEffectProcessor != null) {
                    this.mEffectProcessor.releaseIfNeeded();
                    this.mEffectProcessor = null;
                }
            }
            this.mStoredTaskData = null;
        }
    }

    private void storeJpegData(ParallelTaskData parallelTaskData, int i, int i2) {
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        this.mStoredTaskData = parallelTaskData;
        int highestOneBit = Integer.highestOneBit((int) Math.floor(((double) i) / ((double) dataParameter.getPreviewSize().getWidth())));
        int shootOrientation = 360 - dataParameter.getShootOrientation();
        Bitmap createBitmap = Thumbnail.createBitmap(parallelTaskData.getJpegImageData(), i2 + shootOrientation + Util.getDisplayRotation(this.mActivity), false, highestOneBit);
        if (createBitmap != null) {
            this.mActivity.getCameraScreenNail().renderBitmapToCanvas(createBitmap);
        }
    }

    /* access modifiers changed from: private */
    public void updateThumbnail(boolean z) {
        Thumbnail thumbnail;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateThumbnail needAnimation:");
        sb.append(z);
        Log.d(str, sb.toString());
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacks(this.mUpdateThumbnail);
            thumbnail = this.mPendingThumbnail;
            this.mPendingThumbnail = null;
        }
        if (thumbnail != null) {
            this.mActivity.getThumbnailUpdater().setThumbnail(thumbnail, true, z);
            if (this.mActivity.isActivityPaused()) {
                this.mActivity.getThumbnailUpdater().saveThumbnailToFile();
            }
        }
    }

    public void addImage(byte[] bArr, boolean z, String str, String str2, long j, Uri uri, Location location, int i, int i2, ExifInterface exifInterface, int i3, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, String str3, PictureInfo pictureInfo, int i4) {
        Uri uri2 = uri;
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isParallelProcess: parallel=");
        boolean z7 = z6;
        sb.append(z7);
        sb.append(" uri=");
        sb.append(uri2);
        sb.append(" algo=");
        sb.append(str3);
        Log.d(str4, sb.toString());
        if (str2 != null && uri2 == null) {
            uri2 = this.mLastImageUri;
        }
        Uri uri3 = uri2;
        byte[] bArr2 = bArr;
        PerformanceTracker.trackImageSaver(bArr2, 0);
        ImageSaveRequest imageSaveRequest = new ImageSaveRequest(bArr2, z, str, str2, j, uri3, location, i, i2, exifInterface, i3, z2, z3, z4, z5, z7, str3, pictureInfo, i4);
        addSaveRequest(imageSaveRequest);
    }

    public synchronized void addUsedMemory(int i) {
        this.mMemoryManager.addUsedMemory(i);
    }

    public void addVideo(String str, ContentValues contentValues, boolean z) {
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addVideo: host is being destroyed.");
            }
            addSaveRequest(new VideoSaveRequest(str, contentValues, z));
        }
    }

    public Uri addVideoSync(String str, ContentValues contentValues, boolean z) {
        Uri uri;
        synchronized (this) {
            if (2 == this.mHostState) {
                Log.v(TAG, "addVideo: host is being destroyed.");
            }
            VideoSaveRequest videoSaveRequest = new VideoSaveRequest(str, contentValues, z);
            videoSaveRequest.setContextAndCallback(this.mContext, this);
            videoSaveRequest.save();
            uri = videoSaveRequest.mUri;
        }
        return uri;
    }

    public int getBurstDelay() {
        return this.mMemoryManager.getBurstDelay();
    }

    public byte[] getStoredJpegData() {
        return this.mStoredTaskData.getJpegImageData();
    }

    public float getSuitableBurstShotSpeed() {
        return 0.66f;
    }

    public boolean isBusy() {
        return this.mIsBusy;
    }

    public boolean isNeedSlowDown() {
        return this.mMemoryManager.isNeedSlowDown();
    }

    public boolean isNeedStopCapture() {
        return this.mMemoryManager.isNeedStopCapture();
    }

    public boolean isPendingSave() {
        return this.mLiveShotPendingTaskQueue.size() > 0 || mSaveRequestQueue.size() > 0;
    }

    public synchronized boolean isSaveQueueFull() {
        boolean isSaveQueueFull;
        isSaveQueueFull = this.mMemoryManager.isSaveQueueFull();
        this.mIsBusy |= isSaveQueueFull;
        return isSaveQueueFull;
    }

    public boolean needThumbnail(boolean z) {
        boolean z2;
        synchronized (this) {
            if (z) {
                try {
                    if (isLastImageForThumbnail() && !this.mIsCaptureIntent) {
                        z2 = true;
                    }
                } finally {
                }
            }
            z2 = false;
        }
        return z2;
    }

    public void notifyNewMediaData(Uri uri, String str, int i) {
        if (!this.mIsCaptureIntent) {
            synchronized (this) {
                if (i == 21) {
                    this.mContext.sendBroadcast(new Intent("android.hardware.action.NEW_VIDEO", uri));
                    this.mActivity.onNewUriArrived(uri, str);
                } else if (i == 31) {
                    Util.broadcastNewPicture(this.mContext, uri);
                    this.mLastImageUri = uri;
                    this.mActivity.onNewUriArrived(uri, str);
                }
            }
        }
    }

    public void onHostDestroy() {
        synchronized (this) {
            this.mHostState = 2;
            releaseResourcesIfQueueEmpty();
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v(TAG, "onHostDestroy");
    }

    public void onHostPause() {
        synchronized (this) {
            this.mHostState = 1;
        }
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.removeCallbacksAndMessages(null);
            this.mPendingThumbnail = null;
        }
        Log.v(TAG, "onHostPause");
    }

    public void onHostResume(boolean z) {
        synchronized (this) {
            this.mIsCaptureIntent = z;
            this.mHostState = 0;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onHostResume: isCapture=");
            sb.append(this.mIsCaptureIntent);
            Log.v(str, sb.toString());
        }
    }

    public void onModuleDestroy() {
        releaseEffectProcessor();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:37:0x0148, code lost:
        return r1;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean onParallelProcessFinish(ParallelTaskData parallelTaskData) {
        int i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onParallelProcessFinish: path: ");
        sb.append(parallelTaskData.getSavePath());
        Log.i(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("onParallelProcessFinish: live: ");
        sb2.append(parallelTaskData.isLiveShotTask());
        Log.i(str2, sb2.toString());
        int filterId = parallelTaskData.getDataParameter().getFilterId();
        if (EffectController.getInstance().hasEffect() || filterId != FilterInfo.FILTER_ID_NONE) {
            synchronized (this.mEffectProcessorLock) {
                if (this.mEffectProcessor == null) {
                    this.mEffectProcessor = new SnapshotEffectRender(this.mActivity, this.mIsCaptureIntent);
                    this.mEffectProcessor.setImageSaver(this);
                    this.mEffectProcessor.setQuality(JpegEncodingQualityMappings.getQualityNumber(CameraSettings.getJpegQuality(false)));
                }
            }
        }
        boolean z = true;
        if (parallelTaskData.isLiveShotTask()) {
            byte[] microVideoData = parallelTaskData.getMicroVideoData();
            if (microVideoData != null) {
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("onParallelProcessFinish: insert: ");
                sb3.append(parallelTaskData.hashCode());
                Log.d(str3, sb3.toString());
                if (this.mLiveShotPendingTaskQueue.remove(parallelTaskData)) {
                    int length = microVideoData.length;
                    reduceUsedMemory(length);
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("onParallelProcessFinish: memory[-]: ");
                    sb4.append(length);
                    sb4.append(", task: ");
                    sb4.append(parallelTaskData.hashCode());
                    Log.d(str4, sb4.toString());
                }
                if (parallelTaskData.getJpegImageData() != null) {
                    insertParallelTaskData(parallelTaskData);
                } else {
                    Log.e(TAG, "onParallelProcessFinish: error: jpeg data is null");
                    return true;
                }
            } else {
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("onParallelProcessFinish: enqueue: ");
                sb5.append(parallelTaskData.hashCode());
                Log.d(str5, sb5.toString());
                this.mLiveShotPendingTaskQueue.offer(parallelTaskData);
                byte[] jpegImageData = parallelTaskData.getJpegImageData();
                if (jpegImageData != null) {
                    i = jpegImageData.length;
                    addUsedMemory(i);
                } else {
                    i = 0;
                }
                String str6 = TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("onParallelProcessFinish: memory[+]: ");
                sb6.append(i);
                sb6.append(", task: ");
                sb6.append(parallelTaskData.hashCode());
                Log.d(str6, sb6.toString());
            }
            String str7 = TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("onParallelProcessFinish: pending: ");
            sb7.append(this.mLiveShotPendingTaskQueue.size());
            Log.d(str7, sb7.toString());
            if (microVideoData == null) {
                z = false;
            }
        } else {
            String str8 = TAG;
            StringBuilder sb8 = new StringBuilder();
            sb8.append("onParallelProcessFinish: insert: ");
            sb8.append(parallelTaskData.hashCode());
            Log.d(str8, sb8.toString());
            insertParallelTaskData(parallelTaskData);
            return true;
        }
    }

    public void onSaveFinish(int i) {
        synchronized (this) {
            reduceUsedMemory(i);
            if (!isSaveQueueFull() && mSaveRequestQueue.size() < 40) {
                this.mIsBusy = false;
            }
            releaseResourcesIfQueueEmpty();
        }
    }

    public void onVideoClipSavingCancelled(@Nullable Object obj) {
        Log.d(TAG, "onVideoClipSavingCancelled: video = 0, timestamp = -1");
        onVideoClipSavingCompleted(obj, new byte[0], -1);
    }

    public synchronized void onVideoClipSavingCompleted(@Nullable Object obj, @NonNull byte[] bArr, long j) {
        if (!ParallelTaskData.class.isInstance(obj)) {
            Log.d(TAG, "onVideoClipSavingCompleted: Oops, corresponding task is not found");
            return;
        }
        ParallelTaskData parallelTaskData = (ParallelTaskData) obj;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onVideoClipSavingCompleted: video: ");
        sb.append(bArr.length);
        sb.append(", timestamp = ");
        sb.append(j);
        Log.d(str, sb.toString());
        parallelTaskData.fillVideoData(bArr, j);
        if (parallelTaskData.isJpegDataReady()) {
            if (this.mLiveShotPendingTaskQueue.remove(parallelTaskData)) {
                int length = parallelTaskData.getJpegImageData().length;
                reduceUsedMemory(length);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onVideoClipSavingCompleted: memory[-]: ");
                sb2.append(length);
                sb2.append(", task: ");
                sb2.append(parallelTaskData.hashCode());
                Log.d(str2, sb2.toString());
            }
            insertParallelTaskData(parallelTaskData);
            parallelTaskData.releaseImageData();
        } else if (parallelTaskData.isPictureFilled()) {
            Log.e(TAG, "onVideoClipSavingCompleted: get error jpeg data, ignore this liveshot");
            if (this.mLiveShotPendingTaskQueue.remove(parallelTaskData)) {
                int length2 = parallelTaskData.getJpegImageData().length;
                reduceUsedMemory(length2);
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("onVideoClipSavingCompleted: memory[-]: ");
                sb3.append(length2);
                sb3.append(", task: ");
                sb3.append(parallelTaskData.hashCode());
                Log.d(str3, sb3.toString());
            }
            parallelTaskData.releaseImageData();
        } else {
            String str4 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("onVideoClipSavingCompleted: enqueue: ");
            sb4.append(parallelTaskData.hashCode());
            Log.d(str4, sb4.toString());
            this.mLiveShotPendingTaskQueue.offer(parallelTaskData);
            int length3 = bArr.length;
            addUsedMemory(length3);
            String str5 = TAG;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("onVideoClipSavingCompleted: memory[+]: ");
            sb5.append(length3);
            sb5.append(", task: ");
            sb5.append(parallelTaskData.hashCode());
            Log.d(str5, sb5.toString());
        }
        String str6 = TAG;
        StringBuilder sb6 = new StringBuilder();
        sb6.append("onVideoClipSavingCompleted: pending: ");
        sb6.append(this.mLiveShotPendingTaskQueue.size());
        Log.d(str6, sb6.toString());
    }

    public void onVideoClipSavingException(@Nullable Object obj, @NonNull Throwable th) {
        Log.d(TAG, "onVideoClipSavingException: video = 0, timestamp = -1");
        onVideoClipSavingCompleted(obj, new byte[0], -1);
    }

    public void postHideThumbnailProgressing() {
        synchronized (this.mUpdateThumbnailLock) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                    if (actionProcessing != null) {
                        actionProcessing.updateLoading(true);
                    }
                }
            });
        }
    }

    public void postUpdateThumbnail(Thumbnail thumbnail, boolean z) {
        synchronized (this.mUpdateThumbnailLock) {
            Log.d(TAG, "postUpdateThumbnail");
            this.mPendingThumbnail = thumbnail;
            this.mUpdateThumbnail.setNeedAnimation(z);
            this.mHandler.post(this.mUpdateThumbnail);
        }
    }

    public synchronized void reduceUsedMemory(int i) {
        this.mMemoryManager.reduceUsedMemory(i);
    }

    public void saveStoredData() {
        int i;
        int i2;
        ParallelTaskData parallelTaskData = this.mStoredTaskData;
        ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
        String createJpegName = Util.createJpegName(System.currentTimeMillis());
        int width = dataParameter.getPictureSize().getWidth();
        int height = dataParameter.getPictureSize().getHeight();
        int orientation = Exif.getOrientation(this.mStoredTaskData.getJpegImageData());
        if ((dataParameter.getJpegRotation() + orientation) % 180 == 0) {
            i2 = width;
            i = height;
        } else {
            i = width;
            i2 = height;
        }
        addImage(this.mStoredTaskData.getJpegImageData(), parallelTaskData.isNeedThumbnail(), createJpegName, null, System.currentTimeMillis(), null, dataParameter.getLocation(), i2, i, null, orientation, false, false, true, false, false, dataParameter.getAlgorithmName(), dataParameter.getPictureInfo(), -1);
    }

    public void updateImage(String str, String str2) {
        ImageSaveRequest imageSaveRequest = new ImageSaveRequest();
        imageSaveRequest.title = str;
        imageSaveRequest.oldTitle = str2;
        addSaveRequest(imageSaveRequest);
    }

    public void updatePreviewThumbnailUri(int i, Uri uri) {
        synchronized (this.mUpdateThumbnailLock) {
            Thumbnail thumbnail = this.mActivity.getThumbnailUpdater().getThumbnail();
            if (thumbnail != null) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("previewThumbnailHash:");
                sb.append(i);
                sb.append(" current thumbnail hash:");
                sb.append(thumbnail.hashCode());
                Log.d(str, sb.toString());
                if (i <= 0 || thumbnail.hashCode() == i) {
                    thumbnail.setUri(uri);
                }
            }
        }
    }
}
