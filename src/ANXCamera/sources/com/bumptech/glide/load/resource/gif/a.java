package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.b.a.C0003a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;

/* compiled from: GifBitmapProvider */
public final class a implements C0003a {
    private final d am;
    @Nullable
    private final b ar;

    public a(d dVar) {
        this(dVar, null);
    }

    public a(d dVar, @Nullable b bVar) {
        this.am = dVar;
        this.ar = bVar;
    }

    @NonNull
    public Bitmap a(int i, int i2, @NonNull Config config) {
        return this.am.g(i, i2, config);
    }

    public void b(@NonNull int[] iArr) {
        if (this.ar != null) {
            this.ar.put(iArr);
        }
    }

    public void c(@NonNull Bitmap bitmap) {
        this.am.d(bitmap);
    }

    public void c(@NonNull byte[] bArr) {
        if (this.ar != null) {
            this.ar.put(bArr);
        }
    }

    @NonNull
    public byte[] m(int i) {
        return this.ar == null ? new byte[i] : (byte[]) this.ar.a(i, byte[].class);
    }

    @NonNull
    public int[] n(int i) {
        return this.ar == null ? new int[i] : (int[]) this.ar.a(i, int[].class);
    }
}
