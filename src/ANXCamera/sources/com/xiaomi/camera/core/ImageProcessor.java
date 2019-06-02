package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.TaskSession;
import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class ImageProcessor {
    private static final int DEFAULT_IMAGE_BUFFER_QUEUE_SIZE = 4;
    private static final int MSG_IMAGE_RECEIVED = 1;
    /* access modifiers changed from: private */
    public static final String TAG = ImageProcessor.class.getSimpleName();
    ImageReader mDepthImageReaderHolder;
    ImageReader mEffectImageReaderHolder;
    private Handler mHandler;
    private int mImageBufferQueueSize = 4;
    ImageProcessorStatusCallback mImageProcessorStatusCallback;
    boolean mIsBokehMode;
    private boolean mIsNeedStopWork;
    AtomicInteger mNeedProcessDepthImageSize = new AtomicInteger(0);
    AtomicInteger mNeedProcessNormalImageSize = new AtomicInteger(0);
    AtomicInteger mNeedProcessRawImageSize = new AtomicInteger(0);
    ImageReader mRawImageReaderHolder;
    TaskSession mTaskSession;
    private HandlerThread mWorkThread = new HandlerThread("ImageProcessor");

    public interface ImageProcessorStatusCallback {
        void onImageProcessFailed(Image image, String str);

        void onImageProcessStart(long j);

        void onImageProcessed(Image image, int i);

        void onOriginalImageClosed(Image image);
    }

    public ImageProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback, boolean z) {
        this.mImageProcessorStatusCallback = imageProcessorStatusCallback;
        this.mIsBokehMode = z;
    }

    private boolean isAlive() {
        return this.mWorkThread != null && this.mWorkThread.isAlive();
    }

    public abstract List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat);

    public abstract List<Surface> configOutputSurfaces(BufferFormat bufferFormat);

    public void dispatchTask(@NonNull List<CaptureDataBean> list) {
        if (isAlive()) {
            Message obtainMessage = this.mHandler.obtainMessage();
            obtainMessage.what = 1;
            obtainMessage.obj = list;
            this.mHandler.sendMessage(obtainMessage);
            return;
        }
        throw new RuntimeException("Thread already die!");
    }

    /* access modifiers changed from: 0000 */
    public Handler getHandler() {
        return this.mHandler;
    }

    /* access modifiers changed from: 0000 */
    public int getImageBufferQueueSize() {
        return this.mImageBufferQueueSize;
    }

    public int getProcessingRequestNumber() {
        return this.mNeedProcessNormalImageSize.get();
    }

    public abstract boolean isIdle();

    public abstract void processImage(List<CaptureDataBean> list);

    public void releaseResource() {
        this.mImageProcessorStatusCallback = null;
        if (this.mEffectImageReaderHolder != null) {
            this.mEffectImageReaderHolder.close();
            this.mEffectImageReaderHolder = null;
        }
        if (this.mRawImageReaderHolder != null) {
            this.mRawImageReaderHolder.close();
            this.mRawImageReaderHolder = null;
        }
        if (this.mDepthImageReaderHolder != null) {
            this.mDepthImageReaderHolder.close();
            this.mDepthImageReaderHolder = null;
        }
    }

    public void setImageBufferQueueSize(int i) {
        this.mImageBufferQueueSize = i;
    }

    public void setTaskSession(@NonNull TaskSession taskSession) {
        this.mTaskSession = taskSession;
    }

    public void startWork() {
        this.mWorkThread.start();
        this.mHandler = new Handler(this.mWorkThread.getLooper()) {
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    String access$000 = ImageProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("handleMessage: unknown message: ");
                    sb.append(message.what);
                    Log.d(access$000, sb.toString());
                    return;
                }
                ImageProcessor.this.processImage((List) message.obj);
            }
        };
    }

    public void stopWork() {
        this.mWorkThread.quitSafely();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("stopWork: ");
        sb.append(this);
        sb.append("'s workThread has been stopped ");
        Log.d(str, sb.toString());
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler = null;
        this.mTaskSession.close();
        releaseResource();
    }

    public void stopWorkWhenIdle() {
        Log.d(TAG, "stopWorkWhenIdle");
        this.mIsNeedStopWork = true;
        tryToStopWork();
    }

    public void tryToStopWork() {
        if (this.mIsNeedStopWork && isIdle()) {
            stopWork();
        }
    }
}
