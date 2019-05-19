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
    private final d ak;
    private final e<Bitmap, byte[]> mJ;
    private final e<b, byte[]> mK;

    public c(@NonNull d dVar, @NonNull e<Bitmap, byte[]> eVar, @NonNull e<b, byte[]> eVar2) {
        this.ak = dVar;
        this.mJ = eVar;
        this.mK = eVar2;
    }

    @NonNull
    private static p<b> l(@NonNull p<Drawable> pVar) {
        return pVar;
    }

    @Nullable
    public p<byte[]> a(@NonNull p<Drawable> pVar, @NonNull f fVar) {
        Drawable drawable = (Drawable) pVar.get();
        if (drawable instanceof BitmapDrawable) {
            return this.mJ.a(com.bumptech.glide.load.resource.bitmap.f.a(((BitmapDrawable) drawable).getBitmap(), this.ak), fVar);
        }
        if (drawable instanceof b) {
            return this.mK.a(l(pVar), fVar);
        }
        return null;
    }
}
