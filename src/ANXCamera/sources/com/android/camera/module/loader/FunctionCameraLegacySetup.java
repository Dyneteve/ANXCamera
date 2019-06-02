package com.android.camera.module.loader;

import com.android.camera.module.BaseModule;
import io.reactivex.Scheduler;
import io.reactivex.annotations.NonNull;
import io.reactivex.schedulers.Schedulers;

public class FunctionCameraLegacySetup extends Func1Base<BaseModule, BaseModule> {
    private static final String TAG = "CameraSetup";

    public FunctionCameraLegacySetup(int i) {
        super(i);
    }

    public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
        if (!nullHolder.isPresent()) {
            return nullHolder;
        }
        BaseModule baseModule = (BaseModule) nullHolder.get();
        return baseModule.isDeparted() ? NullHolder.ofNullable(baseModule, 225) : nullHolder;
    }

    public Scheduler getWorkThread() {
        return Schedulers.io();
    }
}
