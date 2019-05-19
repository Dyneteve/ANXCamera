package com.bumptech.glide.load.resource.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.e;
import java.nio.ByteBuffer;

/* compiled from: ByteBufferRewinder */
public class a implements e<ByteBuffer> {
    private final ByteBuffer buffer;

    /* compiled from: ByteBufferRewinder */
    /* renamed from: com.bumptech.glide.load.resource.a.a$a reason: collision with other inner class name */
    public static class C0008a implements com.bumptech.glide.load.a.e.a<ByteBuffer> {
        @NonNull
        public Class<ByteBuffer> aj() {
            return ByteBuffer.class;
        }

        @NonNull
        /* renamed from: d */
        public e<ByteBuffer> l(ByteBuffer byteBuffer) {
            return new a(byteBuffer);
        }
    }

    public a(ByteBuffer byteBuffer) {
        this.buffer = byteBuffer;
    }

    @NonNull
    /* renamed from: cC */
    public ByteBuffer am() {
        this.buffer.position(0);
        return this.buffer;
    }

    public void cleanup() {
    }
}
