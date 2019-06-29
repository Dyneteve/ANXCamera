package android.support.v4.media.subtitle;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.support.annotation.RequiresApi;
import android.support.mediacompat.R;
import android.text.Layout.Alignment;
import android.text.SpannableStringBuilder;
import android.text.StaticLayout;
import android.text.StaticLayout.Builder;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.view.View;
import android.view.View.MeasureSpec;

@RequiresApi(28)
class SubtitleView extends View {
    private static final int COLOR_BEVEL_DARK = Integer.MIN_VALUE;
    private static final int COLOR_BEVEL_LIGHT = -2130706433;
    private static final float INNER_PADDING_RATIO = 0.125f;
    private Alignment mAlignment;
    private int mBackgroundColor;
    private final float mCornerRadius;
    private int mEdgeColor;
    private int mEdgeType;
    private int mForegroundColor;
    private boolean mHasMeasurements;
    private int mInnerPaddingX;
    private int mLastMeasuredWidth;
    private StaticLayout mLayout;
    private final RectF mLineBounds;
    private final float mOutlineWidth;
    private Paint mPaint;
    private final float mShadowOffsetX;
    private final float mShadowOffsetY;
    private final float mShadowRadius;
    private float mSpacingAdd;
    private float mSpacingMult;
    private final SpannableStringBuilder mText;
    private TextPaint mTextPaint;

    SubtitleView(Context context) {
        this(context, null);
    }

    SubtitleView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    SubtitleView(Context context, AttributeSet attributeSet, int i) {
        this(context, attributeSet, i, 0);
    }

    SubtitleView(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet);
        this.mLineBounds = new RectF();
        this.mText = new SpannableStringBuilder();
        this.mSpacingMult = 1.0f;
        this.mSpacingAdd = 0.0f;
        this.mInnerPaddingX = 0;
        Resources resources = getContext().getResources();
        this.mCornerRadius = (float) resources.getDimensionPixelSize(R.dimen.subtitle_corner_radius);
        this.mOutlineWidth = (float) resources.getDimensionPixelSize(R.dimen.subtitle_outline_width);
        this.mShadowRadius = (float) resources.getDimensionPixelSize(R.dimen.subtitle_shadow_radius);
        this.mShadowOffsetX = (float) resources.getDimensionPixelSize(R.dimen.subtitle_shadow_offset);
        this.mShadowOffsetY = this.mShadowOffsetX;
        this.mTextPaint = new TextPaint();
        this.mTextPaint.setAntiAlias(true);
        this.mTextPaint.setSubpixelText(true);
        this.mPaint = new Paint();
        this.mPaint.setAntiAlias(true);
    }

    private boolean computeMeasurements(int i) {
        if (this.mHasMeasurements && i == this.mLastMeasuredWidth) {
            return true;
        }
        int paddingLeft = i - ((getPaddingLeft() + getPaddingRight()) + (this.mInnerPaddingX * 2));
        if (paddingLeft <= 0) {
            return false;
        }
        this.mHasMeasurements = true;
        this.mLastMeasuredWidth = paddingLeft;
        this.mLayout = Builder.obtain(this.mText, 0, this.mText.length(), this.mTextPaint, paddingLeft).setAlignment(this.mAlignment).setLineSpacing(this.mSpacingAdd, this.mSpacingMult).setUseLineSpacingFromFallbacks(true).build();
        return true;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        StaticLayout staticLayout = this.mLayout;
        if (staticLayout != null) {
            int save = canvas.save();
            int i = this.mInnerPaddingX;
            canvas.translate((float) (getPaddingLeft() + i), (float) getPaddingTop());
            int lineCount = staticLayout.getLineCount();
            TextPaint textPaint = this.mTextPaint;
            Paint paint = this.mPaint;
            RectF rectF = this.mLineBounds;
            if (Color.alpha(this.mBackgroundColor) > 0) {
                float f = this.mCornerRadius;
                float lineTop = (float) staticLayout.getLineTop(0);
                paint.setColor(this.mBackgroundColor);
                paint.setStyle(Style.FILL);
                float f2 = lineTop;
                for (int i2 = 0; i2 < lineCount; i2++) {
                    float f3 = (float) i;
                    rectF.left = staticLayout.getLineLeft(i2) - f3;
                    rectF.right = staticLayout.getLineRight(i2) + f3;
                    rectF.top = f2;
                    rectF.bottom = (float) staticLayout.getLineBottom(i2);
                    f2 = rectF.bottom;
                    canvas.drawRoundRect(rectF, f, f, paint);
                }
            }
            int i3 = this.mEdgeType;
            boolean z = true;
            if (i3 == 1) {
                textPaint.setStrokeJoin(Join.ROUND);
                textPaint.setStrokeWidth(this.mOutlineWidth);
                textPaint.setColor(this.mEdgeColor);
                textPaint.setStyle(Style.FILL_AND_STROKE);
                staticLayout.draw(canvas);
            } else if (i3 == 2) {
                textPaint.setShadowLayer(this.mShadowRadius, this.mShadowOffsetX, this.mShadowOffsetY, this.mEdgeColor);
            } else if (i3 == 3 || i3 == 4) {
                if (i3 != 3) {
                    z = false;
                }
                int i4 = -1;
                int i5 = z ? -1 : this.mEdgeColor;
                if (z) {
                    i4 = this.mEdgeColor;
                }
                float f4 = this.mShadowRadius / 2.0f;
                textPaint.setColor(this.mForegroundColor);
                textPaint.setStyle(Style.FILL);
                float f5 = -f4;
                textPaint.setShadowLayer(this.mShadowRadius, f5, f5, i5);
                staticLayout.draw(canvas);
                textPaint.setShadowLayer(this.mShadowRadius, f4, f4, i4);
            }
            textPaint.setColor(this.mForegroundColor);
            textPaint.setStyle(Style.FILL);
            staticLayout.draw(canvas);
            textPaint.setShadowLayer(0.0f, 0.0f, 0.0f, 0);
            canvas.restoreToCount(save);
        }
    }

    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        computeMeasurements(i3 - i);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        if (computeMeasurements(MeasureSpec.getSize(i))) {
            StaticLayout staticLayout = this.mLayout;
            setMeasuredDimension(staticLayout.getWidth() + getPaddingLeft() + getPaddingRight() + (this.mInnerPaddingX * 2), staticLayout.getHeight() + getPaddingTop() + getPaddingBottom());
            return;
        }
        setMeasuredDimension(16777216, 16777216);
    }

    public void setAlignment(Alignment alignment) {
        if (this.mAlignment != alignment) {
            this.mAlignment = alignment;
            this.mHasMeasurements = false;
            requestLayout();
            invalidate();
        }
    }

    public void setBackgroundColor(int i) {
        this.mBackgroundColor = i;
        invalidate();
    }

    public void setEdgeColor(int i) {
        this.mEdgeColor = i;
        invalidate();
    }

    public void setEdgeType(int i) {
        this.mEdgeType = i;
        invalidate();
    }

    public void setForegroundColor(int i) {
        this.mForegroundColor = i;
        invalidate();
    }

    public void setText(int i) {
        setText(getContext().getText(i));
    }

    public void setText(CharSequence charSequence) {
        this.mText.clear();
        this.mText.append(charSequence);
        this.mHasMeasurements = false;
        requestLayout();
        invalidate();
    }

    public void setTextSize(float f) {
        if (this.mTextPaint.getTextSize() != f) {
            this.mTextPaint.setTextSize(f);
            this.mInnerPaddingX = (int) ((f * INNER_PADDING_RATIO) + 0.5f);
            this.mHasMeasurements = false;
            requestLayout();
            invalidate();
        }
    }

    public void setTypeface(Typeface typeface) {
        if (typeface != null && !typeface.equals(this.mTextPaint.getTypeface())) {
            this.mTextPaint.setTypeface(typeface);
            this.mHasMeasurements = false;
            requestLayout();
            invalidate();
        }
    }
}
