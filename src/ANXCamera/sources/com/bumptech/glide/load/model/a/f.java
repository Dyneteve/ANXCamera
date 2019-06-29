package com.bumptech.glide.load.model.a;

import android.support.annotation.NonNull;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.q;
import java.io.InputStream;
import java.net.URL;

/* compiled from: UrlLoader */
public class f implements m<URL, InputStream> {
    private final m<g, InputStream> ly;

    /* compiled from: UrlLoader */
    public static class a implements n<URL, InputStream> {
        @NonNull
        public m<URL, InputStream> a(q qVar) {
            return new f(qVar.b(g.class, InputStream.class));
        }

        public void cA() {
        }
    }

    public f(m<g, InputStream> mVar) {
        this.ly = mVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull URL url, int i, int i2, @NonNull com.bumptech.glide.load.f fVar) {
        return this.ly.b(new g(url), i, i2, fVar);
    }

    /* renamed from: d */
    public boolean t(@NonNull URL url) {
        return true;
    }
}
