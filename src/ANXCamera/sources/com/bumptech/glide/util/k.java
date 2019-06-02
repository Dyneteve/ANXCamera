package com.bumptech.glide.util;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.os.Build.VERSION;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.model.l;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Queue;

/* compiled from: Util */
public final class k {
    private static final int qc = 31;
    private static final int qe = 17;
    private static final char[] qf = "0123456789abcdef".toCharArray();
    private static final char[] qg = new char[64];

    /* compiled from: Util */
    /* renamed from: com.bumptech.glide.util.k$1 reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] hL = new int[Config.values().length];

        static {
            try {
                hL[Config.ALPHA_8.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                hL[Config.RGB_565.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                hL[Config.ARGB_4444.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                hL[Config.RGBA_F16.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                hL[Config.ARGB_8888.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    private k() {
    }

    private static boolean X(int i) {
        return i > 0 || i == Integer.MIN_VALUE;
    }

    @NonNull
    public static <T> Queue<T> Y(int i) {
        return new ArrayDeque(i);
    }

    public static int a(float f, int i) {
        return t(Float.floatToIntBits(f), i);
    }

    public static int a(@Nullable Object obj, int i) {
        return t(obj == null ? 0 : obj.hashCode(), i);
    }

    public static int a(boolean z, int i) {
        return t(z ? 1 : 0, i);
    }

    @NonNull
    private static String a(@NonNull byte[] bArr, @NonNull char[] cArr) {
        for (int i = 0; i < bArr.length; i++) {
            byte b = bArr[i] & -1;
            int i2 = i * 2;
            cArr[i2] = qf[b >>> 4];
            cArr[i2 + 1] = qf[b & 15];
        }
        return new String(cArr);
    }

    @NonNull
    public static <T> List<T> c(@NonNull Collection<T> collection) {
        ArrayList arrayList = new ArrayList(collection.size());
        for (Object next : collection) {
            if (next != null) {
                arrayList.add(next);
            }
        }
        return arrayList;
    }

    public static boolean c(@Nullable Object obj, @Nullable Object obj2) {
        return obj == null ? obj2 == null : obj.equals(obj2);
    }

    public static boolean d(@Nullable Object obj, @Nullable Object obj2) {
        if (obj != null) {
            return obj instanceof l ? ((l) obj).r(obj2) : obj.equals(obj2);
        }
        return obj2 == null;
    }

    public static void eL() {
        if (!eN()) {
            throw new IllegalArgumentException("You must call this method on the main thread");
        }
    }

    public static void eM() {
        if (!eO()) {
            throw new IllegalArgumentException("You must call this method on a background thread");
        }
    }

    public static boolean eN() {
        return Looper.myLooper() == Looper.getMainLooper();
    }

    public static boolean eO() {
        return !eN();
    }

    private static int f(@Nullable Config config) {
        if (config == null) {
            config = Config.ARGB_8888;
        }
        switch (AnonymousClass1.hL[config.ordinal()]) {
            case 1:
                return 1;
            case 2:
            case 3:
                return 2;
            case 4:
                return 8;
            default:
                return 4;
        }
    }

    @Deprecated
    public static int f(@NonNull Bitmap bitmap) {
        return p(bitmap);
    }

    public static int hashCode(float f) {
        return a(f, 17);
    }

    public static int hashCode(int i) {
        return t(i, 17);
    }

    public static int hashCode(boolean z) {
        return a(z, 17);
    }

    public static int i(int i, int i2, @Nullable Config config) {
        return i * i2 * f(config);
    }

    @NonNull
    public static String j(@NonNull byte[] bArr) {
        String a;
        synchronized (qg) {
            a = a(bArr, qg);
        }
        return a;
    }

    @TargetApi(19)
    public static int p(@NonNull Bitmap bitmap) {
        if (!bitmap.isRecycled()) {
            if (VERSION.SDK_INT >= 19) {
                try {
                    return bitmap.getAllocationByteCount();
                } catch (NullPointerException e) {
                }
            }
            return bitmap.getHeight() * bitmap.getRowBytes();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot obtain size for recycled Bitmap: ");
        sb.append(bitmap);
        sb.append("[");
        sb.append(bitmap.getWidth());
        sb.append("x");
        sb.append(bitmap.getHeight());
        sb.append("] ");
        sb.append(bitmap.getConfig());
        throw new IllegalStateException(sb.toString());
    }

    public static boolean s(int i, int i2) {
        return X(i) && X(i2);
    }

    public static int t(int i, int i2) {
        return (i2 * 31) + i;
    }
}
