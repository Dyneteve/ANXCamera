package com.xiaomi.camera.core;

import android.content.Context;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Handler;
import android.os.HandlerThread;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.storage.ImageSaver;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.ImageUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.camera.core.ParallelDataZipper.DataListener;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.camera.imagecodec.ImagePool.ImageFormat;
import com.xiaomi.camera.imagecodec.JpegEncoder;
import com.xiaomi.camera.imagecodec.ReprocessData;
import com.xiaomi.camera.imagecodec.ReprocessData.OnDataAvailableListener;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.MiCameraAlgo;
import com.xiaomi.engine.TaskSession;
import com.xiaomi.engine.TaskSession.SessionStatusCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ConcurrentHashMap;
import miui.os.Build;

public class PostProcessor {
    /* access modifiers changed from: private */
    public static final String TAG = PostProcessor.class.getSimpleName();
    /* access modifiers changed from: private */
    public CaptureDataListener mCaptureDataListener = new CaptureDataListener() {
        public void onCaptureDataAvailable(@NonNull CaptureData captureData) {
            long captureTimestamp = captureData.getCaptureTimestamp();
            int algoType = captureData.getAlgoType();
            if (algoType == 2 || algoType == 5) {
                CaptureDataBean multiFrameProcessResult = captureData.getMultiFrameProcessResult();
                if (multiFrameProcessResult != null) {
                    ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureTimestamp));
                    long timeStamp = multiFrameProcessResult.getResult().getTimeStamp();
                    String access$000 = PostProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("[1] onCaptureDataAvailable: timestamp: ");
                    sb.append(captureTimestamp);
                    sb.append(" | ");
                    sb.append(timeStamp);
                    Log.d(access$000, sb.toString());
                    if (timeStamp != captureTimestamp) {
                        parallelTaskData.setTimestamp(timeStamp);
                        PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(captureTimestamp));
                        PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timeStamp), parallelTaskData);
                    }
                    if (algoType == 5 && parallelTaskData.getDataParameter().isSaveGroupshotPrimitive()) {
                        for (int i = 0; i < captureData.getCaptureDataBeanList().size(); i++) {
                            ParallelTaskData cloneTaskData = parallelTaskData.cloneTaskData(i);
                            long timeStamp2 = ((CaptureDataBean) captureData.getCaptureDataBeanList().get(i)).getResult().getTimeStamp();
                            if (timeStamp2 == timeStamp) {
                                timeStamp2++;
                            }
                            cloneTaskData.setTimestamp(timeStamp2);
                            PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timeStamp2), cloneTaskData);
                            String access$0002 = PostProcessor.TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("[1] onCaptureDataAvailable: add ");
                            sb2.append(timeStamp2);
                            Log.d(access$0002, sb2.toString());
                        }
                    }
                    captureData.getCaptureDataBeanList().add(multiFrameProcessResult);
                } else {
                    throw new RuntimeException("No multi-frame process result!");
                }
            }
            if (algoType == 4) {
                if (Build.IS_DEBUGGABLE) {
                    Log.d(PostProcessor.TAG, "onCaptureDataAvailable: start process multi-shot image...");
                }
                CaptureDataBean captureDataBean = (CaptureDataBean) captureData.getCaptureDataBeanList().get(0);
                ICustomCaptureResult result = captureDataBean.getResult();
                Image mainImage = captureDataBean.getMainImage();
                ParallelTaskData parallelTaskData2 = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureTimestamp));
                if (parallelTaskData2 != null) {
                    parallelTaskData2.setCaptureResult(result);
                    PostProcessor.this.mImageProcessorStatusCb.onImageProcessStart(mainImage.getTimestamp());
                    PostProcessor.this.mImageProcessorStatusCb.onImageProcessed(mainImage, 0);
                } else {
                    String access$0003 = PostProcessor.TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("[1] onCaptureDataAvailable: no captureResult ");
                    sb3.append(captureTimestamp);
                    Log.e(access$0003, sb3.toString());
                }
                mainImage.close();
                onOriginalImageClosed(mainImage);
            } else {
                List<CaptureDataBean> captureDataBeanList = captureData.getCaptureDataBeanList();
                if (captureDataBeanList != null && !captureDataBeanList.isEmpty()) {
                    for (CaptureDataBean captureDataBean2 : captureDataBeanList) {
                        if (captureDataBean2.isFirstResult()) {
                            long timeStamp3 = captureDataBean2.getResult().getTimeStamp();
                            ParallelTaskData parallelTaskData3 = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(timeStamp3));
                            if (parallelTaskData3 != null) {
                                parallelTaskData3.setCaptureResult(captureDataBean2.getResult());
                            } else {
                                String access$0004 = PostProcessor.TAG;
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("[1] onCaptureDataAvailable: no task data with timestamp ");
                                sb4.append(timeStamp3);
                                Log.e(access$0004, sb4.toString(), new RuntimeException());
                                Image mainImage2 = captureDataBean2.getMainImage();
                                mainImage2.close();
                                onOriginalImageClosed(mainImage2);
                                ImagePool.getInstance().releaseImage(mainImage2);
                                Image subImage = captureDataBean2.getSubImage();
                                if (subImage != null) {
                                    subImage.close();
                                    onOriginalImageClosed(subImage);
                                    ImagePool.getInstance().releaseImage(subImage);
                                }
                            }
                        }
                        if (PostProcessor.this.mImageProcessor != null) {
                            PostProcessor.this.mImageProcessor.dispatchTask(captureDataBean2);
                        } else {
                            throw new RuntimeException("ImageProcessor is not allowed to be null");
                        }
                    }
                } else if (!Build.IS_DEBUGGABLE) {
                    Log.e(PostProcessor.TAG, "[1] onCaptureDataAvailable: There are no result to process!");
                } else {
                    throw new RuntimeException("There are no result to process!");
                }
            }
        }

        public void onOriginalImageClosed(Image image) {
            PostProcessor.this.releaseImage(image);
        }
    };
    private CaptureStatusListener mCaptureStatusListener = new CaptureStatusListener();
    /* access modifiers changed from: private */
    public int mCurrentAlgoType = 0;
    private DataListener mDataListener = new DataListener() {
        public void onParallelDataAvailable(@NonNull CaptureData captureData) {
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[z] onParallelDataAvailable: ");
            sb.append(captureData.getCaptureTimestamp());
            Log.d(access$000, sb.toString());
            if (Build.IS_DEBUGGABLE) {
                for (CaptureDataBean captureDataBean : captureData.getCaptureDataBeanList()) {
                    Log.d(PostProcessor.TAG, "[z] onParallelDataAvailable: ------------------------");
                    String access$0002 = PostProcessor.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("[z] Result timestamp: ");
                    sb2.append(captureDataBean.getResult().getTimeStamp());
                    Log.d(access$0002, sb2.toString());
                }
            }
            int algoType = captureData.getAlgoType();
            String access$0003 = PostProcessor.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("onParallelDataAvailable: algoType is ");
            sb3.append(algoType);
            Log.d(access$0003, sb3.toString());
            if (algoType != 4) {
                ImageFormat imageQueueKey = ImagePool.getInstance().toImageQueueKey(((CaptureDataBean) captureData.getCaptureDataBeanList().get(0)).getMainImage());
                if (ImagePool.getInstance().isImageQueueFull(imageQueueKey, 4)) {
                    Log.w(PostProcessor.TAG, "[z] wait image pool>>");
                    ImagePool.getInstance().waitIfImageQueueFull(imageQueueKey, 4, 0);
                    Log.w(PostProcessor.TAG, "[z] wait image pool<<");
                }
                PostProcessor.this.mImageProcessorStatusCb.onImageProcessStart(captureData.getCaptureTimestamp());
            }
            if (algoType == 2) {
                captureData.setMultiFrameProcessListener(PostProcessor.this.mCaptureDataListener);
                ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureData.getCaptureTimestamp()));
                if (parallelTaskData != null) {
                    captureData.setCapturedByFrontCamera(parallelTaskData.getDataParameter().isFrontCamera());
                }
                MultiFrameProcessor.getInstance().processData(captureData);
            } else if (algoType == 5) {
                captureData.setMultiFrameProcessListener(PostProcessor.this.mCaptureDataListener);
                ParallelTaskData parallelTaskData2 = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(captureData.getCaptureTimestamp()));
                if (parallelTaskData2 != null && parallelTaskData2.getDataParameter().isSaveGroupshotPrimitive()) {
                    captureData.setSaveInputImage(true);
                }
                MultiFrameProcessor.getInstance().processData(captureData);
            } else {
                PostProcessor.this.mCaptureDataListener.onCaptureDataAvailable(captureData);
            }
        }

        public void onParallelDataUnmatched(CaptureDataBean captureDataBean) {
            if (captureDataBean != null) {
                Image mainImage = captureDataBean.getMainImage();
                if (mainImage != null) {
                    mainImage.close();
                    PostProcessor.this.releaseImage(mainImage);
                }
                Image subImage = captureDataBean.getSubImage();
                if (subImage != null) {
                    subImage.close();
                    PostProcessor.this.releaseImage(subImage);
                }
            }
        }
    };
    /* access modifiers changed from: private */
    public FilterProcessor mFilterProcessor;
    /* access modifiers changed from: private */
    public ImageMemoryManager mImageMemoryManager;
    /* access modifiers changed from: private */
    public ImageProcessor mImageProcessor;
    /* access modifiers changed from: private */
    public ImageProcessorStatusCallback mImageProcessorStatusCb = new ImageProcessorStatusCallback() {
        /* JADX WARNING: Incorrect type for immutable var: ssa=android.media.Image, code=java.lang.Object, for r4v0, types: [android.media.Image, java.lang.Object] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void onImageProcessFailed(Object obj, String str) {
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onImageProcessFailed: image=");
            if (obj == null) {
                obj = TEDefine.FACE_BEAUTY_NULL;
            }
            sb.append(obj);
            sb.append(" reason=");
            sb.append(str);
            Log.d(access$000, sb.toString());
        }

        public void onImageProcessStart(long j) {
            if (PostProcessor.this.mPostProcessStatusCallback != null) {
                String access$000 = PostProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageProcessStart: get parallelTaskData: ");
                sb.append(j);
                Log.d(access$000, sb.toString());
                PostProcessor.this.mPostProcessStatusCallback.onImagePostProcessStart((ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(j)));
            }
        }

        public void onImageProcessed(Image image, int i) {
            long timestamp = image.getTimestamp();
            StringBuilder sb = new StringBuilder();
            sb.append(timestamp);
            sb.append(File.separator);
            sb.append(i);
            String sb2 = sb.toString();
            String access$000 = PostProcessor.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("[2] onImageProcessed: ");
            sb3.append(image);
            sb3.append(" | ");
            sb3.append(sb2);
            Log.d(access$000, sb3.toString());
            if (i == 2) {
                PerformanceTracker.trackJpegReprocess(i, 0);
                PostProcessor.this.mJpegEncoderListener.onJpegAvailable(ImageUtil.getFirstPlane(image), sb2);
                return;
            }
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(timestamp));
            if (parallelTaskData != null) {
                if (PostProcessor.this.mCurrentAlgoType != 4) {
                    Size pictureSize = parallelTaskData.getDataParameter().getPictureSize();
                    String access$0002 = PostProcessor.TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append(image.getWidth());
                    sb4.append("x");
                    sb4.append(image.getHeight());
                    Log.d(access$0002, String.format(Locale.ENGLISH, "[2] onImageProcessed: pictureSize: %s, imageSize: %s", new Object[]{pictureSize, sb4.toString()}));
                    PostProcessor.this.mFilterProcessor.doFilterSync(parallelTaskData, image, i);
                }
                ICustomCaptureResult captureResult = parallelTaskData.getCaptureResult();
                String access$0003 = PostProcessor.TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("[2] onImageProcessed: captureResult = ");
                sb5.append(captureResult.getResults());
                Log.d(access$0003, sb5.toString());
                String access$0004 = PostProcessor.TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("[2] onImageProcessed: send jpeg Encoder image target is: ");
                sb6.append(sb2);
                Log.d(access$0004, sb6.toString());
                ParallelTaskDataParameter dataParameter = parallelTaskData.getDataParameter();
                ReprocessData reprocessData = new ReprocessData(image, sb2, captureResult, dataParameter.isFrontCamera(), dataParameter.getOutputSize().getWidth(), dataParameter.getOutputSize().getHeight(), PostProcessor.this.mJpegEncoderListener);
                reprocessData.setJpegQuality(dataParameter.getJpegQuality());
                PerformanceTracker.trackJpegReprocess(i, 0);
                try {
                    JpegEncoder.instance().doReprocess(reprocessData);
                } catch (Exception e) {
                    PostProcessor.this.mJpegEncoderListener.onError("nativeDetachImage failed for image!!!", sb2);
                }
            } else {
                StringBuilder sb7 = new StringBuilder();
                sb7.append("no parallelTaskData with timestamp ");
                sb7.append(timestamp);
                throw new RuntimeException(sb7.toString());
            }
        }

        public void onOriginalImageClosed(Image image) {
            PostProcessor.this.mCaptureDataListener.onOriginalImageClosed(image);
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onOriginalImageClosed: ");
            sb.append(image);
            Log.d(access$000, sb.toString());
        }
    };
    private List<ImageReader> mImageReaderList = new ArrayList();
    /* access modifiers changed from: private */
    public ImageSaver mImageSaver;
    /* access modifiers changed from: private */
    public OnDataAvailableListener mJpegEncoderListener = new OnDataAvailableListener() {
        public void onError(String str, String str2) {
            String[] split = str2.split(File.separator);
            long parseLong = Long.parseLong(split[0]);
            int parseInt = Integer.parseInt(split[1]);
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[3] onError: ");
            sb.append(parseLong);
            sb.append(" | ");
            sb.append(parseInt);
            sb.append(" | ");
            sb.append(str);
            Log.e(access$000, sb.toString());
            PerformanceTracker.trackJpegReprocess(parseInt, 1);
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(parseLong));
            if (parallelTaskData != null) {
                parallelTaskData.releaseImageData();
                PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(parseLong));
                String access$0002 = PostProcessor.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("[3] onError: remove task ");
                sb2.append(parseLong);
                sb2.append(" | ");
                sb2.append(parseInt);
                Log.e(access$0002, sb2.toString());
            }
            PostProcessor.this.tryToCloseSession();
        }

        public void onJpegAvailable(byte[] bArr, String str) {
            String[] split = str.split(File.separator);
            long parseLong = Long.parseLong(split[0]);
            int parseInt = Integer.parseInt(split[1]);
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[3] onJpegAvailable: ");
            sb.append(parseLong);
            sb.append(" | ");
            sb.append(parseInt);
            Log.d(access$000, sb.toString());
            PerformanceTracker.trackJpegReprocess(parseInt, 1);
            ParallelTaskData parallelTaskData = (ParallelTaskData) PostProcessor.this.mParallelTaskHashMap.get(Long.valueOf(parseLong));
            if (parallelTaskData != null) {
                parallelTaskData.fillJpegData(bArr, parseInt);
                if (parallelTaskData.isJpegDataReady()) {
                    String access$0002 = PostProcessor.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("[3] onJpegAvailable: save image start. dataLen=");
                    sb2.append(bArr.length);
                    Log.d(access$0002, sb2.toString());
                    if (PostProcessor.this.mImageSaver.onParallelProcessFinish(parallelTaskData)) {
                        parallelTaskData.releaseImageData();
                    }
                    PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(parseLong));
                    String access$0003 = PostProcessor.TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("[3] onJpegAvailable: parallelTaskHashMap remove ");
                    sb3.append(parseLong);
                    Log.d(access$0003, sb3.toString());
                } else {
                    Log.d(PostProcessor.TAG, "[3] onJpegAvailable: jpeg data isn't ready, save action has been ignored.");
                }
            } else {
                String access$0004 = PostProcessor.TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("[3] onJpegAvailable: null task data. timestamp=");
                sb4.append(parseLong);
                Log.w(access$0004, sb4.toString());
            }
            PostProcessor.this.tryToCloseSession();
        }

        public void onYuvAvailable(Image image, String str) {
        }
    };
    /* access modifiers changed from: private */
    public ConcurrentHashMap<Long, ParallelTaskData> mParallelTaskHashMap = new ConcurrentHashMap<>();
    /* access modifiers changed from: private */
    public PostProcessStatusCallback mPostProcessStatusCallback;
    private SessionStatusCallback mSessionStatusCb = new SessionStatusCallback() {
        public void onSessionCallback(int i, String str, Object obj) {
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onSessionCallback: [");
            sb.append(i);
            sb.append("]:{");
            sb.append(str);
            sb.append("}");
            Log.d(access$000, sb.toString());
        }
    };
    private boolean mShouldDestroyWhenTasksFinished = false;
    private List<Surface> mSurfaceList = new ArrayList();
    private TaskSession mTaskSession;
    private Handler mWorkerHandler;
    private HandlerThread mWorkerThread = new HandlerThread("CallbackHandleThread");

    public class CaptureStatusListener {
        public CaptureStatusListener() {
        }

        public void onCaptureCompleted(ICustomCaptureResult iCustomCaptureResult, boolean z) {
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[0] onCaptureCompleted: timestamp = ");
            sb.append(iCustomCaptureResult.getTimeStamp());
            Log.d(access$000, sb.toString());
            ParallelDataZipper.getInstance().join(iCustomCaptureResult, z);
        }

        public void onCaptureFailed(long j, int i) {
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[0] onCaptureFailed: reason = ");
            sb.append(i);
            sb.append(" timestamp = ");
            sb.append(j);
            Log.w(access$000, sb.toString());
            PostProcessor.this.mParallelTaskHashMap.remove(Long.valueOf(j));
        }

        public void onCaptureStarted(@NonNull ParallelTaskData parallelTaskData) {
            long timestamp = parallelTaskData.getTimestamp();
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[0] onCaptureStarted: timestamp = ");
            sb.append(timestamp);
            Log.d(access$000, sb.toString());
            PostProcessor.this.mParallelTaskHashMap.put(Long.valueOf(timestamp), parallelTaskData);
            int algoType = parallelTaskData.getAlgoType();
            int i = PostProcessor.this.mImageProcessor instanceof DualCameraProcessor ? 2 : 1;
            int burstNum = parallelTaskData.getBurstNum();
            PostProcessor.this.mCurrentAlgoType = algoType;
            ParallelDataZipper.getInstance().startTask(algoType, i, burstNum, timestamp);
        }
    }

    private class ImageAvailableListener implements OnImageAvailableListener {
        private int mImageFlag;

        ImageAvailableListener(int i) {
            this.mImageFlag = i;
        }

        public void onImageAvailable(ImageReader imageReader) {
            if (imageReader == null) {
                Log.e(PostProcessor.TAG, "[0] onImageAvailable: null imageReader!");
                return;
            }
            PostProcessor.this.mImageMemoryManager.waitImageCloseIfNeeded();
            Image acquireNextImage = imageReader.acquireNextImage();
            String access$000 = PostProcessor.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[0] onImageAvailable: timestamp = ");
            sb.append(acquireNextImage.getTimestamp());
            Log.d(access$000, sb.toString());
            PostProcessor.this.mImageMemoryManager.holdAnImage(acquireNextImage);
            ParallelDataZipper.getInstance().join(acquireNextImage, this.mImageFlag);
        }
    }

    public interface PostProcessStatusCallback {
        void onImagePostProcessStart(ParallelTaskData parallelTaskData);

        void onPostProcessorClosed(PostProcessor postProcessor);
    }

    public PostProcessor(Context context, PostProcessStatusCallback postProcessStatusCallback) {
        this.mWorkerThread.start();
        this.mWorkerHandler = new Handler(this.mWorkerThread.getLooper());
        this.mPostProcessStatusCallback = postProcessStatusCallback;
        init();
    }

    /* access modifiers changed from: private */
    public void releaseImage(Image image) {
        if (this.mImageMemoryManager != null && image != null) {
            this.mImageMemoryManager.releaseAnImage(image);
        }
    }

    /* access modifiers changed from: private */
    public void tryToCloseSession() {
        if (!this.mParallelTaskHashMap.isEmpty() || !this.mShouldDestroyWhenTasksFinished) {
            Log.d(TAG, "tryToCloseSession: ignore");
            return;
        }
        Log.d(TAG, "tryToCloseSession: start");
        finish();
        deInit();
        if (this.mPostProcessStatusCallback != null) {
            this.mPostProcessStatusCallback.onPostProcessorClosed(this);
        }
    }

    public void configCaptureSession(BufferFormat bufferFormat) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configCaptureSession: ");
        sb.append(bufferFormat);
        Log.d(str, sb.toString());
        boolean z = bufferFormat.getGraphDescriptor().getOperationModeID() == 32770;
        if (this.mImageProcessor != null) {
            this.mImageProcessor.stopWorkWhenIdle();
        }
        if (bufferFormat.getGraphDescriptor().getStreamNumber() == 2) {
            this.mImageProcessor = new DualCameraProcessor(this.mImageProcessorStatusCb, z);
        } else {
            this.mImageProcessor = new SingleCameraProcessor(this.mImageProcessorStatusCb, z);
        }
        this.mImageProcessor.startWork();
        this.mTaskSession = MiCameraAlgo.createSessionByOutputConfigurations(bufferFormat, this.mImageProcessor.configOutputConfigurations(bufferFormat), this.mSessionStatusCb);
        this.mImageProcessor.setTaskSession(this.mTaskSession);
        if (this.mFilterProcessor != null) {
            this.mFilterProcessor.deInit();
            this.mFilterProcessor = null;
        }
        this.mFilterProcessor = new FilterProcessor();
        this.mFilterProcessor.init(new Size(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight()));
    }

    public List<Surface> configHALOutputSurface(@NonNull List<IImageReaderParameterSets> list) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("configHALOutputSurface: paramsNum=");
        sb.append(list.size());
        Log.d(str, sb.toString());
        if (!this.mImageReaderList.isEmpty()) {
            this.mImageReaderList.clear();
        }
        if (!this.mSurfaceList.isEmpty()) {
            this.mSurfaceList.clear();
        }
        int i = 0;
        for (IImageReaderParameterSets iImageReaderParameterSets : list) {
            if (iImageReaderParameterSets.isShouldHoldImages()) {
                i += iImageReaderParameterSets.maxImages;
            }
            ImageReader newInstance = ImageReader.newInstance(iImageReaderParameterSets.width, iImageReaderParameterSets.height, iImageReaderParameterSets.format, iImageReaderParameterSets.maxImages);
            newInstance.setOnImageAvailableListener(new ImageAvailableListener(iImageReaderParameterSets.targetCamera), this.mWorkerHandler);
            this.mSurfaceList.add(newInstance.getSurface());
            this.mImageReaderList.add(newInstance);
        }
        this.mImageMemoryManager = new ImageMemoryManager(i);
        return this.mSurfaceList;
    }

    public void deInit() {
        if (this.mFilterProcessor != null) {
            this.mFilterProcessor.deInit();
            this.mFilterProcessor = null;
        }
        if (!this.mImageReaderList.isEmpty()) {
            for (ImageReader close : this.mImageReaderList) {
                close.close();
            }
            this.mImageReaderList.clear();
        }
        if (!this.mSurfaceList.isEmpty()) {
            this.mSurfaceList.clear();
        }
    }

    public void destroyWhenTasksFinished() {
        this.mShouldDestroyWhenTasksFinished = true;
        tryToCloseSession();
    }

    public void finish() {
        if (this.mImageProcessor != null) {
            this.mImageProcessor.stopWork();
        }
        if (this.mWorkerThread != null) {
            this.mWorkerThread.quitSafely();
            try {
                this.mWorkerThread.join();
                this.mWorkerThread = null;
                this.mWorkerHandler = null;
            } catch (InterruptedException e) {
                Log.w(TAG, "finish: failed!", e);
            }
        }
    }

    public CaptureStatusListener getCaptureStatusListener() {
        return this.mCaptureStatusListener;
    }

    public List<Surface> getSurfaceList() {
        return this.mSurfaceList;
    }

    public void init() {
        ParallelDataZipper.getInstance().setDataListener(this.mDataListener);
    }

    public boolean isIdle() {
        return this.mParallelTaskHashMap.isEmpty();
    }

    public boolean needWaitImageClose() {
        boolean z = this.mImageMemoryManager != null && this.mImageMemoryManager.needWaitImageClose();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("needWaitImageClose: return ");
        sb.append(z);
        Log.c(str, sb.toString());
        return z;
    }

    public void setImageSaver(ImageSaver imageSaver) {
        this.mImageSaver = imageSaver;
    }
}
