package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.i;
import java.security.MessageDigest;

/* compiled from: DrawableTransformation */
public class p implements i<Drawable> {
    private final i<Bitmap> kA;
    private final boolean ly;

    public p(i<Bitmap> iVar, boolean z) {
        this.kA = iVar;
        this.ly = z;
    }

    private com.bumptech.glide.load.engine.p<Drawable> a(Context context, com.bumptech.glide.load.engine.p<Bitmap> pVar) {
        return s.a(context.getResources(), pVar);
    }

    public i<BitmapDrawable> cu() {
        return this;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof p)) {
            return false;
        }
        return this.kA.equals(((p) obj).kA);
    }

    public int hashCode() {
        return this.kA.hashCode();
    }

    @NonNull
    public com.bumptech.glide.load.engine.p<Drawable> transform(@NonNull Context context, @NonNull com.bumptech.glide.load.engine.p<Drawable> pVar, int i, int i2) {
        Drawable drawable = (Drawable) pVar.get();
        com.bumptech.glide.load.engine.p a = o.a(c.c(context).k(), drawable, i, i2);
        if (a != null) {
            com.bumptech.glide.load.engine.p transform = this.kA.transform(context, a, i, i2);
            if (!transform.equals(a)) {
                return a(context, transform);
            }
            transform.recycle();
            return pVar;
        } else if (!this.ly) {
            return pVar;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("Unable to convert ");
            sb.append(drawable);
            sb.append(" to a Bitmap");
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.kA.updateDiskCacheKey(messageDigest);
    }
}
