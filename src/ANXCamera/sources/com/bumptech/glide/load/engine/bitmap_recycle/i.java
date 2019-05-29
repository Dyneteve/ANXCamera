package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import java.util.HashMap;
import java.util.Map;
import java.util.NavigableMap;
import java.util.TreeMap;

/* compiled from: LruArrayPool */
public final class i implements b {
    private static final int DEFAULT_SIZE = 4194304;
    @VisibleForTesting
    static final int MAX_OVER_SIZE_MULTIPLE = 8;
    private static final int hm = 2;
    private final g<a, Object> hf;
    private final b hn;
    private final Map<Class<?>, NavigableMap<Integer, Integer>> ho;
    private final Map<Class<?>, a<?>> hp;
    private int hq;
    private final int maxSize;

    /* compiled from: LruArrayPool */
    private static final class a implements l {
        private final b hr;
        private Class<?> hs;
        int size;

        a(b bVar) {
            this.hr = bVar;
        }

        public void bm() {
            this.hr.a(this);
        }

        /* access modifiers changed from: 0000 */
        public void d(int i, Class<?> cls) {
            this.size = i;
            this.hs = cls;
        }

        public boolean equals(Object obj) {
            boolean z = false;
            if (!(obj instanceof a)) {
                return false;
            }
            a aVar = (a) obj;
            if (this.size == aVar.size && this.hs == aVar.hs) {
                z = true;
            }
            return z;
        }

        public int hashCode() {
            return (31 * this.size) + (this.hs != null ? this.hs.hashCode() : 0);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Key{size=");
            sb.append(this.size);
            sb.append("array=");
            sb.append(this.hs);
            sb.append('}');
            return sb.toString();
        }
    }

    /* compiled from: LruArrayPool */
    private static final class b extends c<a> {
        b() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: bt */
        public a bo() {
            return new a(this);
        }

        /* access modifiers changed from: 0000 */
        public a e(int i, Class<?> cls) {
            a aVar = (a) bp();
            aVar.d(i, cls);
            return aVar;
        }
    }

    @VisibleForTesting
    public i() {
        this.hf = new g<>();
        this.hn = new b();
        this.ho = new HashMap();
        this.hp = new HashMap();
        this.maxSize = DEFAULT_SIZE;
    }

    public i(int i) {
        this.hf = new g<>();
        this.hn = new b();
        this.ho = new HashMap();
        this.hp = new HashMap();
        this.maxSize = i;
    }

    @Nullable
    private <T> T a(a aVar) {
        return this.hf.b(aVar);
    }

    private <T> T a(a aVar, Class<T> cls) {
        a g = g(cls);
        T a2 = a(aVar);
        if (a2 != null) {
            this.hq -= g.n(a2) * g.bk();
            c(g.n(a2), cls);
        }
        if (a2 != null) {
            return a2;
        }
        if (Log.isLoggable(g.getTag(), 2)) {
            String tag = g.getTag();
            StringBuilder sb = new StringBuilder();
            sb.append("Allocated ");
            sb.append(aVar.size);
            sb.append(" bytes");
            Log.v(tag, sb.toString());
        }
        return g.newArray(aVar.size);
    }

    private boolean a(int i, Integer num) {
        return num != null && (bq() || num.intValue() <= 8 * i);
    }

    private boolean bq() {
        return this.hq == 0 || this.maxSize / this.hq >= 2;
    }

    private void br() {
        t(this.maxSize);
    }

    private void c(int i, Class<?> cls) {
        NavigableMap f = f(cls);
        Integer num = (Integer) f.get(Integer.valueOf(i));
        if (num == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Tried to decrement empty size, size: ");
            sb.append(i);
            sb.append(", this: ");
            sb.append(this);
            throw new NullPointerException(sb.toString());
        } else if (num.intValue() == 1) {
            f.remove(Integer.valueOf(i));
        } else {
            f.put(Integer.valueOf(i), Integer.valueOf(num.intValue() - 1));
        }
    }

    private NavigableMap<Integer, Integer> f(Class<?> cls) {
        NavigableMap<Integer, Integer> navigableMap = (NavigableMap) this.ho.get(cls);
        if (navigableMap != null) {
            return navigableMap;
        }
        TreeMap treeMap = new TreeMap();
        this.ho.put(cls, treeMap);
        return treeMap;
    }

    private <T> a<T> g(Class<T> cls) {
        a<T> aVar = (a) this.hp.get(cls);
        if (aVar == null) {
            if (cls.equals(int[].class)) {
                aVar = new h<>();
            } else if (cls.equals(byte[].class)) {
                aVar = new f<>();
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("No array pool found for: ");
                sb.append(cls.getSimpleName());
                throw new IllegalArgumentException(sb.toString());
            }
            this.hp.put(cls, aVar);
        }
        return aVar;
    }

    private <T> a<T> o(T t) {
        return g(t.getClass());
    }

    private boolean s(int i) {
        return i <= this.maxSize / 2;
    }

    private void t(int i) {
        while (this.hq > i) {
            Object removeLast = this.hf.removeLast();
            com.bumptech.glide.util.i.checkNotNull(removeLast);
            a o = o(removeLast);
            this.hq -= o.n(removeLast) * o.bk();
            c(o.n(removeLast), removeLast.getClass());
            if (Log.isLoggable(o.getTag(), 2)) {
                String tag = o.getTag();
                StringBuilder sb = new StringBuilder();
                sb.append("evicted: ");
                sb.append(o.n(removeLast));
                Log.v(tag, sb.toString());
            }
        }
    }

    public synchronized <T> T a(int i, Class<T> cls) {
        Integer num;
        num = (Integer) f(cls).ceilingKey(Integer.valueOf(i));
        return a(a(i, num) ? this.hn.e(num.intValue(), cls) : this.hn.e(i, cls), cls);
    }

    @Deprecated
    public <T> void a(T t, Class<T> cls) {
        put(t);
    }

    public synchronized <T> T b(int i, Class<T> cls) {
        return a(this.hn.e(i, cls), cls);
    }

    /* access modifiers changed from: 0000 */
    public int bs() {
        int i = 0;
        for (Class cls : this.ho.keySet()) {
            for (Integer num : ((NavigableMap) this.ho.get(cls)).keySet()) {
                i += num.intValue() * ((Integer) ((NavigableMap) this.ho.get(cls)).get(num)).intValue() * g(cls).bk();
            }
        }
        return i;
    }

    public synchronized void o() {
        t(0);
    }

    public synchronized <T> void put(T t) {
        Class cls = t.getClass();
        a g = g(cls);
        int n = g.n(t);
        int bk = g.bk() * n;
        if (s(bk)) {
            a e = this.hn.e(n, cls);
            this.hf.a(e, t);
            NavigableMap f = f(cls);
            Integer num = (Integer) f.get(Integer.valueOf(e.size));
            Integer valueOf = Integer.valueOf(e.size);
            int i = 1;
            if (num != null) {
                i = 1 + num.intValue();
            }
            f.put(valueOf, Integer.valueOf(i));
            this.hq += bk;
            br();
        }
    }

    public synchronized void trimMemory(int i) {
        if (i >= 40) {
            try {
                o();
            } catch (Throwable th) {
                throw th;
            }
        } else if (i >= 20 || i == 15) {
            t(this.maxSize / 2);
        }
    }
}
