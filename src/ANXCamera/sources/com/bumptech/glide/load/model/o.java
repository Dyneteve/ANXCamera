package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: ModelLoaderRegistry */
public class o {
    private final q jY;
    private final a jZ;

    /* compiled from: ModelLoaderRegistry */
    private static class a {
        private final Map<Class<?>, C0007a<?>> ka = new HashMap();

        /* compiled from: ModelLoaderRegistry */
        /* renamed from: com.bumptech.glide.load.model.o$a$a reason: collision with other inner class name */
        private static class C0007a<Model> {
            final List<m<Model, ?>> kb;

            public C0007a(List<m<Model, ?>> list) {
                this.kb = list;
            }
        }

        a() {
        }

        public <Model> void a(Class<Model> cls, List<m<Model, ?>> list) {
            if (((C0007a) this.ka.put(cls, new C0007a(list))) != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Already cached loaders for model: ");
                sb.append(cls);
                throw new IllegalStateException(sb.toString());
            }
        }

        public void clear() {
            this.ka.clear();
        }

        @Nullable
        public <Model> List<m<Model, ?>> j(Class<Model> cls) {
            C0007a aVar = (C0007a) this.ka.get(cls);
            if (aVar == null) {
                return null;
            }
            return aVar.kb;
        }
    }

    public o(@NonNull Pool<List<Throwable>> pool) {
        this(new q(pool));
    }

    private o(@NonNull q qVar) {
        this.jZ = new a();
        this.jY = qVar;
    }

    private <Model, Data> void d(@NonNull List<n<? extends Model, ? extends Data>> list) {
        for (n bX : list) {
            bX.bX();
        }
    }

    @NonNull
    private <A> List<m<A, ?>> i(@NonNull Class<A> cls) {
        List<m<A, ?>> j = this.jZ.j(cls);
        if (j != null) {
            return j;
        }
        List<m<A, ?>> unmodifiableList = Collections.unmodifiableList(this.jY.k(cls));
        this.jZ.a(cls, unmodifiableList);
        return unmodifiableList;
    }

    @NonNull
    private static <A> Class<A> s(@NonNull A a2) {
        return a2.getClass();
    }

    public synchronized <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        d(this.jY.c(cls, cls2));
        this.jZ.clear();
    }

    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        return this.jY.b(cls, cls2);
    }

    public synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.jY.d(cls, cls2, nVar);
        this.jZ.clear();
    }

    public synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.jY.e(cls, cls2, nVar);
        this.jZ.clear();
    }

    @NonNull
    public synchronized <A> List<m<A, ?>> f(@NonNull A a2) {
        ArrayList arrayList;
        List i = i(s(a2));
        int size = i.size();
        arrayList = new ArrayList(size);
        for (int i2 = 0; i2 < size; i2++) {
            m mVar = (m) i.get(i2);
            if (mVar.q(a2)) {
                arrayList.add(mVar);
            }
        }
        return arrayList;
    }

    public synchronized <Model, Data> void f(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        d(this.jY.g(cls, cls2, nVar));
        this.jZ.clear();
    }

    @NonNull
    public synchronized List<Class<?>> h(@NonNull Class<?> cls) {
        return this.jY.h(cls);
    }
}
