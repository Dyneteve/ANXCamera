package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.os.SystemClock;

/* compiled from: LogTime */
public final class e {
    private static final double pV;

    static {
        double d = 1.0d;
        if (VERSION.SDK_INT >= 17) {
            d = 1.0d / Math.pow(10.0d, 6.0d);
        }
        pV = d;
    }

    private e() {
    }

    @TargetApi(17)
    public static long eK() {
        return VERSION.SDK_INT >= 17 ? SystemClock.elapsedRealtimeNanos() : SystemClock.uptimeMillis();
    }

    public static double f(long j) {
        return ((double) (eK() - j)) * pV;
    }
}
