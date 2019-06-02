package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.h;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ResourceEncoderRegistry */
public class f {
    private final List<a<?>> ny = new ArrayList();

    /* compiled from: ResourceEncoderRegistry */
    private static final class a<T> {
        private final Class<T> eT;
        final h<T> fA;

        a(@NonNull Class<T> cls, @NonNull h<T> hVar) {
            this.eT = cls;
            this.fA = hVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean l(@NonNull Class<?> cls) {
            return this.eT.isAssignableFrom(cls);
        }
    }

    public synchronized <Z> void d(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.ny.add(new a(cls, hVar));
    }

    public synchronized <Z> void e(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.ny.add(0, new a(cls, hVar));
    }

    @Nullable
    public synchronized <Z> h<Z> n(@NonNull Class<Z> cls) {
        int size = this.ny.size();
        for (int i = 0; i < size; i++) {
            a aVar = (a) this.ny.get(i);
            if (aVar.l(cls)) {
                return aVar.fA;
            }
        }
        return null;
    }
}
