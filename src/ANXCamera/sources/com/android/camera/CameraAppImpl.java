package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.android.camera.network.util.NetworkUtils;
import com.android.camera.parallel.AlgoConnector;
import com.miui.filtersdk.BeautificationSDK;
import miui.external.Application;

public class CameraAppImpl extends Application {
    private static CameraApplicationDelegate sApplicationDelegate;
    private boolean sLaunched = true;

    public static Context getAndroidContext() {
        return CameraApplicationDelegate.getAndroidContext();
    }

    public void addActivity(Activity activity) {
        sApplicationDelegate.addActivity(activity);
    }

    public void closeAllActivitiesBut(Activity activity) {
        sApplicationDelegate.closeAllActivitiesBut(activity);
    }

    public boolean containsResumedCameraInStack() {
        return sApplicationDelegate.containsResumedCameraInStack();
    }

    public Activity getActivity(int i) {
        return sApplicationDelegate.getActivity(i);
    }

    public int getActivityCount() {
        return sApplicationDelegate.getActivityCount();
    }

    public boolean isApplicationFirstLaunched() {
        if (!this.sLaunched) {
            return this.sLaunched;
        }
        this.sLaunched = !this.sLaunched;
        return !this.sLaunched;
    }

    public boolean isMainIntentActivityLaunched() {
        return sApplicationDelegate.isMainIntentActivityLaunched();
    }

    public boolean isNeedRestore() {
        return sApplicationDelegate.getSettingsFlag();
    }

    public CameraApplicationDelegate onCreateApplicationDelegate() {
        if (sApplicationDelegate == null) {
            sApplicationDelegate = new CameraApplicationDelegate(this);
        }
        if (CameraSettings.isSupportParallelProcess() && CameraSettings.isCameraParallelProcessEnable()) {
            AlgoConnector.getInstance().startService(this);
        }
        CrashHandler.getInstance().init(this);
        NetworkUtils.bind(this);
        BeautificationSDK.init(this);
        return sApplicationDelegate;
    }

    public void removeActivity(Activity activity) {
        sApplicationDelegate.removeActivity(activity);
    }

    public void resetRestoreFlag() {
        sApplicationDelegate.resetRestoreFlag();
    }
}
