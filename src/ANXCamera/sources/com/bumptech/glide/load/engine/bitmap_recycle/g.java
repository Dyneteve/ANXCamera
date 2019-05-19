package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.l;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: GroupedLinkedMap */
class g<K extends l, V> {
    private final a<K, V> hh = new a<>();
    private final Map<K, a<K, V>> hi = new HashMap();

    /* compiled from: GroupedLinkedMap */
    private static class a<K, V> {
        a<K, V> hj;
        a<K, V> hk;
        final K key;
        private List<V> values;

        a() {
            this(null);
        }

        a(K k) {
            this.hk = this;
            this.hj = this;
            this.key = k;
        }

        public void add(V v) {
            if (this.values == null) {
                this.values = new ArrayList();
            }
            this.values.add(v);
        }

        @Nullable
        public V removeLast() {
            int size = size();
            if (size > 0) {
                return this.values.remove(size - 1);
            }
            return null;
        }

        public int size() {
            if (this.values != null) {
                return this.values.size();
            }
            return 0;
        }
    }

    g() {
    }

    private void a(a<K, V> aVar) {
        d(aVar);
        aVar.hk = this.hh;
        aVar.hj = this.hh.hj;
        c(aVar);
    }

    private void b(a<K, V> aVar) {
        d(aVar);
        aVar.hk = this.hh.hk;
        aVar.hj = this.hh;
        c(aVar);
    }

    private static <K, V> void c(a<K, V> aVar) {
        aVar.hj.hk = aVar;
        aVar.hk.hj = aVar;
    }

    private static <K, V> void d(a<K, V> aVar) {
        aVar.hk.hj = aVar.hj;
        aVar.hj.hk = aVar.hk;
    }

    public void a(K k, V v) {
        a aVar = (a) this.hi.get(k);
        if (aVar == null) {
            aVar = new a(k);
            b(aVar);
            this.hi.put(k, aVar);
        } else {
            k.bm();
        }
        aVar.add(v);
    }

    @Nullable
    public V b(K k) {
        a aVar = (a) this.hi.get(k);
        if (aVar == null) {
            aVar = new a(k);
            this.hi.put(k, aVar);
        } else {
            k.bm();
        }
        a(aVar);
        return aVar.removeLast();
    }

    @Nullable
    public V removeLast() {
        for (a<K, V> aVar = this.hh.hk; !aVar.equals(this.hh); aVar = aVar.hk) {
            V removeLast = aVar.removeLast();
            if (removeLast != null) {
                return removeLast;
            }
            d(aVar);
            this.hi.remove(aVar.key);
            ((l) aVar.key).bm();
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean z = false;
        for (a<K, V> aVar = this.hh.hj; !aVar.equals(this.hh); aVar = aVar.hj) {
            z = true;
            sb.append('{');
            sb.append(aVar.key);
            sb.append(':');
            sb.append(aVar.size());
            sb.append("}, ");
        }
        if (z) {
            sb.delete(sb.length() - 2, sb.length());
        }
        sb.append(" )");
        return sb.toString();
    }
}
