package android.support.v4.util;

import java.util.Map;

public class SimpleArrayMap<K, V> {
    private static final int BASE_SIZE = 4;
    private static final int CACHE_SIZE = 10;
    private static final boolean DEBUG = false;
    private static final String TAG = "ArrayMap";
    static Object[] mBaseCache;
    static int mBaseCacheSize;
    static Object[] mTwiceBaseCache;
    static int mTwiceBaseCacheSize;
    Object[] mArray;
    int[] mHashes;
    int mSize;

    public SimpleArrayMap() {
        this.mHashes = ContainerHelpers.EMPTY_INTS;
        this.mArray = ContainerHelpers.EMPTY_OBJECTS;
        this.mSize = 0;
    }

    public SimpleArrayMap(int i) {
        if (i == 0) {
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
        } else {
            allocArrays(i);
        }
        this.mSize = 0;
    }

    public SimpleArrayMap(SimpleArrayMap simpleArrayMap) {
        this();
        if (simpleArrayMap != null) {
            putAll(simpleArrayMap);
        }
    }

    private void allocArrays(int i) {
        if (i == 8) {
            synchronized (ArrayMap.class) {
                if (mTwiceBaseCache != null) {
                    Object[] objArr = mTwiceBaseCache;
                    this.mArray = objArr;
                    mTwiceBaseCache = (Object[]) objArr[0];
                    this.mHashes = (int[]) objArr[1];
                    objArr[1] = null;
                    objArr[0] = null;
                    mTwiceBaseCacheSize--;
                    return;
                }
            }
        } else if (i == 4) {
            synchronized (ArrayMap.class) {
                if (mBaseCache != null) {
                    Object[] objArr2 = mBaseCache;
                    this.mArray = objArr2;
                    mBaseCache = (Object[]) objArr2[0];
                    this.mHashes = (int[]) objArr2[1];
                    objArr2[1] = null;
                    objArr2[0] = null;
                    mBaseCacheSize--;
                    return;
                }
            }
        }
        this.mHashes = new int[i];
        this.mArray = new Object[(i << 1)];
    }

    private static void freeArrays(int[] iArr, Object[] objArr, int i) {
        if (iArr.length == 8) {
            synchronized (ArrayMap.class) {
                if (mTwiceBaseCacheSize < 10) {
                    objArr[0] = mTwiceBaseCache;
                    objArr[1] = iArr;
                    for (int i2 = (i << 1) - 1; i2 >= 2; i2--) {
                        objArr[i2] = null;
                    }
                    mTwiceBaseCache = objArr;
                    mTwiceBaseCacheSize++;
                }
            }
        } else if (iArr.length == 4) {
            synchronized (ArrayMap.class) {
                if (mBaseCacheSize < 10) {
                    objArr[0] = mBaseCache;
                    objArr[1] = iArr;
                    for (int i3 = (i << 1) - 1; i3 >= 2; i3--) {
                        objArr[i3] = null;
                    }
                    mBaseCache = objArr;
                    mBaseCacheSize++;
                }
            }
        }
    }

    public void clear() {
        if (this.mSize != 0) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
            this.mSize = 0;
        }
    }

    public boolean containsKey(Object obj) {
        return indexOfKey(obj) >= 0;
    }

    public boolean containsValue(Object obj) {
        return indexOfValue(obj) >= 0;
    }

    public void ensureCapacity(int i) {
        if (this.mHashes.length < i) {
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            allocArrays(i);
            if (this.mSize > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, this.mSize);
                System.arraycopy(objArr, 0, this.mArray, 0, this.mSize << 1);
            }
            freeArrays(iArr, objArr, this.mSize);
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Map)) {
            return false;
        }
        Map map = (Map) obj;
        if (size() != map.size()) {
            return false;
        }
        int i = 0;
        while (i < this.mSize) {
            try {
                Object keyAt = keyAt(i);
                Object valueAt = valueAt(i);
                Object obj2 = map.get(keyAt);
                if (valueAt == null) {
                    if (obj2 != null || !map.containsKey(keyAt)) {
                        return false;
                    }
                } else if (!valueAt.equals(obj2)) {
                    return false;
                }
                i++;
            } catch (NullPointerException e) {
                return false;
            } catch (ClassCastException e2) {
                return false;
            }
        }
        return true;
    }

    public V get(Object obj) {
        int indexOfKey = indexOfKey(obj);
        if (indexOfKey >= 0) {
            return this.mArray[(indexOfKey << 1) + 1];
        }
        return null;
    }

    public int hashCode() {
        int[] iArr = this.mHashes;
        Object[] objArr = this.mArray;
        int i = 0;
        int i2 = 0;
        int i3 = 1;
        int i4 = this.mSize;
        while (i2 < i4) {
            Object obj = objArr[i3];
            i += iArr[i2] ^ (obj == null ? 0 : obj.hashCode());
            i2++;
            i3 += 2;
        }
        return i;
    }

    /* access modifiers changed from: 0000 */
    public int indexOf(Object obj, int i) {
        int i2 = this.mSize;
        if (i2 == 0) {
            return -1;
        }
        int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i2, i);
        if (binarySearch < 0 || obj.equals(this.mArray[binarySearch << 1])) {
            return binarySearch;
        }
        int i3 = binarySearch + 1;
        while (i3 < i2 && this.mHashes[i3] == i) {
            if (obj.equals(this.mArray[i3 << 1])) {
                return i3;
            }
            i3++;
        }
        int i4 = binarySearch - 1;
        while (i4 >= 0 && this.mHashes[i4] == i) {
            if (obj.equals(this.mArray[i4 << 1])) {
                return i4;
            }
            i4--;
        }
        return ~i3;
    }

    public int indexOfKey(Object obj) {
        return obj == null ? indexOfNull() : indexOf(obj, obj.hashCode());
    }

    /* access modifiers changed from: 0000 */
    public int indexOfNull() {
        int i = this.mSize;
        if (i == 0) {
            return -1;
        }
        int binarySearch = ContainerHelpers.binarySearch(this.mHashes, i, 0);
        if (binarySearch < 0 || this.mArray[binarySearch << 1] == null) {
            return binarySearch;
        }
        int i2 = binarySearch + 1;
        while (i2 < i && this.mHashes[i2] == 0) {
            if (this.mArray[i2 << 1] == null) {
                return i2;
            }
            i2++;
        }
        int i3 = binarySearch - 1;
        while (i3 >= 0 && this.mHashes[i3] == 0) {
            if (this.mArray[i3 << 1] == null) {
                return i3;
            }
            i3--;
        }
        return ~i2;
    }

    /* access modifiers changed from: 0000 */
    public int indexOfValue(Object obj) {
        int i = this.mSize * 2;
        Object[] objArr = this.mArray;
        int i2 = 1;
        if (obj == null) {
            while (i2 < i) {
                if (objArr[i2] == null) {
                    return i2 >> 1;
                }
                i2 += 2;
            }
        } else {
            while (i2 < i) {
                if (obj.equals(objArr[i2])) {
                    return i2 >> 1;
                }
                i2 += 2;
            }
        }
        return -1;
    }

    public boolean isEmpty() {
        return this.mSize <= 0;
    }

    public K keyAt(int i) {
        return this.mArray[i << 1];
    }

    public V put(K k, V v) {
        int i;
        int i2;
        if (k == null) {
            i2 = 0;
            i = indexOfNull();
        } else {
            i2 = k.hashCode();
            i = indexOf(k, i2);
        }
        if (i >= 0) {
            int i3 = (i << 1) + 1;
            V v2 = this.mArray[i3];
            this.mArray[i3] = v;
            return v2;
        }
        int i4 = ~i;
        if (this.mSize >= this.mHashes.length) {
            int i5 = 4;
            if (this.mSize >= 8) {
                i5 = (this.mSize >> 1) + this.mSize;
            } else if (this.mSize >= 4) {
                i5 = 8;
            }
            int i6 = i5;
            int[] iArr = this.mHashes;
            Object[] objArr = this.mArray;
            allocArrays(i6);
            if (this.mHashes.length > 0) {
                System.arraycopy(iArr, 0, this.mHashes, 0, iArr.length);
                System.arraycopy(objArr, 0, this.mArray, 0, objArr.length);
            }
            freeArrays(iArr, objArr, this.mSize);
        }
        if (i4 < this.mSize) {
            System.arraycopy(this.mHashes, i4, this.mHashes, i4 + 1, this.mSize - i4);
            System.arraycopy(this.mArray, i4 << 1, this.mArray, (i4 + 1) << 1, (this.mSize - i4) << 1);
        }
        this.mHashes[i4] = i2;
        this.mArray[i4 << 1] = k;
        this.mArray[(i4 << 1) + 1] = v;
        this.mSize++;
        return null;
    }

    public void putAll(SimpleArrayMap<? extends K, ? extends V> simpleArrayMap) {
        int i = simpleArrayMap.mSize;
        ensureCapacity(this.mSize + i);
        int i2 = 0;
        if (this.mSize != 0) {
            while (true) {
                int i3 = i2;
                if (i3 < i) {
                    put(simpleArrayMap.keyAt(i3), simpleArrayMap.valueAt(i3));
                    i2 = i3 + 1;
                } else {
                    return;
                }
            }
        } else if (i > 0) {
            System.arraycopy(simpleArrayMap.mHashes, 0, this.mHashes, 0, i);
            System.arraycopy(simpleArrayMap.mArray, 0, this.mArray, 0, i << 1);
            this.mSize = i;
        }
    }

    public V remove(Object obj) {
        int indexOfKey = indexOfKey(obj);
        if (indexOfKey >= 0) {
            return removeAt(indexOfKey);
        }
        return null;
    }

    public V removeAt(int i) {
        V v = this.mArray[(i << 1) + 1];
        if (this.mSize <= 1) {
            freeArrays(this.mHashes, this.mArray, this.mSize);
            this.mHashes = ContainerHelpers.EMPTY_INTS;
            this.mArray = ContainerHelpers.EMPTY_OBJECTS;
            this.mSize = 0;
        } else {
            int i2 = 8;
            if (this.mHashes.length <= 8 || this.mSize >= this.mHashes.length / 3) {
                this.mSize--;
                if (i < this.mSize) {
                    System.arraycopy(this.mHashes, i + 1, this.mHashes, i, this.mSize - i);
                    System.arraycopy(this.mArray, (i + 1) << 1, this.mArray, i << 1, (this.mSize - i) << 1);
                }
                this.mArray[this.mSize << 1] = null;
                this.mArray[(this.mSize << 1) + 1] = null;
            } else {
                if (this.mSize > 8) {
                    i2 = (this.mSize >> 1) + this.mSize;
                }
                int i3 = i2;
                int[] iArr = this.mHashes;
                Object[] objArr = this.mArray;
                allocArrays(i3);
                this.mSize--;
                if (i > 0) {
                    System.arraycopy(iArr, 0, this.mHashes, 0, i);
                    System.arraycopy(objArr, 0, this.mArray, 0, i << 1);
                }
                if (i < this.mSize) {
                    System.arraycopy(iArr, i + 1, this.mHashes, i, this.mSize - i);
                    System.arraycopy(objArr, (i + 1) << 1, this.mArray, i << 1, (this.mSize - i) << 1);
                }
            }
        }
        return v;
    }

    public V setValueAt(int i, V v) {
        int i2 = (i << 1) + 1;
        V v2 = this.mArray[i2];
        this.mArray[i2] = v;
        return v2;
    }

    public int size() {
        return this.mSize;
    }

    public String toString() {
        if (isEmpty()) {
            return "{}";
        }
        StringBuilder sb = new StringBuilder(this.mSize * 28);
        sb.append('{');
        for (int i = 0; i < this.mSize; i++) {
            if (i > 0) {
                sb.append(", ");
            }
            Object keyAt = keyAt(i);
            if (keyAt != this) {
                sb.append(keyAt);
            } else {
                sb.append("(this Map)");
            }
            sb.append('=');
            Object valueAt = valueAt(i);
            if (valueAt != this) {
                sb.append(valueAt);
            } else {
                sb.append("(this Map)");
            }
        }
        sb.append('}');
        return sb.toString();
    }

    public V valueAt(int i) {
        return this.mArray[(i << 1) + 1];
    }
}
