package android.arch.core.b;

import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import java.util.HashMap;
import java.util.Map.Entry;

@RestrictTo({Scope.LIBRARY_GROUP})
/* compiled from: FastSafeIterableMap */
public class a<K, V> extends b<K, V> {
    private HashMap<K, c<K, V>> ac = new HashMap<>();

    /* access modifiers changed from: protected */
    public c<K, V> a(K k) {
        return (c) this.ac.get(k);
    }

    public Entry<K, V> b(K k) {
        if (contains(k)) {
            return ((c) this.ac.get(k)).ai;
        }
        return null;
    }

    public boolean contains(K k) {
        return this.ac.containsKey(k);
    }

    public V putIfAbsent(@NonNull K k, @NonNull V v) {
        c a = a(k);
        if (a != null) {
            return a.mValue;
        }
        this.ac.put(k, a(k, v));
        return null;
    }

    public V remove(@NonNull K k) {
        V remove = super.remove(k);
        this.ac.remove(k);
        return remove;
    }
}
