package com.android.camera.fragment.beauty;

@Deprecated
public class MakeupItem {
    private CameraBeautyParameterType cameraBeautyParameterType;
    private int mImageResource;
    private int mTextResource;

    public MakeupItem(int i, int i2) {
        this.mImageResource = i;
        this.mTextResource = i2;
    }

    public MakeupItem(int i, int i2, CameraBeautyParameterType cameraBeautyParameterType2) {
        this.mImageResource = i;
        this.mTextResource = i2;
        this.cameraBeautyParameterType = cameraBeautyParameterType2;
    }

    public CameraBeautyParameterType getCameraBeautyParameterType() {
        return this.cameraBeautyParameterType;
    }

    public int getImageResource() {
        return this.mImageResource;
    }

    public int getTextResource() {
        return this.mTextResource;
    }
}
