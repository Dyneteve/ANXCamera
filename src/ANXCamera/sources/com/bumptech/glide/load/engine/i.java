package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.f;
import java.security.MessageDigest;
import java.util.Map;

/* compiled from: EngineKey */
class i implements c {
    private final Class<?> br;
    private final Object bu;
    private final c eO;
    private final f eQ;
    private final Class<?> eS;
    private final Map<Class<?>, com.bumptech.glide.load.i<?>> eU;
    private int hashCode;
    private final int height;
    private final int width;

    i(Object obj, c cVar, int i, int i2, Map<Class<?>, com.bumptech.glide.load.i<?>> map, Class<?> cls, Class<?> cls2, f fVar) {
        this.bu = com.bumptech.glide.util.i.checkNotNull(obj);
        this.eO = (c) com.bumptech.glide.util.i.a(cVar, "Signature must not be null");
        this.width = i;
        this.height = i2;
        this.eU = (Map) com.bumptech.glide.util.i.checkNotNull(map);
        this.eS = (Class) com.bumptech.glide.util.i.a(cls, "Resource class must not be null");
        this.br = (Class) com.bumptech.glide.util.i.a(cls2, "Transcode class must not be null");
        this.eQ = (f) com.bumptech.glide.util.i.checkNotNull(fVar);
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        if (this.bu.equals(iVar.bu) && this.eO.equals(iVar.eO) && this.height == iVar.height && this.width == iVar.width && this.eU.equals(iVar.eU) && this.eS.equals(iVar.eS) && this.br.equals(iVar.br) && this.eQ.equals(iVar.eQ)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        if (this.hashCode == 0) {
            this.hashCode = this.bu.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eO.hashCode();
            this.hashCode = (this.hashCode * 31) + this.width;
            this.hashCode = (this.hashCode * 31) + this.height;
            this.hashCode = (this.hashCode * 31) + this.eU.hashCode();
            this.hashCode = (this.hashCode * 31) + this.eS.hashCode();
            this.hashCode = (this.hashCode * 31) + this.br.hashCode();
            this.hashCode = (31 * this.hashCode) + this.eQ.hashCode();
        }
        return this.hashCode;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("EngineKey{model=");
        sb.append(this.bu);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", resourceClass=");
        sb.append(this.eS);
        sb.append(", transcodeClass=");
        sb.append(this.br);
        sb.append(", signature=");
        sb.append(this.eO);
        sb.append(", hashCode=");
        sb.append(this.hashCode);
        sb.append(", transformations=");
        sb.append(this.eU);
        sb.append(", options=");
        sb.append(this.eQ);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        throw new UnsupportedOperationException();
    }
}
