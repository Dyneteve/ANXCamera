package com.android.camera.lib.compatibility.related.popcamera;

import android.util.Log;

public class PopCameraUtil {
    private static final String TAG = "PopCameraUtil";

    public static int getMotorStatus() {
        Log.d(TAG, "takebackMotor: ignore...");
        return -1;
    }

    public static boolean popupMotor() {
        Log.d(TAG, "popupMotor: ignore...");
        return false;
    }

    public static boolean takebackMotor() {
        Log.d(TAG, "takebackMotor: ignore...");
        return false;
    }
}
