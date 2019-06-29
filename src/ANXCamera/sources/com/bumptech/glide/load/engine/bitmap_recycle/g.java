package com.bumptech.glide.load.engine.bitmap_recycle;

import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.bitmap_recycle.l;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* compiled from: GroupedLinkedMap */
class g<K extends l, V> {
    private final a<K, V> il = new a<>();
    private final Map<K, a<K, V>> im = new HashMap();

    /* compiled from: GroupedLinkedMap */
    private static class a<K, V> {

        /* renamed from: io reason: collision with root package name */
        a<K, V> f2io;
        a<K, V> ip;
        final K key;
        private List<V> values;

        a() {
            this(null);
        }

        a(K k) {
            this.ip = this;
            this.f2io = this;
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
        aVar.ip = this.il;
        aVar.f2io = this.il.f2io;
        c(aVar);
    }

    private void b(a<K, V> aVar) {
        d(aVar);
        aVar.ip = this.il.ip;
        aVar.f2io = this.il;
        c(aVar);
    }

    private static <K, V> void c(a<K, V> aVar) {
        aVar.f2io.ip = aVar;
        aVar.ip.f2io = aVar;
    }

    private static <K, V> void d(a<K, V> aVar) {
        aVar.ip.f2io = aVar.f2io;
        aVar.f2io.ip = aVar.ip;
    }

    public void a(K k, V v) {
        a aVar = (a) this.im.get(k);
        if (aVar == null) {
            aVar = new a(k);
            b(aVar);
            this.im.put(k, aVar);
        } else {
            k.bN();
        }
        aVar.add(v);
    }

    @Nullable
    public V b(K k) {
        a aVar = (a) this.im.get(k);
        if (aVar == null) {
            aVar = new a(k);
            this.im.put(k, aVar);
        } else {
            k.bN();
        }
        a(aVar);
        return aVar.removeLast();
    }

    @Nullable
    public V removeLast() {
        for (a<K, V> aVar = this.il.ip; !aVar.equals(this.il); aVar = aVar.ip) {
            V removeLast = aVar.removeLast();
            if (removeLast != null) {
                return removeLast;
            }
            d(aVar);
            this.im.remove(aVar.key);
            ((l) aVar.key).bN();
        }
        return null;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("GroupedLinkedMap( ");
        boolean z = false;
        for (a<K, V> aVar = this.il.f2io; !aVar.equals(this.il); aVar = aVar.f2io) {
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
