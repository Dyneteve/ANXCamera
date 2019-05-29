package com.bumptech.glide.request.a;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.a.j.a;

/* compiled from: ViewPropertyAnimationFactory */
public class i<R> implements g<R> {
    private final a pI;
    private j<R> pJ;

    public i(a aVar) {
        this.pI = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.pJ == null) {
            this.pJ = new j<>(this.pI);
        }
        return this.pJ;
    }
}
