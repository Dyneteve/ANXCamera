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
    private static final byte[] kG = ID.getBytes(dI);
    private final int lK;

    public u(int i) {
        i.a(i > 0, "roundingRadius must be greater than 0.");
        this.lK = i;
    }

    public boolean equals(Object obj) {
        boolean z = false;
        if (!(obj instanceof u)) {
            return false;
        }
        if (this.lK == ((u) obj).lK) {
            z = true;
        }
        return z;
    }

    public int hashCode() {
        return k.t(ID.hashCode(), k.hashCode(this.lK));
    }

    /* access modifiers changed from: protected */
    public Bitmap transform(@NonNull d dVar, @NonNull Bitmap bitmap, int i, int i2) {
        return w.b(dVar, bitmap, this.lK);
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
        messageDigest.update(kG);
        messageDigest.update(ByteBuffer.allocate(4).putInt(this.lK).array());
    }
}
