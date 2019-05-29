package com.bumptech.glide.e;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: EmptySignature */
public final class b implements c {
    private static final b pL = new b();

    private b() {
    }

    @NonNull
    public static b eH() {
        return pL;
    }

    public String toString() {
        return "EmptySignature";
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
    }
}
