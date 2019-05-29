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
    private final Set<n<?>> nv = Collections.newSetFromMap(new WeakHashMap());

    public void clear() {
        this.nv.clear();
    }

    public void g(@NonNull n<?> nVar) {
        this.nv.add(nVar);
    }

    @NonNull
    public List<n<?>> getAll() {
        return k.c(this.nv);
    }

    public void h(@NonNull n<?> nVar) {
        this.nv.remove(nVar);
    }

    public void onDestroy() {
        for (n onDestroy : k.c(this.nv)) {
            onDestroy.onDestroy();
        }
    }

    public void onStart() {
        for (n onStart : k.c(this.nv)) {
            onStart.onStart();
        }
    }

    public void onStop() {
        for (n onStop : k.c(this.nv)) {
            onStop.onStop();
        }
    }
}
