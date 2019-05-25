package com.android.camera.effect.renders;

import android.content.res.Resources;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.opengl.GLES20;
import com.android.camera.CameraAppImpl;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.EffectController.EffectRectAttribute;
import com.android.gallery3d.ui.GLCanvas;
import com.oneplus.camera.R;

public abstract class RegionEffectRender extends ConvolutionEffectRender {
    private EffectRectAttribute mAttribute;
    private int mThresholdHeight;
    private int mThresholdWidth;
    protected int mUniformEffectParameterH;
    protected int mUniformEffectRectH;
    protected int mUniformInvertRectH;

    public RegionEffectRender(GLCanvas gLCanvas) {
        super(gLCanvas);
        init();
    }

    public RegionEffectRender(GLCanvas gLCanvas, int i) {
        super(gLCanvas, i);
        init();
    }

    private Matrix getChangeMatrix() {
        Matrix matrix = new Matrix();
        matrix.reset();
        matrix.setRotate((float) (this.mOrientation - this.mJpegOrientation));
        matrix.preTranslate(-0.5f, -0.5f);
        matrix.postTranslate(0.5f, 0.5f);
        return matrix;
    }

    private float[] getEffectArray(boolean z) {
        if (z) {
            float[] fArr = {this.mAttribute.mPoint1.x, this.mAttribute.mPoint1.y, this.mAttribute.mPoint2.x, this.mAttribute.mPoint2.y, this.mAttribute.mRangeWidth};
            getChangeMatrix().mapPoints(fArr, 0, fArr, 0, 2);
            return fArr;
        }
        EffectRectAttribute effectAttribute = EffectController.getInstance().getEffectAttribute();
        return new float[]{effectAttribute.mPoint1.x, effectAttribute.mPoint1.y, effectAttribute.mPoint2.x, effectAttribute.mPoint2.y, effectAttribute.mRangeWidth};
    }

    private void init() {
        Resources resources = CameraAppImpl.getAndroidContext().getResources();
        this.mThresholdWidth = resources.getDimensionPixelSize(R.dimen.effect_item_width);
        this.mThresholdHeight = resources.getDimensionPixelSize(R.dimen.effect_item_height);
    }

    private void setEffectRectF(RectF rectF) {
        if (rectF != null) {
            this.mPreviewEffectRect[0] = rectF.left;
            this.mPreviewEffectRect[1] = rectF.top;
            this.mPreviewEffectRect[2] = rectF.right;
            this.mPreviewEffectRect[3] = rectF.bottom;
            return;
        }
        this.mPreviewEffectRect[0] = 0.0f;
        this.mPreviewEffectRect[1] = 0.0f;
        this.mPreviewEffectRect[2] = 1.0f;
        this.mPreviewEffectRect[3] = 1.0f;
    }

    /* access modifiers changed from: protected */
    public float[] getEffectRect(boolean z) {
        if (z) {
            RectF rectF = this.mMirror ? this.mOrientation % 180 == 0 ? new RectF(1.0f - this.mPreviewEffectRect[0], this.mPreviewEffectRect[1], 1.0f - this.mPreviewEffectRect[2], this.mPreviewEffectRect[3]) : new RectF(this.mPreviewEffectRect[0], 1.0f - this.mPreviewEffectRect[1], this.mPreviewEffectRect[2], 1.0f - this.mPreviewEffectRect[3]) : new RectF(this.mPreviewEffectRect[0], this.mPreviewEffectRect[1], this.mPreviewEffectRect[2], this.mPreviewEffectRect[3]);
            getChangeMatrix().mapRect(rectF);
            this.mSnapshotEffectRect[0] = rectF.left;
            this.mSnapshotEffectRect[1] = rectF.top;
            this.mSnapshotEffectRect[2] = rectF.right;
            this.mSnapshotEffectRect[3] = rectF.bottom;
            return this.mSnapshotEffectRect;
        }
        RectF effectRectF = EffectController.getInstance().getEffectRectF();
        if (this.mPreviewWidth <= this.mThresholdWidth || this.mPreviewHeight <= this.mThresholdHeight) {
            setEffectRectF(null);
        } else {
            setEffectRectF(effectRectF);
        }
        return this.mPreviewEffectRect;
    }

    /* access modifiers changed from: protected */
    public int getInvertFlag(boolean z) {
        return z ? this.mAttribute.mInvertFlag : EffectController.getInstance().getInvertFlag();
    }

    /* access modifiers changed from: protected */
    public void initEffectRect(boolean z) {
        GLES20.glUniform4fv(this.mUniformEffectRectH, 1, getEffectRect(z), 0);
        GLES20.glUniform1i(this.mUniformInvertRectH, getInvertFlag(z));
        GLES20.glUniform1fv(this.mUniformEffectParameterH, 5, getEffectArray(z), 0);
    }

    /* access modifiers changed from: protected */
    public void initShader() {
        super.initShader();
        this.mUniformEffectRectH = GLES20.glGetUniformLocation(this.mProgram, "uEffectRect");
        this.mUniformInvertRectH = GLES20.glGetUniformLocation(this.mProgram, "uInvertRect");
        this.mUniformEffectParameterH = GLES20.glGetUniformLocation(this.mProgram, "uEffectArray");
    }

    /* access modifiers changed from: protected */
    public void initShaderValue(boolean z) {
        super.initShaderValue(z);
        initEffectRect(z);
    }

    public void setEffectRangeAttribute(EffectRectAttribute effectRectAttribute) {
        this.mAttribute = effectRectAttribute;
        setEffectRectF(effectRectAttribute.mRectF);
    }
}
