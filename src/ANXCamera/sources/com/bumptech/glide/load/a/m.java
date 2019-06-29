package com.bumptech.glide.load.a;

import android.content.res.AssetManager;
import android.support.annotation.NonNull;
import java.io.IOException;
import java.io.InputStream;

/* compiled from: StreamAssetPathFetcher */
public class m extends b<InputStream> {
    public m(AssetManager assetManager, String str) {
        super(assetManager, str);
    }

    @NonNull
    public Class<InputStream> aJ() {
        return InputStream.class;
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public InputStream a(AssetManager assetManager, String str) throws IOException {
        return assetManager.open(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: e */
    public void m(InputStream inputStream) throws IOException {
        inputStream.close();
    }
}
