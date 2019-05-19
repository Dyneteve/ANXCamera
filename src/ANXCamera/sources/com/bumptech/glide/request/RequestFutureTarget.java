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
    private static final Waiter nH = new Waiter();
    private final Handler aD;
    private boolean ea;
    @Nullable
    private GlideException gA;
    private final int height;
    private final boolean nI;
    private final Waiter nJ;
    @Nullable
    private c nK;
    private boolean nL;
    private boolean nM;
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
        public void t(Object obj) {
            obj.notifyAll();
        }
    }

    public RequestFutureTarget(Handler handler, int i, int i2) {
        this(handler, i, i2, true, nH);
    }

    RequestFutureTarget(Handler handler, int i, int i2, boolean z, Waiter waiter) {
        this.aD = handler;
        this.width = i;
        this.height = i2;
        this.nI = z;
        this.nJ = waiter;
    }

    private synchronized R doGet(Long l) throws ExecutionException, InterruptedException, TimeoutException {
        if (this.nI && !isDone()) {
            k.eM();
        }
        if (this.ea) {
            throw new CancellationException();
        } else if (this.nM) {
            throw new ExecutionException(this.gA);
        } else if (this.nL) {
            return this.resource;
        } else {
            if (l == null) {
                this.nJ.a(this, 0);
            } else if (l.longValue() > 0) {
                long currentTimeMillis = System.currentTimeMillis();
                long longValue = l.longValue() + currentTimeMillis;
                while (!isDone() && currentTimeMillis < longValue) {
                    this.nJ.a(this, longValue - currentTimeMillis);
                    currentTimeMillis = System.currentTimeMillis();
                }
            }
            if (Thread.interrupted()) {
                throw new InterruptedException();
            } else if (this.nM) {
                throw new ExecutionException(this.gA);
            } else if (this.ea) {
                throw new CancellationException();
            } else if (this.nL) {
                return this.resource;
            } else {
                throw new TimeoutException();
            }
        }
    }

    private void dq() {
        this.aD.post(this);
    }

    public void a(@NonNull m mVar) {
        mVar.p(this.width, this.height);
    }

    public synchronized void a(@NonNull R r, @Nullable f<? super R> fVar) {
    }

    public synchronized boolean a(@Nullable GlideException glideException, Object obj, n<R> nVar, boolean z) {
        this.nM = true;
        this.gA = glideException;
        this.nJ.t(this);
        return false;
    }

    public synchronized boolean a(R r, Object obj, n<R> nVar, DataSource dataSource, boolean z) {
        this.nL = true;
        this.resource = r;
        this.nJ.t(this);
        return false;
    }

    public void b(@NonNull m mVar) {
    }

    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0018, code lost:
        return true;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized boolean cancel(boolean z) {
        if (isDone()) {
            return false;
        }
        this.ea = true;
        this.nJ.t(this);
        if (z) {
            dq();
        }
    }

    public void d(@Nullable Drawable drawable) {
    }

    @Nullable
    public c dp() {
        return this.nK;
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
        return this.ea;
    }

    public synchronized boolean isDone() {
        boolean z;
        z = this.ea || this.nL || this.nM;
        return z;
    }

    public void j(@Nullable c cVar) {
        this.nK = cVar;
    }

    public void onDestroy() {
    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void run() {
        if (this.nK != null) {
            this.nK.clear();
            this.nK = null;
        }
    }
}
