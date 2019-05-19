package com.arcsoft.avatar.util;

import android.util.Log;

public class CodecLog {
    private static boolean a = false;

    public static void d(String str, String str2) {
        if (a) {
            Log.d(str, str2);
        }
    }

    public static void e(String str, String str2) {
        if (a) {
            Log.e(str, str2);
        }
    }

    public static void enableLog(boolean z) {
        a = z;
    }

    public static void i(String str, String str2) {
        if (a) {
            Log.i(str, str2);
        }
    }
}
