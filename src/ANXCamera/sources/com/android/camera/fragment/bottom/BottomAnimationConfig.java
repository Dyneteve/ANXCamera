package com.android.camera.fragment.bottom;

import com.android.camera.constant.DurationConstant;

public class BottomAnimationConfig {
    public int mCurrentMode;
    public int mDuration;
    public boolean mIsFPS960;
    public boolean mIsInMimojiCreate;
    public boolean mIsPostProcessing;
    public boolean mIsRecordingCircle;
    public boolean mIsRoundingCircle;
    public boolean mIsStart;
    public boolean mIsVideoBokeh;
    public boolean mNeedFinishRecord;
    public boolean mShouldRepeat;

    private BottomAnimationConfig(boolean z, int i, boolean z2, boolean z3, boolean z4) {
        this.mIsPostProcessing = z;
        this.mCurrentMode = i;
        this.mIsStart = z2;
        this.mIsFPS960 = z3;
        this.mIsVideoBokeh = z4;
    }

    public static BottomAnimationConfig generate(boolean z, int i, boolean z2, boolean z3, boolean z4) {
        BottomAnimationConfig bottomAnimationConfig = new BottomAnimationConfig(z, i, z2, z3, z4);
        return bottomAnimationConfig;
    }

    public BottomAnimationConfig configVariables() {
        if (this.mIsFPS960) {
            this.mDuration = 2000;
        } else if (this.mCurrentMode == 173) {
            this.mDuration = 2000;
        } else if (this.mCurrentMode == 162 && this.mIsVideoBokeh) {
            this.mDuration = 30000;
        } else if (this.mCurrentMode == 161 || this.mCurrentMode == 177) {
            this.mDuration = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
        } else if (this.mCurrentMode == 174) {
            this.mDuration = DurationConstant.DURATION_LIVE_RECORD;
        } else {
            this.mDuration = 10000;
        }
        boolean z = false;
        this.mShouldRepeat = (this.mCurrentMode == 161 || this.mCurrentMode == 177 || (this.mCurrentMode == 162 && this.mIsVideoBokeh) || this.mCurrentMode == 173 || this.mIsFPS960) ? false : true;
        this.mIsRecordingCircle = this.mCurrentMode == 173;
        this.mIsRoundingCircle = this.mCurrentMode == 177;
        if ((this.mCurrentMode == 173 || this.mIsFPS960) && !this.mIsPostProcessing) {
            z = true;
        }
        this.mNeedFinishRecord = z;
        return this;
    }
}
