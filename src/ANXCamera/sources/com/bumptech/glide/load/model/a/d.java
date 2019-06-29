package com.bumptech.glide.load.model.a;

import android.content.Context;
import android.net.Uri;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.a.b;
import com.bumptech.glide.load.a.a.c;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.model.m;
import com.bumptech.glide.load.model.n;
import com.bumptech.glide.load.model.q;
import java.io.InputStream;

/* compiled from: MediaStoreImageThumbLoader */
public class d implements m<Uri, InputStream> {
    private final Context context;

    /* compiled from: MediaStoreImageThumbLoader */
    public static class a implements n<Uri, InputStream> {
        private final Context context;

        public a(Context context2) {
            this.context = context2;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new d(this.context);
        }

        public void cA() {
        }
    }

    public d(Context context2) {
        this.context = context2.getApplicationContext();
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<InputStream> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        if (b.k(i, i2)) {
            return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(uri), c.b(this.context, uri));
        }
        return null;
    }

    /* renamed from: k */
    public boolean t(@NonNull Uri uri) {
        return b.f(uri);
    }
}
