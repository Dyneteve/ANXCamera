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
    private static final int ig = 2;
    private final Context context;
    private final int ii;
    private final int ij;
    private final int ik;

    /* compiled from: MemorySizeCalculator */
    public static final class a {
        @VisibleForTesting
        static final int MEMORY_CACHE_TARGET_SCREENS = 2;
        static final int il = (VERSION.SDK_INT < 26 ? 4 : 1);
        static final float im = 0.4f;

        /* renamed from: io reason: collision with root package name */
        static final float f3io = 0.33f;
        static final int ip = 4194304;
        final Context context;
        float iA = 0.33f;
        int iB = ip;
        ActivityManager iq;
        c ir;
        float iu = 2.0f;
        float iv = ((float) il);
        float iz = 0.4f;

        public a(Context context2) {
            this.context = context2;
            this.iq = (ActivityManager) context2.getSystemService("activity");
            this.ir = new b(context2.getResources().getDisplayMetrics());
            if (VERSION.SDK_INT >= 26 && l.a(this.iq)) {
                this.iv = 0.0f;
            }
        }

        public l bJ() {
            return new l(this);
        }

        public a c(float f) {
            i.a(f >= 0.0f, "Memory cache screens must be greater than or equal to 0");
            this.iu = f;
            return this;
        }

        public a d(float f) {
            i.a(f >= 0.0f, "Bitmap pool screens must be greater than or equal to 0");
            this.iv = f;
            return this;
        }

        public a e(float f) {
            boolean z = f >= 0.0f && f <= 1.0f;
            i.a(z, "Size multiplier must be between 0 and 1");
            this.iz = f;
            return this;
        }

        public a f(float f) {
            boolean z = f >= 0.0f && f <= 1.0f;
            i.a(z, "Low memory max size multiplier must be between 0 and 1");
            this.iA = f;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setActivityManager(ActivityManager activityManager) {
            this.iq = activityManager;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setScreenDimensions(c cVar) {
            this.ir = cVar;
            return this;
        }

        public a x(int i) {
            this.iB = i;
            return this;
        }
    }

    /* compiled from: MemorySizeCalculator */
    private static final class b implements c {
        private final DisplayMetrics iC;

        b(DisplayMetrics displayMetrics) {
            this.iC = displayMetrics;
        }

        public int bK() {
            return this.iC.widthPixels;
        }

        public int bL() {
            return this.iC.heightPixels;
        }
    }

    /* compiled from: MemorySizeCalculator */
    interface c {
        int bK();

        int bL();
    }

    l(a aVar) {
        this.context = aVar.context;
        this.ik = a(aVar.iq) ? aVar.iB / 2 : aVar.iB;
        int a2 = a(aVar.iq, aVar.iz, aVar.iA);
        float bK = (float) (aVar.ir.bK() * aVar.ir.bL() * 4);
        int round = Math.round(aVar.iv * bK);
        int round2 = Math.round(bK * aVar.iu);
        int i = a2 - this.ik;
        int i2 = round2 + round;
        if (i2 <= i) {
            this.ij = round2;
            this.ii = round;
        } else {
            float f = ((float) i) / (aVar.iv + aVar.iu);
            this.ij = Math.round(aVar.iu * f);
            this.ii = Math.round(f * aVar.iv);
        }
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Calculation complete, Calculated memory cache size: ");
            sb.append(w(this.ij));
            sb.append(", pool size: ");
            sb.append(w(this.ii));
            sb.append(", byte array size: ");
            sb.append(w(this.ik));
            sb.append(", memory class limited? ");
            sb.append(i2 > a2);
            sb.append(", max size: ");
            sb.append(w(a2));
            sb.append(", memoryClass: ");
            sb.append(aVar.iq.getMemoryClass());
            sb.append(", isLowMemoryDevice: ");
            sb.append(a(aVar.iq));
            Log.d(str, sb.toString());
        }
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

    private String w(int i) {
        return Formatter.formatFileSize(this.context, (long) i);
    }

    public int bG() {
        return this.ij;
    }

    public int bH() {
        return this.ii;
    }

    public int bI() {
        return this.ik;
    }
}
