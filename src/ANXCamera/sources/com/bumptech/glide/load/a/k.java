package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int ed = 5242880;
    private final RecyclableBufferedInputStream ee;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b ef;

        public a(b bVar) {
            this.ef = bVar;
        }

        @NonNull
        public Class<InputStream> aj() {
            return InputStream.class;
        }

        @NonNull
        /* renamed from: c */
        public e<InputStream> l(InputStream inputStream) {
            return new k(inputStream, this.ef);
        }
    }

    k(InputStream inputStream, b bVar) {
        this.ee = new RecyclableBufferedInputStream(inputStream, bVar);
        this.ee.mark(ed);
    }

    @NonNull
    /* renamed from: an */
    public InputStream am() throws IOException {
        this.ee.reset();
        return this.ee;
    }

    public void cleanup() {
        this.ee.release();
    }
}
