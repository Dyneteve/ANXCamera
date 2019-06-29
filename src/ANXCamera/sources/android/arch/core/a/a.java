package android.arch.core.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.util.concurrent.Executor;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: ArchTaskExecutor */
public class a extends c {
    private static volatile a W;
    @NonNull
    private static final Executor aa = new Executor() {
        public void execute(Runnable runnable) {
            a.j().a(runnable);
        }
    };
    @NonNull
    private static final Executor sMainThreadExecutor = new Executor() {
        public void execute(Runnable runnable) {
            a.j().b(runnable);
        }
    };
    @NonNull
    private c X = this.Z;
    @NonNull
    private c Z = new b();

    private a() {
    }

    @NonNull
    public static Executor getMainThreadExecutor() {
        return sMainThreadExecutor;
    }

    @NonNull
    public static a j() {
        if (W != null) {
            return W;
        }
        synchronized (a.class) {
            if (W == null) {
                W = new a();
            }
        }
        return W;
    }

    @NonNull
    public static Executor k() {
        return aa;
    }

    public void a(@Nullable c cVar) {
        if (cVar == null) {
            cVar = this.Z;
        }
        this.X = cVar;
    }

    public void a(Runnable runnable) {
        this.X.a(runnable);
    }

    public void b(Runnable runnable) {
        this.X.b(runnable);
    }

    public boolean isMainThread() {
        return this.X.isMainThread();
    }
}
