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
    private static final f<Class<?>, byte[]> hV = new f<>(50);
    private final b br;
    private final c fK;
    private final c fP;
    private final com.bumptech.glide.load.f fR;
    private final Class<?> hW;
    private final i<?> hX;
    private final int height;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.br = bVar;
        this.fK = cVar;
        this.fP = cVar2;
        this.width = i;
        this.height = i2;
        this.hX = iVar;
        this.hW = cls;
        this.fR = fVar;
    }

    private byte[] bK() {
        byte[] bArr = (byte[]) hV.get(this.hW);
        if (bArr != null) {
            return bArr;
        }
        byte[] bytes = this.hW.getName().getBytes(eI);
        hV.put(this.hW, bytes);
        return bytes;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.d(this.hX, rVar.hX) && this.hW.equals(rVar.hW) && this.fK.equals(rVar.fK) && this.fP.equals(rVar.fP) && this.fR.equals(rVar.fR)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.fK.hashCode() * 31) + this.fP.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.hX != null) {
            hashCode = (hashCode * 31) + this.hX.hashCode();
        }
        return (31 * ((hashCode * 31) + this.hW.hashCode())) + this.fR.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ResourceCacheKey{sourceKey=");
        sb.append(this.fK);
        sb.append(", signature=");
        sb.append(this.fP);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", decodedResourceClass=");
        sb.append(this.hW);
        sb.append(", transformation='");
        sb.append(this.hX);
        sb.append('\'');
        sb.append(", options=");
        sb.append(this.fR);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.br.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.fP.updateDiskCacheKey(messageDigest);
        this.fK.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.hX != null) {
            this.hX.updateDiskCacheKey(messageDigest);
        }
        this.fR.updateDiskCacheKey(messageDigest);
        messageDigest.update(bK());
        this.br.put(bArr);
    }
}
