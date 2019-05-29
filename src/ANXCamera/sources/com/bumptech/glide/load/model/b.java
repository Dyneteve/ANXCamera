package com.bumptech.glide.load.model;

import android.support.annotation.NonNull;
import com.bumptech.glide.Priority;
import com.bumptech.glide.load.DataSource;
import com.bumptech.glide.load.f;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* compiled from: ByteArrayLoader */
public class b<Data> implements m<byte[], Data> {
    private final C0006b<Data> jt;

    /* compiled from: ByteArrayLoader */
    public static class a implements n<byte[], ByteBuffer> {
        @NonNull
        public m<byte[], ByteBuffer> a(@NonNull q qVar) {
            return new b(new C0006b<ByteBuffer>() {
                public Class<ByteBuffer> aj() {
                    return ByteBuffer.class;
                }

                /* renamed from: g */
                public ByteBuffer h(byte[] bArr) {
                    return ByteBuffer.wrap(bArr);
                }
            });
        }

        public void bX() {
        }
    }

    /* compiled from: ByteArrayLoader */
    /* renamed from: com.bumptech.glide.load.model.b$b reason: collision with other inner class name */
    public interface C0006b<Data> {
        Class<Data> aj();

        Data h(byte[] bArr);
    }

    /* compiled from: ByteArrayLoader */
    private static class c<Data> implements com.bumptech.glide.load.a.d<Data> {
        private final C0006b<Data> jt;
        private final byte[] jv;

        c(byte[] bArr, C0006b<Data> bVar) {
            this.jv = bArr;
            this.jt = bVar;
        }

        public void a(@NonNull Priority priority, @NonNull com.bumptech.glide.load.a.d.a<? super Data> aVar) {
            aVar.k(this.jt.h(this.jv));
        }

        @NonNull
        public Class<Data> aj() {
            return this.jt.aj();
        }

        @NonNull
        public DataSource ak() {
            return DataSource.LOCAL;
        }

        public void cancel() {
        }

        public void cleanup() {
        }
    }

    /* compiled from: ByteArrayLoader */
    public static class d implements n<byte[], InputStream> {
        @NonNull
        public m<byte[], InputStream> a(@NonNull q qVar) {
            return new b(new C0006b<InputStream>() {
                public Class<InputStream> aj() {
                    return InputStream.class;
                }

                /* renamed from: i */
                public InputStream h(byte[] bArr) {
                    return new ByteArrayInputStream(bArr);
                }
            });
        }

        public void bX() {
        }
    }

    public b(C0006b<Data> bVar) {
        this.jt = bVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull byte[] bArr, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(bArr), new c(bArr, this.jt));
    }

    /* renamed from: f */
    public boolean q(@NonNull byte[] bArr) {
        return true;
    }
}
