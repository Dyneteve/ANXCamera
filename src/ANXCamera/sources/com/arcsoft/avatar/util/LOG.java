package com.arcsoft.avatar.util;

import android.util.Log;

public class LOG {
    public static boolean DEBUG = true;
    public static final String TAG = "Avatar_Jar";

    private LOG() {
    }

    public static void d(String str, String str2) {
        if (DEBUG) {
            Log.d(str, str2);
        }
    }

    public static void e(String str, String str2) {
        if (DEBUG) {
            Log.e(str, str2);
        }
    }

    public static void p(String str) {
        if (DEBUG) {
            Log.d(TAG, str);
        }
    }

    public static void v(String str, String str2) {
        if (DEBUG) {
            Log.v(str, str2);
        }
    }
}
