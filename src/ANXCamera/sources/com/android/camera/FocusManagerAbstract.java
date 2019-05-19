package com.android.camera;

import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.params.MeteringRectangle;
import com.android.camera.log.Log;

public abstract class FocusManagerAbstract {
    public static final int FOCUS_FROM_AUTO = 0;
    public static final int FOCUS_FROM_FACE = 1;
    public static final int FOCUS_FROM_FORCE = 4;
    public static final int FOCUS_FROM_LONG_PRESS = 5;
    public static final int FOCUS_FROM_NONE = -1;
    public static final int FOCUS_FROM_OBJECT_TRACK = 2;
    public static final int FOCUS_FROM_TOUCH = 3;
    public static final int STATE_FAIL = 4;
    public static final int STATE_FOCUSING = 1;
    public static final int STATE_FOCUSING_SNAP_ON_FINISH = 2;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SUCCESS = 3;
    private static final String TAG = "FocusManagerAbstract";
    protected final int FOCUS_AREA_HEIGHT = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_height);
    protected final float FOCUS_AREA_SCALE = 1.0f;
    protected final int FOCUS_AREA_WIDTH = CameraAppImpl.getAndroidContext().getResources().getDimensionPixelSize(R.dimen.focus_area_width);
    protected final float METERING_AREA_SCALE = 1.8f;
    protected Rect mActiveArraySize;
    protected boolean mCancelAutoFocusIfMove;
    protected int mDisplayOrientation;
    protected MeteringRectangle[] mFocusArea;
    protected boolean mInitialized = false;
    protected Matrix mMatrix = new Matrix();
    protected MeteringRectangle[] mMeteringArea;
    protected boolean mMirror;
    protected int mPreviewHeight;
    protected int mPreviewWidth;
    protected int mRenderHeight;
    protected int mRenderWidth;
    protected int mState = 0;

    /* access modifiers changed from: protected */
    public void calculateTapArea(int i, int i2, float f, int i3, int i4, int i5, int i6, Rect rect) {
        int i7 = (int) (((float) i) * f);
        int i8 = (int) (((float) i2) * f);
        int clamp = Util.clamp(i3 - (i7 / 2), 0, i5 - i7);
        int clamp2 = Util.clamp(i4 - (i8 / 2), 0, i6 - i8);
        Util.rectFToRect(new RectF((float) clamp, (float) clamp2, (float) (clamp + i7), (float) (clamp2 + i8)), rect);
    }

    public int getPreviewHeight() {
        return this.mPreviewHeight;
    }

    public int getPreviewWidth() {
        return this.mPreviewWidth;
    }

    public void setDisplayOrientation(int i) {
        this.mDisplayOrientation = i;
        setMatrix();
    }

    /* access modifiers changed from: protected */
    public void setMatrix() {
        if (this.mPreviewWidth != 0 && this.mPreviewHeight != 0) {
            Matrix matrix = new Matrix();
            Util.prepareMatrix(matrix, this.mMirror, this.mDisplayOrientation, this.mRenderWidth, this.mRenderHeight, Math.round(((float) this.mPreviewWidth) / 2.0f), Math.round(((float) this.mPreviewHeight) / 2.0f), this.mActiveArraySize.width(), this.mActiveArraySize.height());
            matrix.invert(this.mMatrix);
            this.mInitialized = true;
        }
    }

    public void setMirror(boolean z) {
        this.mMirror = z;
        setMatrix();
    }

    public abstract void setPreviewSize(int i, int i2);

    public void setRenderSize(int i, int i2) {
        if (i != this.mRenderWidth || i2 != this.mRenderHeight) {
            this.mRenderWidth = i;
            this.mRenderHeight = i2;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setRenderSize: ");
            sb.append(this.mRenderWidth);
            sb.append(" | ");
            sb.append(this.mRenderHeight);
            Log.e(str, sb.toString());
            setMatrix();
        }
    }
}
