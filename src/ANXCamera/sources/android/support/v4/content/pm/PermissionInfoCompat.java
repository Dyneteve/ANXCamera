package android.support.v4.content.pm;

import android.annotation.SuppressLint;
import android.content.pm.PermissionInfo;
import android.support.annotation.NonNull;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.v4.os.BuildCompat;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public final class PermissionInfoCompat {

    @RestrictTo({Scope.LIBRARY})
    @Retention(RetentionPolicy.SOURCE)
    public @interface Protection {
    }

    @SuppressLint({"UniqueConstants"})
    @RestrictTo({Scope.LIBRARY})
    @Retention(RetentionPolicy.SOURCE)
    public @interface ProtectionFlags {
    }

    private PermissionInfoCompat() {
    }

    @SuppressLint({"WrongConstant"})
    public static int getProtection(@NonNull PermissionInfo permissionInfo) {
        return BuildCompat.isAtLeastP() ? permissionInfo.getProtection() : permissionInfo.protectionLevel & 15;
    }

    @SuppressLint({"WrongConstant"})
    public static int getProtectionFlags(@NonNull PermissionInfo permissionInfo) {
        return BuildCompat.isAtLeastP() ? permissionInfo.getProtectionFlags() : permissionInfo.protectionLevel & -16;
    }
}
