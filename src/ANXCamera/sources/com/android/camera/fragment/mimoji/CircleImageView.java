package com.android.camera.fragment.mimoji;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.widget.ImageView;
import com.android.camera.Util;

public class CircleImageView extends ImageView {
    private int colorRGBA;
    private Context mContext;
    private int mInnerRadius = Util.dpToPixel(17.67f);
    private int mOuterRadius = Util.dpToPixel(22.33f);
    Paint mPaintInner;
    Paint mPaintOutter;
    boolean mShowOutter = false;

    public CircleImageView(Context context) {
        super(context);
        this.mContext = context;
        initGlobalValue();
    }

    public CircleImageView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mContext = context;
        initGlobalValue();
    }

    public CircleImageView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mContext = context;
        initGlobalValue();
    }

    private Bitmap getCircleBitmap(Bitmap bitmap) {
        Bitmap createBitmap = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Config.ARGB_8888);
        Canvas canvas = new Canvas(createBitmap);
        Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        canvas.drawCircle((float) (bitmap.getWidth() / 2), (float) (bitmap.getHeight() / 2), (float) (bitmap.getHeight() / 2), this.mPaintInner);
        canvas.drawBitmap(bitmap, rect, rect, this.mPaintInner);
        return createBitmap;
    }

    private void initGlobalValue() {
        this.mPaintInner = new Paint();
        this.mPaintOutter = new Paint();
        this.mPaintInner.setAntiAlias(true);
        this.mPaintInner.setStyle(Style.FILL);
        this.mPaintOutter.setAntiAlias(true);
        this.mPaintOutter.setStrokeWidth(6.0f);
        this.mPaintOutter.setStyle(Style.STROKE);
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        getPaddingLeft();
        float width = (float) (getWidth() / 2);
        float height = (float) (getHeight() / 2);
        canvas.drawCircle(width, height, (float) this.mInnerRadius, this.mPaintInner);
        if (this.mShowOutter) {
            canvas.drawCircle(width, height, (float) this.mOuterRadius, this.mPaintOutter);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        super.onMeasure(i, i2);
    }

    public void updateView(boolean z) {
        this.mShowOutter = z;
        invalidate();
    }

    public void updateView(boolean z, int i) {
        this.mShowOutter = z;
        this.colorRGBA = i;
        this.mPaintInner.setColor(i);
        this.mPaintOutter.setColor(i);
        invalidate();
    }
}
