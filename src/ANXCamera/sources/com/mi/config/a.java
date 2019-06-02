package com.mi.config;

import android.content.Context;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.SystemProperties;
import android.support.v4.util.SimpleArrayMap;
import android.text.TextUtils;
import com.android.camera.CameraAppImpl;
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
    private String qo;

    public a() {
        eU();
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

    public boolean K(String str) {
        return getValues().containsKey(str);
    }

    public String L(String str) {
        return getString(c.tR, str);
    }

    /* JADX WARNING: Removed duplicated region for block: B:25:0x006c A[SYNTHETIC, Splitter:B:25:0x006c] */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0076 A[SYNTHETIC, Splitter:B:31:0x0076] */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0082 A[SYNTHETIC, Splitter:B:37:0x0082] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:28:0x0071=Splitter:B:28:0x0071, B:22:0x0067=Splitter:B:22:0x0067} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void eU() {
        Context androidContext = CameraAppImpl.getAndroidContext();
        Resources resources = androidContext.getResources();
        StringBuilder sb = new StringBuilder();
        sb.append("feature_");
        sb.append(b.qp);
        int identifier = resources.getIdentifier(sb.toString(), "raw", "com.android.camera");
        if (identifier <= 0) {
            Log.e(TAG, "feature list default");
            return;
        }
        BufferedReader bufferedReader = null;
        StringBuilder sb2 = new StringBuilder();
        try {
            BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(androidContext.getResources().openRawResource(identifier)));
            while (true) {
                try {
                    String readLine = bufferedReader2.readLine();
                    if (readLine == null) {
                        break;
                    }
                    sb2.append(readLine);
                } catch (IOException e) {
                    e = e;
                    bufferedReader = bufferedReader2;
                    e.printStackTrace();
                    if (bufferedReader != null) {
                    }
                } catch (JSONException e2) {
                    e = e2;
                    bufferedReader = bufferedReader2;
                    try {
                        e.printStackTrace();
                        if (bufferedReader != null) {
                        }
                    } catch (Throwable th) {
                        th = th;
                        if (bufferedReader != null) {
                            try {
                                bufferedReader.close();
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    bufferedReader = bufferedReader2;
                    if (bufferedReader != null) {
                    }
                    throw th;
                }
            }
            J(sb2.toString());
            try {
                bufferedReader2.close();
            } catch (IOException e4) {
                e4.printStackTrace();
            }
        } catch (IOException e5) {
            e = e5;
            e.printStackTrace();
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        } catch (JSONException e6) {
            e = e6;
            e.printStackTrace();
            if (bufferedReader != null) {
                bufferedReader.close();
            }
        }
    }

    public boolean eV() {
        return getBoolean(c.rU, false);
    }

    public int eW() {
        return getInt(c.rV, 20);
    }

    public boolean eX() {
        if (this.qo == null) {
            this.qo = SystemProperties.get("ro.boot.hwc");
        }
        if ("india".equalsIgnoreCase(this.qo)) {
            return true;
        }
        return !TextUtils.isEmpty(this.qo) && this.qo.toLowerCase(Locale.ENGLISH).startsWith("india_");
    }

    public boolean eY() {
        return Build.getRegion().endsWith("IN");
    }

    public boolean eZ() {
        if (this.qo == null) {
            this.qo = SystemProperties.get("ro.boot.hwc");
        }
        return "cn".equalsIgnoreCase(this.qo);
    }

    public boolean fA() {
        return getBoolean(c.sr, false);
    }

    public boolean fB() {
        return getBoolean(c.sp, false);
    }

    public boolean fC() {
        return getBoolean(c.sq, false) || fB();
    }

    public boolean fD() {
        return getBoolean(c.sw, false);
    }

    public String fE() {
        return getString(c.sx, "");
    }

    public int fF() {
        return getInt(c.sy, 350);
    }

    public int fG() {
        return getInt(c.sz, 300);
    }

    public boolean fH() {
        return getBoolean(c.sF, true);
    }

    public boolean fI() {
        return getBoolean(c.sM, false);
    }

    public boolean fJ() {
        return getBoolean(c.tg, false);
    }

    public boolean fK() {
        return getBoolean(c.ti, true);
    }

    public boolean fL() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.sI, false);
    }

    public int fM() {
        return getInt(c.sJ, 280);
    }

    public float fN() {
        return (float) getDoubleFromValues(c.sK, 0.8766000270843506d);
    }

    public boolean fO() {
        if (Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.sL, false);
    }

    public boolean fP() {
        return getBoolean(c.tL, false);
    }

    public boolean fQ() {
        return getBoolean(c.sG, false);
    }

    public String fR() {
        return getString(c.tW, "v0");
    }

    public boolean fS() {
        return getBoolean(c.tu, false);
    }

    public boolean fT() {
        return getBoolean(c.sQ, false);
    }

    public boolean fU() {
        return getBoolean(c.sR, false);
    }

    public boolean fV() {
        return getBoolean(c.sS, false);
    }

    public boolean fW() {
        return getBoolean(c.ta, true);
    }

    public boolean fX() {
        return getBoolean(c.tb, false);
    }

    public int fY() {
        return getInt(c.td, 0);
    }

    public boolean fZ() {
        if (!Util.isGlobalVersion()) {
            return false;
        }
        return getBoolean(c.tj, false);
    }

    public boolean fa() {
        return getBoolean(c.rW, false) && eX();
    }

    public boolean fb() {
        return getBoolean(c.sU, false) && eX();
    }

    public boolean fc() {
        return getBoolean(c.rX, false);
    }

    public boolean fd() {
        return getBoolean(c.rY, false);
    }

    public boolean fe() {
        return getBoolean(c.rZ, false);
    }

    public boolean ff() {
        return getBoolean(c.sD, false);
    }

    public boolean fg() {
        return getBoolean(c.sb, false);
    }

    public boolean fh() {
        return getBoolean(c.sc, false);
    }

    public boolean fi() {
        return (eX() || eY()) && getBoolean(c.se, false);
    }

    public boolean fj() {
        return getBoolean(c.sg, true);
    }

    public boolean fk() {
        return getBoolean(c.sf, false);
    }

    public boolean fl() {
        return getBoolean(c.sh, false);
    }

    public boolean fm() {
        return getBoolean(c.si, false);
    }

    public boolean fn() {
        return getBoolean(c.sj, false);
    }

    public boolean fo() {
        return ((float) Util.sWindowHeight) / ((float) Util.sWindowWidth) >= 2.16f && getBoolean(c.sk, false);
    }

    public boolean fp() {
        return getBoolean(c.sl, false);
    }

    public boolean fq() {
        return getBoolean(c.sm, false);
    }

    public boolean fr() {
        return VERSION.SDK_INT == 28 && getBoolean(c.st, false);
    }

    public boolean fs() {
        return getBoolean(c.su, false);
    }

    public boolean ft() {
        return getBoolean(c.sA, true);
    }

    public boolean fu() {
        return getBoolean(c.sB, false);
    }

    public boolean fv() {
        return getBoolean(c.sv, false);
    }

    public boolean fw() {
        return getBoolean(c.sn, false);
    }

    public int fx() {
        return getInt(c.sT, 180);
    }

    public boolean fy() {
        return getBoolean(c.so, false);
    }

    public boolean fz() {
        return getBoolean(c.ss, false);
    }

    public boolean gA() {
        return getBoolean(c.tH, true);
    }

    public boolean gB() {
        return getBoolean(c.tT, false);
    }

    public boolean gC() {
        return ge() == 48000000 && gA();
    }

    public boolean gD() {
        return getBoolean(c.tI, true);
    }

    public boolean gE() {
        return getBoolean(c.tJ, true);
    }

    public boolean gF() {
        return getBoolean(c.tK, true);
    }

    public boolean gG() {
        return getBoolean(c.tM, false);
    }

    public boolean gH() {
        return getBoolean(c.tN, false);
    }

    public String gI() {
        return getString(c.tO, BuildConfig.FLAVOR);
    }

    public boolean gJ() {
        return getBoolean(c.tQ, false);
    }

    public boolean gK() {
        return getBoolean(c.tU, false);
    }

    public boolean gL() {
        return getBoolean(c.tV, false);
    }

    public boolean gM() {
        return getBoolean(c.tX, false);
    }

    public boolean ga() {
        return getBoolean(c.tk, false);
    }

    public boolean gb() {
        return getBoolean(c.sW, false);
    }

    public boolean gd() {
        return ge() <= 0 || getBoolean(c.sZ, false);
    }

    public int ge() {
        return getInt(c.sV, 0);
    }

    public int gf() {
        return getInt(c.tc, 0);
    }

    public boolean gg() {
        return getBoolean(c.te, false);
    }

    public boolean gh() {
        return getBoolean(c.tf, false);
    }

    public boolean gi() {
        if (b.iH()) {
            return false;
        }
        return getBoolean(c.tP, true);
    }

    public boolean gj() {
        return getBoolean(c.tl, true);
    }

    public boolean gk() {
        return getBoolean(c.tm, false);
    }

    public boolean gl() {
        if (VERSION.SDK_INT < 28) {
            return false;
        }
        return getBoolean(c.to, false);
    }

    public boolean gm() {
        return getBoolean(c.tp, false);
    }

    public boolean gn() {
        return getBoolean(c.tq, false);
    }

    public boolean go() {
        return getBoolean(c.tr, false);
    }

    public boolean gp() {
        return getBoolean(c.ts, false);
    }

    public boolean gq() {
        return getBoolean(c.tt, true);
    }

    public boolean gr() {
        return getBoolean(c.tv, false);
    }

    public boolean gs() {
        return getBoolean(c.tw, false);
    }

    public boolean gt() {
        return getBoolean(c.sH, false);
    }

    public boolean gu() {
        return getBoolean(c.tx, true);
    }

    public boolean gv() {
        return getBoolean(c.ty, false);
    }

    public boolean gw() {
        return getBoolean(c.tB, false);
    }

    public long gx() {
        return (long) getInt(c.tz, -1);
    }

    public int gy() {
        return getInt(c.tA, -1);
    }

    public boolean gz() {
        return getBoolean(c.tF, false);
    }

    /* access modifiers changed from: protected */
    public boolean isMutable() {
        return false;
    }

    public boolean isSupport4KUHDEIS() {
        return getBoolean(c.sP, false);
    }

    public boolean isSupportBeautyBody() {
        return getBoolean(c.sE, false);
    }

    public boolean isSupportBokehAdjust() {
        return getBoolean(c.tn, false);
    }

    public boolean isSupportMacroMode() {
        return getBoolean(c.tG, false);
    }

    public boolean isSupportNormalWideLDC() {
        return getBoolean(c.sN, false);
    }

    public boolean isSupportShortVideoBeautyBody() {
        return getBoolean(c.tC, false);
    }

    public boolean isSupportUltraWide() {
        return getBoolean(c.sC, false);
    }

    public boolean isSupportUltraWideLDC() {
        return getBoolean(c.sO, false);
    }

    public boolean isTransient() {
        return true;
    }

    public String p(boolean z) {
        return z ? getString(c.tD, "4.5") : getString(c.tE, "4");
    }

    public String provideKey() {
        return null;
    }

    public boolean q(boolean z) {
        return z && getBoolean(c.tS, false);
    }
}
