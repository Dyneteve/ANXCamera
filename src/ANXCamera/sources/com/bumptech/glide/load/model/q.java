package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.Registry.NoModelLoaderAvailableException;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* compiled from: MultiModelLoaderFactory */
public class q {
    private static final c kg = new c();
    private static final m<Object, Object> kh = new a();
    private final Pool<List<Throwable>> bo;
    private final List<b<?, ?>> ki;
    private final c kj;
    private final Set<b<?, ?>> kk;

    /* compiled from: MultiModelLoaderFactory */
    private static class a implements m<Object, Object> {
        a() {
        }

        @Nullable
        public com.bumptech.glide.load.model.m.a<Object> b(@NonNull Object obj, int i, int i2, @NonNull f fVar) {
            return null;
        }

        public boolean q(@NonNull Object obj) {
            return false;
        }
    }

    /* compiled from: MultiModelLoaderFactory */
    private static class b<Model, Data> {
        final Class<Data> dataClass;
        private final Class<Model> kl;
        final n<? extends Model, ? extends Data> km;

        public b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
            this.kl = cls;
            this.dataClass = cls2;
            this.km = nVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return l(cls) && this.dataClass.isAssignableFrom(cls2);
        }

        public boolean l(@NonNull Class<?> cls) {
            return this.kl.isAssignableFrom(cls);
        }
    }

    /* compiled from: MultiModelLoaderFactory */
    static class c {
        c() {
        }

        @NonNull
        public <Model, Data> p<Model, Data> a(@NonNull List<m<Model, Data>> list, @NonNull Pool<List<Throwable>> pool) {
            return new p<>(list, pool);
        }
    }

    public q(@NonNull Pool<List<Throwable>> pool) {
        this(pool, kg);
    }

    @VisibleForTesting
    q(@NonNull Pool<List<Throwable>> pool, @NonNull c cVar) {
        this.ki = new ArrayList();
        this.kk = new HashSet();
        this.bo = pool;
        this.kj = cVar;
    }

    @NonNull
    private <Model, Data> n<Model, Data> a(@NonNull b<?, ?> bVar) {
        return bVar.km;
    }

    private <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar, boolean z) {
        this.ki.add(z ? this.ki.size() : 0, new b(cls, cls2, nVar));
    }

    @NonNull
    private <Model, Data> m<Model, Data> b(@NonNull b<?, ?> bVar) {
        return (m) i.checkNotNull(bVar.km.a(this));
    }

    @NonNull
    private static <Model, Data> m<Model, Data> cj() {
        return kh;
    }

    @NonNull
    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        try {
            ArrayList arrayList = new ArrayList();
            boolean z = false;
            for (b bVar : this.ki) {
                if (this.kk.contains(bVar)) {
                    z = true;
                } else if (bVar.d(cls, cls2)) {
                    this.kk.add(bVar);
                    arrayList.add(b(bVar));
                    this.kk.remove(bVar);
                }
            }
            if (arrayList.size() > 1) {
                return this.kj.a(arrayList, this.bo);
            } else if (arrayList.size() == 1) {
                return (m) arrayList.get(0);
            } else if (z) {
                return cj();
            } else {
                throw new NoModelLoaderAvailableException(cls, cls2);
            }
        } catch (Throwable th) {
            this.kk.clear();
            throw th;
        }
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized <Model, Data> List<n<? extends Model, ? extends Data>> c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Iterator it = this.ki.iterator();
        while (it.hasNext()) {
            b bVar = (b) it.next();
            if (bVar.d(cls, cls2)) {
                it.remove();
                arrayList.add(a(bVar));
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: 0000 */
    public synchronized <Model, Data> void d(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        a(cls, cls2, nVar, true);
    }

    /* access modifiers changed from: 0000 */
    public synchronized <Model, Data> void e(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        a(cls, cls2, nVar, false);
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized <Model, Data> List<n<? extends Model, ? extends Data>> g(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
        List<n<? extends Model, ? extends Data>> c2;
        c2 = c(cls, cls2);
        d(cls, cls2, nVar);
        return c2;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized List<Class<?>> h(@NonNull Class<?> cls) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (b bVar : this.ki) {
            if (!arrayList.contains(bVar.dataClass) && bVar.l(cls)) {
                arrayList.add(bVar.dataClass);
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized <Model> List<m<Model, ?>> k(@NonNull Class<Model> cls) {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList();
            for (b bVar : this.ki) {
                if (!this.kk.contains(bVar)) {
                    if (bVar.l(cls)) {
                        this.kk.add(bVar);
                        arrayList.add(b(bVar));
                        this.kk.remove(bVar);
                    }
                }
            }
        } catch (Throwable th) {
            this.kk.clear();
            throw th;
        }
        return arrayList;
    }
}
