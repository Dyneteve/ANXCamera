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
    public static final boolean IS_HONGMI = d.getBoolean(d.tV, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.tU, false);
    public static final boolean qA;
    public static final boolean qB;
    public static final boolean qC = Build.IS_HONGMI_TWO_S;
    public static final boolean qD;
    public static final boolean qE = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean qF = Build.IS_HONGMI_TWO_A;
    public static final boolean qG = Build.IS_HONGMI_THREE;
    public static final boolean qH = "gucci".equals(qo);
    public static final boolean qI = "hermes".equals(qo);
    public static final boolean qJ = "hennessy".equals(qo);
    public static final boolean qK = "dior".equals(qo);
    public static final boolean qL = "kenzo".equals(qo);
    public static final boolean qM = "kate".equals(qo);
    public static final boolean qN;
    public static final boolean qO = Build.IS_HONGMI_TWOX_LC;
    public static final boolean qP = Build.IS_MIFOUR;
    public static final boolean qQ = Build.IS_MIPAD;
    public static final boolean qR = Build.IS_MIFIVE;
    public static final boolean qS = "leo".equals(qo);
    public static final boolean qT = "ferrari".equals(qo);
    public static final boolean qU = "ido".equals(qo);
    public static final boolean qV = "aqua".equals(qo);
    public static final boolean qW = "gemini".equals(qo);
    public static final boolean qX = "gold".equals(qo);
    public static final boolean qY = "capricorn".equals(qo);
    public static final boolean qZ = "natrium".equals(qo);
    public static final String qo = Build.DEVICE;
    public static final String qp = "qcom";
    public static final String qq = "mediatek";
    public static final String qr = "leadcore";
    public static final String qt = "nvidia";
    public static final String qu = "intel";
    private static final int qv = 100;
    public static final String qw = Build.MODEL;
    public static final boolean qx = Build.IS_MITWO;
    public static final boolean qy = "pisces".equals(qo);
    public static final boolean qz;
    public static final boolean rA = "hammerhead".equals(qo);
    public static final boolean rB = "santoni".equals(qo);
    public static final boolean rC = "polaris".equals(qo);
    public static final boolean rD = "sirius".equals(qo);
    public static final boolean rE = "dipper".equals(qo);
    public static final boolean rF = "ursa".equals(qo);
    public static final boolean rG = "equuleus".equals(qo);
    public static final boolean rH = "andromeda".equals(qo);
    public static final boolean rI = "perseus".equals(qo);
    public static final boolean rJ = "cepheus".equals(qo);
    public static final boolean rK = "grus".equals(qo);
    public static final boolean rL = "pine".equals(qo);
    public static final boolean rM = "pyxis".equals(qo);
    public static final boolean rN = Build.IS_STABLE_VERSION;
    public static final boolean rO = Build.IS_CM_CUSTOMIZATION_TEST;
    private static final int rP = 1;
    private static final int rQ = 4;
    private static final int rR = 8;
    private static ArrayList<String> rS;
    public static final boolean ra = "lithium".equals(qo);
    public static final boolean rb = "scorpio".equals(qo);
    public static final boolean rc = "libra".equals(qo);
    public static final boolean rd = "land".equals(qo);
    public static final boolean re = "hydrogen".equals(qo);
    public static final boolean rf = "helium".equals(qo);
    public static final boolean rg = "omega".equals(qo);
    public static final boolean rh = qo.startsWith("nike");
    public static final boolean ri = qo.startsWith("mark");
    public static final boolean rj = qo.startsWith("prada");
    public static final boolean rk = qo.startsWith("mido");
    public static final boolean rl = "rolex".equals(qo);
    public static final boolean rm = "sagit".equals(qo);
    public static final boolean rn = "centaur".equals(qo);
    public static final boolean ro = "achilles".equals(qo);
    public static final boolean rp = "jason".equals(qo);
    public static final boolean rq = "tiffany".equals(qo);
    public static final boolean rr = "ulysse".equals(qo);
    public static final boolean rs = "oxygen".equals(qo);
    public static final boolean rt = "chiron".equals(qo);
    public static final boolean ru = "ugg".equals(qo);
    public static final boolean rv = "vince".equals(qo);
    public static final boolean rw = "whyred".equals(qo);
    public static final boolean rx = "beryllium".equals(qo);
    public static final boolean ry = "violet".equals(qo);
    public static final boolean rz = "pisces".equals(qo);

    static {
        boolean z = true;
        boolean z2 = "cancro".equals(qo) && Build.MODEL.startsWith("MI 3");
        qz = z2;
        boolean z3 = qz || qy;
        qA = z3;
        boolean z4 = Build.IS_HONGMI_TWO && !Build.IS_HONGMI_TWO_A && !Build.IS_HONGMI_TWO_S;
        qB = z4;
        boolean z5 = qB || qC;
        qD = z5;
        if (!Build.IS_HONGMI_TWOX && !"HM2014816".equals(qo)) {
            z = false;
        }
        qN = z;
    }

    public static boolean fY() {
        return DataRepository.dataItemFeature().fY();
    }

    public static boolean gK() {
        if (iG()) {
            return false;
        }
        return d.getBoolean(d.uh, false);
    }

    public static boolean gL() {
        return !d.getBoolean(d.uX, false);
    }

    public static boolean gM() {
        return qO || d.getBoolean(d.vg, false);
    }

    public static boolean gN() {
        return d.getBoolean(d.ud, false);
    }

    public static boolean gO() {
        return !gP();
    }

    public static boolean gP() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        String str = SystemProperties.get("ro.miui.region");
        return TextUtils.isEmpty(str) ? TextUtils.equals(Locale.getDefault().getCountry(), "KR") : TextUtils.equals(str, "KR");
    }

    public static boolean gQ() {
        return d.getBoolean(d.ue, false);
    }

    public static boolean gR() {
        return d.getBoolean(d.ui, false);
    }

    public static boolean gS() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uj, false);
    }

    public static boolean gT() {
        return d.getBoolean(d.uk, false);
    }

    public static boolean gU() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.0f && d.getBoolean(d.vh, false);
    }

    public static boolean gV() {
        return d.getBoolean(d.ul, false);
    }

    public static boolean gW() {
        return d.getBoolean(d.um, false);
    }

    public static boolean gX() {
        return d.getBoolean(d.uV, false);
    }

    public static boolean gY() {
        return d.getBoolean(d.un, false);
    }

    public static boolean gZ() {
        return !rO && d.getBoolean(d.uo, false);
    }

    public static boolean ge() {
        return DataRepository.dataItemFeature().ge();
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.ug, 100);
    }

    public static String getGivenName() {
        return iG() ? "_l" : !DataRepository.dataItemFeature().getBoolean(c.tg, false) ? "" : (android.os.Build.MODEL.contains("BROWN EDITION") || android.os.Build.MODEL.contains("Explorer")) ? "_a" : android.os.Build.MODEL.contains("ROY") ? "_b" : iH() ? "_s" : "";
    }

    public static boolean hA() {
        return !IS_XIAOMI && !IS_HONGMI;
    }

    public static boolean hB() {
        return d.getBoolean(d.vl, false);
    }

    public static boolean hC() {
        return d.getBoolean(d.uG, false);
    }

    public static boolean hD() {
        return d.getBoolean(d.uH, false);
    }

    public static boolean hE() {
        return !qF && !qO && !Build.IS_HONGMI_TWOX && !qz && !qG && !qB && !qC && !qE && !qx && !IS_MI2A && !qA && !qP && d.getBoolean(d.vm, true);
    }

    public static boolean hF() {
        return d.getBoolean(d.vn, false);
    }

    public static boolean hG() {
        return qx && !IS_MI2A;
    }

    public static boolean hH() {
        return d.getBoolean(d.uI, false);
    }

    public static int hI() {
        return d.getInteger(d.vz, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean hJ() {
        return d.getBoolean(d.uJ, false);
    }

    public static boolean hK() {
        return d.getBoolean(d.uK, false);
    }

    public static boolean hL() {
        return false;
    }

    public static boolean hM() {
        return d.getBoolean(d.uO, false);
    }

    public static boolean hN() {
        return d.getBoolean(d.tZ, false);
    }

    public static boolean hO() {
        return d.getBoolean(d.uP, false);
    }

    public static boolean hP() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uR, false);
    }

    public static String hQ() {
        return d.getString(d.ua);
    }

    public static String hR() {
        return d.getString(d.ub);
    }

    public static boolean hS() {
        return d.getBoolean(d.vo, false);
    }

    public static boolean hT() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.uQ, false);
    }

    public static boolean hU() {
        return (qL && Build.IS_INTERNATIONAL_BUILD) || rd;
    }

    public static boolean hV() {
        return true;
    }

    public static boolean hW() {
        return d.getBoolean(d.uW, false);
    }

    public static boolean hX() {
        return !qz && !qP && !Build.IS_HONGMI_TWOX && !qF && d.getBoolean(d.vp, true);
    }

    public static boolean hY() {
        return !d.getBoolean(d.vb, false);
    }

    public static boolean hZ() {
        return !d.getBoolean(d.vq, false) && !isMTKPlatform();
    }

    public static boolean ha() {
        return d.getBoolean(d.up, false);
    }

    public static boolean hb() {
        return qp.equals(d.getString(d.tX));
    }

    public static boolean hc() {
        return qt.equals(d.getString(d.tX));
    }

    public static boolean hd() {
        return qr.equals(d.getString(d.tX));
    }

    public static boolean he() {
        return d.getBoolean(d.tY, false);
    }

    public static boolean hf() {
        return false;
    }

    public static boolean hg() {
        return d.getBoolean(d.uq, false);
    }

    public static boolean hh() {
        return d.getBoolean(d.ur, false);
    }

    public static boolean hi() {
        return d.getBoolean(d.us, false);
    }

    public static boolean hj() {
        return d.getBoolean(d.ut, false);
    }

    public static boolean hk() {
        return d.getBoolean(d.uu, false);
    }

    public static boolean hl() {
        return d.getBoolean(d.uv, false);
    }

    public static boolean hm() {
        return (d.getInteger(d.rT, 0) & 1) != 0;
    }

    public static boolean hn() {
        return (d.getInteger(d.rT, 0) & 13) != 0;
    }

    public static boolean ho() {
        return !DataRepository.dataItemFeature().fj() && IS_HONGMI;
    }

    public static boolean hp() {
        return (d.getInteger(d.rT, 0) & 4) != 0;
    }

    public static boolean hq() {
        return d.getBoolean(d.vj, false) && hr();
    }

    public static boolean hr() {
        return false;
    }

    public static boolean hs() {
        return d.getBoolean(d.uB, false);
    }

    public static boolean ht() {
        return d.getBoolean(d.uy, false);
    }

    public static boolean hu() {
        return !qF && !qO && !Build.IS_HONGMI_TWOX && !qz && !qG && !qB && !qC && !qE && !qx && !IS_MI2A && !qA && d.getBoolean(d.vk, true);
    }

    public static boolean hv() {
        return false;
    }

    public static boolean hw() {
        return d.getBoolean(d.uD, false);
    }

    public static boolean hx() {
        return hb() && 21 <= VERSION.SDK_INT;
    }

    public static boolean hy() {
        return d.getBoolean(d.uE, false);
    }

    public static boolean hz() {
        return d.getBoolean(d.uF, false);
    }

    public static boolean iA() {
        return d.getBoolean(d.vy, false);
    }

    public static boolean iB() {
        return d.getBoolean(d.vJ, false);
    }

    public static boolean iC() {
        return d.getBoolean(d.vM, true);
    }

    public static boolean iD() {
        return d.getBoolean(d.vN, false);
    }

    public static boolean iE() {
        return rE || rC;
    }

    public static boolean iF() {
        return d.getBoolean(d.vO, false);
    }

    public static boolean iG() {
        boolean z = false;
        if ("onc".equals(qo)) {
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

    public static boolean iH() {
        return qo.equalsIgnoreCase("lavender") && "India_48_5".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean iI() {
        return rI && Build.IS_INTERNATIONAL_BUILD;
    }

    public static boolean iJ() {
        return rJ;
    }

    public static boolean iK() {
        return iI() || rM || rK;
    }

    public static boolean ia() {
        return d.getBoolean(d.vc, true);
    }

    public static boolean ib() {
        return d.getBoolean(d.vr, false);
    }

    public static boolean ic() {
        return false;
    }

    public static ArrayList<String> id() {
        if (rS == null) {
            rS = new ArrayList<>();
            String[] stringArray = d.getStringArray(d.uc);
            if (stringArray != null) {
                Collections.addAll(rS, stringArray);
            }
        }
        return rS;
    }

    public static boolean ie() {
        return d.getBoolean(d.uU, false);
    }

    /* renamed from: if reason: not valid java name */
    public static boolean m3160if() {
        return d.getBoolean(d.uf, false);
    }

    public static boolean ig() {
        return false;
    }

    public static boolean ih() {
        return d.getBoolean(d.va, true);
    }

    public static boolean ii() {
        return d.getBoolean(d.vv, false);
    }

    public static boolean ij() {
        if (!rw) {
            return d.getBoolean(d.vd, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean ik() {
        return ra || rt || rC;
    }

    public static boolean il() {
        return d.getBoolean(d.vD, true);
    }

    public static boolean im() {
        return d.getBoolean(d.vw, true);
    }

    public static boolean in() {
        return d.getBoolean(d.uY, false);
    }

    public static boolean ip() {
        return in() && d.getBoolean(d.uZ, true);
    }

    private static boolean iq() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean ir() {
        return d.getBoolean(d.ve, false) || iq();
    }

    public static boolean is() {
        return !ir() && DataRepository.dataItemFeature().gD() && id() != null && !id().isEmpty();
    }

    public static boolean isMTKPlatform() {
        return qq.equals(d.getString(d.tX));
    }

    public static boolean isPad() {
        return d.getBoolean(d.tW, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.vL, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.vs, false);
    }

    public static boolean it() {
        return d.getBoolean(d.vB, false);
    }

    public static boolean iu() {
        return d.getBoolean(d.vK, false);
    }

    public static boolean iv() {
        return d.getBoolean(d.vE, false);
    }

    public static boolean iw() {
        return d.getBoolean(d.vF, false);
    }

    public static boolean ix() {
        return d.getBoolean(d.vG, false);
    }

    public static boolean iy() {
        return d.getBoolean(d.vH, false);
    }

    public static boolean iz() {
        return ix() || iy();
    }

    public static boolean r(boolean z) {
        if ("fr_sfr".equals(SystemProperties.get("ro.miui.customized.region"))) {
            return false;
        }
        return z;
    }
}
