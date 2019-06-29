package com.android.camera2;

import android.annotation.TargetApi;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.utils.SurfaceUtils;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.log.Log;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.CaptureResultVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;
import com.mi.config.b;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import java.util.Locale;

@TargetApi(21)
public class MiCamera2ShotParallelStill extends MiCamera2ShotParallel<ParallelTaskData> {
    private static final String TAG = "ShotParallelStill";
    /* access modifiers changed from: private */
    public int mAlgoType;
    private final int mOperationMode;
    private CaptureResult mPreviewCaptureResult;
    private boolean mShouldDoQcfaCapture;
    /* access modifiers changed from: private */
    public CaptureResult mStillCaptureResult;

    public MiCamera2ShotParallelStill(@NonNull MiCamera2 miCamera2, @NonNull CaptureResult captureResult) {
        super(miCamera2);
        this.mPreviewCaptureResult = captureResult;
        this.mOperationMode = miCamera2.getCapabilities().getOperatingMode();
    }

    private void applyAlgoParameter(Builder builder) {
        MiCameraCompat.applySwMfnrEnable(builder, false);
        MiCameraCompat.applyHDR(builder, false);
        MiCameraCompat.applySuperResolution(builder, false);
        MiCameraCompat.applyMultiFrameInputNum(builder, 1);
    }

    private boolean shouldDoQCFA() {
        boolean z = false;
        if (this.mMiCamera.getCameraConfigs().isHDREnabled() || this.mMiCamera.isBeautyOn()) {
            return false;
        }
        if (CameraSettings.isFrontCamera() && (b.sM || b.sO)) {
            return false;
        }
        if (b.sL) {
            return CaptureResultParser.isQuadCfaRunning(this.mPreviewCaptureResult);
        }
        if (this.mMiCamera.getCapabilities().isRemosaicDetecedSupported()) {
            return CaptureResultParser.isRemosaicDetected(this.mPreviewCaptureResult);
        }
        Integer num = (Integer) this.mPreviewCaptureResult.get(CaptureResult.SENSOR_SENSITIVITY);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("shouldDoQCFA: iso = ");
        sb.append(num);
        Log.d(str, sb.toString());
        if (num != null && num.intValue() <= 200) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            long mCaptureTimestamp = -1;

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                String str = MiCamera2ShotParallelStill.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted: frameNumber=");
                sb.append(totalCaptureResult.getFrameNumber());
                Log.d(str, sb.toString());
                MiCamera2ShotParallelStill.this.mMiCamera.onCapturePictureFinished(true, MiCamera2ShotParallelStill.this);
                Boolean bool = (Boolean) VendorTagHelper.getValue((CaptureResult) totalCaptureResult, CaptureResultVendorTags.IS_HDR_ENABLE);
                if (bool != null && bool.booleanValue()) {
                    Log.e(MiCamera2ShotParallelStill.TAG, "onCaptureCompleted: HDR error");
                }
                Boolean bool2 = (Boolean) VendorTagHelper.getValue((CaptureResult) totalCaptureResult, CaptureResultVendorTags.IS_SR_ENABLE);
                if (bool2 != null && bool2.booleanValue()) {
                    Log.e(MiCamera2ShotParallelStill.TAG, "onCaptureCompleted: SR error");
                }
                MiCamera2ShotParallelStill.this.mStillCaptureResult = totalCaptureResult;
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(CameraDeviceUtil.getCustomCaptureResult(MiCamera2ShotParallelStill.this.mStillCaptureResult), true);
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelStill.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed: reason=");
                sb.append(captureFailure.getReason());
                Log.e(str, sb.toString());
                MiCamera2ShotParallelStill.this.mMiCamera.onCapturePictureFinished(false, MiCamera2ShotParallelStill.this);
                if (this.mCaptureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.mCaptureTimestamp, captureFailure.getReason());
                }
            }

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String str = MiCamera2ShotParallelStill.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStarted: timestamp=");
                sb.append(j);
                sb.append(" frameNumber=");
                sb.append(j2);
                Log.d(str, sb.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                PictureCallback pictureCallback = MiCamera2ShotParallelStill.this.mMiCamera.getPictureCallback();
                if (pictureCallback != null) {
                    ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelStill.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelStill.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelStill.this.mCapturedImageSize, MiCamera2ShotParallelStill.this.isQuickShotAnimation());
                    if (onCaptureStart != null) {
                        onCaptureStart.setAlgoType(MiCamera2ShotParallelStill.this.mAlgoType);
                        onCaptureStart.setBurstNum(1);
                        this.mCaptureTimestamp = j;
                        AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                        return;
                    }
                    Log.w(MiCamera2ShotParallelStill.TAG, "onCaptureStarted: null task data");
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public Builder generateRequestBuilder() throws CameraAccessException, IllegalStateException {
        Builder createCaptureRequest = this.mMiCamera.getCameraDevice().createCaptureRequest(2);
        if (this.mMiCamera.isQcfaEnable()) {
            int size = this.mMiCamera.getRemoteSurfaceList().size();
            CameraSize pictureSize = this.mMiCamera.getPictureSize();
            Surface surface = null;
            int i = size;
            Surface surface2 = null;
            for (Surface surface3 : this.mMiCamera.getRemoteSurfaceList()) {
                Size surfaceSize = SurfaceUtils.getSurfaceSize(surface3);
                if (pictureSize.getWidth() == surfaceSize.getWidth() && pictureSize.getHeight() == surfaceSize.getHeight()) {
                    i--;
                    surface = surface3;
                } else if (pictureSize.getWidth() / 2 == surfaceSize.getWidth() && pictureSize.getHeight() / 2 == surfaceSize.getHeight()) {
                    i--;
                    surface2 = surface3;
                }
            }
            if (surface == null || surface2 == null || i != 0) {
                StringBuilder sb = new StringBuilder();
                sb.append("There is some wrong when QCFA opened! \n");
                sb.append(String.format(Locale.ENGLISH, "qcfaLargerSurface = %s; qcfaSmallerSurface = %s; surfaceList size = %s", new Object[]{surface, surface2, Integer.valueOf(i)}));
                throw new RuntimeException(sb.toString());
            }
            if (this.mShouldDoQcfaCapture) {
                surface2 = surface;
            }
            Size surfaceSize2 = SurfaceUtils.getSurfaceSize(surface2);
            configParallelSession(surfaceSize2);
            Log.d(TAG, String.format(Locale.ENGLISH, "add qcfa surface %s to capture request, size is: %s", new Object[]{surface2, surfaceSize2}));
            createCaptureRequest.addTarget(surface2);
        } else {
            for (Surface surface4 : this.mMiCamera.getRemoteSurfaceList()) {
                Log.d(TAG, String.format(Locale.ENGLISH, "add surface %s to capture request, size is: %s", new Object[]{surface4, SurfaceUtils.getSurfaceSize(surface4)}));
                createCaptureRequest.addTarget(surface4);
            }
            this.mCapturedImageSize = this.mMiCamera.getPictureSize();
            if (!(this.mOperationMode == 36865 || this.mOperationMode == 36867)) {
                Surface previewSurface = this.mMiCamera.getPreviewSurface();
                Log.d(TAG, String.format(Locale.ENGLISH, "add preview surface %s to capture request, size is: %s", new Object[]{previewSurface, SurfaceUtils.getSurfaceSize(previewSurface)}));
                createCaptureRequest.addTarget(previewSurface);
            }
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AF_MODE, (Integer) this.mMiCamera.getPreviewRequestBuilder().get(CaptureRequest.CONTROL_AF_MODE));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        if (this.mShouldDoQcfaCapture) {
            MiCameraCompat.applyMfnrEnable(createCaptureRequest, false);
        }
        if (b.isMTKPlatform() && this.mMiCamera.isQcfaEnable()) {
            Log.d(TAG, "enable remosaic capture hint");
            VendorTagHelper.setValueQuietly(createCaptureRequest, CaptureRequestVendorTags.CONTROL_REMOSAIC_HINT, new int[]{1});
            if (this.mShouldDoQcfaCapture) {
                Log.d(TAG, "enable remosaic capture request");
                VendorTagHelper.setValueQuietly(createCaptureRequest, CaptureRequestVendorTags.CONTROL_ENABLE_REMOSAIC, Boolean.TRUE);
            }
        }
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        this.mAlgoType = 0;
        if (this.mMiCamera.isQcfaEnable()) {
            this.mShouldDoQcfaCapture = shouldDoQCFA();
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("prepare: qcfa = ");
        sb.append(this.mShouldDoQcfaCapture);
        Log.d(str, sb.toString());
        if (this.mShouldDoQcfaCapture) {
            this.mAlgoType = 6;
        }
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        PerformanceTracker.trackPictureCapture(0);
        try {
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            Builder generateRequestBuilder = generateRequestBuilder();
            applyAlgoParameter(generateRequestBuilder);
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
