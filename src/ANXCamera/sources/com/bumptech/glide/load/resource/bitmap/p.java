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
    private final i<Bitmap> lB;
    private final boolean mz;

    public p(i<Bitmap> iVar, boolean z) {
        this.lB = iVar;
        this.mz = z;
    }

    private com.bumptech.glide.load.engine.p<Drawable> a(Context context, com.bumptech.glide.load.engine.p<Bitmap> pVar) {
        return s.a(context.getResources(), pVar);
    }

    public i<BitmapDrawable> cW() {
        return this;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof p)) {
            return false;
        }
        return this.lB.equals(((p) obj).lB);
    }

    public int hashCode() {
        return this.lB.hashCode();
    }

    @NonNull
    public com.bumptech.glide.load.engine.p<Drawable> transform(@NonNull Context context, @NonNull com.bumptech.glide.load.engine.p<Drawable> pVar, int i, int i2) {
        Drawable drawable = (Drawable) pVar.get();
        com.bumptech.glide.load.engine.p a = o.a(c.c(context).K(), drawable, i, i2);
        if (a != null) {
            com.bumptech.glide.load.engine.p transform = this.lB.transform(context, a, i, i2);
            if (!transform.equals(a)) {
                return a(context, transform);
            }
            transform.recycle();
            return pVar;
        } else if (!this.mz) {
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
        this.lB.updateDiskCacheKey(messageDigest);
    }
}
