package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera2.Camera2Proxy.LivePhotoResultCallback;
import com.xiaomi.camera.liveshot.LivePhotoResult;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdLivePhoto implements Function<CaptureResult, CaptureResult> {
    private WeakReference<LivePhotoResultCallback> mLivePhotoResultCallbackReference;

    public FunctionParseAsdLivePhoto(LivePhotoResultCallback livePhotoResultCallback) {
        this.mLivePhotoResultCallbackReference = new WeakReference<>(livePhotoResultCallback);
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        LivePhotoResultCallback livePhotoResultCallback = (LivePhotoResultCallback) this.mLivePhotoResultCallbackReference.get();
        if (livePhotoResultCallback == null || !livePhotoResultCallback.isLivePhotoStarted()) {
            return captureResult;
        }
        Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
        Integer num2 = (Integer) captureResult.get(CaptureResult.CONTROL_AWB_STATE);
        Long l = (Long) captureResult.get(CaptureResult.SENSOR_TIMESTAMP);
        LivePhotoResult livePhotoResult = new LivePhotoResult();
        int i = 0;
        livePhotoResult.setAEState(num == null ? 0 : num.intValue());
        if (num2 != null) {
            i = num2.intValue();
        }
        livePhotoResult.setAWBState(i);
        livePhotoResult.setTimeStamp(l == null ? 0 : l.longValue());
        livePhotoResult.setGyroscropStable(livePhotoResultCallback.isGyroStable());
        livePhotoResult.setFilterId(livePhotoResultCallback.getFilterId());
        livePhotoResultCallback.onLivePhotoResultCallback(livePhotoResult);
        return captureResult;
    }
}
