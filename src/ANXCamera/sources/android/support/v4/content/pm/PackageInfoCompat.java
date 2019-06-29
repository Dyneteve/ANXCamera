package android.support.v4.content.pm;

import android.content.pm.PackageInfo;
import android.support.annotation.NonNull;
import android.support.v4.os.BuildCompat;

public final class PackageInfoCompat {
    private PackageInfoCompat() {
    }

    public static long getLongVersionCode(@NonNull PackageInfo packageInfo) {
        return BuildCompat.isAtLeastP() ? packageInfo.getLongVersionCode() : (long) packageInfo.versionCode;
    }
}
