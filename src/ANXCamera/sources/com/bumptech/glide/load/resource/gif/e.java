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
    private final i<Bitmap> kC;

    public e(i<Bitmap> iVar) {
        this.kC = (i) com.bumptech.glide.util.i.checkNotNull(iVar);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        return this.kC.equals(((e) obj).kC);
    }

    public int hashCode() {
        return this.kC.hashCode();
    }

    @NonNull
    public p<b> transform(@NonNull Context context, @NonNull p<b> pVar, int i, int i2) {
        b bVar = (b) pVar.get();
        f fVar = new f(bVar.cG(), c.c(context).k());
        p transform = this.kC.transform(context, fVar, i, i2);
        if (!fVar.equals(transform)) {
            fVar.recycle();
        }
        bVar.a(this.kC, (Bitmap) transform.get());
        return pVar;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.kC.updateDiskCacheKey(messageDigest);
    }
}
