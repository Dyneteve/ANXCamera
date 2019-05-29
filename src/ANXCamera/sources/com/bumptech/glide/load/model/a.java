package com.bumptech.glide.load.model;

import android.content.res.AssetManager;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.a.d;
import com.bumptech.glide.load.a.h;
import com.bumptech.glide.load.a.m;
import com.bumptech.glide.load.f;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import java.io.InputStream;

/* compiled from: AssetUriLoader */
public class a<Data> implements m<Uri, Data> {
    private static final String jp = "android_asset";
    private static final String jq = "file:///android_asset/";
    private static final int jr = jq.length();
    private final AssetManager dO;
    private final C0005a<Data> js;

    /* compiled from: AssetUriLoader */
    /* renamed from: com.bumptech.glide.load.model.a$a reason: collision with other inner class name */
    public interface C0005a<Data> {
        d<Data> d(AssetManager assetManager, String str);
    }

    /* compiled from: AssetUriLoader */
    public static class b implements C0005a<ParcelFileDescriptor>, n<Uri, ParcelFileDescriptor> {
        private final AssetManager dO;

        public b(AssetManager assetManager) {
            this.dO = assetManager;
        }

        @NonNull
        public m<Uri, ParcelFileDescriptor> a(q qVar) {
            return new a(this.dO, this);
        }

        public void bX() {
        }

        public d<ParcelFileDescriptor> d(AssetManager assetManager, String str) {
            return new h(assetManager, str);
        }
    }

    /* compiled from: AssetUriLoader */
    public static class c implements C0005a<InputStream>, n<Uri, InputStream> {
        private final AssetManager dO;

        public c(AssetManager assetManager) {
            this.dO = assetManager;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new a(this.dO, this);
        }

        public void bX() {
        }

        public d<InputStream> d(AssetManager assetManager, String str) {
            return new m(assetManager, str);
        }
    }

    public a(AssetManager assetManager, C0005a<Data> aVar) {
        this.dO = assetManager;
        this.js = aVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(uri), this.js.d(this.dO, uri.toString().substring(jr)));
    }

    /* renamed from: k */
    public boolean q(@NonNull Uri uri) {
        return ComposerHelper.COMPOSER_PATH.equals(uri.getScheme()) && !uri.getPathSegments().isEmpty() && jp.equals(uri.getPathSegments().get(0));
    }
}
