package com.ss.android.vesdk;

import android.arch.lifecycle.GeneratedAdapter;
import android.arch.lifecycle.Lifecycle.Event;
import android.arch.lifecycle.LifecycleOwner;
import android.arch.lifecycle.MethodCallsLogger;

public class VEAudioRecorder_LifecycleAdapter implements GeneratedAdapter {
    final VEAudioRecorder mReceiver;

    VEAudioRecorder_LifecycleAdapter(VEAudioRecorder vEAudioRecorder) {
        this.mReceiver = vEAudioRecorder;
    }

    public void callMethods(LifecycleOwner lifecycleOwner, Event event, boolean z, MethodCallsLogger methodCallsLogger) {
        boolean z2 = methodCallsLogger != null;
        if (!z && event == Event.ON_DESTROY) {
            if (!z2 || methodCallsLogger.approveCall("destory", 1)) {
                this.mReceiver.destory();
            }
        }
    }
}
