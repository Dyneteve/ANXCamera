package com.bumptech.glide.d;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

/* compiled from: EncoderRegistry */
public class a {
    private final List<C0002a<?>> nw = new ArrayList();

    /* compiled from: EncoderRegistry */
    /* renamed from: com.bumptech.glide.d.a$a reason: collision with other inner class name */
    private static final class C0002a<T> {
        private final Class<T> dataClass;
        final com.bumptech.glide.load.a<T> eO;

        C0002a(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
            this.dataClass = cls;
            this.eO = aVar;
        }

        /* access modifiers changed from: 0000 */
        public boolean l(@NonNull Class<?> cls) {
            return this.dataClass.isAssignableFrom(cls);
        }
    }

    public synchronized <T> void d(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.nw.add(new C0002a(cls, aVar));
    }

    public synchronized <T> void e(@NonNull Class<T> cls, @NonNull com.bumptech.glide.load.a<T> aVar) {
        this.nw.add(0, new C0002a(cls, aVar));
    }

    @Nullable
    public synchronized <T> com.bumptech.glide.load.a<T> m(@NonNull Class<T> cls) {
        for (C0002a aVar : this.nw) {
            if (aVar.l(cls)) {
                return aVar.eO;
            }
        }
        return null;
    }
}
