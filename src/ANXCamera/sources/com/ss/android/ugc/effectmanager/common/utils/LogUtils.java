package com.ss.android.ugc.effectmanager.common.utils;

import android.util.Log;

public class LogUtils {
    private static boolean isDebug = false;

    public static void d(String str, String str2) {
        if (isDebug) {
            StringBuilder sb = new StringBuilder();
            sb.append("djjowfy:  ");
            sb.append(str);
            Log.d(sb.toString(), str2);
        }
    }

    public static void debug() {
        isDebug = true;
    }

    public static void e(String str, String str2) {
        if (isDebug) {
            StringBuilder sb = new StringBuilder();
            sb.append("djjowfy:  ");
            sb.append(str);
            Log.e(sb.toString(), str2);
        }
    }
}
