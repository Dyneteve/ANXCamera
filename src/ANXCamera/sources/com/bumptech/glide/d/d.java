package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.h;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: ModelToResourceClassCache */
public class d {
    private final AtomicReference<h> nB = new AtomicReference<>();
    private final ArrayMap<h, List<Class<?>>> nC = new ArrayMap<>();

    public void a(@NonNull Class<?> cls, @NonNull Class<?> cls2, @NonNull List<Class<?>> list) {
        synchronized (this.nC) {
            this.nC.put(new h(cls, cls2), list);
        }
    }

    public void clear() {
        synchronized (this.nC) {
            this.nC.clear();
        }
    }

    @Nullable
    public List<Class<?>> g(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        List<Class<?>> list;
        h hVar = (h) this.nB.getAndSet(null);
        if (hVar == null) {
            hVar = new h(cls, cls2);
        } else {
            hVar.j(cls, cls2);
        }
        synchronized (this.nC) {
            list = (List) this.nC.get(hVar);
        }
        this.nB.set(hVar);
        return list;
    }
}
