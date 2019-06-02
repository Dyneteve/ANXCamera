package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.constant.AsdSceneConstant;
import com.android.camera.module.BaseModule;
import com.android.camera2.Camera2Proxy;
import com.mi.config.b;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdScene implements Function<CaptureResult, Integer> {
    private static final String TAG = "FunctionParseAsdScene";
    private WeakReference<BaseModule> mModuleWeakReference;

    public FunctionParseAsdScene(BaseModule baseModule) {
        this.mModuleWeakReference = new WeakReference<>(baseModule);
    }

    public Integer apply(CaptureResult captureResult) {
        BaseModule baseModule = (BaseModule) this.mModuleWeakReference.get();
        if (baseModule != null) {
            Camera2Proxy cameraDevice = baseModule.getCameraDevice();
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
            boolean isFrontCamera = baseModule.isFrontCamera();
            boolean isScreenSlideOff = baseModule.getActivity() != null ? baseModule.getActivity().isScreenSlideOff() : false;
            if (baseModule.isPortraitMode() || isFrontCamera) {
                return Integer.valueOf(AsdSceneConstant.parseRtbSceneResult(captureResult, isFrontCamera, isScreenSlideOff));
            }
            if (num != null && num.intValue() == 4 && b.hp() && cameraDevice != null && 3 == cameraDevice.getFlashMode()) {
                return Integer.valueOf(0);
            }
        }
        return Integer.valueOf(-1);
    }
}
