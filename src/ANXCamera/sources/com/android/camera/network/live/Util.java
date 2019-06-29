package com.android.camera.network.live;

import com.android.camera.log.Log;

public class Util {
    private static String TAG = "LiveUtil";

    static {
        try {
            System.loadLibrary("tt_jni");
        } catch (Throwable th) {
            Log.e(TAG, "load tt_jni.so failed.", th);
        }
    }

    private static native byte[] genAccessKey();

    private static native byte[] generate(long j, long j2);

    public static String getAccessKey() {
        return new String(genAccessKey());
    }

    public static String md5(long j, long j2) {
        byte[] generate = generate(j, j2);
        String str = "";
        for (byte b : generate) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(Integer.toHexString((255 & b) | -256).substring(6));
            str = sb.toString();
        }
        return str;
    }
}
