package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.l;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: GroupedLinkedMap */
class g<K extends l, V> {
    private final a<K, V> hj = new a<>();
    private final Map<K, a<K, V>> hk = new HashMap();

    /* compiled from: GroupedLinkedMap */
    private static class a<K, V> {
        a<K, V> hl;
        a<K, V> hm;
        final K key;
        private List<V> values;

        a() {
            this(null);
        }

        a(K k) {
            this.hm = this;
            this.hl = this;
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
        aVar.hm = this.hj;
        aVar.hl = this.hj.hl;
        c(aVar);
    }

    private void b(a<K, V> aVar) {
        d(aVar);
        aVar.hm = this.hj.hm;
        aVar.hl = this.hj;
        c(aVar);
    }

    private static <K, V> void c(a<K, V> aVar) {
        aVar.hl.hm = aVar;
        aVar.hm.hl = aVar;
    }

    private static <K, V> void d(a<K, V> aVar) {
        aVar.hm.hl = aVar.hl;
        aVar.hl.hm = aVar.hm;
    }

    public void a(K k, V v) {
        a aVar = (a) this.hk.get(k);
        if (aVar == null) {
            aVar = new a(k);
            b(aVar);
            this.hk.put(k, aVar);
        } else {
            k.bm();
        }
        aVar.add(v);
    }

    @Nullable
    public V b(K k) {
        a aVar = (a) this.hk.get(k);
        if (aVar == null) {
            aVar = new a(k);
            this.hk.put(k, aVar);
        } else {
            k.bm();
        }
        a(aVar);
        return aVar.removeLast();
    }

    @Nullable
    public V removeLast() {
        for (a<K, V> aVar = this.hj.hm; !aVar.equals(this.hj); aVar = aVar.hm) {
            V removeLast = aVar.removeLast();
            if (removeLast != null) {
                return removeLast;
            }
            d(aVar);
            this.hk.remove(aVar.key);
            ((l) aVar.key).bm();
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean z = false;
        for (a<K, V> aVar = this.hj.hl; !aVar.equals(this.hj); aVar = aVar.hl) {
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
