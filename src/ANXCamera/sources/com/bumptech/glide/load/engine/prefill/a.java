package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap.Config;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.util.k;
import java.util.HashMap;

/* compiled from: BitmapPreFiller */
public final class a {
    private final d al;
    private final j am;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final DecodeFormat jj;
    private BitmapPreFillRunner jk;

    public a(j jVar, d dVar, DecodeFormat decodeFormat) {
        this.am = jVar;
        this.al = dVar;
        this.jj = decodeFormat;
    }

    private static int a(c cVar) {
        return k.i(cVar.getWidth(), cVar.getHeight(), cVar.getConfig());
    }

    public void b(com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        if (this.jk != null) {
            this.jk.cancel();
        }
        c[] cVarArr = new c[aVarArr.length];
        for (int i = 0; i < aVarArr.length; i++) {
            com.bumptech.glide.load.engine.prefill.c.a aVar = aVarArr[i];
            if (aVar.getConfig() == null) {
                Config config = (this.jj == DecodeFormat.PREFER_ARGB_8888 || this.jj == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE) ? Config.ARGB_8888 : Config.RGB_565;
                aVar.e(config);
            }
            cVarArr[i] = aVar.bW();
        }
        this.jk = new BitmapPreFillRunner(this.al, this.am, generateAllocationOrder(cVarArr));
        this.handler.post(this.jk);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public b generateAllocationOrder(c... cVarArr) {
        long maxSize = (this.am.getMaxSize() - this.am.bF()) + this.al.getMaxSize();
        int i = 0;
        for (c weight : cVarArr) {
            i += weight.getWeight();
        }
        float f = ((float) maxSize) / ((float) i);
        HashMap hashMap = new HashMap();
        for (c cVar : cVarArr) {
            hashMap.put(cVar, Integer.valueOf(Math.round(((float) cVar.getWeight()) * f) / a(cVar)));
        }
        return new b(hashMap);
    }
}
