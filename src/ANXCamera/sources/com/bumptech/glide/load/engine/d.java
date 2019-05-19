package com.bumptech.glide.load.engine;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.c;

/* compiled from: DataFetcherGenerator */
interface d {

    /* compiled from: DataFetcherGenerator */
    public interface a {
        void a(c cVar, Exception exc, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource);

        void a(c cVar, @Nullable Object obj, com.bumptech.glide.load.a.d<?> dVar, DataSource dataSource, c cVar2);

        void av();
    }

    boolean as();

    void cancel();
}
