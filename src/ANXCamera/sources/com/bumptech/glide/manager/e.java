package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.annotation.NonNull;
import android.util.Log;
import com.bumptech.glide.manager.c.a;
import com.bumptech.glide.util.i;

/* compiled from: DefaultConnectivityMonitor */
final class e implements c {
    private static final String TAG = "ConnectivityMonitor";
    private final Context context;
    boolean isConnected;
    final a mU;
    private boolean mV;
    private final BroadcastReceiver mW = new BroadcastReceiver() {
        public void onReceive(@NonNull Context context, Intent intent) {
            boolean z = e.this.isConnected;
            e.this.isConnected = e.this.isConnected(context);
            if (z != e.this.isConnected) {
                if (Log.isLoggable(e.TAG, 3)) {
                    String str = e.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("connectivity changed, isConnected: ");
                    sb.append(e.this.isConnected);
                    Log.d(str, sb.toString());
                }
                e.this.mU.d(e.this.isConnected);
            }
        }
    };

    e(@NonNull Context context2, @NonNull a aVar) {
        this.context = context2.getApplicationContext();
        this.mU = aVar;
    }

    private void register() {
        if (!this.mV) {
            this.isConnected = isConnected(this.context);
            try {
                this.context.registerReceiver(this.mW, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
                this.mV = true;
            } catch (SecurityException e) {
                if (Log.isLoggable(TAG, 5)) {
                    Log.w(TAG, "Failed to register", e);
                }
            }
        }
    }

    private void unregister() {
        if (this.mV) {
            this.context.unregisterReceiver(this.mW);
            this.mV = false;
        }
    }

    /* access modifiers changed from: 0000 */
    @SuppressLint({"MissingPermission"})
    public boolean isConnected(@NonNull Context context2) {
        boolean z = true;
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) i.checkNotNull((ConnectivityManager) context2.getSystemService("connectivity"))).getActiveNetworkInfo();
            if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
                z = false;
            }
            return z;
        } catch (RuntimeException e) {
            if (Log.isLoggable(TAG, 5)) {
                Log.w(TAG, "Failed to determine connectivity status when connectivity changed", e);
            }
            return true;
        }
    }

    public void onDestroy() {
    }

    public void onStart() {
        register();
    }

    public void onStop() {
        unregister();
    }
}
