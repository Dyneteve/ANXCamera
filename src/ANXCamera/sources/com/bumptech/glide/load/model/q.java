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
    private static final c li = new c();
    private static final m<Object, Object> lj = new a();
    private final Pool<List<Throwable>> ct;
    private final List<b<?, ?>> lk;
    private final c ll;
    private final Set<b<?, ?>> lm;

    /* compiled from: MultiModelLoaderFactory */
    private static class a implements m<Object, Object> {
        a() {
        }

        @Nullable
        public com.bumptech.glide.load.model.m.a<Object> b(@NonNull Object obj, int i, int i2, @NonNull f fVar) {
            return null;
        }

        public boolean t(@NonNull Object obj) {
            return false;
        }
    }

    /* compiled from: MultiModelLoaderFactory */
    private static class b<Model, Data> {
        final Class<Data> dataClass;
        private final Class<Model> ln;
        final n<? extends Model, ? extends Data> lo;

        public b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar) {
            this.ln = cls;
            this.dataClass = cls2;
            this.lo = nVar;
        }

        public boolean d(@NonNull Class<?> cls, @NonNull Class<?> cls2) {
            return m(cls) && this.dataClass.isAssignableFrom(cls2);
        }

        public boolean m(@NonNull Class<?> cls) {
            return this.ln.isAssignableFrom(cls);
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
        this(pool, li);
    }

    @VisibleForTesting
    q(@NonNull Pool<List<Throwable>> pool, @NonNull c cVar) {
        this.lk = new ArrayList();
        this.lm = new HashSet();
        this.ct = pool;
        this.ll = cVar;
    }

    @NonNull
    private <Model, Data> n<Model, Data> a(@NonNull b<?, ?> bVar) {
        return bVar.lo;
    }

    private <Model, Data> void a(@NonNull Class<Model> cls, @NonNull Class<Data> cls2, @NonNull n<? extends Model, ? extends Data> nVar, boolean z) {
        this.lk.add(z ? this.lk.size() : 0, new b(cls, cls2, nVar));
    }

    @NonNull
    private <Model, Data> m<Model, Data> b(@NonNull b<?, ?> bVar) {
        return (m) i.checkNotNull(bVar.lo.a(this));
    }

    @NonNull
    private static <Model, Data> m<Model, Data> cL() {
        return lj;
    }

    @NonNull
    public synchronized <Model, Data> m<Model, Data> b(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        try {
            ArrayList arrayList = new ArrayList();
            boolean z = false;
            for (b bVar : this.lk) {
                if (this.lm.contains(bVar)) {
                    z = true;
                } else if (bVar.d(cls, cls2)) {
                    this.lm.add(bVar);
                    arrayList.add(b(bVar));
                    this.lm.remove(bVar);
                }
            }
            if (arrayList.size() > 1) {
                return this.ll.a(arrayList, this.ct);
            } else if (arrayList.size() == 1) {
                return (m) arrayList.get(0);
            } else if (z) {
                return cL();
            } else {
                throw new NoModelLoaderAvailableException(cls, cls2);
            }
        } catch (Throwable th) {
            this.lm.clear();
            throw th;
        }
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized <Model, Data> List<n<? extends Model, ? extends Data>> c(@NonNull Class<Model> cls, @NonNull Class<Data> cls2) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        Iterator it = this.lk.iterator();
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
    public synchronized List<Class<?>> i(@NonNull Class<?> cls) {
        ArrayList arrayList;
        arrayList = new ArrayList();
        for (b bVar : this.lk) {
            if (!arrayList.contains(bVar.dataClass) && bVar.m(cls)) {
                arrayList.add(bVar.dataClass);
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: 0000 */
    @NonNull
    public synchronized <Model> List<m<Model, ?>> l(@NonNull Class<Model> cls) {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList();
            for (b bVar : this.lk) {
                if (!this.lm.contains(bVar)) {
                    if (bVar.m(cls)) {
                        this.lm.add(bVar);
                        arrayList.add(b(bVar));
                        this.lm.remove(bVar);
                    }
                }
            }
        } catch (Throwable th) {
            this.lm.clear();
            throw th;
        }
        return arrayList;
    }
}
