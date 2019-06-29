package com.bumptech.glide.load.engine.a;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.content.Context;
import android.os.Build.VERSION;
import android.support.annotation.VisibleForTesting;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
import com.bumptech.glide.util.i;

/* compiled from: MemorySizeCalculator */
public final class l {
    @VisibleForTesting
    static final int BYTES_PER_ARGB_8888_PIXEL = 4;
    private static final String TAG = "MemorySizeCalculator";
    private static final int jp = 2;
    private final Context context;
    private final int jq;
    private final int jr;
    private final int js;

    /* compiled from: MemorySizeCalculator */
    public static final class a {
        @VisibleForTesting
        static final int MEMORY_CACHE_TARGET_SCREENS = 2;
        static final int jt = (VERSION.SDK_INT < 26 ? 4 : 1);
        static final float ju = 0.4f;
        static final float jv = 0.33f;
        static final int jw = 4194304;
        final Context context;
        float jA = ((float) jt);
        float jB = 0.4f;
        float jC = 0.33f;
        int jD = 4194304;
        ActivityManager jx;
        c jy;
        float jz = 2.0f;

        public a(Context context2) {
            this.context = context2;
            this.jx = (ActivityManager) context2.getSystemService("activity");
            this.jy = new b(context2.getResources().getDisplayMetrics());
            if (VERSION.SDK_INT >= 26 && l.a(this.jx)) {
                this.jA = 0.0f;
            }
        }

        public a B(int i) {
            this.jD = i;
            return this;
        }

        public a c(float f) {
            i.a(f >= 0.0f, "Memory cache screens must be greater than or equal to 0");
            this.jz = f;
            return this;
        }

        public l cl() {
            return new l(this);
        }

        public a d(float f) {
            i.a(f >= 0.0f, "Bitmap pool screens must be greater than or equal to 0");
            this.jA = f;
            return this;
        }

        public a e(float f) {
            i.a(f >= 0.0f && f <= 1.0f, "Size multiplier must be between 0 and 1");
            this.jB = f;
            return this;
        }

        public a f(float f) {
            i.a(f >= 0.0f && f <= 1.0f, "Low memory max size multiplier must be between 0 and 1");
            this.jC = f;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setActivityManager(ActivityManager activityManager) {
            this.jx = activityManager;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setScreenDimensions(c cVar) {
            this.jy = cVar;
            return this;
        }
    }

    /* compiled from: MemorySizeCalculator */
    private static final class b implements c {
        private final DisplayMetrics jE;

        b(DisplayMetrics displayMetrics) {
            this.jE = displayMetrics;
        }

        public int cm() {
            return this.jE.widthPixels;
        }

        public int cn() {
            return this.jE.heightPixels;
        }
    }

    /* compiled from: MemorySizeCalculator */
    interface c {
        int cm();

        int cn();
    }

    l(a aVar) {
        this.context = aVar.context;
        this.js = a(aVar.jx) ? aVar.jD / 2 : aVar.jD;
        int a2 = a(aVar.jx, aVar.jB, aVar.jC);
        float cm = (float) (aVar.jy.cm() * aVar.jy.cn() * 4);
        int round = Math.round(aVar.jA * cm);
        int round2 = Math.round(cm * aVar.jz);
        int i = a2 - this.js;
        int i2 = round2 + round;
        if (i2 <= i) {
            this.jr = round2;
            this.jq = round;
        } else {
            float f = ((float) i) / (aVar.jA + aVar.jz);
            this.jr = Math.round(aVar.jz * f);
            this.jq = Math.round(f * aVar.jA);
        }
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Calculation complete, Calculated memory cache size: ");
            sb.append(A(this.jr));
            sb.append(", pool size: ");
            sb.append(A(this.jq));
            sb.append(", byte array size: ");
            sb.append(A(this.js));
            sb.append(", memory class limited? ");
            sb.append(i2 > a2);
            sb.append(", max size: ");
            sb.append(A(a2));
            sb.append(", memoryClass: ");
            sb.append(aVar.jx.getMemoryClass());
            sb.append(", isLowMemoryDevice: ");
            sb.append(a(aVar.jx));
            Log.d(str, sb.toString());
        }
    }

    private String A(int i) {
        return Formatter.formatFileSize(this.context, (long) i);
    }

    private static int a(ActivityManager activityManager, float f, float f2) {
        float memoryClass = (float) (activityManager.getMemoryClass() * 1024 * 1024);
        if (a(activityManager)) {
            f = f2;
        }
        return Math.round(memoryClass * f);
    }

    @TargetApi(19)
    static boolean a(ActivityManager activityManager) {
        if (VERSION.SDK_INT >= 19) {
            return activityManager.isLowRamDevice();
        }
        return true;
    }

    public int ci() {
        return this.jr;
    }

    public int cj() {
        return this.jq;
    }

    public int ck() {
        return this.js;
    }
}
