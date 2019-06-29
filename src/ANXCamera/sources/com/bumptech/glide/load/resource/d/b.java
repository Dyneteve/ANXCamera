package com.bumptech.glide.load.resource.d;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.bitmap.s;
import com.bumptech.glide.util.i;

/* compiled from: BitmapDrawableTranscoder */
public class b implements e<Bitmap, BitmapDrawable> {
    private final Resources resources;

    public b(@NonNull Context context) {
        this(context.getResources());
    }

    public b(@NonNull Resources resources2) {
        this.resources = (Resources) i.checkNotNull(resources2);
    }

    @Deprecated
    public b(@NonNull Resources resources2, d dVar) {
        this(resources2);
    }

    @Nullable
    public p<BitmapDrawable> a(@NonNull p<Bitmap> pVar, @NonNull f fVar) {
        return s.a(this.resources, pVar);
    }
}
