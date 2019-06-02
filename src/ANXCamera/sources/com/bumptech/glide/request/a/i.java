package com.bumptech.glide.request.a;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.a.j.a;

/* compiled from: ViewPropertyAnimationFactory */
public class i<R> implements g<R> {
    private final a pJ;
    private j<R> pK;

    public i(a aVar) {
        this.pJ = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.pK == null) {
            this.pK = new j<>(this.pJ);
        }
        return this.pK;
    }
}
