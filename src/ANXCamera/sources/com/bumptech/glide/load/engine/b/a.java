package com.bumptech.glide.load.engine.b;

import android.os.Process;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import android.support.annotation.NonNull;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import java.util.Collection;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* compiled from: GlideExecutor */
public final class a implements ExecutorService {
    private static final String TAG = "GlideExecutor";
    private static final String iG = "source";
    private static final String iH = "disk-cache";
    private static final int iI = 1;
    private static final String iJ = "source-unlimited";
    private static final String iK = "animation";
    private static final long iL = TimeUnit.SECONDS.toMillis(10);
    private static final int iM = 4;
    private static volatile int iN;
    private final ExecutorService iO;

    /* compiled from: GlideExecutor */
    /* renamed from: com.bumptech.glide.load.engine.b.a$a reason: collision with other inner class name */
    private static final class C0004a implements ThreadFactory {
        private static final int iP = 9;
        final b iQ;
        final boolean iR;
        private int iS;
        private final String name;

        C0004a(String str, b bVar, boolean z) {
            this.name = str;
            this.iQ = bVar;
            this.iR = z;
        }

        public synchronized Thread newThread(@NonNull Runnable runnable) {
            AnonymousClass1 r0;
            StringBuilder sb = new StringBuilder();
            sb.append("glide-");
            sb.append(this.name);
            sb.append("-thread-");
            sb.append(this.iS);
            r0 = new Thread(runnable, sb.toString()) {
                public void run() {
                    Process.setThreadPriority(9);
                    if (C0004a.this.iR) {
                        StrictMode.setThreadPolicy(new Builder().detectNetwork().penaltyDeath().build());
                    }
                    try {
                        super.run();
                    } catch (Throwable th) {
                        C0004a.this.iQ.a(th);
                    }
                }
            };
            this.iS++;
            return r0;
        }
    }

    /* compiled from: GlideExecutor */
    public interface b {
        public static final b iU = new b() {
            public void a(Throwable th) {
            }
        };
        public static final b iV = new b() {
            public void a(Throwable th) {
                if (th != null && Log.isLoggable(a.TAG, 6)) {
                    Log.e(a.TAG, "Request threw uncaught throwable", th);
                }
            }
        };
        public static final b iW = new b() {
            public void a(Throwable th) {
                if (th != null) {
                    throw new RuntimeException("Request threw uncaught throwable", th);
                }
            }
        };
        public static final b iX = iV;

        void a(Throwable th);
    }

    @VisibleForTesting
    a(ExecutorService executorService) {
        this.iO = executorService;
    }

    public static a a(int i, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, i, iL, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0004a(iK, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0004a(str, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(b bVar) {
        return a(1, iH, bVar);
    }

    public static a b(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0004a(str, bVar, false));
        return new a(threadPoolExecutor);
    }

    public static a b(b bVar) {
        return b(bR(), iG, bVar);
    }

    public static a bN() {
        return a(1, iH, b.iX);
    }

    public static a bO() {
        return b(bR(), iG, b.iX);
    }

    public static a bP() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, iL, TimeUnit.MILLISECONDS, new SynchronousQueue(), new C0004a(iJ, b.iX, false));
        return new a(threadPoolExecutor);
    }

    public static a bQ() {
        return a(bR() >= 4 ? 2 : 1, b.iX);
    }

    public static int bR() {
        if (iN == 0) {
            iN = Math.min(4, b.availableProcessors());
        }
        return iN;
    }

    public boolean awaitTermination(long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.iO.awaitTermination(j, timeUnit);
    }

    public void execute(@NonNull Runnable runnable) {
        this.iO.execute(runnable);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException {
        return this.iO.invokeAll(collection);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.iO.invokeAll(collection, j, timeUnit);
    }

    @NonNull
    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException, ExecutionException {
        return this.iO.invokeAny(collection);
    }

    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.iO.invokeAny(collection, j, timeUnit);
    }

    public boolean isShutdown() {
        return this.iO.isShutdown();
    }

    public boolean isTerminated() {
        return this.iO.isTerminated();
    }

    public void shutdown() {
        this.iO.shutdown();
    }

    @NonNull
    public List<Runnable> shutdownNow() {
        return this.iO.shutdownNow();
    }

    @NonNull
    public Future<?> submit(@NonNull Runnable runnable) {
        return this.iO.submit(runnable);
    }

    @NonNull
    public <T> Future<T> submit(@NonNull Runnable runnable, T t) {
        return this.iO.submit(runnable, t);
    }

    public <T> Future<T> submit(@NonNull Callable<T> callable) {
        return this.iO.submit(callable);
    }

    public String toString() {
        return this.iO.toString();
    }
}
