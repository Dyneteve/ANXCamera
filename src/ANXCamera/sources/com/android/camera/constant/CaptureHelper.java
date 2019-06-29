package com.android.camera.constant;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class CaptureHelper {
    public static final int APPLY_BURST = 4;
    public static final int APPLY_CAPTURE = 3;
    public static final int APPLY_PREVIEW = 1;
    public static final int APPLY_PRE_CAPTURE = 6;
    public static final int[] FLASH_AE_PRIOR_FLOW = new int[0];
    public static final int[] FLASH_AF_PRIOR_FLOW = new int[0];
    public static final int[] FLASH_LEGACY_FLOW = {2, 1, 3};
    public static final int[] FLASH_NON_AF_FLOW = new int[0];
    public static final int[] NORMAL_AE_PRIOR_FLOW = new int[0];
    public static final int STATE_PICTURE_TAKEN = 8;
    public static final int STATE_PREVIEWING = 1;
    public static final int STATE_WAITING_AE_CONVERGED = 5;
    public static final int STATE_WAITING_AE_LOCK = 4;
    public static final int STATE_WAITING_AF_LOCK = 3;
    public static final int STATE_WAITING_FLASH_CLOSE = 9;
    public static final int STATE_WAITING_FLASH_CLOSE_AND_STOP_PREVIEW = 11;
    public static final int STATE_WAITING_FLASH_FIRED = 10;
    public static final int STATE_WAITING_NON_PRECAPTURE = 7;
    public static final int STATE_WAITING_PRECAPTURE = 6;
    public static final int STATE_WAITING_PREVIEW = 0;
    public static final int TRIGGER_LOCK_AE = 3;
    public static final int TRIGGER_LOCK_AF = 2;
    public static final int TRIGGER_PRE_CAPTURE = 1;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ApplyType {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface CaptureStep {
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface PictureState {
    }

    public int getWaitingStateByCaptureStep(int i) {
        switch (i) {
            case 1:
                return 6;
            case 2:
                return 3;
            case 3:
                return 4;
            default:
                throw new IllegalArgumentException("unKnown capture step");
        }
    }
}
