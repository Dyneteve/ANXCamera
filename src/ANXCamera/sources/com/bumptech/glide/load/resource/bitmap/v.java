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
    private final b ed;
    private final n kD;

    /* compiled from: StreamBitmapDecoder */
    static class a implements com.bumptech.glide.load.resource.bitmap.n.a {
        private final RecyclableBufferedInputStream ec;
        private final c lJ;

        a(RecyclableBufferedInputStream recyclableBufferedInputStream, c cVar) {
            this.ec = recyclableBufferedInputStream;
            this.lJ = cVar;
        }

        public void a(d dVar, Bitmap bitmap) throws IOException {
            IOException eJ = this.lJ.eJ();
            if (eJ != null) {
                if (bitmap != null) {
                    dVar.d(bitmap);
                }
                throw eJ;
            }
        }

        public void ct() {
            this.ec.cz();
        }
    }

    public v(n nVar, b bVar) {
        this.kD = nVar;
        this.ed = bVar;
    }

    public p<Bitmap> a(@NonNull InputStream inputStream, int i, int i2, @NonNull f fVar) throws IOException {
        RecyclableBufferedInputStream recyclableBufferedInputStream;
        boolean z;
        if (inputStream instanceof RecyclableBufferedInputStream) {
            recyclableBufferedInputStream = (RecyclableBufferedInputStream) inputStream;
            z = false;
        } else {
            RecyclableBufferedInputStream recyclableBufferedInputStream2 = new RecyclableBufferedInputStream(inputStream, this.ed);
            z = true;
            recyclableBufferedInputStream = recyclableBufferedInputStream2;
        }
        c h = c.h(recyclableBufferedInputStream);
        try {
            return this.kD.a((InputStream) new com.bumptech.glide.util.g(h), i, i2, fVar, (com.bumptech.glide.load.resource.bitmap.n.a) new a(recyclableBufferedInputStream, h));
        } finally {
            h.release();
            if (z) {
                recyclableBufferedInputStream.release();
            }
        }
    }

    public boolean a(@NonNull InputStream inputStream, @NonNull f fVar) {
        return this.kD.e(inputStream);
    }
}
