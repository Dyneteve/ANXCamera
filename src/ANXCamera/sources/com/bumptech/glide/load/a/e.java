package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import java.io.IOException;

/* compiled from: DataRewinder */
public interface e<T> {

    /* compiled from: DataRewinder */
    public interface a<T> {
        @NonNull
        Class<T> aj();

        @NonNull
        e<T> l(@NonNull T t);
    }

    @NonNull
    T am() throws IOException;

    void cleanup();
}
