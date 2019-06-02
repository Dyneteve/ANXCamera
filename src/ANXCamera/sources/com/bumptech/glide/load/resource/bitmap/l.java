package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import java.security.MessageDigest;

/* compiled from: CircleCrop */
public class l extends g {
    private static final String ID = "com.bumptech.glide.load.resource.bitmap.CircleCrop.1";
    private static final int VERSION = 1;
    private static final byte[] kG = ID.getBytes(dI);

    public boolean equals(Object obj) {
        return obj instanceof l;
    }

    public int hashCode() {
        return ID.hashCode();
    }

    /* access modifiers changed from: protected */
    public Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return w.d(dVar, bitmap, i, i2);
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(kG);
    }
}
