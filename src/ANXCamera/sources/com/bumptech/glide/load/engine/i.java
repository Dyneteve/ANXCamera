package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> bq;
    private final Object bt;
    private final c eN;
    private final f eP;
    private final Class<?> eR;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> eT;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.bt = com.bumptech.glide.util.i.checkNotNull(obj);
        this.eN = (c) com.bumptech.glide.util.i.a(cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.eT = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.eR = (Class) com.bumptech.glide.util.i.a(cls, "Resource class must not be null");
        this.bq = (Class) com.bumptech.glide.util.i.a(cls2, "Transcode class must not be null");
        this.eP = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.bt.equals(iVar.bt) && this.eN.equals(iVar.eN) && this.height == iVar.height && this.width == iVar.width && this.eT.equals(iVar.eT) && this.eR.equals(iVar.eR) && this.bq.equals(iVar.bq) && this.eP.equals(iVar.eP)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.bt.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eN.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.eT.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eR.hashCode();
            this.hashCode = (this.hashCode * 31) + this.bq.hashCode();
            this.hashCode = (31 * this.hashCode) + this.eP.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineKey{model=");
        sb.append(this.bt);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", resourceClass=");
        sb.append(this.eR);
        sb.append(", transcodeClass=");
        sb.append(this.bq);
        sb.append(", signature=");
        sb.append(this.eN);
        sb.append(", hashCode=");
        sb.append(this.hashCode);
        sb.append(", transformations=");
        sb.append(this.eT);
        sb.append(", options=");
        sb.append(this.eP);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
