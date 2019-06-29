package com.ss.android.medialib.common;

import android.util.Log;

public class LogUtil {
    private static String APPNAME = "VESDK-";
    private static byte DEBUG_LEVEL = 15;
    public static byte DEBUG_LEVEL_D = 15;
    public static byte DEBUG_LEVEL_E = 1;
    public static byte DEBUG_LEVEL_I = 7;
    public static byte DEBUG_LEVEL_N = 0;
    public static byte DEBUG_LEVEL_V = 31;
    public static byte DEBUG_LEVEL_W = 3;
    private static byte LOGD = 8;
    private static byte LOGE = 1;
    private static byte LOGI = 4;
    private static byte LOGV = 16;
    private static byte LOGW = 2;

    public static void d(Class<?> cls, String str) {
        if ((LOGD & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.d(sb.toString(), str);
        }
    }

    public static void d(String str, String str2) {
        if ((LOGD & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.d(sb.toString(), str2);
        }
    }

    public static void e(Class<?> cls, String str) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.e(sb.toString(), str);
        }
    }

    public static void e(Class<?> cls, String str, Throwable th) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.e(sb.toString(), str, th);
        }
    }

    public static void e(String str, String str2) {
        if ((LOGE & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.e(sb.toString(), str2);
        }
    }

    public static void i(String str, String str2) {
        if ((LOGI & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.i(sb.toString(), str2);
        }
    }

    public static void setUp(String str, byte b) {
        if (str != null && str.length() > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("-");
            APPNAME = sb.toString();
        }
        DEBUG_LEVEL = b;
    }

    public static void v(Class<?> cls, String str) {
        if ((LOGV & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.v(sb.toString(), str);
        }
    }

    public static void v(String str, String str2) {
        if ((LOGV & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.v(sb.toString(), str2);
        }
    }

    public static void w(Class<?> cls, String str) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.w(sb.toString(), str);
        }
    }

    public static void w(Class<?> cls, String str, Throwable th) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(cls.getSimpleName());
            Log.w(sb.toString(), str, th);
        }
    }

    public static void w(String str, String str2) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.w(sb.toString(), str2);
        }
    }

    public static void w(String str, String str2, Throwable th) {
        if ((LOGW & DEBUG_LEVEL) != 0) {
            StringBuilder sb = new StringBuilder();
            sb.append(APPNAME);
            sb.append(str);
            Log.w(sb.toString(), str2, th);
        }
    }
}
