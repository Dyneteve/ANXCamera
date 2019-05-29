package com.android.camera2.compat;

import android.annotation.TargetApi;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera2.CaptureResultParser;
import com.android.camera2.autozoom.AutoZoomTags.TAG;
import com.mi.config.b;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;

@TargetApi(21)
public class MiCameraCompatBaseImpl {
    private static final Key<Boolean> AI_SCENE = genBooleanRequestKey(CaptureResultParser.VENDOR_TAG_ASD_ENABLE);
    private static final Key<Integer> AI_SCENE_APPLY = genIntegerRequestKey("xiaomi.ai.asd.sceneApplied");
    private static final Key<int[]> AI_SCENE_AVAILABLE_MODES = genRequestKey("xiaomi.ai.asd.availableSceneMode", int[].class);
    private static final Key<Integer> AI_SCENE_PERIOD = genIntegerRequestKey("xiaomi.ai.asd.period");
    public static final Key<Integer> BEAUTY_BLUSHER = genIntegerRequestKey("xiaomi.beauty.blushRatio");
    private static final Key<Integer> BEAUTY_BODY_SLIM = genIntegerRequestKey("xiaomi.beauty.bodySlimRatio");
    public static final Key<Integer> BEAUTY_CHIN = genIntegerRequestKey("xiaomi.beauty.chinRatio");
    public static final Key<Integer> BEAUTY_ENLARGE_EYE = genIntegerRequestKey("xiaomi.beauty.enlargeEyeRatio");
    public static final Key<Integer> BEAUTY_EYEBROW_DYE = genIntegerRequestKey("xiaomi.beauty.eyeBrowDyeRatio");
    private static final Key<Integer> BEAUTY_HEAD_SLIM = genIntegerRequestKey("xiaomi.beauty.headSlimRatio");
    public static final Key<Integer> BEAUTY_JELLY_LIPS = genIntegerRequestKey("xiaomi.beauty.lipGlossRatio");
    private static final Key<Integer> BEAUTY_LEG_SLIM = genIntegerRequestKey("xiaomi.beauty.legSlimRatio");
    public static final Key<String> BEAUTY_LEVEL = genStringRequestKey("xiaomi.beauty.beautyLevelApplied");
    public static final Key<Integer> BEAUTY_LIPS = genIntegerRequestKey("xiaomi.beauty.lipsRatio");
    public static final Key<Integer> BEAUTY_NECK = genIntegerRequestKey("xiaomi.beauty.neckRatio");
    public static final Key<Integer> BEAUTY_NOSE = genIntegerRequestKey("xiaomi.beauty.noseRatio");
    public static final Key<Integer> BEAUTY_PUPIL_LINE = genIntegerRequestKey("xiaomi.beauty.pupilLineRatio");
    public static final Key<Integer> BEAUTY_RISORIUS = genIntegerRequestKey("xiaomi.beauty.risoriusRatio");
    private static final Key<Integer> BEAUTY_SHOULDER_SLIM = genIntegerRequestKey("xiaomi.beauty.shoulderSlimRatio");
    public static final Key<Integer> BEAUTY_SKIN_COLOR = genIntegerRequestKey("xiaomi.beauty.skinColorRatio");
    public static final Key<Integer> BEAUTY_SKIN_SMOOTH = genIntegerRequestKey("xiaomi.beauty.skinSmoothRatio");
    public static final Key<Integer> BEAUTY_SLIM_FACE = genIntegerRequestKey("xiaomi.beauty.slimFaceRatio");
    public static final Key<Integer> BEAUTY_SLIM_NOSE = genIntegerRequestKey("xiaomi.beauty.slimNoseRatio");
    public static final Key<Integer> BEAUTY_SMILE = genIntegerRequestKey("xiaomi.beauty.smileRatio");
    private static final HashMap<String, Key<Integer>> BEAUTY_TYPE_MAP = new HashMap<>();
    public static final Key<String> BOKEH_F_NUMBER = genStringRequestKey("xiaomi.bokeh.fNumberApplied");
    public static final Key<Integer> BURST_CAPTURE_HINT = genIntegerRequestKey("xiaomi.burst.captureHint");
    public static final Key<Integer> BURST_SHOOT_FPS = genIntegerRequestKey("xiaomi.burst.shootFPS");
    public static final Key<Integer> BUTT_SLIM = genIntegerRequestKey("xiaomi.beauty.buttPlumpSlimRatio");
    public static final Key<Byte> CAMERA_AI_30 = genByteRequestKey("xiaomi.ai.segment.enabled");
    public static final Key<Boolean> DEFLICKER_ENABLED = genBooleanRequestKey("xiaomi.node.hfr.deflicker.enabled");
    public static final Key<Byte> DEPURPLE_TAG = genByteRequestKey("xiaomi.depurple.enabled");
    public static final Key<Integer> DEVICE_ORIENTATION = genIntegerRequestKey("xiaomi.device.orientation");
    private static final Key<Integer> EYE_LIGHT_STRENGTH = genIntegerRequestKey("xiaomi.beauty.eyeLightStrength");
    private static final Key<Integer> EYE_LIGHT_TYPE = genIntegerRequestKey("xiaomi.beauty.eyeLightType");
    public static final Key<Boolean> FACE_AGE_ANALYZE_ENABLED = genBooleanRequestKey("xiaomi.faceGenderAndAge.enabled");
    public static final Key<Boolean> FACE_SCORE_ENABLED = genBooleanRequestKey("xiaomi.faceScore.enabled");
    public static final Key<Boolean> FRONT_MIRROR = genBooleanRequestKey("xiaomi.flip.enabled");
    public static final Key<Boolean> FRONT_SINGLE_CAMERA_BOKEH = genBooleanRequestKey("xiaomi.bokeh.enabled");
    public static final Key<Boolean> HDR_CHECKER_ENABLE = genBooleanRequestKey("xiaomi.hdr.hdrChecker.enabled");
    public static final Key<Boolean> HDR_ENABLED = genBooleanRequestKey("xiaomi.hdr.enabled");
    public static final Key<Boolean> HHT_ENABLED = genBooleanRequestKey("xiaomi.hht.enabled");
    private static final Key<Byte> IS_HFR_PREVIEW = genByteRequestKey("xiaomi.hfrPreview.isHFRPreview");
    private static final Key<Byte> KEY_MACRO_MODE = genByteRequestKey("xiaomi.MacroMode.enabled");
    private static final Key<Integer> KEY_MULTIFRAME_INPUTNUM = genIntegerRequestKey(CaptureResultParser.VENDOR_TAG_MULTIFRAME_INPUTNUM);
    public static final Key<Boolean> LENS_DIRTY_DETECT = genBooleanRequestKey("xiaomi.ai.add.enabled");
    public static final Key<Boolean> MFNR_ENABLED = genBooleanRequestKey("xiaomi.mfnr.enabled");
    public static final Key<Byte> NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL = genByteRequestKey("xiaomi.distortion.distortionLevelApplied");
    public static final Key<Boolean> PARALLEL_ENABLED = genBooleanRequestKey("xiaomi.parallel.enabled");
    public static final Key<byte[]> PARALLEL_PATH = genByteArrayRequestKey("xiaomi.parallel.path");
    public static final Key<Integer> PORTRAIT_LIGHTING = genIntegerRequestKey("xiaomi.portrait.lighting");
    public static final Key<Boolean> REAR_BOKEH_ENABLE = genBooleanRequestKey("xiaomi.bokehrear.enabled");
    public static final Key<Boolean> SNAP_SHOT_TORCH = genBooleanRequestKey("xiaomi.snapshotTorch.enabled");
    public static final Key<Boolean> ST_FAST_ZOOM_IN = genBooleanRequestKey("xiaomi.smoothTransition.fastZoomIn");
    public static final Key<Boolean> SUPER_NIGHT_SCENE_ENABLED = genBooleanRequestKey("xiaomi.supernight.enabled");
    public static final Key<Boolean> SUPER_RESOLUTION_ENABLED = genBooleanRequestKey(CaptureResultParser.VENDOR_TAG_SUPER_RESOLUTION_ENABLED);
    public static final Key<Boolean> SW_MFNR_ENABLED = genBooleanRequestKey("xiaomi.swmf.enabled");
    public static final Key<Byte> ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL = genByteRequestKey("xiaomi.distortion.ultraWideDistortionLevel");
    public static final Key<String> WATERMARK_APPLIEDTYPE = genStringRequestKey("xiaomi.watermark.typeApplied");
    public static final Key<String> WATERMARK_AVAILABLETYPE = genStringRequestKey("xiaomi.watermark.availableType");
    public static final Key<String> WATERMARK_FACE = genStringRequestKey("xiaomi.watermark.face");
    public static final Key<String> WATERMARK_TIME = genStringRequestKey("xiaomi.watermark.time");
    public static final Key<Integer> WHOLE_BODY_SLIM = genIntegerRequestKey("xiaomi.beauty.oneKeySlimRatio");
    public static final Key<Byte> XIAOMI_BACKWARD_CAPTURE_HINT = genByteRequestKey("xiaomi.snapshot.backwardfetchframe.enabled");

    static {
        BEAUTY_TYPE_MAP.put("pref_beautify_skin_color_ratio_key", BEAUTY_SKIN_COLOR);
        BEAUTY_TYPE_MAP.put("pref_beautify_slim_face_ratio_key", BEAUTY_SLIM_FACE);
        BEAUTY_TYPE_MAP.put("pref_beautify_enlarge_eye_ratio_key", BEAUTY_ENLARGE_EYE);
        BEAUTY_TYPE_MAP.put("pref_beautify_skin_smooth_ratio_key", BEAUTY_SKIN_SMOOTH);
        BEAUTY_TYPE_MAP.put("pref_beautify_nose_ratio_key", BEAUTY_NOSE);
        BEAUTY_TYPE_MAP.put("pref_beautify_risorius_ratio_key", BEAUTY_RISORIUS);
        BEAUTY_TYPE_MAP.put("pref_beautify_lips_ratio_key", BEAUTY_LIPS);
        BEAUTY_TYPE_MAP.put("pref_beautify_chin_ratio_key", BEAUTY_CHIN);
        BEAUTY_TYPE_MAP.put("pref_beautify_neck_ratio_key", BEAUTY_NECK);
        BEAUTY_TYPE_MAP.put("pref_beautify_smile_ratio_key", BEAUTY_SMILE);
        BEAUTY_TYPE_MAP.put("pref_beautify_slim_nose_ratio_key", BEAUTY_SLIM_NOSE);
        BEAUTY_TYPE_MAP.put("pref_beautify_eyebrow_dye_ratio_key", BEAUTY_EYEBROW_DYE);
        BEAUTY_TYPE_MAP.put("pref_beautify_pupil_line_ratio_key", BEAUTY_PUPIL_LINE);
        BEAUTY_TYPE_MAP.put("pref_beautify_jelly_lips_ratio_key", BEAUTY_JELLY_LIPS);
        BEAUTY_TYPE_MAP.put("pref_beautify_blusher_ratio_key", BEAUTY_BLUSHER);
        BEAUTY_TYPE_MAP.put("pref_beauty_head_slim_ratio", BEAUTY_HEAD_SLIM);
        BEAUTY_TYPE_MAP.put("pref_beauty_body_slim_ratio", BEAUTY_BODY_SLIM);
        BEAUTY_TYPE_MAP.put("pref_beauty_shoulder_slim_ratio", BEAUTY_SHOULDER_SLIM);
        BEAUTY_TYPE_MAP.put("key_beauty_leg_slim_ratio", BEAUTY_LEG_SLIM);
        BEAUTY_TYPE_MAP.put("pref_beauty_whole_body_slim_ratio", WHOLE_BODY_SLIM);
    }

    static Key<Boolean> genBooleanRequestKey(String str) {
        return genRequestKey(str, Boolean.class);
    }

    static Key<byte[]> genByteArrayRequestKey(String str) {
        return genRequestKey(str, byte[].class);
    }

    static Key<Byte> genByteRequestKey(String str) {
        return genRequestKey(str, Byte.class);
    }

    static Key<Integer> genIntegerRequestKey(String str) {
        return genRequestKey(str, Integer.class);
    }

    static <T> Key<T> genRequestKey(String str, Class<T> cls) {
        return new Key<>(str, cls);
    }

    static Key<String> genStringRequestKey(String str) {
        return genRequestKey(str, String.class);
    }

    public void applyASDEnable(Builder builder, boolean z) {
        builder.set(AI_SCENE, Boolean.valueOf(z));
    }

    public void applyASDScene(Builder builder, int i) {
        builder.set(AI_SCENE_APPLY, Integer.valueOf(i));
    }

    public void applyAiScenePeriod(Builder builder, int i) {
        builder.set(AI_SCENE_PERIOD, Integer.valueOf(i));
    }

    public void applyAutoZoomMode(Builder builder, int i) {
        builder.set(TAG.MODE.toCaptureRequestKey(), Integer.valueOf(i));
    }

    public void applyAutoZoomScaleOffset(Builder builder, float f) {
        builder.set(TAG.SCALE_OFFSET.toCaptureRequestKey(), Float.valueOf(f));
    }

    public void applyBackwardCaptureHint(Builder builder, byte b) {
        builder.set(XIAOMI_BACKWARD_CAPTURE_HINT, Byte.valueOf(b));
    }

    public void applyBeautyParameter(Builder builder, HashSet<String> hashSet, BeautyValues beautyValues) {
        builder.set(BEAUTY_LEVEL, beautyValues.mBeautyLevel);
        if (b.iz()) {
            for (Entry entry : BEAUTY_TYPE_MAP.entrySet()) {
                Key key = (Key) entry.getValue();
                if (hashSet.contains(key.getName())) {
                    builder.set(key, Integer.valueOf(beautyValues.getValueByType((String) entry.getKey())));
                }
            }
            return;
        }
        builder.set(BEAUTY_SKIN_COLOR, Integer.valueOf(beautyValues.mBeautySkinColor));
        builder.set(BEAUTY_SLIM_FACE, Integer.valueOf(beautyValues.mBeautySlimFace));
        builder.set(BEAUTY_SKIN_SMOOTH, Integer.valueOf(beautyValues.mBeautySkinSmooth));
        builder.set(BEAUTY_ENLARGE_EYE, Integer.valueOf(beautyValues.mBeautyEnlargeEye));
    }

    public void applyBurstFps(Builder builder, int i) {
        builder.set(BURST_SHOOT_FPS, Integer.valueOf(i));
    }

    public void applyBurstHint(Builder builder, int i) {
        builder.set(BURST_CAPTURE_HINT, Integer.valueOf(i));
    }

    public void applyCameraAi30Enable(Builder builder, boolean z) {
        builder.set(CAMERA_AI_30, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyContrast(Builder builder, int i) {
        throw new RuntimeException("unSupported Contrast");
    }

    public void applyCustomWB(Builder builder, int i) {
        throw new RuntimeException("unSupported CustomWb");
    }

    public void applyDepurpleEnable(Builder builder, boolean z) {
        builder.set(DEPURPLE_TAG, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyDeviceOrientation(Builder builder, int i) {
        builder.set(DEVICE_ORIENTATION, Integer.valueOf(i));
    }

    public void applyExposureMeteringMode(Builder builder, int i) {
        throw new RuntimeException("unSupported ExposureMeteringMode");
    }

    public void applyExposureTime(Builder builder, long j) {
        if (j > 0) {
            builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(0));
            builder.set(CaptureRequest.SENSOR_EXPOSURE_TIME, Long.valueOf(j));
            return;
        }
        builder.set(CaptureRequest.CONTROL_MODE, (Integer) builder.get(CaptureRequest.CONTROL_MODE));
    }

    public void applyEyeLight(Builder builder, int i, int i2) {
        builder.set(EYE_LIGHT_TYPE, Integer.valueOf(i));
        builder.set(EYE_LIGHT_STRENGTH, Integer.valueOf(i2));
    }

    public void applyFNumber(Builder builder, String str) {
        builder.set(BOKEH_F_NUMBER, str);
    }

    public void applyFaceAnalyzeAge(Builder builder, boolean z) {
        builder.set(FACE_AGE_ANALYZE_ENABLED, Boolean.valueOf(z));
    }

    public void applyFaceScore(Builder builder, boolean z) {
        builder.set(FACE_SCORE_ENABLED, Boolean.valueOf(z));
    }

    public void applyFaceWaterMark(Builder builder, String str) {
        builder.set(WATERMARK_FACE, str);
    }

    public void applyFrontMirror(Builder builder, boolean z) {
        builder.set(FRONT_MIRROR, Boolean.valueOf(z));
    }

    public void applyHDR(Builder builder, boolean z) {
        builder.set(HDR_ENABLED, Boolean.valueOf(z));
    }

    public void applyHDRCheckerEnable(Builder builder, boolean z) {
        builder.set(HDR_CHECKER_ENABLE, Boolean.valueOf(z));
    }

    public void applyHFRDeflicker(Builder builder, boolean z) {
        try {
            builder.set(DEFLICKER_ENABLED, Boolean.valueOf(z));
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("not support (");
            sb.append(DEFLICKER_ENABLED);
            sb.append(")");
            Log.e("applyHFRDeflicker", sb.toString());
        }
    }

    public void applyHHT(Builder builder, boolean z) {
        builder.set(HHT_ENABLED, Boolean.valueOf(z));
    }

    public void applyHdrBracketMode(Builder builder, byte b) {
        throw new RuntimeException("unSupported action");
    }

    public void applyISO(Builder builder, int i) {
        builder.set(CaptureRequest.SENSOR_SENSITIVITY, Integer.valueOf(i));
    }

    public void applyIsHfrPreview(Builder builder, boolean z) {
        builder.set(IS_HFR_PREVIEW, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyLensDirtyDetect(Builder builder, boolean z) {
        builder.set(LENS_DIRTY_DETECT, Boolean.valueOf(z));
    }

    public void applyMacroMode(Builder builder, boolean z) {
        try {
            builder.set(KEY_MACRO_MODE, Byte.valueOf(z ? (byte) 1 : 0));
        } catch (Exception e) {
            StringBuilder sb = new StringBuilder();
            sb.append("not support (");
            sb.append(KEY_MACRO_MODE);
            sb.append(")");
            Log.e("macro_mode", sb.toString());
        }
    }

    public void applyMfnr(Builder builder, boolean z) {
        builder.set(MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applyMiBokeh(Builder builder, boolean z) {
        builder.set(FRONT_SINGLE_CAMERA_BOKEH, Boolean.valueOf(z));
    }

    public void applyMultiFrameInputNum(Builder builder, int i) {
        builder.set(KEY_MULTIFRAME_INPUTNUM, Integer.valueOf(i));
    }

    public void applyNormalWideLDC(Builder builder, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("applyNormalWideLDC: ");
        sb.append(z);
        Log.d("MiCameraCompat", sb.toString());
        builder.set(NORMAL_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyParallelProcessEnable(Builder builder, boolean z) {
        builder.set(PARALLEL_ENABLED, Boolean.valueOf(z));
    }

    public void applyParallelProcessPath(Builder builder, String str) {
        builder.set(PARALLEL_PATH, str.getBytes());
    }

    public void applyPortraitLighting(Builder builder, int i) {
        builder.set(PORTRAIT_LIGHTING, Integer.valueOf(i));
    }

    public void applyRearBokeh(Builder builder, boolean z) {
        builder.set(REAR_BOKEH_ENABLE, Boolean.valueOf(z));
    }

    public void applySaturation(Builder builder, int i) {
        throw new RuntimeException("unSupported Saturation");
    }

    public void applySharpness(Builder builder, int i) {
        throw new RuntimeException("unSupported Sharpness");
    }

    public void applySnapshotTorch(Builder builder, boolean z) {
        builder.set(SNAP_SHOT_TORCH, Boolean.valueOf(z));
    }

    public void applyStFastZoomIn(Builder builder, boolean z) {
        builder.set(ST_FAST_ZOOM_IN, Boolean.valueOf(z));
    }

    public void applySuperNightScene(Builder builder, boolean z) {
        builder.set(SUPER_NIGHT_SCENE_ENABLED, Boolean.valueOf(z));
    }

    public void applySuperResolution(Builder builder, boolean z) {
        builder.set(SUPER_RESOLUTION_ENABLED, Boolean.valueOf(z));
    }

    public void applySwMfnr(Builder builder, boolean z) {
        builder.set(SW_MFNR_ENABLED, Boolean.valueOf(z));
    }

    public void applyTimeWaterMark(Builder builder, String str) {
        builder.set(WATERMARK_TIME, str);
    }

    public void applyUltraWideLDC(Builder builder, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("applyUltraWideLDC: ");
        sb.append(z);
        Log.d("MiCameraCompat", sb.toString());
        builder.set(ULTRA_WIDE_LENS_DISTORTION_CORRECTION_LEVEL, Byte.valueOf(z ? (byte) 1 : 0));
    }

    public void applyVideoStreamState(Builder builder, boolean z) {
    }

    public void applyWaterMarkAppliedList(Builder builder, String str) {
        builder.set(WATERMARK_APPLIEDTYPE, str);
    }

    public void applyWaterMarkType(Builder builder, String str) {
        builder.set(WATERMARK_APPLIEDTYPE, str);
    }

    public boolean supportBeautyType(HashSet<String> hashSet, String str) {
        if (BEAUTY_TYPE_MAP.containsKey(str)) {
            return hashSet.contains(((Key) BEAUTY_TYPE_MAP.get(str)).getName());
        }
        return false;
    }

    public boolean supportContrast(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportExtraHighSpeedVideoConfiguration(HashSet<String> hashSet) {
        return false;
    }

    public boolean supportEyeLight(HashSet<String> hashSet) {
        return hashSet.contains(EYE_LIGHT_TYPE.getName());
    }

    public boolean supportLensDirtyDetect(HashSet<String> hashSet) {
        return hashSet.contains(LENS_DIRTY_DETECT.getName());
    }
}
