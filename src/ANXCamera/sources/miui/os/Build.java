package miui.os;

import android.content.Context;
import android.os.Build.VERSION;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.provider.MiuiSettings.System;
import android.text.TextUtils;
import com.miui.internal.cust.PrivateConfig;
import com.miui.internal.cust.PrivateWaterMarkerConfig;
import miui.util.FeatureParser;

public class Build extends android.os.Build {
    public static final boolean HAS_CUST_PARTITION = SystemProperties.getBoolean("ro.miui.has_cust_partition", false);
    public static final boolean IS_ALPHA_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_alpha");
    public static final boolean IS_CDMA = (IS_MIONE_CDMA || IS_MITWO_CDMA || IS_MITHREE_CDMA || IS_MIFOUR_CDMA || IS_MIFOUR_LTE_CT);
    public static final boolean IS_CM_COOPERATION = ("cm".equals(SystemProperties.get("ro.carrier.name")) && "cn_cmcooperation".equals(SystemProperties.get("ro.miui.cust_variant")));
    public static final boolean IS_CM_CUSTOMIZATION = ("cm".equals(SystemProperties.get("ro.carrier.name")) && ("cn_chinamobile".equals(SystemProperties.get("ro.miui.cust_variant")) || "cn_cta".equals(SystemProperties.get("ro.miui.cust_variant"))));
    public static final boolean IS_CM_CUSTOMIZATION_TEST = "cm".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CTA_BUILD = "1".equals(SystemProperties.get("ro.miui.cta"));
    public static final boolean IS_CTS_BUILD = (!SystemProperties.getBoolean("persist.sys.miui_optimization", !"1".equals(SystemProperties.get("ro.miui.cts"))));
    public static final boolean IS_CT_CUSTOMIZATION = "ct".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CT_CUSTOMIZATION_TEST = "ct".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_CU_CUSTOMIZATION = "cu".equals(SystemProperties.get("ro.carrier.name"));
    public static final boolean IS_CU_CUSTOMIZATION_TEST = "cu".equals(SystemProperties.get("ro.cust.test"));
    public static final boolean IS_DEBUGGABLE = (SystemProperties.getInt("ro.debuggable", 0) == 1);
    public static final boolean IS_DEVELOPMENT_VERSION = (!TextUtils.isEmpty(VERSION.INCREMENTAL) && VERSION.INCREMENTAL.matches(REGULAR_EXPRESSION_FOR_DEVELOPMENT));
    public static final boolean IS_FUNCTION_LIMITED = "1".equals(SystemProperties.get(System.KEY_FUNCTION_LIMIT_SWITCH));
    public static final boolean IS_GLOBAL_BUILD = SystemProperties.get("ro.product.mod_device", "").endsWith("_global");
    public static final boolean IS_HONGMI = (IS_HONGMI_TWO || IS_HONGMI_THREE || IS_HONGMI_TWOX || IS_HONGMI_THREE_LTE || IS_HONGMI_TWOX_LC || IS_HONGMI_TWOS_LTE_MTK || IS_HONGMI_THREEX);
    public static final boolean IS_HONGMI2_TDSCDMA = "HM2013022".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE = ("lcsh92_wet_jb9".equals(DEVICE) || "lcsh92_wet_tdd".equals(DEVICE));
    public static final boolean IS_HONGMI_THREEX = "gucci".equals(DEVICE);
    public static final boolean IS_HONGMI_THREEX_CM = (IS_HONGMI_THREEX && "cm".equals(SystemProperties.get("persist.sys.modem")));
    public static final boolean IS_HONGMI_THREEX_CT = (IS_HONGMI_THREEX && "ct".equals(SystemProperties.get("persist.sys.modem")));
    public static final boolean IS_HONGMI_THREEX_CU = (IS_HONGMI_THREEX && "cu".equals(SystemProperties.get("persist.sys.modem")));
    public static final boolean IS_HONGMI_THREE_LTE = "dior".equals(DEVICE);
    public static final boolean IS_HONGMI_THREE_LTE_CM = (IS_HONGMI_THREE_LTE && "LTETD".equals(SystemProperties.get("ro.boot.modem")));
    public static final boolean IS_HONGMI_THREE_LTE_CU = (IS_HONGMI_THREE_LTE && "LTEW".equals(SystemProperties.get("ro.boot.modem")));
    public static final boolean IS_HONGMI_TWO = ("HM2013022".equals(DEVICE) || "HM2013023".equals(DEVICE) || IS_HONGMI_TWO_A || IS_HONGMI_TWO_S);
    public static final boolean IS_HONGMI_TWOS_LTE_MTK = "HM2014501".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX = (IS_HONGMI_TWOX_CU || IS_HONGMI_TWOX_CT || IS_HONGMI_TWOX_CM || IS_HONGMI_TWOX_IN || IS_HONGMI_TWOX_SA || IS_HONGMI_TWOX_BR);
    public static final boolean IS_HONGMI_TWOX_BR = "HM2014819".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_CM = ("HM2014813".equals(DEVICE) || "HM2014112".equals(DEVICE));
    public static final boolean IS_HONGMI_TWOX_CT = ("HM2014812".equals(DEVICE) || "HM2014821".equals(DEVICE));
    public static final boolean IS_HONGMI_TWOX_CU = "HM2014811".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_IN = "HM2014818".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_LC = "lte26007".equals(DEVICE);
    public static final boolean IS_HONGMI_TWOX_SA = "HM2014817".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_A = "armani".equals(DEVICE);
    public static final boolean IS_HONGMI_TWO_S = ("HM2014011".equals(DEVICE) || "HM2014012".equals(DEVICE));
    public static final boolean IS_INTERNATIONAL_BUILD = SystemProperties.get("ro.product.mod_device", "").contains("_global");
    public static final boolean IS_MI1S = ("MI 1S".equals(MODEL) || "MI 1SC".equals(MODEL));
    public static final boolean IS_MI2A = ("MI 2A".equals(MODEL) || "MI 2A TD".equals(MODEL));
    public static final boolean IS_MIFIVE = "virgo".equals(DEVICE);
    public static final boolean IS_MIFOUR = ("cancro".equals(DEVICE) && MODEL.startsWith("MI 4"));
    public static final boolean IS_MIFOUR_CDMA = (IS_MIFOUR && "CDMA".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIFOUR_LTE_CM = (IS_MIFOUR && "LTE-CMCC".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIFOUR_LTE_CT = (IS_MIFOUR && "LTE-CT".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIFOUR_LTE_CU = (IS_MIFOUR && "LTE-CU".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIFOUR_LTE_INDIA = (IS_MIFOUR && "LTE-India".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIFOUR_LTE_SEASA = (IS_MIFOUR && "LTE-SEAsa".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIONE = ("mione".equals(DEVICE) || "mione_plus".equals(DEVICE));
    public static final boolean IS_MIONE_CDMA = (IS_MIONE && hasMsm8660Property());
    public static final boolean IS_MIPAD = "mocha".equals(DEVICE);
    public static final boolean IS_MITHREE = ("pisces".equals(DEVICE) || ("cancro".equals(DEVICE) && MODEL.startsWith("MI 3")));
    public static final boolean IS_MITHREE_CDMA = (IS_MITHREE && "MI 3C".equals(MODEL));
    public static final boolean IS_MITHREE_TDSCDMA = (IS_MITHREE && "TD".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MITWO = ("aries".equals(DEVICE) || "taurus".equals(DEVICE) || "taurus_td".equals(DEVICE));
    public static final boolean IS_MITWO_CDMA = (IS_MITWO && "CDMA".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MITWO_TDSCDMA = (IS_MITWO && "TD".equals(SystemProperties.get("persist.radio.modem")));
    public static final boolean IS_MIUI = (!SystemProperties.get(PROP_MIUI_VERSION_CODE, "").isEmpty());
    public static final boolean IS_N7 = "flo".equals(DEVICE);
    public static final boolean IS_OFFICIAL_VERSION = (IS_DEVELOPMENT_VERSION || IS_STABLE_VERSION);
    public static final boolean IS_PRIVATE_BUILD = PrivateConfig.IS_PRIVATE_BUILD;
    public static final boolean IS_PRIVATE_WATER_MARKER = PrivateWaterMarkerConfig.IS_PRIVATE_WATER_MARKER;
    public static final boolean IS_PRO_DEVICE = SystemProperties.get("ro.miui.cust_device", "").endsWith("_pro");
    public static final boolean IS_STABLE_VERSION = ("user".equals(TYPE) && !TextUtils.isEmpty(VERSION.INCREMENTAL) && VERSION.INCREMENTAL.matches(REGULAR_EXPRESSION_FOR_STABLE));
    public static final boolean IS_TABLET = isTablet();
    public static final boolean IS_TDS_CDMA = (IS_MITHREE_TDSCDMA || IS_HONGMI2_TDSCDMA || IS_MITWO_TDSCDMA);
    public static final boolean IS_XIAOMI = (IS_MIONE || IS_MITWO || IS_MITHREE || IS_MIFOUR || IS_MIFIVE);
    private static final String PROP_MIUI_VERSION_CODE = "ro.miui.ui.version.code";
    private static final String REGULAR_EXPRESSION_FOR_DEVELOPMENT = "\\d+(.\\d+){2,}(-internal)?";
    private static final String REGULAR_EXPRESSION_FOR_STABLE = "^V(\\d+.)+([A-Z]+\\d{0,}.?)+(\\d+.?){0,}$";
    public static final String USERDATA_IMAGE_VERSION_CODE = getUserdataImageVersionCode();
    public static final String USER_MODE = "persist.sys.user_mode";
    public static final int USER_MODE_ELDER = 1;
    public static final int USER_MODE_NORMAL = 0;

    protected Build() throws InstantiationException {
        throw new InstantiationException("Cannot instantiate utility class");
    }

    public static boolean checkRegion(String str) {
        return getRegion().equalsIgnoreCase(str);
    }

    public static String getCustVariant() {
        return !IS_INTERNATIONAL_BUILD ? SystemProperties.get("ro.miui.cust_variant", "cn") : SystemProperties.get("ro.miui.cust_variant", "hk");
    }

    public static String getRegion() {
        return SystemProperties.get("ro.miui.region", "CN");
    }

    public static int getUserMode() {
        return SystemProperties.getInt(USER_MODE, 0);
    }

    private static String getUserdataImageVersionCode() {
        String str = SystemProperties.get("ro.miui.userdata_version", "");
        if ("".equals(str)) {
            return "Unavailable";
        }
        String str2 = IS_INTERNATIONAL_BUILD ? "global" : "cn";
        String str3 = SystemProperties.get("ro.carrier.name", "");
        if (!"".equals(str3)) {
            StringBuilder sb = new StringBuilder();
            sb.append("_");
            sb.append(str3);
            str3 = sb.toString();
        }
        return String.format("%s(%s%s)", new Object[]{str, str2, str3});
    }

    public static boolean hasCameraFlash(Context context) {
        return FeatureParser.getBoolean("support_torch", true);
    }

    private static boolean hasMsm8660Property() {
        String str = SystemProperties.get("ro.soc.name");
        return "msm8660".equals(str) || "unkown".equals(str);
    }

    private static boolean isTablet() {
        return SystemProperties.get("ro.build.characteristics").contains("tablet");
    }

    private static void reboot(boolean z, String str, boolean z2) {
        try {
            IPowerManager asInterface = Stub.asInterface(ServiceManager.getService("power"));
            if (asInterface != null) {
                asInterface.reboot(z, str, z2);
            }
        } catch (RemoteException e) {
        }
    }

    public static void setUserMode(Context context, int i) {
        SystemProperties.set(USER_MODE, Integer.toString(i));
        reboot(false, null, false);
    }
}
