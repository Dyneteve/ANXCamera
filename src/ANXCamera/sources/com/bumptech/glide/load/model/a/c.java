package com.bumptech.glide.load.model.a;

import android.net.Uri;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.g;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.q;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* compiled from: HttpUriLoader */
public class c implements m<Uri, InputStream> {
    private static final Set<String> ls = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[]{"http", "https"})));
    private final m<g, InputStream> lu;

    /* compiled from: HttpUriLoader */
    public static class a implements n<Uri, InputStream> {
        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new c(qVar.b(g.class, InputStream.class));
        }

        public void cA() {
        }
    }

    public c(m<g, InputStream> mVar) {
        this.lu = mVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return this.lu.b(new g(uri.toString()), i, i2, fVar);
    }

    /* renamed from: k */
    public boolean t(@NonNull Uri uri) {
        return ls.contains(uri.getScheme());
    }
}
