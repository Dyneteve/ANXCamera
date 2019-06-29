package com.miui.daemon.performance;

import android.os.Process;
import android.os.RemoteException;
import android.os.ServiceManager;
import com.android.internal.app.IPerfShielder;
import com.android.internal.app.IPerfShielder.Stub;

public class PerfShielderManager {
    public static final String PerfShieldService = "perfshielder";
    private static volatile IPerfShielder sPerfManager;

    private static boolean checkService() {
        return getService() != null;
    }

    public static Long getFreeMemory() {
        checkService();
        long j = 0;
        if (sPerfManager != null) {
            try {
                j = sPerfManager.getFreeMemory();
            } catch (RemoteException e) {
                j = Process.getFreeMemory();
                e.printStackTrace();
            }
        }
        return Long.valueOf(j);
    }

    public static IPerfShielder getService() {
        if (sPerfManager == null) {
            synchronized (PerfShielderManager.class) {
                if (sPerfManager == null) {
                    IPerfShielder asInterface = Stub.asInterface(ServiceManager.getService(PerfShieldService));
                    synchronized (PerfShielderManager.class) {
                        sPerfManager = asInterface;
                    }
                }
            }
        }
        return sPerfManager;
    }
}
