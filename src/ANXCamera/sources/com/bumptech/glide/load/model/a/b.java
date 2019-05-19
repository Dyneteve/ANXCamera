package com.bumptech.glide.load.model.a;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.android.volley.DefaultRetryPolicy;
import com.bumptech.glide.load.a.j;
import com.bumptech.glide.load.e;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.ModelCache;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.q;
import java.io.InputStream;

/* compiled from: HttpGlideUrlLoader */
public class b implements m<g, InputStream> {
    public static final e<Integer> kw = e.a("com.bumptech.glide.load.model.stream.HttpGlideUrlLoader.Timeout", Integer.valueOf(DefaultRetryPolicy.DEFAULT_TIMEOUT_MS));
    @Nullable
    private final ModelCache<g, g> kv;

    /* compiled from: HttpGlideUrlLoader */
    public static class a implements n<g, InputStream> {
        private final ModelCache<g, g> kv = new ModelCache<>(500);

        @NonNull
        public m<g, InputStream> a(q qVar) {
            return new b(this.kv);
        }

        public void bX() {
        }
    }

    public b() {
        this(null);
    }

    public b(@Nullable ModelCache<g, g> modelCache) {
        this.kv = modelCache;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull g gVar, int i, int i2, @NonNull f fVar) {
        if (this.kv != null) {
            g gVar2 = (g) this.kv.c(gVar, 0, 0);
            if (gVar2 == null) {
                this.kv.a(gVar, 0, 0, gVar);
            } else {
                gVar = gVar2;
            }
        }
        return new com.bumptech.glide.load.model.m.a<>(gVar, new j(gVar, ((Integer) fVar.a(kw)).intValue()));
    }

    /* renamed from: a */
    public boolean q(@NonNull g gVar) {
        return true;
    }
}
