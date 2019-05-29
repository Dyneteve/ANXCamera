package com.bumptech.glide.manager;

import android.content.Context;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import android.util.Log;
import com.bumptech.glide.manager.c.a;

/* compiled from: DefaultConnectivityMonitorFactory */
public class f implements d {
    private static final String TAG = "ConnectivityMonitor";
    private static final String mZ = "android.permission.ACCESS_NETWORK_STATE";

    @NonNull
    public c a(@NonNull Context context, @NonNull a aVar) {
        boolean z = ContextCompat.checkSelfPermission(context, mZ) == 0;
        if (Log.isLoggable(TAG, 3)) {
            Log.d(TAG, z ? "ACCESS_NETWORK_STATE permission granted, registering connectivity monitor" : "ACCESS_NETWORK_STATE permission missing, cannot register connectivity monitor");
        }
        return z ? new e(context, aVar) : new j();
    }
}
