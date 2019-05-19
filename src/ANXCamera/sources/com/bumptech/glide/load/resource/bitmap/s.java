package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.c;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;

/* compiled from: LazyBitmapDrawableResource */
public final class s implements l, p<BitmapDrawable> {
    private final Resources ko;
    private final p<Bitmap> lG;

    private s(@NonNull Resources resources, @NonNull p<Bitmap> pVar) {
        this.ko = (Resources) i.checkNotNull(resources);
        this.lG = (p) i.checkNotNull(pVar);
    }

    @Nullable
    public static p<BitmapDrawable> a(@NonNull Resources resources, @Nullable p<Bitmap> pVar) {
        if (pVar == null) {
            return null;
        }
        return new s(resources, pVar);
    }

    @Deprecated
    public static s a(Context context, Bitmap bitmap) {
        return (s) a(context.getResources(), (p<Bitmap>) f.a(bitmap, c.c(context).k()));
    }

    @Deprecated
    public static s a(Resources resources, d dVar, Bitmap bitmap) {
        return (s) a(resources, (p<Bitmap>) f.a(bitmap, dVar));
    }

    @NonNull
    public Class<BitmapDrawable> bf() {
        return BitmapDrawable.class;
    }

    @NonNull
    /* renamed from: cx */
    public BitmapDrawable get() {
        return new BitmapDrawable(this.ko, (Bitmap) this.lG.get());
    }

    public int getSize() {
        return this.lG.getSize();
    }

    public void initialize() {
        if (this.lG instanceof l) {
            ((l) this.lG).initialize();
        }
    }

    public void recycle() {
        this.lG.recycle();
    }
}
