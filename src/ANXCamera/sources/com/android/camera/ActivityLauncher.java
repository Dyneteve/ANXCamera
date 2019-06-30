package com.android.camera;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import java.util.Locale;
import miui.os.Build;

public class ActivityLauncher {
    private static String URL_ANXBOUNCECHAT = "https://telegram.me/ANXBounceChat";
    private static String URL_ANXCAMERACHAT = "https://telegram.me/ANXMiuiCameraChat";

    private ActivityLauncher() {
    }

    public static void launchANXBounceInfo(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(URL_ANXBOUNCECHAT));
        context.startActivity(intent);
    }

    public static void launchANXCameraInfo(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(URL_ANXCAMERACHAT));
        context.startActivity(intent);
    }

    public static void launchPrivacyPolicyWebpage(Context context) {
        Intent intent = new Intent("android.intent.action.VIEW");
        String locale = Locale.getDefault().toString();
        intent.setData(Uri.parse(String.format(Locale.US, "%s?region=%s&lang=%s", new Object[]{URL_ANXCAMERACHAT, Build.getRegion(), locale})));
        context.startActivity(intent);
    }
}
