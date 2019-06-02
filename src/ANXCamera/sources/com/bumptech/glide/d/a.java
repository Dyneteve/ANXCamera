package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

/* compiled from: EncoderRegistry */
public class a {
    private final List<C0004a<?>> ny = new ArrayList();

    /* compiled from: EncoderRegistry */
    /* renamed from: com.bumptech.glide.d.a$a reason: collision with other inner class name */
    private static final class C0004a<T> {
        private final Class<T> dataClass;
        final com.bumptech.glide.load.a<T> eQ;

        C0004a(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
            this.dataClass = cls;
            this.eQ = aVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean l(@NonNull Class<?> cls) {
            return this.dataClass.isAssignableFrom(cls);
        }
    }

    public synchronized <T> void d(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.ny.add(new C0004a(cls, aVar));
    }

    public synchronized <T> void e(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.ny.add(0, new C0004a(cls, aVar));
    }

    @Nullable
    public synchronized <T> com.bumptech.glide.load.a<T> m(@NonNull Class<T> cls) {
        for (C0004a aVar : this.ny) {
            if (aVar.l(cls)) {
                return aVar.eQ;
            }
        }
        return null;
    }
}
