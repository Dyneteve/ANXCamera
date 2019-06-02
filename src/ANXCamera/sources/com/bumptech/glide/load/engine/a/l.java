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
    private static final int ij = 2;
    private final Context context;
    private final int ik;
    private final int il;
    private final int im;

    /* compiled from: MemorySizeCalculator */
    public static final class a {
        @VisibleForTesting
        static final int MEMORY_CACHE_TARGET_SCREENS = 2;

        /* renamed from: io reason: collision with root package name */
        static final int f2io = (VERSION.SDK_INT < 26 ? 4 : 1);
        static final float ip = 0.4f;
        static final float iq = 0.33f;
        static final int ir = 4194304;
        final Context context;
        float iA = ((float) f2io);
        float iB = 0.4f;
        float iC = 0.33f;
        int iD = ir;
        ActivityManager iu;
        c iv;
        float iz = 2.0f;

        public a(Context context2) {
            this.context = context2;
            this.iu = (ActivityManager) context2.getSystemService("activity");
            this.iv = new b(context2.getResources().getDisplayMetrics());
            if (VERSION.SDK_INT >= 26 && l.a(this.iu)) {
                this.iA = 0.0f;
            }
        }

        public l bJ() {
            return new l(this);
        }

        public a c(float f) {
            i.a(f >= 0.0f, "Memory cache screens must be greater than or equal to 0");
            this.iz = f;
            return this;
        }

        public a d(float f) {
            i.a(f >= 0.0f, "Bitmap pool screens must be greater than or equal to 0");
            this.iA = f;
            return this;
        }

        public a e(float f) {
            boolean z = f >= 0.0f && f <= 1.0f;
            i.a(z, "Size multiplier must be between 0 and 1");
            this.iB = f;
            return this;
        }

        public a f(float f) {
            boolean z = f >= 0.0f && f <= 1.0f;
            i.a(z, "Low memory max size multiplier must be between 0 and 1");
            this.iC = f;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setActivityManager(ActivityManager activityManager) {
            this.iu = activityManager;
            return this;
        }

        /* access modifiers changed from: 0000 */
        @VisibleForTesting
        public a setScreenDimensions(c cVar) {
            this.iv = cVar;
            return this;
        }

        public a x(int i) {
            this.iD = i;
            return this;
        }
    }

    /* compiled from: MemorySizeCalculator */
    private static final class b implements c {
        private final DisplayMetrics iE;

        b(DisplayMetrics displayMetrics) {
            this.iE = displayMetrics;
        }

        public int bK() {
            return this.iE.widthPixels;
        }

        public int bL() {
            return this.iE.heightPixels;
        }
    }

    /* compiled from: MemorySizeCalculator */
    interface c {
        int bK();

        int bL();
    }

    l(a aVar) {
        this.context = aVar.context;
        this.im = a(aVar.iu) ? aVar.iD / 2 : aVar.iD;
        int a2 = a(aVar.iu, aVar.iB, aVar.iC);
        float bK = (float) (aVar.iv.bK() * aVar.iv.bL() * 4);
        int round = Math.round(aVar.iA * bK);
        int round2 = Math.round(bK * aVar.iz);
        int i = a2 - this.im;
        int i2 = round2 + round;
        if (i2 <= i) {
            this.il = round2;
            this.ik = round;
        } else {
            float f = ((float) i) / (aVar.iA + aVar.iz);
            this.il = Math.round(aVar.iz * f);
            this.ik = Math.round(f * aVar.iA);
        }
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Calculation complete, Calculated memory cache size: ");
            sb.append(w(this.il));
            sb.append(", pool size: ");
            sb.append(w(this.ik));
            sb.append(", byte array size: ");
            sb.append(w(this.im));
            sb.append(", memory class limited? ");
            sb.append(i2 > a2);
            sb.append(", max size: ");
            sb.append(w(a2));
            sb.append(", memoryClass: ");
            sb.append(aVar.iu.getMemoryClass());
            sb.append(", isLowMemoryDevice: ");
            sb.append(a(aVar.iu));
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
        return this.il;
    }

    public int bH() {
        return this.ik;
    }

    public int bI() {
        return this.im;
    }
}
