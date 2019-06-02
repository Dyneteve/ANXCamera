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
    private static final f<Class<?>, byte[]> gV = new f<>(50);
    private final b ar;
    private final c eK;
    private final c eP;
    private final com.bumptech.glide.load.f eR;
    private final Class<?> gW;
    private final i<?> gX;
    private final int height;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.ar = bVar;
        this.eK = cVar;
        this.eP = cVar2;
        this.width = i;
        this.height = i2;
        this.gX = iVar;
        this.gW = cls;
        this.eR = fVar;
    }

    private byte[] bj() {
        byte[] bArr = (byte[]) gV.get(this.gW);
        if (bArr != null) {
            return bArr;
        }
        byte[] bytes = this.gW.getName().getBytes(dI);
        gV.put(this.gW, bytes);
        return bytes;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.c(this.gX, rVar.gX) && this.gW.equals(rVar.gW) && this.eK.equals(rVar.eK) && this.eP.equals(rVar.eP) && this.eR.equals(rVar.eR)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.eK.hashCode() * 31) + this.eP.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.gX != null) {
            hashCode = (hashCode * 31) + this.gX.hashCode();
        }
        return (31 * ((hashCode * 31) + this.gW.hashCode())) + this.eR.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ResourceCacheKey{sourceKey=");
        sb.append(this.eK);
        sb.append(", signature=");
        sb.append(this.eP);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", decodedResourceClass=");
        sb.append(this.gW);
        sb.append(", transformation='");
        sb.append(this.gX);
        sb.append('\'');
        sb.append(", options=");
        sb.append(this.eR);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.ar.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.eP.updateDiskCacheKey(messageDigest);
        this.eK.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.gX != null) {
            this.gX.updateDiskCacheKey(messageDigest);
        }
        this.eR.updateDiskCacheKey(messageDigest);
        messageDigest.update(bj());
        this.ar.put(bArr);
    }
}
