package com.bumptech.glide.e;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: MediaStoreSignature */
public class c implements com.bumptech.glide.load.c {
    @NonNull
    private final String mimeType;
    private final int orientation;
    private final long pN;

    public c(@Nullable String str, long j, int i) {
        if (str == null) {
            str = "";
        }
        this.mimeType = str;
        this.pN = j;
        this.orientation = i;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        return this.pN == cVar.pN && this.orientation == cVar.orientation && this.mimeType.equals(cVar.mimeType);
    }

    public int hashCode() {
        return (31 * ((this.mimeType.hashCode() * 31) + ((int) (this.pN ^ (this.pN >>> 32))))) + this.orientation;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(ByteBuffer.allocate(12).putLong(this.pN).putInt(this.orientation).array());
        messageDigest.update(this.mimeType.getBytes(dI));
    }
}
