package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int eb = 5242880;
    private final RecyclableBufferedInputStream ec;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b ed;

        public a(b bVar) {
            this.ed = bVar;
        }

        @NonNull
        public Class<InputStream> aj() {
            return InputStream.class;
        }

        @NonNull
        /* renamed from: c */
        public e<InputStream> l(InputStream inputStream) {
            return new k(inputStream, this.ed);
        }
    }

    k(InputStream inputStream, b bVar) {
        this.ec = new RecyclableBufferedInputStream(inputStream, bVar);
        this.ec.mark(eb);
    }

    @NonNull
    /* renamed from: an */
    public InputStream am() throws IOException {
        this.ec.reset();
        return this.ec;
    }

    public void cleanup() {
        this.ec.release();
    }
}
