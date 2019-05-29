package com.bumptech.glide.load.resource.gif;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.b.a.C0001a;
import com.bumptech.glide.load.engine.bitmap_recycle.b;
import com.bumptech.glide.load.engine.bitmap_recycle.d;

/* compiled from: GifBitmapProvider */
public final class a implements C0001a {
    private final d al;
    @Nullable
    private final b aq;

    public a(d dVar) {
        this(dVar, null);
    }

    public a(d dVar, @Nullable b bVar) {
        this.al = dVar;
        this.aq = bVar;
    }

    @NonNull
    public Bitmap a(int i, int i2, @NonNull Config config) {
        return this.al.g(i, i2, config);
    }

    public void b(@NonNull int[] iArr) {
        if (this.aq != null) {
            this.aq.put(iArr);
        }
    }

    public void c(@NonNull Bitmap bitmap) {
        this.al.d(bitmap);
    }

    public void c(@NonNull byte[] bArr) {
        if (this.aq != null) {
            this.aq.put(bArr);
        }
    }

    @NonNull
    public byte[] m(int i) {
        return this.aq == null ? new byte[i] : (byte[]) this.aq.a(i, byte[].class);
    }

    @NonNull
    public int[] n(int i) {
        return this.aq == null ? new int[i] : (int[]) this.aq.a(i, int[].class);
    }
}
