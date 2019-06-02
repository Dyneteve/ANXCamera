package com.bumptech.glide.util;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LruCache */
public class f<T, Y> {
    private final long hw;
    private long hy;
    private long maxSize;
    private final Map<T, Y> pW = new LinkedHashMap(100, 0.75f, true);

    public f(long j) {
        this.hw = j;
        this.maxSize = j;
    }

    private void br() {
        b(this.maxSize);
    }

    public synchronized void b(float f) {
        if (f >= 0.0f) {
            this.maxSize = (long) Math.round(((float) this.hw) * f);
            br();
        } else {
            throw new IllegalArgumentException("Multiplier must be >= 0");
        }
    }

    /* access modifiers changed from: protected */
    public synchronized void b(long j) {
        while (this.hy > j) {
            Iterator it = this.pW.entrySet().iterator();
            Entry entry = (Entry) it.next();
            Object value = entry.getValue();
            this.hy -= (long) p(value);
            Object key = entry.getKey();
            it.remove();
            b(key, value);
        }
    }

    /* access modifiers changed from: protected */
    public void b(@NonNull T t, @Nullable Y y) {
    }

    public synchronized long bF() {
        return this.hy;
    }

    public synchronized boolean contains(@NonNull T t) {
        return this.pW.containsKey(t);
    }

    @Nullable
    public synchronized Y get(@NonNull T t) {
        return this.pW.get(t);
    }

    /* access modifiers changed from: protected */
    public synchronized int getCount() {
        return this.pW.size();
    }

    public synchronized long getMaxSize() {
        return this.maxSize;
    }

    public void o() {
        b(0);
    }

    /* access modifiers changed from: protected */
    public int p(@Nullable Y y) {
        return 1;
    }

    @Nullable
    public synchronized Y put(@NonNull T t, @Nullable Y y) {
        long p = (long) p(y);
        if (p >= this.maxSize) {
            b(t, y);
            return null;
        }
        if (y != null) {
            this.hy += p;
        }
        Y put = this.pW.put(t, y);
        if (put != null) {
            this.hy -= (long) p(put);
            if (!put.equals(y)) {
                b(t, put);
            }
        }
        br();
        return put;
    }

    @Nullable
    public synchronized Y remove(@NonNull T t) {
        Y remove;
        remove = this.pW.remove(t);
        if (remove != null) {
            this.hy -= (long) p(remove);
        }
        return remove;
    }
}
