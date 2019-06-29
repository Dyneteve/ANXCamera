package com.android.camera.module.loader;

import android.hardware.camera2.CaptureResult;
import com.android.camera.CameraSettings;
import com.android.camera.data.DataRepository;
import com.android.camera.module.Camera2Module;
import com.android.camera2.Camera2Proxy.UltraWideCheckCallback;
import com.android.camera2.CaptureResultParser;
import io.reactivex.functions.Function;
import java.lang.ref.WeakReference;

public class FunctionParseAsdUltraWide implements Function<CaptureResult, CaptureResult> {
    private static final int[] ULTRA_WIDE_RECOM = {2, 1};
    public static final int ULTRA_WIDE_SIDEFACE_TYPE = 2;
    public static final int ULTRA_WIDE_TOWER_BUILDING_TYPE = 1;
    private boolean mEnable;
    private boolean mIsOpenUltraWide;
    private WeakReference<UltraWideCheckCallback> mUltrawidecheckcallback;

    public FunctionParseAsdUltraWide(int i, UltraWideCheckCallback ultraWideCheckCallback) {
        this.mEnable = DataRepository.dataItemFeature().isSupportUltraWide() && i == 163 && !CameraSettings.isUltraWideConfigOpen(i) && !CameraSettings.isUltraPixelOn() && !CameraSettings.isMacroModeEnabled(i);
        if (this.mEnable) {
            this.mUltrawidecheckcallback = new WeakReference<>(ultraWideCheckCallback);
        }
    }

    private boolean isOpenUltraWide(int i) {
        boolean z = false;
        for (int i2 = 0; i2 < ULTRA_WIDE_RECOM.length; i2++) {
            z = ULTRA_WIDE_RECOM[i2] == i;
            if (z) {
                return z;
            }
        }
        return z;
    }

    public CaptureResult apply(CaptureResult captureResult) throws Exception {
        if (!this.mEnable) {
            return captureResult;
        }
        UltraWideCheckCallback ultraWideCheckCallback = (UltraWideCheckCallback) this.mUltrawidecheckcallback.get();
        if (ultraWideCheckCallback == null || !ultraWideCheckCallback.isUltraWideDetectStarted()) {
            return captureResult;
        }
        int ultraWideDetectedResult = CaptureResultParser.getUltraWideDetectedResult(captureResult);
        boolean isOpenUltraWide = isOpenUltraWide(ultraWideDetectedResult);
        if (((Camera2Module) ultraWideCheckCallback).isZoomRatioBetweenUltraAndWide()) {
            isOpenUltraWide = false;
        }
        if (this.mIsOpenUltraWide == isOpenUltraWide) {
            return captureResult;
        }
        this.mIsOpenUltraWide = isOpenUltraWide;
        ultraWideCheckCallback.onUltraWideChanged(isOpenUltraWide, ultraWideDetectedResult);
        return captureResult;
    }
}
