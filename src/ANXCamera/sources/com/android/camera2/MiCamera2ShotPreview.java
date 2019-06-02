package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.media.Image;

public class MiCamera2ShotPreview extends MiCamera2Shot<byte[]> {
    private static final String TAG = MiCamera2ShotPreview.class.getSimpleName();

    public MiCamera2ShotPreview(MiCamera2 miCamera2, CaptureResult captureResult) {
        super(miCamera2);
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return null;
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        return null;
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(byte[] bArr) {
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
    }

    /* access modifiers changed from: protected */
    public void prepare() {
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        this.mMiCamera.getPictureCallback().onCaptureShutter();
        this.mMiCamera.onCapturePictureFinished(true, this);
    }
}
