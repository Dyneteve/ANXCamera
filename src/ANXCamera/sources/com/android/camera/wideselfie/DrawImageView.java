package com.android.camera.wideselfie;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import com.oneplus.camera.R;

public class DrawImageView extends View {
    private static final String TAG = "DrawImageView";
    private Bitmap mBitmap;
    private Paint mBitmapPaint;
    private Paint mBorderPaint;
    private Rect mBorderRect;
    private Rect mImageRect;
    private int mOrientation;
    private int mStillPreviewHeight;
    private int mStillPreviewWidth;
    private int mThumbBgHeightVertical;
    private int mThumbBgWidth;
    private int mThumbnailBackgroundWidth;

    public DrawImageView(Context context) {
        this(context, null);
    }

    public DrawImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mOrientation = 0;
        this.mImageRect = null;
        this.mBitmap = null;
        this.mBorderRect = null;
        this.mBitmapPaint = new Paint();
        this.mBorderPaint = new Paint();
        this.mBorderPaint.setAntiAlias(true);
        this.mBorderPaint.setColor(context.getColor(R.color.wide_selfie_thumbnail_border_color));
        this.mBorderPaint.setStyle(Style.STROKE);
        this.mBorderPaint.setStrokeWidth(context.getResources().getDimension(R.dimen.wide_selfie_thumbnail_border_size));
    }

    private Rect convertBorderRect(Rect rect) {
        Rect rect2 = new Rect();
        if (this.mOrientation % 180 == 0) {
            int i = this.mStillPreviewWidth / 2;
            rect2.left = this.mThumbBgWidth - rect.bottom;
            rect2.top = rect.left;
            rect2.right = rect2.left + rect.height();
            rect2.bottom = rect.right;
            rect2.offset(i, i);
            rect2.top = i;
            rect2.bottom = i + this.mStillPreviewHeight;
        } else {
            int i2 = this.mStillPreviewHeight / 2;
            rect2.left = rect.top;
            rect2.top = rect.left + (((this.mThumbBgHeightVertical - 2) - this.mStillPreviewHeight) / 2);
            rect2.right = rect.bottom;
            rect2.bottom = rect2.top + rect.width();
            rect2.offset(i2, i2);
            rect2.left = i2;
            rect2.right = i2 + this.mStillPreviewWidth;
        }
        return rect2;
    }

    private Rect convertImageRect(Rect rect) {
        Rect rect2 = new Rect();
        if (this.mOrientation % 180 == 0) {
            int i = this.mStillPreviewWidth / 2;
            rect2.left = this.mThumbBgWidth - rect.bottom;
            rect2.top = rect.left;
            rect2.right = rect2.left + rect.height();
            rect2.bottom = rect.right;
            rect2.offset(i, i);
        } else {
            int i2 = this.mStillPreviewHeight / 2;
            rect2.left = rect.top;
            rect2.top = rect.left;
            rect2.right = rect.bottom;
            rect2.bottom = rect.right;
            rect2.offset(i2, i2);
        }
        return rect2;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.mBitmap != null && this.mImageRect != null) {
            canvas.drawBitmap(this.mBitmap, null, this.mImageRect, this.mBitmapPaint);
            if (this.mBorderRect != null) {
                canvas.drawRect(this.mBorderRect, this.mBorderPaint);
            }
            releaseBitmap();
        }
    }

    public void releaseBitmap() {
        if (this.mBitmap != null && !this.mBitmap.isRecycled()) {
            this.mBitmap.recycle();
            this.mBitmap = null;
        }
    }

    public void setImageBitmap(Bitmap bitmap, Rect rect, Rect rect2) {
        this.mBitmap = bitmap;
        if (rect != null) {
            this.mImageRect = convertImageRect(rect);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("convertImageRect src = ");
            sb.append(rect);
            sb.append(", dest = ");
            sb.append(this.mImageRect);
            sb.append(", mOrientation ");
            sb.append(this.mOrientation);
            Log.d(str, sb.toString());
            this.mBorderRect = convertBorderRect(rect2);
            this.mBorderRect.inset(2, 2);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("convertBorderRect src = ");
            sb2.append(rect2);
            sb2.append(", dest = ");
            sb2.append(this.mBorderRect);
            Log.d(str2, sb2.toString());
        }
        invalidate();
    }

    public void setOrientation(int i) {
        this.mOrientation = i;
    }

    public void setParams(int i, int i2, int i3, int i4) {
        this.mStillPreviewWidth = i;
        this.mStillPreviewHeight = i2;
        this.mThumbBgWidth = i3;
        this.mThumbBgHeightVertical = i4;
    }
}
