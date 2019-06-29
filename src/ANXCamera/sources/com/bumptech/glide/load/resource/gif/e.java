package com.bumptech.glide.load.resource.gif;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import com.bumptech.glide.load.resource.bitmap.f;
import java.security.MessageDigest;

/* compiled from: GifDrawableTransformation */
public class e implements i<b> {
    private final i<Bitmap> lB;

    public e(i<Bitmap> iVar) {
        this.lB = (i) com.bumptech.glide.util.i.checkNotNull(iVar);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        return this.lB.equals(((e) obj).lB);
    }

    public int hashCode() {
        return this.lB.hashCode();
    }

    @NonNull
    public p<b> transform(@NonNull Context context, @NonNull p<b> pVar, int i, int i2) {
        b bVar = (b) pVar.get();
        f fVar = new f(bVar.di(), c.c(context).K());
        p transform = this.lB.transform(context, fVar, i, i2);
        if (!fVar.equals(transform)) {
            fVar.recycle();
        }
        bVar.a(this.lB, (Bitmap) transform.get());
        return pVar;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.lB.updateDiskCacheKey(messageDigest);
    }
}
