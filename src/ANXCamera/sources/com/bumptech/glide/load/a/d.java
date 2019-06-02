package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;

/* compiled from: DataFetcher */
public interface d<T> {

    /* compiled from: DataFetcher */
    public interface a<T> {
        void b(@NonNull Exception exc);

        void k(@Nullable T t);
    }

    void a(@NonNull Priority priority, @NonNull a<? super T> aVar);

    @NonNull
    Class<T> aj();

    @NonNull
    DataSource ak();

    void cancel();

    void cleanup();
}
