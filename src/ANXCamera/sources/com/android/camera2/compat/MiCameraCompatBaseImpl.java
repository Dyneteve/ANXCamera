package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CameraCharacteristics.Key;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.params.StreamConfiguration;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.VendorTag;
import com.android.camera2.vendortag.VendorTagHelper;
import com.mi.config.b;
import java.util.HashSet;
import java.util.Map.Entry;

@TargetApi(21)
public class MiCameraCompatBaseImpl {
    public void applyASDEnable(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.AI_SCENE, Boolean.valueOf(z));
    }

    public void applyASDScene(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.AI_SCENE_APPLY, Integer.valueOf(i));
    }

    public void applyAiScenePeriod(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.AI_SCENE_PERIOD, Integer.valueOf(i));
    }

    public void applyAutoZoomMode(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.AUTOZOOM_MODE, Integer.valueOf(i));
    }

    public void applyAutoZoomScaleOffset(Builder builder, float f) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.AUTOZOOM_SCALE_OFFSET, Float.valueOf(f));
    }

    public void applyBackwardCaptureHint(Builder builder, byte b) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BACKWARD_CAPTURE_HINT, Byte.valueOf(b));
    }

    public void applyBeautyParameter(Builder builder, HashSet<String> hashSet, BeautyValues beautyValues) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BEAUTY_LEVEL, beautyValues.mBeautyLevel);
        if (b.jo()) {
            for (Entry entry : BeautyConstant.BEAUTY_TYPE_VENDOR_TAG_MAP.entrySet()) {
                VendorTag vendorTag = (VendorTag) entry.getValue();
                if (hashSet.contains(vendorTag.getName())) {
                    VendorTagHelper.setValue(builder, vendorTag, Integer.valueOf(beautyValues.getValueByType((String) entry.getKey())));
                }
            }
            return;
        }
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BEAUTY_SKIN_COLOR, Integer.valueOf(beautyValues.mBeautySkinColor));
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BEAUTY_SLIM_FACE, Integer.valueOf(beautyValues.mBeautySlimFace));
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BEAUTY_SKIN_SMOOTH, Integer.valueOf(beautyValues.mBeautySkinSmooth));
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BEAUTY_ENLARGE_EYE, Integer.valueOf(beautyValues.mBeautyEnlargeEye));
    }

    public void applyBurstFps(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BURST_SHOOT_FPS, Integer.valueOf(i));
    }

    public void applyBurstHint(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BURST_CAPTURE_HINT, Integer.valueOf(i));
    }

    public void applyCameraAi30Enable(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.CAMERA_AI_30, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyContrast(Builder builder, int i) {
    }

    public void applyCustomWB(Builder builder, int i) {
    }

    public void applyCustomWaterMark(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.CUSTOM_WATERMARK_TEXT, str);
    }

    public void applyDepurpleEnable(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.DEPURPLE, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyDeviceOrientation(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.DEVICE_ORIENTATION, Integer.valueOf(i));
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
    }

    public void applyExposureTime(Builder builder, long j) {
        if (j > 0) {
            builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(0));
            builder.set(CaptureRequest.SENSOR_EXPOSURE_TIME, Long.valueOf(j));
            return;
        }
        builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
    }

    public void applyEyeLight(Builder builder, int i, int i2) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.EYE_LIGHT_TYPE, Integer.valueOf(i));
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.EYE_LIGHT_STRENGTH, Integer.valueOf(i2));
    }

    public void applyFNumber(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.BOKEH_F_NUMBER, str);
    }

    public void applyFaceAnalyzeAge(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.FACE_AGE_ANALYZE_ENABLED, Boolean.valueOf(z));
    }

    public void applyFaceScore(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.FACE_SCORE_ENABLED, Boolean.valueOf(z));
    }

    public void applyFaceWaterMark(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.WATERMARK_FACE, str);
    }

    public void applyFrontMirror(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.FRONT_MIRROR, Boolean.valueOf(z));
    }

    public void applyHDR(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.HDR_ENABLED, Boolean.valueOf(z));
    }

    public void applyHDRCheckerEnable(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.HDR_CHECKER_ENABLE, Boolean.valueOf(z));
    }

    public void applyHFRDeflicker(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.DEFLICKER_ENABLED, Boolean.valueOf(z));
    }

    public void applyHHT(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.HHT_ENABLED, Boolean.valueOf(z));
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
    }

    public void applyISO(Builder builder, int i) {
        builder.set(CaptureRequest.SENSOR_SENSITIVITY, Integer.valueOf(i));
    }

    public void applyIsHfrPreview(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.IS_HFR_PREVIEW, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyLensDirtyDetect(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.LENS_DIRTY_DETECT, Boolean.valueOf(z));
    }

    public void applyMacroMode(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.MACRO_MODE, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyMfnr(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applyMiBokeh(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.FRONT_SINGLE_CAMERA_BOKEH, Boolean.valueOf(z));
    }

    public void applyMultiFrameInputNum(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.MULTIFRAME_INPUTNUM, Integer.valueOf(i));
    }

    public void applyNormalWideLDC(Builder builder, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("applyNormalWideLDC: ");
        sb.append(z);
        Log.d("MiCameraCompat", sb.toString());
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyParallelProcessEnable(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.PARALLEL_ENABLED, Boolean.valueOf(z));
    }

    public void applyParallelProcessPath(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.PARALLEL_PATH, str.getBytes());
    }

    public void applyPortraitLighting(Builder builder, int i) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.PORTRAIT_LIGHTING, Integer.valueOf(i));
    }

    public void applyRearBokeh(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.REAR_BOKEH_ENABLE, Boolean.valueOf(z));
    }

    public void applySaturation(Builder builder, int i) {
    }

    public void applySharpness(Builder builder, int i) {
    }

    public void applySnapshotTorch(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SNAP_SHOT_TORCH, Boolean.valueOf(z));
    }

    public void applyStFastZoomIn(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ST_FAST_ZOOM_IN, Boolean.valueOf(z));
    }

    public void applySuperNightScene(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SUPER_NIGHT_SCENE_ENABLED, Boolean.valueOf(z));
    }

    public void applySuperResolution(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SUPER_RESOLUTION_ENABLED, Boolean.valueOf(z));
    }

    public void applySwMfnr(Builder builder, boolean z) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.SW_MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applyTimeWaterMark(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.WATERMARK_TIME, str);
    }

    public void applyUltraWideLDC(Builder builder, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("applyUltraWideLDC: ");
        sb.append(z);
        Log.d("MiCameraCompat", sb.toString());
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
    }

    public void applyWaterMarkAppliedList(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.WATERMARK_APPLIEDTYPE, str);
    }

    public void applyWaterMarkType(Builder builder, String str) {
        VendorTagHelper.setValue(builder, CaptureRequestVendorTags.WATERMARK_APPLIEDTYPE, str);
    }

    public VendorTag<Key<StreamConfiguration[]>> getDefaultSteamConfigurationsTag() {
        return null;
    }
}
