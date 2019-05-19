package android.support.v4.util;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

public class LruCache<K, V> {
    private int createCount;
    private int evictionCount;
    private int hitCount;
    private final LinkedHashMap<K, V> map;
    private int maxSize;
    private int missCount;
    private int putCount;
    private int size;

    public LruCache(int maxSize2) {
        if (maxSize2 > 0) {
            this.maxSize = maxSize2;
            this.map = new LinkedHashMap<>(0, 0.75f, true);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    public void resize(int maxSize2) {
        if (maxSize2 > 0) {
            synchronized (this) {
                this.maxSize = maxSize2;
            }
            trimToSize(maxSize2);
            return;
        }
        throw new IllegalArgumentException("maxSize <= 0");
    }

    /* JADX WARNING: Code restructure failed: missing block: B:12:0x001b, code lost:
        r2 = create(r6);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x001f, code lost:
        if (r2 != null) goto L_0x0022;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0021, code lost:
        return null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0022, code lost:
        monitor-enter(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:?, code lost:
        r5.createCount++;
        r1 = r5.map.put(r6, r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0030, code lost:
        if (r1 == null) goto L_0x0038;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0032, code lost:
        r5.map.put(r6, r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0038, code lost:
        r5.size += safeSizeOf(r6, r2);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0041, code lost:
        monitor-exit(r5);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0042, code lost:
        if (r1 == null) goto L_0x0049;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0044, code lost:
        entryRemoved(false, r6, r2, r1);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0048, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0049, code lost:
        trimToSize(r5.maxSize);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:26:0x004e, code lost:
        return r2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final V get(K key) {
        if (key != null) {
            synchronized (this) {
                try {
                    V mapValue = this.map.get(key);
                    if (mapValue != null) {
                        try {
                            this.hitCount++;
                            return mapValue;
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    } else {
                        this.missCount++;
                    }
                } catch (Throwable mapValue2) {
                    th = mapValue2;
                    throw th;
                }
            }
        } else {
            throw new NullPointerException("key == null");
        }
    }

    public final V put(K key, V value) {
        Object put;
        if (key == null || value == null) {
            throw new NullPointerException("key == null || value == null");
        }
        synchronized (this) {
            this.putCount++;
            this.size += safeSizeOf(key, value);
            put = this.map.put(key, value);
            if (put != null) {
                this.size -= safeSizeOf(key, put);
            }
        }
        if (put != null) {
            entryRemoved(false, key, put, value);
        }
        trimToSize(this.maxSize);
        return put;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0074, code lost:
        throw new java.lang.IllegalStateException(r3.toString());
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void trimToSize(int maxSize2) {
        Object key;
        Object value;
        while (true) {
            synchronized (this) {
                if (this.size < 0 || (this.map.isEmpty() && this.size != 0)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(getClass().getName());
                    sb.append(".sizeOf() is reporting inconsistent results!");
                } else if (this.size > maxSize2) {
                    if (this.map.isEmpty()) {
                        break;
                    }
                    Entry<K, V> toEvict = (Entry) this.map.entrySet().iterator().next();
                    key = toEvict.getKey();
                    value = toEvict.getValue();
                    this.map.remove(key);
                    this.size -= safeSizeOf(key, value);
                    this.evictionCount++;
                }
            }
            entryRemoved(true, key, value, null);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0018, code lost:
        entryRemoved(false, r6, r1, null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:11:0x001c, code lost:
        return r1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x0016, code lost:
        if (r1 == null) goto L_0x001c;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public final V remove(K key) {
        if (key != null) {
            synchronized (this) {
                try {
                    V previous = this.map.remove(key);
                    if (previous != null) {
                        try {
                            this.size -= safeSizeOf(key, previous);
                        } catch (Throwable th) {
                            th = th;
                            throw th;
                        }
                    }
                } catch (Throwable previous2) {
                    th = previous2;
                    throw th;
                }
            }
        } else {
            throw new NullPointerException("key == null");
        }
    }

    /* access modifiers changed from: protected */
    public void entryRemoved(boolean evicted, K k, V v, V v2) {
    }

    /* access modifiers changed from: protected */
    public V create(K k) {
        return null;
    }

    private int safeSizeOf(K key, V value) {
        int result = sizeOf(key, value);
        if (result >= 0) {
            return result;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Negative size: ");
        sb.append(key);
        sb.append("=");
        sb.append(value);
        throw new IllegalStateException(sb.toString());
    }

    /* access modifiers changed from: protected */
    public int sizeOf(K k, V v) {
        return 1;
    }

    public final void evictAll() {
        trimToSize(-1);
    }

    public final synchronized int size() {
        return this.size;
    }

    public final synchronized int maxSize() {
        return this.maxSize;
    }

    public final synchronized int hitCount() {
        return this.hitCount;
    }

    public final synchronized int missCount() {
        return this.missCount;
    }

    public final synchronized int createCount() {
        return this.createCount;
    }

    public final synchronized int putCount() {
        return this.putCount;
    }

    public final synchronized int evictionCount() {
        return this.evictionCount;
    }

    public final synchronized Map<K, V> snapshot() {
        return new LinkedHashMap(this.map);
    }

    public final synchronized String toString() {
        int accesses;
        accesses = this.hitCount + this.missCount;
        return String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", new Object[]{Integer.valueOf(this.maxSize), Integer.valueOf(this.hitCount), Integer.valueOf(this.missCount), Integer.valueOf(accesses != 0 ? (100 * this.hitCount) / accesses : 0)});
    }
}
