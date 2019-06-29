package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.b.a.C0002a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;

/* compiled from: GifBitmapProvider */
public final class a implements C0002a {
    private final d bm;
    @Nullable
    private final b br;

    public a(d dVar) {
        this(dVar, null);
    }

    public a(d dVar, @Nullable b bVar) {
        this.bm = dVar;
        this.br = bVar;
    }

    @NonNull
    public Bitmap a(int i, int i2, @NonNull Config config) {
        return this.bm.g(i, i2, config);
    }

    public void b(@NonNull int[] iArr) {
        if (this.br != null) {
            this.br.put(iArr);
        }
    }

    public void c(@NonNull Bitmap bitmap) {
        this.bm.d(bitmap);
    }

    public void c(@NonNull byte[] bArr) {
        if (this.br != null) {
            this.br.put(bArr);
        }
    }

    @NonNull
    public byte[] q(int i) {
        return this.br == null ? new byte[i] : (byte[]) this.br.a(i, byte[].class);
    }

    @NonNull
    public int[] r(int i) {
        return this.br == null ? new int[i] : (int[]) this.br.a(i, int[].class);
    }
}
