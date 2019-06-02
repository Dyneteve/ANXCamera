package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.Collections;
import java.util.List;

/* compiled from: ModelLoader */
public interface m<Model, Data> {

    /* compiled from: ModelLoader */
    public static class a<Data> {
        public final c eK;
        public final List<c> jY;
        public final d<Data> jZ;

        public a(@NonNull c cVar, @NonNull d<Data> dVar) {
            this(cVar, Collections.emptyList(), dVar);
        }

        public a(@NonNull c cVar, @NonNull List<c> list, @NonNull d<Data> dVar) {
            this.eK = (c) i.checkNotNull(cVar);
            this.jY = (List) i.checkNotNull(list);
            this.jZ = (d) i.checkNotNull(dVar);
        }
    }

    @Nullable
    a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar);

    boolean q(@NonNull Model model);
}
