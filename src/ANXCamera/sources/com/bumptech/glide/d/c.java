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
    private static final n<?, ?, ?> oz;
    private final ArrayMap<h, n<?, ?, ?>> oA = new ArrayMap<>();
    private final AtomicReference<h> oB = new AtomicReference<>();

    static {
        f fVar = new f(Object.class, Object.class, Object.class, Collections.emptyList(), new g(), null);
        n nVar = new n(Object.class, Object.class, Object.class, Collections.singletonList(fVar), null);
        oz = nVar;
    }

    private h e(Class<?> cls, Class<?> cls2, Class<?> cls3) {
        h hVar = (h) this.oB.getAndSet(null);
        if (hVar == null) {
            hVar = new h();
        }
        hVar.f(cls, cls2, cls3);
        return hVar;
    }

    public void a(Class<?> cls, Class<?> cls2, Class<?> cls3, @Nullable n<?, ?, ?> nVar) {
        synchronized (this.oA) {
            ArrayMap<h, n<?, ?, ?>> arrayMap = this.oA;
            h hVar = new h(cls, cls2, cls3);
            if (nVar == null) {
                nVar = oz;
            }
            arrayMap.put(hVar, nVar);
        }
    }

    public boolean a(@Nullable n<?, ?, ?> nVar) {
        return oz.equals(nVar);
    }

    @Nullable
    public <Data, TResource, Transcode> n<Data, TResource, Transcode> d(Class<Data> cls, Class<TResource> cls2, Class<Transcode> cls3) {
        n<Data, TResource, Transcode> nVar;
        h e = e(cls, cls2, cls3);
        synchronized (this.oA) {
            nVar = (n) this.oA.get(e);
        }
        this.oB.set(e);
        return nVar;
    }
}
