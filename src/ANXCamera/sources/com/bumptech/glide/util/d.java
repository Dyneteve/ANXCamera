package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.f.b;

/* compiled from: FixedPreloadSizeProvider */
public class d<T> implements b<T> {
    private final int[] pU;

    public d(int i, int i2) {
        this.pU = new int[]{i, i2};
    }

    @Nullable
    public int[] b(@NonNull T t, int i, int i2) {
        return this.pU;
    }
}
