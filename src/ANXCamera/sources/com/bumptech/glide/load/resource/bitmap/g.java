package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.i;
import com.bumptech.glide.util.k;

/* compiled from: BitmapTransformation */
public abstract class g implements i<Bitmap> {
    /* access modifiers changed from: protected */
    public abstract Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2);

    @NonNull
    public final p<Bitmap> transform(@NonNull Context context, @NonNull p<Bitmap> pVar, int i, int i2) {
        if (k.t(i, i2)) {
            d K = c.c(context).K();
            Bitmap bitmap = (Bitmap) pVar.get();
            if (i == Integer.MIN_VALUE) {
                i = bitmap.getWidth();
            }
            if (i2 == Integer.MIN_VALUE) {
                i2 = bitmap.getHeight();
            }
            Bitmap transform = transform(K, bitmap, i, i2);
            return bitmap.equals(transform) ? pVar : f.a(transform, K);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot apply transformation on width: ");
        sb.append(i);
        sb.append(" or height: ");
        sb.append(i2);
        sb.append(" less than or equal to zero and not Target.SIZE_ORIGINAL");
        throw new IllegalArgumentException(sb.toString());
    }
}
