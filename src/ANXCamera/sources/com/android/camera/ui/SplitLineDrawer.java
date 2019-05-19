package com.android.camera.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;

public class SplitLineDrawer extends View {
    private static final int BORDER = 1;
    private boolean mBottomVisible = true;
    private int mColumnCount = 1;
    private int mLineColor = 872415231;
    private Paint mLinePaint;
    private int mRowCount = 1;
    private boolean mTopVisible = true;

    public SplitLineDrawer(Context context) {
        super(context);
    }

    public SplitLineDrawer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public SplitLineDrawer(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    public void initialize(int i, int i2) {
        this.mColumnCount = Math.max(i2, 1);
        this.mRowCount = Math.max(i, 1);
        this.mLinePaint = new Paint();
        this.mLinePaint.setStrokeWidth(2.0f);
        this.mLinePaint.setColor(this.mLineColor);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        int width = getWidth() - 1;
        int height = getHeight() - 1;
        for (int i = 1; i < this.mColumnCount; i++) {
            int i2 = i * width;
            canvas.drawLine((float) (i2 / this.mColumnCount), 1.0f, (float) (i2 / this.mColumnCount), (float) (height - 1), this.mLinePaint);
        }
        boolean z = true ^ this.mBottomVisible;
        int i3 = 0;
        while (i3 <= this.mRowCount) {
            if (!(i3 == 0 || i3 == this.mRowCount) || ((i3 == 0 && this.mTopVisible) || (i3 == this.mRowCount && this.mBottomVisible))) {
                int i4 = i3 * height;
                canvas.drawLine(z ? 1.0f : 0.0f, (float) (i4 / this.mRowCount), (float) (width - z), (float) (i4 / this.mRowCount), this.mLinePaint);
            }
            i3++;
        }
        super.onDraw(canvas);
    }

    public void setBorderVisible(boolean z, boolean z2) {
        if (this.mTopVisible != z || this.mBottomVisible != z2) {
            this.mTopVisible = z;
            this.mBottomVisible = z2;
            invalidate();
        }
    }

    public void setLineColor(int i) {
        this.mLineColor = i;
    }
}
