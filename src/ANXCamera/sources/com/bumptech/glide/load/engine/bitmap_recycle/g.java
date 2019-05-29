package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.l;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: GroupedLinkedMap */
class g<K extends l, V> {
    private final a<K, V> hi = new a<>();
    private final Map<K, a<K, V>> hj = new HashMap();

    /* compiled from: GroupedLinkedMap */
    private static class a<K, V> {
        a<K, V> hk;
        a<K, V> hl;
        final K key;
        private List<V> values;

        a() {
            this(null);
        }

        a(K k) {
            this.hl = this;
            this.hk = this;
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
        aVar.hl = this.hi;
        aVar.hk = this.hi.hk;
        c(aVar);
    }

    private void b(a<K, V> aVar) {
        d(aVar);
        aVar.hl = this.hi.hl;
        aVar.hk = this.hi;
        c(aVar);
    }

    private static <K, V> void c(a<K, V> aVar) {
        aVar.hk.hl = aVar;
        aVar.hl.hk = aVar;
    }

    private static <K, V> void d(a<K, V> aVar) {
        aVar.hl.hk = aVar.hk;
        aVar.hk.hl = aVar.hl;
    }

    public void a(K k, V v) {
        a aVar = (a) this.hj.get(k);
        if (aVar == null) {
            aVar = new a(k);
            b(aVar);
            this.hj.put(k, aVar);
        } else {
            k.bm();
        }
        aVar.add(v);
    }

    @Nullable
    public V b(K k) {
        a aVar = (a) this.hj.get(k);
        if (aVar == null) {
            aVar = new a(k);
            this.hj.put(k, aVar);
        } else {
            k.bm();
        }
        a(aVar);
        return aVar.removeLast();
    }

    @Nullable
    public V removeLast() {
        for (a<K, V> aVar = this.hi.hl; !aVar.equals(this.hi); aVar = aVar.hl) {
            V removeLast = aVar.removeLast();
            if (removeLast != null) {
                return removeLast;
            }
            d(aVar);
            this.hj.remove(aVar.key);
            ((l) aVar.key).bm();
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean z = false;
        for (a<K, V> aVar = this.hi.hk; !aVar.equals(this.hi); aVar = aVar.hk) {
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
