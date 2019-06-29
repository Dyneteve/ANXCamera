package android.arch.core.a;

import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: TaskExecutor */
public abstract class c {
    public abstract void a(@NonNull Runnable runnable);

    public abstract void b(@NonNull Runnable runnable);

    public void c(@NonNull Runnable runnable) {
        if (isMainThread()) {
            runnable.run();
        } else {
            b(runnable);
        }
    }

    public abstract boolean isMainThread();
}
