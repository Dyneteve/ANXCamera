package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.h;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: ModelToResourceClassCache */
public class d {
    private final AtomicReference<h> oC = new AtomicReference<>();
    private final ArrayMap<h, List<Class<?>>> oD = new ArrayMap<>();

    public void a(@NonNull Class<?> cls, @NonNull Class<?> cls2, @NonNull List<Class<?>> list) {
        synchronized (this.oD) {
            this.oD.put(new h(cls, cls2), list);
        }
    }

    public void clear() {
        synchronized (this.oD) {
            this.oD.clear();
        }
    }

    @Nullable
    public List<Class<?>> g(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
        List<Class<?>> list;
        h hVar = (h) this.oC.getAndSet(null);
        if (hVar == null) {
            hVar = new h(cls, cls2);
        } else {
            hVar.j(cls, cls2);
        }
        synchronized (this.oD) {
            list = (List) this.oD.get(hVar);
        }
        this.oC.set(hVar);
        return list;
    }
}
