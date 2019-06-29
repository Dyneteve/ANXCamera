package com.android.camera.fragment.beauty;

import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;

@Deprecated
public class CameraBeautyParameterType {
    public static final CameraBeautyParameterType BLUSHER_RATIO = new CameraBeautyParameterType(3, "pref_beautify_blusher_ratio_key");
    public static final CameraBeautyParameterType BODY_SLIM_RATIO = new CameraBeautyParameterType(5, "pref_beauty_body_slim_ratio");
    public static final CameraBeautyParameterType BODY_SMOOTH_STRENGTH = new CameraBeautyParameterType(5, "pref_beautify_skin_smooth_ratio_key");
    public static final CameraBeautyParameterType BUTT_SLIM_RATIO = new CameraBeautyParameterType(5, "pref_beauty_butt_slim_ratio");
    public static final CameraBeautyParameterType ENLARGE_EYE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_enlarge_eye_ratio_key");
    public static final CameraBeautyParameterType EYEBROW_DYE_RATIO = new CameraBeautyParameterType(3, "pref_beautify_eyebrow_dye_ratio_key");
    public static final CameraBeautyParameterType EYE_LIGHT = new CameraBeautyParameterType(4, "pref_eye_light_type_key");
    public static final CameraBeautyParameterType FACE_3D_CHIN_RATIO = new CameraBeautyParameterType(2, "pref_beautify_chin_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_ENLARGE_EYE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_enlarge_eye_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_LIPS_RATIO = new CameraBeautyParameterType(2, "pref_beautify_lips_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_NECK_RATIO = new CameraBeautyParameterType(2, "pref_beautify_neck_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_NOSE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_nose_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_RISORIUS_RATIO = new CameraBeautyParameterType(2, "pref_beautify_risorius_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_SHRINK_FACE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_slim_face_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_SLIM_NOSE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_slim_nose_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_SMILE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_smile_ratio_key");
    public static final CameraBeautyParameterType FACE_3D_SMOOTH_STRENGTH = new CameraBeautyParameterType(2, "pref_beautify_skin_smooth_ratio_key");
    public static final CameraBeautyParameterType HEAD_SLIM_RATIO = new CameraBeautyParameterType(5, "pref_beauty_head_slim_ratio");
    public static final CameraBeautyParameterType JELLY_LIPS_RATIO = new CameraBeautyParameterType(3, "pref_beautify_jelly_lips_ratio_key");
    public static final CameraBeautyParameterType LEG_SLIM_RATIO = new CameraBeautyParameterType(5, "key_beauty_leg_slim_ratio");
    public static final CameraBeautyParameterType LIVE_ENLARGE_EYE_RATIO = new CameraBeautyParameterType(7, "key_live_enlarge_eye_ratio");
    public static final CameraBeautyParameterType LIVE_SHRINK_FACE_RATIO = new CameraBeautyParameterType(7, "key_live_shrink_face_ratio");
    public static final CameraBeautyParameterType LIVE_SMOOTH_STRENGTH = new CameraBeautyParameterType(7, "key_live_smooth_strength");
    public static final CameraBeautyParameterType PUPIL_LINE_RATIO = new CameraBeautyParameterType(3, "pref_beautify_pupil_line_ratio_key");
    public static final CameraBeautyParameterType RESET = new CameraBeautyParameterType(3, BeautyConstant.BEAUTY_RESET);
    public static final CameraBeautyParameterType SHOULDER_SLIM_RATIO = new CameraBeautyParameterType(5, "pref_beauty_shoulder_slim_ratio");
    public static final CameraBeautyParameterType SHRINK_FACE_RATIO = new CameraBeautyParameterType(2, "pref_beautify_slim_face_ratio_key");
    public static final CameraBeautyParameterType SMOOTH_STRENGTH = new CameraBeautyParameterType(2, "pref_beautify_skin_smooth_ratio_key");
    public static final CameraBeautyParameterType WHITEN_STRENGTH = new CameraBeautyParameterType(2, "pref_beautify_skin_color_ratio_key");
    public static final CameraBeautyParameterType WHOLE_BODY_SLIM_RATIO = new CameraBeautyParameterType(5, "pref_beauty_whole_body_slim_ratio");
    public String beautyParamType;
    public int beautyType;
    @ShineType
    public int shineType;

    private CameraBeautyParameterType(int i, String str) {
        this.beautyType = i;
        this.beautyParamType = str;
    }
}
