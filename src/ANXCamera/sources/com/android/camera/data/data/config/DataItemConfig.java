package com.android.camera.data.data.config;

import android.text.TextUtils;
import com.android.camera.data.data.DataItemBase;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;

public class DataItemConfig extends DataItemBase {
    public static final String DATA_CONFIG_AI_SCENE = "pref_camera_ai_scene_mode_key";
    public static final String DATA_CONFIG_BEAUTY_CAPTURE = "pref_beautify_level_key_capture";
    public static final String DATA_CONFIG_BEAUTY_VIDEO = "pref_beautify_level_key_video";
    public static final String DATA_CONFIG_FOCUS_MODE = "pref_camera_focus_mode_key";
    public static final String DATA_CONFIG_FOCUS_SWITCHING = "pref_qc_focus_mode_switching_key";
    public static final String DATA_CONFIG_RATIO = "pref_camera_picturesize_key";
    public static final String DATA_CONFIG_STICKER_PATH = "pref_sticker_path_key";
    public static final String DATA_CONFIG_VIDEO_BOKEH = "pref_video_bokeh_key";
    public static final String KEY = "camera_settings_simple_mode_local_";
    private int mCameraId;
    private ComponentConfigBokeh mComponentBokeh = new ComponentConfigBokeh(this);
    private ComponentConfigAi mComponentConfigAi;
    private ComponentConfigBeauty mComponentConfigBeauty;
    private ComponentConfigRatio mComponentConfigRatio;
    private ComponentConfigUltraWide mComponentConfigUltraWide;
    private ComponentConfigFlash mComponentFlash = new ComponentConfigFlash(this);
    private ComponentConfigHdr mComponentHdr = new ComponentConfigHdr(this);
    private int mIntentType;
    private ComponentManuallyDualLens mManuallyDualLens;
    private ComponentManuallyFocus mManuallyFocus;
    private ComponentConfigSlowMotion mSlowMotion;

    public DataItemConfig(int i, int i2) {
        this.mCameraId = i;
        this.mIntentType = i2;
        this.mComponentConfigBeauty = new ComponentConfigBeauty(this, i);
        this.mSlowMotion = new ComponentConfigSlowMotion(this);
        this.mComponentConfigRatio = new ComponentConfigRatio(this);
        this.mComponentConfigAi = new ComponentConfigAi(this);
    }

    public static int provideLocalId(int i, int i2) {
        return i2 == 0 ? i : i + 100;
    }

    public ComponentConfigBokeh getComponentBokeh() {
        return this.mComponentBokeh;
    }

    public ComponentConfigAi getComponentConfigAi() {
        return this.mComponentConfigAi;
    }

    public ComponentConfigBeauty getComponentConfigBeauty() {
        return this.mComponentConfigBeauty;
    }

    public ComponentConfigRatio getComponentConfigRatio() {
        return this.mComponentConfigRatio;
    }

    public ComponentConfigSlowMotion getComponentConfigSlowMotion() {
        return this.mSlowMotion;
    }

    public ComponentConfigUltraWide getComponentConfigUltraWide() {
        if (this.mComponentConfigUltraWide == null) {
            this.mComponentConfigUltraWide = new ComponentConfigUltraWide(this);
        }
        return this.mComponentConfigUltraWide;
    }

    public ComponentConfigFlash getComponentFlash() {
        return this.mComponentFlash;
    }

    public ComponentConfigHdr getComponentHdr() {
        return this.mComponentHdr;
    }

    public ComponentManuallyDualLens getManuallyDualLens() {
        if (this.mManuallyDualLens == null) {
            this.mManuallyDualLens = new ComponentManuallyDualLens(this);
        }
        return this.mManuallyDualLens;
    }

    public ComponentManuallyFocus getManuallyFocus() {
        if (this.mManuallyFocus == null) {
            this.mManuallyFocus = new ComponentManuallyFocus(this);
        }
        return this.mManuallyFocus;
    }

    public boolean isSwitchOn(String str) {
        return getBoolean(str, false);
    }

    public boolean isTransient() {
        return false;
    }

    public String provideKey() {
        StringBuilder sb = new StringBuilder();
        sb.append("camera_settings_simple_mode_local_");
        sb.append(provideLocalId(this.mCameraId, this.mIntentType));
        return sb.toString();
    }

    public boolean reConfigBokehIfHdrChanged(int i, String str) {
        if (TextUtils.isEmpty(str) || "off".equals(str) || !"on".equals(this.mComponentBokeh.getComponentValue(i))) {
            return false;
        }
        this.mComponentBokeh.toggle(i);
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:27:0x005f  */
    /* JADX WARNING: Removed duplicated region for block: B:30:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0092 A[FALL_THROUGH] */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x0095  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean reConfigFlashIfHdrChanged(int i, String str) {
        char c;
        String str2;
        String persistValue = getComponentFlash().getPersistValue(i);
        int hashCode = str.hashCode();
        if (hashCode != -1039745817) {
            if (hashCode != 3551) {
                if (hashCode != 109935) {
                    if (hashCode != 3005871) {
                        if (hashCode == 3322092 && str.equals("live")) {
                            c = 3;
                            switch (c) {
                                case 0:
                                    if (!"1".equals(persistValue) && !"2".equals(persistValue)) {
                                        if (ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(persistValue)) {
                                            str2 = ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO;
                                            break;
                                        }
                                    } else if (!b.hm()) {
                                        str2 = "0";
                                        break;
                                    } else {
                                        str2 = "3";
                                        break;
                                    }
                                    break;
                                case 1:
                                case 2:
                                case 3:
                                    if (!"0".equals(persistValue)) {
                                        str2 = "0";
                                        break;
                                    }
                                default:
                                    str2 = null;
                                    break;
                            }
                            if (str2 != null || persistValue.equals(str2)) {
                                return false;
                            }
                            getComponentFlash().setComponentValue(i, str2);
                            return !getComponentFlash().isEmpty();
                        }
                    } else if (str.equals("auto")) {
                        c = 0;
                        switch (c) {
                            case 0:
                                break;
                            case 1:
                            case 2:
                            case 3:
                                break;
                        }
                        if (str2 != null) {
                        }
                        return false;
                    }
                } else if (str.equals("off")) {
                    c = 4;
                    switch (c) {
                        case 0:
                            break;
                        case 1:
                        case 2:
                        case 3:
                            break;
                    }
                    if (str2 != null) {
                    }
                    return false;
                }
            } else if (str.equals("on")) {
                c = 1;
                switch (c) {
                    case 0:
                        break;
                    case 1:
                    case 2:
                    case 3:
                        break;
                }
                if (str2 != null) {
                }
                return false;
            }
        } else if (str.equals("normal")) {
            c = 2;
            switch (c) {
                case 0:
                    break;
                case 1:
                case 2:
                case 3:
                    break;
            }
            if (str2 != null) {
            }
            return false;
        }
        c = 65535;
        switch (c) {
            case 0:
                break;
            case 1:
            case 2:
            case 3:
                break;
        }
        if (str2 != null) {
        }
        return false;
    }

    public boolean reConfigHdrIfBokehChanged(int i, String str) {
        if (!"on".equals(str) || "off".equals(this.mComponentHdr.getComponentValue(i))) {
            return false;
        }
        this.mComponentHdr.setComponentValue(i, "off");
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x0076  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean reConfigHhrIfFlashChanged(int i, String str) {
        String str2;
        String persistValue = getComponentHdr().getPersistValue(i);
        if ("3".equals(str) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(str)) {
            if ("normal".equals(persistValue) || "live".equals(persistValue)) {
                str2 = getComponentHdr().isSupportAutoHdr() ? "auto" : "off";
                if (str2 != null || persistValue.equals(str2)) {
                    return false;
                }
                getComponentHdr().setComponentValue(i, str2);
                return !getComponentHdr().isEmpty();
            }
        } else if ("1".equals(str) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(str)) {
            if (!"off".equals(persistValue)) {
                str2 = "off";
                if (str2 != null) {
                }
                return false;
            }
        } else if ("2".equals(str) && !"live".equals(persistValue) && !"off".equals(persistValue)) {
            str2 = "off";
            if (str2 != null) {
            }
            return false;
        }
        str2 = null;
        if (str2 != null) {
        }
        return false;
    }

    public void reInitComponent(int i, int i2, CameraCapabilities cameraCapabilities) {
        getComponentConfigUltraWide().reInit(i, i2, cameraCapabilities);
        this.mComponentFlash.reInit(i, i2, cameraCapabilities, getComponentConfigUltraWide());
        this.mComponentHdr.reInit(i, i2, cameraCapabilities);
        this.mComponentBokeh.reInit(i, this.mCameraId);
        this.mComponentConfigAi.reInit(i, i2, cameraCapabilities);
        this.mComponentConfigRatio.reInit(i, i2, cameraCapabilities);
    }

    public void resetAll() {
        editor().clear().apply();
        getComponentFlash().clearClosed();
        getComponentHdr().clearClosed();
        getComponentConfigBeauty().clearClosed();
    }

    public boolean supportAi() {
        return !this.mComponentConfigAi.isEmpty();
    }

    public boolean supportBokeh() {
        return !this.mComponentBokeh.isEmpty();
    }

    public boolean supportFlash() {
        return !this.mComponentFlash.isEmpty();
    }

    public boolean supportHdr() {
        return !this.mComponentHdr.isEmpty();
    }

    public void switchOff(String str) {
        putBoolean(str, false);
    }

    public void switchOn(String str) {
        putBoolean(str, true);
    }
}
