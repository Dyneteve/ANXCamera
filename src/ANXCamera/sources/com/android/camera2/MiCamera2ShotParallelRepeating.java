package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.media.Image;
import android.support.annotation.NonNull;
import android.view.Surface;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;

public class MiCamera2ShotParallelRepeating extends MiCamera2Shot<byte[]> {
    private static final int INVALID_SEQUENCE_ID = -1;
    private static final String TAG = "ParallelRepeating";
    /* access modifiers changed from: private */
    public CaptureResult mRepeatingCaptureResult;

    public MiCamera2ShotParallelRepeating(MiCamera2 miCamera2, int i) {
        super(miCamera2);
    }

    /* access modifiers changed from: private */
    public void onRepeatingEnd(boolean z, int i) {
        this.mMiCamera.setAWBLock(false);
        this.mMiCamera.resumePreview();
        if (-1 != i) {
            PictureCallback pictureCallback = this.mMiCamera.getPictureCallback();
            if (pictureCallback != null) {
                pictureCallback.onPictureTakenFinished(z);
            }
            this.mMiCamera.onMultiSnapEnd(z, this);
        }
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            long mCaptureTimestamp = -1;

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                super.onCaptureCompleted(cameraCaptureSession, captureRequest, totalCaptureResult);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted: frameNumber=");
                sb.append(totalCaptureResult.getFrameNumber());
                Log.d(str, sb.toString());
                MiCamera2ShotParallelRepeating.this.mRepeatingCaptureResult = totalCaptureResult;
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(CameraDeviceUtil.getCustomCaptureResult(MiCamera2ShotParallelRepeating.this.mRepeatingCaptureResult), true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed: reason=");
                sb.append(captureFailure.getReason());
                Log.e(str, sb.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(false, -1);
                if (this.mCaptureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.mCaptureTimestamp, captureFailure.getReason());
                }
            }

            public void onCaptureSequenceAborted(@NonNull CameraCaptureSession cameraCaptureSession, int i) {
                super.onCaptureSequenceAborted(cameraCaptureSession, i);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureSequenceAborted: sequenceId=");
                sb.append(i);
                Log.w(str, sb.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(false, i);
            }

            public void onCaptureSequenceCompleted(@NonNull CameraCaptureSession cameraCaptureSession, int i, long j) {
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureSequenceCompleted: sequenceId=");
                sb.append(i);
                sb.append(" frameNumber=");
                sb.append(j);
                Log.d(str, sb.toString());
                MiCamera2ShotParallelRepeating.this.onRepeatingEnd(true, i);
            }

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                String str = MiCamera2ShotParallelRepeating.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStarted: timestamp=");
                sb.append(j);
                sb.append(" frameNumber=");
                sb.append(j2);
                Log.d(str, sb.toString());
                PictureCallback pictureCallback = MiCamera2ShotParallelRepeating.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelRepeating.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelRepeating.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelRepeating.this.mMiCamera.getPictureSize(), MiCamera2ShotParallelRepeating.this.isQuickShotAnimation());
                    if (onCaptureStart != null) {
                        onCaptureStart.setAlgoType(4);
                        onCaptureStart.setBurstNum(1);
                        this.mCaptureTimestamp = j;
                        AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                        return;
                    }
                    Log.w(MiCamera2ShotParallelRepeating.TAG, "onCaptureStarted: null task data");
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        for (Surface surface : this.mMiCamera.getRemoteSurfaceList()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("add surface ");
            sb.append(surface);
            sb.append(" to capture request");
            Log.d(str, sb.toString());
            createCaptureRequest.addTarget(surface);
        }
        createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        if (!isInQcfaMode() || Camera2DataContainer.getInstance().getBokehFrontCameraId() == this.mMiCamera.getId()) {
            createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        MiCameraCompat.applyMfnrEnable(createCaptureRequest, false);
        MiCameraCompat.applySuperResolution(createCaptureRequest, false);
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void notifyResultData(byte[] bArr) {
    }

    /* access modifiers changed from: protected */
    public void onImageReceived(Image image, int i) {
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        this.mMiCamera.setAWBLock(true);
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        Log.d(TAG, "startSessionCapture");
        PerformanceTracker.trackPictureCapture(0);
        this.mMiCamera.pausePreview();
        try {
            this.mMiCamera.getCaptureSession().setRepeatingRequest(generateRequestBuilder().build(), generateCaptureCallback(), this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to capture burst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
