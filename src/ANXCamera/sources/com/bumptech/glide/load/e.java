package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.util.i;
import java.security.MessageDigest;

/* compiled from: Option */
public final class e<T> {
    private static final a<Object> eK = new a<Object>() {
        public void a(@NonNull byte[] bArr, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        }
    };
    private final T defaultValue;
    private final a<T> eL;
    private volatile byte[] eM;
    private final String key;

    /* compiled from: Option */
    public interface a<T> {
        void a(@NonNull byte[] bArr, @NonNull T t, @NonNull MessageDigest messageDigest);
    }

    private e(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        this.key = i.H(str);
        this.defaultValue = t;
        this.eL = (a) i.checkNotNull(aVar);
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull a<T> aVar) {
        return new e<>(str, null, aVar);
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @NonNull T t) {
        return new e<>(str, t, aI());
    }

    @NonNull
    public static <T> e<T> a(@NonNull String str, @Nullable T t, @NonNull a<T> aVar) {
        return new e<>(str, t, aVar);
    }

    @NonNull
    private byte[] aH() {
        if (this.eM == null) {
            this.eM = this.key.getBytes(c.eI);
        }
        return this.eM;
    }

    @NonNull
    private static <T> a<T> aI() {
        return eK;
    }

    @NonNull
    public static <T> e<T> q(@NonNull String str) {
        return new e<>(str, null, aI());
    }

    public void a(@NonNull T t, @NonNull MessageDigest messageDigest) {
        this.eL.a(aH(), t, messageDigest);
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
