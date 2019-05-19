package com.android.volley.toolbox;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.http.AndroidHttpClient;
import android.os.Build.VERSION;
import com.android.volley.C0025RequestQueue;
import java.io.File;

/* renamed from: com.android.volley.toolbox.Volley reason: case insensitive filesystem */
public class C0053Volley {
    private static final String DEFAULT_CACHE_DIR = "volley";

    public static C0025RequestQueue newRequestQueue(Context context, C0041HttpStack stack) {
        File cacheDir = new File(context.getCacheDir(), "volley");
        String userAgent = "volley/0";
        try {
            String packageName = context.getPackageName();
            PackageInfo info = context.getPackageManager().getPackageInfo(packageName, 0);
            StringBuilder sb = new StringBuilder();
            sb.append(packageName);
            sb.append("/");
            sb.append(info.versionCode);
            userAgent = sb.toString();
        } catch (NameNotFoundException e) {
        }
        if (stack == null) {
            if (VERSION.SDK_INT >= 9) {
                stack = new C0042HurlStack();
            } else {
                stack = new C0039HttpClientStack(AndroidHttpClient.newInstance(userAgent));
            }
        }
        C0025RequestQueue queue = new C0025RequestQueue(new C0038DiskBasedCache(cacheDir), new C0035BasicNetwork(stack));
        queue.start();
        return queue;
    }

    public static C0025RequestQueue newRequestQueue(Context context) {
        return newRequestQueue(context, (C0041HttpStack) null);
    }
}
