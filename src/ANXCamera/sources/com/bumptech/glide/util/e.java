package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.os.Build.VERSION;
import android.os.SystemClock;

/* compiled from: LogTime */
public final class e {
    private static final double qV;

    static {
        double d = 1.0d;
        if (VERSION.SDK_INT >= 17) {
            d = 1.0d / Math.pow(10.0d, 6.0d);
        }
        qV = d;
    }

    private e() {
    }

    public static double f(long j) {
        return ((double) (fm() - j)) * qV;
    }

    @TargetApi(17)
    public static long fm() {
        return VERSION.SDK_INT >= 17 ? SystemClock.elapsedRealtimeNanos() : SystemClock.uptimeMillis();
    }
}
