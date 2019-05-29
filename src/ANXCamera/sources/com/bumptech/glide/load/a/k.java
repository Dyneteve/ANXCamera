package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int ec = 5242880;
    private final RecyclableBufferedInputStream ed;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b ee;

        public a(b bVar) {
            this.ee = bVar;
        }

        @NonNull
        public Class<InputStream> aj() {
            return InputStream.class;
        }

        @NonNull
        /* renamed from: c */
        public e<InputStream> l(InputStream inputStream) {
            return new k(inputStream, this.ee);
        }
    }

    k(InputStream inputStream, b bVar) {
        this.ed = new RecyclableBufferedInputStream(inputStream, bVar);
        this.ed.mark(ec);
    }

    @NonNull
    /* renamed from: an */
    public InputStream am() throws IOException {
        this.ed.reset();
        return this.ed;
    }

    public void cleanup() {
        this.ed.release();
    }
}
