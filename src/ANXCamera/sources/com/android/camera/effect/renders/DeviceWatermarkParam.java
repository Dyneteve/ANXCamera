package com.android.camera.effect.renders;

public class DeviceWatermarkParam {
    private boolean mIsDualWatermarkEnable;
    private boolean mIsFrontWatermarkEnable;
    private float mPaddingX;
    private float mPaddingY;
    private String mPath;
    private float mSize;

    public DeviceWatermarkParam(boolean z, boolean z2, String str, float f, float f2, float f3) {
        this.mIsDualWatermarkEnable = z;
        this.mIsFrontWatermarkEnable = z2;
        this.mPath = str;
        this.mSize = f;
        this.mPaddingX = f2;
        this.mPaddingY = f3;
    }

    public float getPaddingX() {
        return this.mPaddingX;
    }

    public float getPaddingY() {
        return this.mPaddingY;
    }

    public String getPath() {
        return this.mPath;
    }

    public float getSize() {
        return this.mSize;
    }

    public boolean isDualWatermarkEnable() {
        return this.mIsDualWatermarkEnable;
    }

    public boolean isFrontWatermarkEnable() {
        return this.mIsFrontWatermarkEnable;
    }
}
