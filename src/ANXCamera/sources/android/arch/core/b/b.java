package android.arch.core.b;

import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.WeakHashMap;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: SafeIterableMap */
public class b<K, V> implements Iterable<Entry<K, V>> {
    /* access modifiers changed from: private */
    public c<K, V> ad;
    private c<K, V> ae;
    private WeakHashMap<f<K, V>, Boolean> af = new WeakHashMap<>();
    private int mSize = 0;

    /* compiled from: SafeIterableMap */
    static class a<K, V> extends e<K, V> {
        a(c<K, V> cVar, c<K, V> cVar2) {
            super(cVar, cVar2);
        }

        /* access modifiers changed from: 0000 */
        public c<K, V> a(c<K, V> cVar) {
            return cVar.ah;
        }

        /* access modifiers changed from: 0000 */
        public c<K, V> b(c<K, V> cVar) {
            return cVar.ai;
        }
    }

    /* renamed from: android.arch.core.b.b$b reason: collision with other inner class name */
    /* compiled from: SafeIterableMap */
    private static class C0000b<K, V> extends e<K, V> {
        C0000b(c<K, V> cVar, c<K, V> cVar2) {
            super(cVar, cVar2);
        }

        /* access modifiers changed from: 0000 */
        public c<K, V> a(c<K, V> cVar) {
            return cVar.ai;
        }

        /* access modifiers changed from: 0000 */
        public c<K, V> b(c<K, V> cVar) {
            return cVar.ah;
        }
    }

    /* compiled from: SafeIterableMap */
    static class c<K, V> implements Entry<K, V> {
        @NonNull
        final K ag;
        c<K, V> ah;
        c<K, V> ai;
        @NonNull
        final V mValue;

        c(@NonNull K k, @NonNull V v) {
            this.ag = k;
            this.mValue = v;
        }

        public boolean equals(Object obj) {
            boolean z = true;
            if (obj == this) {
                return true;
            }
            if (!(obj instanceof c)) {
                return false;
            }
            c cVar = (c) obj;
            if (!this.ag.equals(cVar.ag) || !this.mValue.equals(cVar.mValue)) {
                z = false;
            }
            return z;
        }

        @NonNull
        public K getKey() {
            return this.ag;
        }

        @NonNull
        public V getValue() {
            return this.mValue;
        }

        public int hashCode() {
            return this.ag.hashCode() ^ this.mValue.hashCode();
        }

        public V setValue(V v) {
            throw new UnsupportedOperationException("An entry modification is not supported");
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(this.ag);
            sb.append("=");
            sb.append(this.mValue);
            return sb.toString();
        }
    }

    /* compiled from: SafeIterableMap */
    private class d implements f<K, V>, Iterator<Entry<K, V>> {
        private c<K, V> aj;
        private boolean ak;

        private d() {
            this.ak = true;
        }

        public void c(@NonNull c<K, V> cVar) {
            if (cVar == this.aj) {
                this.aj = this.aj.ai;
                this.ak = this.aj == null;
            }
        }

        public boolean hasNext() {
            boolean z = false;
            if (this.ak) {
                if (b.this.ad != null) {
                    z = true;
                }
                return z;
            }
            if (!(this.aj == null || this.aj.ah == null)) {
                z = true;
            }
            return z;
        }

        public Entry<K, V> next() {
            if (this.ak) {
                this.ak = false;
                this.aj = b.this.ad;
            } else {
                this.aj = this.aj != null ? this.aj.ah : null;
            }
            return this.aj;
        }
    }

    /* compiled from: SafeIterableMap */
    private static abstract class e<K, V> implements f<K, V>, Iterator<Entry<K, V>> {
        c<K, V> ah;
        c<K, V> am;

        e(c<K, V> cVar, c<K, V> cVar2) {
            this.am = cVar2;
            this.ah = cVar;
        }

        private c<K, V> n() {
            if (this.ah == this.am || this.am == null) {
                return null;
            }
            return a(this.ah);
        }

        /* access modifiers changed from: 0000 */
        public abstract c<K, V> a(c<K, V> cVar);

        /* access modifiers changed from: 0000 */
        public abstract c<K, V> b(c<K, V> cVar);

        public void c(@NonNull c<K, V> cVar) {
            if (this.am == cVar && cVar == this.ah) {
                this.ah = null;
                this.am = null;
            }
            if (this.am == cVar) {
                this.am = b(this.am);
            }
            if (this.ah == cVar) {
                this.ah = n();
            }
        }

        public boolean hasNext() {
            return this.ah != null;
        }

        public Entry<K, V> next() {
            c<K, V> cVar = this.ah;
            this.ah = n();
            return cVar;
        }
    }

    /* compiled from: SafeIterableMap */
    interface f<K, V> {
        void c(@NonNull c<K, V> cVar);
    }

    /* access modifiers changed from: protected */
    public c<K, V> a(K k) {
        c<K, V> cVar = this.ad;
        while (cVar != null && !cVar.ag.equals(k)) {
            cVar = cVar.ah;
        }
        return cVar;
    }

    /* access modifiers changed from: protected */
    public c<K, V> a(@NonNull K k, @NonNull V v) {
        c<K, V> cVar = new c<>(k, v);
        this.mSize++;
        if (this.ae == null) {
            this.ad = cVar;
            this.ae = this.ad;
            return cVar;
        }
        this.ae.ah = cVar;
        cVar.ai = this.ae;
        this.ae = cVar;
        return cVar;
    }

    public Iterator<Entry<K, V>> descendingIterator() {
        C0000b bVar = new C0000b(this.ae, this.ad);
        this.af.put(bVar, Boolean.valueOf(false));
        return bVar;
    }

    public Entry<K, V> eldest() {
        return this.ad;
    }

    public boolean equals(Object obj) {
        boolean z = true;
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (size() != bVar.size()) {
            return false;
        }
        Iterator it = iterator();
        Iterator it2 = bVar.iterator();
        while (it.hasNext() && it2.hasNext()) {
            Entry entry = (Entry) it.next();
            Object next = it2.next();
            if ((entry == null && next != null) || (entry != null && !entry.equals(next))) {
                return false;
            }
        }
        if (it.hasNext() || it2.hasNext()) {
            z = false;
        }
        return z;
    }

    public int hashCode() {
        Iterator it = iterator();
        int i = 0;
        while (it.hasNext()) {
            i += ((Entry) it.next()).hashCode();
        }
        return i;
    }

    @NonNull
    public Iterator<Entry<K, V>> iterator() {
        a aVar = new a(this.ad, this.ae);
        this.af.put(aVar, Boolean.valueOf(false));
        return aVar;
    }

    public d l() {
        d dVar = new d<>();
        this.af.put(dVar, Boolean.valueOf(false));
        return dVar;
    }

    public Entry<K, V> m() {
        return this.ae;
    }

    public V putIfAbsent(@NonNull K k, @NonNull V v) {
        c a2 = a(k);
        if (a2 != null) {
            return a2.mValue;
        }
        a(k, v);
        return null;
    }

    public V remove(@NonNull K k) {
        c a2 = a(k);
        if (a2 == null) {
            return null;
        }
        this.mSize--;
        if (!this.af.isEmpty()) {
            for (f c2 : this.af.keySet()) {
                c2.c(a2);
            }
        }
        if (a2.ai != null) {
            a2.ai.ah = a2.ah;
        } else {
            this.ad = a2.ah;
        }
        if (a2.ah != null) {
            a2.ah.ai = a2.ai;
        } else {
            this.ae = a2.ai;
        }
        a2.ah = null;
        a2.ai = null;
        return a2.mValue;
    }

    public int size() {
        return this.mSize;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        Iterator it = iterator();
        while (it.hasNext()) {
            sb.append(((Entry) it.next()).toString());
            if (it.hasNext()) {
                sb.append(", ");
            }
        }
        sb.append("]");
        return sb.toString();
    }
}
