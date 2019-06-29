package com.bumptech.glide.load.a;

import android.content.res.AssetManager;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import java.io.IOException;

/* compiled from: FileDescriptorAssetPathFetcher */
public class h extends b<ParcelFileDescriptor> {
    public h(AssetManager assetManager, String str) {
        super(assetManager, str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void m(ParcelFileDescriptor parcelFileDescriptor) throws IOException {
        parcelFileDescriptor.close();
    }

    @NonNull
    public Class<ParcelFileDescriptor> aJ() {
        return ParcelFileDescriptor.class;
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public ParcelFileDescriptor a(AssetManager assetManager, String str) throws IOException {
        return assetManager.openFd(str).getParcelFileDescriptor();
    }
}
