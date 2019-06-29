package com.bumptech.glide.load.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: InputStreamRewinder */
public final class k implements e<InputStream> {
    private static final int fd = 5242880;
    private final RecyclableBufferedInputStream fe;

    /* compiled from: InputStreamRewinder */
    public static final class a implements com.bumptech.glide.load.a.e.a<InputStream> {
        private final b ff;

        public a(b bVar) {
            this.ff = bVar;
        }

        @NonNull
        public Class<InputStream> aJ() {
            return InputStream.class;
        }

        @NonNull
        /* renamed from: d */
        public e<InputStream> o(InputStream inputStream) {
            return new k(inputStream, this.ff);
        }
    }

    k(InputStream inputStream, b bVar) {
        this.fe = new RecyclableBufferedInputStream(inputStream, bVar);
        this.fe.mark(fd);
    }

    @NonNull
    /* renamed from: aN */
    public InputStream aM() throws IOException {
        this.fe.reset();
        return this.fe;
    }

    public void cleanup() {
        this.fe.release();
    }
}
