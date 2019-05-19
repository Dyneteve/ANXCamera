package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.android.camera.log.Log;
import com.android.camera.permission.PermissionManager;
import com.arcsoft.camera.wideselfie.WideSelfieEngine;

public class CameraButtonIntentReceiver extends BroadcastReceiver {
    private static final String TAG = CameraButtonIntentReceiver.class.getSimpleName();

    public void onReceive(Context context, Intent intent) {
        if (!PermissionManager.checkCameraLaunchPermissions()) {
            Log.e(TAG, "no camera permission");
            return;
        }
        Intent intent2 = new Intent("android.intent.action.MAIN");
        intent2.setClass(context, Camera.class);
        intent2.addCategory("android.intent.category.LAUNCHER");
        intent2.setFlags(WideSelfieEngine.MPAF_RGB_BASE);
        context.startActivity(intent2);
    }
}
