package com.android.camera.fragment.manually;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.ItemDecoration;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

public class ManuallyDecoration extends ItemDecoration {
    private Paint mDividerPaint;
    private int mDividerWidth = 1;
    private int mSpanCount;

    public ManuallyDecoration(int i, @ColorInt int i2) {
        this.mDividerWidth = i;
        this.mDividerPaint = new Paint();
        this.mDividerPaint.setAntiAlias(true);
        this.mDividerPaint.setColor(i2);
    }

    public void getItemOffsets(Rect rect, int i, RecyclerView recyclerView) {
        int i2 = ((this.mSpanCount - 1) * this.mDividerWidth) / this.mSpanCount;
        int i3 = (i % this.mSpanCount) * (this.mDividerWidth - i2);
        rect.set(i3, 0, i2 - i3, this.mDividerWidth);
    }

    public void onDraw(Canvas canvas, RecyclerView recyclerView, State state) {
        int childCount = recyclerView.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = recyclerView.getChildAt(i);
            LayoutParams layoutParams = childAt.getLayoutParams();
            int left = childAt.getLeft();
            int right = childAt.getRight();
            int bottom = childAt.getBottom() + layoutParams.bottomMargin;
            int i2 = this.mDividerWidth + bottom;
            if (this.mDividerPaint != null) {
                canvas.drawRect((float) left, (float) bottom, (float) right, (float) i2, this.mDividerPaint);
            }
            int top = childAt.getTop();
            int bottom2 = childAt.getBottom() + this.mDividerWidth;
            int right2 = childAt.getRight() + layoutParams.rightMargin;
            int i3 = this.mDividerWidth + right2;
            if (this.mDividerPaint != null) {
                canvas.drawRect((float) right2, (float) top, (float) i3, (float) bottom2, this.mDividerPaint);
            }
        }
    }

    public void setStyle(int i) {
        this.mSpanCount = i;
    }
}
