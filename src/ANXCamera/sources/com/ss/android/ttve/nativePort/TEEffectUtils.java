package com.ss.android.ttve.nativePort;

import android.support.annotation.Keep;

@Keep
public class TEEffectUtils {
    static {
        TENativeLibsLoader.loadLibrary();
    }

    public static native String getEffectVersion();
}
