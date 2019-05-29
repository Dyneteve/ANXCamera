package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import java.security.MessageDigest;

/* compiled from: DataCacheKey */
final class b implements c {
    private final c eJ;
    private final c eO;

    b(c cVar, c cVar2) {
        this.eJ = cVar;
        this.eO = cVar2;
    }

    /* access modifiers changed from: 0000 */
    public c au() {
        return this.eJ;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        if (this.eJ.equals(bVar.eJ) && this.eO.equals(bVar.eO)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return (31 * this.eJ.hashCode()) + this.eO.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("DataCacheKey{sourceKey=");
        sb.append(this.eJ);
        sb.append(", signature=");
        sb.append(this.eO);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        this.eJ.updateDiskCacheKey(messageDigest);
        this.eO.updateDiskCacheKey(messageDigest);
    }
}
