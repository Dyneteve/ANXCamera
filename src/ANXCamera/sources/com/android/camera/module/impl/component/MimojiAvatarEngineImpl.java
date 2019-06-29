package com.android.camera.module.impl.component;

import android.content.ContentValues;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.location.Location;
import android.media.Image;
import android.opengl.GLES20;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.ParcelFileDescriptor;
import android.support.v4.media.session.PlaybackStateCompat;
import android.util.Size;
import android.widget.Toast;
import com.android.camera.ActivityBase;
import com.android.camera.CameraSettings;
import com.android.camera.FileCompat;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.SurfaceTextureScreenNail.ExternalFrameProcessor;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.renders.DeviceWatermarkParam;
import com.android.camera.fragment.mimoji.AvatarEngineManager;
import com.android.camera.fragment.mimoji.BitmapUtils;
import com.android.camera.fragment.mimoji.MimojiHelper;
import com.android.camera.fragment.mimoji.MimojiInfo;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.LiveModule;
import com.android.camera.module.Module;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.MimojiAlert;
import com.android.camera.protocol.ModeProtocol.MimojiAvatarEngine;
import com.android.camera.protocol.ModeProtocol.MimojiEditor;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.CameraCapabilities;
import com.arcsoft.avatar.AvatarConfig.ASAvatarConfigValue;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProcessInfo;
import com.arcsoft.avatar.AvatarConfig.ASAvatarProfileResult;
import com.arcsoft.avatar.AvatarEngine;
import com.arcsoft.avatar.RecordModule;
import com.arcsoft.avatar.RecordModule.MediaResultCallback;
import com.arcsoft.avatar.recoder.RecordingListener;
import com.arcsoft.avatar.util.ASVLOFFSCREEN;
import com.arcsoft.avatar.util.AsvloffscreenUtil;
import com.arcsoft.avatar.util.LOG;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import com.xiaomi.camera.core.PictureInfo;
import io.reactivex.annotations.SchedulerSupport;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

public class MimojiAvatarEngineImpl implements ExternalFrameProcessor, MimojiAvatarEngine, PreviewCallback {
    private static final int HANDLER_RECORDING_CURRENT_FILE_SIZE = 3;
    private static final int HANDLER_RECORDING_CURRENT_TIME = 1;
    private static final int HANDLER_RECORDING_MAX_DURATION_REACHED = 2;
    private static final int HANDLER_RECORDING_MAX_FILE_SIZE_REACHED = 4;
    private static final int HANDLER_RESOURCE_ERROR_BROKEN = 0;
    private static final long START_OFFSET_MS = 450;
    /* access modifiers changed from: private */
    public static final String TAG = MimojiAvatarEngineImpl.class.getSimpleName();
    /* access modifiers changed from: private */
    public ActivityBase mActivityBase;
    /* access modifiers changed from: private */
    public AvatarEngine mAvatar;
    /* access modifiers changed from: private */
    public final Object mAvatarLock = new Object();
    /* access modifiers changed from: private */
    public String mAvatarTemplatePath = "";
    private V6CameraGLSurfaceView mCameraView;
    /* access modifiers changed from: private */
    public MediaResultCallback mCaptureCallback = new MediaResultCallback() {
        public void onCaptureResult(final ByteBuffer byteBuffer) {
            Log.d(MimojiAvatarEngineImpl.TAG, "onCapture Result");
            MimojiAvatarEngineImpl.this.mLoadHandler.post(new Runnable() {
                public void run() {
                    MimojiAvatarEngineImpl.this.CaptureCallback(byteBuffer);
                }
            });
        }

        public void onVideoResult() {
            Log.d(MimojiAvatarEngineImpl.TAG, "stop video record callback");
            MimojiAvatarEngineImpl.this.mIsRecording = false;
            MimojiAvatarEngineImpl.this.mIsRecordStopping = false;
            MimojiAvatarEngineImpl.this.mActivityBase.getImageSaver().addVideo(MimojiAvatarEngineImpl.this.mSaveVideoPath, MimojiAvatarEngineImpl.this.mContentValues, true);
            if (MimojiAvatarEngineImpl.this.mVideoFileDescriptor != null) {
                try {
                    MimojiAvatarEngineImpl.this.mVideoFileDescriptor.close();
                } catch (IOException e) {
                    Log.e(MimojiAvatarEngineImpl.TAG, "fail to close fd", e);
                }
                MimojiAvatarEngineImpl.this.mVideoFileDescriptor = null;
            }
            if (MimojiAvatarEngineImpl.this.mGetThumCountDownLatch != null) {
                MimojiAvatarEngineImpl.this.mGetThumCountDownLatch.countDown();
            }
        }
    };
    /* access modifiers changed from: private */
    public ContentValues mContentValues;
    /* access modifiers changed from: private */
    public Context mContext;
    private CountDownTimer mCountDownTimer;
    /* access modifiers changed from: private */
    public int mCurrentScreenOrientation = 0;
    private int mDeviceRotation = 90;
    /* access modifiers changed from: private */
    public Size mDrawSize;
    private int mFaceDectectResult = 1;
    /* access modifiers changed from: private */
    public CountDownLatch mGetThumCountDownLatch;
    /* access modifiers changed from: private */
    public Handler mHandler = new Handler(Looper.getMainLooper()) {
        public void handleMessage(Message message) {
            super.handleMessage(message);
            switch (message.what) {
            }
        }
    };
    /* access modifiers changed from: private */
    public volatile boolean mIsAvatarInited;
    private boolean mIsFaceDetectSuccess = false;
    /* access modifiers changed from: private */
    public boolean mIsFrontCamera;
    /* access modifiers changed from: private */
    public boolean mIsRecordStopping = false;
    /* access modifiers changed from: private */
    public volatile boolean mIsRecording;
    private boolean mIsShutterButtonClick = false;
    /* access modifiers changed from: private */
    public boolean mIsStopRender = true;
    private boolean mLastNeedBeauty = false;
    /* access modifiers changed from: private */
    public Handler mLoadHandler;
    private Handler mLoadResourceHandler;
    private HandlerThread mLoadResourceThread = new HandlerThread("LoadResource");
    private HandlerThread mLoadThread = new HandlerThread("LoadConfig");
    private MainContentProtocol mMainProtocol;
    private int mMaxVideoDurationInMs = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
    private MimojiEditor mMimojiEditor;
    /* access modifiers changed from: private */
    public MimojiStatusManager mMimojiStatusManager;
    private boolean mNeedCapture = false;
    /* access modifiers changed from: private */
    public boolean mNeedShowNoFaceTips = false;
    /* access modifiers changed from: private */
    public int mOrientation;
    /* access modifiers changed from: private */
    public int mPreviewHeight;
    /* access modifiers changed from: private */
    public int mPreviewWidth;
    /* access modifiers changed from: private */
    public RecordModule mRecordModule;
    /* access modifiers changed from: private */
    public RecordingListener mRecordingListener = new RecordingListener() {
        public void onRecordingListener(int i, Object obj) {
            Message obtainMessage = MimojiAvatarEngineImpl.this.mHandler.obtainMessage();
            switch (i) {
                case 257:
                    obtainMessage.arg1 = (int) ((((Long) obj).longValue() / 1000) / 1000);
                    obtainMessage.what = 2;
                    break;
                case 258:
                    long longValue = (((Long) obj).longValue() / 1000) / 1000;
                    obtainMessage.arg1 = (int) longValue;
                    String access$100 = MimojiAvatarEngineImpl.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onRecordingListener_time = ");
                    sb.append(longValue);
                    Log.d(access$100, sb.toString());
                    obtainMessage.what = 1;
                    break;
                case 259:
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                    obtainMessage.what = 4;
                    break;
                case 260:
                    obtainMessage.arg1 = (int) (((Long) obj).longValue() / PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
                    obtainMessage.what = 3;
                    break;
            }
            obtainMessage.sendToTarget();
        }
    };
    /* access modifiers changed from: private */
    public String mSaveVideoPath;
    /* access modifiers changed from: private */
    public boolean mShowAvatar = false;
    private int[] mTextureId = new int[1];
    /* access modifiers changed from: private */
    public Handler mUiHandler;
    /* access modifiers changed from: private */
    public ParcelFileDescriptor mVideoFileDescriptor;

    private MimojiAvatarEngineImpl(ActivityBase activityBase) {
        this.mActivityBase = activityBase;
        this.mCameraView = activityBase.getGLView();
        this.mContext = activityBase.getCameraAppImpl().getApplicationContext();
        this.mMainProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        this.mLoadResourceThread.start();
        this.mLoadResourceHandler = new Handler(this.mLoadResourceThread.getLooper());
        this.mLoadThread.start();
        this.mLoadHandler = new Handler(this.mLoadThread.getLooper());
        this.mUiHandler = new Handler(activityBase.getMainLooper());
        this.mMimojiStatusManager = DataRepository.dataItemLive().getMimojiStatusManager();
        this.mIsAvatarInited = false;
        MimojiHelper.init(this.mContext);
    }

    /* access modifiers changed from: private */
    public void CaptureCallback(ByteBuffer byteBuffer) {
        Bitmap createBitmap = Bitmap.createBitmap(this.mDrawSize.getWidth(), this.mDrawSize.getHeight(), Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(byteBuffer);
        Matrix matrix = new Matrix();
        if (!this.mIsFrontCamera || (this.mIsFrontCamera && (this.mDeviceRotation == 90 || this.mDeviceRotation == 270))) {
            matrix.postScale(1.0f, -1.0f);
        } else if (this.mDeviceRotation % 180 == 0) {
            matrix.postScale(-1.0f, 1.0f);
        }
        Bitmap createBitmap2 = Bitmap.createBitmap(createBitmap, 0, 0, this.mDrawSize.getWidth(), this.mDrawSize.getHeight(), matrix, false);
        int i = 0;
        byte[] bitmapData = Util.getBitmapData(createBitmap2, BaseModule.getJpegQuality(false));
        String str = null;
        Thumbnail createThumbnail = Thumbnail.createThumbnail(null, this.mIsFrontCamera ? createBitmap : createBitmap2, (!this.mIsFrontCamera || this.mDeviceRotation % 180 != 0) ? this.mDeviceRotation : (this.mDeviceRotation + 180) % 360, this.mIsFrontCamera);
        createThumbnail.startWaitingForUri();
        this.mActivityBase.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
        ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -4, null);
        parallelTaskData.fillJpegData(bitmapData, 0);
        int jpegRotation = (Util.getJpegRotation(this.mIsFrontCamera ? 1 : 0, this.mDeviceRotation) + 270) % 360;
        Builder builder = new Builder(this.mDrawSize, this.mDrawSize, this.mDrawSize);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        Builder filterId = builder.setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setJpegRotation(jpegRotation).setJpegQuality(BaseModule.getJpegQuality(false)).setFilterId(FilterInfo.FILTER_ID_NONE);
        if (-1 != this.mOrientation) {
            i = this.mOrientation;
        }
        Builder orientation = filterId.setOrientation(i);
        if (CameraSettings.isTimeWaterMarkOpen()) {
            str = Util.getTimeWatermark();
        }
        parallelTaskData.fillParameter(orientation.setTimeWaterMarkString(str).setDeviceWatermarkParam(getDeviceWaterMarkParam()).setPictureInfo(getPictureInfo()).setLocation(currentLocation).build());
        this.mActivityBase.getImageSaver().onParallelProcessFinish(parallelTaskData);
        createBitmap.recycle();
        createBitmap2.recycle();
        ((LiveModule) this.mActivityBase.getCurrentModule()).onMimojiCaptureCallback();
    }

    private void animateCapture() {
        this.mActivityBase.playCameraSound(0);
    }

    public static MimojiAvatarEngineImpl create(ActivityBase activityBase) {
        return new MimojiAvatarEngineImpl(activityBase);
    }

    private void createAvatar(byte[] bArr, int i, int i2) {
        int avatarProfile;
        if (this.mAvatarTemplatePath != AvatarEngineManager.PersonTemplatePath) {
            this.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
        }
        ASAvatarProfileResult aSAvatarProfileResult = new ASAvatarProfileResult();
        synchronized (this.mAvatarLock) {
            avatarProfile = this.mAvatar.avatarProfile(AvatarEngineManager.PersonTemplatePath, i, i2, i * 4, bArr, 0, false, aSAvatarProfileResult, null, $$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1rs.INSTANCE);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("avatarProfile res: ");
        sb.append(avatarProfile);
        sb.append(", status:");
        sb.append(aSAvatarProfileResult.status);
        sb.append(", gender: ");
        sb.append(aSAvatarProfileResult.gender);
        LOG.d(str, sb.toString());
        if (aSAvatarProfileResult.status == 254 || aSAvatarProfileResult.status == 246) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("result = ");
            sb2.append(avatarProfile);
            Log.d(str2, sb2.toString());
            this.mUiHandler.post(new Runnable() {
                public void run() {
                    MimojiAvatarEngineImpl.this.setDisableSingleTapUp(true);
                    MimojiAvatarEngineImpl.this.onProfileFinish();
                }
            });
            return;
        }
        if (aSAvatarProfileResult.status == 1) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_no_face_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 2) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_facial_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 4) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_hairstyle_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 8) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_haircolor_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 16) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_gender_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 32) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_skincolor_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 64) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_glass_failed, 0).show();
        } else if ((aSAvatarProfileResult.status & 128) == 0) {
            Toast.makeText(this.mContext, R.string.mimoji_detect_faceshape_failed, 0).show();
        } else {
            Toast.makeText(this.mContext, R.string.mimoji_detect_unknow_failed, 0).show();
        }
        this.mActivityBase.runOnUiThread(new Runnable() {
            public void run() {
                ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideMimojiProgress(false);
            }
        });
        ((LiveModule) this.mActivityBase.getCurrentModule()).onMimojiCreateCompleted(false);
    }

    private DeviceWatermarkParam getDeviceWaterMarkParam() {
        float f;
        float f2;
        float f3;
        float resourceFloat;
        float resourceFloat2;
        float resourceFloat3;
        boolean isDualCameraWaterMarkOpen = CameraSettings.isDualCameraWaterMarkOpen();
        boolean isFrontCameraWaterMarkOpen = CameraSettings.isFrontCameraWaterMarkOpen();
        if (isDualCameraWaterMarkOpen || isFrontCameraWaterMarkOpen) {
            isDualCameraWaterMarkOpen = false;
            isFrontCameraWaterMarkOpen = true;
        }
        boolean z = isDualCameraWaterMarkOpen;
        boolean z2 = isFrontCameraWaterMarkOpen;
        if (z) {
            resourceFloat = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 0.0f);
            resourceFloat2 = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 0.0f);
            resourceFloat3 = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 0.0f);
        } else if (z2) {
            resourceFloat = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_size_ratio, 0.0f);
            resourceFloat2 = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_x_ratio, 0.0f);
            resourceFloat3 = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_y_ratio, 0.0f);
        } else {
            f3 = 0.0f;
            f2 = 0.0f;
            f = 0.0f;
            DeviceWatermarkParam deviceWatermarkParam = new DeviceWatermarkParam(z, z2, CameraSettings.isUltraPixelRearOn(), CameraSettings.getDualCameraWaterMarkFilePathVendor(), f3, f2, f);
            return deviceWatermarkParam;
        }
        f = resourceFloat3;
        f3 = resourceFloat;
        f2 = resourceFloat2;
        DeviceWatermarkParam deviceWatermarkParam2 = new DeviceWatermarkParam(z, z2, CameraSettings.isUltraPixelRearOn(), CameraSettings.getDualCameraWaterMarkFilePathVendor(), f3, f2, f);
        return deviceWatermarkParam2;
    }

    private Map<String, String> getMimojiPara() {
        Map<String, String> hashMap = new HashMap<>();
        if (this.mShowAvatar) {
            ASAvatarConfigValue aSAvatarConfigValue = new ASAvatarConfigValue();
            this.mAvatar.getConfigValue(aSAvatarConfigValue);
            hashMap = AvatarEngineManager.getMimojiConfigValue(aSAvatarConfigValue);
            String str = "";
            if (this.mAvatarTemplatePath.equals(AvatarEngineManager.PersonTemplatePath)) {
                str = SchedulerSupport.CUSTOM;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.PigTemplatePath)) {
                str = AvatarEngineManager.FAKE_PIG_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.BearTemplatePath)) {
                str = AvatarEngineManager.FAKE_BEAR_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.RoyanTemplatePath)) {
                str = AvatarEngineManager.FAKE_ROYAN_CONFIGPATH;
            } else if (this.mAvatarTemplatePath.equals(AvatarEngineManager.RabbitTemplatePath)) {
                str = AvatarEngineManager.FAKE_RABBIT_CONFIGPATH;
            }
            hashMap.put(CameraStat.PARAM_MIMOJI_CATEGORY, str);
        } else {
            hashMap.put(CameraStat.PARAM_MIMOJI_CATEGORY, TEDefine.FACE_BEAUTY_NULL);
        }
        return hashMap;
    }

    private PictureInfo getPictureInfo() {
        PictureInfo opMode = new PictureInfo().setFrontMirror(isFrontMirror()).setSensorType(true).setBokehFrontCamera(false).setHdrType("off").setOpMode(getOperatingMode());
        opMode.end();
        return opMode;
    }

    private void initMimojiResource(Context context) {
        final String gw = DataRepository.dataItemFeature().gw();
        if (!gw.equals(CameraSettings.getMimojiModleVersion())) {
            DataRepository.dataItemLive().getMimojiStatusManager().setIsLoading(true);
        }
        if (!FileUtils.hasDir(MimojiHelper.MIMOJI_DIR)) {
            FileUtils.delDir(MimojiHelper.MIMOJI_DIR);
        }
        try {
            Util.verifyAssetZip(this.mContext, "mimoji/data.zip", MimojiHelper.MIMOJI_DIR, 32768);
        } catch (Exception e) {
            Log.e(TAG, "verify asset zip failed...", e);
        }
        this.mLoadResourceHandler.post(new Runnable() {
            public void run() {
                long currentTimeMillis = System.currentTimeMillis();
                try {
                    Util.verifyAssetZip(MimojiAvatarEngineImpl.this.mContext, "mimoji/model.zip", MimojiHelper.MIMOJI_DIR, 32768);
                } catch (Exception e) {
                    Log.e(MimojiAvatarEngineImpl.TAG, "verify asset zip failed...", e);
                }
                String access$100 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("init model spend time = ");
                sb.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(access$100, sb.toString());
                DataRepository.dataItemLive().getMimojiStatusManager().setIsLoading(false);
                CameraSettings.setMimojiModleVersion(gw);
                String access$1002 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("mAvatarTemplatePath = ");
                sb2.append(MimojiAvatarEngineImpl.this.mAvatarTemplatePath);
                Log.i(access$1002, sb2.toString());
                MimojiAvatarEngineImpl.this.mUiHandler.post(new Runnable() {
                    public void run() {
                        MimojiAlert mimojiAlert = (MimojiAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(226);
                        if (mimojiAlert != null) {
                            mimojiAlert.firstProgressShow(false);
                        } else {
                            Log.i(MimojiAvatarEngineImpl.TAG, "mimojiAlert finish == null");
                        }
                    }
                });
            }
        });
    }

    private boolean isFrontMirror() {
        if (!this.mIsFrontCamera) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        return CameraSettings.isFrontMirror();
    }

    static /* synthetic */ void lambda$createAvatar$0(int i) {
    }

    /* access modifiers changed from: private */
    public void onProfileFinish() {
        Log.d(TAG, "onProfileFinish");
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (recordState != null) {
            recordState.onPostSavingFinish();
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.alertMimojiFaceDetect(false, -1);
        }
        releaseRender();
        this.mMainProtocol.mimojiEnd();
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_EDIT_MID);
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.startMimojiEdit(true, 105);
        }
        ((LiveModule) this.mActivityBase.getCurrentModule()).onMimojiCreateCompleted(true);
        CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_CREATE_CAPTURE);
    }

    private void quit() {
        this.mLoadThread.quitSafely();
        this.mLoadResourceThread.quitSafely();
    }

    private void release() {
        Log.d(TAG, "avatar release");
        if (this.mGetThumCountDownLatch != null) {
            try {
                this.mGetThumCountDownLatch.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        this.mIsAvatarInited = false;
        final int hashCode = hashCode();
        this.mLoadHandler.post(new Runnable() {
            public void run() {
                synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                    if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                        String access$100 = MimojiAvatarEngineImpl.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("avatar destroy | ");
                        sb.append(hashCode);
                        Log.d(access$100, sb.toString());
                        MimojiAvatarEngineImpl.this.mAvatar.saveConfig(AvatarEngineManager.TempEditConfigPath);
                        MimojiAvatarEngineImpl.this.mAvatar.destroyOutlineEngine();
                        MimojiAvatarEngineImpl.this.mAvatar.unInit();
                        if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                            MimojiAvatarEngineImpl.this.mRecordModule.unInit();
                        }
                        AvatarEngineManager.getInstance().releaseAvatar();
                    }
                }
            }
        });
        if (this.mVideoFileDescriptor != null) {
            try {
                this.mVideoFileDescriptor.close();
            } catch (IOException e2) {
                Log.e(TAG, "fail to close fd", e2);
            }
            this.mVideoFileDescriptor = null;
        }
    }

    /* access modifiers changed from: private */
    public void reloadConfig() {
        int mode = this.mMimojiStatusManager.getMode();
        if (mode == MimojiStatusManager.MIMOJI_PREVIEW || mode == MimojiStatusManager.MIMOJI_NONE) {
            this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
            MimojiInfo mimojiInfo = this.mMimojiStatusManager.getmCurrentMimojiInfo();
            if (mimojiInfo != null) {
                this.mShowAvatar = true;
                if (!this.mAvatarTemplatePath.equals(mimojiInfo.mAvatarTemplatePath)) {
                    this.mAvatar.setTemplatePath(mimojiInfo.mAvatarTemplatePath);
                    this.mAvatarTemplatePath = mimojiInfo.mAvatarTemplatePath;
                }
                String str = mimojiInfo.mConfigPath;
                if (!AvatarEngineManager.isPrefabModel(str)) {
                    this.mAvatar.loadConfig(str);
                }
            }
        } else if (mode == MimojiStatusManager.MIMOJI_EDIT_MID || mode == MimojiStatusManager.MIMOJI_EIDT) {
            this.mAvatar.setTemplatePath(AvatarEngineManager.PersonTemplatePath);
            this.mAvatarTemplatePath = AvatarEngineManager.PersonTemplatePath;
            MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
            if (mimojiEditor != null) {
                mimojiEditor.resetConfig();
            }
        }
    }

    private void updateBeauty() {
        BaseModule baseModule = (BaseModule) this.mActivityBase.getCurrentModule();
        if (baseModule instanceof LiveModule) {
            ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
            if (componentRunningShine.supportBeautyLevel()) {
                CameraSettings.setFaceBeautyLevel(3);
            } else if (componentRunningShine.supportSmoothLevel()) {
                CameraSettings.setFaceBeautySmoothLevel(40);
            }
            baseModule.updatePreferenceInWorkThread(13);
        }
    }

    private void updateVideoOrientation(int i) {
        if ((i > 315 && i <= 360) || (i >= 0 && i <= 45)) {
            this.mCurrentScreenOrientation = 0;
        } else if (i > 45 && i <= 135) {
            this.mCurrentScreenOrientation = 90;
        } else if (i > 135 && i <= 225) {
            this.mCurrentScreenOrientation = 180;
        } else if (i > 225 && i <= 315) {
            this.mCurrentScreenOrientation = 270;
        }
    }

    public void backToPreview(boolean z, boolean z2) {
        if ((this.mMimojiStatusManager.IsInMimojiEdit() || this.mMimojiStatusManager.IsInMimojiEditMid()) && !z && this.mMimojiStatusManager.getmCurrentMimojiInfo() != null) {
            MimojiInfo mimojiInfo = this.mMimojiStatusManager.getmCurrentMimojiInfo();
            if (mimojiInfo != null) {
                if (AvatarEngineManager.isPrefabModel(mimojiInfo.mConfigPath)) {
                    this.mAvatar.setTemplatePath(mimojiInfo.mAvatarTemplatePath);
                } else {
                    this.mAvatar.loadConfig(mimojiInfo.mConfigPath);
                }
            }
        }
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
        if (this.mMimojiStatusManager.getmCurrentMimojiInfo() != null || z) {
            this.mShowAvatar = true;
        }
        this.mIsStopRender = false;
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        bottomPopupTips.reInitTipImage();
        if (z2 && !DataRepository.dataItemLive().getMimojiStatusManager().getMimojiPannelState()) {
            bottomPopupTips.showMimoji();
        }
        topAlert.alertMimojiFaceDetect(false, -1);
        topAlert.enableMenuItem(true, 197, 193);
        if (this.mAvatar != null) {
            this.mAvatar.setRenderScene(true, 1.0f);
        }
        setDisableSingleTapUp(false);
    }

    /* access modifiers changed from: protected */
    public int getOperatingMode() {
        return CameraCapabilities.SESSION_OPERATION_MODE_MIMOJI;
    }

    public void initAvatarEngine(int i, int i2, int i3, int i4, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("initAvatarEngine with parameters : displayOrientation = ");
        sb.append(i);
        sb.append(", width = ");
        sb.append(i3);
        sb.append(", height = ");
        sb.append(i4);
        sb.append(", isFrontCamera = ");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mPreviewWidth = i3;
        this.mPreviewHeight = i4;
        this.mIsFrontCamera = z;
        this.mOrientation = i2;
        initMimojiResource(this.mContext);
        if (this.mActivityBase.startFromKeyguard()) {
            this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_PREVIEW);
            this.mMimojiStatusManager.reset();
        }
        final int hashCode = hashCode();
        Handler handler = this.mLoadHandler;
        final int i5 = i;
        final int i6 = i3;
        final int i7 = i4;
        final boolean z2 = z;
        AnonymousClass1 r0 = new Runnable() {
            public void run() {
                synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                    String access$100 = MimojiAvatarEngineImpl.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("avatar start init | ");
                    sb.append(hashCode);
                    Log.d(access$100, sb.toString());
                    if (!MimojiAvatarEngineImpl.this.mIsAvatarInited) {
                        Log.d(MimojiAvatarEngineImpl.TAG, "avatar need really init");
                        MimojiAvatarEngineImpl.this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
                        MimojiAvatarEngineImpl.this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL);
                        MimojiAvatarEngineImpl.this.mAvatar.setRenderScene(true, 1.0f);
                        MimojiAvatarEngineImpl.this.mAvatar.createOutlineEngine(AvatarEngineManager.TRACK_DATA);
                        MimojiAvatarEngineImpl.this.mIsAvatarInited = true;
                        MimojiAvatarEngineImpl.this.reloadConfig();
                    }
                    if (MimojiAvatarEngineImpl.this.mRecordModule == null) {
                        MimojiAvatarEngineImpl.this.mRecordModule = new RecordModule(MimojiAvatarEngineImpl.this.mContext, MimojiAvatarEngineImpl.this.mCaptureCallback);
                        MimojiAvatarEngineImpl.this.mRecordModule.init(i5, i6, i7, MimojiAvatarEngineImpl.this.mAvatar, z2);
                    } else {
                        MimojiAvatarEngineImpl.this.mRecordModule.setmImageOrientation(i5);
                        MimojiAvatarEngineImpl.this.mRecordModule.setMirror(z2);
                        MimojiAvatarEngineImpl.this.mRecordModule.setPreviewSize(i6, i7);
                    }
                    Rect previewRect = Util.getPreviewRect(MimojiAvatarEngineImpl.this.mContext);
                    MimojiAvatarEngineImpl.this.mRecordModule.setDrawScope(0, Util.sWindowHeight - previewRect.bottom, previewRect.right, previewRect.bottom - previewRect.top);
                    MimojiAvatarEngineImpl.this.mDrawSize = new Size(previewRect.right, previewRect.bottom - previewRect.top);
                    MimojiAvatarEngineImpl.this.mIsStopRender = false;
                }
            }
        };
        handler.post(r0);
    }

    public boolean isOnCreateMimoji() {
        return this.mMimojiStatusManager.IsInMimojiCreate();
    }

    public boolean isProcessorReady() {
        return this.mIsAvatarInited;
    }

    public boolean isRecordStopping() {
        return this.mIsRecordStopping;
    }

    public boolean isRecording() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Recording = ");
        sb.append(this.mIsRecording);
        Log.d(str, sb.toString());
        return this.mIsRecording;
    }

    public void onCaptureImage() {
        if (this.mRecordModule != null) {
            this.mNeedCapture = true;
            CameraStatUtil.trackMimojiCaptureOrRecord(getMimojiPara(), CameraSettings.getFlashMode(this.mActivityBase.getCurrentModuleIndex()), true, this.mIsFrontCamera);
        }
    }

    public boolean onCreateCapture() {
        Log.d(TAG, "onCreateCapture");
        if (this.mFaceDectectResult != 0 || !this.mIsFaceDetectSuccess) {
            return false;
        }
        Module currentModule = this.mActivityBase.getCurrentModule();
        if (currentModule instanceof LiveModule) {
            LiveModule liveModule = (LiveModule) currentModule;
            CameraSettings.setFaceBeautyLevel(0);
            liveModule.updatePreferenceInWorkThread(13);
        }
        ((ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162)).showOrHideMimojiProgress(true);
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.showTips(19, R.string.mimoji_start_create, 2);
        }
        this.mIsShutterButtonClick = true;
        animateCapture();
        return true;
    }

    public void onDeviceRotationChange(int i) {
        this.mDeviceRotation = i;
        updateVideoOrientation(i);
        if (this.mMimojiEditor != null) {
            this.mMimojiEditor.onDeviceRotationChange(i);
        }
    }

    public void onDrawFrame(Rect rect, int i, int i2, boolean z) {
        Rect rect2 = rect;
        if (this.mRecordModule == null || rect2 == null || this.mIsStopRender) {
            GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
            GLES20.glClear(16384);
            return;
        }
        if (z) {
            GLES20.glViewport(0, 0, i, i2);
        } else {
            GLES20.glViewport(0, Util.sWindowHeight - rect2.bottom, rect2.right, rect2.bottom - rect2.top);
            if (this.mNeedCapture) {
                Log.d(TAG, "onCapture start");
                this.mRecordModule.capture();
                ((LiveModule) this.mActivityBase.getCurrentModule()).setCameraStatePublic(3);
                this.mNeedCapture = false;
            }
        }
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
        GLES20.glClear(16384);
        this.mRecordModule.startRender(90, this.mIsFrontCamera, this.mDeviceRotation, 0, false, this.mTextureId, null, this.mShowAvatar);
    }

    public void onMimojiCreate() {
        Log.d(TAG, "start create mimoji");
        this.mShowAvatar = false;
        this.mMimojiStatusManager.setMode(MimojiStatusManager.MIMOJI_CREATE);
        this.mMainProtocol.mimojiStart();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).prepareCreateMimoji();
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.showTips(19, R.string.mimoji_create_tips, 2);
        }
    }

    public void onMimojiDeleted() {
        this.mShowAvatar = false;
        this.mMimojiStatusManager.setmCurrentMimojiInfo(null);
    }

    public void onMimojiSelect(final MimojiInfo mimojiInfo) {
        this.mLoadHandler.post(new Runnable() {
            public void run() {
                if (mimojiInfo == null || MimojiAvatarEngineImpl.this.mAvatar == null) {
                    MimojiAvatarEngineImpl.this.mShowAvatar = false;
                    MimojiAvatarEngineImpl.this.mMimojiStatusManager.setmCurrentMimojiInfo(null);
                    return;
                }
                MimojiAvatarEngineImpl.this.mShowAvatar = true;
                MimojiAvatarEngineImpl.this.mMimojiStatusManager.setmCurrentMimojiInfo(mimojiInfo);
                String str = mimojiInfo.mAvatarTemplatePath;
                String str2 = mimojiInfo.mConfigPath;
                String access$100 = MimojiAvatarEngineImpl.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("change mimoji with path = ");
                sb.append(str);
                sb.append(", and config = ");
                sb.append(str2);
                Log.d(access$100, sb.toString());
                synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                    boolean equals = MimojiAvatarEngineImpl.this.mAvatarTemplatePath.equals(str);
                    MimojiAvatarEngineImpl.this.mAvatarTemplatePath = str;
                    if (str2.isEmpty() || AvatarEngineManager.isPrefabModel(str2)) {
                        if (!equals) {
                            MimojiAvatarEngineImpl.this.mAvatar.setTemplatePath(str);
                        }
                    } else if (!equals) {
                        MimojiAvatarEngineImpl.this.mRecordModule.changeHumanTemplate(str, str2);
                    } else {
                        MimojiAvatarEngineImpl.this.mAvatar.loadConfig(str2);
                    }
                }
            }
        });
    }

    public void onPreviewFrame(Image image, Camera2Proxy camera2Proxy, int i) {
        boolean startProcess;
        if (!this.mIsAvatarInited) {
            Log.d(TAG, "onPreviewFrame mIsAvatarInited false  ,need init");
        } else if (this.mAvatar == null) {
            this.mLoadHandler.post(new Runnable() {
                public void run() {
                    Log.d(MimojiAvatarEngineImpl.TAG, "onPreviewFrame mIsAvatarInited START");
                    MimojiAvatarEngineImpl.this.mIsAvatarInited = false;
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        if (!MimojiAvatarEngineImpl.this.mIsAvatarInited) {
                            Log.d(MimojiAvatarEngineImpl.TAG, "onPreviewFrame avatar need really init");
                            MimojiAvatarEngineImpl.this.mAvatar = AvatarEngineManager.getInstance().queryAvatar();
                            MimojiAvatarEngineImpl.this.mAvatar.init(AvatarEngineManager.TRACK_DATA, AvatarEngineManager.FACE_MODEL);
                            MimojiAvatarEngineImpl.this.mAvatar.setRenderScene(true, 1.0f);
                            MimojiAvatarEngineImpl.this.mAvatar.createOutlineEngine(AvatarEngineManager.TRACK_DATA);
                            MimojiAvatarEngineImpl.this.mIsAvatarInited = true;
                            MimojiAvatarEngineImpl.this.reloadConfig();
                        }
                        if (MimojiAvatarEngineImpl.this.mRecordModule == null) {
                            MimojiAvatarEngineImpl.this.mRecordModule = new RecordModule(MimojiAvatarEngineImpl.this.mContext, MimojiAvatarEngineImpl.this.mCaptureCallback);
                            MimojiAvatarEngineImpl.this.mRecordModule.init(MimojiAvatarEngineImpl.this.mOrientation, MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight, MimojiAvatarEngineImpl.this.mAvatar, MimojiAvatarEngineImpl.this.mIsFrontCamera);
                        } else {
                            MimojiAvatarEngineImpl.this.mRecordModule.setmImageOrientation(MimojiAvatarEngineImpl.this.mOrientation);
                            MimojiAvatarEngineImpl.this.mRecordModule.setMirror(MimojiAvatarEngineImpl.this.mIsFrontCamera);
                            MimojiAvatarEngineImpl.this.mRecordModule.setPreviewSize(MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight);
                        }
                        Rect previewRect = Util.getPreviewRect(MimojiAvatarEngineImpl.this.mContext);
                        MimojiAvatarEngineImpl.this.mRecordModule.setDrawScope(0, Util.sWindowHeight - previewRect.bottom, previewRect.right, previewRect.bottom - previewRect.top);
                        MimojiAvatarEngineImpl.this.mDrawSize = new Size(previewRect.right, previewRect.bottom - previewRect.top);
                        MimojiAvatarEngineImpl.this.mIsStopRender = false;
                    }
                }
            });
        } else {
            ASVLOFFSCREEN buildNV21SingleBuffer = AsvloffscreenUtil.buildNV21SingleBuffer(image);
            if (this.mRecordModule != null) {
                if (this.mMimojiStatusManager.IsInMimojiEditMid() || this.mMimojiStatusManager.IsInMimojiEdit()) {
                    if (this.mMimojiEditor == null) {
                        this.mMimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
                    }
                    if (this.mMimojiEditor != null) {
                        ASAvatarProcessInfo aSAvatarProcessInfo = new ASAvatarProcessInfo();
                        synchronized (this.mAvatarLock) {
                            this.mAvatar.avatarProcessWithInfoEx(buildNV21SingleBuffer, 90, this.mIsFrontCamera, this.mOrientation, aSAvatarProcessInfo, true);
                        }
                        this.mMimojiEditor.requestRender();
                    }
                } else {
                    synchronized (this.mAvatarLock) {
                        startProcess = this.mRecordModule.startProcess(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera), this.mShowAvatar);
                    }
                    boolean z = this.mNeedShowNoFaceTips;
                    boolean z2 = true;
                    this.mNeedShowNoFaceTips = startProcess && this.mShowAvatar;
                    if (z == this.mNeedShowNoFaceTips) {
                        z2 = false;
                    }
                    if (z2 && !this.mMimojiStatusManager.IsInMimojiCreate()) {
                        this.mUiHandler.post(new Runnable() {
                            public void run() {
                                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                                if (topAlert != null) {
                                    topAlert.alertMimojiFaceDetect(MimojiAvatarEngineImpl.this.mNeedShowNoFaceTips, R.string.mimoji_check_no_face);
                                }
                            }
                        });
                    }
                    if (this.mLastNeedBeauty != startProcess) {
                        this.mLastNeedBeauty = startProcess;
                        updateBeauty();
                    }
                    this.mCameraView.requestRender();
                }
            }
            if (this.mMimojiStatusManager.IsInMimojiCreate()) {
                this.mShowAvatar = false;
                synchronized (this.mAvatarLock) {
                    this.mFaceDectectResult = this.mAvatar.outlineProcessEx(buildNV21SingleBuffer, MimojiHelper.getOutlineOrientation(this.mOrientation, this.mDeviceRotation, this.mIsFrontCamera));
                }
                if (this.mMainProtocol != null) {
                    this.mMainProtocol.mimojiFaceDetect(this.mFaceDectectResult);
                }
            }
            if (this.mIsShutterButtonClick) {
                this.mIsShutterButtonClick = false;
                Bitmap rotateBitmap = BitmapUtils.rotateBitmap(BitmapUtils.rawByteArray2RGBABitmap(buildNV21SingleBuffer.getYData(), image.getWidth(), image.getHeight(), image.getPlanes()[0].getRowStride()), this.mIsFrontCamera ? -90 : 90);
                int width = rotateBitmap.getWidth();
                int height = rotateBitmap.getHeight();
                ByteBuffer order = ByteBuffer.allocate(rotateBitmap.getRowBytes() * rotateBitmap.getHeight()).order(ByteOrder.nativeOrder());
                rotateBitmap.copyPixelsToBuffer(order);
                createAvatar(order.array(), width, height);
            }
        }
    }

    public void onRecordStart(ContentValues contentValues) {
        Log.d(TAG, "start record...");
        if (!this.mIsRecording) {
            CameraStatUtil.trackMimojiCaptureOrRecord(getMimojiPara(), CameraSettings.getFlashMode(this.mActivityBase.getCurrentModuleIndex()), false, this.mIsFrontCamera);
            this.mIsRecording = true;
            this.mIsRecordStopping = false;
            this.mContentValues = contentValues;
            this.mSaveVideoPath = contentValues.getAsString("_data");
            try {
                this.mVideoFileDescriptor = FileCompat.getParcelFileDescriptor(this.mSaveVideoPath, true);
            } catch (IOException e) {
                Log.e(TAG, e.getMessage());
            }
            this.mCameraView.queueEvent(new Runnable() {
                public void run() {
                    if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                        MimojiAvatarEngineImpl.this.mRecordModule.startRecording(MimojiAvatarEngineImpl.this.mVideoFileDescriptor.getFileDescriptor(), MimojiAvatarEngineImpl.this.mRecordingListener, MimojiAvatarEngineImpl.this.mCurrentScreenOrientation, MimojiAvatarEngineImpl.this.mPreviewWidth, MimojiAvatarEngineImpl.this.mPreviewHeight, 10000000, CameraSettings.getVideoEncoder() == 5 ? "video/hevc" : "video/avc");
                    }
                }
            });
            updateRecordingTime();
        }
    }

    public void onRecordStop(boolean z) {
        Log.d(TAG, "stop record...");
        this.mIsRecordStopping = true;
        if (z) {
            this.mGetThumCountDownLatch = new CountDownLatch(1);
        }
        if (this.mCountDownTimer != null) {
            this.mCountDownTimer.cancel();
        }
        this.mCameraView.queueEvent(new Runnable() {
            public void run() {
                if (MimojiAvatarEngineImpl.this.mRecordModule != null) {
                    new Thread(new Runnable() {
                        public void run() {
                            MimojiAvatarEngineImpl.this.mRecordModule.stopRecording();
                        }
                    }).start();
                }
            }
        });
    }

    public void onResume() {
        Log.d(TAG, "reset");
        if (this.mRecordModule != null) {
            this.mRecordModule.reset();
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(217, this);
    }

    public void releaseRender() {
        final int hashCode = hashCode();
        this.mIsStopRender = true;
        if (this.mMimojiStatusManager.IsInPreviewSurface()) {
            this.mLoadHandler.post(new Runnable() {
                public void run() {
                    synchronized (MimojiAvatarEngineImpl.this.mAvatarLock) {
                        if (MimojiAvatarEngineImpl.this.mAvatar != null) {
                            String access$100 = MimojiAvatarEngineImpl.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("releaseRender | ");
                            sb.append(hashCode);
                            Log.d(access$100, sb.toString());
                            MimojiAvatarEngineImpl.this.mAvatar.releaseRender();
                        }
                    }
                }
            });
            return;
        }
        MimojiEditor mimojiEditor = (MimojiEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(224);
        if (mimojiEditor != null) {
            mimojiEditor.releaseRender();
        }
    }

    public void setDetectSuccess(boolean z) {
        this.mIsFaceDetectSuccess = z;
    }

    public void setDisableSingleTapUp(boolean z) {
        ((LiveModule) this.mActivityBase.getCurrentModule()).setDisableSingleTapUp(z);
    }

    public void unRegisterProtocol() {
        ModeCoordinatorImpl.getInstance().detachProtocol(217, this);
        release();
        releaseRender();
        quit();
    }

    /* access modifiers changed from: protected */
    public void updateRecordingTime() {
        if (this.mCountDownTimer != null) {
            this.mCountDownTimer.cancel();
        }
        AnonymousClass7 r1 = new CountDownTimer(START_OFFSET_MS + ((long) this.mMaxVideoDurationInMs), 1000) {
            public void onFinish() {
                ((LiveModule) MimojiAvatarEngineImpl.this.mActivityBase.getCurrentModule()).stopVideoRecording(true, false);
            }

            public void onTick(long j) {
                String millisecondToTimeString = Util.millisecondToTimeString((j + 950) - MimojiAvatarEngineImpl.START_OFFSET_MS, false);
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null) {
                    topAlert.updateRecordingTime(millisecondToTimeString);
                }
            }
        };
        this.mCountDownTimer = r1;
        this.mCountDownTimer.start();
    }
}
