package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> bs;
    private final Object bv;
    private final c eP;
    private final f eR;
    private final Class<?> eT;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> eV;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.bv = com.bumptech.glide.util.i.checkNotNull(obj);
        this.eP = (c) com.bumptech.glide.util.i.a(cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.eV = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.eT = (Class) com.bumptech.glide.util.i.a(cls, "Resource class must not be null");
        this.bs = (Class) com.bumptech.glide.util.i.a(cls2, "Transcode class must not be null");
        this.eR = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.bv.equals(iVar.bv) && this.eP.equals(iVar.eP) && this.height == iVar.height && this.width == iVar.width && this.eV.equals(iVar.eV) && this.eT.equals(iVar.eT) && this.bs.equals(iVar.bs) && this.eR.equals(iVar.eR)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.bv.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eP.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.eV.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eT.hashCode();
            this.hashCode = (this.hashCode * 31) + this.bs.hashCode();
            this.hashCode = (31 * this.hashCode) + this.eR.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineKey{model=");
        sb.append(this.bv);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", resourceClass=");
        sb.append(this.eT);
        sb.append(", transcodeClass=");
        sb.append(this.bs);
        sb.append(", signature=");
        sb.append(this.eP);
        sb.append(", hashCode=");
        sb.append(this.hashCode);
        sb.append(", transformations=");
        sb.append(this.eV);
        sb.append(", options=");
        sb.append(this.eR);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
