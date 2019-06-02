package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import com.bumptech.glide.util.c;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamBitmapDecoder */
public class v implements g<InputStream, Bitmap> {
    private final b ef;
    private final n kF;

    /* compiled from: StreamBitmapDecoder */
    static class a implements com.bumptech.glide.load.resource.bitmap.n.a {
        private final RecyclableBufferedInputStream ee;
        private final c lL;

        a(RecyclableBufferedInputStream recyclableBufferedInputStream, c cVar) {
            this.ee = recyclableBufferedInputStream;
            this.lL = cVar;
        }

        public void a(d dVar, Bitmap bitmap) throws IOException {
            IOException eJ = this.lL.eJ();
            if (eJ != null) {
                if (bitmap != null) {
                    dVar.d(bitmap);
                }
                throw eJ;
            }
        }

        public void ct() {
            this.ee.cz();
        }
    }

    public v(n nVar, b bVar) {
        this.kF = nVar;
        this.ef = bVar;
    }

    public p<Bitmap> a(@NonNull InputStream inputStream, int i, int i2, @NonNull f fVar) throws IOException {
        RecyclableBufferedInputStream recyclableBufferedInputStream;
        boolean z;
        if (inputStream instanceof RecyclableBufferedInputStream) {
            recyclableBufferedInputStream = (RecyclableBufferedInputStream) inputStream;
            z = false;
        } else {
            RecyclableBufferedInputStream recyclableBufferedInputStream2 = new RecyclableBufferedInputStream(inputStream, this.ef);
            z = true;
            recyclableBufferedInputStream = recyclableBufferedInputStream2;
        }
        c h = c.h(recyclableBufferedInputStream);
        try {
            return this.kF.a((InputStream) new com.bumptech.glide.util.g(h), i, i2, fVar, (com.bumptech.glide.load.resource.bitmap.n.a) new a(recyclableBufferedInputStream, h));
        } finally {
            h.release();
            if (z) {
                recyclableBufferedInputStream.release();
            }
        }
    }

    public boolean a(@NonNull InputStream inputStream, @NonNull f fVar) {
        return this.kF.e(inputStream);
    }
}
