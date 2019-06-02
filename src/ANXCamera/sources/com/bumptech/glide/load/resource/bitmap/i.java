package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.a;
import java.io.IOException;
import java.nio.ByteBuffer;

/* compiled from: ByteBufferBitmapDecoder */
public class i implements g<ByteBuffer, Bitmap> {
    private final n kF;

    public i(n nVar) {
        this.kF = nVar;
    }

    public p<Bitmap> a(@NonNull ByteBuffer byteBuffer, int i, int i2, @NonNull f fVar) throws IOException {
        return this.kF.a(a.g(byteBuffer), i, i2, fVar);
    }

    public boolean a(@NonNull ByteBuffer byteBuffer, @NonNull f fVar) {
        return this.kF.c(byteBuffer);
    }
}
