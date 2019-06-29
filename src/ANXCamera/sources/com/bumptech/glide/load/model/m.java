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
        public final c fK;
        public final List<c> kY;
        public final d<Data> kZ;

        public a(@NonNull c cVar, @NonNull d<Data> dVar) {
            this(cVar, Collections.emptyList(), dVar);
        }

        public a(@NonNull c cVar, @NonNull List<c> list, @NonNull d<Data> dVar) {
            this.fK = (c) i.checkNotNull(cVar);
            this.kY = (List) i.checkNotNull(list);
            this.kZ = (d) i.checkNotNull(dVar);
        }
    }

    @Nullable
    a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar);

    boolean t(@NonNull Model model);
}
