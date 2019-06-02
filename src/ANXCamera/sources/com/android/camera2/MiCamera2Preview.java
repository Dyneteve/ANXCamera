package com.android.camera2;

public abstract class MiCamera2Preview {
    protected int mBogusCameraId;
    protected int mCurrentModule;

    public MiCamera2Preview(int i, int i2) {
        this.mCurrentModule = i;
        this.mBogusCameraId = i2;
    }

    public boolean needForCapture() {
        return this.mCurrentModule == 163 || this.mCurrentModule == 165 || this.mCurrentModule == 167 || this.mCurrentModule == 173 || this.mCurrentModule == 175;
    }

    public boolean needForFrontCamera() {
        return this.mBogusCameraId == 1;
    }

    public boolean needForManually() {
        return this.mCurrentModule == 167;
    }

    public boolean needForPortrait() {
        return this.mCurrentModule == 171;
    }

    public boolean needForSuperNight() {
        return this.mCurrentModule == 173;
    }

    public boolean needForVideo() {
        return this.mCurrentModule == 162 || this.mCurrentModule == 169 || this.mCurrentModule == 168 || this.mCurrentModule == 161 || this.mCurrentModule == 174 || this.mCurrentModule == 172;
    }

    public boolean needResumePreviewAfterCapture(CameraConfigs cameraConfigs) {
        return cameraConfigs.isNeedFlash() || needForSuperNight();
    }
}
