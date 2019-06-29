package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import java.io.IOException;

/* compiled from: DataRewinder */
public interface e<T> {

    /* compiled from: DataRewinder */
    public interface a<T> {
        @NonNull
        Class<T> aJ();

        @NonNull
        e<T> o(@NonNull T t);
    }

    @NonNull
    T aM() throws IOException;

    void cleanup();
}
