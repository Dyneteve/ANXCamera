package android.os.statistics;

import android.os.Bundle;
import android.os.Process;
import android.os.RemoteException;
import android.os.SystemClock;
import com.android.internal.app.IPerfShielder;
import com.miui.daemon.performance.PerfShielderManager;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public final class E2EScenarioPerfTracer {
    private static final int VERSION = 1;
    private static final ThreadPoolExecutor executor;

    static {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(1, 1, 0, TimeUnit.MILLISECONDS, new LinkedBlockingQueue());
        executor = threadPoolExecutor;
    }

    private E2EScenarioPerfTracer() {
    }

    public static void abortScenario(Bundle bundle) {
        if (bundle != null) {
            IPerfShielder service = PerfShielderManager.getService();
            if (service != null) {
                int myTid = Process.myTid();
                long uptimeMillis = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = service;
                final Bundle bundle2 = bundle;
                final int i = myTid;
                final long j = uptimeMillis;
                AnonymousClass3 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.abortSpecificScenario(bundle2, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }

    public static void abortScenario(E2EScenario e2EScenario) {
        abortScenario(e2EScenario, "");
    }

    public static void abortScenario(E2EScenario e2EScenario, String str) {
        if (e2EScenario != null && e2EScenario.isValid()) {
            IPerfShielder service = PerfShielderManager.getService();
            if (service != null) {
                int myTid = Process.myTid();
                long uptimeMillis = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = service;
                final E2EScenario e2EScenario2 = e2EScenario;
                final String str2 = str;
                final int i = myTid;
                final long j = uptimeMillis;
                AnonymousClass2 r1 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.abortMatchingScenario(e2EScenario2, str2, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r1);
            }
        }
    }

    public static void asyncBeginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings) {
        asyncBeginScenario(e2EScenario, e2EScenarioSettings, "", null);
    }

    public static void asyncBeginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, E2EScenarioPayload e2EScenarioPayload) {
        asyncBeginScenario(e2EScenario, e2EScenarioSettings, "", e2EScenarioPayload);
    }

    public static void asyncBeginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str) {
        asyncBeginScenario(e2EScenario, e2EScenarioSettings, str, null);
    }

    public static void asyncBeginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str, E2EScenarioPayload e2EScenarioPayload) {
        if (e2EScenario != null && e2EScenario.isValid() && e2EScenarioSettings != null && e2EScenarioSettings.isValid()) {
            IPerfShielder service = PerfShielderManager.getService();
            if (service != null) {
                int myTid = Process.myTid();
                long uptimeMillis = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = service;
                final E2EScenario e2EScenario2 = e2EScenario;
                final E2EScenarioSettings e2EScenarioSettings2 = e2EScenarioSettings;
                final String str2 = str;
                final E2EScenarioPayload e2EScenarioPayload2 = e2EScenarioPayload;
                final int i = myTid;
                AnonymousClass1 r9 = r0;
                final long j = uptimeMillis;
                AnonymousClass1 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.beginScenario(e2EScenario2, e2EScenarioSettings2, str2, e2EScenarioPayload2, i, j, false);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r9);
            }
        }
    }

    public static Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings) {
        return beginScenario(e2EScenario, e2EScenarioSettings, "", null);
    }

    public static Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, E2EScenarioPayload e2EScenarioPayload) {
        return beginScenario(e2EScenario, e2EScenarioSettings, "", e2EScenarioPayload);
    }

    public static Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str) {
        return beginScenario(e2EScenario, e2EScenarioSettings, str, null);
    }

    public static Bundle beginScenario(E2EScenario e2EScenario, E2EScenarioSettings e2EScenarioSettings, String str, E2EScenarioPayload e2EScenarioPayload) {
        if (e2EScenario == null || !e2EScenario.isValid() || e2EScenarioSettings == null || !e2EScenarioSettings.isValid()) {
            return null;
        }
        IPerfShielder service = PerfShielderManager.getService();
        if (service == null) {
            return null;
        }
        try {
            return service.beginScenario(e2EScenario, e2EScenarioSettings, str, e2EScenarioPayload, Process.myTid(), 0, true);
        } catch (RemoteException e) {
            return null;
        }
    }

    public static void finishScenario(Bundle bundle) {
        finishScenario(bundle, (E2EScenarioPayload) null);
    }

    public static void finishScenario(Bundle bundle, E2EScenarioPayload e2EScenarioPayload) {
        if (bundle != null) {
            IPerfShielder service = PerfShielderManager.getService();
            if (service != null) {
                int myTid = Process.myTid();
                long uptimeMillis = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = service;
                final Bundle bundle2 = bundle;
                final E2EScenarioPayload e2EScenarioPayload2 = e2EScenarioPayload;
                final int i = myTid;
                final long j = uptimeMillis;
                AnonymousClass5 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.finishSpecificScenario(bundle2, e2EScenarioPayload2, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }

    public static void finishScenario(E2EScenario e2EScenario) {
        finishScenario(e2EScenario, "", null);
    }

    public static void finishScenario(E2EScenario e2EScenario, E2EScenarioPayload e2EScenarioPayload) {
        finishScenario(e2EScenario, "", e2EScenarioPayload);
    }

    public static void finishScenario(E2EScenario e2EScenario, String str) {
        finishScenario(e2EScenario, str, null);
    }

    public static void finishScenario(E2EScenario e2EScenario, String str, E2EScenarioPayload e2EScenarioPayload) {
        if (e2EScenario != null && e2EScenario.isValid()) {
            IPerfShielder service = PerfShielderManager.getService();
            if (service != null) {
                int myTid = Process.myTid();
                long uptimeMillis = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = service;
                final E2EScenario e2EScenario2 = e2EScenario;
                final String str2 = str;
                final E2EScenarioPayload e2EScenarioPayload2 = e2EScenarioPayload;
                final int i = myTid;
                final long j = uptimeMillis;
                AnonymousClass4 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.finishMatchingScenario(e2EScenario2, str2, e2EScenarioPayload2, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }

    public static int getVersion() {
        return 1;
    }
}
