package com.android.camera.module.loader;

import com.android.camera.Camera;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.effect.EffectController;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;

public class FunctionModuleSetup extends Func1Base<BaseModule, BaseModule> {
    private static final String TAG = FunctionModuleSetup.class.getSimpleName();

    public FunctionModuleSetup(int i) {
        super(i);
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("apply: module isPresent = ");
        sb.append(nullHolder.isPresent());
        Log.d(str, sb.toString());
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        BaseModule baseModule = (BaseModule) nullHolder.get();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        EffectController.getInstance().reset();
        Camera activity = baseModule.getActivity();
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        switch (this.mTargetMode) {
            case 162:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 163:
                dataItemRunning.switchOn("pref_camera_square_mode_key");
                break;
            case 165:
                dataItemRunning.switchOn("pref_camera_square_mode_key");
                break;
            case 167:
                dataItemRunning.switchOn("pref_camera_manual_mode_key");
                break;
            case 168:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOn("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 169:
                dataItemRunning.switchOn("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOff("pref_video_speed_hfr_key");
                break;
            case 170:
                dataItemRunning.switchOff("pref_video_speed_fast_key");
                dataItemRunning.switchOff("pref_video_speed_slow_key");
                dataItemRunning.switchOn("pref_video_speed_hfr_key");
                break;
            case 171:
                if (dataItemGlobal.getCurrentCameraId() != 0) {
                    dataItemRunning.switchOff("pref_camera_portrait_mode_key");
                    break;
                } else {
                    dataItemRunning.switchOn("pref_camera_portrait_mode_key");
                    break;
                }
            case 174:
                if (activity.startFromKeyguard()) {
                    dataItemRunning.setLiveConfigIsNeedRestore(false);
                    break;
                }
                break;
            case 175:
                int currentCameraId = dataItemGlobal.getCurrentCameraId();
                dataItemRunning.getComponentUltraPixel().switchOnCurrentSupported(175, currentCameraId, Camera2DataContainer.getInstance().getCapabilitiesByBogusCameraId(currentCameraId, 175));
                break;
        }
        baseModule.getActivity().removeNewBie();
        if (baseModule.isDeparted()) {
            return NullHolder.ofNullable(baseModule, 225);
        }
        try {
            baseModule.setCameraDevice(Camera2OpenManager.getInstance().getCurrentCamera2Device());
            baseModule.onCreate(this.mTargetMode, dataItemGlobal.getCurrentCameraId());
            if (baseModule.isCreated()) {
                baseModule.onResume();
                baseModule.registerProtocol();
            }
            return nullHolder;
        } catch (IllegalArgumentException | NullPointerException e) {
            Log.e(TAG, "Module init error: ", e);
            baseModule.setDeparted();
            return NullHolder.ofNullable(null, 237);
        }
    }

    public Scheduler getWorkThread() {
        return GlobalConstant.sCameraSetupScheduler;
    }
}
