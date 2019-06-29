package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LruCache */
public class f<T, Y> {
    private final long iE;
    private long iG;
    private long maxSize;
    private final Map<T, Y> qW = new LinkedHashMap(100, 0.75f, true);

    public f(long j) {
        this.iE = j;
        this.maxSize = j;
    }

    private void bS() {
        b(this.maxSize);
    }

    public void O() {
        b(0);
    }

    public synchronized void b(float f) {
        if (f >= 0.0f) {
            this.maxSize = (long) Math.round(((float) this.iE) * f);
            bS();
        } else {
            throw new IllegalArgumentException("Multiplier must be >= 0");
        }
    }

    /* access modifiers changed from: protected */
    public synchronized void b(long j) {
        while (this.iG > j) {
            Iterator it = this.qW.entrySet().iterator();
            Entry entry = (Entry) it.next();
            Object value = entry.getValue();
            this.iG -= (long) s(value);
            Object key = entry.getKey();
            it.remove();
            c(key, value);
        }
    }

    /* access modifiers changed from: protected */
    public void c(@NonNull T t, @Nullable Y y) {
    }

    public synchronized long cg() {
        return this.iG;
    }

    public synchronized boolean contains(@NonNull T t) {
        return this.qW.containsKey(t);
    }

    @Nullable
    public synchronized Y get(@NonNull T t) {
        return this.qW.get(t);
    }

    /* access modifiers changed from: protected */
    public synchronized int getCount() {
        return this.qW.size();
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    @Nullable
    public synchronized Y put(@NonNull T t, @Nullable Y y) {
        long s = (long) s(y);
        if (s >= this.maxSize) {
            c(t, y);
            return null;
        }
        if (y != null) {
            this.iG += s;
        }
        Y put = this.qW.put(t, y);
        if (put != null) {
            this.iG -= (long) s(put);
            if (!put.equals(y)) {
                c(t, put);
            }
        }
        bS();
        return put;
    }

    @Nullable
    public synchronized Y remove(@NonNull T t) {
        Y remove;
        remove = this.qW.remove(t);
        if (remove != null) {
            this.iG -= (long) s(remove);
        }
        return remove;
    }

    /* access modifiers changed from: protected */
    public int s(@Nullable Y y) {
        return 1;
    }
}
