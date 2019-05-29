package com.bumptech.glide.load;

import android.content.Context;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Collection;

/* compiled from: MultiTransformation */
public class d<T> implements i<T> {
    private final Collection<? extends i<T>> dI;

    public d(@NonNull Collection<? extends i<T>> collection) {
        if (!collection.isEmpty()) {
            this.dI = collection;
            return;
        }
        throw new IllegalArgumentException("MultiTransformation must contain at least one Transformation");
    }

    @SafeVarargs
    public d(@NonNull i<T>... iVarArr) {
        if (iVarArr.length != 0) {
            this.dI = Arrays.asList(iVarArr);
            return;
        }
        throw new IllegalArgumentException("MultiTransformation must contain at least one Transformation");
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        return this.dI.equals(((d) obj).dI);
    }

    public int hashCode() {
        return this.dI.hashCode();
    }

    @NonNull
    public p<T> transform(@NonNull Context context, @NonNull p<T> pVar, int i, int i2) {
        p<T> pVar2 = pVar;
        for (i transform : this.dI) {
            p<T> transform2 = transform.transform(context, pVar2, i, i2);
            if (pVar2 != null && !pVar2.equals(pVar) && !pVar2.equals(transform2)) {
                pVar2.recycle();
            }
            pVar2 = transform2;
        }
        return pVar2;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        for (i updateDiskCacheKey : this.dI) {
            updateDiskCacheKey.updateDiskCacheKey(messageDigest);
        }
    }
}
