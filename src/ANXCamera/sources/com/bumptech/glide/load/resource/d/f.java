package com.bumptech.glide.load.resource.d;

import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.List;

/* compiled from: TranscoderRegistry */
public class f {
    private final List<a<?, ?>> nP = new ArrayList();

    /* compiled from: TranscoderRegistry */
    private static final class a<Z, R> {
        final e<Z, R> gR;
        private final Class<Z> nQ;
        private final Class<R> nR;

        a(@NonNull Class<Z> cls, @NonNull Class<R> cls2, @NonNull e<Z, R> eVar) {
            this.nQ = cls;
            this.nR = cls2;
            this.gR = eVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return this.nQ.isAssignableFrom(cls) && cls2.isAssignableFrom(this.nR);
        }
    }

    public synchronized <Z, R> void b(@NonNull Class<Z> cls, @NonNull Class<R> cls2, @NonNull e<Z, R> eVar) {
        this.nP.add(new a(cls, cls2, eVar));
    }

    @NonNull
    public synchronized <Z, R> e<Z, R> e(@NonNull Class<Z> cls, @NonNull Class<R> cls2) {
        if (cls2.isAssignableFrom(cls)) {
            return g.dx();
        }
        for (a aVar : this.nP) {
            if (aVar.d(cls, cls2)) {
                return aVar.gR;
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("No transcoder registered to transcode from ");
        sb.append(cls);
        sb.append(" to ");
        sb.append(cls2);
        throw new IllegalArgumentException(sb.toString());
    }

    @NonNull
    public synchronized <Z, R> List<Class<R>> f(@NonNull Class<Z> cls, @NonNull Class<R> cls2) {
        ArrayList arrayList = new ArrayList();
        if (cls2.isAssignableFrom(cls)) {
            arrayList.add(cls2);
            return arrayList;
        }
        for (a d : this.nP) {
            if (d.d(cls, cls2)) {
                arrayList.add(cls2);
            }
        }
        return arrayList;
    }
}
