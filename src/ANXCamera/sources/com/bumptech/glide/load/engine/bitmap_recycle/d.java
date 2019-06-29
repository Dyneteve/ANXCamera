package com.bumptech.glide.load.engine.bitmap_recycle;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;

/* compiled from: BitmapPool */
public interface d {
    void O();

    @NonNull
    Bitmap b(int i, int i2, Config config);

    void b(float f);

    void d(Bitmap bitmap);

    @NonNull
    Bitmap g(int i, int i2, Config config);

    long getMaxSize();

    void trimMemory(int i);
}
