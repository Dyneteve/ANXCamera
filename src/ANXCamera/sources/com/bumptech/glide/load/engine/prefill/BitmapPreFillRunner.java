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
    private static final Clock jb = new Clock();
    static final int jc = 4;
    static final long jd = TimeUnit.SECONDS.toMillis(1);
    private final d ak;
    private final j al;
    private boolean ea;
    private final Handler handler;
    private final b je;
    private final Clock jf;
    private final Set<c> jg;
    private long jh;

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
        this(dVar, jVar, bVar, jb, new Handler(Looper.getMainLooper()));
    }

    @VisibleForTesting
    BitmapPreFillRunner(d dVar, j jVar, b bVar, Clock clock, Handler handler2) {
        this.jg = new HashSet();
        this.jh = INITIAL_BACKOFF_MS;
        this.ak = dVar;
        this.al = jVar;
        this.je = bVar;
        this.jf = clock;
        this.handler = handler2;
    }

    private long bT() {
        return this.al.getMaxSize() - this.al.bF();
    }

    private long bU() {
        long j = this.jh;
        this.jh = Math.min(this.jh * 4, jd);
        return j;
    }

    private boolean c(long j) {
        return this.jf.now() - j >= 32;
    }

    /* access modifiers changed from: 0000 */
    @VisibleForTesting
    public boolean allocate() {
        Bitmap bitmap;
        long now = this.jf.now();
        while (!this.je.isEmpty() && !c(now)) {
            c bV = this.je.bV();
            if (!this.jg.contains(bV)) {
                this.jg.add(bV);
                bitmap = this.ak.g(bV.getWidth(), bV.getHeight(), bV.getConfig());
            } else {
                bitmap = Bitmap.createBitmap(bV.getWidth(), bV.getHeight(), bV.getConfig());
            }
            int p = k.p(bitmap);
            if (bT() >= ((long) p)) {
                this.al.b(new a(), f.a(bitmap, this.ak));
            } else {
                this.ak.d(bitmap);
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
        return !this.ea && !this.je.isEmpty();
    }

    public void cancel() {
        this.ea = true;
    }

    public void run() {
        if (allocate()) {
            this.handler.postDelayed(this, bU());
        }
    }
}
