package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.h;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ResourceEncoderRegistry */
public class f {
    private final List<a<?>> nx = new ArrayList();

    /* compiled from: ResourceEncoderRegistry */
    private static final class a<T> {
        private final Class<T> eS;
        final h<T> fz;

        a(@NonNull Class<T> cls, @NonNull h<T> hVar) {
            this.eS = cls;
            this.fz = hVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean l(@NonNull Class<?> cls) {
            return this.eS.isAssignableFrom(cls);
        }
    }

    public synchronized <Z> void d(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.nx.add(new a(cls, hVar));
    }

    public synchronized <Z> void e(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.nx.add(0, new a(cls, hVar));
    }

    @Nullable
    public synchronized <Z> h<Z> n(@NonNull Class<Z> cls) {
        int size = this.nx.size();
        for (int i = 0; i < size; i++) {
            a aVar = (a) this.nx.get(i);
            if (aVar.l(cls)) {
                return aVar.fz;
            }
        }
        return null;
    }
}
