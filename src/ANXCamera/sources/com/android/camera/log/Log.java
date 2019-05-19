package com.android.camera.log;

import android.content.ComponentName;
import android.content.Intent;
import android.os.BadParcelableException;
import android.os.Bundle;
import android.os.SystemProperties;
import com.android.camera.Util;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public final class Log {
    public static final int ASSERT = 7;
    private static final String CAMERA_LOGTAG_PREFIX = "CAM_";
    public static final String CONTINUAL = "C_";
    public static final int DEBUG = 3;
    private static final int DEFAULT = -1;
    public static final String EFFECT_TAG = "EFFECT_";
    public static final int ERROR = 6;
    public static final String GESTURE_TAG = "GESTURE_";
    public static final int INFO = 4;
    private static final int MAX_TAG_LEN = (23 - CAMERA_LOGTAG_PREFIX.length());
    public static final String SETTING_TAG = "SETTING_";
    public static final String SWITCH_TAG = "SWITCH_";
    private static final String TAG_DUMP_CAMERA_INTENT = "DUMP_CAMERA_INTENT";
    public static final String UI_THREAD_TAG = "UI_";
    public static final int VERBOSE = 2;
    public static final String VIEW_TAG = "VIEW_";
    public static final int WARN = 5;
    private static int sDebugPriority;

    @Retention(RetentionPolicy.SOURCE)
    public @interface DebugPriority {
    }

    static {
        int i = 2;
        sDebugPriority = 2;
        try {
            int overrideLevel = getOverrideLevel();
            if (overrideLevel != 0) {
                sDebugPriority = overrideLevel;
                return;
            }
            if (!Util.isDebugOsBuild()) {
                i = Integer.MAX_VALUE;
            }
            sDebugPriority = i;
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }
    }

    public static int c(String str, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(CONTINUAL);
        sb.append(str);
        String tagFormat = tagFormat(sb.toString());
        if (shouldLogForDebug("CAM_C_", 2)) {
            return android.util.Log.v(tagFormat, str2);
        }
        return -1;
    }

    public static int d(String str, String str2) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 3)) {
            return android.util.Log.d(tagFormat, str2);
        }
        return -1;
    }

    public static int d(String str, String str2, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 3)) {
            return android.util.Log.d(tagFormat, str2, th);
        }
        return -1;
    }

    private static void dumpComponentName(String str, ComponentName componentName) {
        if (componentName != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("Component: ");
            sb.append(componentName.getPackageName());
            sb.append("/");
            sb.append(componentName.getClassName());
            android.util.Log.v(str, sb.toString());
            return;
        }
        android.util.Log.v(str, "Component: null");
    }

    private static void dumpExtras(String str, Bundle bundle) {
        if (bundle != null) {
            for (String str2 : bundle.keySet()) {
                Object obj = bundle.get(str2);
                if (obj instanceof Bundle) {
                    dumpExtras(str, (Bundle) obj);
                } else {
                    try {
                        StringBuilder sb = new StringBuilder();
                        sb.append("Extra[");
                        sb.append(str2);
                        sb.append("] :");
                        sb.append(String.valueOf(bundle.get(str2)));
                        android.util.Log.v(str, sb.toString());
                    } catch (BadParcelableException e) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("Extra contains unknown class instance for [");
                        sb2.append(str2);
                        sb2.append("]: ");
                        android.util.Log.w(str, sb2.toString(), e);
                    }
                }
            }
        }
    }

    public static void dumpIntent(String str, Intent intent) {
        if (!android.util.Log.isLoggable(TAG_DUMP_CAMERA_INTENT, 3)) {
            android.util.Log.v(str, "dumpIntent is not enable on this device.");
        } else if (intent == null) {
            android.util.Log.v(str, "intent is null.");
        } else {
            android.util.Log.v(str, "=================================================================");
            StringBuilder sb = new StringBuilder();
            sb.append("Intent[@");
            sb.append(Integer.toHexString(intent.hashCode()));
            sb.append("] content:");
            android.util.Log.v(str, sb.toString());
            StringBuilder sb2 = new StringBuilder();
            sb2.append("Action   : ");
            sb2.append(intent.getAction());
            android.util.Log.v(str, sb2.toString());
            StringBuilder sb3 = new StringBuilder();
            sb3.append("Category : ");
            sb3.append(intent.getCategories());
            android.util.Log.v(str, sb3.toString());
            StringBuilder sb4 = new StringBuilder();
            sb4.append("Data     : ");
            sb4.append(intent.getDataString());
            android.util.Log.v(str, sb4.toString());
            dumpComponentName(str, intent.getComponent());
            Bundle extras = intent.getExtras();
            StringBuilder sb5 = new StringBuilder();
            sb5.append("HasExtras: ");
            sb5.append(hasExtras(extras));
            android.util.Log.v(str, sb5.toString());
            dumpExtras(str, extras);
            android.util.Log.v(str, "=================================================================");
        }
    }

    public static int e(String str, String str2) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 6)) {
            return android.util.Log.e(tagFormat, str2);
        }
        return -1;
    }

    public static int e(String str, String str2, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 6)) {
            return android.util.Log.e(tagFormat, str2, th);
        }
        return -1;
    }

    public static int getOverrideLevel() {
        return SystemProperties.getInt("camera.debug.log_level", 2);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x0007, code lost:
        if (r3.isEmpty() == false) goto L_0x0014;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static boolean hasExtras(Bundle bundle) {
        boolean z = true;
        if (bundle != null) {
            try {
            } catch (BadParcelableException e) {
                android.util.Log.w("IntentLogger", "Extra contains unknown class instance: ", e);
                return true;
            }
        }
        z = false;
        return z;
    }

    public static int i(String str, String str2) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 4)) {
            return android.util.Log.i(tagFormat, str2);
        }
        return -1;
    }

    public static int i(String str, String str2, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 4)) {
            return android.util.Log.i(tagFormat, str2, th);
        }
        return -1;
    }

    private static boolean isLoggable(String str, int i) {
        return sDebugPriority <= i || shouldLog(str, i);
    }

    private static boolean shouldLog(String str, int i) {
        return android.util.Log.isLoggable(CAMERA_LOGTAG_PREFIX, i) || android.util.Log.isLoggable(str, i);
    }

    private static boolean shouldLogForDebug(String str, int i) {
        return android.util.Log.isLoggable(str, i);
    }

    private static String tagFormat(String str) {
        int length = str.length() - MAX_TAG_LEN;
        StringBuilder sb = new StringBuilder();
        sb.append(CAMERA_LOGTAG_PREFIX);
        if (length > 0) {
            str = str.substring(0, MAX_TAG_LEN);
        }
        sb.append(str);
        return sb.toString();
    }

    public static int v(String str, String str2) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 2)) {
            return android.util.Log.v(tagFormat, str2);
        }
        return -1;
    }

    public static int v(String str, String str2, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 2)) {
            return android.util.Log.v(tagFormat, str2, th);
        }
        return -1;
    }

    public static int w(String str, String str2) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 5)) {
            return android.util.Log.w(tagFormat, str2);
        }
        return -1;
    }

    public static int w(String str, String str2, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 5)) {
            return android.util.Log.w(tagFormat, str2, th);
        }
        return -1;
    }

    public static int w(String str, Throwable th) {
        String tagFormat = tagFormat(str);
        if (isLoggable(tagFormat, 5)) {
            return android.util.Log.w(tagFormat, th);
        }
        return -1;
    }
}
