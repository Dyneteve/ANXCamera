package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;

/* compiled from: BitmapResource */
public class f implements l, p<Bitmap> {
    private final Bitmap bitmap;
    private final d bm;

    public f(@NonNull Bitmap bitmap2, @NonNull d dVar) {
        this.bitmap = (Bitmap) i.a(bitmap2, "Bitmap must not be null");
        this.bm = (d) i.a(dVar, "BitmapPool must not be null");
    }

    @Nullable
    public static f a(@Nullable Bitmap bitmap2, @NonNull d dVar) {
        if (bitmap2 == null) {
            return null;
        }
        return new f(bitmap2, dVar);
    }

    @NonNull
    public Class<Bitmap> bG() {
        return Bitmap.class;
    }

    @NonNull
    /* renamed from: cP */
    public Bitmap get() {
        return this.bitmap;
    }

    public int getSize() {
        return k.p(this.bitmap);
    }

    public void initialize() {
        this.bitmap.prepareToDraw();
    }

    public void recycle() {
        this.bm.d(this.bitmap);
    }
}
