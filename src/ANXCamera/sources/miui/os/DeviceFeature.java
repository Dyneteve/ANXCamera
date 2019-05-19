package miui.os;

import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import miui.util.FeatureParser;

public class DeviceFeature {
    public static final int BACKLIGHT_BIT = SYSTEM_RESOURCES.getInteger(285736986);
    public static final boolean PERSIST_SCREEN_EFFECT = SystemProperties.getBoolean("sys.persist_screen_effect", false);
    public static final boolean SCREEN_EFFECT_CONFLICT;
    public static final boolean SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE;
    public static final boolean SUPPORT_DISPLAYFEATURE_CALLBACK = SYSTEM_RESOURCES.getBoolean(285868077);
    public static final boolean SUPPORT_DISPLAYFEATURE_HIDL = SystemProperties.getBoolean("sys.displayfeature_hidl", false);
    public static final boolean SUPPORT_GAME_MODE = FeatureParser.getBoolean("support_touchfeature_gamemode", false);
    public static final boolean SUPPORT_LAB_GESTURE;
    public static final boolean SUPPORT_NIGHT_LIGHT = SYSTEM_RESOURCES.getBoolean(285868065);
    public static final boolean SUPPORT_NIGHT_LIGHT_ADJ = SYSTEM_RESOURCES.getBoolean(285868066);
    public static final boolean SUPPORT_PAPERMODE_ANIMATION = FeatureParser.getBoolean("support_papermode_animation", false);
    public static final Resources SYSTEM_RESOURCES = Resources.getSystem();

    static {
        boolean z = false;
        boolean z2 = (FeatureParser.getBoolean("support_autobrightness_optimize", false) && VERSION.SDK_INT > 23) || SystemProperties.getBoolean("sys.autobrightness_optimize", false);
        SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE = z2;
        boolean z3 = SystemProperties.getInt("ro.df.effect.conflict", 0) == 1 || SystemProperties.getInt("ro.vendor.df.effect.conflict", 0) == 1;
        SCREEN_EFFECT_CONFLICT = z3;
        if ("sagit".equals(Build.DEVICE) && !Build.IS_STABLE_VERSION) {
            z = true;
        }
        SUPPORT_LAB_GESTURE = z;
    }

    public static final boolean hasMirihiSupport() {
        return "perseus".equals(Build.DEVICE) || "andromeda".equals(Build.DEVICE);
    }
}
