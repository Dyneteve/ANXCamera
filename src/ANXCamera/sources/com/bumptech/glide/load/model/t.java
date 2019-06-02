package com.bumptech.glide.load.model;

import android.content.res.AssetFileDescriptor;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.bumptech.glide.load.f;
import java.io.File;
import java.io.InputStream;

/* compiled from: StringLoader */
public class t<Data> implements m<String, Data> {
    private final m<Uri, Data> kp;

    /* compiled from: StringLoader */
    public static final class a implements n<String, AssetFileDescriptor> {
        public m<String, AssetFileDescriptor> a(q qVar) {
            return new t(qVar.b(Uri.class, AssetFileDescriptor.class));
        }

        public void bX() {
        }
    }

    /* compiled from: StringLoader */
    public static class b implements n<String, ParcelFileDescriptor> {
        @NonNull
        public m<String, ParcelFileDescriptor> a(q qVar) {
            return new t(qVar.b(Uri.class, ParcelFileDescriptor.class));
        }

        public void bX() {
        }
    }

    /* compiled from: StringLoader */
    public static class c implements n<String, InputStream> {
        @NonNull
        public m<String, InputStream> a(q qVar) {
            return new t(qVar.b(Uri.class, InputStream.class));
        }

        public void bX() {
        }
    }

    public t(m<Uri, Data> mVar) {
        this.kp = mVar;
    }

    @Nullable
    private static Uri B(String str) {
        Uri uri;
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (str.charAt(0) == '/') {
            uri = C(str);
        } else {
            Uri parse = Uri.parse(str);
            uri = parse.getScheme() == null ? C(str) : parse;
        }
        return uri;
    }

    private static Uri C(String str) {
        return Uri.fromFile(new File(str));
    }

    /* renamed from: A */
    public boolean q(@NonNull String str) {
        return true;
    }

    /* renamed from: a */
    public com.bumptech.glide.load.model.m.a<Data> b(@NonNull String str, int i, int i2, @NonNull f fVar) {
        Uri B = B(str);
        if (B == null) {
            return null;
        }
        return this.kp.b(B, i, i2, fVar);
    }
}
