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
    private static final String iI = "source";
    private static final String iJ = "disk-cache";
    private static final int iK = 1;
    private static final String iL = "source-unlimited";
    private static final String iM = "animation";
    private static final long iN = TimeUnit.SECONDS.toMillis(10);
    private static final int iO = 4;
    private static volatile int iP;
    private final ExecutorService iQ;

    /* compiled from: GlideExecutor */
    /* renamed from: com.bumptech.glide.load.engine.b.a$a reason: collision with other inner class name */
    private static final class C0006a implements ThreadFactory {
        private static final int iR = 9;
        final b iS;
        final boolean iT;
        private int iU;
        private final String name;

        C0006a(String str, b bVar, boolean z) {
            this.name = str;
            this.iS = bVar;
            this.iT = z;
        }

        public synchronized Thread newThread(@NonNull Runnable runnable) {
            AnonymousClass1 r0;
            StringBuilder sb = new StringBuilder();
            sb.append("glide-");
            sb.append(this.name);
            sb.append("-thread-");
            sb.append(this.iU);
            r0 = new Thread(runnable, sb.toString()) {
                public void run() {
                    Process.setThreadPriority(9);
                    if (C0006a.this.iT) {
                        StrictMode.setThreadPolicy(new Builder().detectNetwork().penaltyDeath().build());
                    }
                    try {
                        super.run();
                    } catch (Throwable th) {
                        C0006a.this.iS.a(th);
                    }
                }
            };
            this.iU++;
            return r0;
        }
    }

    /* compiled from: GlideExecutor */
    public interface b {
        public static final b iW = new b() {
            public void a(Throwable th) {
            }
        };
        public static final b iX = new b() {
            public void a(Throwable th) {
                if (th != null && Log.isLoggable(a.TAG, 6)) {
                    Log.e(a.TAG, "Request threw uncaught throwable", th);
                }
            }
        };
        public static final b iY = new b() {
            public void a(Throwable th) {
                if (th != null) {
                    throw new RuntimeException("Request threw uncaught throwable", th);
                }
            }
        };
        public static final b iZ = iX;

        void a(Throwable th);
    }

    @VisibleForTesting
    a(ExecutorService executorService) {
        this.iQ = executorService;
    }

    public static a a(int i, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, i, iN, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0006a(iM, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0006a(str, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(b bVar) {
        return a(1, iJ, bVar);
    }

    public static a b(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0006a(str, bVar, false));
        return new a(threadPoolExecutor);
    }

    public static a b(b bVar) {
        return b(bR(), iI, bVar);
    }

    public static a bN() {
        return a(1, iJ, b.iZ);
    }

    public static a bO() {
        return b(bR(), iI, b.iZ);
    }

    public static a bP() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, iN, TimeUnit.MILLISECONDS, new SynchronousQueue(), new C0006a(iL, b.iZ, false));
        return new a(threadPoolExecutor);
    }

    public static a bQ() {
        return a(bR() >= 4 ? 2 : 1, b.iZ);
    }

    public static int bR() {
        if (iP == 0) {
            iP = Math.min(4, b.availableProcessors());
        }
        return iP;
    }

    public boolean awaitTermination(long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.iQ.awaitTermination(j, timeUnit);
    }

    public void execute(@NonNull Runnable runnable) {
        this.iQ.execute(runnable);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException {
        return this.iQ.invokeAll(collection);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.iQ.invokeAll(collection, j, timeUnit);
    }

    @NonNull
    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException, ExecutionException {
        return this.iQ.invokeAny(collection);
    }

    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.iQ.invokeAny(collection, j, timeUnit);
    }

    public boolean isShutdown() {
        return this.iQ.isShutdown();
    }

    public boolean isTerminated() {
        return this.iQ.isTerminated();
    }

    public void shutdown() {
        this.iQ.shutdown();
    }

    @NonNull
    public List<Runnable> shutdownNow() {
        return this.iQ.shutdownNow();
    }

    @NonNull
    public Future<?> submit(@NonNull Runnable runnable) {
        return this.iQ.submit(runnable);
    }

    @NonNull
    public <T> Future<T> submit(@NonNull Runnable runnable, T t) {
        return this.iQ.submit(runnable, t);
    }

    public <T> Future<T> submit(@NonNull Callable<T> callable) {
        return this.iQ.submit(callable);
    }

    public String toString() {
        return this.iQ.toString();
    }
}
