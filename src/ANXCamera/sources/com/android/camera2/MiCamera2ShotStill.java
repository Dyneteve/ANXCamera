package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.ss.android.ttve.common.TEDefine;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotStill extends MiCamera2Shot<ParallelTaskData> {
    /* access modifiers changed from: private */
    public static final String TAG = MiCamera2ShotStill.class.getSimpleName();
    /* access modifiers changed from: private */
    public ParallelTaskData mCurrentParallelTaskData;
    private boolean mHasDepth;
    private boolean mIsIntent;

    public MiCamera2ShotStill(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$100 = MiCamera2ShotStill.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted: ");
                sb.append(totalCaptureResult.getFrameNumber());
                Log.d(access$100, sb.toString());
                if (ModuleManager.isSuperNightScene()) {
                    MiCamera2ShotStill.this.mMiCamera.setAWBLock(false);
                }
                MiCamera2ShotStill.this.mMiCamera.onCapturePictureFinished(true, MiCamera2ShotStill.this);
                MiCamera2ShotStill.this.mMiCamera.setCaptureEnable(true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String access$100 = MiCamera2ShotStill.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed: reason=");
                sb.append(captureFailure.getReason());
                Log.e(access$100, sb.toString());
                if (ModuleManager.isSuperNightScene()) {
                    MiCamera2ShotStill.this.mMiCamera.setAWBLock(false);
                }
                MiCamera2ShotStill.this.mMiCamera.onCapturePictureFinished(false, MiCamera2ShotStill.this);
                MiCamera2ShotStill.this.mMiCamera.setCaptureEnable(true);
            }

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (0 == MiCamera2ShotStill.this.mCurrentParallelTaskData.getTimestamp()) {
                    MiCamera2ShotStill.this.mCurrentParallelTaskData.setTimestamp(j);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        ImageReader photoImageReader = this.mMiCamera.getPhotoImageReader();
        createCaptureRequest.addTarget(photoImageReader.getSurface());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("size=");
        sb.append(photoImageReader.getWidth());
        sb.append("x");
        sb.append(photoImageReader.getHeight());
        Log.d(str, sb.toString());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        if (this.mHasDepth) {
            createCaptureRequest.addTarget(this.mMiCamera.getDepthImageReader().getSurface());
            createCaptureRequest.addTarget(this.mMiCamera.getPortraitRawImageReader().getSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(ParallelTaskData parallelTaskData) {
        ParallelCallback parallelCallback = this.mMiCamera.getParallelCallback();
        if (parallelCallback != null) {
            long currentTimeMillis = System.currentTimeMillis();
            this.mCurrentParallelTaskData.setPreviewThumbnailHash(this.mPreviewThumbnailHash);
            parallelCallback.onParallelProcessFinish(this.mCurrentParallelTaskData);
            long currentTimeMillis2 = System.currentTimeMillis() - currentTimeMillis;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mJpegCallbackFinishTime = ");
            sb.append(currentTimeMillis2);
            sb.append("ms");
            Log.d(str, sb.toString());
        }
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null || this.mCurrentParallelTaskData == null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onImageReceived: something wrong happened when image received: callback = ");
            sb.append(pictureCallback);
            sb.append(" mCurrentParallelTaskData = ");
            sb.append(this.mCurrentParallelTaskData);
            Log.w(str, sb.toString());
            image.close();
            return;
        }
        if (0 == this.mCurrentParallelTaskData.getTimestamp()) {
            Log.w(TAG, "onImageReceived: image arrived first");
            this.mCurrentParallelTaskData.setTimestamp(image.getTimestamp());
        }
        byte[] firstPlane = Util.getFirstPlane(image);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("onImageReceived: dataLen=");
        sb2.append(firstPlane == null ? TEDefine.FACE_BEAUTY_NULL : Integer.valueOf(firstPlane.length));
        sb2.append(" timeStamp=");
        sb2.append(image.getTimestamp());
        sb2.append(" holder=");
        sb2.append(hashCode());
        Log.d(str2, sb2.toString());
        image.close();
        this.mCurrentParallelTaskData.fillJpegData(firstPlane, i);
        if (this.mCurrentParallelTaskData.isJpegDataReady()) {
            if (this.mIsIntent) {
                notifyResultData(this.mCurrentParallelTaskData);
                pictureCallback.onPictureTakenFinished(true);
            } else {
                pictureCallback.onPictureTakenFinished(true);
                notifyResultData(this.mCurrentParallelTaskData);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        if (ModuleManager.isSuperNightScene()) {
            this.mMiCamera.setAWBLock(true);
        }
        int shotType = this.mMiCamera.getCameraConfigs().getShotType();
        if (shotType != 2) {
            switch (shotType) {
                case -3:
                    this.mHasDepth = true;
                    this.mIsIntent = true;
                    return;
                case -2:
                    this.mIsIntent = true;
                    return;
                default:
                    return;
            }
        } else {
            this.mHasDepth = true;
        }
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        try {
            this.mCurrentParallelTaskData = generateParallelTaskData(0);
            if (this.mCurrentParallelTaskData == null) {
                Log.w(TAG, "startSessionCapture: null task data");
                return;
            }
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            PerformanceTracker.trackPictureCapture(0);
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a still picture");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture a still picture, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
