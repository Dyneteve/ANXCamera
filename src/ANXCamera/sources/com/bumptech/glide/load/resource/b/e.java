package com.bumptech.glide.load.resource.b;

import android.content.Context;
import android.content.pm.PackageManager.NameNotFoundException;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.bumptech.glide.load.engine.p;
import com.bumptech.glide.load.f;
import com.bumptech.glide.load.g;
import java.util.List;

/* compiled from: ResourceDrawableDecoder */
public class e implements g<Uri, Drawable> {
    private static final int ma = 2;
    private static final int mb = 0;
    private static final int mc = 1;
    private static final int md = 1;
    private static final int me = 0;
    private final Context context;

    public e(Context context2) {
        this.context = context2.getApplicationContext();
    }

    @NonNull
    private Context a(Uri uri, String str) {
        try {
            return this.context.createPackageContext(str, 0);
        } catch (NameNotFoundException e) {
            StringBuilder sb = new StringBuilder();
            sb.append("Failed to obtain context or unrecognized Uri format for: ");
            sb.append(uri);
            throw new IllegalArgumentException(sb.toString(), e);
        }
    }

    @DrawableRes
    private int m(Uri uri) {
        Integer num;
        List pathSegments = uri.getPathSegments();
        if (pathSegments.size() == 2) {
            String str = (String) pathSegments.get(0);
            String str2 = (String) pathSegments.get(1);
            num = Integer.valueOf(this.context.getResources().getIdentifier(str2, str, uri.getAuthority()));
        } else {
            if (pathSegments.size() == 1) {
                try {
                    num = Integer.valueOf((String) pathSegments.get(0));
                } catch (NumberFormatException e) {
                }
            }
            num = null;
        }
        if (num == null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Unrecognized Uri format: ");
            sb.append(uri);
            throw new IllegalArgumentException(sb.toString());
        } else if (num.intValue() != 0) {
            return num.intValue();
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Failed to obtain resource id for: ");
            sb2.append(uri);
            throw new IllegalArgumentException(sb2.toString());
        }
    }

    public boolean a(@NonNull Uri uri, @NonNull f fVar) {
        return uri.getScheme().equals("android.resource");
    }

    @Nullable
    /* renamed from: b */
    public p<Drawable> a(@NonNull Uri uri, int i, int i2, @NonNull f fVar) {
        int m = m(uri);
        String authority = uri.getAuthority();
        return d.c(a.a(this.context, authority.equals(this.context.getPackageName()) ? this.context : a(uri, authority), m));
    }
}
