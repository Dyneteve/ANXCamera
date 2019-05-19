package io.reactivex.internal.util;

public final class OpenHashSet<T> {
    private static final int INT_PHI = -1640531527;
    T[] keys;
    final float loadFactor;
    int mask;
    int maxSize;
    int size;

    public OpenHashSet() {
        this(16, 0.75f);
    }

    public OpenHashSet(int i) {
        this(i, 0.75f);
    }

    public OpenHashSet(int i, float f) {
        this.loadFactor = f;
        int roundToPowerOfTwo = Pow2.roundToPowerOfTwo(i);
        this.mask = roundToPowerOfTwo - 1;
        this.maxSize = (int) (f * ((float) roundToPowerOfTwo));
        this.keys = (Object[]) new Object[roundToPowerOfTwo];
    }

    static int mix(int i) {
        int i2 = i * INT_PHI;
        return i2 ^ (i2 >>> 16);
    }

    public boolean add(T t) {
        int i;
        T t2;
        T[] tArr = this.keys;
        int i2 = this.mask;
        int mix = mix(t.hashCode()) & i2;
        T t3 = tArr[mix];
        if (t3 != null) {
            if (t3.equals(t)) {
                return false;
            }
            do {
                mix = (mix + 1) & i2;
                t2 = tArr[mix];
                if (t2 == null) {
                }
            } while (!t2.equals(t));
            return false;
        }
        tArr[i] = t;
        int i3 = this.size + 1;
        this.size = i3;
        if (i3 >= this.maxSize) {
            rehash();
        }
        return true;
    }

    public Object[] keys() {
        return this.keys;
    }

    /* access modifiers changed from: 0000 */
    public void rehash() {
        int i;
        T[] tArr = this.keys;
        int length = tArr.length;
        int i2 = length << 1;
        int i3 = i2 - 1;
        T[] tArr2 = (Object[]) new Object[i2];
        int i4 = this.size;
        while (true) {
            int i5 = i4 - 1;
            if (i4 != 0) {
                while (true) {
                    length--;
                    if (tArr[length] != null) {
                        break;
                    }
                }
                int mix = mix(tArr[length].hashCode()) & i3;
                if (tArr2[mix] != null) {
                    do {
                        mix = (i + 1) & i3;
                    } while (tArr2[mix] != null);
                }
                tArr2[mix] = tArr[length];
                i4 = i5;
            } else {
                this.mask = i3;
                this.maxSize = (int) (((float) i2) * this.loadFactor);
                this.keys = tArr2;
                return;
            }
        }
    }

    public boolean remove(T t) {
        T t2;
        T[] tArr = this.keys;
        int i = this.mask;
        int mix = mix(t.hashCode()) & i;
        T t3 = tArr[mix];
        if (t3 == null) {
            return false;
        }
        if (t3.equals(t)) {
            return removeEntry(mix, tArr, i);
        }
        do {
            mix = (mix + 1) & i;
            t2 = tArr[mix];
            if (t2 == null) {
                return false;
            }
        } while (!t2.equals(t));
        return removeEntry(mix, tArr, i);
    }

    /* access modifiers changed from: 0000 */
    public boolean removeEntry(int i, T[] tArr, int i2) {
        int i3;
        T t;
        this.size--;
        while (true) {
            int i4 = i + 1;
            while (true) {
                i3 = i4 & i2;
                t = tArr[i3];
                if (t == null) {
                    tArr[i] = null;
                    return true;
                }
                int mix = mix(t.hashCode()) & i2;
                if (i <= i3) {
                    if (i >= mix || mix > i3) {
                        break;
                    }
                    i4 = i3 + 1;
                } else {
                    if (i >= mix && mix > i3) {
                        break;
                    }
                    i4 = i3 + 1;
                }
            }
            tArr[i] = t;
            i = i3;
        }
    }

    public int size() {
        return this.size;
    }
}
