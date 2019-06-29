package miui.os;

import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import miui.util.FeatureParser;

public class DeviceFeature {
    public static final int BACKLIGHT_BIT = SYSTEM_RESOURCES.getInteger(285802522);
    public static final boolean PERSIST_SCREEN_EFFECT = SystemProperties.getBoolean("sys.persist_screen_effect", false);
    public static final boolean SCREEN_EFFECT_CONFLICT = (SystemProperties.getInt("ro.df.effect.conflict", 0) == 1 || SystemProperties.getInt("ro.vendor.df.effect.conflict", 0) == 1);
    public static final boolean SUPPORT_3D_GESTURE;
    public static final boolean SUPPORT_AUTO_BRIGHTNESS_OPTIMIZE = ((FeatureParser.getBoolean("support_autobrightness_optimize", false) && VERSION.SDK_INT > 23) || SystemProperties.getBoolean("sys.autobrightness_optimize", false));
    public static final boolean SUPPORT_CAMERA_ANIMATION = "pyxis".equals(Build.DEVICE);
    public static final boolean SUPPORT_DISPLAYFEATURE_CALLBACK = SYSTEM_RESOURCES.getBoolean(285933613);
    public static final boolean SUPPORT_DISPLAYFEATURE_HIDL = SystemProperties.getBoolean("sys.displayfeature_hidl", false);
    public static final boolean SUPPORT_GAME_MODE = FeatureParser.getBoolean("support_touchfeature_gamemode", false);
    public static final boolean SUPPORT_LAB_GESTURE = ("sagit".equals(Build.DEVICE) && !Build.IS_STABLE_VERSION);
    public static final boolean SUPPORT_NIGHT_LIGHT = SYSTEM_RESOURCES.getBoolean(285933601);
    public static final boolean SUPPORT_NIGHT_LIGHT_ADJ = SYSTEM_RESOURCES.getBoolean(285933602);
    public static final boolean SUPPORT_PAPERMODE_ANIMATION = FeatureParser.getBoolean("support_papermode_animation", false);
    public static final Resources SYSTEM_RESOURCES = Resources.getSystem();

    static {
        boolean z = false;
        if ("cepheus".equals(Build.DEVICE) && !Build.IS_INTERNATIONAL_BUILD) {
            z = true;
        }
        SUPPORT_3D_GESTURE = z;
    }

    public static final boolean hasMirihiSupport() {
        return "perseus".equals(Build.DEVICE) || "andromeda".equals(Build.DEVICE);
    }

    public static final boolean hasPopupCameraSupport() {
        return "raphael".equals(Build.DEVICE) || "davinci".equals(Build.DEVICE) || "raphaelin".equals(Build.DEVICE) || "davinciin".equals(Build.DEVICE);
    }
}
