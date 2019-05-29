package com.bumptech.glide.load.engine;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.c;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.i;
import com.bumptech.glide.util.f;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: ResourceCacheKey */
final class r implements c {
    private static final f<Class<?>, byte[]> gU = new f<>(50);
    private final b aq;
    private final c eJ;
    private final c eO;
    private final com.bumptech.glide.load.f eQ;
    private final Class<?> gV;
    private final i<?> gW;
    private final int height;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.aq = bVar;
        this.eJ = cVar;
        this.eO = cVar2;
        this.width = i;
        this.height = i2;
        this.gW = iVar;
        this.gV = cls;
        this.eQ = fVar;
    }

    private byte[] bj() {
        byte[] bArr = (byte[]) gU.get(this.gV);
        if (bArr != null) {
            return bArr;
        }
        byte[] bytes = this.gV.getName().getBytes(dH);
        gU.put(this.gV, bytes);
        return bytes;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.c(this.gW, rVar.gW) && this.gV.equals(rVar.gV) && this.eJ.equals(rVar.eJ) && this.eO.equals(rVar.eO) && this.eQ.equals(rVar.eQ)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.eJ.hashCode() * 31) + this.eO.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.gW != null) {
            hashCode = (hashCode * 31) + this.gW.hashCode();
        }
        return (31 * ((hashCode * 31) + this.gV.hashCode())) + this.eQ.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ResourceCacheKey{sourceKey=");
        sb.append(this.eJ);
        sb.append(", signature=");
        sb.append(this.eO);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", decodedResourceClass=");
        sb.append(this.gV);
        sb.append(", transformation='");
        sb.append(this.gW);
        sb.append('\'');
        sb.append(", options=");
        sb.append(this.eQ);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.aq.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.eO.updateDiskCacheKey(messageDigest);
        this.eJ.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.gW != null) {
            this.gW.updateDiskCacheKey(messageDigest);
        }
        this.eQ.updateDiskCacheKey(messageDigest);
        messageDigest.update(bj());
        this.aq.put(bArr);
    }
}
