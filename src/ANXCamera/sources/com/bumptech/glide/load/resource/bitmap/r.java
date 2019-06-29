package com.bumptech.glide.load.resource.bitmap;

import android.annotation.TargetApi;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory.Options;
import android.os.Build.VERSION;
import android.util.Log;
import com.bumptech.glide.load.DecodeFormat;
import java.io.File;

/* compiled from: HardwareConfigState */
final class r {
    private static final int mA = 128;
    private static final File mB = new File("/proc/self/fd");
    private static final int mC = 50;
    private static final int mD = 700;
    private static volatile r mG;
    private volatile int mE;
    private volatile boolean mF = true;

    private r() {
    }

    static r cX() {
        if (mG == null) {
            synchronized (r.class) {
                if (mG == null) {
                    mG = new r();
                }
            }
        }
        return mG;
    }

    private synchronized boolean cY() {
        int i = this.mE + 1;
        this.mE = i;
        if (i >= 50) {
            boolean z = false;
            this.mE = 0;
            int length = mB.list().length;
            if (length < 700) {
                z = true;
            }
            this.mF = z;
            if (!this.mF && Log.isLoggable("Downsampler", 5)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Excluding HARDWARE bitmap config because we're over the file descriptor limit, file descriptors ");
                sb.append(length);
                sb.append(", limit ");
                sb.append(700);
                Log.w("Downsampler", sb.toString());
            }
        }
        return this.mF;
    }

    /* access modifiers changed from: 0000 */
    @TargetApi(26)
    public boolean a(int i, int i2, Options options, DecodeFormat decodeFormat, boolean z, boolean z2) {
        if (!z || VERSION.SDK_INT < 26 || decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE || z2) {
            return false;
        }
        boolean z3 = i >= 128 && i2 >= 128 && cY();
        if (z3) {
            options.inPreferredConfig = Config.HARDWARE;
            options.inMutable = false;
        }
        return z3;
    }
}
