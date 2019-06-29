package com.android.camera.effect.framework.utils;

import com.android.camera.log.Log;

public class CounterUtil {
    private static String TAG = CounterUtil.class.getSimpleName();
    private long mTs;

    public void reset() {
        this.mTs = System.currentTimeMillis();
    }

    public void reset(String str) {
        reset();
        Log.i(TAG, str);
    }

    public void tick(String str) {
        long currentTimeMillis = System.currentTimeMillis();
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(":");
        sb.append(currentTimeMillis - this.mTs);
        Log.i(str2, sb.toString());
        this.mTs = currentTimeMillis;
    }
}
