package android.arch.core.a;

import android.os.Handler;
import android.os.Looper;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: DefaultTaskExecutor */
public class b extends c {
    private ExecutorService ab = Executors.newFixedThreadPool(2);
    private final Object mLock = new Object();
    @Nullable
    private volatile Handler mMainHandler;

    public void a(Runnable runnable) {
        this.ab.execute(runnable);
    }

    public void b(Runnable runnable) {
        if (this.mMainHandler == null) {
            synchronized (this.mLock) {
                if (this.mMainHandler == null) {
                    this.mMainHandler = new Handler(Looper.getMainLooper());
                }
            }
        }
        this.mMainHandler.post(runnable);
    }

    public boolean isMainThread() {
        return Looper.getMainLooper().getThread() == Thread.currentThread();
    }
}
