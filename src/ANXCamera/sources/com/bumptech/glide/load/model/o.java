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
    private final q ka;
    private final a kb;

    /* compiled from: ModelLoaderRegistry */
    private static class a {
        private final Map<Class<?>, C0009a<?>> kc = new HashMap();

        /* compiled from: ModelLoaderRegistry */
        /* renamed from: com.bumptech.glide.load.model.o$a$a reason: collision with other inner class name */
        private static class C0009a<Model> {
            final List<m<Model, ?>> kd;

            public C0009a(List<m<Model, ?>> list) {
                this.kd = list;
            }
        }

        a() {
        }

        public <Model> void a(Class<Model> cls, List<m<Model, ?>> list) {
            if (((C0009a) this.kc.put(cls, new C0009a(list))) != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Already cached loaders for model: ");
                sb.append(cls);
                throw new IllegalStateException(sb.toString());
            }
        }

        public void clear() {
            this.kc.clear();
        }

        @Nullable
        public <Model> List<m<Model, ?>> j(Class<Model> cls) {
            C0009a aVar = (C0009a) this.kc.get(cls);
            if (aVar == null) {
                return null;
            }
            return aVar.kd;
        }
    }

    public o(@NonNull Pool<List<Throwable>> pool) {
        this(new q(pool));
    }

    private o(@NonNull q qVar) {
        this.kb = new a();
        this.ka = qVar;
    }

    private <Model, Data> void d(@NonNull List<n<? extends Model, ? extends Data>> list) {
        for (n bX : list) {
            bX.bX();
        }
    }

    @NonNull
    private <A> List<m<A, ?>> i(@NonNull Class<A> cls) {
        List<m<A, ?>> j = this.kb.j(cls);
        if (j != null) {
            return j;
        }
        List<m<A, ?>> unmodifiableList = Collections.unmodifiableList(this.ka.k(cls));
        this.kb.a(cls, unmodifiableList);
        return unmodifiableList;
    }

    @NonNull
    private static <A> Class<A> s(@NonNull A a2) {
        return a2.getClass();
    }

    public synchronized <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        d(this.ka.c(cls, cls2));
        this.kb.clear();
    }

    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        return this.ka.b(cls, cls2);
    }

    public synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.ka.d(cls, cls2, nVar);
        this.kb.clear();
    }

    public synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.ka.e(cls, cls2, nVar);
        this.kb.clear();
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
        d(this.ka.g(cls, cls2, nVar));
        this.kb.clear();
    }

    @NonNull
    public synchronized List<Class<?>> h(@NonNull Class<?> cls) {
        return this.ka.h(cls);
    }
}
