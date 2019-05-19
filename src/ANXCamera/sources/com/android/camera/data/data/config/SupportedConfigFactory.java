package com.android.camera.data.data.config;

import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.data.cloud.DataCloud.CloudFeature;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera2.CameraCapabilities;
import com.mi.config.a;
import com.mi.config.b;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;

public class SupportedConfigFactory {
    public static final int AI_DETECT = 242;
    public static final int AI_SCENE = 201;
    public static final int AUTO_ZOOM = 253;
    public static final int BACKLIGHT = 249;
    public static final int BEAUTY = 239;
    public static final int BOKEH = 200;
    public static final String CLOSE_BY_AI = "e";
    public static final String CLOSE_BY_BOKEH = "f";
    public static final String CLOSE_BY_BURST_SHOOT = "d";
    public static final String CLOSE_BY_FILTER = "k";
    public static final String CLOSE_BY_GROUP = "b";
    public static final String CLOSE_BY_HDR = "g";
    public static final String CLOSE_BY_HHT = "a";
    public static final String CLOSE_BY_MACRO_MODE = "m";
    public static final String CLOSE_BY_SQUARE = "l";
    public static final String CLOSE_BY_SUPER_RESOLUTION = "c";
    public static final String CLOSE_BY_ULTRA_PIXEL = "j";
    public static final String CLOSE_BY_ULTRA_WIDE = "i";
    public static final String CLOSE_BY_VIDEO = "h";
    public static final int DUAL_WATER_MARK = 240;
    public static final int EYE_LIGHT = 254;
    public static final int FAST = 233;
    public static final int FILTER = 196;
    public static final int FLASH = 193;
    public static final int FLASH_BLANK = 177;
    public static final int FLASH_DISABLE = 3089;
    public static final int FOCUS_PEAK = 199;
    public static final int GENDER_AGE = 238;
    public static final int GRADIENTER = 229;
    public static final int GROUP = 235;
    public static final int HAND_GESTURE = 252;
    public static final int HDR = 194;
    public static final int HFR = 202;
    public static final int HHT = 230;
    public static final int INVALID = 176;
    public static final int LIGHTING = 203;
    public static final int LIVE_MUSIC_SELECT = 245;
    public static final int LIVE_SHOT = 206;
    public static final int MACRO_MODE = 255;
    public static final int MAGIC_FOCUS = 231;
    public static final int MAGIC_MIRROR = 236;
    public static final int MIMOJI_EDIT = 250;
    public static final int MOON = 246;
    public static final int MORE = 197;
    public static final int[] MUTEX_MENU_CONFIGS = {229, 236, 235, 228, 230, 241, 234, 195, 238, 199, 203, 206, 209};
    public static final int NEW_SLOW_MOTION = 204;
    public static final int NIGHT = 247;
    public static final int PORTRAIT = 195;
    public static final int RATIO = 210;
    public static final int RAW = 237;
    public static final int SCENE = 234;
    public static final int SETTING = 225;
    public static final int SHINE = 212;
    public static final int SILHOUETTE = 248;
    public static final int SLOW = 232;
    public static final int SQUARE = 211;
    public static final int SUPER_RESOLUTION = 241;
    public static final int TILT = 228;
    public static final int TIMER = 226;
    public static final int ULTRA_PIXEL = 209;
    public static final int ULTRA_WIDE = 205;
    public static final int ULTRA_WIDE_BOKEH = 207;
    public static final int USER_DEFINE_WATER_MARK = 244;
    public static final int VIDEO_BOKEH = 243;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ClosableElement {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CloseElementTrigger {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ConfigItem {
    }

    private static TopConfigItem createConfigItem(int i) {
        return new TopConfigItem(i);
    }

    private static TopConfigItem createConfigItem(int i, int i2) {
        return new TopConfigItem(i, i2);
    }

    public static String getConfigKey(int i) {
        switch (i) {
            case 195:
                return "pref_camera_portrait_mode_key";
            case 199:
                return "pref_camera_peak_key";
            case 201:
                return "pref_camera_ai_scene_mode_key";
            case 206:
                return "pref_live_shot_enabled";
            case 209:
                return "pref_ultra_pixel";
            case 228:
                return "pref_camera_tilt_shift_mode";
            case 229:
                return "pref_camera_gradienter_key";
            case 230:
                return "pref_camera_hand_night_key";
            case 234:
                return "pref_camera_scenemode_setting_key";
            case 235:
                return "pref_camera_groupshot_mode_key";
            case 236:
                return "pref_camera_magic_mirror_key";
            case 238:
                return "pref_camera_show_gender_age_key";
            case 241:
                return "pref_camera_super_resolution_key";
            case 252:
                return "pref_hand_gesture";
            case 253:
                return "pref_camera_auto_zoom";
            default:
                throw new RuntimeException("unknown config item");
        }
    }

    public static final SupportedConfigs getSupportedExtraConfigs(int i, int i2, CloudFeature cloudFeature, CameraCapabilities cameraCapabilities, boolean z) {
        SupportedConfigs supportedConfigs = new SupportedConfigs();
        DataRepository.dataItemConfig();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        a dataItemFeature = DataRepository.dataItemFeature();
        switch (i) {
            case 161:
            case 174:
                if (i2 == 0 && cameraCapabilities.isSupportVideoBeauty()) {
                    supportedConfigs.add(225);
                    break;
                }
            case 162:
            case 168:
            case 169:
            case 170:
                if (i2 == 0) {
                    supportedConfigs.add(225).add(233);
                    if (b.he() && !dataItemFeature.fC()) {
                        supportedConfigs.add(232);
                    }
                    if (z && CameraSettings.isSupportMacroMode()) {
                        supportedConfigs.add(255);
                        break;
                    }
                }
                break;
            case 167:
                supportedConfigs.add(225).add(226);
                break;
            case 171:
                supportedConfigs.add(225).add(226);
                if (i2 == 1 && dataItemFeature.gB()) {
                    if (b.gP() && b.gO()) {
                        supportedConfigs.add(238);
                    }
                    if (b.hQ()) {
                        supportedConfigs.add(236);
                    }
                    if (b.ge()) {
                        supportedConfigs.add(252);
                        break;
                    }
                }
                break;
            case 175:
                supportedConfigs.add(225).add(226);
                break;
            default:
                supportedConfigs.add(225).add(226);
                supportedConfigs.add(211);
                switch (i2) {
                    case 0:
                        if (b.hL()) {
                            supportedConfigs.add(228);
                        }
                        if (b.hE()) {
                            supportedConfigs.add(229);
                        }
                        if (b.hl()) {
                            supportedConfigs.add(234);
                        }
                        if (i != 165 && z && b.id()) {
                            supportedConfigs.add(235);
                        }
                        if (z && CameraSettings.checkLensAvailability(CameraAppImpl.getAndroidContext())) {
                            supportedConfigs.add(242);
                        }
                        if (z && dataItemRunning.supportUltraPixel()) {
                            supportedConfigs.add(209);
                        }
                        if (z && CameraSettings.isSupportMacroMode()) {
                            supportedConfigs.add(255);
                            break;
                        }
                    case 1:
                        if (z && b.id() && i != 165) {
                            supportedConfigs.add(235);
                        }
                        if (i == 165 || i == 163) {
                            if (b.gP() && b.gO()) {
                                supportedConfigs.add(238);
                            }
                            if (b.hQ()) {
                                supportedConfigs.add(236);
                            }
                            if (z && dataItemRunning.supportUltraPixel()) {
                                supportedConfigs.add(209);
                            }
                            if (i == 163 && b.ge()) {
                                supportedConfigs.add(252);
                                break;
                            }
                        }
                }
                break;
        }
        return cloudFeature.filterFeature(supportedConfigs);
    }

    public static final SupportedConfigs getSupportedTopConfigs(int i, int i2, CameraCapabilities cameraCapabilities, boolean z) {
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        a dataItemFeature = DataRepository.dataItemFeature();
        dataItemConfig.reInitComponent(i, i2, cameraCapabilities);
        dataItemRunning.reInitComponent(i, i2, cameraCapabilities);
        ArrayList arrayList = new ArrayList();
        if (dataItemConfig.supportFlash()) {
            arrayList.add(createConfigItem(193));
        }
        switch (i) {
            case 161:
                if (z && i2 != 0 && dataItemFeature.fm()) {
                    arrayList.add(createConfigItem(243));
                }
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem(), 17));
                }
                arrayList.add(createConfigItem(225));
                break;
            case 162:
            case 168:
            case 169:
            case 170:
                if (i2 != 0) {
                    if (z && i == 162 && dataItemFeature.fm()) {
                        arrayList.add(createConfigItem(243));
                    }
                    if (dataItemRunning.supportTopShineEntry()) {
                        arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem(), 17));
                    }
                    arrayList.add(createConfigItem(225));
                    break;
                } else {
                    if (isSupportedAutoZoom() && z) {
                        arrayList.add(createConfigItem(253, 17));
                    }
                    if (z) {
                        if (dataItemConfig.supportHdr()) {
                            arrayList.add(createConfigItem(194));
                        }
                        if (dataItemRunning.supportTopShineEntry()) {
                            arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem(), 17));
                        }
                        if (!dataItemFeature.fC() && b.he() && b.it()) {
                            arrayList.add(createConfigItem(202));
                        }
                        arrayList.add(createConfigItem(197));
                        break;
                    } else {
                        if (dataItemRunning.supportTopShineEntry()) {
                            arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem(), 17));
                        }
                        arrayList.add(createConfigItem(225));
                        break;
                    }
                }
            case 165:
                if (dataItemConfig.supportHdr()) {
                    arrayList.add(createConfigItem(194));
                }
                if (dataItemConfig.supportAi()) {
                    arrayList.add(createConfigItem(201));
                }
                if (dataItemConfig.supportBokeh()) {
                    arrayList.add(createConfigItem(200));
                }
                if (dataItemFeature.fL() && z) {
                    arrayList.add(createConfigItem(206));
                }
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem()));
                }
                arrayList.add(createConfigItem(197));
                break;
            case 166:
            case 176:
                arrayList.clear();
                arrayList.add(createConfigItem(225));
                break;
            case 167:
                ComponentManuallyFocus manuallyFocus = dataItemConfig.getManuallyFocus();
                if (b.hA() && !manuallyFocus.getComponentValue(i).equals(manuallyFocus.getDefaultValue(i)) && cameraCapabilities.isAFRegionSupported()) {
                    arrayList.add(createConfigItem(199));
                }
                if (z && dataItemRunning.supportUltraPixel()) {
                    arrayList.add(createConfigItem(209));
                }
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem()));
                }
                arrayList.add(createConfigItem(197));
                break;
            case 171:
                if (dataItemFeature.isSupportUltraWide() && CameraSettings.isSupportedOpticalZoom() && i2 == 0 && z) {
                    arrayList.add(createConfigItem(207));
                }
                if (dataItemConfig.supportAi()) {
                    arrayList.add(createConfigItem(201, 17));
                }
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem()));
                }
                arrayList.add(createConfigItem(197));
                break;
            case 172:
                arrayList.add(createConfigItem(204));
                arrayList.add(createConfigItem(225));
                break;
            case 173:
                arrayList.add(createConfigItem(225));
                break;
            case 174:
                if (z && i2 != 0 && dataItemFeature.fm()) {
                    arrayList.add(createConfigItem(243));
                }
                arrayList.add(createConfigItem(245, 17));
                arrayList.add(createConfigItem(225));
                break;
            case 175:
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem()));
                }
                arrayList.add(createConfigItem(197));
                break;
            case 177:
                arrayList.add(createConfigItem(225));
                break;
            default:
                if (dataItemConfig.supportHdr()) {
                    arrayList.add(createConfigItem(194));
                }
                if (dataItemConfig.supportAi()) {
                    arrayList.add(createConfigItem(201));
                }
                if (dataItemConfig.supportBokeh()) {
                    arrayList.add(createConfigItem(200));
                }
                if (dataItemFeature.fL() && z) {
                    arrayList.add(createConfigItem(206));
                }
                if (dataItemRunning.supportTopShineEntry()) {
                    arrayList.add(createConfigItem(dataItemRunning.getComponentRunningShine().getTopConfigItem()));
                }
                arrayList.add(createConfigItem(197));
                break;
        }
        return TopViewPositionArray.fillNotUseViewPosition(arrayList);
    }

    public static boolean isMutexConfig(int i) {
        for (int i2 : MUTEX_MENU_CONFIGS) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    private static boolean isSupportedAutoZoom() {
        return DataRepository.dataItemFeature().fJ();
    }
}
