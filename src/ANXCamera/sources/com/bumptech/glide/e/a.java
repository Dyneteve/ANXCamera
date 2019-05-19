package com.bumptech.glide.e;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.util.Log;
import com.bumptech.glide.load.c;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* compiled from: ApplicationVersionSignature */
public final class a {
    private static final String TAG = "AppVersionSignature";
    private static final ConcurrentMap<String, c> pJ = new ConcurrentHashMap();

    private a() {
    }

    @NonNull
    private static String a(@Nullable PackageInfo packageInfo) {
        return packageInfo != null ? String.valueOf(packageInfo.versionCode) : UUID.randomUUID().toString();
    }

    @NonNull
    public static c n(@NonNull Context context) {
        String packageName = context.getPackageName();
        c cVar = (c) pJ.get(packageName);
        if (cVar != null) {
            return cVar;
        }
        c o = o(context);
        c cVar2 = (c) pJ.putIfAbsent(packageName, o);
        return cVar2 == null ? o : cVar2;
    }

    @NonNull
    private static c o(@NonNull Context context) {
        return new d(a(p(context)));
    }

    @Nullable
    private static PackageInfo p(@NonNull Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        } catch (NameNotFoundException e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Cannot resolve info for");
            sb.append(context.getPackageName());
            Log.e(str, sb.toString(), e);
            return null;
        }
    }

    @VisibleForTesting
    static void reset() {
        pJ.clear();
    }
}
