package com.bumptech.glide.d;

import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.load.engine.f;
import com.bumptech.glide.load.engine.n;
import com.bumptech.glide.load.resource.d.g;
import com.bumptech.glide.util.h;
import java.util.Collections;
import java.util.concurrent.atomic.AtomicReference;

/* compiled from: LoadPathCache */
public class c {
    private static final n<?, ?, ?> nz;
    private final ArrayMap<h, n<?, ?, ?>> nA = new ArrayMap<>();
    private final AtomicReference<h> nB = new AtomicReference<>();

    static {
        f fVar = new f(Object.class, Object.class, Object.class, Collections.emptyList(), new g(), null);
        n nVar = new n(Object.class, Object.class, Object.class, Collections.singletonList(fVar), null);
        nz = nVar;
    }

    private h e(Class<?> cls, Class<?> cls2, Class<?> cls3) {
        h hVar = (h) this.nB.getAndSet(null);
        if (hVar == null) {
            hVar = new h();
        }
        hVar.f(cls, cls2, cls3);
        return hVar;
    }

    public void a(Class<?> cls, Class<?> cls2, Class<?> cls3, @Nullable n<?, ?, ?> nVar) {
        synchronized (this.nA) {
            ArrayMap<h, n<?, ?, ?>> arrayMap = this.nA;
            h hVar = new h(cls, cls2, cls3);
            if (nVar == null) {
                nVar = nz;
            }
            arrayMap.put(hVar, nVar);
        }
    }

    public boolean a(@Nullable n<?, ?, ?> nVar) {
        return nz.equals(nVar);
    }

    @Nullable
    public <Data, TResource, Transcode> n<Data, TResource, Transcode> d(Class<Data> cls, Class<TResource> cls2, Class<Transcode> cls3) {
        n<Data, TResource, Transcode> nVar;
        h e = e(cls, cls2, cls3);
        synchronized (this.nA) {
            nVar = (n) this.nA.get(e);
        }
        this.nB.set(e);
        return nVar;
    }
}
