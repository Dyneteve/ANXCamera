package com.bumptech.glide.load;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.bumptech.glide.util.CachedHashCodeArrayMap;
import java.security.MessageDigest;

/* compiled from: Options */
public final class f implements c {
    private final ArrayMap<e<?>, Object> dM = new CachedHashCodeArrayMap();

    private static <T> void a(@NonNull e<T> eVar, @NonNull Object obj, @NonNull MessageDigest messageDigest) {
        eVar.a(obj, messageDigest);
    }

    @NonNull
    public <T> f a(@NonNull e<T> eVar, @NonNull T t) {
        this.dM.put(eVar, t);
        return this;
    }

    @Nullable
    public <T> T a(@NonNull e<T> eVar) {
        return this.dM.containsKey(eVar) ? this.dM.get(eVar) : eVar.getDefaultValue();
    }

    public void a(@NonNull f fVar) {
        this.dM.putAll(fVar.dM);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof f)) {
            return false;
        }
        return this.dM.equals(((f) obj).dM);
    }

    public int hashCode() {
        return this.dM.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Options{values=");
        sb.append(this.dM);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        for (int i = 0; i < this.dM.size(); i++) {
            a((e) this.dM.keyAt(i), this.dM.valueAt(i), messageDigest);
        }
    }
}
