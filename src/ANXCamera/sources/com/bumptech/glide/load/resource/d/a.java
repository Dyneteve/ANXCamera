package com.bumptech.glide.load.resource.d;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.resource.a.b;
import java.io.ByteArrayOutputStream;

/* compiled from: BitmapBytesTranscoder */
public class a implements e<Bitmap, byte[]> {
    private final CompressFormat nM;
    private final int quality;

    public a() {
        this(CompressFormat.JPEG, 100);
    }

    public a(@NonNull CompressFormat compressFormat, int i) {
        this.nM = compressFormat;
        this.quality = i;
    }

    @Nullable
    public p<byte[]> a(@NonNull p<Bitmap> pVar, @NonNull f fVar) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ((Bitmap) pVar.get()).compress(this.nM, this.quality, byteArrayOutputStream);
        pVar.recycle();
        return new b(byteArrayOutputStream.toByteArray());
    }
}
