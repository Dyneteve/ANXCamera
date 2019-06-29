package com.bumptech.glide.load.engine.a;

import android.annotation.SuppressLint;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.a.j.a;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.util.f;

/* compiled from: LruResourceCache */
public class i extends f<c, p<?>> implements j {
    private a jo;

    public i(long j) {
        super(j);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void c(@NonNull c cVar, @Nullable p<?> pVar) {
        if (this.jo != null && pVar != null) {
            this.jo.e(pVar);
        }
    }

    public void a(@NonNull a aVar) {
        this.jo = aVar;
    }

    @Nullable
    public /* synthetic */ p b(@NonNull c cVar, @Nullable p pVar) {
        return (p) super.put(cVar, pVar);
    }

    @Nullable
    public /* synthetic */ p g(@NonNull c cVar) {
        return (p) super.remove(cVar);
    }

    /* access modifiers changed from: protected */
    /* renamed from: i */
    public int s(@Nullable p<?> pVar) {
        return pVar == null ? super.s(null) : pVar.getSize();
    }

    @SuppressLint({"InlinedApi"})
    public void trimMemory(int i) {
        if (i >= 40) {
            O();
        } else if (i >= 20 || i == 15) {
            b(getMaxSize() / 2);
        }
    }
}
