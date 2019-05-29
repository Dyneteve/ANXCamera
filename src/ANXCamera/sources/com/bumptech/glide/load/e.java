package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.util.i;
import java.security.MessageDigest;

/* compiled from: Option */
public final class e<T> {
    private static final a<Object> dJ = new a<Object>() {
        public void a(@NonNull byte[] bArr, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        }
    };
    private final a<T> dK;
    private volatile byte[] dL;
    private final T defaultValue;
    private final String key;

    /* compiled from: Option */
    public interface a<T> {
        void a(@NonNull byte[] bArr, @NonNull T t, @NonNull MessageDigest messageDigest);
    }

    private e(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        this.key = i.H(str);
        this.defaultValue = t;
        this.dK = (a) i.checkNotNull(aVar);
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull a<T> aVar) {
        return new e<>(str, null, aVar);
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull T t) {
        return new e<>(str, t, ai());
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        return new e<>(str, t, aVar);
    }

    @NonNull
    private byte[] ah() {
        if (this.dL == null) {
            this.dL = this.key.getBytes(c.dH);
        }
        return this.dL;
    }

    @NonNull
    private static <T> a<T> ai() {
        return dJ;
    }

    @NonNull
    public static <T> e<T> q(@NonNull String str) {
        return new e<>(str, null, ai());
    }

    public void a(@NonNull T t, @NonNull MessageDigest messageDigest) {
        this.dK.a(ah(), t, messageDigest);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof e)) {
            return false;
        }
        return this.key.equals(((e) obj).key);
    }

    @Nullable
    public T getDefaultValue() {
        return this.defaultValue;
    }

    public int hashCode() {
        return this.key.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Option{key='");
        sb.append(this.key);
        sb.append('\'');
        sb.append('}');
        return sb.toString();
    }
}
