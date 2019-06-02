package com.bumptech.glide.e;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.util.i;
import java.security.MessageDigest;

/* compiled from: ObjectKey */
public final class d implements c {
    private final Object object;

    public d(@NonNull Object obj) {
        this.object = i.checkNotNull(obj);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof d)) {
            return false;
        }
        return this.object.equals(((d) obj).object);
    }

    public int hashCode() {
        return this.object.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ObjectKey{object=");
        sb.append(this.object);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(this.object.toString().getBytes(dI));
    }
}
