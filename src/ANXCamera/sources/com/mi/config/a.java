package com.mi.config;

import android.content.res.Resources;
import android.content.res.Resources.NotFoundException;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import android.text.TextUtils;
import com.android.camera.CameraAppImpl;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.data.data.DataItemBase;
import com.android.camera.log.Log;
import com.ss.android.ttve.BuildConfig;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.Locale;
import miui.os.Build;
import org.json.JSONException;
import org.json.JSONObject;

/* compiled from: DataItemFeature */
public class a extends DataItemBase implements c {
    private static final String TAG = "DataFeature";
    private static final boolean ro = false;
    private String rn;

    public a() {
        fw();
    }

    private void J(String str) throws JSONException {
        JSONObject jSONObject = new JSONObject(str);
        Iterator keys = jSONObject.keys();
        SimpleArrayMap values = getValues();
        while (keys.hasNext()) {
            String str2 = (String) keys.next();
            values.put(str2, jSONObject.opt(str2));
        }
    }

    private static String a(Resources resources) {
        StringBuilder sb = new StringBuilder();
        sb.append("feature_");
        sb.append(b.rp);
        String sb2 = sb.toString();
        try {
            String string = resources.getString(R.string.device_feature_configuration_file_name);
            return (string == null || string.length() == 0 || "default".equals(string)) ? sb2 : string;
        } catch (NotFoundException e) {
            Log.d(TAG, "Device feature configuration file name undefined", e);
            return sb2;
        }
    }

    public boolean K(String str) {
        return getValues().containsKey(str);
    }

    public String L(String str) {
        return getString(c.uU, str);
    }

    public String M(String str) {
        return getString(c.uV, str);
    }

    public boolean fA() {
        return Build.getRegion().endsWith("IN");
    }

    public boolean fB() {
        if (this.rn == null) {
            this.rn = SystemProperties.get("ro.boot.hwc");
        }
        return "cn".equalsIgnoreCase(this.rn);
    }

    public boolean fC() {
        return getBoolean(c.sZ, false) && fz();
    }

    public boolean fD() {
        return getBoolean(c.tX, false) && fz();
    }

    public boolean fE() {
        return getBoolean(c.ta, false);
    }

    public boolean fF() {
        return getBoolean(c.tb, false);
    }

    public boolean fG() {
        return getBoolean(c.tc, false);
    }

    public boolean fH() {
        return getBoolean(c.tG, false);
    }

    public boolean fI() {
        return getBoolean(c.td, false);
    }

    public boolean fJ() {
        return getBoolean(c.te, false);
    }

    public boolean fK() {
        return (fz() || fA()) && getBoolean(c.tf, false);
    }

    public boolean fL() {
        return getBoolean(c.th, true);
    }

    public boolean fM() {
        return getBoolean(c.tg, false);
    }

    public boolean fN() {
        return getBoolean(c.ti, false);
    }

    public boolean fO() {
        return getBoolean(c.tj, false);
    }

    public boolean fP() {
        return getBoolean(c.tk, false);
    }

    public boolean fQ() {
        return getBoolean(c.tl, false);
    }

    public boolean fR() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.16f && getBoolean(c.tm, false);
    }

    public boolean fS() {
        return ((double) Math.abs((((float) Util.sWindowHeight) / ((float) Util.sWindowWidth)) - 2.11f)) <= 0.02d && getBoolean(c.tn, false);
    }

    public boolean fT() {
        return getBoolean(c.to, false);
    }

    public boolean fU() {
        return getBoolean(c.tp, false);
    }

    public boolean fV() {
        return VERSION.SDK_INT == 28 && getBoolean(c.tw, false);
    }

    public boolean fW() {
        return getBoolean(c.tx, false);
    }

    public boolean fX() {
        return getBoolean(c.tD, true);
    }

    public boolean fY() {
        return getBoolean(c.tE, false);
    }

    public boolean fZ() {
        return getBoolean(c.ty, false);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x003c, code lost:
        J(r2.toString());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:?, code lost:
        r3.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0047, code lost:
        r1 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x004b, code lost:
        if (r0 != null) goto L_0x004d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:?, code lost:
        r3.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0056, code lost:
        r3.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x0059, code lost:
        throw r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x005a, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x005b, code lost:
        r0.printStackTrace();
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x005a A[EDGE_INSN: B:14:?->B:27:0x005a ?: BREAK  , ExcHandler: IOException | JSONException (r0v2 'e' java.lang.Exception A[CUSTOM_DECLARE]), Splitter:B:5:0x0023] */
    public void fw() {
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        int identifier = resources.getIdentifier(a(resources), "raw", "com.android.camera");
        if (identifier <= 0) {
            Log.e(TAG, "feature list default");
            return;
        }
        StringBuilder sb = new StringBuilder();
        try {
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(resources.openRawResource(identifier)));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine == null) {
                    break;
                }
                sb.append(readLine);
            }
        } catch (IOException | JSONException e) {
        } catch (Throwable th) {
            r0.addSuppressed(th);
        }
    }

    public boolean fx() {
        return getBoolean(c.sV, false);
    }

    public int fy() {
        return getInt(c.sW, 20);
    }

    public boolean fz() {
        if (this.rn == null) {
            this.rn = SystemProperties.get("ro.boot.hwc");
        }
        if ("india".equalsIgnoreCase(this.rn)) {
            return true;
        }
        return !TextUtils.isEmpty(this.rn) && this.rn.toLowerCase(Locale.ENGLISH).startsWith("india_");
    }

    public boolean gA() {
        return getBoolean(c.tV, false);
    }

    public boolean gB() {
        return getBoolean(c.ub, true);
    }

    public boolean gC() {
        return getBoolean(c.uc, false);
    }

    public int gD() {
        return getInt(c.ue, 0);
    }

    public boolean gE() {
        if (!Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.uk, false);
    }

    public boolean gF() {
        return getBoolean(c.ul, false);
    }

    public boolean gG() {
        return getBoolean(c.um, false);
    }

    public boolean gH() {
        return getBoolean(c.tZ, false);
    }

    public boolean gI() {
        return gJ() <= 0 || getBoolean(c.ua, false);
    }

    public int gJ() {
        return getInt(c.tY, 0);
    }

    public int gK() {
        return getInt(c.ud, 0);
    }

    public boolean gL() {
        return getBoolean(c.uf, false);
    }

    public boolean gM() {
        return getBoolean(c.ug, false);
    }

    public boolean gN() {
        if (b.ju()) {
            return false;
        }
        return getBoolean(c.uR, true);
    }

    public boolean gO() {
        return getBoolean(c.un, true);
    }

    public boolean gP() {
        return getBoolean(c.uo, false);
    }

    public boolean gQ() {
        if (VERSION.SDK_INT < 28) {
            return false;
        }
        return getBoolean(c.uq, false);
    }

    public boolean gR() {
        return getBoolean(c.ur, false);
    }

    public boolean gS() {
        return getBoolean(c.us, false);
    }

    public boolean gT() {
        return getBoolean(c.ut, false);
    }

    public boolean gU() {
        return getBoolean(c.uu, false);
    }

    public boolean gV() {
        return getBoolean(c.uv, true);
    }

    public boolean gW() {
        return getBoolean(c.ux, false);
    }

    public boolean gX() {
        return getBoolean(c.uy, false);
    }

    public boolean gY() {
        return getBoolean(c.tK, false);
    }

    public boolean gZ() {
        return getBoolean(c.uz, true);
    }

    public boolean ga() {
        return getBoolean(c.tq, false);
    }

    public int gb() {
        return getInt(c.tW, 180);
    }

    public boolean gd() {
        return getBoolean(c.tr, false);
    }

    public boolean ge() {
        return getBoolean(c.tv, false);
    }

    public boolean gf() {
        return getBoolean(c.tu, false);
    }

    public boolean gg() {
        return getBoolean(c.ts, false);
    }

    public boolean gh() {
        return getBoolean(c.tt, false) || gg();
    }

    public boolean gi() {
        return getBoolean(c.tz, false);
    }

    public String gj() {
        return getString(c.tA, "");
    }

    public int gk() {
        return getInt(c.tB, 350);
    }

    public int gl() {
        return getInt(c.tC, 300);
    }

    public boolean gm() {
        return getBoolean(c.tI, true);
    }

    public boolean gn() {
        return getBoolean(c.tP, false);
    }

    public boolean go() {
        return getBoolean(c.uh, false);
    }

    public boolean gp() {
        return getBoolean(c.uj, true);
    }

    public boolean gq() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.tL, false);
    }

    public int gr() {
        return getInt(c.tM, 280);
    }

    public float gs() {
        return (float) getDoubleFromValues(c.tN, 0.8766000270843506d);
    }

    public boolean gt() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.tO, false);
    }

    public boolean gu() {
        return getBoolean(c.uN, false);
    }

    public boolean gv() {
        return getBoolean(c.tJ, false);
    }

    public String gw() {
        return getString(c.va, "v0");
    }

    public boolean gx() {
        return getBoolean(c.uw, false);
    }

    public boolean gy() {
        return getBoolean(c.tT, false);
    }

    public boolean gz() {
        return getBoolean(c.tU, false);
    }

    public boolean ha() {
        return getBoolean(c.uA, false);
    }

    public boolean hb() {
        return getBoolean(c.uD, false);
    }

    public long hc() {
        return (long) getInt(c.uB, -1);
    }

    public int hd() {
        return getInt(c.uC, -1);
    }

    public boolean he() {
        return getBoolean(c.uH, false);
    }

    public boolean hf() {
        return getBoolean(c.uJ, true);
    }

    public boolean hg() {
        return getBoolean(c.uX, false);
    }

    public boolean hh() {
        int gJ = gJ();
        if (gJ == 48000000 || gJ == 64144128) {
            return hf();
        }
        return false;
    }

    public boolean hi() {
        return getBoolean(c.uK, true);
    }

    public boolean hj() {
        return getBoolean(c.uL, true);
    }

    public boolean hk() {
        return getBoolean(c.uM, true);
    }

    public boolean hl() {
        return getBoolean(c.uO, false);
    }

    public boolean hm() {
        return getBoolean(c.uP, false);
    }

    public String hn() {
        return getString(c.uQ, BuildConfig.FLAVOR);
    }

    public boolean ho() {
        return getBoolean(c.uS, false);
    }

    public boolean hp() {
        return getBoolean(c.uT, false);
    }

    public boolean hq() {
        return getBoolean(c.uY, false);
    }

    public boolean hr() {
        return getBoolean(c.uZ, false);
    }

    public boolean hs() {
        return getBoolean(c.vb, false);
    }

    public boolean ht() {
        if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            return false;
        }
        return getBoolean(c.vc, false);
    }

    public boolean hu() {
        return getBoolean(c.vd, false);
    }

    public boolean hv() {
        return getBoolean(c.ve, false);
    }

    public boolean hw() {
        return getBoolean(c.vf, true);
    }

    public boolean hx() {
        return getBoolean(c.vh, false);
    }

    public boolean hy() {
        return getBoolean(c.vg, false);
    }

    public boolean hz() {
        return getBoolean(c.vi, false);
    }

    /* access modifiers changed from: protected */
    public boolean isMutable() {
        return false;
    }

    public boolean isSupport4KUHDEIS() {
        return getBoolean(c.tS, false);
    }

    public boolean isSupportBeautyBody() {
        return getBoolean(c.tH, false);
    }

    public boolean isSupportBokehAdjust() {
        return getBoolean(c.up, false);
    }

    public boolean isSupportMacroMode() {
        return getBoolean(c.uI, false);
    }

    public boolean isSupportNormalWideLDC() {
        return getBoolean(c.tQ, false);
    }

    public boolean isSupportShortVideoBeautyBody() {
        return getBoolean(c.uE, false);
    }

    public boolean isSupportUltraWide() {
        return getBoolean(c.tF, false);
    }

    public boolean isSupportUltraWideLDC() {
        return getBoolean(c.tR, false);
    }

    public boolean isTransient() {
        return true;
    }

    public String p(boolean z) {
        return z ? getString(c.uF, "4.5") : getString(c.uG, "4");
    }

    public String provideKey() {
        return null;
    }

    public boolean q(boolean z) {
        return z && getBoolean(c.uW, false);
    }
}
