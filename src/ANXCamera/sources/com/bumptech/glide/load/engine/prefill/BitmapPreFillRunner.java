package com.bumptech.glide.load.engine.prefill;

import android.graphics.Bitmap;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.resource.bitmap.f;
import com.bumptech.glide.util.k;
import java.security.MessageDigest;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

final class BitmapPreFillRunner implements Runnable {
    static final long INITIAL_BACKOFF_MS = 40;
    static final long MAX_DURATION_MS = 32;
    @VisibleForTesting
    static final String TAG = "PreFillRunner";
    private static final Clock jd = new Clock();
    static final int je = 4;
    static final long jf = TimeUnit.SECONDS.toMillis(1);
    private final d am;
    private final j an;
    private boolean ec;
    private final Handler handler;
    private final b jg;
    private final Clock jh;
    private final Set<c> ji;
    private long jj;

    @VisibleForTesting
    static class Clock {
        Clock() {
        }

        /* access modifiers changed from: 0000 */
        public long now() {
            return SystemClock.currentThreadTimeMillis();
        }
    }

    private static final class a implements c {
        a() {
        }

        public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
            throw new UnsupportedOperationException();
        }
    }

    public BitmapPreFillRunner(d dVar, j jVar, b bVar) {
        this(dVar, jVar, bVar, jd, new Handler(Looper.getMainLooper()));
    }

    @VisibleForTesting
    BitmapPreFillRunner(d dVar, j jVar, b bVar, Clock clock, Handler handler2) {
        this.ji = new HashSet();
        this.jj = INITIAL_BACKOFF_MS;
        this.am = dVar;
        this.an = jVar;
        this.jg = bVar;
        this.jh = clock;
        this.handler = handler2;
    }

    private long bT() {
        return this.an.getMaxSize() - this.an.bF();
    }

    private long bU() {
        long j = this.jj;
        this.jj = Math.min(this.jj * 4, jf);
        return j;
    }

    private boolean c(long j) {
        return this.jh.now() - j >= MAX_DURATION_MS;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public boolean allocate() {
        Bitmap bitmap;
        long now = this.jh.now();
        while (!this.jg.isEmpty() && !c(now)) {
            c bV = this.jg.bV();
            if (!this.ji.contains(bV)) {
                this.ji.add(bV);
                bitmap = this.am.g(bV.getWidth(), bV.getHeight(), bV.getConfig());
            } else {
                bitmap = Bitmap.createBitmap(bV.getWidth(), bV.getHeight(), bV.getConfig());
            }
            int p = k.p(bitmap);
            if (bT() >= ((long) p)) {
                this.an.b(new a(), f.a(bitmap, this.am));
            } else {
                this.am.d(bitmap);
            }
            if (Log.isLoggable(TAG, 3)) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("allocated [");
                sb.append(bV.getWidth());
                sb.append("x");
                sb.append(bV.getHeight());
                sb.append("] ");
                sb.append(bV.getConfig());
                sb.append(" size: ");
                sb.append(p);
                Log.d(str, sb.toString());
            }
        }
        return !this.ec && !this.jg.isEmpty();
    }

    public void cancel() {
        this.ec = true;
    }

    public void run() {
        if (allocate()) {
            this.handler.postDelayed(this, bU());
        }
    }
}
