package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j.a;
import com.bumptech.glide.load.engine.p;

/* compiled from: MemoryCacheAdapter */
public class k implements j {

    /* renamed from: if reason: not valid java name */
    private a f2if;

    public void a(@NonNull a aVar) {
        this.f2if = aVar;
    }

    @Nullable
    public p<?> b(@NonNull c cVar, @Nullable p<?> pVar) {
        if (pVar != null) {
            this.f2if.e(pVar);
        }
        return null;
    }

    public void b(float f) {
    }

    public long bF() {
        return 0;
    }

    @Nullable
    public p<?> g(@NonNull c cVar) {
        return null;
    }

    public long getMaxSize() {
        return 0;
    }

    public void o() {
    }

    public void trimMemory(int i) {
    }
}
