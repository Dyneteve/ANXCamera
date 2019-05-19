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
    public static final boolean IS_HONGMI = d.getBoolean(d.tQ, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.tP, false);
    public static final boolean qA;
    public static final boolean qB = Build.IS_HONGMI_TWO_S;
    public static final boolean qC;
    public static final boolean qD = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean qE = Build.IS_HONGMI_TWO_A;
    public static final boolean qF = Build.IS_HONGMI_THREE;
    public static final boolean qG = "gucci".equals(qn);
    public static final boolean qH = "hermes".equals(qn);
    public static final boolean qI = "hennessy".equals(qn);
    public static final boolean qJ = "dior".equals(qn);
    public static final boolean qK = "kenzo".equals(qn);
    public static final boolean qL = "kate".equals(qn);
    public static final boolean qM;
    public static final boolean qN = Build.IS_HONGMI_TWOX_LC;
    public static final boolean qO = Build.IS_MIFOUR;
    public static final boolean qP = Build.IS_MIPAD;
    public static final boolean qQ = Build.IS_MIFIVE;
    public static final boolean qR = "leo".equals(qn);
    public static final boolean qS = "ferrari".equals(qn);
    public static final boolean qT = "ido".equals(qn);
    public static final boolean qU = "aqua".equals(qn);
    public static final boolean qV = "gemini".equals(qn);
    public static final boolean qW = "gold".equals(qn);
    public static final boolean qX = "capricorn".equals(qn);
    public static final boolean qY = "natrium".equals(qn);
    public static final boolean qZ = "lithium".equals(qn);
    public static final String qn = Build.DEVICE;
    public static final String qo = "qcom";
    public static final String qp = "mediatek";
    public static final String qq = "leadcore";
    public static final String qr = "nvidia";
    public static final String qt = "intel";
    private static final int qu = 100;
    public static final String qv = Build.MODEL;
    public static final boolean qw = Build.IS_MITWO;
    public static final boolean qx = "pisces".equals(qn);
    public static final boolean qy;
    public static final boolean qz;
    public static final boolean rA = "santoni".equals(qn);
    public static final boolean rB = "polaris".equals(qn);
    public static final boolean rC = "sirius".equals(qn);
    public static final boolean rD = "dipper".equals(qn);
    public static final boolean rE = "ursa".equals(qn);
    public static final boolean rF = "equuleus".equals(qn);
    public static final boolean rG = "andromeda".equals(qn);
    public static final boolean rH = "perseus".equals(qn);
    public static final boolean rI = "cepheus".equals(qn);
    public static final boolean rJ = "grus".equals(qn);
    public static final boolean rK = "pine".equals(qn);
    public static final boolean rL = "pyxis".equals(qn);
    public static final boolean rM = Build.IS_STABLE_VERSION;
    public static final boolean rN = Build.IS_CM_CUSTOMIZATION_TEST;
    private static final int rO = 1;
    private static final int rP = 4;
    private static final int rQ = 8;
    private static ArrayList<String> rR;
    public static final boolean ra = "scorpio".equals(qn);
    public static final boolean rb = "libra".equals(qn);
    public static final boolean rc = "land".equals(qn);
    public static final boolean rd = "hydrogen".equals(qn);
    public static final boolean re = "helium".equals(qn);
    public static final boolean rf = "omega".equals(qn);
    public static final boolean rg = qn.startsWith("nike");
    public static final boolean rh = qn.startsWith("mark");
    public static final boolean ri = qn.startsWith("prada");
    public static final boolean rj = qn.startsWith("mido");
    public static final boolean rk = "rolex".equals(qn);
    public static final boolean rl = "sagit".equals(qn);
    public static final boolean rm = "centaur".equals(qn);
    public static final boolean rn = "achilles".equals(qn);
    public static final boolean ro = "jason".equals(qn);
    public static final boolean rp = "tiffany".equals(qn);
    public static final boolean rq = "ulysse".equals(qn);
    public static final boolean rr = "oxygen".equals(qn);
    public static final boolean rs = "chiron".equals(qn);
    public static final boolean rt = "ugg".equals(qn);
    public static final boolean ru = "vince".equals(qn);
    public static final boolean rv = "whyred".equals(qn);
    public static final boolean rw = "beryllium".equals(qn);
    public static final boolean rx = "violet".equals(qn);
    public static final boolean ry = "pisces".equals(qn);
    public static final boolean rz = "hammerhead".equals(qn);

    static {
        boolean z = true;
        boolean z2 = "cancro".equals(qn) && Build.MODEL.startsWith("MI 3");
        qy = z2;
        boolean z3 = qy || qx;
        qz = z3;
        boolean z4 = Build.IS_HONGMI_TWO && !Build.IS_HONGMI_TWO_A && !Build.IS_HONGMI_TWO_S;
        qA = z4;
        boolean z5 = qA || qB;
        qC = z5;
        if (!Build.IS_HONGMI_TWOX && !"HM2014816".equals(qn)) {
            z = false;
        }
        qM = z;
    }

    public static boolean fY() {
        return DataRepository.dataItemFeature().fY();
    }

    public static boolean gH() {
        if (iD()) {
            return false;
        }
        return d.getBoolean(d.uc, false);
    }

    public static boolean gI() {
        return !d.getBoolean(d.uS, false);
    }

    public static boolean gJ() {
        return qN || d.getBoolean(d.vb, false);
    }

    public static boolean gK() {
        return d.getBoolean(d.tY, false);
    }

    public static boolean gL() {
        return !gM();
    }

    public static boolean gM() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        String str = SystemProperties.get("ro.miui.region");
        return TextUtils.isEmpty(str) ? TextUtils.equals(Locale.getDefault().getCountry(), "KR") : TextUtils.equals(str, "KR");
    }

    public static boolean gN() {
        return d.getBoolean(d.tZ, false);
    }

    public static boolean gO() {
        return d.getBoolean(d.ud, false);
    }

    public static boolean gP() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.ue, false);
    }

    public static boolean gQ() {
        return d.getBoolean(d.uf, false);
    }

    public static boolean gR() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.0f && d.getBoolean(d.vc, false);
    }

    public static boolean gS() {
        return d.getBoolean(d.ug, false);
    }

    public static boolean gT() {
        return d.getBoolean(d.uh, false);
    }

    public static boolean gU() {
        return d.getBoolean(d.uQ, false);
    }

    public static boolean gV() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean gW() {
        return !rN && d.getBoolean(d.uj, false);
    }

    public static boolean gX() {
        return d.getBoolean(d.uk, false);
    }

    public static boolean gY() {
        return qo.equals(d.getString(d.tS));
    }

    public static boolean gZ() {
        return qr.equals(d.getString(d.tS));
    }

    public static boolean ge() {
        return DataRepository.dataItemFeature().ge();
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.ub, 100);
    }

    public static String getGivenName() {
        return iD() ? "_l" : !DataRepository.dataItemFeature().getBoolean(c.tf, false) ? "" : (android.os.Build.MODEL.contains("BROWN EDITION") || android.os.Build.MODEL.contains("Explorer")) ? "_a" : android.os.Build.MODEL.contains("ROY") ? "_b" : iE() ? "_s" : "";
    }

    public static boolean hA() {
        return d.getBoolean(d.uC, false);
    }

    public static boolean hB() {
        return !qE && !qN && !Build.IS_HONGMI_TWOX && !qy && !qF && !qA && !qB && !qD && !qw && !IS_MI2A && !qz && !qO && d.getBoolean(d.vh, true);
    }

    public static boolean hC() {
        return d.getBoolean(d.vi, false);
    }

    public static boolean hD() {
        return qw && !IS_MI2A;
    }

    public static boolean hE() {
        return d.getBoolean(d.uD, false);
    }

    public static int hF() {
        return d.getInteger(d.vu, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean hG() {
        return d.getBoolean(d.uE, false);
    }

    public static boolean hH() {
        return d.getBoolean(d.uF, false);
    }

    public static boolean hI() {
        return false;
    }

    public static boolean hJ() {
        return d.getBoolean(d.uJ, false);
    }

    public static boolean hK() {
        return d.getBoolean(d.tU, false);
    }

    public static boolean hL() {
        return d.getBoolean(d.uK, false);
    }

    public static boolean hM() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uM, false);
    }

    public static String hN() {
        return d.getString(d.tV);
    }

    public static String hO() {
        return d.getString(d.tW);
    }

    public static boolean hP() {
        return d.getBoolean(d.vj, false);
    }

    public static boolean hQ() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uL, false);
    }

    public static boolean hR() {
        return (qK && Build.IS_INTERNATIONAL_BUILD) || rc;
    }

    public static boolean hS() {
        return true;
    }

    public static boolean hT() {
        return d.getBoolean(d.uR, false);
    }

    public static boolean hU() {
        return !qy && !qO && !Build.IS_HONGMI_TWOX && !qE && d.getBoolean(d.vk, true);
    }

    public static boolean hV() {
        return !d.getBoolean(d.uW, false);
    }

    public static boolean hW() {
        return !d.getBoolean(d.vl, false) && !isMTKPlatform();
    }

    public static boolean hX() {
        return d.getBoolean(d.uX, true);
    }

    public static boolean hY() {
        return d.getBoolean(d.vm, false);
    }

    public static boolean hZ() {
        return false;
    }

    public static boolean ha() {
        return qq.equals(d.getString(d.tS));
    }

    public static boolean hb() {
        return d.getBoolean(d.tT, false);
    }

    public static boolean hc() {
        return false;
    }

    public static boolean hd() {
        return d.getBoolean(d.ul, false);
    }

    public static boolean he() {
        return d.getBoolean(d.um, false);
    }

    public static boolean hf() {
        return d.getBoolean(d.un, false);
    }

    public static boolean hg() {
        return d.getBoolean(d.uo, false);
    }

    public static boolean hh() {
        return d.getBoolean(d.up, false);
    }

    public static boolean hi() {
        return d.getBoolean(d.uq, false);
    }

    public static boolean hj() {
        return (d.getInteger(d.rS, 0) & 1) != 0;
    }

    public static boolean hk() {
        return (d.getInteger(d.rS, 0) & 13) != 0;
    }

    public static boolean hl() {
        return !DataRepository.dataItemFeature().fj() && IS_HONGMI;
    }

    public static boolean hm() {
        return (d.getInteger(d.rS, 0) & 4) != 0;
    }

    public static boolean hn() {
        return d.getBoolean(d.ve, false) && ho();
    }

    public static boolean ho() {
        return false;
    }

    public static boolean hp() {
        return d.getBoolean(d.uw, false);
    }

    public static boolean hq() {
        return d.getBoolean(d.ut, false);
    }

    public static boolean hr() {
        return !qE && !qN && !Build.IS_HONGMI_TWOX && !qy && !qF && !qA && !qB && !qD && !qw && !IS_MI2A && !qz && d.getBoolean(d.vf, true);
    }

    public static boolean hs() {
        return false;
    }

    public static boolean ht() {
        return d.getBoolean(d.uy, false);
    }

    public static boolean hu() {
        return gY() && 21 <= VERSION.SDK_INT;
    }

    public static boolean hv() {
        return d.getBoolean(d.uz, false);
    }

    public static boolean hw() {
        return d.getBoolean(d.uA, false);
    }

    public static boolean hx() {
        return !IS_XIAOMI && !IS_HONGMI;
    }

    public static boolean hy() {
        return d.getBoolean(d.vg, false);
    }

    public static boolean hz() {
        return d.getBoolean(d.uB, false);
    }

    public static boolean iA() {
        return d.getBoolean(d.vI, false);
    }

    public static boolean iB() {
        return rD || rB;
    }

    public static boolean iC() {
        return d.getBoolean(d.vJ, false);
    }

    public static boolean iD() {
        boolean z = false;
        if ("onc".equals(qn)) {
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

    public static boolean iE() {
        return qn.equalsIgnoreCase("lavender") && ("India_48_5".equalsIgnoreCase(System.getProperty("ro.boot.hwc")) || android.os.Build.MODEL.contains("7S"));
    }

    public static boolean iF() {
        return rH && Build.IS_INTERNATIONAL_BUILD;
    }

    public static boolean iG() {
        return rI;
    }

    public static boolean iH() {
        return iF() || rL;
    }

    public static ArrayList<String> ia() {
        if (rR == null) {
            rR = new ArrayList<>();
            String[] stringArray = d.getStringArray(d.tX);
            if (stringArray != null) {
                Collections.addAll(rR, stringArray);
            }
        }
        return rR;
    }

    public static boolean ib() {
        return d.getBoolean(d.uP, false);
    }

    public static boolean ic() {
        return d.getBoolean(d.ua, false);
    }

    public static boolean id() {
        return false;
    }

    public static boolean ie() {
        return d.getBoolean(d.uV, true);
    }

    /* renamed from: if reason: not valid java name */
    public static boolean m3144if() {
        return d.getBoolean(d.vq, false);
    }

    public static boolean ig() {
        if (!rv) {
            return d.getBoolean(d.uY, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean ih() {
        return qZ || rs || rB;
    }

    public static boolean ii() {
        return d.getBoolean(d.vy, true);
    }

    public static boolean ij() {
        return d.getBoolean(d.vr, true);
    }

    public static boolean ik() {
        return d.getBoolean(d.uT, false);
    }

    public static boolean il() {
        return ik() && d.getBoolean(d.uU, true);
    }

    private static boolean im() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean in() {
        return d.getBoolean(d.uZ, false) || im();
    }

    public static boolean ip() {
        return !in() && DataRepository.dataItemFeature().gC() && ia() != null && !ia().isEmpty();
    }

    public static boolean iq() {
        return d.getBoolean(d.vw, false);
    }

    public static boolean ir() {
        return d.getBoolean(d.vF, false);
    }

    public static boolean is() {
        return d.getBoolean(d.vz, false);
    }

    public static boolean isMTKPlatform() {
        return qp.equals(d.getString(d.tS));
    }

    public static boolean isPad() {
        return d.getBoolean(d.tR, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.vG, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.vn, false);
    }

    public static boolean it() {
        return d.getBoolean(d.vA, false);
    }

    public static boolean iu() {
        return d.getBoolean(d.vB, false);
    }

    public static boolean iv() {
        return d.getBoolean(d.vC, false);
    }

    public static boolean iw() {
        return iu() || iv();
    }

    public static boolean ix() {
        return d.getBoolean(d.vt, false);
    }

    public static boolean iy() {
        return d.getBoolean(d.vE, false);
    }

    public static boolean iz() {
        return d.getBoolean(d.vH, true);
    }
}
