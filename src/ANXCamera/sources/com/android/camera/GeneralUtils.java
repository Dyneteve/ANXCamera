package com.android.camera;

import android.app.Notification;
import android.app.Notification.Builder;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.miui.R.array;
import android.miui.R.bool;
import android.net.Uri;
import android.provider.MiuiSettings;
import android.provider.Settings.Secure;
import android.view.View;
import android.view.Window;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.arcsoft.supernight.SuperNightProcess;
import miui.R;
import miui.reflect.Field;
import miui.security.SecurityManager;

public class GeneralUtils {
    public static final String STREET_SNAP_CHANNEL_ID = "com.android.camera.streetsnap";

    public static void applyNotchFlag(Window window) {
        window.addExtraFlags(SuperNightProcess.ARC_SN_CAMERA_MODE_XIAOMI_SDM855_12MB_IMX586);
    }

    public static void clearInterpolator(View view) {
    }

    public static int editModeTitleLayout() {
        return R.layout.edit_mode_title;
    }

    public static final boolean isAppLocked(Context context, String str) {
        boolean z = false;
        if (!(Secure.getInt(context.getApplicationContext().getContentResolver(), MiuiSettings.Secure.ACCESS_CONTROL_LOCK_ENABLED, -1) == 1)) {
            return false;
        }
        SecurityManager securityManager = (SecurityManager) context.getSystemService("security");
        boolean applicationAccessControlEnabled = securityManager.getApplicationAccessControlEnabled(str);
        boolean checkAccessControlPass = securityManager.checkAccessControlPass(str);
        if (applicationAccessControlEnabled && !checkAccessControlPass) {
            z = true;
        }
        return z;
    }

    public static Field miuiResArrayField(String str, String str2) {
        return Field.of(array.class, str, str2);
    }

    public static Field miuiResBoolField(String str, String str2) {
        return Field.of(bool.class, str, str2);
    }

    public static int miuiWidgetButtonDialog() {
        return R.style.Widget_Button_Dialog;
    }

    public static void notifyForDetail(Context context, Uri uri, String str, String str2, boolean z) {
        try {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.VIEW");
            intent.setDataAndType(uri, z ? "video/*" : "image/*");
            Builder when = new Builder(context).setContentTitle(str).setContentText(str2).setContentIntent(PendingIntent.getActivity(context, 0, intent, 0)).setSmallIcon(17301569).setWhen(System.currentTimeMillis());
            NotificationManager notificationManager = (NotificationManager) context.getSystemService("notification");
            CompatibilityUtils.addChannelForNotificationBuilder(notificationManager, "com.android.camera.streetsnap", context.getResources().getString(R.string.camera_label), when);
            Notification build = when.build();
            build.flags |= 16;
            build.extraNotification.setMessageCount(0);
            notificationManager.notify(0, build);
        } catch (NullPointerException e) {
        }
    }
}
