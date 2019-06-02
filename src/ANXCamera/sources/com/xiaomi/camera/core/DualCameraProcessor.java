package com.xiaomi.camera.core;

import android.hardware.camera2.params.OutputConfiguration;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.os.Parcelable;
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

public class DualCameraProcessor extends ImageProcessor {
    /* access modifiers changed from: private */
    public static final String TAG = DualCameraProcessor.class.getSimpleName();

    DualCameraProcessor(ImageProcessorStatusCallback imageProcessorStatusCallback, boolean z) {
        super(imageProcessorStatusCallback, z);
    }

    private void processCaptureResult(ICustomCaptureResult iCustomCaptureResult, Image image, int i) {
        Parcelable results = iCustomCaptureResult.getResults();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("processCaptureResult: cameraMetadataNative = ");
        sb.append(results);
        Log.d(str, sb.toString());
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("processCaptureResult: processFrame image -- ");
        sb2.append(i);
        Log.d(str2, sb2.toString());
        FrameData frameData = new FrameData(i, iCustomCaptureResult.getSequenceId(), iCustomCaptureResult.getFrameNumber(), results, image);
        frameData.setFrameCallback(new FrameStatusCallback() {
            public void onFrameImageClosed(Image image) {
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onFrameImageClosed: ");
                sb.append(image);
                Log.d(access$000, sb.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onOriginalImageClosed(image);
                }
                ImagePool.getInstance().releaseImage(image);
            }
        });
        this.mTaskSession.processFrame(frameData, new FrameCallback() {
            public void onFrameProcessed(int i, String str, Object obj) {
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onFrameProcessed: ");
                sb.append(i);
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
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageAvailable: effectImage received: ");
                sb.append(acquireNextImage);
                Log.d(access$000, sb.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 0);
                }
                acquireNextImage.close();
                DualCameraProcessor.this.mNeedProcessNormalImageSize.getAndDecrement();
                DualCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(0, this.mEffectImageReaderHolder.getSurface()));
        this.mRawImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth(), bufferFormat.getBufferHeight(), bufferFormat.getBufferFormat(), getImageBufferQueueSize());
        this.mRawImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[     RAW]", 1);
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageAvailable: rawImage received: ");
                sb.append(acquireNextImage);
                Log.d(access$000, sb.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 1);
                }
                acquireNextImage.close();
                DualCameraProcessor.this.mNeedProcessRawImageSize.getAndDecrement();
                DualCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(1, this.mRawImageReaderHolder.getSurface()));
        this.mDepthImageReaderHolder = ImageReader.newInstance(bufferFormat.getBufferWidth() / 2, bufferFormat.getBufferHeight() / 2, 540422489, getImageBufferQueueSize());
        this.mDepthImageReaderHolder.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                PerformanceTracker.trackAlgorithmProcess("[   DEPTH]", 1);
                String access$000 = DualCameraProcessor.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onImageAvailable: depthImage received: ");
                sb.append(acquireNextImage);
                Log.d(access$000, sb.toString());
                if (DualCameraProcessor.this.mImageProcessorStatusCallback != null) {
                    DualCameraProcessor.this.mImageProcessorStatusCallback.onImageProcessed(acquireNextImage, 2);
                }
                acquireNextImage.close();
                DualCameraProcessor.this.mNeedProcessDepthImageSize.getAndDecrement();
                DualCameraProcessor.this.tryToStopWork();
            }
        }, getHandler());
        arrayList.add(new OutputConfiguration(2, this.mDepthImageReaderHolder.getSurface()));
        return arrayList;
    }

    public List<Surface> configOutputSurfaces(BufferFormat bufferFormat) {
        throw new RuntimeException("This method is not supported in Portrait mode!");
    }

    /* access modifiers changed from: 0000 */
    public boolean isIdle() {
        return this.mNeedProcessNormalImageSize.get() == 0 && this.mNeedProcessRawImageSize.get() == 0 && this.mNeedProcessDepthImageSize.get() == 0;
    }

    /* access modifiers changed from: 0000 */
    public void processImage(List<CaptureDataBean> list) {
        if (list == null || list.size() == 0) {
            Log.w(TAG, "processImage: dataBeans is empty!");
            return;
        }
        this.mNeedProcessNormalImageSize.getAndIncrement();
        this.mNeedProcessRawImageSize.getAndIncrement();
        this.mNeedProcessDepthImageSize.getAndIncrement();
        for (CaptureDataBean captureDataBean : list) {
            ICustomCaptureResult result = captureDataBean.getResult();
            PerformanceTracker.trackAlgorithmProcess("[ORIGINAL]", 0);
            processCaptureResult(result, captureDataBean.getMainImage(), 0);
            processCaptureResult(result, captureDataBean.getSubImage(), 1);
        }
    }
}
