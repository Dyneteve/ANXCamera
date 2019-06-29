package com.android.camera2;

import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.CaptureCallback;
import android.hardware.camera2.CaptureFailure;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.params.Face;
import android.hardware.camera2.utils.SurfaceUtils;
import android.support.annotation.NonNull;
import android.util.Size;
import android.view.Surface;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Util;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;
import com.mi.config.b;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.core.ParallelTaskData;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class MiCamera2ShotParallelBurst extends MiCamera2ShotParallel<ParallelTaskData> {
    private static final String TAG = "ShotParallelBurst";
    /* access modifiers changed from: private */
    public int mAlgoType = 0;
    /* access modifiers changed from: private */
    public int mCompletedNum;
    /* access modifiers changed from: private */
    public boolean mFirstNum;
    private int[] mHdrCheckerEvValue;
    private CaptureResult mPreviewCaptureResult;
    /* access modifiers changed from: private */
    public int mSequenceNum;
    private boolean mShouldDoMFNR;
    private boolean mShouldDoQcfaCapture;
    private boolean mShouldDoSR;
    private List<CaptureRequest> requests = new ArrayList();

    public MiCamera2ShotParallelBurst(MiCamera2 miCamera2, CaptureResult captureResult) {
        super(miCamera2);
        this.mPreviewCaptureResult = captureResult;
    }

    private void applyAlgoParameter(Builder builder, int i, int i2) {
        switch (i2) {
            case 1:
                applyHdrParameter(builder, i);
                return;
            case 2:
                MiCameraCompat.applySwMfnrEnable(builder, this.mShouldDoMFNR);
                MiCameraCompat.applyMfnrEnable(builder, false);
                if (b.jx() || b.sO) {
                    CompatibilityUtils.setZsl(builder, true);
                    return;
                }
                return;
            case 3:
                MiCameraCompat.applyMultiFrameInputNum(builder, this.mSequenceNum);
                MiCameraCompat.applyMfnrEnable(builder, false);
                return;
            default:
                return;
        }
    }

    private void applyHdrParameter(Builder builder, int i) {
        if (i <= this.mSequenceNum) {
            MiCameraCompat.applyHdrBracketMode(builder, 1);
            MiCameraCompat.applyMultiFrameInputNum(builder, this.mSequenceNum);
            builder.set(CaptureRequest.CONTROL_AE_EXPOSURE_COMPENSATION, Integer.valueOf(this.mHdrCheckerEvValue[i]));
            MiCameraCompat.applyMfnrEnable(builder, false);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("wrong sequenceNum ");
        sb.append(i);
        throw new RuntimeException(sb.toString());
    }

    private int getGroupShotMaxImage() {
        Face[] faceArr = (Face[]) this.mPreviewCaptureResult.get(CaptureResult.STATISTICS_FACES);
        return Util.clamp((faceArr != null ? faceArr.length : 0) + 1, 2, 4);
    }

    private int getGroupShotNum() {
        if (Util.isMemoryRich(CameraAppImpl.getAndroidContext())) {
            return getGroupShotMaxImage();
        }
        Log.w(TAG, "getGroupShotNum: low memory");
        return 2;
    }

    private void prepareClearShot(int i) {
        if (b.jx()) {
            this.mSequenceNum = 10;
        } else {
            this.mSequenceNum = 5;
        }
    }

    private void prepareGroupShot() {
        this.mSequenceNum = getGroupShotNum();
    }

    private void prepareHdr() {
        Log.d(TAG, "prepareHdr: start");
        byte[] hdrCheckerValues = CaptureResultParser.getHdrCheckerValues(this.mPreviewCaptureResult);
        if (hdrCheckerValues != 0 && hdrCheckerValues.length >= 1) {
            int i = 0;
            if (hdrCheckerValues[0] != 0) {
                this.mSequenceNum = hdrCheckerValues[0];
                if (this.mSequenceNum <= 6) {
                    this.mHdrCheckerEvValue = new int[this.mSequenceNum];
                    if (this.mSequenceNum > 0 && this.mSequenceNum < 6) {
                        while (i < this.mSequenceNum) {
                            int i2 = i + 1;
                            this.mHdrCheckerEvValue[i] = hdrCheckerValues[i2 * 4];
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("prepareHdr: evValue[");
                            sb.append(i);
                            sb.append("]=");
                            sb.append(this.mHdrCheckerEvValue[i]);
                            Log.d(str, sb.toString());
                            i = i2;
                        }
                    }
                    return;
                }
                StringBuilder sb2 = new StringBuilder();
                sb2.append("wrong sequenceNum ");
                sb2.append(this.mSequenceNum);
                throw new RuntimeException(sb2.toString());
            }
        }
        this.mSequenceNum = 3;
        this.mHdrCheckerEvValue = new int[]{-6, 0, 6};
    }

    private void prepareSR() {
        if (b.sM || b.sO) {
            this.mSequenceNum = 8;
        } else {
            this.mSequenceNum = 5;
        }
    }

    /* access modifiers changed from: protected */
    public CaptureCallback generateCaptureCallback() {
        return new CaptureCallback() {
            long captureTimestamp = -1;

            public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
                MiCamera2ShotParallelBurst.this.mCompletedNum = MiCamera2ShotParallelBurst.this.mCompletedNum + 1;
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted: ");
                sb.append(MiCamera2ShotParallelBurst.this.mCompletedNum);
                sb.append("/");
                sb.append(MiCamera2ShotParallelBurst.this.mSequenceNum);
                Log.d(str, sb.toString());
                AlgoConnector.getInstance().getLocalBinder().onCaptureCompleted(CameraDeviceUtil.getCustomCaptureResult(totalCaptureResult), MiCamera2ShotParallelBurst.this.mCompletedNum == 1);
                if (MiCamera2ShotParallelBurst.this.mSequenceNum == MiCamera2ShotParallelBurst.this.mCompletedNum) {
                    MiCamera2ShotParallelBurst.this.mMiCamera.onCapturePictureFinished(true, MiCamera2ShotParallelBurst.this);
                }
                boolean isSREnable = CaptureResultParser.isSREnable(totalCaptureResult);
                String str2 = MiCamera2ShotParallelBurst.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onCaptureCompleted: isSREnabled = ");
                sb2.append(isSREnable);
                Log.d(str2, sb2.toString());
            }

            public void onCaptureFailed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureFailure captureFailure) {
                super.onCaptureFailed(cameraCaptureSession, captureRequest, captureFailure);
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureFailed: reason=");
                sb.append(captureFailure.getReason());
                sb.append(" timestamp=");
                sb.append(this.captureTimestamp);
                Log.e(str, sb.toString());
                MiCamera2ShotParallelBurst.this.mMiCamera.onCapturePictureFinished(false, MiCamera2ShotParallelBurst.this);
                if (this.captureTimestamp != -1) {
                    AlgoConnector.getInstance().getLocalBinder().onCaptureFailed(this.captureTimestamp, captureFailure.getReason());
                }
            }

            public void onCaptureStarted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, long j, long j2) {
                String str = MiCamera2ShotParallelBurst.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStarted: timestamp=");
                sb.append(j);
                sb.append(" frameNumber=");
                sb.append(j2);
                sb.append(" isFirst=");
                sb.append(MiCamera2ShotParallelBurst.this.mFirstNum);
                Log.d(str, sb.toString());
                super.onCaptureStarted(cameraCaptureSession, captureRequest, j, j2);
                if (MiCamera2ShotParallelBurst.this.mFirstNum) {
                    PictureCallback pictureCallback = MiCamera2ShotParallelBurst.this.mMiCamera.getPictureCallback();
                    if (pictureCallback != null) {
                        ParallelTaskData onCaptureStart = pictureCallback.onCaptureStart(new ParallelTaskData(j, MiCamera2ShotParallelBurst.this.mMiCamera.getCameraConfigs().getShotType(), MiCamera2ShotParallelBurst.this.mMiCamera.getCameraConfigs().getShotPath()), MiCamera2ShotParallelBurst.this.mCapturedImageSize, MiCamera2ShotParallelBurst.this.isQuickShotAnimation());
                        if (onCaptureStart != null) {
                            onCaptureStart.setAlgoType(MiCamera2ShotParallelBurst.this.mAlgoType);
                            onCaptureStart.setBurstNum(MiCamera2ShotParallelBurst.this.mSequenceNum);
                            this.captureTimestamp = j;
                            AlgoConnector.getInstance().getLocalBinder().onCaptureStarted(onCaptureStart);
                        } else {
                            Log.w(MiCamera2ShotParallelBurst.TAG, "onCaptureStarted: null task data");
                        }
                    } else {
                        Log.w(MiCamera2ShotParallelBurst.TAG, "onCaptureStarted: picture callback is null!");
                    }
                    MiCamera2ShotParallelBurst.this.mFirstNum = false;
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
            Log.d(TAG, String.format(Locale.ENGLISH, "add qcfa surface %s to capture request, size is: %s", new Object[]{surface2, surfaceSize2}));
            createCaptureRequest.addTarget(surface2);
            if (b.jx() || b.sO) {
                createCaptureRequest.addTarget(this.mMiCamera.getPreviewSurface());
            }
            configParallelSession(surfaceSize2);
        } else {
            for (Surface surface4 : this.mMiCamera.getRemoteSurfaceList()) {
                Log.d(TAG, String.format(Locale.ENGLISH, "add surface %s to capture request, size is: %s", new Object[]{surface4, SurfaceUtils.getSurfaceSize(surface4)}));
                createCaptureRequest.addTarget(surface4);
            }
            this.mCapturedImageSize = this.mMiCamera.getPictureSize();
            if (!b.isMTKPlatform() && this.mMiCamera.getCapabilities().getOperatingMode() != 36865 && (b.jx() || b.sO || this.mMiCamera.getCapabilities().getOperatingMode() != 36867)) {
                Surface previewSurface = this.mMiCamera.getPreviewSurface();
                Log.d(TAG, String.format(Locale.ENGLISH, "add preview surface %s to capture request, size is: %s", new Object[]{previewSurface, SurfaceUtils.getSurfaceSize(previewSurface)}));
                createCaptureRequest.addTarget(previewSurface);
            }
        }
        createCaptureRequest.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        this.mMiCamera.applySettingsForCapture(createCaptureRequest, 3);
        CompatibilityUtils.setZsl(createCaptureRequest, false);
        VendorTagHelper.setValueQuietly(createCaptureRequest, CaptureRequestVendorTags.ZSL_CAPTURE_MODE, Integer.valueOf(0));
        return createCaptureRequest;
    }

    /* access modifiers changed from: protected */
    public void prepare() {
        this.mFirstNum = true;
        this.mShouldDoQcfaCapture = false;
        this.mShouldDoSR = this.mMiCamera.getCameraConfigs().isSuperResolutionEnabled();
        if (this.mMiCamera.getCameraConfigs().isHDREnabled()) {
            this.mAlgoType = 1;
            prepareHdr();
        } else if (CameraSettings.isGroupShotOn()) {
            this.mAlgoType = 5;
            prepareGroupShot();
        } else if (this.mShouldDoSR) {
            this.mAlgoType = 3;
            prepareSR();
        } else {
            Integer num = (Integer) this.mPreviewCaptureResult.get(CaptureResult.SENSOR_SENSITIVITY);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("prepare: iso = ");
            sb.append(num);
            Log.d(str, sb.toString());
            if (b.jy()) {
                this.mShouldDoMFNR = true;
            } else {
                this.mShouldDoMFNR = num != null && num.intValue() >= 800;
            }
            if (this.mShouldDoMFNR) {
                this.mAlgoType = 2;
                prepareClearShot(num.intValue());
            } else {
                this.mAlgoType = 0;
                this.mSequenceNum = 1;
            }
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "prepare: algo=%d captureNum=%d doMFNR=%b doSR=%b", new Object[]{Integer.valueOf(this.mAlgoType), Integer.valueOf(this.mSequenceNum), Boolean.valueOf(this.mShouldDoMFNR), Boolean.valueOf(this.mShouldDoSR)}));
    }

    /* access modifiers changed from: protected */
    public void startSessionCapture() {
        try {
            CaptureCallback generateCaptureCallback = generateCaptureCallback();
            for (int i = 0; i < this.mSequenceNum; i++) {
                Builder generateRequestBuilder = generateRequestBuilder();
                applyAlgoParameter(generateRequestBuilder, i, this.mAlgoType);
                this.requests.add(generateRequestBuilder.build());
            }
            this.mMiCamera.getCaptureSession().captureBurst(this.requests, generateCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Cannot captureBurst");
            this.mMiCamera.notifyOnError(e.getReason());
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to captureBurst, IllegalState", e2);
            this.mMiCamera.notifyOnError(256);
        }
    }
}
