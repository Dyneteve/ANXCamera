package com.mi.config;

import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.text.TextUtils;
import com.android.camera.AutoLockManager;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Locale;
import miui.os.Build;

/* compiled from: Device */
public class b {
    public static final boolean IS_HONGMI = d.getBoolean(d.tZ, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.tY, false);
    public static final boolean qA;
    public static final boolean qB;
    public static final boolean qC;
    public static final boolean qD = Build.IS_HONGMI_TWO_S;
    public static final boolean qE;
    public static final boolean qF = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean qG = Build.IS_HONGMI_TWO_A;
    public static final boolean qH = Build.IS_HONGMI_THREE;
    public static final boolean qI = "gucci".equals(qp);
    public static final boolean qJ = "hermes".equals(qp);
    public static final boolean qK = "hennessy".equals(qp);
    public static final boolean qL = "dior".equals(qp);
    public static final boolean qM = "kenzo".equals(qp);
    public static final boolean qN = "kate".equals(qp);
    public static final boolean qO;
    public static final boolean qP = Build.IS_HONGMI_TWOX_LC;
    public static final boolean qQ = Build.IS_MIFOUR;
    public static final boolean qR = Build.IS_MIPAD;
    public static final boolean qS = Build.IS_MIFIVE;
    public static final boolean qT = "leo".equals(qp);
    public static final boolean qU = "ferrari".equals(qp);
    public static final boolean qV = "ido".equals(qp);
    public static final boolean qW = "aqua".equals(qp);
    public static final boolean qX = "gemini".equals(qp);
    public static final boolean qY = "gold".equals(qp);
    public static final boolean qZ = "capricorn".equals(qp);
    public static final String qp = Build.DEVICE;
    public static final String qq = "qcom";
    public static final String qr = "mediatek";
    public static final String qt = "leadcore";
    public static final String qu = "nvidia";
    public static final String qv = "intel";
    private static final int qw = 100;
    public static final String qx = Build.MODEL;
    public static final boolean qy = Build.IS_MITWO;
    public static final boolean qz = "pisces".equals(qp);
    public static final boolean rA = "pisces".equals(qp);
    public static final boolean rB = "hammerhead".equals(qp);
    public static final boolean rC = "santoni".equals(qp);
    public static final boolean rD = "polaris".equals(qp);
    public static final boolean rE = "sirius".equals(qp);
    public static final boolean rF = "dipper".equals(qp);
    public static final boolean rG = "ursa".equals(qp);
    public static final boolean rH = "equuleus".equals(qp);
    public static final boolean rI = "andromeda".equals(qp);
    public static final boolean rJ = "perseus".equals(qp);
    public static final boolean rK = "cepheus".equals(qp);
    public static final boolean rL = "grus".equals(qp);
    public static final boolean rM = "pine".equals(qp);
    public static final boolean rN = "pyxis".equals(qp);
    public static final boolean rO = Build.IS_STABLE_VERSION;
    public static final boolean rP = Build.IS_CM_CUSTOMIZATION_TEST;
    private static final int rQ = 1;
    private static final int rR = 4;
    private static final int rS = 8;
    private static ArrayList<String> rT;
    public static final boolean ra = "natrium".equals(qp);
    public static final boolean rb = "lithium".equals(qp);
    public static final boolean rc = "scorpio".equals(qp);
    public static final boolean rd = "libra".equals(qp);
    public static final boolean re = "land".equals(qp);
    public static final boolean rf = "hydrogen".equals(qp);
    public static final boolean rg = "helium".equals(qp);
    public static final boolean rh = "omega".equals(qp);
    public static final boolean ri = qp.startsWith("nike");
    public static final boolean rj = qp.startsWith("mark");
    public static final boolean rk = qp.startsWith("prada");
    public static final boolean rl = qp.startsWith("mido");
    public static final boolean rm = "rolex".equals(qp);
    public static final boolean rn = "sagit".equals(qp);
    public static final boolean ro = "centaur".equals(qp);
    public static final boolean rp = "achilles".equals(qp);
    public static final boolean rq = "jason".equals(qp);
    public static final boolean rr = "tiffany".equals(qp);
    public static final boolean rs = "ulysse".equals(qp);
    public static final boolean rt = "oxygen".equals(qp);
    public static final boolean ru = "chiron".equals(qp);
    public static final boolean rv = "ugg".equals(qp);
    public static final boolean rw = "vince".equals(qp);
    public static final boolean rx = "whyred".equals(qp);
    public static final boolean ry = "beryllium".equals(qp);
    public static final boolean rz = "violet".equals(qp);

    static {
        boolean z = true;
        boolean z2 = "cancro".equals(qp) && Build.MODEL.startsWith("MI 3");
        qA = z2;
        boolean z3 = qA || qz;
        qB = z3;
        boolean z4 = Build.IS_HONGMI_TWO && !Build.IS_HONGMI_TWO_A && !Build.IS_HONGMI_TWO_S;
        qC = z4;
        boolean z5 = qC || qD;
        qE = z5;
        if (!Build.IS_HONGMI_TWOX && !"HM2014816".equals(qp)) {
            z = false;
        }
        qO = z;
    }

    public static boolean fZ() {
        return DataRepository.dataItemFeature().fZ();
    }

    public static boolean gN() {
        if (iH()) {
            return false;
        }
        return d.getBoolean(d.ul, false);
    }

    public static boolean gO() {
        return !d.getBoolean(d.vb, false);
    }

    public static boolean gP() {
        return qP || d.getBoolean(d.vk, false);
    }

    public static boolean gQ() {
        return d.getBoolean(d.uh, false);
    }

    public static boolean gR() {
        return !gS();
    }

    public static boolean gS() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        String str = SystemProperties.get("ro.miui.region");
        return TextUtils.isEmpty(str) ? TextUtils.equals(Locale.getDefault().getCountry(), "KR") : TextUtils.equals(str, "KR");
    }

    public static boolean gT() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean gU() {
        return d.getBoolean(d.um, false);
    }

    public static boolean gV() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.un, false);
    }

    public static boolean gW() {
        return d.getBoolean(d.uo, false);
    }

    public static boolean gX() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.0f && d.getBoolean(d.vl, false);
    }

    public static boolean gY() {
        return d.getBoolean(d.up, false);
    }

    public static boolean gZ() {
        return d.getBoolean(d.uq, false);
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.uk, 100);
    }

    public static String getGivenName() {
        return iH() ? "_l" : !DataRepository.dataItemFeature().getBoolean(c.th, false) ? "" : (android.os.Build.MODEL.contains("BROWN EDITION") || android.os.Build.MODEL.contains("Explorer")) ? "_a" : android.os.Build.MODEL.contains("ROY") ? "_b" : iI() ? "_s" : "";
    }

    public static boolean gg() {
        return DataRepository.dataItemFeature().gg();
    }

    public static boolean hA() {
        return he() && 21 <= VERSION.SDK_INT;
    }

    public static boolean hB() {
        return d.getBoolean(d.uI, false);
    }

    public static boolean hC() {
        return d.getBoolean(d.uJ, false);
    }

    public static boolean hD() {
        return !IS_XIAOMI && !IS_HONGMI;
    }

    public static boolean hE() {
        return d.getBoolean(d.vp, false);
    }

    public static boolean hF() {
        return d.getBoolean(d.uK, false);
    }

    public static boolean hG() {
        return d.getBoolean(d.uL, false);
    }

    public static boolean hH() {
        return !qG && !qP && !Build.IS_HONGMI_TWOX && !qA && !qH && !qC && !qD && !qF && !qy && !IS_MI2A && !qB && !qQ && d.getBoolean(d.vq, true);
    }

    public static boolean hI() {
        return d.getBoolean(d.vr, false);
    }

    public static boolean hJ() {
        return qy && !IS_MI2A;
    }

    public static boolean hK() {
        return d.getBoolean(d.uM, false);
    }

    public static int hL() {
        return d.getInteger(d.vD, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean hM() {
        return d.getBoolean(d.uN, false);
    }

    public static boolean hN() {
        return d.getBoolean(d.uO, false);
    }

    public static boolean hO() {
        return false;
    }

    public static boolean hP() {
        return d.getBoolean(d.uS, false);
    }

    public static boolean hQ() {
        return d.getBoolean(d.ud, false);
    }

    public static boolean hR() {
        return d.getBoolean(d.uT, false);
    }

    public static boolean hS() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uV, false);
    }

    public static String hT() {
        return d.getString(d.ue);
    }

    public static String hU() {
        return d.getString(d.uf);
    }

    public static boolean hV() {
        return d.getBoolean(d.vs, false);
    }

    public static boolean hW() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uU, false);
    }

    public static boolean hX() {
        return (qM && Build.IS_INTERNATIONAL_BUILD) || re;
    }

    public static boolean hY() {
        return true;
    }

    public static boolean hZ() {
        return d.getBoolean(d.va, false);
    }

    public static boolean ha() {
        return d.getBoolean(d.uZ, false);
    }

    public static boolean hb() {
        return d.getBoolean(d.ur, false);
    }

    public static boolean hc() {
        return !rP && d.getBoolean(d.us, false);
    }

    public static boolean hd() {
        return d.getBoolean(d.ut, false);
    }

    public static boolean he() {
        return qq.equals(d.getString(d.ub));
    }

    public static boolean hf() {
        return qu.equals(d.getString(d.ub));
    }

    public static boolean hg() {
        return qt.equals(d.getString(d.ub));
    }

    public static boolean hh() {
        return d.getBoolean(d.uc, false);
    }

    public static boolean hi() {
        return false;
    }

    public static boolean hj() {
        return d.getBoolean(d.uu, false);
    }

    public static boolean hk() {
        return d.getBoolean(d.uv, false);
    }

    public static boolean hl() {
        return d.getBoolean(d.uw, false);
    }

    public static boolean hm() {
        return d.getBoolean(d.ux, false);
    }

    public static boolean hn() {
        return d.getBoolean(d.uy, false);
    }

    public static boolean ho() {
        return d.getBoolean(d.uz, false);
    }

    public static boolean hp() {
        return (d.getInteger(d.rU, 0) & 1) != 0;
    }

    public static boolean hq() {
        return (d.getInteger(d.rU, 0) & 13) != 0;
    }

    public static boolean hr() {
        return !DataRepository.dataItemFeature().fj() && IS_HONGMI;
    }

    public static boolean hs() {
        return (d.getInteger(d.rU, 0) & 4) != 0;
    }

    public static boolean ht() {
        return d.getBoolean(d.vn, false) && hu();
    }

    public static boolean hu() {
        return false;
    }

    public static boolean hv() {
        return d.getBoolean(d.uF, false);
    }

    public static boolean hw() {
        return d.getBoolean(d.uC, false);
    }

    public static boolean hx() {
        return !qG && !qP && !Build.IS_HONGMI_TWOX && !qA && !qH && !qC && !qD && !qF && !qy && !IS_MI2A && !qB && d.getBoolean(d.vo, true);
    }

    public static boolean hy() {
        return false;
    }

    public static boolean hz() {
        return d.getBoolean(d.uH, false);
    }

    public static boolean iA() {
        return d.getBoolean(d.vL, false);
    }

    public static boolean iB() {
        return iz() || iA();
    }

    public static boolean iC() {
        return d.getBoolean(d.vC, false);
    }

    public static boolean iD() {
        return d.getBoolean(d.vN, false);
    }

    public static boolean iE() {
        return d.getBoolean(d.vQ, true);
    }

    public static boolean iF() {
        return d.getBoolean(d.vR, false);
    }

    public static boolean iG() {
        return d.getBoolean(d.vS, false);
    }

    public static boolean iH() {
        boolean z = false;
        if ("onc".equals(qp)) {
            String str = SystemProperties.get("ro.boot.hwversion");
            if (!TextUtils.isEmpty(str)) {
                if ('2' == str.charAt(0)) {
                    z = true;
                }
                return z;
            }
        }
        return false;
    }

    public static boolean iI() {
        return qp.equalsIgnoreCase("lavender") && "India_48_5".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean iJ() {
        return rJ && Build.IS_INTERNATIONAL_BUILD;
    }

    public static boolean iK() {
        return iJ() || rN || rL;
    }

    public static boolean ia() {
        return !qA && !qQ && !Build.IS_HONGMI_TWOX && !qG && d.getBoolean(d.vt, true);
    }

    public static boolean ib() {
        return !d.getBoolean(d.vf, false);
    }

    public static boolean ic() {
        return !d.getBoolean(d.vu, false) && !isMTKPlatform();
    }

    public static boolean id() {
        return d.getBoolean(d.vg, true);
    }

    public static boolean ie() {
        return d.getBoolean(d.vv, false);
    }

    /* renamed from: if reason: not valid java name */
    public static ArrayList<String> m3182if() {
        if (rT == null) {
            rT = new ArrayList<>();
            String[] stringArray = d.getStringArray(d.ug);
            if (stringArray != null) {
                Collections.addAll(rT, stringArray);
            }
        }
        return rT;
    }

    public static boolean ig() {
        return d.getBoolean(d.uY, false);
    }

    public static boolean ih() {
        return d.getBoolean(d.uj, false);
    }

    public static boolean ii() {
        return false;
    }

    public static boolean ij() {
        return d.getBoolean(d.ve, true);
    }

    public static boolean ik() {
        return d.getBoolean(d.vz, false);
    }

    public static boolean il() {
        if (!rx) {
            return d.getBoolean(d.vh, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean im() {
        return rb || ru || rD;
    }

    public static boolean in() {
        return d.getBoolean(d.vH, true);
    }

    public static boolean ip() {
        return d.getBoolean(d.vA, true);
    }

    public static boolean iq() {
        return d.getBoolean(d.vc, false);
    }

    public static boolean ir() {
        return iq() && d.getBoolean(d.vd, true);
    }

    private static boolean is() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    public static boolean isMTKPlatform() {
        return qr.equals(d.getString(d.ub));
    }

    public static boolean isPad() {
        return d.getBoolean(d.ua, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.vP, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.vw, false);
    }

    private static boolean it() {
        return d.getBoolean(d.vi, false) || is();
    }

    public static boolean iu() {
        return !it() && DataRepository.dataItemFeature().gF() && m3182if() != null && !m3182if().isEmpty();
    }

    public static boolean iv() {
        return d.getBoolean(d.vF, false);
    }

    public static boolean iw() {
        return d.getBoolean(d.vO, false);
    }

    public static boolean ix() {
        return d.getBoolean(d.vI, false);
    }

    public static boolean iy() {
        return d.getBoolean(d.vJ, false);
    }

    public static boolean iz() {
        return d.getBoolean(d.vK, false);
    }

    public static boolean r(boolean z) {
        if ("fr_sfr".equals(SystemProperties.get("ro.miui.customized.region"))) {
            return false;
        }
        return z;
    }
}
