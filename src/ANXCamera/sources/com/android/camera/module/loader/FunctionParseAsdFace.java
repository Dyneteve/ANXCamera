package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.Face;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.CameraHardwareFace;
import com.android.camera2.vendortag.CaptureResultVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdFace implements Function<CaptureResult, CaptureResult> {
    private WeakReference<FaceDetectionCallback> mFaceCallbackReference;
    private FaceAnalyzeInfo mFaceInfo;
    private boolean mNeedFaceInfo;

    public FunctionParseAsdFace(FaceDetectionCallback faceDetectionCallback, boolean z) {
        this.mFaceCallbackReference = new WeakReference<>(faceDetectionCallback);
        this.mNeedFaceInfo = z;
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        FaceDetectionCallback faceDetectionCallback = (FaceDetectionCallback) this.mFaceCallbackReference.get();
        if (faceDetectionCallback == null || !faceDetectionCallback.isFaceDetectStarted()) {
            return captureResult;
        }
        Face[] faceArr = (Face[]) captureResult.get(CaptureResult.STATISTICS_FACES);
        if (faceArr == null) {
            return captureResult;
        }
        boolean isUseFaceInfo = faceDetectionCallback.isUseFaceInfo();
        if (this.mNeedFaceInfo && isUseFaceInfo) {
            if (this.mFaceInfo == null) {
                this.mFaceInfo = new FaceAnalyzeInfo();
            }
            this.mFaceInfo.mAge = (float[]) VendorTagHelper.getValue(captureResult, CaptureResultVendorTags.STATISTICS_FACE_AGE);
            this.mFaceInfo.mGender = (float[]) VendorTagHelper.getValue(captureResult, CaptureResultVendorTags.STATISTICS_FACE_GENDER);
            this.mFaceInfo.mFaceScore = (float[]) VendorTagHelper.getValue(captureResult, CaptureResultVendorTags.STATISTICS_FACE_FACESCORE);
            this.mFaceInfo.mProp = (float[]) VendorTagHelper.getValue(captureResult, CaptureResultVendorTags.STATISTICS_FACE_PROP);
        }
        faceDetectionCallback.onFaceDetected((!this.mNeedFaceInfo || !isUseFaceInfo || faceArr.length <= 0 || this.mFaceInfo.mAge == null) ? CameraHardwareFace.convertCameraHardwareFace(faceArr) : CameraHardwareFace.convertExCameraHardwareFace(faceArr, this.mFaceInfo), this.mFaceInfo);
        return captureResult;
    }
}
