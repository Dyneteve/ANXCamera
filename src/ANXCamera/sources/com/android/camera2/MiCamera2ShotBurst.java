package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.support.annotation.NonNull;
import com.android.camera.Util;
import com.android.camera.log.Log;
import com.android.camera2.Camera2Proxy.PictureCallback;

public class MiCamera2ShotBurst extends MiCamera2Shot<byte[]> {
    /* access modifiers changed from: private */
    public static final String TAG = MiCamera2ShotBurst.class.getSimpleName();
    private int mBurstNum;
    /* access modifiers changed from: private */
    public int mLatestSequenceId = 0;

    public MiCamera2ShotBurst(MiCamera2 miCamera2, int i) {
        super(miCamera2);
        this.mBurstNum = i;
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                MiCamera2ShotBurst.this.mMiCamera.updateFrameNumber(totalCaptureResult.getFrameNumber());
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String access$000 = MiCamera2ShotBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed: ");
                sb.append(captureFailure.getReason());
                Log.e(access$000, sb.toString());
            }

            public void onCaptureSequenceAborted(@NonNull CameraCaptureSession cameraCaptureSession, int i) {
                super.onCaptureSequenceAborted(cameraCaptureSession, i);
                String access$000 = MiCamera2ShotBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureSequenceAborted: ");
                sb.append(i);
                Log.w(access$000, sb.toString());
                if (MiCamera2ShotBurst.this.mLatestSequenceId == i) {
                    MiCamera2ShotBurst.this.mMiCamera.setAWBLock(false);
                    MiCamera2ShotBurst.this.mMiCamera.resumePreview();
                }
                PictureCallback pictureCallback = MiCamera2ShotBurst.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(false);
                }
            }

            public void onCaptureSequenceCompleted(@NonNull CameraCaptureSession cameraCaptureSession, int i, long j) {
                String access$000 = MiCamera2ShotBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureSequenceCompleted: sequenceId=");
                sb.append(i);
                sb.append(" frameNumber=");
                sb.append(j);
                Log.d(access$000, sb.toString());
                if (MiCamera2ShotBurst.this.mLatestSequenceId == i) {
                    MiCamera2ShotBurst.this.mMiCamera.setAWBLock(false);
                    MiCamera2ShotBurst.this.mMiCamera.resumePreview();
                }
                PictureCallback pictureCallback = MiCamera2ShotBurst.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    pictureCallback.onPictureTakenFinished(true);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        createCaptureRequest.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(2));
        createCaptureRequest.addTarget(this.mMiCamera.getPhotoImageReader().getSurface());
        createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 4);
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
        PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
        if (pictureCallback == null) {
            image.close();
        } else if (!pictureCallback.onPictureTakenImageConsumed(image)) {
            byte[] firstPlane = Util.getFirstPlane(image);
            image.close();
            notifyResultData(firstPlane);
        }
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        this.mMiCamera.setAWBLock(true);
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        Log.d(TAG, "startSessionCapture");
        this.mMiCamera.pausePreview();
        try {
            this.mLatestSequenceId = this.mMiCamera.getCaptureSession().setRepeatingRequest(generateRequestBuilder().build(), generateCaptureCallback(), this.mCameraHandler);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("repeating sequenceId: ");
            sb.append(this.mLatestSequenceId);
            Log.d(str, sb.toString());
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture burst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
