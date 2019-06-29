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
    private static final String kq = "android_asset";
    private static final String kr = "file:///android_asset/";
    private static final int ks = kr.length();
    private final AssetManager eP;
    private final C0006a<Data> kt;

    /* renamed from: com.bumptech.glide.load.model.a$a reason: collision with other inner class name */
    /* compiled from: AssetUriLoader */
    public interface C0006a<Data> {
        d<Data> d(AssetManager assetManager, String str);
    }

    /* compiled from: AssetUriLoader */
    public static class b implements C0006a<ParcelFileDescriptor>, n<Uri, ParcelFileDescriptor> {
        private final AssetManager eP;

        public b(AssetManager assetManager) {
            this.eP = assetManager;
        }

        @NonNull
        public m<Uri, ParcelFileDescriptor> a(q qVar) {
            return new a(this.eP, this);
        }

        public void cA() {
        }

        public d<ParcelFileDescriptor> d(AssetManager assetManager, String str) {
            return new h(assetManager, str);
        }
    }

    /* compiled from: AssetUriLoader */
    public static class c implements C0006a<InputStream>, n<Uri, InputStream> {
        private final AssetManager eP;

        public c(AssetManager assetManager) {
            this.eP = assetManager;
        }

        @NonNull
        public m<Uri, InputStream> a(q qVar) {
            return new a(this.eP, this);
        }

        public void cA() {
        }

        public d<InputStream> d(AssetManager assetManager, String str) {
            return new m(assetManager, str);
        }
    }

    public a(AssetManager assetManager, C0006a<Data> aVar) {
        this.eP = assetManager;
        this.kt = aVar;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        return new com.bumptech.glide.load.model.m.a<>(new com.bumptech.glide.e.d(uri), this.kt.d(this.eP, uri.toString().substring(ks)));
    }

    /* renamed from: k */
    public boolean t(@NonNull Uri uri) {
        return ComposerHelper.COMPOSER_PATH.equals(uri.getScheme()) && !uri.getPathSegments().isEmpty() && kq.equals(uri.getPathSegments().get(0));
    }
}
