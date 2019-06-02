package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.view.Surface;
import com.android.camera.log.Log;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.CaptureData.CaptureDataBean;
import com.xiaomi.camera.core.ImageProcessor.ImageProcessorStatusCallback;
import com.xiaomi.camera.imagecodec.ImagePool;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.FrameData;
import com.xiaomi.engine.FrameData.FrameStatusCallback;
import com.xiaomi.engine.TaskSession.FrameCallback;
import com.xiaomi.protocol.ICustomCaptureResult;
import java.util.ArrayList;
import java.util.List;

public class SingleCameraProcessor extends ImageProcessor {
    /* access modifiers changed from: private */
    public static final String TAG = SingleCameraProcessor.class.getSimpleName();

    SingleCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback, boolean z) {
        super(imageProcessorStatusCallback, z);
    }

    private void processCaptureResult(ICustomCaptureResult iCustomCaptureResult, Image image) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("processCaptureResult: processFrame image -- ");
        sb.append(image);
        Log.d(str, sb.toString());
        FrameData frameData = new FrameData(0, iCustomCaptureResult.getSequenceId(), iCustomCaptureResult.getFrameNumber(), iCustomCaptureResult.getResults(), image);
        frameData.setFrameCallback(new FrameStatusCallback() {
            public void onFrameImageClosed(Image image) {
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onFrameImageClosed: ");
                sb.append(image);
                Log.d(access$000, sb.toString());
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
                ImagePool.getInstance().releaseImage(image);
            }
        });
        this.mTaskSession.processFrame(frameData, new FrameCallback() {
            public void onFrameProcessed(int i, String str, Object obj) {
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onFrameProcessed: [");
                sb.append(i);
                sb.append("]:{");
                sb.append(str);
                sb.append("}");
                Log.d(access$000, sb.toString());
            }
        });
    }

    public List<OutputConfiguration> configOutputConfigurations(BufferFormat bufferFormat) {
        ArrayList arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[  EFFECT]", 1);
                String access$000 = SingleCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageAvailable: effectImage received: ");
                sb.append(acquireNextImage);
                Log.d(access$000, sb.toString());
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                String access$0002 = SingleCameraProcessor.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onImageAvailable: effectImage closed: ");
                sb2.append(acquireNextImage);
                Log.d(access$0002, sb2.toString());
                acquireNextImage.close();
                SingleCameraProcessor.this.mNeedProcessNormalImageSize.getAndDecrement();
                SingleCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(0, this.mEffectImageReaderHolder.getSurface()));
        if (this.mIsBokehMode) {
            this.mRawImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
            this.mRawImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    PerformanceTracker.trackAlgorithmProcess("[     RAW]", 1);
                    String access$000 = SingleCameraProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onImageAvailable: rawImage received: ");
                    sb.append(acquireNextImage);
                    Log.d(access$000, sb.toString());
                    if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                        SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 1);
                    }
                    acquireNextImage.close();
                    SingleCameraProcessor.this.mNeedProcessRawImageSize.getAndDecrement();
                    SingleCameraProcessor.this.tryToStopWork();
                }
            }, getHandler());
            arrayList.add(new OutputConfiguration(1, this.mRawImageReaderHolder.getSurface()));
            this.mDepthImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth() / 2, bufferFormat.getBufferHeight() / 2, 540422489, getImageBufferQueueSize());
            this.mDepthImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
                public void onImageAvailable(ImageReader imageReader) {
                    Image acquireNextImage = imageReader.acquireNextImage();
                    PerformanceTracker.trackAlgorithmProcess("[   DEPTH]", 1);
                    String access$000 = SingleCameraProcessor.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onImageAvailable: depthImage received: ");
                    sb.append(acquireNextImage);
                    Log.d(access$000, sb.toString());
                    if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                        SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 2);
                    }
                    acquireNextImage.close();
                    SingleCameraProcessor.this.mNeedProcessDepthImageSize.getAndDecrement();
                    SingleCameraProcessor.this.tryToStopWork();
                }
            }, getHandler());
            arrayList.add(new OutputConfiguration(2, this.mDepthImageReaderHolder.getSurface()));
        }
        return arrayList;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        ArrayList arrayList = new ArrayList();
        this.mEffectImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mEffectImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Log.d(SingleCameraProcessor.TAG, "configOutputSurfaces onImageAvailable: effectImage received");
                Image acquireNextImage = imageReader.acquireNextImage();
                if (SingleCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    SingleCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                acquireNextImage.close();
                SingleCameraProcessor.this.mNeedProcessNormalImageSize.getAndDecrement();
                SingleCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(this.mEffectImageReaderHolder.getSurface());
        return arrayList;
    }

    /* access modifiers changed from: 0000 */
    public boolean isIdle() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isIdle: ");
        sb.append(this.mNeedProcessNormalImageSize.get());
        Log.d(str, sb.toString());
        boolean z = false;
        if (this.mIsBokehMode) {
            if (this.mNeedProcessNormalImageSize.get() == 0 && this.mNeedProcessRawImageSize.get() == 0 && this.mNeedProcessDepthImageSize.get() == 0) {
                z = true;
            }
            return z;
        }
        if (this.mNeedProcessNormalImageSize.get() == 0) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: 0000 */
    public void processImage(List<CaptureDataBean> list) {
        if (list == null || list.size() == 0) {
            Log.w(TAG, "processImage: dataBeans is empty!");
            return;
        }
        this.mNeedProcessNormalImageSize.getAndIncrement();
        if (this.mIsBokehMode) {
            this.mNeedProcessRawImageSize.getAndIncrement();
            this.mNeedProcessDepthImageSize.getAndIncrement();
        }
        for (CaptureDataBean captureDataBean : list) {
            ICustomCaptureResult result = captureDataBean.getResult();
            Image mainImage = captureDataBean.getMainImage();
            PerformanceTracker.trackAlgorithmProcess("[ORIGINAL]", 0);
            processCaptureResult(result, mainImage);
        }
    }
}
