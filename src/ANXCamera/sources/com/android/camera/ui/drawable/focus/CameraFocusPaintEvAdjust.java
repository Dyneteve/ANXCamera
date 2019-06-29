package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import com.android.camera.Util;
import com.android.camera.ui.FocusView;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraFocusPaintEvAdjust extends CameraPaintBase {
    private static final int MARGIN = Util.dpToPixel(12.0f);
    private static final int TRIANGLE_BASE_DIS = Util.dpToPixel(3.0f);
    private static final int TRIANGLE_BASE_HEIGHT = Util.dpToPixel(5.0f);
    private static final int TRIANGLE_BASE_LEN = Util.dpToPixel(8.0f);
    private static final int TRIANGLE_MIN_MARGIN = Util.dpToPixel(25.0f);
    private float mCurrentDistanceY;
    private float mCurrentOffsetY;
    private Rect mDisplayRect;
    private float mEvValue = -1.0f;
    private int mLineHeight = FocusView.MAX_SLIDE_DISTANCE;
    private int mLineMargin = Util.dpToPixel(2.0f);
    private Paint mLinePaint;
    private int mLineWidth = Util.dpToPixel(1.0f);
    private int mRotation;
    private boolean mRtl = false;
    private boolean mShowLine = true;
    private float mStartOffsetY;

    public CameraFocusPaintEvAdjust(Context context) {
        super(context);
    }

    private boolean isNearlyOutOfEdge() {
        int width = this.mDisplayRect.width();
        int height = this.mDisplayRect.height();
        boolean z = true;
        if ((this.mRotation / 90) % 2 == 0) {
            if (this.mRtl) {
                if ((this.mMiddleX - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) < ((float) TRIANGLE_MIN_MARGIN)) {
                    z = false;
                }
                return z;
            }
            if (((((float) width) - this.mMiddleX) - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        } else if (this.mRotation == 90) {
            if (((((float) height) - this.mMiddleY) - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        } else if (this.mRotation != 270) {
            return false;
        } else {
            if ((this.mMiddleY - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN) >= ((float) TRIANGLE_MIN_MARGIN)) {
                z = false;
            }
            return z;
        }
    }

    /* access modifiers changed from: protected */
    public void draw(Canvas canvas) {
        Path path = new Path();
        float f = isNearlyOutOfEdge() ? ((this.mMiddleX - ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) - ((float) MARGIN)) - ((float) (TRIANGLE_BASE_LEN / 2)) : ((this.mMiddleX + ((float) CameraFocusAnimateDrawable.BIG_RADIUS)) + ((float) MARGIN)) - ((float) (TRIANGLE_BASE_LEN / 2));
        float f2 = ((this.mMiddleY - this.mCurrentOffsetY) + this.mCurrentDistanceY) - ((float) (TRIANGLE_BASE_DIS / 2));
        path.moveTo(f, f2);
        path.lineTo(((float) TRIANGLE_BASE_LEN) + f, f2);
        path.lineTo(((float) (TRIANGLE_BASE_LEN / 2)) + f, f2 - ((float) TRIANGLE_BASE_HEIGHT));
        path.lineTo(f, f2);
        float f3 = ((float) (TRIANGLE_BASE_LEN / 2)) + f;
        float f4 = f + ((float) (TRIANGLE_BASE_LEN / 2));
        float f5 = this.mMiddleY - ((float) (this.mLineHeight / 2));
        if (this.mShowLine && (f2 - ((float) TRIANGLE_BASE_HEIGHT)) - f5 > ((float) this.mLineMargin)) {
            float f6 = (f2 - ((float) TRIANGLE_BASE_HEIGHT)) - ((float) this.mLineMargin);
            this.mLinePaint.setColor(this.mCurrentColor);
            this.mLinePaint.setAlpha(204);
            canvas.drawLine(f3, f5, f4, f6, this.mLinePaint);
        }
        float f7 = this.mMiddleY + this.mCurrentOffsetY + this.mCurrentDistanceY + ((float) (TRIANGLE_BASE_DIS / 2));
        path.moveTo(f, f7);
        path.lineTo(((float) TRIANGLE_BASE_LEN) + f, f7);
        path.lineTo(((float) (TRIANGLE_BASE_LEN / 2)) + f, ((float) TRIANGLE_BASE_HEIGHT) + f7);
        path.lineTo(f, f7);
        canvas.drawPath(path, this.mPaint);
        if (this.mShowLine) {
            float f8 = this.mMiddleY + ((float) (this.mLineHeight / 2));
            if (f8 - ((float) this.mLineMargin) > ((float) TRIANGLE_BASE_HEIGHT) + f7) {
                float f9 = f7 + ((float) TRIANGLE_BASE_HEIGHT) + ((float) this.mLineMargin);
                this.mLinePaint.setColor(this.mCurrentColor);
                this.mLinePaint.setAlpha(204);
                canvas.drawLine(f3, f9, f4, f8, this.mLinePaint);
            }
        }
    }

    public float getEvValue() {
        return this.mEvValue;
    }

    /* access modifiers changed from: protected */
    public void initPaint(Context context) {
        this.mPaint.setStyle(Style.FILL);
        this.mPaint.setAntiAlias(true);
        this.mLinePaint = new Paint();
        this.mLinePaint.setAntiAlias(true);
        this.mLinePaint.setStyle(Style.FILL);
        this.mLinePaint.setStrokeWidth((float) this.mLineWidth);
        this.mLinePaint.setColor(Color.argb(102, 255, 255, 255));
    }

    public void setDistanceY(float f) {
        this.mCurrentDistanceY = f;
    }

    public void setEvValue(float f) {
        this.mEvValue = f;
    }

    public void setOrientation(int i) {
        this.mRotation = i;
    }

    public void setRtlAndDisplayRect(boolean z, Rect rect) {
        this.mRtl = z;
        this.mDisplayRect = rect;
    }

    public void setShowLine(boolean z) {
        this.mShowLine = z;
    }

    public void setStartOffsetY(float f) {
        this.mStartOffsetY = f;
    }

    public void updateValue(float f) {
        super.updateValue(f);
        this.mCurrentOffsetY = this.mStartOffsetY - (this.mStartOffsetY * f);
    }
}
