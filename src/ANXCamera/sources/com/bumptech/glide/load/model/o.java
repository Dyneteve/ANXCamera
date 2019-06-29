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
    private final q la;
    private final a lb;

    /* compiled from: ModelLoaderRegistry */
    private static class a {
        private final Map<Class<?>, C0008a<?>> lc = new HashMap();

        /* renamed from: com.bumptech.glide.load.model.o$a$a reason: collision with other inner class name */
        /* compiled from: ModelLoaderRegistry */
        private static class C0008a<Model> {
            final List<m<Model, ?>> ld;

            public C0008a(List<m<Model, ?>> list) {
                this.ld = list;
            }
        }

        a() {
        }

        public <Model> void a(Class<Model> cls, List<m<Model, ?>> list) {
            if (((C0008a) this.lc.put(cls, new C0008a(list))) != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Already cached loaders for model: ");
                sb.append(cls);
                throw new IllegalStateException(sb.toString());
            }
        }

        public void clear() {
            this.lc.clear();
        }

        @Nullable
        public <Model> List<m<Model, ?>> k(Class<Model> cls) {
            C0008a aVar = (C0008a) this.lc.get(cls);
            if (aVar == null) {
                return null;
            }
            return aVar.ld;
        }
    }

    public o(@NonNull Pool<List<Throwable>> pool) {
        this(new q(pool));
    }

    private o(@NonNull q qVar) {
        this.lb = new a();
        this.la = qVar;
    }

    private <Model, Data> void d(@NonNull List<n<? extends Model, ? extends Data>> list) {
        for (n cA : list) {
            cA.cA();
        }
    }

    @NonNull
    private <A> List<m<A, ?>> j(@NonNull Class<A> cls) {
        List<m<A, ?>> k = this.lb.k(cls);
        if (k != null) {
            return k;
        }
        List<m<A, ?>> unmodifiableList = Collections.unmodifiableList(this.la.l(cls));
        this.lb.a(cls, unmodifiableList);
        return unmodifiableList;
    }

    @NonNull
    private static <A> Class<A> v(@NonNull A a2) {
        return a2.getClass();
    }

    public synchronized <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        d(this.la.c(cls, cls2));
        this.lb.clear();
    }

    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        return this.la.b(cls, cls2);
    }

    public synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.la.d(cls, cls2, nVar);
        this.lb.clear();
    }

    public synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        this.la.e(cls, cls2, nVar);
        this.lb.clear();
    }

    public synchronized <Model, Data> void f(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        d(this.la.g(cls, cls2, nVar));
        this.lb.clear();
    }

    @NonNull
    public synchronized List<Class<?>> i(@NonNull Class<?> cls) {
        return this.la.i(cls);
    }

    @NonNull
    public synchronized <A> List<m<A, ?>> i(@NonNull A a2) {
        ArrayList arrayList;
        List j = j(v(a2));
        int size = j.size();
        arrayList = new ArrayList(size);
        for (int i = 0; i < size; i++) {
            m mVar = (m) j.get(i);
            if (mVar.t(a2)) {
                arrayList.add(mVar);
            }
        }
        return arrayList;
    }
}
