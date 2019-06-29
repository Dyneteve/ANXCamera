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
    public static final boolean IS_HONGMI = d.getBoolean(d.vk, false);
    public static final boolean IS_MI2A = Build.IS_MI2A;
    public static final boolean IS_XIAOMI = d.getBoolean(d.vj, false);
    public static final boolean rA = (rz || ry);
    public static final boolean rB = (Build.IS_HONGMI_TWO && !Build.IS_HONGMI_TWO_A && !Build.IS_HONGMI_TWO_S);
    public static final boolean rC = Build.IS_HONGMI_TWO_S;
    public static final boolean rD = (rB || rC);
    public static final boolean rE = Build.IS_HONGMI_TWOS_LTE_MTK;
    public static final boolean rF = Build.IS_HONGMI_TWO_A;
    public static final boolean rG = Build.IS_HONGMI_THREE;
    public static final boolean rH = "gucci".equals(rp);
    public static final boolean rI = "hermes".equals(rp);
    public static final boolean rJ = "hennessy".equals(rp);
    public static final boolean rK = "dior".equals(rp);
    public static final boolean rL = "kenzo".equals(rp);
    public static final boolean rM = "kate".equals(rp);
    public static final boolean rN;
    public static final boolean rO = Build.IS_HONGMI_TWOX_LC;
    public static final boolean rP = Build.IS_MIFOUR;
    public static final boolean rQ = Build.IS_MIPAD;
    public static final boolean rR = Build.IS_MIFIVE;
    public static final boolean rS = "leo".equals(rp);
    public static final boolean rT = "ferrari".equals(rp);
    public static final boolean rU = "ido".equals(rp);
    public static final boolean rV = "aqua".equals(rp);
    public static final boolean rW = "gemini".equals(rp);
    public static final boolean rX = "gold".equals(rp);
    public static final boolean rY = "capricorn".equals(rp);
    public static final boolean rZ = "natrium".equals(rp);
    public static final String rp = Build.DEVICE;
    public static final String rq = "qcom";
    public static final String rr = "mediatek";
    public static final String rs = "leadcore";
    public static final String rt = "nvidia";
    public static final String ru = "intel";
    private static final int rv = 100;
    public static final String rw = Build.MODEL;
    public static final boolean rx = Build.IS_MITWO;
    public static final boolean ry = "pisces".equals(rp);
    public static final boolean rz = ("cancro".equals(rp) && Build.MODEL.startsWith("MI 3"));
    public static final boolean sA = "violet".equals(rp);
    public static final boolean sB = "pisces".equals(rp);
    public static final boolean sC = "hammerhead".equals(rp);
    public static final boolean sD = "santoni".equals(rp);
    public static final boolean sE = "polaris".equals(rp);
    public static final boolean sF = "sirius".equals(rp);
    public static final boolean sG = "dipper".equals(rp);
    public static final boolean sH = "ursa".equals(rp);
    public static final boolean sI = "equuleus".equals(rp);
    public static final boolean sJ = "andromeda".equals(rp);
    public static final boolean sK = "perseus".equals(rp);
    public static final boolean sL = "cepheus".equals(rp);
    public static final boolean sM = "grus".equals(rp);
    public static final boolean sN = "pine".equals(rp);
    public static final boolean sO = "pyxis".equals(rp);
    public static final boolean sP = Build.IS_STABLE_VERSION;
    public static final boolean sQ = Build.IS_CM_CUSTOMIZATION_TEST;
    private static final int sR = 1;
    private static final int sS = 4;
    private static final int sT = 8;
    private static ArrayList<String> sU;
    public static final boolean sb = "lithium".equals(rp);
    public static final boolean sc = "scorpio".equals(rp);
    public static final boolean se = "libra".equals(rp);
    public static final boolean sf = "land".equals(rp);
    public static final boolean sg = "hydrogen".equals(rp);
    public static final boolean sh = "helium".equals(rp);
    public static final boolean si = "omega".equals(rp);
    public static final boolean sj = rp.startsWith("nike");
    public static final boolean sk = rp.startsWith("mark");
    public static final boolean sl = rp.startsWith("prada");
    public static final boolean sm = rp.startsWith("mido");
    public static final boolean sn = "rolex".equals(rp);
    public static final boolean so = "sagit".equals(rp);
    public static final boolean sp = "centaur".equals(rp);
    public static final boolean sq = "achilles".equals(rp);
    public static final boolean sr = "jason".equals(rp);
    public static final boolean ss = "tiffany".equals(rp);
    public static final boolean st = "ulysse".equals(rp);
    public static final boolean su = "oxygen".equals(rp);
    public static final boolean sv = "chiron".equals(rp);
    public static final boolean sw = "ugg".equals(rp);
    public static final boolean sx = "vince".equals(rp);
    public static final boolean sy = "whyred".equals(rp);
    public static final boolean sz = "beryllium".equals(rp);

    static {
        boolean z = true;
        if (!Build.IS_HONGMI_TWOX && !"HM2014816".equals(rp)) {
            z = false;
        }
        rN = z;
    }

    public static boolean gE() {
        return DataRepository.dataItemFeature().gE();
    }

    public static boolean gL() {
        return DataRepository.dataItemFeature().gL();
    }

    public static int getBurstShootCount() {
        return d.getInteger(d.vv, 100);
    }

    public static String getGivenName() {
        return ju() ? "_l" : !DataRepository.dataItemFeature().getBoolean(c.ui, false) ? "" : (android.os.Build.MODEL.contains("BROWN EDITION") || android.os.Build.MODEL.contains("Explorer")) ? "_a" : android.os.Build.MODEL.contains("ROY") ? "_b" : jw() ? "_s" : jv() ? "_global" : "";
    }

    public static boolean hA() {
        if (ju()) {
            return false;
        }
        return d.getBoolean(d.vw, false);
    }

    public static boolean hB() {
        return !d.getBoolean(d.wm, false);
    }

    public static boolean hC() {
        return rO || d.getBoolean(d.ww, false);
    }

    public static boolean hD() {
        return d.getBoolean(d.vs, false);
    }

    public static boolean hE() {
        return !hF();
    }

    public static boolean hF() {
        if (!Build.IS_INTERNATIONAL_BUILD) {
            return false;
        }
        String str = Util.sRegion;
        return TextUtils.isEmpty(str) ? TextUtils.equals(Locale.getDefault().getCountry(), "KR") : TextUtils.equals(str, "KR");
    }

    public static boolean hG() {
        return d.getBoolean(d.vt, false);
    }

    public static boolean hH() {
        return d.getBoolean(d.vx, false);
    }

    public static boolean hI() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.vy, false);
    }

    public static boolean hJ() {
        return d.getBoolean(d.vz, false);
    }

    public static boolean hK() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.0f && d.getBoolean(d.wx, false);
    }

    public static boolean hL() {
        return d.getBoolean(d.vA, false);
    }

    public static boolean hM() {
        return d.getBoolean(d.vB, false);
    }

    public static boolean hN() {
        return d.getBoolean(d.wk, false);
    }

    public static boolean hO() {
        return d.getBoolean(d.vC, false);
    }

    public static boolean hP() {
        return !sQ && d.getBoolean(d.vD, false);
    }

    public static boolean hQ() {
        return d.getBoolean(d.vE, false);
    }

    public static boolean hR() {
        return rq.equals(d.getString(d.vm));
    }

    public static boolean hS() {
        return rt.equals(d.getString(d.vm));
    }

    public static boolean hT() {
        return rs.equals(d.getString(d.vm));
    }

    public static boolean hU() {
        return d.getBoolean(d.vn, false);
    }

    public static boolean hV() {
        return false;
    }

    public static boolean hW() {
        return d.getBoolean(d.vF, false);
    }

    public static boolean hX() {
        return d.getBoolean(d.vG, false);
    }

    public static boolean hY() {
        return d.getBoolean(d.vH, false);
    }

    public static boolean hZ() {
        return d.getBoolean(d.vI, false);
    }

    public static boolean iA() {
        return d.getBoolean(d.vY, false);
    }

    public static boolean iB() {
        return d.getBoolean(d.vZ, false);
    }

    public static boolean iC() {
        return false;
    }

    public static boolean iD() {
        return d.getBoolean(d.wd, false);
    }

    public static boolean iE() {
        return d.getBoolean(d.vo, false);
    }

    public static boolean iF() {
        return d.getBoolean(d.we, false);
    }

    public static boolean iG() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.wg, false);
    }

    public static String iH() {
        return d.getString(d.vp);
    }

    public static String iI() {
        return d.getString(d.vq);
    }

    public static boolean iJ() {
        return d.getBoolean(d.wE, false);
    }

    public static boolean iK() {
        return !Build.IS_INTERNATIONAL_BUILD && d.getBoolean(d.wf, false);
    }

    public static boolean iL() {
        return (rL && Build.IS_INTERNATIONAL_BUILD) || sf;
    }

    public static boolean iM() {
        return true;
    }

    public static boolean iN() {
        return d.getBoolean(d.wl, false);
    }

    public static boolean iO() {
        return !rz && !rP && !Build.IS_HONGMI_TWOX && !rF && d.getBoolean(d.wF, true);
    }

    public static boolean iP() {
        return !d.getBoolean(d.wq, false);
    }

    public static boolean iQ() {
        return !d.getBoolean(d.wG, false) && !isMTKPlatform();
    }

    public static boolean iR() {
        return d.getBoolean(d.wr, true);
    }

    public static boolean iS() {
        return d.getBoolean(d.wH, false);
    }

    public static ArrayList<String> iT() {
        if (sU == null) {
            sU = new ArrayList<>();
            String[] stringArray = d.getStringArray(d.vr);
            if (stringArray != null) {
                Collections.addAll(sU, stringArray);
            }
        }
        return sU;
    }

    public static boolean iU() {
        return d.getBoolean(d.wj, false);
    }

    public static boolean iV() {
        return d.getBoolean(d.vu, false);
    }

    public static boolean iW() {
        return false;
    }

    public static boolean iX() {
        return d.getBoolean(d.wp, true);
    }

    public static boolean iY() {
        return d.getBoolean(d.wL, false);
    }

    public static boolean iZ() {
        if (!sy) {
            return d.getBoolean(d.wt, false);
        }
        return "India".equals(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean ia() {
        return d.getBoolean(d.vJ, false);
    }

    public static boolean ib() {
        return d.getBoolean(d.vK, false);
    }

    public static boolean ic() {
        return (d.getInteger(d.sV, 0) & 1) != 0;
    }

    public static boolean id() {
        return (d.getInteger(d.sV, 0) & 13) != 0;
    }

    public static boolean ie() {
        return !DataRepository.dataItemFeature().fL() && IS_HONGMI;
    }

    /* renamed from: if reason: not valid java name */
    public static boolean m1if() {
        return (d.getInteger(d.sV, 0) & 4) != 0;
    }

    public static boolean ig() {
        return d.getBoolean(d.wz, false) && ih();
    }

    public static boolean ih() {
        return false;
    }

    public static boolean ii() {
        return d.getBoolean(d.vQ, false);
    }

    public static boolean ij() {
        return d.getBoolean(d.vN, false);
    }

    public static boolean ik() {
        return !rF && !rO && !Build.IS_HONGMI_TWOX && !rz && !rG && !rB && !rC && !rE && !rx && !IS_MI2A && !rA && d.getBoolean(d.wA, true);
    }

    public static boolean il() {
        return false;
    }

    public static boolean im() {
        return d.getBoolean(d.vS, false);
    }

    public static boolean in() {
        return hR() && 21 <= VERSION.SDK_INT;
    }

    public static boolean ip() {
        return d.getBoolean(d.vT, false);
    }

    public static boolean iq() {
        return d.getBoolean(d.vU, false);
    }

    public static boolean ir() {
        return !IS_XIAOMI && !IS_HONGMI;
    }

    public static boolean is() {
        return d.getBoolean(d.wB, false);
    }

    public static boolean isMTKPlatform() {
        return rr.equals(d.getString(d.vm));
    }

    public static boolean isPad() {
        return d.getBoolean(d.vl, false);
    }

    public static boolean isSupportSuperResolution() {
        return d.getBoolean(d.xb, false);
    }

    public static boolean isSupportedOpticalZoom() {
        return d.getBoolean(d.wI, false);
    }

    public static boolean it() {
        return d.getBoolean(d.vV, false);
    }

    public static boolean iu() {
        return d.getBoolean(d.vW, false);
    }

    public static boolean iv() {
        return !rF && !rO && !Build.IS_HONGMI_TWOX && !rz && !rG && !rB && !rC && !rE && !rx && !IS_MI2A && !rA && !rP && d.getBoolean(d.wC, true);
    }

    public static boolean iw() {
        return d.getBoolean(d.wD, false);
    }

    public static boolean ix() {
        return rx && !IS_MI2A;
    }

    public static boolean iy() {
        return d.getBoolean(d.vX, false);
    }

    public static int iz() {
        return d.getInteger(d.wP, AutoLockManager.HIBERNATION_TIMEOUT);
    }

    public static boolean ja() {
        return sb || sv || sE;
    }

    public static boolean jb() {
        return d.getBoolean(d.wT, true);
    }

    public static boolean jc() {
        return d.getBoolean(d.wM, true);
    }

    public static boolean jd() {
        return d.getBoolean(d.wn, false);
    }

    public static boolean je() {
        return jd() && d.getBoolean(d.wo, true);
    }

    private static boolean jf() {
        return SystemProperties.getBoolean("ro.hardware.fp.fod", false);
    }

    private static boolean jg() {
        return d.getBoolean(d.wu, false) || jf();
    }

    public static boolean jh() {
        return !jg() && DataRepository.dataItemFeature().hk() && iT() != null && !iT().isEmpty();
    }

    public static boolean ji() {
        return d.getBoolean(d.wR, false);
    }

    public static boolean jj() {
        return d.getBoolean(d.xa, false);
    }

    public static boolean jk() {
        return d.getBoolean(d.wU, false);
    }

    public static boolean jl() {
        return d.getBoolean(d.wV, false);
    }

    public static boolean jm() {
        return d.getBoolean(d.wW, false);
    }

    public static boolean jn() {
        return d.getBoolean(d.wX, false);
    }

    public static boolean jo() {
        return jm() || jn();
    }

    public static boolean jp() {
        return d.getBoolean(d.wO, false);
    }

    public static boolean jq() {
        return d.getBoolean(d.wZ, false);
    }

    public static boolean jr() {
        return d.getBoolean(d.xc, true);
    }

    public static boolean js() {
        return d.getBoolean(d.xd, false);
    }

    public static boolean jt() {
        return d.getBoolean(d.xe, false);
    }

    public static boolean ju() {
        boolean z = false;
        if ("onc".equals(rp)) {
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

    public static boolean jv() {
        return rp.equalsIgnoreCase("raphael") && Build.IS_INTERNATIONAL_BUILD;
    }

    public static boolean jw() {
        return rp.equalsIgnoreCase("lavender") && "India_48_5".equalsIgnoreCase(SystemProperties.get("ro.boot.hwc"));
    }

    public static boolean jx() {
        return sK && Build.IS_INTERNATIONAL_BUILD;
    }

    public static boolean jy() {
        return jx() || sO || sM;
    }

    public static boolean r(boolean z) {
        if ("fr_sfr".equals(SystemProperties.get("ro.miui.customized.region"))) {
            return false;
        }
        return z;
    }
}
