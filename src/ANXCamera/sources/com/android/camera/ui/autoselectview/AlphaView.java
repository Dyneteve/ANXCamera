package com.android.camera.ui.autoselectview;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetricsInt;
import android.graphics.Rect;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import com.android.camera.R;

public class AlphaView extends View {
    private float mAlpha;
    private FontMetricsInt mFmi;
    private Rect mIconAvailableRect;
    private Rect mIconDrawRect;
    private Paint mSelectedPaint;
    private String mText;
    private Rect mTextBound;
    private int mTextColorNormal;
    private int mTextColorSelected;
    private Paint mTextPaint;
    private int mTextSize;

    public AlphaView(Context context) {
        this(context, null);
    }

    public AlphaView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public AlphaView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mTextColorNormal = -6710887;
        this.mTextColorSelected = -12140517;
        this.mTextSize = 12;
        this.mSelectedPaint = new Paint();
        this.mIconAvailableRect = new Rect();
        this.mIconDrawRect = new Rect();
        this.mTextSize = (int) TypedValue.applyDimension(2, (float) this.mTextSize, getResources().getDisplayMetrics());
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, R.styleable.AlphaView);
        this.mText = obtainStyledAttributes.getString(0);
        this.mTextSize = obtainStyledAttributes.getDimensionPixelSize(1, this.mTextSize);
        this.mTextColorNormal = obtainStyledAttributes.getColor(2, this.mTextColorNormal);
        this.mTextColorSelected = obtainStyledAttributes.getColor(3, this.mTextColorSelected);
        obtainStyledAttributes.recycle();
        initText();
    }

    private Rect availableToDrawRect(Rect rect, Bitmap bitmap) {
        float f;
        float width = (((float) rect.width()) * 1.0f) / ((float) bitmap.getWidth());
        float height = (((float) rect.height()) * 1.0f) / ((float) bitmap.getHeight());
        float f2 = 0.0f;
        if (width > height) {
            f = (((float) rect.width()) - (height * ((float) bitmap.getWidth()))) / 2.0f;
        } else {
            f2 = (((float) rect.height()) - (width * ((float) bitmap.getHeight()))) / 2.0f;
            f = 0.0f;
        }
        this.mIconDrawRect.set((int) (((float) rect.left) + f + 0.5f), (int) (((float) rect.top) + f2 + 0.5f), (int) ((((float) rect.right) - f) + 0.5f), (int) ((((float) rect.bottom) - f2) + 0.5f));
        return this.mIconDrawRect;
    }

    private void initText() {
        if (this.mText != null) {
            this.mTextBound = new Rect();
            this.mTextPaint = new Paint();
            this.mTextPaint.setTextSize((float) this.mTextSize);
            this.mTextPaint.setAntiAlias(true);
            this.mTextPaint.setDither(true);
            this.mTextPaint.getTextBounds(this.mText, 0, this.mText.length(), this.mTextBound);
            this.mFmi = this.mTextPaint.getFontMetricsInt();
        }
    }

    private void invalidateView() {
        if (Looper.getMainLooper() == Looper.myLooper()) {
            invalidate();
        } else {
            postInvalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int ceil = (int) Math.ceil((double) (this.mAlpha * 255.0f));
        if (this.mText != null) {
            this.mTextPaint.setColor(this.mTextColorNormal);
            this.mTextPaint.setAlpha(255 - ceil);
            canvas.drawText(this.mText, (float) this.mTextBound.left, (float) (this.mTextBound.bottom - (this.mFmi.bottom / 2)), this.mTextPaint);
            this.mTextPaint.setColor(this.mTextColorSelected);
            this.mTextPaint.setAlpha(ceil);
            canvas.drawText(this.mText, (float) this.mTextBound.left, (float) (this.mTextBound.bottom - (this.mFmi.bottom / 2)), this.mTextPaint);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
        if (this.mText != null) {
            int paddingLeft = getPaddingLeft();
            int paddingTop = getPaddingTop();
            int paddingRight = getPaddingRight();
            int paddingBottom = getPaddingBottom();
            int measuredWidth = paddingLeft + ((((getMeasuredWidth() - paddingLeft) - paddingRight) - this.mTextBound.width()) / 2);
            int measuredHeight = (paddingTop + ((getMeasuredHeight() - paddingTop) - paddingBottom)) - this.mTextBound.height();
            this.mTextBound.set(measuredWidth, measuredHeight, this.mTextBound.width() + measuredWidth, this.mTextBound.height() + measuredHeight);
            return;
        }
        throw new IllegalArgumentException("必须设置 tabText 或者 tabIconSelected、tabIconNormal 两个，或者全部设置");
    }

    public void setText(String str) {
        this.mText = str;
        invalidateView();
    }

    public void setViewAlpha(float f) {
        if (f < 0.0f || f > 1.0f) {
            throw new IllegalArgumentException("透明度必须是 0.0 - 1.0");
        }
        this.mAlpha = f;
        invalidateView();
    }
}
