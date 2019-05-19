package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.h;
import java.util.ArrayList;
import java.util.List;

/* compiled from: ResourceEncoderRegistry */
public class f {
    private final List<a<?>> nw = new ArrayList();

    /* compiled from: ResourceEncoderRegistry */
    private static final class a<T> {
        private final Class<T> eR;
        final h<T> fy;

        a(@NonNull Class<T> cls, @NonNull h<T> hVar) {
            this.eR = cls;
            this.fy = hVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean l(@NonNull Class<?> cls) {
            return this.eR.isAssignableFrom(cls);
        }
    }

    public synchronized <Z> void d(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.nw.add(new a(cls, hVar));
    }

    public synchronized <Z> void e(@NonNull Class<Z> cls, @NonNull h<Z> hVar) {
        this.nw.add(0, new a(cls, hVar));
    }

    @Nullable
    public synchronized <Z> h<Z> n(@NonNull Class<Z> cls) {
        int size = this.nw.size();
        for (int i = 0; i < size; i++) {
            a aVar = (a) this.nw.get(i);
            if (aVar.l(cls)) {
                return aVar.fy;
            }
        }
        return null;
    }
}
