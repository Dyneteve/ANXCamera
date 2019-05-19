package com.android.camera.parallel;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.android.camera.LocalParallelService;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.LocalParallelService.ServiceStatusListener;
import com.android.camera.log.Log;

public class AlgoConnector {
    /* access modifiers changed from: private */
    public static final String TAG = AlgoConnector.class.getSimpleName();
    /* access modifiers changed from: private */
    public static final AlgoConnector ourInstance = new AlgoConnector();
    /* access modifiers changed from: private */
    public LocalBinder mLocalBinder;
    private final ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            String access$000 = AlgoConnector.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onServiceConnected: ");
            sb.append(componentName);
            Log.d(access$000, sb.toString());
            synchronized (AlgoConnector.ourInstance) {
                AlgoConnector.this.mLocalBinder = (LocalBinder) iBinder;
                AlgoConnector.ourInstance.notify();
            }
        }

        public void onServiceDisconnected(ComponentName componentName) {
            Log.d(AlgoConnector.TAG, "onServiceDisconnected");
            synchronized (AlgoConnector.ourInstance) {
                AlgoConnector.this.mLocalBinder = null;
                AlgoConnector.ourInstance.notify();
            }
        }
    };

    private AlgoConnector() {
    }

    public static AlgoConnector getInstance() {
        return ourInstance;
    }

    public LocalBinder getLocalBinder() {
        return getLocalBinder(false);
    }

    public LocalBinder getLocalBinder(boolean z) {
        if (z) {
            int i = 0;
            synchronized (ourInstance) {
                while (this.mLocalBinder == null && i < 50) {
                    try {
                        ourInstance.wait(100);
                        i++;
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("waiting service...");
                        sb.append(i);
                        Log.w(str, sb.toString());
                    } catch (InterruptedException e) {
                        Log.e(TAG, e.getMessage(), e);
                    }
                }
            }
        }
        return this.mLocalBinder;
    }

    public void setServiceStatusListener(ServiceStatusListener serviceStatusListener) {
        if (serviceStatusListener != null && this.mLocalBinder != null) {
            this.mLocalBinder.setOnPictureTakenListener(serviceStatusListener);
        }
    }

    public void startService(Context context) {
        if (this.mLocalBinder == null) {
            Log.d(TAG, "startService: bind LocalParallelService start!");
            context.bindService(new Intent(context, LocalParallelService.class), this.mServiceConnection, 67108929);
        }
    }
}
