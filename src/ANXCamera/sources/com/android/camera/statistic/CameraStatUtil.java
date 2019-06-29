package com.android.camera.statistic;

import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.text.TextUtils;
import android.util.SparseArray;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.MutexModeManager;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.data.data.runing.ComponentRunningTimer;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.mi.config.b;
import com.miui.filtersdk.filter.helper.FilterType;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class CameraStatUtil {
    private static final String AUTO = "auto";
    public static final String AUTO_OFF = "auto-off";
    public static final String AUTO_ON = "auto-on";
    public static final String NONE = "none";
    private static final String OTHERS = "others";
    private static final String TAG = CameraStatUtil.class.getSimpleName();
    private static HashMap<String, String> sBeautyTypeToName = new HashMap<>();
    private static SparseArray<String> sCameraModeIdToName = new SparseArray<>();
    private static SparseArray<String> sExposureTimeLessThan1sToName = new SparseArray<>();
    private static SparseArray<String> sFilterTypeToName = new SparseArray<>();
    private static SparseArray<String> sPictureQualityIndexToName = new SparseArray<>();
    private static SparseArray<String> sTriggerModeIdToName = new SparseArray<>();

    static {
        sCameraModeIdToName.put(161, "小视频");
        sCameraModeIdToName.put(174, "Live视频");
        sCameraModeIdToName.put(177, "萌拍");
        sCameraModeIdToName.put(163, "拍照");
        sCameraModeIdToName.put(165, CameraStat.PARAM_SQUARE);
        sCameraModeIdToName.put(167, "手动");
        sCameraModeIdToName.put(171, "人像");
        sCameraModeIdToName.put(166, "全景");
        sCameraModeIdToName.put(176, "全景");
        sCameraModeIdToName.put(172, "慢动作");
        sCameraModeIdToName.put(168, "慢动作");
        sCameraModeIdToName.put(162, "录像");
        sCameraModeIdToName.put(169, "录像");
        sCameraModeIdToName.put(170, "录像");
        sCameraModeIdToName.put(173, "夜景");
        sCameraModeIdToName.put(175, "超清");
        sTriggerModeIdToName.put(10, "拍照键");
        sTriggerModeIdToName.put(20, CameraStat.ZOOM_MODE_VOLUME);
        sTriggerModeIdToName.put(30, "指纹");
        sTriggerModeIdToName.put(40, "相机键");
        sTriggerModeIdToName.put(50, "dpad键");
        sTriggerModeIdToName.put(60, "物体追踪");
        sTriggerModeIdToName.put(70, "声控快门");
        sTriggerModeIdToName.put(80, "长按屏幕");
        sTriggerModeIdToName.put(90, "曝光环");
        sTriggerModeIdToName.put(100, CameraStat.PARAM_PALM_SHUTTER);
        sPictureQualityIndexToName.put(0, "最低");
        sPictureQualityIndexToName.put(1, "更低");
        sPictureQualityIndexToName.put(2, "低");
        sPictureQualityIndexToName.put(3, "标准");
        sPictureQualityIndexToName.put(4, "高");
        sPictureQualityIndexToName.put(5, "更高");
        sPictureQualityIndexToName.put(6, "最高");
        sExposureTimeLessThan1sToName.put(0, "auto");
        sExposureTimeLessThan1sToName.put(1000, "1/1000s");
        sExposureTimeLessThan1sToName.put(2000, "1/500s");
        sExposureTimeLessThan1sToName.put(4000, "1/250s");
        sExposureTimeLessThan1sToName.put(5000, "1/250s");
        sExposureTimeLessThan1sToName.put(BaseModule.LENS_DIRTY_DETECT_HINT_DURATION, "1/125s");
        sExposureTimeLessThan1sToName.put(16667, "1/60s");
        sExposureTimeLessThan1sToName.put(33333, "1/30s");
        sExposureTimeLessThan1sToName.put(66667, "1/15s");
        sExposureTimeLessThan1sToName.put(125000, "1/8s");
        sExposureTimeLessThan1sToName.put(250000, "1/4s");
        sExposureTimeLessThan1sToName.put(500000, "1/2s");
        sExposureTimeLessThan1sToName.put(1000000, "1s");
        sExposureTimeLessThan1sToName.put(2000000, "2s");
        sExposureTimeLessThan1sToName.put(4000000, "4s");
        sExposureTimeLessThan1sToName.put(8000000, "8s");
        sExposureTimeLessThan1sToName.put(16000000, "16s");
        sExposureTimeLessThan1sToName.put(32000000, "32s");
        sBeautyTypeToName.put("pref_beautify_skin_color_ratio_key", CameraStat.PARAM_BEAUTY_SKIN_COLOR);
        sBeautyTypeToName.put("pref_beautify_slim_face_ratio_key", CameraStat.PARAM_BEAUTY_SLIM_FACE);
        sBeautyTypeToName.put("pref_beautify_enlarge_eye_ratio_key", CameraStat.PARAM_BEAUTY_ENLARGE_EYE);
        sBeautyTypeToName.put("pref_beautify_skin_smooth_ratio_key", CameraStat.PARAM_BEAUTY_SKIN_SMOOTH);
        sBeautyTypeToName.put("pref_beautify_nose_ratio_key", CameraStat.PARAM_BEAUTY_NOSE);
        sBeautyTypeToName.put("pref_beautify_risorius_ratio_key", CameraStat.PARAM_BEAUTY_RISORIUS);
        sBeautyTypeToName.put("pref_beautify_lips_ratio_key", CameraStat.PARAM_BEAUTY_LIPS);
        sBeautyTypeToName.put("pref_beautify_chin_ratio_key", CameraStat.PARAM_BEAUTY_CHIN);
        sBeautyTypeToName.put("pref_beautify_neck_ratio_key", CameraStat.PARAM_BEAUTY_NECK);
        sBeautyTypeToName.put("pref_beautify_eyebrow_dye_ratio_key", CameraStat.PARAM_BEAUTY_EYEBROW_DYE);
        sBeautyTypeToName.put("pref_beautify_pupil_line_ratio_key", CameraStat.PARAM_BEAUTY_PUPIL_LINE);
        sBeautyTypeToName.put("pref_beautify_jelly_lips_ratio_key", CameraStat.PARAM_BEAUTY_JELLY_LIPS);
        sBeautyTypeToName.put("pref_beautify_blusher_ratio_key", CameraStat.PARAM_BEAUTY_BLUSHER);
        sBeautyTypeToName.put("pref_beautify_smile_ratio_key", CameraStat.PARAM_BEAUTY_SMILE);
        sBeautyTypeToName.put("pref_beautify_slim_nose_ratio_key", CameraStat.PARAM_BEAUTY_SLIM_NOSE);
        sFilterTypeToName.put(FilterType.N_BERRY.ordinal(), "浆果");
        sFilterTypeToName.put(FilterType.N_COOKIE.ordinal(), "曲奇");
        sFilterTypeToName.put(FilterType.N_DELICACY.ordinal(), "美味");
        sFilterTypeToName.put(FilterType.N_FADE.ordinal(), "褪色");
        sFilterTypeToName.put(FilterType.N_FILM.ordinal(), "胶片(拍照)");
        sFilterTypeToName.put(FilterType.N_KOIZORA.ordinal(), "恋空");
        sFilterTypeToName.put(FilterType.N_LATTE.ordinal(), "拿铁");
        sFilterTypeToName.put(FilterType.N_LIGHT.ordinal(), "浮光");
        sFilterTypeToName.put(FilterType.N_LIVELY.ordinal(), "生动");
        sFilterTypeToName.put(FilterType.N_QUIET.ordinal(), "静谧");
        sFilterTypeToName.put(FilterType.N_SODA.ordinal(), "汽水");
        sFilterTypeToName.put(FilterType.N_WARM.ordinal(), "暖阳");
        sFilterTypeToName.put(FilterType.B_FAIRYTALE.ordinal(), "童话");
        sFilterTypeToName.put(FilterType.B_JAPANESE.ordinal(), "日系");
        sFilterTypeToName.put(FilterType.B_MINT.ordinal(), "薄荷");
        sFilterTypeToName.put(FilterType.B_MOOD.ordinal(), "心境");
        sFilterTypeToName.put(FilterType.B_NATURE.ordinal(), "自然");
        sFilterTypeToName.put(FilterType.B_PINK.ordinal(), "粉嫩");
        sFilterTypeToName.put(FilterType.B_ROMANCE.ordinal(), "浪漫");
        sFilterTypeToName.put(FilterType.B_MAZE.ordinal(), "迷宫");
        sFilterTypeToName.put(FilterType.B_WHITEANDBLACK.ordinal(), "黑白(人像)");
        sFilterTypeToName.put(FilterType.S_FILM.ordinal(), "胶片(录像)");
        sFilterTypeToName.put(FilterType.S_YEARS.ordinal(), "那些年");
        sFilterTypeToName.put(FilterType.S_POLAROID.ordinal(), "拍立得");
        sFilterTypeToName.put(FilterType.S_FOREST.ordinal(), "小森林");
        sFilterTypeToName.put(FilterType.S_BYGONE.ordinal(), "往事");
        sFilterTypeToName.put(FilterType.S_WHITEANDBLACK.ordinal(), "黑白(录像)");
        sFilterTypeToName.put(FilterType.N_WHITEANDBLACK.ordinal(), "黑白(拍照)");
    }

    private static String addCameraSuffix(String str) {
        if (str == null) {
            return str;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append("_");
        sb.append(CameraSettings.isFrontCamera() ? "front" : "back");
        return sb.toString();
    }

    private static void addUltraPixelParameter(boolean z, Map<String, String> map) {
        boolean isUltraPixelOn = CameraSettings.isUltraPixelOn();
        if (z) {
            if (DataRepository.dataItemFeature().gK() == 32275200) {
                map.put(CameraStat.PARAM_ULTRA_PIXEL_32MP, isUltraPixelOn ? "on" : "off");
            }
        } else if (DataRepository.dataItemFeature().gJ() == 48000000) {
            map.put(CameraStat.PARAM_ULTRA_PIXEL_48MP, isUltraPixelOn ? "on" : "off");
        }
    }

    private static String antiBandingToName(String str) {
        if (str == null) {
            Log.e(TAG, "null antiBanding");
            return OTHERS;
        }
        char c = 65535;
        switch (str.hashCode()) {
            case 48:
                if (str.equals("0")) {
                    c = 0;
                    break;
                }
                break;
            case 49:
                if (str.equals("1")) {
                    c = 1;
                    break;
                }
                break;
            case 50:
                if (str.equals("2")) {
                    c = 2;
                    break;
                }
                break;
            case 51:
                if (str.equals("3")) {
                    c = 3;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return "off";
            case 1:
                return "50hz";
            case 2:
                return "60hz";
            case 3:
                return "auto";
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected antiBanding ");
                sb.append(str);
                Log.e(str2, sb.toString());
                return OTHERS;
        }
    }

    private static String autoExposureToName(String str) {
        if (str != null) {
            Resources resources = CameraAppImpl.getAndroidContext().getResources();
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_frameaverage))) {
                return "平均测光";
            }
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_centerweighted))) {
                return "中心权重";
            }
            if (str.equals(resources.getString(R.string.pref_camera_autoexposure_value_spotmetering))) {
                return "中点测光";
            }
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("unexpected auto exposure ");
        sb.append(str);
        Log.e(str2, sb.toString());
        return OTHERS;
    }

    private static String autoWhiteBalanceToName(String str) {
        if (str == null) {
            Log.e(TAG, "null awb");
            return OTHERS;
        }
        char c = 65535;
        switch (str.hashCode()) {
            case -1081415738:
                if (str.equals("manual")) {
                    c = 0;
                    break;
                }
                break;
            case 49:
                if (str.equals("1")) {
                    c = 1;
                    break;
                }
                break;
            case 50:
                if (str.equals("2")) {
                    c = 2;
                    break;
                }
                break;
            case 51:
                if (str.equals("3")) {
                    c = 3;
                    break;
                }
                break;
            case 53:
                if (str.equals("5")) {
                    c = 4;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    c = 5;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return str;
            case 1:
                return "auto";
            case 2:
                return "incandescent";
            case 3:
                return "fluorescent";
            case 4:
                return "daylight";
            case 5:
                return "cloudy-daylight";
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected awb ");
                sb.append(str);
                Log.e(str2, sb.toString());
                return OTHERS;
        }
    }

    private static String burstShotNumToName(int i) {
        return divideTo10Section(i);
    }

    public static String cameraIdToName(boolean z) {
        return z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA;
    }

    private static String contrastToName(String str) {
        return pictureQualityToName(R.array.pref_camera_contrast_entryvalues, str);
    }

    private static String divideTo10Section(int i) {
        if (i == 0) {
            return "0";
        }
        switch (i > 0 ? (i - 1) / 10 : 0) {
            case 0:
                return "1+";
            case 1:
                return "10+";
            case 2:
                return "20+";
            case 3:
                return "30+";
            case 4:
                return "40+";
            case 5:
                return "50+";
            case 6:
                return "60+";
            case 7:
                return "70+";
            case 8:
                return "80+";
            default:
                return "90+";
        }
    }

    private static String exposureTimeToName(String str) {
        if (str != null) {
            try {
                int parseLong = (int) (Long.parseLong(str) / 1000);
                if (parseLong < 1000000) {
                    String str2 = (String) sExposureTimeLessThan1sToName.get(parseLong);
                    if (str2 != null) {
                        return str2;
                    }
                } else {
                    int i = parseLong / 1000000;
                    StringBuilder sb = new StringBuilder();
                    sb.append(i);
                    sb.append("s");
                    return sb.toString();
                }
            } catch (NumberFormatException e) {
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("invalid exposure time ");
                sb2.append(str);
                Log.e(str3, sb2.toString());
            }
        }
        String str4 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("unexpected exposure time ");
        sb3.append(str);
        Log.e(str4, sb3.toString());
        return "auto";
    }

    public static String faceBeautyRatioToName(int i) {
        return i == 0 ? "0" : divideTo10Section(i);
    }

    private static String filterIdToName(int i) {
        if (FilterInfo.FILTER_ID_NONE == i) {
            return "none";
        }
        switch (FilterInfo.getCategory(i)) {
            case 1:
            case 2:
            case 3:
                String str = (String) sFilterTypeToName.get(FilterInfo.getIndex(i));
                if (str != null) {
                    return str;
                }
                break;
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("unexpected filter id: ");
        sb.append(Integer.toHexString(i));
        Log.e(str2, sb.toString());
        return "none";
    }

    private static String flashModeToName(String str) {
        if (str == null) {
            Log.e(TAG, "null flash mode");
            return OTHERS;
        }
        char c = 65535;
        int hashCode = str.hashCode();
        if (hashCode != 48626) {
            if (hashCode != 48628) {
                switch (hashCode) {
                    case 48:
                        if (str.equals("0")) {
                            c = 5;
                            break;
                        }
                        break;
                    case 49:
                        if (str.equals("1")) {
                            c = 1;
                            break;
                        }
                        break;
                    case 50:
                        if (str.equals("2")) {
                            c = 4;
                            break;
                        }
                        break;
                    case 51:
                        if (str.equals("3")) {
                            c = 0;
                            break;
                        }
                        break;
                }
            } else if (str.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
                c = 2;
            }
        } else if (str.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON)) {
            c = 3;
        }
        switch (c) {
            case 0:
                return "auto";
            case 1:
                return "on";
            case 2:
                return "screen-light-auto";
            case 3:
                return "screen-light-on";
            case 4:
                return "torch";
            case 5:
                return "off";
            default:
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unexpected flash mode ");
                sb.append(str);
                Log.e(str2, sb.toString());
                return OTHERS;
        }
    }

    private static String focusPositionToName(int i) {
        return 1000 == i ? "auto" : divideTo10Section((1000 - i) / 10);
    }

    private static String getDualZoomName(int i) {
        switch (i) {
            case 166:
            case 167:
                String cameraLensType = CameraSettings.getCameraLensType(i);
                if (ComponentManuallyDualLens.LENS_ULTRA.equals(cameraLensType)) {
                    return HybridZoomingSystem.STRING_ZOOM_RATIO_ULTR;
                }
                if (ComponentManuallyDualLens.LENS_TELE.equals(cameraLensType)) {
                    return HybridZoomingSystem.STRING_ZOOM_RATIO_TELE;
                }
                if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraLensType)) {
                    return HybridZoomingSystem.STRING_ZOOM_RATIO_WIDE;
                }
                break;
        }
        return HybridZoomingSystem.toString(CameraSettings.readZoom());
    }

    private static int indexOfString(String[] strArr, String str) {
        if (!(strArr == null || str == null)) {
            for (int i = 0; i < strArr.length; i++) {
                if (str.equals(strArr[i])) {
                    return i;
                }
            }
        }
        return -1;
    }

    private static String isoToName(String str) {
        if (str != null) {
            if ("auto".equalsIgnoreCase(str)) {
                return "auto";
            }
            if (str.toUpperCase(Locale.ENGLISH).indexOf("ISO") > -1) {
                return str.substring(3);
            }
        }
        return str;
    }

    public static String modeIdToName(int i) {
        String str = (String) sCameraModeIdToName.get(i);
        return str == null ? "未知" : str;
    }

    private static String pictureQualityToName(int i, String str) {
        String[] stringArray = CameraAppImpl.getAndroidContext().getResources().getStringArray(i);
        if (sPictureQualityIndexToName.size() >= stringArray.length) {
            int indexOfString = indexOfString(stringArray, str);
            if (indexOfString <= -1) {
                return OTHERS;
            }
            return (String) sPictureQualityIndexToName.get(indexOfString + ((sPictureQualityIndexToName.size() - stringArray.length) / 2));
        }
        StringBuilder sb = new StringBuilder();
        sb.append("picture quality array size is smaller than values size ");
        sb.append(str.length());
        throw new RuntimeException(sb.toString());
    }

    private static long round(long j, int i) {
        if (i <= 0) {
            return j;
        }
        long j2 = (long) i;
        return ((j + ((long) (i / 2))) / j2) * j2;
    }

    private static String saturationToName(String str) {
        return pictureQualityToName(R.array.pref_camera_saturation_entryvalues, str);
    }

    private static String sharpnessToName(String str) {
        return pictureQualityToName(R.array.pref_camera_sharpness_entryvalues, str);
    }

    public static String slowMotionConfigToName(String str) {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_120.equals(str) ? "点击至120" : ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_240.equals(str) ? "点击至240" : "点击至960";
    }

    private static String slowMotionQualityIdToName(String str) {
        if (str == null) {
            return OTHERS;
        }
        char c = 65535;
        switch (str.hashCode()) {
            case 53:
                if (str.equals("5")) {
                    c = 0;
                    break;
                }
                break;
            case 54:
                if (str.equals("6")) {
                    c = 1;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                return "720p";
            case 1:
                return "1080p";
            default:
                return OTHERS;
        }
    }

    public static void tarckBokenChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_BOKEN, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BOKEH_CHANGED, hashMap);
        }
    }

    private static String timeLapseIntervalToName(int i) {
        if (i < 1000) {
            return String.format(Locale.ENGLISH, "%.2fs", new Object[]{Float.valueOf(((float) i) / 1000.0f)});
        }
        return String.format(Locale.ENGLISH, "%ds", new Object[]{Integer.valueOf(i / 1000)});
    }

    public static void track(String str, String str2, String... strArr) {
        Util.Assert(strArr.length % 2 == 0);
        HashMap hashMap = new HashMap();
        for (int i = 0; i < strArr.length; i += 2) {
            hashMap.put(strArr[i], strArr[i + 1]);
        }
        CameraStat.recordCountEvent(str, str2, hashMap);
    }

    public static void trackAISceneChanged(int i, int i2, Resources resources) {
        if (!CameraStat.isCounterEventDisabled()) {
            String str = "未知";
            TypedArray obtainTypedArray = resources.obtainTypedArray(R.array.ai_scene_names);
            if (i2 >= 0 && i2 < obtainTypedArray.length()) {
                str = obtainTypedArray.getString(i2);
            }
            obtainTypedArray.recycle();
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_AI_SCENE_DETECTED, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_AI_SCENE_CHANGED, hashMap);
        }
    }

    public static void trackAwbChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_AWB, autoWhiteBalanceToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_AWB_CHANGED, hashMap);
        }
    }

    public static void trackBeautyBodyCapture() {
        trackBeautyBodySlim(CameraStat.CATEGORY_CAMERA, "6", null);
    }

    public static void trackBeautyBodyCounter(String str) {
        if (str != null) {
            trackBeautyBodySlim(CameraStat.CATEGORY_COUNTER, "6", str);
        }
    }

    public static void trackBeautyBodyCounterPort(@ShineType String str) {
        if (str != null) {
            trackBeautyBodySlim(CameraStat.CATEGORY_COUNTER, str, null);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0052, code lost:
        if (r9.equals("1") != false) goto L_0x0060;
     */
    /* JADX WARNING: Removed duplicated region for block: B:13:0x0033  */
    /* JADX WARNING: Removed duplicated region for block: B:26:0x0064  */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x0068  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x0072  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x007c  */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x0080  */
    /* JADX WARNING: Removed duplicated region for block: B:51:0x00ad  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x00b4  */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x011e A[RETURN] */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x011f  */
    private static void trackBeautyBodySlim(String str, @ShineType String str2, String str3) {
        boolean z;
        String str4;
        HashMap hashMap = new HashMap();
        int hashCode = str.hashCode();
        char c = 0;
        if (hashCode != 552585030) {
            if (hashCode == 957830652 && str.equals(CameraStat.CATEGORY_COUNTER)) {
                z = true;
                String str5 = null;
                switch (z) {
                    case false:
                        int faceBeautyRatio = CameraSettings.getFaceBeautyRatio("pref_beauty_whole_body_slim_ratio");
                        int faceBeautyRatio2 = CameraSettings.getFaceBeautyRatio("pref_beauty_head_slim_ratio");
                        int faceBeautyRatio3 = CameraSettings.getFaceBeautyRatio("pref_beauty_body_slim_ratio");
                        int faceBeautyRatio4 = CameraSettings.getFaceBeautyRatio("pref_beauty_shoulder_slim_ratio");
                        int faceBeautyRatio5 = CameraSettings.getFaceBeautyRatio("key_beauty_leg_slim_ratio");
                        hashMap.put(CameraStat.PARAM_BEAUTY_WHOLE_BODY_SLIM, divideTo10Section(faceBeautyRatio));
                        hashMap.put(CameraStat.PARAM_BEAUTY_HEAD_SLIM, divideTo10Section(faceBeautyRatio2));
                        hashMap.put(CameraStat.PARAM_BEAUTY_SHOULDER_SLIM, divideTo10Section(faceBeautyRatio4));
                        hashMap.put(CameraStat.PARAM_BEAUTY_BODY_SLIM, divideTo10Section(faceBeautyRatio3));
                        hashMap.put(CameraStat.PARAM_BEAUTY_LEG_SLIM, divideTo10Section(faceBeautyRatio5));
                        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
                        break;
                    case true:
                        str4 = CameraStat.KEY_NEW_BEAUTY;
                        int hashCode2 = str2.hashCode();
                        if (hashCode2 == 54) {
                            if (str2.equals("6")) {
                                c = 2;
                                switch (c) {
                                    case 0:
                                    case 1:
                                        str5 = "美颜";
                                        break;
                                    case 2:
                                        str5 = CameraStat.PARAM_BEAUTY_BODY_SLIM;
                                        break;
                                }
                                if (!TextUtils.isEmpty(str5)) {
                                    hashMap.put(CameraStat.PARAM_BEAUTY_PORT, str5);
                                }
                                if ("pref_beauty_whole_body_slim_ratio" != str3) {
                                    str5 = CameraStat.PARAM_BEAUTY_WHOLE_BODY_SLIM;
                                } else if ("pref_beauty_head_slim_ratio" == str3) {
                                    str5 = CameraStat.PARAM_BEAUTY_HEAD_SLIM;
                                } else if ("pref_beauty_shoulder_slim_ratio" == str3) {
                                    str5 = CameraStat.PARAM_BEAUTY_SHOULDER_SLIM;
                                } else if ("pref_beauty_body_slim_ratio" == str3) {
                                    str5 = CameraStat.PARAM_BEAUTY_BODY_SLIM;
                                } else if ("key_beauty_leg_slim_ratio" == str3) {
                                    str5 = CameraStat.PARAM_BEAUTY_LEG_SLIM;
                                } else if (BeautyConstant.BEAUTY_RESET == str3) {
                                    str5 = "重置";
                                }
                                if (!TextUtils.isEmpty(str5)) {
                                    hashMap.put(CameraStat.PARAM_BEAUTY_BODY_SLIM, str5);
                                    break;
                                }
                            }
                        } else {
                            switch (hashCode2) {
                                case 49:
                                    break;
                                case 50:
                                    if (str2.equals("2")) {
                                        c = 1;
                                        break;
                                    }
                            }
                        }
                        c = 65535;
                        switch (c) {
                            case 0:
                            case 1:
                                break;
                            case 2:
                                break;
                        }
                        if (!TextUtils.isEmpty(str5)) {
                        }
                        if ("pref_beauty_whole_body_slim_ratio" != str3) {
                        }
                        if (!TextUtils.isEmpty(str5)) {
                        }
                        break;
                }
                str4 = null;
                if (!TextUtils.isEmpty(str4)) {
                    CameraStat.recordCountEvent(str, str4, hashMap);
                    return;
                }
                return;
            }
        } else if (str.equals(CameraStat.CATEGORY_CAMERA)) {
            z = false;
            String str52 = null;
            switch (z) {
                case false:
                    break;
                case true:
                    break;
            }
            str4 = null;
            if (!TextUtils.isEmpty(str4)) {
            }
        }
        z = true;
        String str522 = null;
        switch (z) {
            case false:
                break;
            case true:
                break;
        }
        str4 = null;
        if (!TextUtils.isEmpty(str4)) {
        }
    }

    public static void trackBeautyInfo(int i, String str, BeautyValues beautyValues) {
        String[] strArr;
        String[] strArr2;
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, str);
        if (b.jo()) {
            int i2 = 0;
            for (String str2 : BeautyConstant.BEAUTY_CATEGORY_LEVEL) {
                String str3 = (String) sBeautyTypeToName.get(str2);
                if (str3 != null) {
                    hashMap.put(str3, faceBeautyRatioToName(beautyValues.getValueByType(str2)));
                }
            }
            if (CameraStat.VALUE_FRONT_CAMERA.equals(str)) {
                for (String str4 : BeautyConstant.BEAUTY_CATEGORY_FRONT_MAKEUP) {
                    String str5 = (String) sBeautyTypeToName.get(str4);
                    if (str5 != null) {
                        hashMap.put(str5, faceBeautyRatioToName(beautyValues.getValueByType(str4)));
                    }
                }
                String[] strArr3 = BeautyConstant.BEAUTY_CATEGORY_FRONT_REMODELING;
                int length = strArr3.length;
                while (i2 < length) {
                    String str6 = strArr3[i2];
                    String str7 = (String) sBeautyTypeToName.get(str6);
                    if (str7 != null) {
                        hashMap.put(str7, faceBeautyRatioToName(beautyValues.getValueByType(str6)));
                    }
                    i2++;
                }
            } else {
                String[] strArr4 = BeautyConstant.BEAUTY_CATEGORY_BACK_FIGURE;
                int length2 = strArr4.length;
                while (i2 < length2) {
                    String str8 = strArr4[i2];
                    String str9 = (String) sBeautyTypeToName.get(str8);
                    if (str9 != null) {
                        hashMap.put(str9, faceBeautyRatioToName(beautyValues.getValueByType(str8)));
                    }
                    i2++;
                }
            }
        } else {
            hashMap.put(CameraStat.PARAM_BEAUTY_SLIM_FACE, faceBeautyRatioToName(beautyValues.mBeautySlimFace));
            hashMap.put(CameraStat.PARAM_BEAUTY_ENLARGE_EYE, faceBeautyRatioToName(beautyValues.mBeautyEnlargeEye));
            hashMap.put(CameraStat.PARAM_BEAUTY_SKIN_COLOR, faceBeautyRatioToName(beautyValues.mBeautySkinColor));
            hashMap.put(CameraStat.PARAM_BEAUTY_SKIN_SMOOTH, faceBeautyRatioToName(beautyValues.mBeautySkinSmooth));
        }
        hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(BeautyConstant.getLevelInteger(beautyValues.mBeautyLevel)));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BEAUTY, (long) i, hashMap);
    }

    public static void trackBeautySwitchChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(BeautyConstant.getLevelInteger(str)));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BEAUTY_SWITCH_CHANGED, hashMap);
        }
    }

    public static void trackBokehTaken() {
        String readFNumber = CameraSettings.readFNumber();
        boolean isFrontCamera = CameraSettings.isFrontCamera();
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_LIVE_BOKEH_LEVEL, readFNumber);
        hashMap.put("模式", isFrontCamera ? CameraStat.PARAM_FRONT_CAMERA : CameraStat.PARAM_BACK_CAMERA);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BOKEH_ADJUST, hashMap);
    }

    public static void trackBroadcastKillService() {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_BROADCAST_KILL_SERVICE, hashMap);
    }

    public static void trackCameraError(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        hashMap.put("error", str);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_HARDWARE_ERROR, hashMap);
    }

    public static void trackCameraErrorDialogShow() {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CAMERA_ERROR_DIALOG_SHOW, hashMap);
    }

    public static void trackConfigChange(String str, String str2, boolean z, boolean z2, boolean z3) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            if (z2) {
                hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            }
            if (z3) {
                hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            }
            hashMap.put(str2, z ? "on" : "off");
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str, hashMap);
        }
    }

    public static void trackDirectionChanged(int i) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_PANORAMA_DIRECTION, 3 == i ? CameraStat.PANORAMA_DIRECTION_L2R : CameraStat.PANORAMA_DIRECTION_R2L);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_PANORAMA_DIRECTION_CHANGED, hashMap);
        }
    }

    public static void trackDualWaterMarkChanged(boolean z) {
        CameraStat.recordStringPropertyEvent(CameraStat.CATEGORY_SETTINGS, "pref_dualcamera_watermark_key", z ? "on" : "off");
    }

    public static void trackDualZoomChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_ZOOM, str);
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                hashMap.put(CameraStat.PARAM_SAT_ZOOM, str);
            }
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_DUAL_ZOOM_CHANGED, hashMap);
        }
    }

    public static void trackEvAdjusted() {
        HashMap hashMap = new HashMap(2);
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_EV_ADJUSTED, hashMap);
    }

    public static void trackExposureTimeChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_ET, exposureTimeToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_EXPOSURE_TIME_CHANGED, hashMap);
        }
    }

    public static void trackFilterChanged(int i, int i2, boolean z) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_FILTER, filterIdToName(i2));
            hashMap.put(CameraStat.PARAM_COMMON_MODE, z ? CameraStat.SWITCH_MODE_CLICK : CameraStat.SWITCH_MODE_SLIDE);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FILTER_CHANGED, hashMap);
        }
    }

    public static void trackFlashChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_FLASH_MODE, flashModeToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FLASH_CHANGED, hashMap);
        }
    }

    public static void trackFocusPositionChanged(int i) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_FOCUS_POSITION, focusPositionToName(i));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_FOCUS_POSITION_CHANGED, hashMap);
        }
    }

    public static void trackGeneralInfo(int i, boolean z, int i2, int i3, boolean z2, MutexModeManager mutexModeManager, String str) {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        HashMap hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i2));
        hashMap.put(CameraStat.PARAM_GROUP_SHOT, (z || !CameraSettings.isGroupShotOn()) ? "off" : "on");
        hashMap.put(CameraStat.PARAM_TRIGGER_MODE, triggerModeToName(i3));
        String str2 = "0";
        if (!z) {
            ComponentRunningTimer componentRunningTimer = dataItemRunning.getComponentRunningTimer();
            if (componentRunningTimer != null) {
                str2 = componentRunningTimer.getComponentValue(i2);
            }
        }
        hashMap.put(CameraStat.PARAM_TIMER, str2);
        String str3 = "0";
        ComponentConfigFlash componentFlash = dataItemConfig.getComponentFlash();
        if (componentFlash != null) {
            str3 = componentFlash.getComponentValue(i2);
            if (z && !"2".equals(str3)) {
                str3 = "0";
            }
        }
        if (str != null) {
            hashMap.put(CameraStat.PARAM_FLASH_MODE, str);
        } else {
            hashMap.put(CameraStat.PARAM_FLASH_MODE, flashModeToName(str3));
        }
        hashMap.put(CameraStat.PARAM_FILTER, z ? "none" : filterIdToName(EffectController.getInstance().getEffectForSaving(false)));
        hashMap.put(CameraStat.PARAM_LIVESHOT, CameraSettings.isLiveShotOn() ? "on" : "off");
        addUltraPixelParameter(z2, hashMap);
        hashMap.put(CameraStat.PARAM_SQUARE, i2 == 165 ? "on" : "off");
        if (z2) {
            hashMap.put(CameraStat.PARAM_GENDER_AGE, CameraSettings.showGenderAge() ? "on" : "off");
            hashMap.put(CameraStat.PARAM_MAGIC_MIRROR, CameraSettings.isMagicMirrorOn() ? "on" : "off");
            if (DataRepository.dataItemRunning().supportHandGesture()) {
                hashMap.put(CameraStat.PARAM_PALM_SHUTTER, CameraSettings.isHandGestureOpen() ? "on" : "off");
            }
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_FRONT_CAMERA_INFO, (long) i, hashMap);
            return;
        }
        hashMap.put(CameraStat.PARAM_TILTSHIFT, (z || !CameraSettings.isTiltShiftOn()) ? "off" : dataItemRunning.getComponentRunningTiltValue().getComponentValue(i2));
        hashMap.put(CameraStat.PARAM_GRADIENTER, (z || !CameraSettings.isGradienterOn()) ? "off" : "on");
        hashMap.put(CameraStat.PARAM_HHT, (z || mutexModeManager == null || !mutexModeManager.isHandNight()) ? "off" : "on");
        String str4 = "off";
        if (!z && mutexModeManager != null) {
            boolean isHdr = mutexModeManager.isHdr();
            ComponentConfigHdr componentHdr = dataItemConfig.getComponentHdr();
            if (componentHdr != null && "auto".equals(componentHdr.getComponentValue(i2))) {
                str4 = isHdr ? AUTO_ON : AUTO_OFF;
            } else if (isHdr) {
                str4 = "on";
            }
        }
        hashMap.put(CameraStat.PARAM_HDR, str4);
        hashMap.put(CameraStat.PARAM_SUPER_RESOLUTION, (z || mutexModeManager == null || !mutexModeManager.isSuperResolution()) ? "off" : "on");
        hashMap.put(CameraStat.PARAM_ZOOM, getDualZoomName(i2));
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            hashMap.put(CameraStat.PARAM_SAT_ZOOM, getDualZoomName(i2));
        }
        hashMap.put(CameraStat.PARAM_ULTRA_WIDE_BOKEH, DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled") ? "on" : "off");
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_BACK_CAMERA_INFO, (long) i, hashMap);
    }

    public static void trackGoogleLensOobeContinue(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_OOBE_CONTINUE_CLICK, z ? "accepted" : "not accepted");
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOOGLE_LENS_OOBE_CONTINUE, hashMap);
    }

    public static void trackGoogleLensPicker() {
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOOGLE_LENS_PICKER);
    }

    public static void trackGoogleLensPickerValue(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_PICK_WHICH, z ? "google lens" : "lock AE/AF");
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOOGLE_LENS_PICKER_VALUE, hashMap);
    }

    public static void trackGoogleLensTouchAndHold() {
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOOGLE_LENS_TOUCH_AND_HOLD);
    }

    public static void trackGotoGallery(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOTO_GALLERY, hashMap);
    }

    public static void trackGotoSettings(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_GOTO_SETTINGS, hashMap);
    }

    public static void trackHdrChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_HDR, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_HDR_CHANGED, hashMap);
        }
    }

    public static void trackIsoChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_ISO, isoToName(str));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_ISO_CHANGED, hashMap);
        }
    }

    public static void trackLensChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LENS, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MANUAL_LENS_CHANGED, hashMap);
        }
    }

    public static void trackLightingChanged(int i, String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(i));
            hashMap.put(CameraStat.PARAM_LIGHTING, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIGHTING_CHANGED, hashMap);
        }
    }

    public static void trackLiveBeautyClick(@ShineType String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            String str2 = null;
            char c = 65535;
            switch (str.hashCode()) {
                case 1567:
                    if (str.equals("10")) {
                        c = 0;
                        break;
                    }
                    break;
                case 1568:
                    if (str.equals(ComponentRunningShine.SHINE_LIVE_BEAUTY)) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    str2 = CameraStat.PARAM_FILTER;
                    break;
                case 1:
                    str2 = "美颜";
                    break;
            }
            if (!TextUtils.isEmpty(str2)) {
                HashMap hashMap = new HashMap();
                hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_TYPE, str2);
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIVE_BEAUTY, hashMap);
            }
        }
    }

    public static void trackLiveBeautyCounter(String str) {
        String str2;
        if (str != null) {
            HashMap hashMap = new HashMap();
            String str3 = null;
            if ("key_live_shrink_face_ratio" == str) {
                str3 = CameraStat.PARAM_BEAUTY_SLIM_FACE;
            } else if ("key_live_enlarge_eye_ratio" == str) {
                str3 = CameraStat.PARAM_BEAUTY_ENLARGE_EYE;
            } else if ("key_live_smooth_strength" == str) {
                str3 = CameraStat.PARAM_BEAUTY_SKIN_SMOOTH;
            } else if (BeautyConstant.BEAUTY_RESET == str) {
                str3 = "重置";
            }
            if (!TextUtils.isEmpty(str3)) {
                if (CameraSettings.isFrontCamera()) {
                    str2 = CameraStat.KEY_LIVE_BEAUTY_FRON;
                    hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_FRON, str3);
                } else {
                    str2 = CameraStat.KEY_LIVE_BEAUTY_BACK;
                    hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_BACK, str3);
                }
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str2, hashMap);
            }
        }
    }

    public static void trackLiveClick(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str);
        }
    }

    public static void trackLiveMusicClick() {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.PARAM_LIVE_MUSIC_ICON_CLICK);
        }
    }

    public static void trackLiveRecordingParams(boolean z, String str, boolean z2, String str2, boolean z3, String str3, String str4, boolean z4, int i, int i2, int i3, int i4, boolean z5) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            String str5 = z5 ? "(前置)" : "(后置)";
            hashMap.put(CameraStat.PARAM_LIVE_MUSIC_ON, z ? "on" : "off");
            if (z) {
                StringBuilder sb = new StringBuilder();
                sb.append(CameraStat.PARAM_LIVE_MUSIC_NAME);
                sb.append(str5);
                hashMap.put(sb.toString(), str);
            }
            hashMap.put(CameraStat.PARAM_LIVE_FILTER_SEGMENT_ON, z2 ? "on" : "off");
            if (z2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(CameraStat.PARAM_LIVE_FILTER_NAME);
                sb2.append(str5);
                hashMap.put(sb2.toString(), str2);
            }
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_SEGMENT_ON, z3 ? "on" : "off");
            if (z3) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(CameraStat.PARAM_LIVE_STICKER_NAME);
                sb3.append(str5);
                hashMap.put(sb3.toString(), str3);
            }
            StringBuilder sb4 = new StringBuilder();
            sb4.append(CameraStat.PARAM_LIVE_SPEED_LEVEL);
            sb4.append(str5);
            hashMap.put(sb4.toString(), str4);
            hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_SEGMENT_ON, z4 ? "on" : "off");
            StringBuilder sb5 = new StringBuilder();
            sb5.append(CameraStat.PARAM_LIVE_SHRINK_FACE_RATIO);
            sb5.append(str5);
            hashMap.put(sb5.toString(), divideTo10Section(i));
            StringBuilder sb6 = new StringBuilder();
            sb6.append(CameraStat.PARAM_LIVE_ENLARGE_EYE_RATIO);
            sb6.append(str5);
            hashMap.put(sb6.toString(), divideTo10Section(i2));
            StringBuilder sb7 = new StringBuilder();
            sb7.append(CameraStat.PARAM_LIVE_SMOOTH_RATIO);
            sb7.append(str5);
            hashMap.put(sb7.toString(), divideTo10Section(i3));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, cameraIdToName(z5));
            String str6 = CameraStat.PARAM_QUALITY;
            StringBuilder sb8 = new StringBuilder();
            sb8.append("");
            sb8.append(i4);
            hashMap.put(str6, videoQualityToName(sb8.toString()));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_LIVE_VIDEO, hashMap);
        }
    }

    public static void trackLiveStickerDownload(String str, boolean z) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_NAME, str);
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_DOWNLOAD, z ? CameraStat.VALUE_LIVE_STICKER_SUCCESS : CameraStat.VALUE_LIVE_STICKER_FAILED);
        }
    }

    public static void trackLiveStickerMore(boolean z) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_MORE, z ? CameraStat.VALUE_LIVE_STICKER_MARKET : CameraStat.VALUE_LIVE_STICKER_APP);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LIVE_STICKER_MORE, hashMap);
        }
    }

    public static void trackLiveVideoParams(int i, float f, boolean z, boolean z2, boolean z3) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_LIVE_FILTER_ON, z ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_STICKER_ON, z2 ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_BEAUTY_ON, z3 ? "on" : "off");
            hashMap.put(CameraStat.PARAM_LIVE_RECORD_SEGMENTS, Integer.toString(i));
            hashMap.put(CameraStat.PARAM_LIVE_RECORD_TIME, Integer.toString((int) f));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_LIVE_VIDEO, hashMap);
        }
    }

    public static void trackLostCount(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_TRACKING_LOST, i < 10 ? String.valueOf(i) : CameraStat.VALUE_AUTOZOOM_LOST_10_MORE);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_TRACKING_LOST, hashMap);
    }

    public static void trackLyingDirectPictureTaken(int i) {
        if (i != -1) {
            int i2 = i - 1;
            int i3 = (360 - (i2 >= 0 ? i2 % 360 : (i2 % 360) + 360)) % 360;
            HashMap hashMap = new HashMap();
            if (i % 2 == 0) {
                hashMap.put(CameraStat.PARAM_LYING_DIRECT, CameraStat.LOCATION_WITHOUT);
            } else {
                hashMap.put(CameraStat.PARAM_LYING_DIRECT, String.valueOf(i3));
            }
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN, 1, hashMap);
        }
    }

    public static void trackLyingDirectShow(int i) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_LYING_DIRECT, String.valueOf(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_LYING_DIRECT_SHOW, hashMap);
    }

    private static void trackMacroModeTaken(int i) {
        if (DataRepository.dataItemRunning().supportMacroMode()) {
            boolean isSwitchOn = DataRepository.dataItemRunning().getComponentRunningMacroMode().isSwitchOn(i);
            HashMap hashMap = new HashMap();
            String str = "off";
            if (isSwitchOn) {
                str = "on";
                hashMap.put(CameraStat.PARAM_FOCUS_POSITION, Util.getZoomRatioText(CameraSettings.readZoom()));
            }
            hashMap.put(CameraStat.PARAM_MACRO_MODE, str);
            String str2 = null;
            if (i != 165) {
                if (i != 169) {
                    switch (i) {
                        case 162:
                            break;
                        case 163:
                            break;
                    }
                }
                str2 = CameraStat.KEY_VIDEO_TAKEN;
                CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, str2, 1, hashMap);
            }
            str2 = CameraStat.KEY_PICTURE_TAKEN;
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, str2, 1, hashMap);
        }
    }

    public static void trackMimojiCaptureOrRecord(Map<String, String> map, String str, boolean z, boolean z2) {
        if (!CameraStat.isCounterEventDisabled()) {
            map.put(CameraStat.PARAM_FLASH_MODE, flashModeToName(str));
            map.put(CameraStat.PARAM_CAMERA_ID, z2 ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            if (z) {
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MIMOJI_CAPTURE, map);
            } else {
                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MIMOJI_RECORD, map);
            }
        }
    }

    public static void trackMimojiClick(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str);
        }
    }

    public static void trackMimojiCount(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordStringPropertyEvent(CameraStat.CATEGORY_SETTINGS, CameraStat.PARAM_MIMOJI_COUNT, str);
        }
    }

    public static void trackMimojiSavePara(String str, Map<String, String> map) {
        if (!CameraStat.isCounterEventDisabled()) {
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, str, map);
        }
    }

    public static void trackModeSwitch() {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_TARGET_MODE, modeIdToName(ModuleManager.getActiveModuleIndex()));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_MODE_SWITCH, hashMap);
    }

    public static void trackMoonMode(boolean z, boolean z2) {
        if (z) {
            HashMap hashMap = new HashMap();
            hashMap.put(CameraStat.PARAM_MOON_MODE_SELECT, z2 ? "月亮模式" : "夜景模式");
            hashMap.put(CameraStat.PARAM_ZOOM, String.valueOf(CameraSettings.readZoom()));
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_MOON_MODE, 1, hashMap);
        }
    }

    public static void trackNewSlowMotionVideoRecorded(String str, int i, int i2, int i3, long j) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", str);
        hashMap.put(CameraStat.PARAM_QUALITY, slowMotionQualityIdToName(String.valueOf(i)));
        hashMap.put(CameraStat.PARAM_FLASH_MODE, i2 == 2 ? "torch" : "off");
        hashMap.put(CameraStat.PARAM_VIDEO_FPS, String.valueOf(i3));
        hashMap.put(CameraStat.PARAM_VIDEO_TIME, String.valueOf(j));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TAKEN, hashMap);
    }

    public static void trackPauseVideoRecording(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_PAUSE_RECORDING, hashMap);
    }

    public static void trackPictureSize(int i, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_PICTURE_SIZE, str);
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        if (i == 165) {
            i = 163;
        }
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_PICTURE_SIZE, hashMap);
    }

    public static void trackPictureTaken(int i, boolean z, int i2, boolean z2, boolean z3, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z2 ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put(CameraStat.PARAM_PICTURE_RATIO, CameraSettings.getPictureSizeRatioString());
        hashMap.put(CameraStat.PARAM_QUALITY, CameraSettings.getJpegQuality(z));
        hashMap.put(CameraStat.PARAM_TIME_WATERMARK, CameraSettings.isTimeWaterMarkOpen() ? "on" : "off");
        hashMap.put(CameraStat.PARAM_DEVICE_WATERMARK, CameraSettings.isDualCameraWaterMarkOpen() || CameraSettings.isFrontCameraWaterMarkOpen() ? "on" : "off");
        String str2 = CameraStat.PARAM_LOCATION;
        String str3 = z3 ? CameraStat.LOCATION_WITH : CameraSettings.isRecordLocation() ? CameraStat.LOCATION_WITHOUT : CameraStat.LOCATION_CLOSED;
        hashMap.put(str2, str3);
        if (str != null) {
            hashMap.put(CameraStat.PARAM_AI_SCENE_DETECTED, str);
        }
        if (i2 == 171 && !z2) {
            hashMap.put(CameraStat.PARAM_LIGHTING, String.valueOf(CameraSettings.getPortraitLightingPattern()));
        }
        hashMap.put(CameraStat.PARAM_LIVESHOT, CameraSettings.isLiveShotOn() ? "on" : "off");
        addUltraPixelParameter(z2, hashMap);
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN, (long) i, hashMap);
        if (z) {
            if (CameraSettings.isPressDownCapture() && i > 1) {
                i--;
            }
            HashMap hashMap2 = new HashMap();
            hashMap2.put("张数", burstShotNumToName(i));
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_BURST, (long) i, hashMap2);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_BURST_SHOT_TIMES, hashMap2);
        }
        trackMacroModeTaken(i2);
    }

    public static void trackPictureTakenInManual(int i, String str, String str2, String str3, int i2) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_AWB, autoWhiteBalanceToName(str));
        hashMap.put(CameraStat.PARAM_FOCUS_POSITION, focusPositionToName(CameraSettings.getFocusPosition()));
        hashMap.put(CameraStat.PARAM_ET, exposureTimeToName(str2));
        hashMap.put(CameraStat.PARAM_ISO, isoToName(str3));
        hashMap.put(CameraStat.PARAM_LENS, CameraSettings.getCameraLensType(i2));
        hashMap.put(CameraStat.PARAM_FOCUS_PEAK, EffectController.getInstance().isNeedDrawPeaking() ? "on" : "off");
        hashMap.put(CameraStat.PARAM_ZOOM, HybridZoomingSystem.toString(CameraSettings.readZoom()));
        addUltraPixelParameter(false, hashMap);
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_MANUAL, (long) i, hashMap);
    }

    public static void trackPictureTakenInPanorama(Context context, int i) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_PANORAMA_DIRECTION, 3 == CameraSettings.getPanoramaMoveDirection(context) ? CameraStat.PANORAMA_DIRECTION_L2R : CameraStat.PANORAMA_DIRECTION_R2L);
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_PANORAMA, (long) i, hashMap);
    }

    public static void trackPictureTakenInWideSelfie(int i, String str, String str2) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_STOP_CAPTURE_MODE, str);
        hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, str2);
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_WIDESELFIE, (long) i, hashMap);
    }

    public static void trackPocketModeEnter(String str) {
        track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_ENTER, CameraStat.PARAM_COMMON_MODE, str);
    }

    public static void trackPocketModeExit(String str) {
        track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_KEYGUARD_EXIT, CameraStat.PARAM_COMMON_MODE, str);
    }

    public static void trackPocketModeSensorDelay() {
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_SENSOR_DELAY);
    }

    public static void trackPreferenceChange(String str, Object obj) {
        if (str != null) {
            String str2 = obj instanceof Boolean ? ((Boolean) obj).booleanValue() ? "on" : "off" : String.valueOf(obj);
            char c = 65535;
            switch (str.hashCode()) {
                case -2144607600:
                    if (str.equals(CameraSettings.KEY_ULTRA_WIDE_LDC)) {
                        c = 11;
                        break;
                    }
                    break;
                case -2108353415:
                    if (str.equals(CameraSettings.KEY_NORMAL_WIDE_LDC)) {
                        c = 10;
                        break;
                    }
                    break;
                case -885525953:
                    if (str.equals(CameraSettings.KEY_VIDEO_QUALITY)) {
                        c = 0;
                        break;
                    }
                    break;
                case -633328171:
                    if (str.equals(CameraSettings.KEY_VIDEO_NEW_SLOW_MOTION)) {
                        c = 9;
                        break;
                    }
                    break;
                case -302378757:
                    if (str.equals(CameraSettings.KEY_QC_SATURATION)) {
                        c = 6;
                        break;
                    }
                    break;
                case -33912691:
                    if (str.equals(CameraSettings.KEY_ANTIBANDING)) {
                        c = 8;
                        break;
                    }
                    break;
                case 549001748:
                    if (str.equals(CameraSettings.KEY_AUTOEXPOSURE)) {
                        c = 4;
                        break;
                    }
                    break;
                case 865415668:
                    if (str.equals(CameraSettings.KEY_VIDEO_HIGH_FRAME_RATE)) {
                        c = 3;
                        break;
                    }
                    break;
                case 936502456:
                    if (str.equals(CameraSettings.KEY_QC_SHARPNESS)) {
                        c = 7;
                        break;
                    }
                    break;
                case 966436379:
                    if (str.equals(CameraSettings.KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL)) {
                        c = 1;
                        break;
                    }
                    break;
                case 1907727979:
                    if (str.equals(CameraSettings.KEY_QC_CONTRAST)) {
                        c = 5;
                        break;
                    }
                    break;
                case 1934228025:
                    if (str.equals(CameraSettings.KEY_JPEG_QUALITY)) {
                        c = 2;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    str = addCameraSuffix(str);
                    str2 = videoQualityToName(str2);
                    break;
                case 1:
                    try {
                        str2 = timeLapseIntervalToName(Integer.parseInt(str2));
                        break;
                    } catch (NumberFormatException e) {
                        String str3 = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("invalid interval ");
                        sb.append(str2);
                        Log.e(str3, sb.toString());
                        break;
                    }
                case 2:
                    str = addCameraSuffix(str);
                    break;
                case 3:
                    str = addCameraSuffix(str);
                    break;
                case 4:
                    str2 = autoExposureToName(str2);
                    break;
                case 5:
                    str2 = contrastToName(str2);
                    break;
                case 6:
                    str2 = saturationToName(str2);
                    break;
                case 7:
                    str2 = sharpnessToName(str2);
                    break;
                case 8:
                    str2 = antiBandingToName(str2);
                    break;
                case 9:
                    str2 = slowMotionQualityIdToName(str2);
                    break;
                case 10:
                    str = CameraStat.KEY_NORMAL_WIDE_LDC;
                    break;
                case 11:
                    str = CameraStat.KEY_ULTRA_WIDE_LDC;
                    break;
            }
            CameraStat.recordStringPropertyEvent(CameraStat.CATEGORY_SETTINGS, str, str2);
        }
    }

    public static void trackSelectObject(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_SELECT_OBJECT, z ? CameraStat.VALUE_SELECT_OBJECT_RECORDING : CameraStat.VALUE_SELECT_OBJECT_BEFORE_RECORDING);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_SELECT_OBJECT, hashMap);
    }

    public static void trackSnapInfo(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("mode", z ? "video" : "photo");
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_SNAP_CAMERA, hashMap);
    }

    public static void trackStartAppCost(long j) {
        if (j < 0 || j > FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME) {
            StringBuilder sb = new StringBuilder();
            sb.append("The time cost when start app is illegal: ");
            sb.append(j);
            throw new IllegalArgumentException(sb.toString());
        }
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_START_APP_COST, round(j, 50));
    }

    public static void trackTakePictureCost(long j, boolean z, int i) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(i));
        CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_TAKE_PICTURE_COST, round(j, 50), hashMap);
    }

    public static void trackTiltShiftChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            hashMap.put(CameraStat.PARAM_TILTSHIFT, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_TILTSHIFT_CHANGED, hashMap);
        }
    }

    public static void trackTimerChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
            hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
            hashMap.put(CameraStat.PARAM_TIMER, str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_TIMER_CHANGED, hashMap);
        }
    }

    private static void trackUltraWide(String str) {
        if (DataRepository.dataItemFeature().isSupportUltraWide() && !TextUtils.isEmpty(str)) {
            HashMap hashMap = new HashMap();
            if (CameraSettings.isUltraWideConfigOpen(ModuleManager.getActiveModuleIndex())) {
                hashMap.put(CameraStat.PARAM_ULTRA_WIDE, "on");
            } else {
                hashMap.put(CameraStat.PARAM_ULTRA_WIDE, "off");
            }
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, str, 1, hashMap);
        }
    }

    public static void trackUltraWideFunTaken() {
        trackUltraWide(CameraStat.KEY_LIVE_VIDEO);
    }

    public static void trackUltraWideManualTaken(int i) {
        if (DataRepository.dataItemFeature().isSupportUltraWide()) {
            HashMap hashMap = new HashMap();
            if (ComponentManuallyDualLens.LENS_ULTRA.equalsIgnoreCase(DataRepository.dataItemConfig().getManuallyDualLens().getComponentValue(i))) {
                hashMap.put(CameraStat.PARAM_ULTRA_WIDE, "on");
            } else {
                hashMap.put(CameraStat.PARAM_ULTRA_WIDE, "off");
            }
            CameraStat.recordCalculateEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_PICTURE_TAKEN_MANUAL, 1, hashMap);
        }
    }

    public static void trackUltraWidePictureTaken() {
        trackUltraWide(CameraStat.KEY_PICTURE_TAKEN);
    }

    public static void trackUltraWideVideoTaken() {
        trackUltraWide(CameraStat.KEY_VIDEO_TAKEN);
    }

    public static void trackUserDefineWatermark() {
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_USERDEFINE_WATERMARK);
    }

    public static void trackVideoModeChanged(String str) {
        if (!CameraStat.isCounterEventDisabled()) {
            HashMap hashMap = new HashMap();
            hashMap.put("模式", str);
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_VIDEO_MODE_CHANGED, hashMap);
        }
    }

    public static void trackVideoRecorded(boolean z, int i, boolean z2, boolean z3, String str, int i2, int i3, int i4, int i5, BeautyValues beautyValues, long j) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", str);
        String str2 = CameraStat.PARAM_QUALITY;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i2);
        hashMap.put(str2, videoQualityToName(sb.toString()));
        hashMap.put(CameraStat.PARAM_FLASH_MODE, i3 == 2 ? "torch" : "off");
        hashMap.put(CameraStat.PARAM_VIDEO_FPS, String.valueOf(i4));
        if (i == 162 && !z) {
            if (z2) {
                hashMap.put(CameraStat.PARAM_AUTO_ZOOM, z3 ? CameraStat.VALUE_AUTOZOOM_ULTRA : CameraStat.VALUE_AUTOZOOM_NOT_ULTRA);
            } else {
                hashMap.put(CameraStat.PARAM_AUTO_ZOOM, "off");
            }
        }
        if (beautyValues != null) {
            hashMap.put(CameraStat.PARAM_BEAUTY_LEVEL, String.valueOf(BeautyConstant.getLevelInteger(beautyValues.mBeautyLevel)));
        }
        hashMap.put(CameraStat.PARAM_VIDEO_TIME, String.valueOf(j));
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TAKEN, hashMap);
        if (i5 > 0 && CameraSettings.VIDEO_SPEED_FAST.equals(str)) {
            HashMap hashMap2 = new HashMap();
            hashMap2.put("间隔", timeLapseIntervalToName(i5));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_TIME_LAPSE_INTERVAL, hashMap2);
        }
        trackMacroModeTaken(i);
    }

    public static void trackVideoSnapshot(boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_CAMERA, CameraStat.KEY_VIDEO_SNAPSHOT, hashMap);
    }

    public static void trackVoiceControl(Intent intent) {
        boolean z;
        if (intent != null) {
            HashMap hashMap = new HashMap();
            boolean z2 = false;
            try {
                z = CameraIntentManager.getInstance(intent).isUseFrontCamera();
            } catch (Exception e) {
                z = false;
            }
            if (z) {
                z2 = true;
            }
            int cameraModeId = CameraIntentManager.getInstance(intent).getCameraModeId();
            hashMap.put(CameraStat.PARAM_CAMERA_ID, !z2 ? CameraStat.VALUE_BACK_CAMERA : CameraStat.VALUE_FRONT_CAMERA);
            hashMap.put("模式", modeIdToName(cameraModeId));
            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_CALL_CAMERA_FROM_VOICE_CONTROL, hashMap);
        }
    }

    public static void trackZoomAdjusted(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put(CameraStat.PARAM_CAMERA_ID, CameraSettings.isFrontCamera() ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA);
        hashMap.put("模式", modeIdToName(DataRepository.dataItemGlobal().getCurrentMode()));
        hashMap.put("mode", str);
        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_ZOOM_ADJUSTED, hashMap);
    }

    private static String triggerModeToName(int i) {
        return (String) sTriggerModeIdToName.get(i);
    }

    private static String videoQualityToName(String str) {
        if (String.valueOf(8).equals(str)) {
            return "4k";
        }
        if (String.valueOf(6).equals(str)) {
            return "1080p";
        }
        if (String.valueOf(5).equals(str)) {
            return "720p";
        }
        if (String.valueOf(4).equals(str)) {
            return "480p";
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("unexpected video quality: ");
        sb.append(str);
        Log.e(str2, sb.toString());
        return OTHERS;
    }
}
