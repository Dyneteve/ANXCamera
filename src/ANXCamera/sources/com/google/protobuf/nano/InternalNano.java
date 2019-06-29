package com.google.protobuf.nano;

import java.nio.charset.Charset;
import java.util.Arrays;

public final class InternalNano {
    protected static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Object LAZY_INIT_LOCK = new Object();
    protected static final Charset UTF_8 = Charset.forName("UTF-8");

    private InternalNano() {
    }

    public static byte[] bytesDefaultValue(String str) {
        return str.getBytes(ISO_8859_1);
    }

    public static void cloneUnknownFieldData(ExtendableMessageNano extendableMessageNano, ExtendableMessageNano extendableMessageNano2) {
        if (extendableMessageNano.unknownFieldData != null) {
            extendableMessageNano2.unknownFieldData = extendableMessageNano.unknownFieldData.clone();
        }
    }

    public static byte[] copyFromUtf8(String str) {
        return str.getBytes(UTF_8);
    }

    public static boolean equals(double[] dArr, double[] dArr2) {
        if (dArr != null && dArr.length != 0) {
            return Arrays.equals(dArr, dArr2);
        }
        return dArr2 == null || dArr2.length == 0;
    }

    public static boolean equals(float[] fArr, float[] fArr2) {
        if (fArr != null && fArr.length != 0) {
            return Arrays.equals(fArr, fArr2);
        }
        return fArr2 == null || fArr2.length == 0;
    }

    public static boolean equals(int[] iArr, int[] iArr2) {
        if (iArr != null && iArr.length != 0) {
            return Arrays.equals(iArr, iArr2);
        }
        return iArr2 == null || iArr2.length == 0;
    }

    public static boolean equals(long[] jArr, long[] jArr2) {
        if (jArr != null && jArr.length != 0) {
            return Arrays.equals(jArr, jArr2);
        }
        return jArr2 == null || jArr2.length == 0;
    }

    public static boolean equals(Object[] objArr, Object[] objArr2) {
        int length = objArr == null ? 0 : objArr.length;
        int length2 = objArr2 == null ? 0 : objArr2.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= length || objArr[i] != null) {
                while (i2 < length2 && objArr2[i2] == null) {
                    i2++;
                }
                boolean z = i >= length;
                boolean z2 = i2 >= length2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !objArr[i].equals(objArr2[i2])) {
                    return false;
                }
                i++;
                i2++;
            } else {
                i++;
            }
        }
    }

    public static boolean equals(boolean[] zArr, boolean[] zArr2) {
        if (zArr != null && zArr.length != 0) {
            return Arrays.equals(zArr, zArr2);
        }
        return zArr2 == null || zArr2.length == 0;
    }

    public static boolean equals(byte[][] bArr, byte[][] bArr2) {
        int length = bArr == null ? 0 : bArr.length;
        int length2 = bArr2 == null ? 0 : bArr2.length;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i >= length || bArr[i] != null) {
                while (i2 < length2 && bArr2[i2] == null) {
                    i2++;
                }
                boolean z = i >= length;
                boolean z2 = i2 >= length2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !Arrays.equals(bArr[i], bArr2[i2])) {
                    return false;
                }
                i++;
                i2++;
            } else {
                i++;
            }
        }
    }

    public static int hashCode(double[] dArr) {
        if (dArr == null || dArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(dArr);
    }

    public static int hashCode(float[] fArr) {
        if (fArr == null || fArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(fArr);
    }

    public static int hashCode(int[] iArr) {
        if (iArr == null || iArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(iArr);
    }

    public static int hashCode(long[] jArr) {
        if (jArr == null || jArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(jArr);
    }

    public static int hashCode(Object[] objArr) {
        int length = objArr == null ? 0 : objArr.length;
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            Object obj = objArr[i2];
            if (obj != null) {
                i = (31 * i) + obj.hashCode();
            }
        }
        return i;
    }

    public static int hashCode(boolean[] zArr) {
        if (zArr == null || zArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(zArr);
    }

    public static int hashCode(byte[][] bArr) {
        int length = bArr == null ? 0 : bArr.length;
        int i = 0;
        for (int i2 = 0; i2 < length; i2++) {
            byte[] bArr2 = bArr[i2];
            if (bArr2 != null) {
                i = (31 * i) + Arrays.hashCode(bArr2);
            }
        }
        return i;
    }

    public static String stringDefaultValue(String str) {
        return new String(str.getBytes(ISO_8859_1), UTF_8);
    }
}
