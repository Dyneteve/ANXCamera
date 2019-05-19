package com.bumptech.glide.manager;

import android.support.annotation.NonNull;
import com.bumptech.glide.request.target.n;
import com.bumptech.glide.util.k;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

/* compiled from: TargetTracker */
public final class o implements i {
    private final Set<n<?>> nu = Collections.newSetFromMap(new WeakHashMap());

    public void clear() {
        this.nu.clear();
    }

    public void g(@NonNull n<?> nVar) {
        this.nu.add(nVar);
    }

    @NonNull
    public List<n<?>> getAll() {
        return k.c(this.nu);
    }

    public void h(@NonNull n<?> nVar) {
        this.nu.remove(nVar);
    }

    public void onDestroy() {
        for (n onDestroy : k.c(this.nu)) {
            onDestroy.onDestroy();
        }
    }

    public void onStart() {
        for (n onStart : k.c(this.nu)) {
            onStart.onStart();
        }
    }

    public void onStop() {
        for (n onStop : k.c(this.nu)) {
            onStop.onStop();
        }
    }
}
