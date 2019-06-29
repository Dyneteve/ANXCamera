package com.android.gallery3d.ui;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.database.Cursor;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.ParcelFileDescriptor;
import android.text.TextUtils;
import com.android.camera.log.Log;
import java.io.Closeable;
import java.io.InterruptedIOException;
import java.util.Locale;

public class Utils {
    private static final long INITIALCRC = -1;
    private static final boolean IS_DEBUG_BUILD = (Build.TYPE.equals("eng") || Build.TYPE.equals("userdebug"));
    private static final String MASK_STRING = "********************************";
    private static final long POLY64REV = -7661587058870466123L;
    private static final String TAG = "Utils";
    private static long[] sCrcTable = new long[256];

    static {
        for (int i = 0; i < 256; i++) {
            long j = (long) i;
            for (int i2 = 0; i2 < 8; i2++) {
                j = (j >> 1) ^ ((((int) j) & 1) != 0 ? POLY64REV : 0);
            }
            sCrcTable[i] = j;
        }
    }

    public static void assertTrue(boolean z) {
        if (!z) {
            throw new AssertionError();
        }
    }

    public static int ceilLog2(float f) {
        int i = 0;
        while (i < 31 && ((float) (1 << i)) < f) {
            i++;
        }
        return i;
    }

    public static <T> T checkNotNull(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException();
    }

    public static float clamp(float f, float f2, float f3) {
        return f > f3 ? f3 : f < f2 ? f2 : f;
    }

    public static int clamp(int i, int i2, int i3) {
        return i > i3 ? i3 : i < i2 ? i2 : i;
    }

    public static long clamp(long j, long j2, long j3) {
        return j > j3 ? j3 : j < j2 ? j2 : j;
    }

    public static void closeSilently(Cursor cursor) {
        if (cursor != null) {
            try {
                cursor.close();
            } catch (Throwable th) {
                Log.w(TAG, "fail to close", th);
            }
        }
    }

    public static void closeSilently(ParcelFileDescriptor parcelFileDescriptor) {
        if (parcelFileDescriptor != null) {
            try {
                parcelFileDescriptor.close();
            } catch (Throwable th) {
                Log.w(TAG, "fail to close", th);
            }
        }
    }

    public static void closeSilently(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Throwable th) {
                Log.w(TAG, "close fail", th);
            }
        }
    }

    public static int compare(long j, long j2) {
        int i = (j > j2 ? 1 : (j == j2 ? 0 : -1));
        if (i < 0) {
            return -1;
        }
        return i == 0 ? 0 : 1;
    }

    public static String[] copyOf(String[] strArr, int i) {
        String[] strArr2 = new String[i];
        System.arraycopy(strArr, 0, strArr2, 0, Math.min(strArr.length, i));
        return strArr2;
    }

    public static final long crc64Long(String str) {
        if (str == null || str.length() == 0) {
            return 0;
        }
        return crc64Long(getBytes(str));
    }

    public static final long crc64Long(byte[] bArr) {
        long j = -1;
        for (byte b : bArr) {
            j = (j >> 8) ^ sCrcTable[(((int) j) ^ b) & 255];
        }
        return j;
    }

    public static String ensureNotNull(String str) {
        return str == null ? "" : str;
    }

    public static boolean equals(Object obj, Object obj2) {
        return obj == obj2 || (obj != null && obj.equals(obj2));
    }

    public static String escapeXml(String str) {
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt == '\"') {
                sb.append("&quot;");
            } else if (charAt == '<') {
                sb.append("&lt;");
            } else if (charAt != '>') {
                switch (charAt) {
                    case '&':
                        sb.append("&amp;");
                        break;
                    case '\'':
                        sb.append("&#039;");
                        break;
                    default:
                        sb.append(charAt);
                        break;
                }
            } else {
                sb.append("&gt;");
            }
        }
        return sb.toString();
    }

    public static void fail(String str, Object... objArr) {
        if (objArr.length != 0) {
            str = String.format(Locale.ENGLISH, str, objArr);
        }
        throw new AssertionError(str);
    }

    public static int floorLog2(float f) {
        int i = 0;
        while (i < 31 && ((float) (1 << i)) <= f) {
            i++;
        }
        return i - 1;
    }

    public static byte[] getBytes(String str) {
        char[] charArray;
        byte[] bArr = new byte[(str.length() * 2)];
        int i = 0;
        for (char c : str.toCharArray()) {
            int i2 = i + 1;
            bArr[i] = (byte) (c & 255);
            i = i2 + 1;
            bArr[i2] = (byte) (c >> 8);
        }
        return bArr;
    }

    public static String getUserAgent(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            return String.format("%s/%s; %s/%s/%s/%s; %s/%s/%s", new Object[]{packageInfo.packageName, packageInfo.versionName, Build.BRAND, Build.DEVICE, Build.MODEL, Build.ID, VERSION.SDK, VERSION.RELEASE, VERSION.INCREMENTAL});
        } catch (NameNotFoundException e) {
            throw new IllegalStateException("getPackageInfo failed");
        }
    }

    public static boolean handleInterrruptedException(Throwable th) {
        if (!(th instanceof InterruptedIOException) && !(th instanceof InterruptedException)) {
            return false;
        }
        Thread.currentThread().interrupt();
        return true;
    }

    public static float interpolateAngle(float f, float f2, float f3) {
        float f4 = f2 - f;
        if (f4 < 0.0f) {
            f4 += 360.0f;
        }
        if (f4 > 180.0f) {
            f4 -= 360.0f;
        }
        float f5 = f + (f4 * f3);
        return f5 < 0.0f ? f5 + 360.0f : f5;
    }

    public static float interpolateScale(float f, float f2, float f3) {
        return f + (f3 * (f2 - f));
    }

    public static boolean isNullOrEmpty(String str) {
        return TextUtils.isEmpty(str);
    }

    public static boolean isOpaque(int i) {
        return (i >>> 24) == 255;
    }

    public static String maskDebugInfo(Object obj) {
        if (obj == null) {
            return null;
        }
        String obj2 = obj.toString();
        int min = Math.min(obj2.length(), MASK_STRING.length());
        if (!IS_DEBUG_BUILD) {
            obj2 = MASK_STRING.substring(0, min);
        }
        return obj2;
    }

    public static int nextPowerOf2(int i) {
        if (i <= 0 || i > 1073741824) {
            throw new IllegalArgumentException();
        }
        int i2 = i - 1;
        int i3 = i2 | (i2 >> 16);
        int i4 = i3 | (i3 >> 8);
        int i5 = i4 | (i4 >> 4);
        int i6 = i5 | (i5 >> 2);
        return (i6 | (i6 >> 1)) + 1;
    }

    public static float parseFloatSafely(String str, float f) {
        if (str == null) {
            return f;
        }
        try {
            return Float.parseFloat(str);
        } catch (NumberFormatException e) {
            return f;
        }
    }

    public static int parseIntSafely(String str, int i) {
        if (str == null) {
            return i;
        }
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException e) {
            return i;
        }
    }

    public static int prevPowerOf2(int i) {
        if (i > 0) {
            return Integer.highestOneBit(i);
        }
        throw new IllegalArgumentException();
    }

    public static void swap(int[] iArr, int i, int i2) {
        int i3 = iArr[i];
        iArr[i] = iArr[i2];
        iArr[i2] = i3;
    }

    public static void waitWithoutInterrupt(Object obj) {
        try {
            obj.wait();
        } catch (InterruptedException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("unexpected interrupt: ");
            sb.append(obj);
            Log.w(str, sb.toString());
        }
    }
}
