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
    private static final f<Class<?>, byte[]> gT = new f<>(50);
    private final b ap;
    private final c eI;
    private final c eN;
    private final com.bumptech.glide.load.f eP;
    private final Class<?> gU;
    private final i<?> gV;
    private final int height;
    private final int width;

    r(b bVar, c cVar, c cVar2, int i, int i2, i<?> iVar, Class<?> cls, com.bumptech.glide.load.f fVar) {
        this.ap = bVar;
        this.eI = cVar;
        this.eN = cVar2;
        this.width = i;
        this.height = i2;
        this.gV = iVar;
        this.gU = cls;
        this.eP = fVar;
    }

    private byte[] bj() {
        byte[] bArr = (byte[]) gT.get(this.gU);
        if (bArr != null) {
            return bArr;
        }
        byte[] bytes = this.gU.getName().getBytes(dG);
        gT.put(this.gU, bytes);
        return bytes;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        if (this.height == rVar.height && this.width == rVar.width && k.c(this.gV, rVar.gV) && this.gU.equals(rVar.gU) && this.eI.equals(rVar.eI) && this.eN.equals(rVar.eN) && this.eP.equals(rVar.eP)) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        int hashCode = (((((this.eI.hashCode() * 31) + this.eN.hashCode()) * 31) + this.width) * 31) + this.height;
        if (this.gV != null) {
            hashCode = (hashCode * 31) + this.gV.hashCode();
        }
        return (31 * ((hashCode * 31) + this.gU.hashCode())) + this.eP.hashCode();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ResourceCacheKey{sourceKey=");
        sb.append(this.eI);
        sb.append(", signature=");
        sb.append(this.eN);
        sb.append(", width=");
        sb.append(this.width);
        sb.append(", height=");
        sb.append(this.height);
        sb.append(", decodedResourceClass=");
        sb.append(this.gU);
        sb.append(", transformation='");
        sb.append(this.gV);
        sb.append('\'');
        sb.append(", options=");
        sb.append(this.eP);
        sb.append('}');
        return sb.toString();
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        byte[] bArr = (byte[]) this.ap.b(8, byte[].class);
        ByteBuffer.wrap(bArr).putInt(this.width).putInt(this.height).array();
        this.eN.updateDiskCacheKey(messageDigest);
        this.eI.updateDiskCacheKey(messageDigest);
        messageDigest.update(bArr);
        if (this.gV != null) {
            this.gV.updateDiskCacheKey(messageDigest);
        }
        this.eP.updateDiskCacheKey(messageDigest);
        messageDigest.update(bj());
        this.ap.put(bArr);
    }
}
