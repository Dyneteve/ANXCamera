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
    private final d bm;
    private final j bn;
    private final Handler handler = new Handler(Looper.getMainLooper());
    private final DecodeFormat kk;
    private BitmapPreFillRunner kl;

    public a(j jVar, d dVar, DecodeFormat decodeFormat) {
        this.bn = jVar;
        this.bm = dVar;
        this.kk = decodeFormat;
    }

    private static int a(c cVar) {
        return k.i(cVar.getWidth(), cVar.getHeight(), cVar.getConfig());
    }

    public void b(com.bumptech.glide.load.engine.prefill.c.a... aVarArr) {
        if (this.kl != null) {
            this.kl.cancel();
        }
        c[] cVarArr = new c[aVarArr.length];
        for (int i = 0; i < aVarArr.length; i++) {
            com.bumptech.glide.load.engine.prefill.c.a aVar = aVarArr[i];
            if (aVar.getConfig() == null) {
                aVar.e((this.kk == DecodeFormat.PREFER_ARGB_8888 || this.kk == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE) ? Config.ARGB_8888 : Config.RGB_565);
            }
            cVarArr[i] = aVar.cz();
        }
        this.kl = new BitmapPreFillRunner(this.bm, this.bn, generateAllocationOrder(cVarArr));
        this.handler.post(this.kl);
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public b generateAllocationOrder(c... cVarArr) {
        long maxSize = (this.bn.getMaxSize() - this.bn.cg()) + this.bm.getMaxSize();
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
