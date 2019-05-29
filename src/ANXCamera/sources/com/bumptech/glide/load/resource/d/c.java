package com.bumptech.glide.load.resource.d;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.gif.b;

/* compiled from: DrawableBytesTranscoder */
public final class c implements e<Drawable, byte[]> {
    private final d al;
    private final e<Bitmap, byte[]> mK;
    private final e<b, byte[]> mL;

    public c(@NonNull d dVar, @NonNull e<Bitmap, byte[]> eVar, @NonNull e<b, byte[]> eVar2) {
        this.al = dVar;
        this.mK = eVar;
        this.mL = eVar2;
    }

    @NonNull
    private static p<b> l(@NonNull p<Drawable> pVar) {
        return pVar;
    }

    @Nullable
    public p<byte[]> a(@NonNull p<Drawable> pVar, @NonNull f fVar) {
        Drawable drawable = (Drawable) pVar.get();
        if (drawable instanceof BitmapDrawable) {
            return this.mK.a(com.bumptech.glide.load.resource.bitmap.f.a(((BitmapDrawable) drawable).getBitmap(), this.al), fVar);
        }
        if (drawable instanceof b) {
            return this.mL.a(l(pVar), fVar);
        }
        return null;
    }
}
