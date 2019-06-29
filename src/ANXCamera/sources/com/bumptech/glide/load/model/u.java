package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.f;

/* compiled from: UnitModelLoader */
public class u<Model> implements m<Model, Model> {
    private static final u<?> lq = new u<>();

    /* compiled from: UnitModelLoader */
    public static class a<Model> implements n<Model, Model> {
        private static final a<?> lr = new a<>();

        public static <T> a<T> cN() {
            return lr;
        }

        @NonNull
        public m<Model, Model> a(q qVar) {
            return u.cM();
        }

        public void cA() {
        }
    }

    /* compiled from: UnitModelLoader */
    private static class b<Model> implements d<Model> {
        private final Model resource;

        b(Model model) {
            this.resource = model;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Model> aVar) {
            aVar.n(this.resource);
        }

        @NonNull
        public Class<Model> aJ() {
            return this.resource.getClass();
        }

        @NonNull
        public DataSource aK() {
            return DataSource.LOCAL;
        }

        public void cancel() {
        }

        public void cleanup() {
        }
    }

    public static <T> u<T> cM() {
        return lq;
    }

    public com.bumptech.glide.load.model.m.a<Model> b(@NonNull Model model, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(model), new b(model));
    }

    public boolean t(@NonNull Model model) {
        return true;
    }
}
