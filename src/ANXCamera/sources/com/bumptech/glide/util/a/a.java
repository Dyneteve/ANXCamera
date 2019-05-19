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
    private static final d<Object> qg = new d<Object>() {
        public void reset(@NonNull Object obj) {
        }
    };

    /* compiled from: FactoryPools */
    /* renamed from: com.bumptech.glide.util.a.a$a reason: collision with other inner class name */
    public interface C0011a<T> {
        T create();
    }

    /* compiled from: FactoryPools */
    private static final class b<T> implements Pool<T> {
        private final Pool<T> fd;
        private final C0011a<T> qh;
        private final d<T> qi;

        b(@NonNull Pool<T> pool, @NonNull C0011a<T> aVar, @NonNull d<T> dVar) {
            this.fd = pool;
            this.qh = aVar;
            this.qi = dVar;
        }

        public T acquire() {
            T acquire = this.fd.acquire();
            if (acquire == null) {
                acquire = this.qh.create();
                if (Log.isLoggable(a.TAG, 2)) {
                    String str = a.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Created new ");
                    sb.append(acquire.getClass());
                    Log.v(str, sb.toString());
                }
            }
            if (acquire instanceof c) {
                ((c) acquire).aQ().o(false);
            }
            return acquire;
        }

        public boolean release(@NonNull T t) {
            if (t instanceof c) {
                ((c) t).aQ().o(true);
            }
            this.qi.reset(t);
            return this.fd.release(t);
        }
    }

    /* compiled from: FactoryPools */
    public interface c {
        @NonNull
        c aQ();
    }

    /* compiled from: FactoryPools */
    public interface d<T> {
        void reset(@NonNull T t);
    }

    private a() {
    }

    @NonNull
    public static <T> Pool<List<T>> Z(int i) {
        return a(new SynchronizedPool(i), new C0011a<List<T>>() {
            @NonNull
            /* renamed from: eR */
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
    public static <T extends c> Pool<T> a(int i, @NonNull C0011a<T> aVar) {
        return a((Pool<T>) new SimplePool<T>(i), aVar);
    }

    @NonNull
    private static <T extends c> Pool<T> a(@NonNull Pool<T> pool, @NonNull C0011a<T> aVar) {
        return a(pool, aVar, eQ());
    }

    @NonNull
    private static <T> Pool<T> a(@NonNull Pool<T> pool, @NonNull C0011a<T> aVar, @NonNull d<T> dVar) {
        return new b(pool, aVar, dVar);
    }

    @NonNull
    public static <T extends c> Pool<T> b(int i, @NonNull C0011a<T> aVar) {
        return a((Pool<T>) new SynchronizedPool<T>(i), aVar);
    }

    @NonNull
    public static <T> Pool<List<T>> eP() {
        return Z(20);
    }

    @NonNull
    private static <T> d<T> eQ() {
        return qg;
    }
}
