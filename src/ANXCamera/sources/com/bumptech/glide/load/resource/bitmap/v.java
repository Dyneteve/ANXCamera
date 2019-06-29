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
    private final b ff;
    private final n lE;

    /* compiled from: StreamBitmapDecoder */
    static class a implements com.bumptech.glide.load.resource.bitmap.n.a {
        private final RecyclableBufferedInputStream fe;
        private final c mL;

        a(RecyclableBufferedInputStream recyclableBufferedInputStream, c cVar) {
            this.fe = recyclableBufferedInputStream;
            this.mL = cVar;
        }

        public void a(d dVar, Bitmap bitmap) throws IOException {
            IOException fl = this.mL.fl();
            if (fl != null) {
                if (bitmap != null) {
                    dVar.d(bitmap);
                }
                throw fl;
            }
        }

        public void cV() {
            this.fe.db();
        }
    }

    public v(n nVar, b bVar) {
        this.lE = nVar;
        this.ff = bVar;
    }

    public p<Bitmap> a(@NonNull InputStream inputStream, int i, int i2, @NonNull f fVar) throws IOException {
        RecyclableBufferedInputStream recyclableBufferedInputStream;
        boolean z;
        if (inputStream instanceof RecyclableBufferedInputStream) {
            recyclableBufferedInputStream = (RecyclableBufferedInputStream) inputStream;
            z = false;
        } else {
            RecyclableBufferedInputStream recyclableBufferedInputStream2 = new RecyclableBufferedInputStream(inputStream, this.ff);
            z = true;
            recyclableBufferedInputStream = recyclableBufferedInputStream2;
        }
        c i3 = c.i(recyclableBufferedInputStream);
        try {
            return this.lE.a((InputStream) new com.bumptech.glide.util.g(i3), i, i2, fVar, (com.bumptech.glide.load.resource.bitmap.n.a) new a(recyclableBufferedInputStream, i3));
        } finally {
            i3.release();
            if (z) {
                recyclableBufferedInputStream.release();
            }
        }
    }

    public boolean a(@NonNull InputStream inputStream, @NonNull f fVar) {
        return this.lE.f(inputStream);
    }
}
