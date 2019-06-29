package com.bumptech.glide.load.resource.bitmap;

import android.graphics.drawable.BitmapDrawable;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.l;
import com.bumptech.glide.load.resource.b.b;
import com.bumptech.glide.util.k;

/* compiled from: BitmapDrawableResource */
public class c extends b<BitmapDrawable> implements l {
    private final d bm;

    public c(BitmapDrawable bitmapDrawable, d dVar) {
        super(bitmapDrawable);
        this.bm = dVar;
    }

    @NonNull
    public Class<BitmapDrawable> bG() {
        return BitmapDrawable.class;
    }

    public int getSize() {
        return k.p(((BitmapDrawable) this.drawable).getBitmap());
    }

    public void initialize() {
        ((BitmapDrawable) this.drawable).getBitmap().prepareToDraw();
    }

    public void recycle() {
        this.bm.d(((BitmapDrawable) this.drawable).getBitmap());
    }
}
