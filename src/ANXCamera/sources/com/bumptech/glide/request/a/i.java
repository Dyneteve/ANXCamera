package com.bumptech.glide.request.a;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.a.j.a;

/* compiled from: ViewPropertyAnimationFactory */
public class i<R> implements g<R> {
    private final a qJ;
    private j<R> qK;

    public i(a aVar) {
        this.qJ = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.fi();
        }
        if (this.qK == null) {
            this.qK = new j<>(this.qJ);
        }
        return this.qK;
    }
}
