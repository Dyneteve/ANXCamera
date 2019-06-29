package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.util.i;
import com.bumptech.glide.util.k;
import java.nio.ByteBuffer;
import java.security.MessageDigest;

/* compiled from: RoundedCorners */
public final class u extends g {
    private static final String ID = "com.bumptech.glide.load.resource.bitmap.RoundedCorners";
    private static final byte[] lF = ID.getBytes(eI);
    private final int mK;

    public u(int i) {
        i.a(i > 0, "roundingRadius must be greater than 0.");
        this.mK = i;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof u)) {
            return false;
        }
        if (this.mK == ((u) obj).mK) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return k.u(ID.hashCode(), k.hashCode(this.mK));
    }

    /* access modifiers changed from: protected */
    public Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return w.b(dVar, bitmap, this.mK);
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(lF);
        messageDigest.update(ByteBuffer.allocate(4).putInt(this.mK).array());
    }
}
