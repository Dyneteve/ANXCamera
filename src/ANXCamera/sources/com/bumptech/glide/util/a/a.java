package com.bumptech.glide.util.a;

import android.support.annotation.NonNull;
import android.support.v4.util.Pools.Pool;
import android.support.v4.util.Pools.SimplePool;
import android.support.v4.util.Pools.SynchronizedPool;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

/* compiled from: FactoryPools */
public final class a {
    private static final int DEFAULT_POOL_SIZE = 20;
    private static final String TAG = "FactoryPools";
    private static final d<Object> rh = new d<Object>() {
        public void reset(@NonNull Object obj) {
        }
    };

    /* renamed from: com.bumptech.glide.util.a.a$a reason: collision with other inner class name */
    /* compiled from: FactoryPools */
    public interface C0012a<T> {
        T create();
    }

    /* compiled from: FactoryPools */
    private static final class b<T> implements Pool<T> {
        private final Pool<T> gf;
        private final C0012a<T> ri;
        private final d<T> rj;

        b(@NonNull Pool<T> pool, @NonNull C0012a<T> aVar, @NonNull d<T> dVar) {
            this.gf = pool;
            this.ri = aVar;
            this.rj = dVar;
        }

        public T acquire() {
            T acquire = this.gf.acquire();
            if (acquire == null) {
                acquire = this.ri.create();
                if (Log.isLoggable(a.TAG, 2)) {
                    String str = a.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Created new ");
                    sb.append(acquire.getClass());
                    Log.v(str, sb.toString());
                }
            }
            if (acquire instanceof c) {
                ((c) acquire).bq().o(false);
            }
            return acquire;
        }

        public boolean release(@NonNull T t) {
            if (t instanceof c) {
                ((c) t).bq().o(true);
            }
            this.rj.reset(t);
            return this.gf.release(t);
        }
    }

    /* compiled from: FactoryPools */
    public interface c {
        @NonNull
        c bq();
    }

    /* compiled from: FactoryPools */
    public interface d<T> {
        void reset(@NonNull T t);
    }

    private a() {
    }

    @NonNull
    public static <T extends c> Pool<T> a(int i, @NonNull C0012a<T> aVar) {
        return a((Pool<T>) new SimplePool<T>(i), aVar);
    }

    @NonNull
    private static <T extends c> Pool<T> a(@NonNull Pool<T> pool, @NonNull C0012a<T> aVar) {
        return a(pool, aVar, fs());
    }

    @NonNull
    private static <T> Pool<T> a(@NonNull Pool<T> pool, @NonNull C0012a<T> aVar, @NonNull d<T> dVar) {
        return new b(pool, aVar, dVar);
    }

    @NonNull
    public static <T> Pool<List<T>> ad(int i) {
        return a(new SynchronizedPool(i), new C0012a<List<T>>() {
            @NonNull
            /* renamed from: ft */
            public List<T> create() {
                return new ArrayList();
            }
        }, new d<List<T>>() {
            /* renamed from: f */
            public void reset(@NonNull List<T> list) {
                list.clear();
            }
        });
    }

    @NonNull
    public static <T extends c> Pool<T> b(int i, @NonNull C0012a<T> aVar) {
        return a((Pool<T>) new SynchronizedPool<T>(i), aVar);
    }

    @NonNull
    public static <T> Pool<List<T>> fr() {
        return ad(20);
    }

    @NonNull
    private static <T> d<T> fs() {
        return rh;
    }
}
