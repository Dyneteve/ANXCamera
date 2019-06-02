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
    private final Set<n<?>> nw = Collections.newSetFromMap(new WeakHashMap());

    public void clear() {
        this.nw.clear();
    }

    public void g(@NonNull n<?> nVar) {
        this.nw.add(nVar);
    }

    @NonNull
    public List<n<?>> getAll() {
        return k.c(this.nw);
    }

    public void h(@NonNull n<?> nVar) {
        this.nw.remove(nVar);
    }

    public void onDestroy() {
        for (n onDestroy : k.c(this.nw)) {
            onDestroy.onDestroy();
        }
    }

    public void onStart() {
        for (n onStart : k.c(this.nw)) {
            onStart.onStart();
        }
    }

    public void onStop() {
        for (n onStop : k.c(this.nw)) {
            onStop.onStop();
        }
    }
}
