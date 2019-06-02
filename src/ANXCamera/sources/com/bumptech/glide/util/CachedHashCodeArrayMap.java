package com.bumptech.glide.util;

import android.support.v4.util.ArrayMap;
import android.support.v4.util.SimpleArrayMap;

public final class CachedHashCodeArrayMap<K, V> extends ArrayMap<K, V> {
    private int hashCode;

    public void clear() {
        this.hashCode = 0;
        CachedHashCodeArrayMap.super.clear();
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = CachedHashCodeArrayMap.super.hashCode();
        }
        return this.hashCode;
    }

    public V put(K k, V v) {
        this.hashCode = 0;
        return CachedHashCodeArrayMap.super.put(k, v);
    }

    public void putAll(SimpleArrayMap<? extends K, ? extends V> simpleArrayMap) {
        this.hashCode = 0;
        CachedHashCodeArrayMap.super.putAll(simpleArrayMap);
    }

    public V removeAt(int i) {
        this.hashCode = 0;
        return CachedHashCodeArrayMap.super.removeAt(i);
    }

    public V setValueAt(int i, V v) {
        this.hashCode = 0;
        return CachedHashCodeArrayMap.super.setValueAt(i, v);
    }
}
