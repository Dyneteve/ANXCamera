package com.android.camera;

import android.app.Activity;
import android.content.Context;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.statistic.CameraStat;
import java.util.Stack;
import miui.external.ApplicationDelegate;

public class CameraApplicationDelegate extends ApplicationDelegate {
    private static CameraAppImpl sContext;
    private Stack<Activity> mActivities;
    private boolean mMainIntentActivityLaunched = false;
    private boolean mRestoreSetting = false;

    public CameraApplicationDelegate(CameraAppImpl cameraAppImpl) {
        sContext = cameraAppImpl;
    }

    public static Context getAndroidContext() {
        return sContext;
    }

    public synchronized void addActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = true;
            }
            this.mActivities.push(activity);
        }
    }

    public synchronized void closeAllActivitiesBut(Activity activity) {
        int i = 0;
        for (int i2 = 0; i2 < getActivityCount(); i2++) {
            Activity activity2 = getActivity(i);
            if (activity2 == activity || "android.intent.action.MAIN".equals(activity2.getIntent().getAction())) {
                i++;
            } else {
                activity2.finish();
                this.mActivities.remove(activity2);
            }
        }
    }

    public synchronized boolean containsResumedCameraInStack() {
        for (int size = this.mActivities.size() - 1; size >= 0; size--) {
            Activity activity = (Activity) this.mActivities.get(size);
            if ((activity instanceof Camera) && !((Camera) activity).isActivityPaused()) {
                return true;
            }
        }
        return false;
    }

    public synchronized Activity getActivity(int i) {
        if (i >= 0) {
            if (i < getActivityCount()) {
                return (Activity) this.mActivities.get(i);
            }
        }
        return null;
    }

    public synchronized int getActivityCount() {
        return this.mActivities.size();
    }

    public boolean getSettingsFlag() {
        return this.mRestoreSetting;
    }

    public boolean isMainIntentActivityLaunched() {
        return this.mMainIntentActivityLaunched;
    }

    public void onCreate() {
        super.onCreate();
        Util.initialize(this);
        GlobalConstant.sCameraSetupScheduler.scheduleDirect(new Runnable() {
            public void run() {
                Camera2DataContainer.getInstance();
            }
        });
        CameraStat.initialize(getAndroidContext());
        this.mActivities = new Stack<>();
        this.mRestoreSetting = true;
    }

    public synchronized void removeActivity(Activity activity) {
        if (activity != null) {
            if ("android.intent.action.MAIN".equals(activity.getIntent().getAction())) {
                this.mMainIntentActivityLaunched = false;
            }
            this.mActivities.remove(activity);
        }
    }

    public void resetRestoreFlag() {
        this.mRestoreSetting = false;
    }
}
