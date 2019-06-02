package com.bumptech.glide.load.resource.d;

import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.List;

/* compiled from: TranscoderRegistry */
public class f {
    private final List<a<?, ?>> mO = new ArrayList();

    /* compiled from: TranscoderRegistry */
    private static final class a<Z, R> {
        final e<Z, R> fR;
        private final Class<Z> mP;
        private final Class<R> mQ;

        a(@NonNull Class<Z> cls, @NonNull Class<R> cls2, @NonNull e<Z, R> eVar) {
            this.mP = cls;
            this.mQ = cls2;
            this.fR = eVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return this.mP.isAssignableFrom(cls) && cls2.isAssignableFrom(this.mQ);
        }
    }

    public synchronized <Z, R> void b(@NonNull Class<Z> cls, @NonNull Class<R> cls2, @NonNull e<Z, R> eVar) {
        this.mO.add(new a(cls, cls2, eVar));
    }

    @NonNull
    public synchronized <Z, R> e<Z, R> e(@NonNull Class<Z> cls, @NonNull Class<R> cls2) {
        if (cls2.isAssignableFrom(cls)) {
            return g.cV();
        }
        for (a aVar : this.mO) {
            if (aVar.d(cls, cls2)) {
                return aVar.fR;
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
        for (a d : this.mO) {
            if (d.d(cls, cls2)) {
                arrayList.add(cls2);
            }
        }
        return arrayList;
    }
}
