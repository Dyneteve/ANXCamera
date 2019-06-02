package com.android.camera.ui.drawable.focus;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint.Style;
import com.android.camera.Util;
import com.android.camera.ui.drawable.CameraPaintBase;

public class CameraFocusPaintBigCircle extends CameraPaintBase {
    public CameraFocusPaintBigCircle(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void draw(Canvas canvas) {
        this.mPaint.setAlpha(this.mCurrentAlpha);
        canvas.drawCircle(this.mMiddleX, this.mMiddleY, this.mBaseRadius * this.mCurrentWidthPercent, this.mPaint);
    }

    /* access modifiers changed from: protected */
    public void initPaint(Context context) {
        this.mPaint.setAntiAlias(true);
        this.mPaint.setStrokeWidth((float) Util.dpToPixel(1.0f));
        this.mPaint.setStyle(Style.STROKE);
        this.mPaint.setAlpha(this.mCurrentAlpha);
    }
}
