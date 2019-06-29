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
    private static final String jI = "source";
    private static final String jJ = "disk-cache";
    private static final int jK = 1;
    private static final String jL = "source-unlimited";
    private static final String jM = "animation";
    private static final long jN = TimeUnit.SECONDS.toMillis(10);
    private static final int jO = 4;
    private static volatile int jP;
    private final ExecutorService jQ;

    /* renamed from: com.bumptech.glide.load.engine.b.a$a reason: collision with other inner class name */
    /* compiled from: GlideExecutor */
    private static final class C0005a implements ThreadFactory {
        private static final int jR = 9;
        final b jS;
        final boolean jT;
        private int jU;
        private final String name;

        C0005a(String str, b bVar, boolean z) {
            this.name = str;
            this.jS = bVar;
            this.jT = z;
        }

        public synchronized Thread newThread(@NonNull Runnable runnable) {
            AnonymousClass1 r0;
            StringBuilder sb = new StringBuilder();
            sb.append("glide-");
            sb.append(this.name);
            sb.append("-thread-");
            sb.append(this.jU);
            r0 = new Thread(runnable, sb.toString()) {
                public void run() {
                    Process.setThreadPriority(9);
                    if (C0005a.this.jT) {
                        StrictMode.setThreadPolicy(new Builder().detectNetwork().penaltyDeath().build());
                    }
                    try {
                        super.run();
                    } catch (Throwable th) {
                        C0005a.this.jS.a(th);
                    }
                }
            };
            this.jU++;
            return r0;
        }
    }

    /* compiled from: GlideExecutor */
    public interface b {
        public static final b jW = new b() {
            public void a(Throwable th) {
            }
        };
        public static final b jX = new b() {
            public void a(Throwable th) {
                if (th != null && Log.isLoggable(a.TAG, 6)) {
                    Log.e(a.TAG, "Request threw uncaught throwable", th);
                }
            }
        };
        public static final b jY = new b() {
            public void a(Throwable th) {
                if (th != null) {
                    throw new RuntimeException("Request threw uncaught throwable", th);
                }
            }
        };
        public static final b jZ = jX;

        void a(Throwable th);
    }

    @VisibleForTesting
    a(ExecutorService executorService) {
        this.jQ = executorService;
    }

    public static a a(int i, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, i, jN, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0005a(jM, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0005a(str, bVar, true));
        return new a(threadPoolExecutor);
    }

    public static a a(b bVar) {
        return a(1, jJ, bVar);
    }

    public static a b(int i, String str, b bVar) {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(i, i, 0, TimeUnit.MILLISECONDS, new PriorityBlockingQueue(), new C0005a(str, bVar, false));
        return new a(threadPoolExecutor);
    }

    public static a b(b bVar) {
        return b(cu(), jI, bVar);
    }

    public static a cp() {
        return a(1, jJ, b.jZ);
    }

    public static a cq() {
        return b(cu(), jI, b.jZ);
    }

    public static a cs() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(0, Integer.MAX_VALUE, jN, TimeUnit.MILLISECONDS, new SynchronousQueue(), new C0005a(jL, b.jZ, false));
        return new a(threadPoolExecutor);
    }

    public static a ct() {
        return a(cu() >= 4 ? 2 : 1, b.jZ);
    }

    public static int cu() {
        if (jP == 0) {
            jP = Math.min(4, b.availableProcessors());
        }
        return jP;
    }

    public boolean awaitTermination(long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.jQ.awaitTermination(j, timeUnit);
    }

    public void execute(@NonNull Runnable runnable) {
        this.jQ.execute(runnable);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException {
        return this.jQ.invokeAll(collection);
    }

    @NonNull
    public <T> List<Future<T>> invokeAll(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException {
        return this.jQ.invokeAll(collection, j, timeUnit);
    }

    @NonNull
    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection) throws InterruptedException, ExecutionException {
        return this.jQ.invokeAny(collection);
    }

    public <T> T invokeAny(@NonNull Collection<? extends Callable<T>> collection, long j, @NonNull TimeUnit timeUnit) throws InterruptedException, ExecutionException, TimeoutException {
        return this.jQ.invokeAny(collection, j, timeUnit);
    }

    public boolean isShutdown() {
        return this.jQ.isShutdown();
    }

    public boolean isTerminated() {
        return this.jQ.isTerminated();
    }

    public void shutdown() {
        this.jQ.shutdown();
    }

    @NonNull
    public List<Runnable> shutdownNow() {
        return this.jQ.shutdownNow();
    }

    @NonNull
    public Future<?> submit(@NonNull Runnable runnable) {
        return this.jQ.submit(runnable);
    }

    @NonNull
    public <T> Future<T> submit(@NonNull Runnable runnable, T t) {
        return this.jQ.submit(runnable, t);
    }

    public <T> Future<T> submit(@NonNull Callable<T> callable) {
        return this.jQ.submit(callable);
    }

    public String toString() {
        return this.jQ.toString();
    }
}
