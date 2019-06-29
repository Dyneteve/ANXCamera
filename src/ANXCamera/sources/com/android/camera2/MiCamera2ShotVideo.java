package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.media.ImageReader;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;

public class MiCamera2ShotVideo extends MiCamera2Shot<byte[]> {
    /* access modifiers changed from: private */
    public static final String TAG = MiCamera2ShotVideo.class.getSimpleName();

    public MiCamera2ShotVideo(MiCamera2 miCamera2) {
        super(miCamera2);
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String access$000 = MiCamera2ShotVideo.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted: ");
                sb.append(totalCaptureResult.getFrameNumber());
                Log.d(access$000, sb.toString());
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = 2 == this.mMiCamera.getCapabilities().getSupportedHardwareLevel() ? this.mMiCamera.getCameraDevice().createCaptureRequest(2) : this.mMiCamera.getCameraDevice().createCaptureRequest(4);
        ImageReader videoSnapshotImageReader = this.mMiCamera.getVideoSnapshotImageReader();
        createCaptureRequest.addTarget(videoSnapshotImageReader.getSurface());
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("size=");
        sb.append(videoSnapshotImageReader.getWidth());
        sb.append("x");
        sb.append(videoSnapshotImageReader.getHeight());
        Log.d(str, sb.toString());
        if (this.mMiCamera.getPreviewSurface() != null) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        if (this.mMiCamera.getRecordSurface() != null) {
            createCaptureRequest.addTarget(this.mMiCamera.getRecordSurface());
        }
        this.mMiCamera.applySettingsForVideoShot(createCaptureRequest, 3);
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(byte[] bArr) {
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback != null) {
            pictureCallback.onPictureTaken(bArr);
        }
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
        byte[] firstPlane = Util.getFirstPlane(image);
        image.close();
        notifyResultData(firstPlane);
    }

    /* access modifiers changed from: protected */
    public void prepare() {
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        try {
            Builder generateRequestBuilder = generateRequestBuilder();
            this.mMiCamera.getCaptureSession().capture(generateRequestBuilder.build(), generateCaptureCallback(), this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot capture a video snapshot");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture a video snapshot, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
