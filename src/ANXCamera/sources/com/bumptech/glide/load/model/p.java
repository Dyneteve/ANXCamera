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
    private final List<m<Model, Data>> fL;
    private final Pool<List<Throwable>> le;

    /* compiled from: MultiModelLoader */
    static class a<Data> implements com.bumptech.glide.load.a.d.a<Data>, d<Data> {
        private final Pool<List<Throwable>> ct;
        @Nullable
        private List<Throwable> exceptions;
        private Priority fY;
        private final List<d<Data>> lf;
        private int lg = 0;
        private com.bumptech.glide.load.a.d.a<? super Data> lh;

        a(@NonNull List<d<Data>> list, @NonNull Pool<List<Throwable>> pool) {
            this.ct = pool;
            i.b(list);
            this.lf = list;
        }

        private void cK() {
            if (this.lg < this.lf.size() - 1) {
                this.lg++;
                a(this.fY, this.lh);
                return;
            }
            i.checkNotNull(this.exceptions);
            this.lh.b(new GlideException("Fetch failed", (List<Throwable>) new ArrayList<Throwable>(this.exceptions)));
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            this.fY = priority;
            this.lh = aVar;
            this.exceptions = (List) this.ct.acquire();
            ((d) this.lf.get(this.lg)).a(priority, this);
        }

        @NonNull
        public Class<Data> aJ() {
            return ((d) this.lf.get(0)).aJ();
        }

        @NonNull
        public DataSource aK() {
            return ((d) this.lf.get(0)).aK();
        }

        public void b(@NonNull Exception exc) {
            ((List) i.checkNotNull(this.exceptions)).add(exc);
            cK();
        }

        public void cancel() {
            for (d cancel : this.lf) {
                cancel.cancel();
            }
        }

        public void cleanup() {
            if (this.exceptions != null) {
                this.ct.release(this.exceptions);
            }
            this.exceptions = null;
            for (d cleanup : this.lf) {
                cleanup.cleanup();
            }
        }

        public void n(@Nullable Data data) {
            if (data != null) {
                this.lh.n(data);
            } else {
                cK();
            }
        }
    }

    p(@NonNull List<m<Model, Data>> list, @NonNull Pool<List<Throwable>> pool) {
        this.fL = list;
        this.le = pool;
    }

    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        int size = this.fL.size();
        ArrayList arrayList = new ArrayList(size);
        c cVar = null;
        for (int i3 = 0; i3 < size; i3++) {
            m mVar = (m) this.fL.get(i3);
            if (mVar.t(model)) {
                com.bumptech.glide.load.model.m.a b = mVar.b(model, i, i2, fVar);
                if (b != null) {
                    cVar = b.fK;
                    arrayList.add(b.kZ);
                }
            }
        }
        if (arrayList.isEmpty() || cVar == null) {
            return null;
        }
        return new com.bumptech.glide.load.model.m.a<>(cVar, new a(arrayList, this.le));
    }

    public boolean t(@NonNull Model model) {
        for (m t : this.fL) {
            if (t.t(model)) {
                return true;
            }
        }
        return false;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("MultiModelLoader{modelLoaders=");
        sb.append(Arrays.toString(this.fL.toArray()));
        sb.append('}');
        return sb.toString();
    }
}
