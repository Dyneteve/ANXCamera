package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.security.MessageDigest;

/* compiled from: Options */
public final class f implements c {
    private final ArrayMap<e<?>, Object> dL = new CachedHashCodeArrayMap();

    private static <T> void a(@NonNull e<T> eVar, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        eVar.a(obj, messageDigest);
    }

    @NonNull
    public <T> f a(@NonNull e<T> eVar, @NonNull T t) {
        this.dL.put(eVar, t);
        return this;
    }

    @Nullable
    public <T> T a(@NonNull e<T> eVar) {
        return this.dL.containsKey(eVar) ? this.dL.get(eVar) : eVar.getDefaultValue();
    }

    public void a(@NonNull f fVar) {
        this.dL.putAll(fVar.dL);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof f)) {
            return false;
        }
        return this.dL.equals(((f) obj).dL);
    }

    public int hashCode() {
        return this.dL.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Options{values=");
        sb.append(this.dL);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        for (int i = 0; i < this.dL.size(); i++) {
            a((e) this.dL.keyAt(i), this.dL.valueAt(i), messageDigest);
        }
    }
}
