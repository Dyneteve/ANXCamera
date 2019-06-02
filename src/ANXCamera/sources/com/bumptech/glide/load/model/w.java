package com.bumptech.glide.load.model;

import android.net.Uri;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.f;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* compiled from: UrlUriLoader */
public class w<Data> implements m<Uri, Data> {
    private static final Set<String> kt = Collections.unmodifiableSet(new HashSet(Arrays.asList(new String[]{"http", "https"})));
    private final m<g, Data> kv;

    /* compiled from: UrlUriLoader */
    public static class a implements n<Uri, InputStream> {
        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new w(qVar.b(g.class, InputStream.class));
        }

        public void bX() {
        }
    }

    public w(m<g, Data> mVar) {
        this.kv = mVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return this.kv.b(new g(uri.toString()), i, i2, fVar);
    }

    /* renamed from: k */
    public boolean q(@NonNull Uri uri) {
        return kt.contains(uri.getScheme());
    }
}
