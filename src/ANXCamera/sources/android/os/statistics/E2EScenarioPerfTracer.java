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

    public static int getVersion() {
        return 1;
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings) {
        return beginScenario(scenario, settings, "", null);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag) {
        return beginScenario(scenario, settings, tag, null);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, E2EScenarioPayload payload) {
        return beginScenario(scenario, settings, "", payload);
    }

    public static Bundle beginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag, E2EScenarioPayload payload) {
        if (scenario == null || !scenario.isValid() || settings == null || !settings.isValid()) {
            return null;
        }
        IPerfShielder perfShielder = PerfShielderManager.getService();
        if (perfShielder == null) {
            return null;
        }
        try {
            return perfShielder.beginScenario(scenario, settings, tag, payload, Process.myTid(), 0, true);
        } catch (RemoteException e) {
            return null;
        }
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings) {
        asyncBeginScenario(scenario, settings, "", null);
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag) {
        asyncBeginScenario(scenario, settings, tag, null);
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, E2EScenarioPayload payload) {
        asyncBeginScenario(scenario, settings, "", payload);
    }

    public static void asyncBeginScenario(E2EScenario scenario, E2EScenarioSettings settings, String tag, E2EScenarioPayload payload) {
        if (scenario != null && scenario.isValid() && settings != null && settings.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final E2EScenarioSettings e2EScenarioSettings = settings;
                final String str = tag;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                AnonymousClass1 r9 = r0;
                final long j = uptimeMs;
                AnonymousClass1 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.beginScenario(e2EScenario, e2EScenarioSettings, str, e2EScenarioPayload, i, j, false);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r9);
            }
        }
    }

    public static void abortScenario(E2EScenario scenario) {
        abortScenario(scenario, "");
    }

    public static void abortScenario(E2EScenario scenario, String tag) {
        if (scenario != null && scenario.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final String str = tag;
                final int i = tid;
                final long j = uptimeMs;
                AnonymousClass2 r1 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.abortMatchingScenario(e2EScenario, str, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r1);
            }
        }
    }

    public static void abortScenario(Bundle scenarioBundle) {
        if (scenarioBundle != null) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final Bundle bundle = scenarioBundle;
                final int i = tid;
                final long j = uptimeMs;
                AnonymousClass3 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.abortSpecificScenario(bundle, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }

    public static void finishScenario(E2EScenario scenario) {
        finishScenario(scenario, "", null);
    }

    public static void finishScenario(E2EScenario scenario, E2EScenarioPayload payload) {
        finishScenario(scenario, "", payload);
    }

    public static void finishScenario(E2EScenario scenario, String tag) {
        finishScenario(scenario, tag, null);
    }

    public static void finishScenario(E2EScenario scenario, String tag, E2EScenarioPayload payload) {
        if (scenario != null && scenario.isValid()) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final E2EScenario e2EScenario = scenario;
                final String str = tag;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                final long j = uptimeMs;
                AnonymousClass4 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.finishMatchingScenario(e2EScenario, str, e2EScenarioPayload, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }

    public static void finishScenario(Bundle scenarioBundle) {
        finishScenario(scenarioBundle, (E2EScenarioPayload) null);
    }

    public static void finishScenario(Bundle scenarioBundle, E2EScenarioPayload payload) {
        if (scenarioBundle != null) {
            IPerfShielder perfShielder = PerfShielderManager.getService();
            if (perfShielder != null) {
                int tid = Process.myTid();
                long uptimeMs = SystemClock.uptimeMillis();
                ThreadPoolExecutor threadPoolExecutor = executor;
                final IPerfShielder iPerfShielder = perfShielder;
                final Bundle bundle = scenarioBundle;
                final E2EScenarioPayload e2EScenarioPayload = payload;
                final int i = tid;
                final long j = uptimeMs;
                AnonymousClass5 r0 = new Runnable() {
                    public void run() {
                        try {
                            IPerfShielder.this.finishSpecificScenario(bundle, e2EScenarioPayload, i, j);
                        } catch (RemoteException e) {
                        }
                    }
                };
                threadPoolExecutor.execute(r0);
            }
        }
    }
}
