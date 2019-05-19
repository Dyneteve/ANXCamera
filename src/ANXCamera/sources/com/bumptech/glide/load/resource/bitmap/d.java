package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import java.security.MessageDigest;

@Deprecated
/* compiled from: BitmapDrawableTransformation */
public class d implements i<BitmapDrawable> {
    private final i<Drawable> kA;

    public d(i<Bitmap> iVar) {
        this.kA = (i) com.bumptech.glide.util.i.checkNotNull(new p(iVar, false));
    }

    private static p<BitmapDrawable> j(p<Drawable> pVar) {
        if (pVar.get() instanceof BitmapDrawable) {
            return pVar;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Wrapped transformation unexpectedly returned a non BitmapDrawable resource: ");
        sb.append(pVar.get());
        throw new IllegalArgumentException(sb.toString());
    }

    private static p<Drawable> k(p<BitmapDrawable> pVar) {
        return pVar;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        return this.kA.equals(((d) obj).kA);
    }

    public int hashCode() {
        return this.kA.hashCode();
    }

    @NonNull
    public p<BitmapDrawable> transform(@NonNull Context context, @NonNull p<BitmapDrawable> pVar, int i, int i2) {
        return j(this.kA.transform(context, k(pVar), i, i2));
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.kA.updateDiskCacheKey(messageDigest);
    }
}
