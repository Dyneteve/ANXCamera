package com.android.camera.fragment.music;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.support.annotation.NonNull;
import com.bumptech.glide.load.engine.bitmap_recycle.d;
import com.bumptech.glide.load.resource.bitmap.g;
import java.security.MessageDigest;

public class RoundedCornersTransformation extends g {
    private static final String ID = "jp.wasabeef.glide.transformations.RoundedCornersTransformation.1";
    private static final int VERSION = 1;
    private CornerType cornerType;
    private int diameter;
    private int margin;
    private int radius;

    public enum CornerType {
        ALL,
        TOP_LEFT,
        TOP_RIGHT,
        BOTTOM_LEFT,
        BOTTOM_RIGHT,
        TOP,
        BOTTOM,
        LEFT,
        RIGHT,
        OTHER_TOP_LEFT,
        OTHER_TOP_RIGHT,
        OTHER_BOTTOM_LEFT,
        OTHER_BOTTOM_RIGHT,
        DIAGONAL_FROM_TOP_LEFT,
        DIAGONAL_FROM_TOP_RIGHT
    }

    public RoundedCornersTransformation(int i, int i2) {
        this(i, i2, CornerType.ALL);
    }

    public RoundedCornersTransformation(int i, int i2, CornerType cornerType2) {
        this.radius = i;
        this.diameter = this.radius * 2;
        this.margin = i2;
        this.cornerType = cornerType2;
    }

    private void drawBottomLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, f2 - ((float) this.diameter), (float) (this.margin + this.diameter), f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), f2 - ((float) this.radius)), paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) this.margin, f, f2), paint);
    }

    private void drawBottomRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), f2 - ((float) this.diameter), f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f - ((float) this.radius), f2), paint);
        canvas.drawRect(new RectF(f - ((float) this.radius), (float) this.margin, f, f2 - ((float) this.radius)), paint);
    }

    private void drawBottomRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, f2 - ((float) this.diameter), f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f, f2 - ((float) this.radius)), paint);
    }

    private void drawDiagonalFromTopLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), f2 - ((float) this.diameter), f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) (this.margin + this.radius), f - ((float) this.diameter), f2), paint);
        canvas.drawRect(new RectF((float) (this.margin + this.diameter), (float) this.margin, f, f2 - ((float) this.radius)), paint);
    }

    private void drawDiagonalFromTopRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), (float) this.margin, f, (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF((float) this.margin, f2 - ((float) this.diameter), (float) (this.margin + this.diameter), f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f - ((float) this.radius), f2 - ((float) this.radius)), paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) (this.margin + this.radius), f, f2), paint);
    }

    private void drawLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) this.margin, f, f2), paint);
    }

    private void drawOtherBottomLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, f, (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), (float) this.margin, f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) (this.margin + this.radius), f - ((float) this.radius), f2), paint);
    }

    private void drawOtherBottomRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, f, (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) (this.margin + this.radius), f, f2), paint);
    }

    private void drawOtherTopLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, f2 - ((float) this.diameter), f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), (float) this.margin, f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f - ((float) this.radius), f2 - ((float) this.radius)), paint);
    }

    private void drawOtherTopRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRoundRect(new RectF((float) this.margin, f2 - ((float) this.diameter), f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) this.margin, f, f2 - ((float) this.radius)), paint);
    }

    private void drawRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), (float) this.margin, f, f2), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f - ((float) this.radius), f2), paint);
    }

    private void drawRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        float f3 = f - ((float) this.margin);
        float f4 = f2 - ((float) this.margin);
        switch (this.cornerType) {
            case ALL:
                canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, f3, f4), (float) this.radius, (float) this.radius, paint);
                return;
            case TOP_LEFT:
                drawTopLeftRoundRect(canvas, paint, f3, f4);
                return;
            case TOP_RIGHT:
                drawTopRightRoundRect(canvas, paint, f3, f4);
                return;
            case BOTTOM_LEFT:
                drawBottomLeftRoundRect(canvas, paint, f3, f4);
                return;
            case BOTTOM_RIGHT:
                drawBottomRightRoundRect(canvas, paint, f3, f4);
                return;
            case TOP:
                drawTopRoundRect(canvas, paint, f3, f4);
                return;
            case BOTTOM:
                drawBottomRoundRect(canvas, paint, f3, f4);
                return;
            case LEFT:
                drawLeftRoundRect(canvas, paint, f3, f4);
                return;
            case RIGHT:
                drawRightRoundRect(canvas, paint, f3, f4);
                return;
            case OTHER_TOP_LEFT:
                drawOtherTopLeftRoundRect(canvas, paint, f3, f4);
                return;
            case OTHER_TOP_RIGHT:
                drawOtherTopRightRoundRect(canvas, paint, f3, f4);
                return;
            case OTHER_BOTTOM_LEFT:
                drawOtherBottomLeftRoundRect(canvas, paint, f3, f4);
                return;
            case OTHER_BOTTOM_RIGHT:
                drawOtherBottomRightRoundRect(canvas, paint, f3, f4);
                return;
            case DIAGONAL_FROM_TOP_LEFT:
                drawDiagonalFromTopLeftRoundRect(canvas, paint, f3, f4);
                return;
            case DIAGONAL_FROM_TOP_RIGHT:
                drawDiagonalFromTopRightRoundRect(canvas, paint, f3, f4);
                return;
            default:
                canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, f3, f4), (float) this.radius, (float) this.radius, paint);
                return;
        }
    }

    private void drawTopLeftRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, (float) (this.margin + this.diameter), (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) (this.margin + this.radius), (float) (this.margin + this.radius), f2), paint);
        canvas.drawRect(new RectF((float) (this.margin + this.radius), (float) this.margin, f, f2), paint);
    }

    private void drawTopRightRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF(f - ((float) this.diameter), (float) this.margin, f, (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) this.margin, f - ((float) this.radius), f2), paint);
        canvas.drawRect(new RectF(f - ((float) this.radius), (float) (this.margin + this.radius), f, f2), paint);
    }

    private void drawTopRoundRect(Canvas canvas, Paint paint, float f, float f2) {
        canvas.drawRoundRect(new RectF((float) this.margin, (float) this.margin, f, (float) (this.margin + this.diameter)), (float) this.radius, (float) this.radius, paint);
        canvas.drawRect(new RectF((float) this.margin, (float) (this.margin + this.radius), f, f2), paint);
    }

    public boolean equals(Object obj) {
        if (obj instanceof RoundedCornersTransformation) {
            RoundedCornersTransformation roundedCornersTransformation = (RoundedCornersTransformation) obj;
            if (roundedCornersTransformation.radius == this.radius && roundedCornersTransformation.diameter == this.diameter && roundedCornersTransformation.margin == this.margin && roundedCornersTransformation.cornerType == this.cornerType) {
                return true;
            }
        }
        return false;
    }

    public int hashCode() {
        return ID.hashCode() + (this.radius * 10000) + (this.diameter * 1000) + (this.margin * 100) + (this.cornerType.ordinal() * 10);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("RoundedTransformation(radius=");
        sb.append(this.radius);
        sb.append(", margin=");
        sb.append(this.margin);
        sb.append(", diameter=");
        sb.append(this.diameter);
        sb.append(", cornerType=");
        sb.append(this.cornerType.name());
        sb.append(")");
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public Bitmap transform(d dVar, Bitmap bitmap, int i, int i2) {
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        Bitmap b = dVar.b(width, height, Config.ARGB_8888);
        b.setHasAlpha(true);
        Canvas canvas = new Canvas(b);
        Paint paint = new Paint();
        paint.setAntiAlias(true);
        paint.setShader(new BitmapShader(bitmap, TileMode.CLAMP, TileMode.CLAMP));
        drawRoundRect(canvas, paint, (float) width, (float) height);
        return b;
    }

    public void updateDiskCacheKey(@NonNull MessageDigest messageDigest) {
    }
}
