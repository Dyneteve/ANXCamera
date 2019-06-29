package com.ss.android.vesdk;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;

public final class VEReactSettings {
    private float mAlpha;
    private boolean mIsFitMode;
    private String mReactAudioPath;
    private float[] mReactInitalReagion;
    private float[] mReactPosMarginPercent;
    private String mReactVideoPath;

    public VEReactSettings(@NonNull String str, @NonNull String str2, @NonNull float[] fArr, @NonNull float[] fArr2, float f, boolean z) {
        this.mReactVideoPath = str;
        this.mReactAudioPath = str2;
        this.mReactPosMarginPercent = fArr;
        this.mReactInitalReagion = fArr2;
        this.mAlpha = f;
        this.mIsFitMode = z;
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public boolean getIsFitMode() {
        return this.mIsFitMode;
    }

    @Nullable
    public String getReactAudioPath() {
        return this.mReactAudioPath;
    }

    @Nullable
    public String getReactVideoPath() {
        return this.mReactVideoPath;
    }

    @NonNull
    public float[] getReactionInitalRegion() {
        return this.mReactInitalReagion;
    }

    @NonNull
    public float[] getReactionPosMargin() {
        return this.mReactPosMarginPercent;
    }
}
