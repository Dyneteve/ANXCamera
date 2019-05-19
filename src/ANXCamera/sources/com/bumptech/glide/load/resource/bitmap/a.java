package com.bumptech.glide.load.resource.bitmap;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.i;
import java.io.IOException;

/* compiled from: BitmapDrawableDecoder */
public class a<DataType> implements g<DataType, BitmapDrawable> {
    private final Resources ko;
    private final g<DataType, Bitmap> kz;

    public a(Context context, g<DataType, Bitmap> gVar) {
        this(context.getResources(), gVar);
    }

    @Deprecated
    public a(Resources resources, d dVar, g<DataType, Bitmap> gVar) {
        this(resources, gVar);
    }

    public a(@NonNull Resources resources, @NonNull g<DataType, Bitmap> gVar) {
        this.ko = (Resources) i.checkNotNull(resources);
        this.kz = (g) i.checkNotNull(gVar);
    }

    public p<BitmapDrawable> a(@NonNull DataType datatype, int i, int i2, @NonNull f fVar) throws IOException {
        return s.a(this.ko, this.kz.a(datatype, i, i2, fVar));
    }

    public boolean a(@NonNull DataType datatype, @NonNull f fVar) throws IOException {
        return this.kz.a(datatype, fVar);
    }
}
