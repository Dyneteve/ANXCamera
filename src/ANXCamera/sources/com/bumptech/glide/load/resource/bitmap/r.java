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
    private static final int lA = 128;
    private static final File lB = new File("/proc/self/fd");
    private static final int lC = 50;
    private static final int lD = 700;
    private static volatile r lG;
    private volatile int lE;
    private volatile boolean lF = true;

    private r() {
    }

    static r cv() {
        if (lG == null) {
            synchronized (r.class) {
                if (lG == null) {
                    lG = new r();
                }
            }
        }
        return lG;
    }

    private synchronized boolean cw() {
        int i = this.lE + 1;
        this.lE = i;
        if (i >= 50) {
            boolean z = false;
            this.lE = 0;
            int length = lB.list().length;
            if (length < 700) {
                z = true;
            }
            this.lF = z;
            if (!this.lF && Log.isLoggable("Downsampler", 5)) {
                StringBuilder sb = new StringBuilder();
                sb.append("Excluding HARDWARE bitmap config because we're over the file descriptor limit, file descriptors ");
                sb.append(length);
                sb.append(", limit ");
                sb.append(700);
                Log.w("Downsampler", sb.toString());
            }
        }
        return this.lF;
    }

    /* access modifiers changed from: 0000 */
    @TargetApi(26)
    public boolean a(int i, int i2, Options options, DecodeFormat decodeFormat, boolean z, boolean z2) {
        if (!z || VERSION.SDK_INT < 26 || decodeFormat == DecodeFormat.PREFER_ARGB_8888_DISALLOW_HARDWARE || z2) {
            return false;
        }
        boolean z3 = i >= 128 && i2 >= 128 && cw();
        if (z3) {
            options.inPreferredConfig = Config.HARDWARE;
            options.inMutable = false;
        }
        return z3;
    }
}
