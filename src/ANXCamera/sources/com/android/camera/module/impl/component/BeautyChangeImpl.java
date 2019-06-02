package com.android.camera.module.impl.component;

import com.android.camera.ActivityBase;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.OnFaceBeautyChangedProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;

public class BeautyChangeImpl implements OnFaceBeautyChangedProtocol {
    private static final String TAG = BeautyChangeImpl.class.getSimpleName();
    private ActivityBase mActivity;

    public BeautyChangeImpl(ActivityBase activityBase) {
        this.mActivity = activityBase;
    }

    public static BeautyChangeImpl create(ActivityBase activityBase) {
        return new BeautyChangeImpl(activityBase);
    }

    private BaseModule getBaseModule() {
        if (this.mActivity == null) {
            return null;
        }
        return (BaseModule) this.mActivity.getCurrentModule();
    }

    public static void preload() {
        Log.i(TAG, "preload");
    }

    public void onBeautyChanged(boolean z) {
        BaseModule baseModule = getBaseModule();
        if (baseModule != null && !baseModule.isDoingAction()) {
            int moduleIndex = baseModule.getModuleIndex();
            ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
            if (componentRunningShine.supportTopConfigEntry()) {
                boolean currentStatus = componentRunningShine.getCurrentStatus();
                boolean determineStatus = componentRunningShine.determineStatus(moduleIndex);
                if (currentStatus != determineStatus) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("beauty status changed: ");
                    sb.append(determineStatus);
                    Log.d(str, sb.toString());
                    baseModule.getHandler().post(new Runnable() {
                        public void run() {
                            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(212);
                        }
                    });
                }
            }
            if (!z) {
                getBaseModule().onBeautyParameterChanged();
            }
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.getInstance().attachProtocol(199, this);
    }

    public void unRegisterProtocol() {
        this.mActivity = null;
        ModeCoordinatorImpl.getInstance().detachProtocol(199, this);
    }
}
