package com.android.camera.constant;

import android.hardware.camera2.CaptureResult;
import com.android.camera.data.DataRepository;
import com.android.camera2.CaptureResultParser;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class AsdSceneConstant {
    private static final float AEC_LUX_HEIGHT_LIGHT = ((float) DataRepository.dataItemFeature().gl());
    private static final float AEC_LUX_LAST_LIGHT = ((float) DataRepository.dataItemFeature().gk());
    private static final float AEC_LUX_LOW_LIGHT = 450.0f;
    private static final int FRAME_BYPASS_NUMBER = 2;
    private static final float LENS_FOCUS_DISTANCE_TOO_CLOSE = 2.5f;
    private static final float LENS_FOCUS_DISTANCE_TOO_FAR = 0.5f;
    public static final int SCENE_FLASH = 0;
    public static final int SCENE_FLASH_FRONT = 9;
    public static final int SCENE_HDR = 1;
    public static final int SCENE_MOTION = 3;
    public static final int SCENE_NIGHT = 2;
    public static final int SCENE_NONE = -1;
    public static final int SCENE_RTB_DEPTH_EFFECT_SUCCESS = 7;
    public static final int SCENE_RTB_LOW_LIGHT = 6;
    public static final int SCENE_RTB_TOO_CLOSE = 4;
    public static final int SCENE_RTB_TOO_FAR = 5;
    public static final int SCENE_TELE_NIGHT = 8;
    private static int mFrameNumber;
    private static boolean mIsFlashRetain;

    @Retention(RetentionPolicy.SOURCE)
    public @interface SceneResult {
    }

    public static int parseRtbSceneResult(CaptureResult captureResult, boolean z, boolean z2) {
        float aecLux = CaptureResultParser.getAecLux(captureResult);
        if (!z) {
            mIsFlashRetain = false;
            if (aecLux > AEC_LUX_LOW_LIGHT) {
                return 6;
            }
            if (captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE) == null) {
                return -1;
            }
            float floatValue = ((Float) captureResult.get(CaptureResult.LENS_FOCUS_DISTANCE)).floatValue();
            if (floatValue >= LENS_FOCUS_DISTANCE_TOO_CLOSE) {
                return 4;
            }
            return floatValue <= 0.5f ? 5 : 7;
        } else if (z2) {
            mFrameNumber = 0;
            return -1;
        } else if (DataRepository.dataItemFeature().fY() && mFrameNumber < 2) {
            mFrameNumber++;
            return -1;
        } else if (mIsFlashRetain && aecLux > AEC_LUX_HEIGHT_LIGHT) {
            return 9;
        } else {
            if (aecLux > AEC_LUX_LAST_LIGHT) {
                mIsFlashRetain = true;
                return 9;
            }
            mIsFlashRetain = false;
            return -1;
        }
    }
}
