package com.bumptech.glide.b;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.InputStream;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.nio.ByteBuffer;

/* compiled from: GifDecoder */
public interface a {
    public static final int STATUS_FORMAT_ERROR = 1;
    public static final int STATUS_OK = 0;
    public static final int STATUS_OPEN_ERROR = 2;
    public static final int cc = 3;
    public static final int cd = 0;

    /* compiled from: GifDecoder */
    /* renamed from: com.bumptech.glide.b.a$a reason: collision with other inner class name */
    public interface C0001a {
        @NonNull
        Bitmap a(int i, int i2, @NonNull Config config);

        void b(@NonNull int[] iArr);

        void c(@NonNull Bitmap bitmap);

        void c(@NonNull byte[] bArr);

        @NonNull
        byte[] m(int i);

        @NonNull
        int[] n(int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* compiled from: GifDecoder */
    public @interface b {
    }

    int U();

    int V();

    void W();

    int X();

    int Y();

    int Z();

    int a(@Nullable InputStream inputStream, int i);

    void a(@NonNull Config config);

    void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer);

    void a(@NonNull c cVar, @NonNull ByteBuffer byteBuffer, int i);

    void a(@NonNull c cVar, @NonNull byte[] bArr);

    @Nullable
    Bitmap aa();

    void advance();

    void clear();

    @NonNull
    ByteBuffer getData();

    int getDelay(int i);

    int getFrameCount();

    int getHeight();

    @Deprecated
    int getLoopCount();

    int getStatus();

    int getWidth();

    int read(@Nullable byte[] bArr);
}
