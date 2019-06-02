package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.Pools.Pool;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.GlideException;
import com.bumptech.glide.load.f;
import com.bumptech.glide.util.i;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/* compiled from: MultiModelLoader */
class p<Model, Data> implements m<Model, Data> {
    private final List<m<Model, Data>> eL;
    private final Pool<List<Throwable>> ke;

    /* compiled from: MultiModelLoader */
    static class a<Data> implements com.bumptech.glide.load.a.d.a<Data>, d<Data> {
        private final Pool<List<Throwable>> bq;
        private Priority eY;
        @Nullable
        private List<Throwable> exceptions;
        private final List<d<Data>> kf;
        private int kg = 0;
        private com.bumptech.glide.load.a.d.a<? super Data> kh;

        a(@NonNull List<d<Data>> list, @NonNull Pool<List<Throwable>> pool) {
            this.bq = pool;
            i.b(list);
            this.kf = list;
        }

        private void ci() {
            if (this.kg < this.kf.size() - 1) {
                this.kg++;
                a(this.eY, this.kh);
                return;
            }
            i.checkNotNull(this.exceptions);
            this.kh.b(new GlideException("Fetch failed", (List<Throwable>) new ArrayList<Throwable>(this.exceptions)));
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            this.eY = priority;
            this.kh = aVar;
            this.exceptions = (List) this.bq.acquire();
            ((d) this.kf.get(this.kg)).a(priority, this);
        }

        @NonNull
        public Class<Data> aj() {
            return ((d) this.kf.get(0)).aj();
        }

        @NonNull
        public DataSource ak() {
            return ((d) this.kf.get(0)).ak();
        }

        public void b(@NonNull Exception exc) {
            ((List) i.checkNotNull(this.exceptions)).add(exc);
            ci();
        }

        public void cancel() {
            for (d cancel : this.kf) {
                cancel.cancel();
            }
        }

        public void cleanup() {
            if (this.exceptions != null) {
                this.bq.release(this.exceptions);
            }
            this.exceptions = null;
            for (d cleanup : this.kf) {
                cleanup.cleanup();
            }
        }

        public void k(@Nullable Data data) {
            if (data != null) {
                this.kh.k(data);
            } else {
                ci();
            }
        }
    }

    p(@NonNull List<m<Model, Data>> list, @NonNull Pool<List<Throwable>> pool) {
        this.eL = list;
        this.ke = pool;
    }

    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        int size = this.eL.size();
        ArrayList arrayList = new ArrayList(size);
        c cVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            m mVar = (m) this.eL.get(i3);
            if (mVar.q(model)) {
                com.bumptech.glide.load.model.m.a b = mVar.b(model, i, i2, fVar);
                if (b != null) {
                    cVar = b.eK;
                    arrayList.add(b.jZ);
                }
            }
        }
        if (arrayList.isEmpty() || cVar == null) {
            return null;
        }
        return new com.bumptech.glide.load.model.m.a<>(cVar, new a(arrayList, this.ke));
    }

    public boolean q(@NonNull Model model) {
        for (m q : this.eL) {
            if (q.q(model)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiModelLoader{modelLoaders=");
        sb.append(Arrays.toString(this.eL.toArray()));
        sb.append('}');
        return sb.toString();
    }
}
