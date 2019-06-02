package com.android.camera.beautyshot;

import com.android.camera.log.Log;

public class BeautyShot {
    private static final String TAG = "BeautyShot";

    static {
        try {
            System.loadLibrary("camera_beauty_mpbase");
            System.loadLibrary("camera_arcsoft_beautyshot");
            System.loadLibrary("jni_arcsoft_beautyshot");
        } catch (UnsatisfiedLinkError e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("can't loadLibrary, ");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public final native void init();

    public final native int processByBeautyLevel(byte[] bArr, int i, int i2, int i3, int i4, int i5);

    public final native int processBySmoothLevel(byte[] bArr, int i, int i2, int i3, int i4, int i5);

    public final native void uninit();
}
