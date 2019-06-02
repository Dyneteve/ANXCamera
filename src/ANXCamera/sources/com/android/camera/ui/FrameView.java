package com.android.camera.ui;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.View;
import com.android.camera.log.Log;
import com.android.camera2.CameraHardwareFace;

public abstract class FrameView extends View implements FocusIndicator, Rotatable {
    private static final String TAG = "FrameView";
    protected int mCameraDisplayOrientation;
    protected boolean mIsBigEnoughRect;
    protected Matrix mMatrix = new Matrix();
    protected boolean mMirror;
    protected int mOrientation;
    protected boolean mPause;

    public FrameView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public void clear() {
    }

    public boolean faceExists() {
        return false;
    }

    public abstract RectF getFocusRect();

    public boolean isFaceStable() {
        return true;
    }

    public boolean isNeedExposure() {
        return this.mIsBigEnoughRect;
    }

    public void pause() {
        this.mPause = true;
    }

    public void resume() {
        this.mPause = false;
    }

    public void setCameraDisplayOrientation(int i) {
        this.mCameraDisplayOrientation = i;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mCameraDisplayOrientation=");
        sb.append(i);
        Log.v(str, sb.toString());
    }

    public boolean setFaces(CameraHardwareFace[] cameraHardwareFaceArr) {
        return true;
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mMirror=");
        sb.append(z);
        Log.v(str, sb.toString());
    }

    public void setOrientation(int i, boolean z) {
        this.mOrientation = i;
        invalidate();
    }

    public void setShowGenderAndAge(boolean z) {
    }

    public void showFail() {
    }

    public void showStart() {
    }

    public void showSuccess() {
    }
}
