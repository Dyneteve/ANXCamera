package com.bumptech.glide.load.a;

import android.content.ContentResolver;
import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import java.io.FileNotFoundException;
import java.io.IOException;

/* compiled from: FileDescriptorLocalUriFetcher */
public class i extends l<ParcelFileDescriptor> {
    public i(ContentResolver contentResolver, Uri uri) {
        super(contentResolver, uri);
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
    /* renamed from: c */
    public ParcelFileDescriptor b(Uri uri, ContentResolver contentResolver) throws FileNotFoundException {
        AssetFileDescriptor openAssetFileDescriptor = contentResolver.openAssetFileDescriptor(uri, "r");
        if (openAssetFileDescriptor != null) {
            return openAssetFileDescriptor.getParcelFileDescriptor();
        }
        StringBuilder sb = new StringBuilder();
        sb.append("FileDescriptor is null for: ");
        sb.append(uri);
        throw new FileNotFoundException(sb.toString());
    }
}
