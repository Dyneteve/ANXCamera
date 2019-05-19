package com.bumptech.glide.request.a;

import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.request.a.j.a;

/* compiled from: ViewPropertyAnimationFactory */
public class i<R> implements g<R> {
    private final a pH;
    private j<R> pI;

    public i(a aVar) {
        this.pH = aVar;
    }

    public f<R> a(DataSource dataSource, boolean z) {
        if (dataSource == DataSource.MEMORY_CACHE || !z) {
            return e.eG();
        }
        if (this.pI == null) {
            this.pI = new j<>(this.pH);
        }
        return this.pI;
    }
}
