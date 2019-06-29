package com.bumptech.glide.load.engine.bitmap_recycle;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* compiled from: LruBitmapPool */
public class j implements d {
    private static final Config DEFAULT_CONFIG = Config.ARGB_8888;
    private static final String TAG = "LruBitmapPool";
    private final k iC;
    private final Set<Config> iD;
    private final long iE;
    private final a iF;
    private long iG;
    private int iH;
    private int iI;
    private int iJ;
    private int iK;
    private long maxSize;

    /* compiled from: LruBitmapPool */
    private interface a {
        void j(Bitmap bitmap);

        void k(Bitmap bitmap);
    }

    /* compiled from: LruBitmapPool */
    private static final class b implements a {
        b() {
        }

        public void j(Bitmap bitmap) {
        }

        public void k(Bitmap bitmap) {
        }
    }

    /* compiled from: LruBitmapPool */
    private static class c implements a {
        private final Set<Bitmap> iL = Collections.synchronizedSet(new HashSet());

        private c() {
        }

        public void j(Bitmap bitmap) {
            if (!this.iL.contains(bitmap)) {
                this.iL.add(bitmap);
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Can't add already added bitmap: ");
            sb.append(bitmap);
            sb.append(" [");
            sb.append(bitmap.getWidth());
            sb.append("x");
            sb.append(bitmap.getHeight());
            sb.append("]");
            throw new IllegalStateException(sb.toString());
        }

        public void k(Bitmap bitmap) {
            if (this.iL.contains(bitmap)) {
                this.iL.remove(bitmap);
                return;
            }
            throw new IllegalStateException("Cannot remove bitmap not in tracker");
        }
    }

    public j(long j) {
        this(j, bW(), bX());
    }

    j(long j, k kVar, Set<Config> set) {
        this.iE = j;
        this.maxSize = j;
        this.iC = kVar;
        this.iD = set;
        this.iF = new b();
    }

    public j(long j, Set<Config> set) {
        this(j, bW(), set);
    }

    private synchronized void b(long j) {
        while (this.iG > j) {
            Bitmap bM = this.iC.bM();
            if (bM == null) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Size mismatch, resetting");
                    bV();
                }
                this.iG = 0;
                return;
            }
            this.iF.k(bM);
            this.iG -= (long) this.iC.f(bM);
            this.iK++;
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Evicting bitmap=");
                sb.append(this.iC.e(bM));
                Log.d(str, sb.toString());
            }
            dump();
            bM.recycle();
        }
    }

    @TargetApi(26)
    private static void b(Config config) {
        if (VERSION.SDK_INT >= 26 && config == Config.HARDWARE) {
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot create a mutable Bitmap with config: ");
            sb.append(config);
            sb.append(". Consider setting Downsampler#ALLOW_HARDWARE_CONFIG to false in your RequestOptions and/or in GlideBuilder.setDefaultRequestOptions");
            throw new IllegalArgumentException(sb.toString());
        }
    }

    private void bS() {
        b(this.maxSize);
    }

    private void bV() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Hits=");
        sb.append(this.iH);
        sb.append(", misses=");
        sb.append(this.iI);
        sb.append(", puts=");
        sb.append(this.iJ);
        sb.append(", evictions=");
        sb.append(this.iK);
        sb.append(", currentSize=");
        sb.append(this.iG);
        sb.append(", maxSize=");
        sb.append(this.maxSize);
        sb.append("\nStrategy=");
        sb.append(this.iC);
        Log.v(str, sb.toString());
    }

    private static k bW() {
        return VERSION.SDK_INT >= 19 ? new SizeConfigStrategy() : new AttributeStrategy();
    }

    @TargetApi(26)
    private static Set<Config> bX() {
        HashSet hashSet = new HashSet(Arrays.asList(Config.values()));
        if (VERSION.SDK_INT >= 19) {
            hashSet.add(null);
        }
        if (VERSION.SDK_INT >= 26) {
            hashSet.remove(Config.HARDWARE);
        }
        return Collections.unmodifiableSet(hashSet);
    }

    @NonNull
    private static Bitmap createBitmap(int i, int i2, @Nullable Config config) {
        if (config == null) {
            config = DEFAULT_CONFIG;
        }
        return Bitmap.createBitmap(i, i2, config);
    }

    private void dump() {
        if (Log.isLoggable(TAG, 2)) {
            bV();
        }
    }

    @Nullable
    private synchronized Bitmap h(int i, int i2, @Nullable Config config) {
        Bitmap b2;
        b(config);
        b2 = this.iC.b(i, i2, config != null ? config : DEFAULT_CONFIG);
        if (b2 == null) {
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Missing bitmap=");
                sb.append(this.iC.c(i, i2, config));
                Log.d(str, sb.toString());
            }
            this.iI++;
        } else {
            this.iH++;
            this.iG -= (long) this.iC.f(b2);
            this.iF.k(b2);
            h(b2);
        }
        if (Log.isLoggable(TAG, 2)) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Get bitmap=");
            sb2.append(this.iC.c(i, i2, config));
            Log.v(str2, sb2.toString());
        }
        dump();
        return b2;
    }

    private static void h(Bitmap bitmap) {
        bitmap.setHasAlpha(true);
        i(bitmap);
    }

    @TargetApi(19)
    private static void i(Bitmap bitmap) {
        if (VERSION.SDK_INT >= 19) {
            bitmap.setPremultiplied(true);
        }
    }

    public void O() {
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, "clearMemory");
        }
        b(0);
    }

    @NonNull
    public Bitmap b(int i, int i2, Config config) {
        Bitmap h = h(i, i2, config);
        if (h == null) {
            return createBitmap(i, i2, config);
        }
        h.eraseColor(0);
        return h;
    }

    public synchronized void b(float f) {
        this.maxSize = (long) Math.round(((float) this.iE) * f);
        bS();
    }

    public synchronized void d(Bitmap bitmap) {
        if (bitmap == null) {
            throw new NullPointerException("Bitmap must not be null");
        } else if (!bitmap.isRecycled()) {
            if (bitmap.isMutable() && ((long) this.iC.f(bitmap)) <= this.maxSize) {
                if (this.iD.contains(bitmap.getConfig())) {
                    int f = this.iC.f(bitmap);
                    this.iC.d(bitmap);
                    this.iF.j(bitmap);
                    this.iJ++;
                    this.iG += (long) f;
                    if (Log.isLoggable(TAG, 2)) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("Put bitmap in pool=");
                        sb.append(this.iC.e(bitmap));
                        Log.v(str, sb.toString());
                    }
                    dump();
                    bS();
                    return;
                }
            }
            if (Log.isLoggable(TAG, 2)) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Reject bitmap from pool, bitmap: ");
                sb2.append(this.iC.e(bitmap));
                sb2.append(", is mutable: ");
                sb2.append(bitmap.isMutable());
                sb2.append(", is allowed config: ");
                sb2.append(this.iD.contains(bitmap.getConfig()));
                Log.v(str2, sb2.toString());
            }
            bitmap.recycle();
        } else {
            throw new IllegalStateException("Cannot pool recycled bitmap");
        }
    }

    @NonNull
    public Bitmap g(int i, int i2, Config config) {
        Bitmap h = h(i, i2, config);
        return h == null ? createBitmap(i, i2, config) : h;
    }

    public long getMaxSize() {
        return this.maxSize;
    }

    @SuppressLint({"InlinedApi"})
    public void trimMemory(int i) {
        if (Log.isLoggable(TAG, 3)) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("trimMemory, level=");
            sb.append(i);
            Log.d(str, sb.toString());
        }
        if (i >= 40) {
            O();
        } else if (i >= 20 || i == 15) {
            b(getMaxSize() / 2);
        }
    }
}
