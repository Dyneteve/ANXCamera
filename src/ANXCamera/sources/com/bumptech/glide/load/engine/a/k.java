package com.bumptech.glide.load.engine.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j.a;
import com.bumptech.glide.load.engine.p;

/* compiled from: MemoryCacheAdapter */
public class k implements j {
    private a jo;

    public void O() {
    }

    public void a(@NonNull a aVar) {
        this.jo = aVar;
    }

    @Nullable
    public p<?> b(@NonNull c cVar, @Nullable p<?> pVar) {
        if (pVar != null) {
            this.jo.e(pVar);
        }
        return null;
    }

    public void b(float f) {
    }

    public long cg() {
        return 0;
    }

    @Nullable
    public p<?> g(@NonNull c cVar) {
        return null;
    }

    public long getMaxSize() {
        return 0;
    }

    public void trimMemory(int i) {
    }
}
