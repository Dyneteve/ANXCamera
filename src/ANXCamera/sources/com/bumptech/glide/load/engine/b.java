package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c eK;
    private final c eP;

    b(c cVar, c cVar2) {
        this.eK = cVar;
        this.eP = cVar2;
    }

    /* access modifiers changed from: 0000 */
    public c au() {
        return this.eK;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.eK.equals(bVar.eK) && this.eP.equals(bVar.eP)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.eK.hashCode()) + this.eP.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DataCacheKey{sourceKey=");
        sb.append(this.eK);
        sb.append(", signature=");
        sb.append(this.eP);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.eK.updateDiskCacheKey(messageDigest);
        this.eP.updateDiskCacheKey(messageDigest);
    }
}
