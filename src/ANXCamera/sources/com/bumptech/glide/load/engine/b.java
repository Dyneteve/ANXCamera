package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c eI;
    private final c eN;

    b(c cVar, c cVar2) {
        this.eI = cVar;
        this.eN = cVar2;
    }

    /* access modifiers changed from: 0000 */
    public c au() {
        return this.eI;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.eI.equals(bVar.eI) && this.eN.equals(bVar.eN)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.eI.hashCode()) + this.eN.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DataCacheKey{sourceKey=");
        sb.append(this.eI);
        sb.append(", signature=");
        sb.append(this.eN);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.eI.updateDiskCacheKey(messageDigest);
        this.eN.updateDiskCacheKey(messageDigest);
    }
}
