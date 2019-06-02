package com.ss.android.version;

public class VEVersion {
    public static String getCability() {
        return nativeCability();
    }

    public static native String nativeCability();
}
