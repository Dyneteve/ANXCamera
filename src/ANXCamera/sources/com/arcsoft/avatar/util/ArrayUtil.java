package com.arcsoft.avatar.util;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

public class ArrayUtil {
    private static final String a = ArrayUtil.class.getSimpleName();
    private static final double b = 1.0E-9d;

    private ArrayUtil() {
    }

    public static <T> String array2String(T[] tArr) {
        return Arrays.toString(tArr);
    }

    public static <T> int getIndex(T[] tArr, T t) {
        int i = -1;
        if (tArr == null) {
            return -1;
        }
        int length = tArr.length;
        int i2 = 0;
        while (true) {
            if (i2 >= length) {
                break;
            } else if (isEqual(t, tArr[i2])) {
                i = i2;
                break;
            } else {
                i2++;
            }
        }
        return i;
    }

    public static <T> int[] getIndices(T[] tArr, T t) {
        if (!hasElementInArray(tArr, t)) {
            return new int[0];
        }
        int length = tArr.length;
        int[] iArr = new int[length];
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            if (isEqual(tArr[i2], t)) {
                iArr[i] = i2;
                i++;
            }
        }
        if (i == 0) {
            return new int[0];
        }
        int[] iArr2 = new int[i];
        System.arraycopy(iArr, 0, iArr2, 0, i);
        return iArr2;
    }

    public static boolean hasElementInArray(int[] iArr, int i) {
        if (iArr == null || iArr.length <= 0) {
            return false;
        }
        for (int i2 : iArr) {
            if (i2 == i) {
                return true;
            }
        }
        return false;
    }

    public static <T> boolean hasElementInArray(T[] tArr, T t) {
        if (tArr == null || tArr.length <= 0) {
            return false;
        }
        for (T isEqual : tArr) {
            if (isEqual(isEqual, t)) {
                return true;
            }
        }
        return false;
    }

    public static <T> boolean isEqual(T t, T t2) {
        boolean z = true;
        if (t == null && t2 == null) {
            return true;
        }
        if (t == null || t2 == null) {
            return false;
        }
        if (t instanceof Byte) {
            if (((Byte) t).byteValue() != ((Byte) t2).byteValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Short) {
            if (((Short) t).shortValue() != ((Short) t2).shortValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Integer) {
            if (((Integer) t).intValue() != ((Integer) t2).intValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Long) {
            if (((Long) t).longValue() != ((Long) t2).longValue()) {
                z = false;
            }
            return z;
        } else if (t instanceof Float) {
            double abs = (double) Math.abs(((Float) t).floatValue() - ((Float) t2).floatValue());
            if (abs <= -1.0E-9d || abs >= b) {
                z = false;
            }
            return z;
        } else if (!(t instanceof Double)) {
            return t instanceof String ? ((String) t).equals((String) t2) : t.equals(t2);
        } else {
            double abs2 = Math.abs(((Double) t).doubleValue() - ((Double) t2).doubleValue());
            if (abs2 <= -1.0E-9d || abs2 >= b) {
                z = false;
            }
            return z;
        }
    }

    public static <T> T[] mergeAll(T[] tArr, T[]... tArr2) {
        int length = tArr.length;
        for (T[] length2 : tArr2) {
            length += length2.length;
        }
        T[] copyOf = Arrays.copyOf(tArr, length);
        int length3 = tArr.length;
        int i = length3;
        for (T[] tArr3 : tArr2) {
            System.arraycopy(tArr3, 0, copyOf, i, tArr3.length);
            i += tArr3.length;
        }
        return copyOf;
    }

    public static <T> T[] removeArrayElementsByValue(T[] tArr, T t, Class<T> cls) {
        if (!hasElementInArray(tArr, t)) {
            return tArr;
        }
        int length = tArr.length;
        if (length == 1) {
            return tArr[0] == t ? (Object[]) Array.newInstance(cls, 0) : tArr;
        }
        int[] indices = getIndices(tArr, t);
        if (indices == null || indices.length <= 0) {
            return tArr;
        }
        T[] tArr2 = (Object[]) Array.newInstance(cls, length - indices.length);
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            if (!hasElementInArray(indices, i2)) {
                tArr2[i] = tArr[i2];
                i++;
            }
        }
        return tArr2;
    }

    public static <T> T[] removeRedundantElement(T[] tArr, Class<T> cls) {
        HashSet hashSet = new HashSet();
        for (T add : tArr) {
            hashSet.add(add);
        }
        return hashSet.toArray((Object[]) Array.newInstance(cls, hashSet.size()));
    }

    public static <T> void reverse(T[] tArr) {
        if (tArr != null && tArr.length != 0 && tArr.length != 1) {
            int length = tArr.length;
            int i = length / 2;
            for (int i2 = 0; i2 < i; i2++) {
                T t = tArr[i2];
                int i3 = (length - i2) - 1;
                tArr[i2] = tArr[i3];
                tArr[i3] = t;
            }
        }
    }

    public static int[] selectSort(int[] iArr) {
        if (iArr == null || iArr.length <= 1) {
            return iArr;
        }
        int length = iArr.length;
        int i = 0;
        while (i < length - 1) {
            int i2 = i + 1;
            int i3 = i;
            for (int i4 = i2; i4 < length; i4++) {
                if (iArr[i3] > iArr[i4]) {
                    i3 = i4;
                }
            }
            if (i3 != i) {
                int i5 = iArr[i];
                iArr[i] = iArr[i3];
                iArr[i3] = i5;
            }
            i = i2;
        }
        return iArr;
    }

    public static <T extends Comparable<? super T>> void sort(List<T> list) {
        Collections.sort(list);
    }

    public static <T extends Comparable<? super T>> void sort(T[] tArr) {
        Arrays.sort(tArr);
    }
}
