package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.h;
import java.io.File;

/* compiled from: BitmapDrawableEncoder */
public class b implements h<BitmapDrawable> {
    private final d bm;
    private final h<Bitmap> gA;

    public b(d dVar, h<Bitmap> hVar) {
        this.bm = dVar;
        this.gA = hVar;
    }

    public boolean a(@NonNull p<BitmapDrawable> pVar, @NonNull File file, @NonNull f fVar) {
        return this.gA.a(new f(((BitmapDrawable) pVar.get()).getBitmap(), this.bm), file, fVar);
    }

    @NonNull
    public EncodeStrategy b(@NonNull f fVar) {
        return this.gA.b(fVar);
    }
}
