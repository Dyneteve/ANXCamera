package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import com.bumptech.glide.util.f;
import com.bumptech.glide.util.k;
import java.util.Queue;

public class ModelCache<A, B> {
    private static final int DEFAULT_SIZE = 250;
    private final f<ModelKey<A>, B> jV;

    @VisibleForTesting
    static final class ModelKey<A> {
        private static final Queue<ModelKey<?>> jX = k.Y(0);
        private A bv;
        private int height;
        private int width;

        private ModelKey() {
        }

        static <A> ModelKey<A> d(A a, int i, int i2) {
            ModelKey<A> modelKey;
            synchronized (jX) {
                modelKey = (ModelKey) jX.poll();
            }
            if (modelKey == null) {
                modelKey = new ModelKey<>();
            }
            modelKey.e(a, i, i2);
            return modelKey;
        }

        private void e(A a, int i, int i2) {
            this.bv = a;
            this.width = i;
            this.height = i2;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof ModelKey)) {
                return false;
            }
            ModelKey modelKey = (ModelKey) obj;
            if (this.width == modelKey.width && this.height == modelKey.height && this.bv.equals(modelKey.bv)) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * ((this.height * 31) + this.width)) + this.bv.hashCode();
        }

        public void release() {
            synchronized (jX) {
                jX.offer(this);
            }
        }
    }

    public ModelCache() {
        this(250);
    }

    public ModelCache(long j) {
        this.jV = new f<ModelKey<A>, B>(j) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void b(@NonNull ModelKey<A> modelKey, @Nullable B b) {
                modelKey.release();
            }
        };
    }

    public void a(A a, int i, int i2, B b) {
        this.jV.put(ModelKey.d(a, i, i2), b);
    }

    @Nullable
    public B c(A a, int i, int i2) {
        ModelKey d = ModelKey.d(a, i, i2);
        B b = this.jV.get(d);
        d.release();
        return b;
    }

    public void clear() {
        this.jV.o();
    }
}
