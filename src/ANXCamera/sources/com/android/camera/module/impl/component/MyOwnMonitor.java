package com.android.camera.module.impl.component;

import android.util.Log;
import com.ss.android.vesdk.runtime.VEExternalMonitorListener;

public class MyOwnMonitor implements VEExternalMonitorListener {
    public static MyOwnMonitor Instance = new MyOwnMonitor();

    private MyOwnMonitor() {
    }

    public void onMonitorInvoked(String str, int i, String str2) {
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(i);
        sb.append(str2);
        Log.i("LiveLog", sb.toString());
    }
}
