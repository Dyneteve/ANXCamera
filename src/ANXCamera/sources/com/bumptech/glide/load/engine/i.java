package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> cv;
    private final Object cy;
    private final c fP;
    private final f fR;
    private final Class<?> fT;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> fV;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.cy = com.bumptech.glide.util.i.checkNotNull(obj);
        this.fP = (c) com.bumptech.glide.util.i.a(cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.fV = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.fT = (Class) com.bumptech.glide.util.i.a(cls, "Resource class must not be null");
        this.cv = (Class) com.bumptech.glide.util.i.a(cls2, "Transcode class must not be null");
        this.fR = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.cy.equals(iVar.cy) && this.fP.equals(iVar.fP) && this.height == iVar.height && this.width == iVar.width && this.fV.equals(iVar.fV) && this.fT.equals(iVar.fT) && this.cv.equals(iVar.cv) && this.fR.equals(iVar.fR)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.cy.hashCode();
            this.hashCode = (this.hashCode * 31) + this.fP.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.fV.hashCode();
            this.hashCode = (this.hashCode * 31) + this.fT.hashCode();
            this.hashCode = (this.hashCode * 31) + this.cv.hashCode();
            this.hashCode = (31 * this.hashCode) + this.fR.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineKey{model=");
        sb.append(this.cy);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", resourceClass=");
        sb.append(this.fT);
        sb.append(", transcodeClass=");
        sb.append(this.cv);
        sb.append(", signature=");
        sb.append(this.fP);
        sb.append(", hashCode=");
        sb.append(this.hashCode);
        sb.append(", transformations=");
        sb.append(this.fV);
        sb.append(", options=");
        sb.append(this.fR);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
