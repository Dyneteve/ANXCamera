package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.h;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ResourceEncoderRegistry */
public class f {
    private final List<a<?>> oy = new ArrayList();

    /* compiled from: ResourceEncoderRegistry */
    private static final class a<T> {
        private final Class<T> fT;
        final h<T> gA;

        a(@NonNull Class<T> cls, @NonNull h<T> hVar) {
            this.fT = cls;
            this.gA = hVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean m(@NonNull Class<?> cls) {
            return this.fT.isAssignableFrom(cls);
        }
    }

    public synchronized <Z> void d(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.oy.add(new a(cls, hVar));
    }

    public synchronized <Z> void e(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.oy.add(0, new a(cls, hVar));
    }

    @Nullable
    public synchronized <Z> h<Z> o(@NonNull Class<Z> cls) {
        int size = this.oy.size();
        for (int i = 0; i < size; i++) {
            a aVar = (a) this.oy.get(i);
            if (aVar.m(cls)) {
                return aVar.gA;
            }
        }
        return null;
    }
}
