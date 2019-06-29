package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c fK;
    private final c fP;

    b(c cVar, c cVar2) {
        this.fK = cVar;
        this.fP = cVar2;
    }

    /* access modifiers changed from: 0000 */
    public c aU() {
        return this.fK;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.fK.equals(bVar.fK) && this.fP.equals(bVar.fP)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.fK.hashCode()) + this.fP.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DataCacheKey{sourceKey=");
        sb.append(this.fK);
        sb.append(", signature=");
        sb.append(this.fP);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.fK.updateDiskCacheKey(messageDigest);
        this.fP.updateDiskCacheKey(messageDigest);
    }
}
