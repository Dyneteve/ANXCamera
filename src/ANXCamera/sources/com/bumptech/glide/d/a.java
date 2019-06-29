package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

/* compiled from: EncoderRegistry */
public class a {
    private final List<C0003a<?>> oy = new ArrayList();

    /* renamed from: com.bumptech.glide.d.a$a reason: collision with other inner class name */
    /* compiled from: EncoderRegistry */
    private static final class C0003a<T> {
        private final Class<T> dataClass;
        final com.bumptech.glide.load.a<T> fQ;

        C0003a(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
            this.dataClass = cls;
            this.fQ = aVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean m(@NonNull Class<?> cls) {
            return this.dataClass.isAssignableFrom(cls);
        }
    }

    public synchronized <T> void d(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.oy.add(new C0003a(cls, aVar));
    }

    public synchronized <T> void e(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.oy.add(0, new C0003a(cls, aVar));
    }

    @Nullable
    public synchronized <T> com.bumptech.glide.load.a<T> n(@NonNull Class<T> cls) {
        for (C0003a aVar : this.oy) {
            if (aVar.m(cls)) {
                return aVar.fQ;
            }
        }
        return null;
    }
}
