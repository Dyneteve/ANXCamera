package com.android.volley.toolbox;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.http.AndroidHttpClient;
import android.os.Build.VERSION;
import com.android.volley.C0029RequestQueue;
import java.io.File;

/* renamed from: com.android.volley.toolbox.Volley reason: case insensitive filesystem */
public class C0057Volley {
    private static final String DEFAULT_CACHE_DIR = "volley";

    public static C0029RequestQueue newRequestQueue(Context context) {
        return newRequestQueue(context, (C0045HttpStack) null);
    }

    public static C0029RequestQueue newRequestQueue(Context context, C0045HttpStack httpStack) {
        File file = new File(context.getCacheDir(), "volley");
        String str = "volley/0";
        try {
            String packageName = context.getPackageName();
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 0);
            StringBuilder sb = new StringBuilder();
            sb.append(packageName);
            sb.append("/");
            sb.append(packageInfo.versionCode);
            str = sb.toString();
        } catch (NameNotFoundException e) {
        }
        if (httpStack == null) {
            httpStack = VERSION.SDK_INT >= 9 ? new C0046HurlStack() : new C0043HttpClientStack(AndroidHttpClient.newInstance(str));
        }
        C0029RequestQueue requestQueue = new C0029RequestQueue(new C0042DiskBasedCache(file), new C0039BasicNetwork(httpStack));
        requestQueue.start();
        return requestQueue;
    }
}
