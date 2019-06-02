package com.android.camera.constant;

import com.android.camera.CameraSettings;
import com.android.camera.module.ModuleManager;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class BeautyConstant {
    public static final int AI_HUMAN_BEAUTY_SMOOTH_LEVEL = 10;
    public static final String[] BEAUTY_CATEGORY_BACK_FIGURE = {"pref_beauty_whole_body_slim_ratio", "key_beauty_leg_slim_ratio", "pref_beauty_head_slim_ratio", "pref_beauty_body_slim_ratio", "pref_beauty_shoulder_slim_ratio"};
    public static final String[] BEAUTY_CATEGORY_FRONT_ADVANCE = {"pref_beautify_skin_smooth_ratio_key", "pref_beautify_slim_face_ratio_key", "pref_beautify_enlarge_eye_ratio_key", "pref_beautify_skin_color_ratio_key"};
    public static final String[] BEAUTY_CATEGORY_FRONT_MAKEUP = {"pref_beautify_eyebrow_dye_ratio_key", "pref_beautify_pupil_line_ratio_key", "pref_beautify_jelly_lips_ratio_key", "pref_eye_light_type_key", "pref_beautify_blusher_ratio_key"};
    public static final String[] BEAUTY_CATEGORY_FRONT_REMODELING = {"pref_beautify_slim_face_ratio_key", "pref_beautify_enlarge_eye_ratio_key", "pref_beautify_nose_ratio_key", "pref_beautify_chin_ratio_key", "pref_beautify_lips_ratio_key", "pref_beautify_risorius_ratio_key", "pref_beautify_neck_ratio_key", "pref_beautify_smile_ratio_key", "pref_beautify_slim_nose_ratio_key", "pref_beautify_hairline_ratio_key"};
    public static final String[] BEAUTY_CATEGORY_LEVEL = {"pref_beautify_level_key_capture", "pref_beautify_skin_smooth_ratio_key"};
    public static final String[] BEAUTY_CATEGORY_LIVE = {"key_live_shrink_face_ratio", "key_live_enlarge_eye_ratio", "key_live_smooth_strength"};
    public static final int BEAUTY_INVALID_VALUE = 0;
    public static final String BEAUTY_LEVEL = "pref_beautify_level_key_capture";
    public static final String BEAUTY_RESET = "RESET";
    public static final String BLUSHER_RATIO = "pref_beautify_blusher_ratio_key";
    public static final String BODY_SLIM_RATIO = "pref_beauty_body_slim_ratio";
    public static final String BUTT_SLIM_RATIO = "pref_beauty_butt_slim_ratio";
    public static final String CHIN_RATIO = "pref_beautify_chin_ratio_key";
    public static final String ENLARGE_EYE_RATIO = "pref_beautify_enlarge_eye_ratio_key";
    public static final String EYEBROW_DYE_RATIO = "pref_beautify_eyebrow_dye_ratio_key";
    public static final String EYE_LIGHT = "pref_eye_light_type_key";
    public static final String HAIRLINE_RATIO = "pref_beautify_hairline_ratio_key";
    public static final String HEAD_SLIM_RATIO = "pref_beauty_head_slim_ratio";
    public static final String JELLY_LIPS_RATIO = "pref_beautify_jelly_lips_ratio_key";
    public static final String LEG_SLIM_RATIO = "key_beauty_leg_slim_ratio";
    public static final String LEVEL_CLOSE = "i:0";
    public static final String LEVEL_HIGH = "i:3";
    public static final String LEVEL_LOW = "i:1";
    public static final String LEVEL_MEDIUM = "i:2";
    public static final String LEVEL_XHIGH = "i:4";
    public static final String LEVEL_XXHIGH = "i:5";
    public static final String LEVEL_XXXHIGH = "i:6";
    public static final String LIPS_RATIO = "pref_beautify_lips_ratio_key";
    public static final String LIVE_ENLARGE_EYE_RATIO = "key_live_enlarge_eye_ratio";
    public static final String LIVE_SHRINK_FACE_RATIO = "key_live_shrink_face_ratio";
    public static final String LIVE_SMOOTH_STRENGTH = "key_live_smooth_strength";
    public static final String NECK_RATIO = "pref_beautify_neck_ratio_key";
    public static final String NOSE_RATIO = "pref_beautify_nose_ratio_key";
    public static final String PREFIX_BEAUTY_LEVEL = "i:";
    public static final String PUPIL_LINE_RATIO = "pref_beautify_pupil_line_ratio_key";
    public static final String RISORIUS_RATIO = "pref_beautify_risorius_ratio_key";
    public static final String SHOULDER_SLIM_RATIO = "pref_beauty_shoulder_slim_ratio";
    public static final String SHRINK_FACE_RATIO = "pref_beautify_slim_face_ratio_key";
    public static final String SLIM_NOSE_RATIO = "pref_beautify_slim_nose_ratio_key";
    public static final String SMILE_RATIO = "pref_beautify_smile_ratio_key";
    public static final String SMOOTH_STRENGTH = "pref_beautify_skin_smooth_ratio_key";
    public static final int VERSION_DEPEND_LEVEL = 2;
    public static final int VERSION_DEPEND_SMOOTH_SKIN = 3;
    public static final int VERSION_LEGACY = 1;
    public static final String WHITEN_STRENGTH = "pref_beautify_skin_color_ratio_key";
    public static final String WHOLE_BODY_SLIM_RATIO = "pref_beauty_whole_body_slim_ratio";

    @Retention(RetentionPolicy.SOURCE)
    public @interface BeautyVersion {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface Type {
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static int getDefaultValueByKey(String str) {
        char c;
        int i = 3;
        switch (str.hashCode()) {
            case -2110473153:
                if (str.equals("key_live_smooth_strength")) {
                    c = 5;
                    break;
                }
            case 175697132:
                if (str.equals("key_live_shrink_face_ratio")) {
                    c = 3;
                    break;
                }
            case 823300807:
                if (str.equals("pref_beautify_level_key_capture")) {
                    c = 0;
                    break;
                }
            case 894643879:
                if (str.equals("pref_beautify_slim_face_ratio_key")) {
                    c = 2;
                    break;
                }
            case 917154040:
                if (str.equals("pref_beautify_skin_smooth_ratio_key")) {
                    c = 1;
                    break;
                }
            case 1771202045:
                if (str.equals("key_live_enlarge_eye_ratio")) {
                    c = 4;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        int i2 = 40;
        switch (c) {
            case 0:
                if (ModuleManager.isVideoModule()) {
                    return 0;
                }
                if (!CameraSettings.isFrontCamera()) {
                    i = 0;
                }
                return i;
            case 1:
                if (ModuleManager.isVideoModule()) {
                    return 0;
                }
                if (!CameraSettings.isFrontCamera()) {
                    i2 = 0;
                }
                return i2;
            case 2:
                if (!CameraSettings.isFrontCamera()) {
                    i2 = 0;
                }
                return i2;
            case 3:
            case 4:
            case 5:
                return 40;
            default:
                return 0;
        }
    }

    public static int getLevelInteger(String str) {
        try {
            return Integer.valueOf(str.split(":")[1]).intValue();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0038 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:18:0x0039 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:19:0x003a A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x003b A[RETURN] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isLiveBeautyModeKey(String str) {
        char c;
        int hashCode = str.hashCode();
        if (hashCode == -2110473153) {
            if (str.equals("key_live_smooth_strength")) {
                c = 2;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                }
            }
        } else if (hashCode == 175697132) {
            if (str.equals("key_live_shrink_face_ratio")) {
                c = 0;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                }
            }
        } else if (hashCode == 1771202045 && str.equals("key_live_enlarge_eye_ratio")) {
            c = 1;
            switch (c) {
                case 0:
                    return true;
                case 1:
                    return true;
                case 2:
                    return true;
                default:
                    return false;
            }
        }
        c = 65535;
        switch (c) {
            case 0:
                break;
            case 1:
                break;
            case 2:
                break;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0029 A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x002a A[RETURN] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static boolean isSupportTwoWayAdjustable(String str) {
        char c;
        int hashCode = str.hashCode();
        if (hashCode == -310919472) {
            if (str.equals("pref_beautify_lips_ratio_key")) {
                c = 1;
                switch (c) {
                    case 0:
                    case 1:
                        break;
                }
            }
        } else if (hashCode == -271212966 && str.equals("pref_beautify_chin_ratio_key")) {
            c = 0;
            switch (c) {
                case 0:
                case 1:
                    return true;
                default:
                    return false;
            }
        }
        c = 65535;
        switch (c) {
            case 0:
            case 1:
                break;
        }
    }

    public static String warppedSettingForLive(String str) {
        return str;
    }

    public static String wrappedSettingKey(String str) {
        int activeModuleIndex = ModuleManager.getActiveModuleIndex();
        if (activeModuleIndex == 161) {
            return wrappedSettingKeyForFun(str);
        }
        if (!(activeModuleIndex == 163 || activeModuleIndex == 165 || activeModuleIndex == 167)) {
            if (activeModuleIndex == 171) {
                return wrappedSettingKeyForPortrait(str);
            }
            switch (activeModuleIndex) {
                case 173:
                case 175:
                    break;
                case 174:
                    return warppedSettingForLive(str);
                case 176:
                    return wrappedSettingKeyForWideSelfie(str);
                case 177:
                    return wrappedSettingKeyForMimoji(str);
                default:
                    return wrappedSettingKeyForVideo(str);
            }
        }
        return wrappedSettingKeyForCapture(str);
    }

    public static String wrappedSettingKeyForCapture(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(163);
        sb.append(str);
        return sb.toString();
    }

    public static String wrappedSettingKeyForFun(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(161);
        sb.append(str);
        return sb.toString();
    }

    public static String wrappedSettingKeyForMimoji(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(177);
        sb.append(str);
        return sb.toString();
    }

    public static String wrappedSettingKeyForPortrait(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(171);
        sb.append(str);
        return sb.toString();
    }

    public static String wrappedSettingKeyForVideo(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(162);
        sb.append(str);
        return sb.toString();
    }

    public static String wrappedSettingKeyForWideSelfie(String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(176);
        sb.append(str);
        return sb.toString();
    }
}
