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
    private final d am;
    private final j an;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final DecodeFormat jk;
    private BitmapPreFillRunner jl;

    public a(j jVar, d dVar, DecodeFormat decodeFormat) {
        this.an = jVar;
        this.am = dVar;
        this.jk = decodeFormat;
    }

    private static int a(c cVar) {
        return k.i(cVar.getWidth(), cVar.getHeight(), cVar.getConfig());
    }

    public void b(com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        if (this.jl != null) {
            this.jl.cancel();
        }
        c[] cVarArr = new c[aVarArr.length];
        for (int i = 0; i < aVarArr.length; i++) {
            com.bumptech.glide.load.engine.prefill.c.a aVar = aVarArr[i];
            if (aVar.getConfig() == null) {
                Config config = (this.jk == DecodeFormat.PREFER_ARGB_8888 || this.jk == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE) ? Config.ARGB_8888 : Config.RGB_565;
                aVar.e(config);
            }
            cVarArr[i] = aVar.bW();
        }
        this.jl = new BitmapPreFillRunner(this.am, this.an, generateAllocationOrder(cVarArr));
        this.handler.post(this.jl);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public b generateAllocationOrder(c... cVarArr) {
        long maxSize = (this.an.getMaxSize() - this.an.bF()) + this.am.getMaxSize();
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
