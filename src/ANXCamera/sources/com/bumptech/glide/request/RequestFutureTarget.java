package com.bumptech.glide.request;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.request.a.f;
import com.bumptech.glide.request.target.m;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class RequestFutureTarget<R> implements b<R>, e<R>, Runnable {
    private static final Waiter oJ = new Waiter();
    private final Handler bF;
    private boolean fc;
    @Nullable
    private GlideException hC;
    private final int height;
    private final boolean oK;
    private final Waiter oL;
    @Nullable
    private c oM;
    private boolean oN;
    private boolean oO;
    @Nullable
    private R resource;
    private final int width;

    @VisibleForTesting
    static class Waiter {
        Waiter() {
        }

        /* access modifiers changed from: 0000 */
        public void a(Object obj, long j) throws InterruptedException {
            obj.wait(j);
        }

        /* access modifiers changed from: 0000 */
        public void w(Object obj) {
            obj.notifyAll();
        }
    }

    public RequestFutureTarget(Handler handler, int i, int i2) {
        this(handler, i, i2, true, oJ);
    }

    RequestFutureTarget(Handler handler, int i, int i2, boolean z, Waiter waiter) {
        this.bF = handler;
        this.width = i;
        this.height = i2;
        this.oK = z;
        this.oL = waiter;
    }

    private void dS() {
        this.bF.post(this);
    }

    private synchronized R doGet(Long l) throws ExecutionException, InterruptedException, TimeoutException {
        if (this.oK && !isDone()) {
            k.fo();
        }
        if (this.fc) {
            throw new CancellationException();
        } else if (this.oO) {
            throw new ExecutionException(this.hC);
        } else if (this.oN) {
            return this.resource;
        } else {
            if (l == null) {
                this.oL.a(this, 0);
            } else if (l.longValue() > 0) {
                long currentTimeMillis = System.currentTimeMillis();
                long longValue = l.longValue() + currentTimeMillis;
                while (!isDone() && currentTimeMillis < longValue) {
                    this.oL.a(this, longValue - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                }
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            } else if (this.oO) {
                throw new ExecutionException(this.hC);
            } else if (this.fc) {
                throw new CancellationException();
            } else if (this.oN) {
                return this.resource;
            } else {
                throw new TimeoutException();
            }
        }
    }

    public void a(@NonNull m mVar) {
        mVar.q(this.width, this.height);
    }

    public synchronized void a(@NonNull R r, @Nullable f<? super R> fVar) {
    }

    public synchronized boolean a(@Nullable GlideException glideException, Object obj, n<R> nVar, boolean z) {
        this.oO = true;
        this.hC = glideException;
        this.oL.w(this);
        return false;
    }

    public synchronized boolean a(R r, Object obj, n<R> nVar, DataSource dataSource, boolean z) {
        this.oN = true;
        this.resource = r;
        this.oL.w(this);
        return false;
    }

    public void b(@NonNull m mVar) {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0018, code lost:
        return true;
     */
    public synchronized boolean cancel(boolean z) {
        if (isDone()) {
            return false;
        }
        this.fc = true;
        this.oL.w(this);
        if (z) {
            dS();
        }
    }

    public void d(@Nullable Drawable drawable) {
    }

    @Nullable
    public c dR() {
        return this.oM;
    }

    public void e(@Nullable Drawable drawable) {
    }

    public synchronized void f(@Nullable Drawable drawable) {
    }

    public R get() throws InterruptedException, ExecutionException {
        try {
            return doGet(null);
        } catch (TimeoutException e) {
            throw new AssertionError(e);
        }
    }

    public R get(long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return doGet(Long.valueOf(timeUnit.toMillis(j)));
    }

    public synchronized boolean isCancelled() {
        return this.fc;
    }

    public synchronized boolean isDone() {
        return this.fc || this.oN || this.oO;
    }

    public void j(@Nullable c cVar) {
        this.oM = cVar;
    }

    public void onDestroy() {
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void run() {
        if (this.oM != null) {
            this.oM.clear();
            this.oM = null;
        }
    }
}
