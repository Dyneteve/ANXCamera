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
    private static final Clock jc = new Clock();
    static final int jd = 4;
    static final long je = TimeUnit.SECONDS.toMillis(1);
    private final d al;
    private final j am;
    private boolean eb;
    private final Handler handler;
    private final b jf;
    private final Clock jg;
    private final Set<c> jh;
    private long ji;

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
        this(dVar, jVar, bVar, jc, new Handler(Looper.getMainLooper()));
    }

    @VisibleForTesting
    BitmapPreFillRunner(d dVar, j jVar, b bVar, Clock clock, Handler handler2) {
        this.jh = new HashSet();
        this.ji = INITIAL_BACKOFF_MS;
        this.al = dVar;
        this.am = jVar;
        this.jf = bVar;
        this.jg = clock;
        this.handler = handler2;
    }

    private long bT() {
        return this.am.getMaxSize() - this.am.bF();
    }

    private long bU() {
        long j = this.ji;
        this.ji = Math.min(this.ji * 4, je);
        return j;
    }

    private boolean c(long j) {
        return this.jg.now() - j >= 32;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public boolean allocate() {
        Bitmap bitmap;
        long now = this.jg.now();
        while (!this.jf.isEmpty() && !c(now)) {
            c bV = this.jf.bV();
            if (!this.jh.contains(bV)) {
                this.jh.add(bV);
                bitmap = this.al.g(bV.getWidth(), bV.getHeight(), bV.getConfig());
            } else {
                bitmap = Bitmap.createBitmap(bV.getWidth(), bV.getHeight(), bV.getConfig());
            }
            int p = k.p(bitmap);
            if (bT() >= ((long) p)) {
                this.am.b(new a(), f.a(bitmap, this.al));
            } else {
                this.al.d(bitmap);
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
        return !this.eb && !this.jf.isEmpty();
    }

    public void cancel() {
        this.eb = true;
    }

    public void run() {
        if (allocate()) {
            this.handler.postDelayed(this, bU());
        }
    }
}
