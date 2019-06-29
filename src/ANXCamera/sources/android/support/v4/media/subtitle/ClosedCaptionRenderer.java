package android.support.v4.media.subtitle;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Paint.Join;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.media.MediaFormat;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.support.annotation.RestrictTo.Scope;
import android.support.mediacompat.R;
import android.support.v4.media.SubtitleData2;
import android.support.v4.media.subtitle.Cea608CCParser.MutableBackgroundColorSpan;
import android.support.v4.media.subtitle.SubtitleController.Renderer;
import android.support.v4.media.subtitle.SubtitleTrack.RenderingWidget;
import android.support.v4.view.GravityCompat;
import android.support.v4.view.ViewCompat;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.view.accessibility.CaptioningManager.CaptionStyle;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.TextView.BufferType;
import java.util.ArrayList;

@RequiresApi(28)
@RestrictTo({Scope.LIBRARY_GROUP})
public class ClosedCaptionRenderer extends Renderer {
    private Cea608CCWidget mCCWidget;
    private final Context mContext;

    class Cea608CCWidget extends ClosedCaptionWidget implements DisplayListener {
        private static final String DUMMY_TEXT = "1234567890123456789012345678901234";
        /* access modifiers changed from: private */
        public final Rect mTextBounds;

        private class CCLayout extends LinearLayout implements ClosedCaptionLayout {
            private static final int MAX_ROWS = 15;
            private static final float SAFE_AREA_RATIO = 0.9f;
            private final CCLineBox[] mLineBoxes = new CCLineBox[15];

            CCLayout(Context context) {
                super(context);
                setGravity(GravityCompat.START);
                setOrientation(1);
                for (int i = 0; i < 15; i++) {
                    this.mLineBoxes[i] = new CCLineBox(getContext());
                    addView(this.mLineBoxes[i], -2, -2);
                }
            }

            /* access modifiers changed from: protected */
            public void onLayout(boolean z, int i, int i2, int i3, int i4) {
                int i5;
                int i6;
                int i7 = i3 - i;
                int i8 = i4 - i2;
                int i9 = i7 * 3;
                int i10 = i8 * 4;
                if (i9 >= i10) {
                    i6 = i10 / 3;
                    i5 = i8;
                } else {
                    i5 = i9 / 4;
                    i6 = i7;
                }
                int i11 = (int) (((float) i6) * 0.9f);
                int i12 = (int) (((float) i5) * 0.9f);
                int i13 = (i7 - i11) / 2;
                int i14 = (i8 - i12) / 2;
                int i15 = 0;
                while (i15 < 15) {
                    i15++;
                    this.mLineBoxes[i15].layout(i13, ((i12 * i15) / 15) + i14, i13 + i11, ((i12 * i15) / 15) + i14);
                }
            }

            /* access modifiers changed from: protected */
            public void onMeasure(int i, int i2) {
                super.onMeasure(i, i2);
                int measuredWidth = getMeasuredWidth();
                int measuredHeight = getMeasuredHeight();
                int i3 = measuredWidth * 3;
                int i4 = measuredHeight * 4;
                if (i3 >= i4) {
                    measuredWidth = i4 / 3;
                } else {
                    measuredHeight = i3 / 4;
                }
                int i5 = (int) (((float) measuredWidth) * 0.9f);
                int makeMeasureSpec = MeasureSpec.makeMeasureSpec(((int) (((float) measuredHeight) * 0.9f)) / 15, 1073741824);
                int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(i5, 1073741824);
                for (int i6 = 0; i6 < 15; i6++) {
                    this.mLineBoxes[i6].measure(makeMeasureSpec2, makeMeasureSpec);
                }
            }

            public void setCaptionStyle(CaptionStyle captionStyle) {
                for (int i = 0; i < 15; i++) {
                    this.mLineBoxes[i].setCaptionStyle(captionStyle);
                }
            }

            public void setFontScale(float f) {
            }

            /* access modifiers changed from: 0000 */
            public void update(SpannableStringBuilder[] spannableStringBuilderArr) {
                for (int i = 0; i < 15; i++) {
                    if (spannableStringBuilderArr[i] != null) {
                        this.mLineBoxes[i].setText(spannableStringBuilderArr[i], BufferType.SPANNABLE);
                        this.mLineBoxes[i].setVisibility(0);
                    } else {
                        this.mLineBoxes[i].setVisibility(4);
                    }
                }
            }
        }

        private class CCLineBox extends TextView {
            private static final float EDGE_OUTLINE_RATIO = 0.1f;
            private static final float EDGE_SHADOW_RATIO = 0.05f;
            private static final float FONT_PADDING_RATIO = 0.75f;
            private int mBgColor = ViewCompat.MEASURED_STATE_MASK;
            private int mEdgeColor = 0;
            private int mEdgeType = 0;
            private float mOutlineWidth;
            private float mShadowOffset;
            private float mShadowRadius;
            private int mTextColor = -1;

            CCLineBox(Context context) {
                super(context);
                setGravity(17);
                setBackgroundColor(0);
                setTextColor(-1);
                setTypeface(Typeface.MONOSPACE);
                setVisibility(4);
                Resources resources = getContext().getResources();
                this.mOutlineWidth = (float) resources.getDimensionPixelSize(R.dimen.subtitle_outline_width);
                this.mShadowRadius = (float) resources.getDimensionPixelSize(R.dimen.subtitle_shadow_radius);
                this.mShadowOffset = (float) resources.getDimensionPixelSize(R.dimen.subtitle_shadow_offset);
            }

            private void drawEdgeOutline(Canvas canvas) {
                TextPaint paint = getPaint();
                Style style = paint.getStyle();
                Join strokeJoin = paint.getStrokeJoin();
                float strokeWidth = paint.getStrokeWidth();
                setTextColor(this.mEdgeColor);
                paint.setStyle(Style.FILL_AND_STROKE);
                paint.setStrokeJoin(Join.ROUND);
                paint.setStrokeWidth(this.mOutlineWidth);
                super.onDraw(canvas);
                setTextColor(this.mTextColor);
                paint.setStyle(style);
                paint.setStrokeJoin(strokeJoin);
                paint.setStrokeWidth(strokeWidth);
                setBackgroundSpans(0);
                super.onDraw(canvas);
                setBackgroundSpans(this.mBgColor);
            }

            private void drawEdgeRaisedOrDepressed(Canvas canvas) {
                TextPaint paint = getPaint();
                Style style = paint.getStyle();
                paint.setStyle(Style.FILL);
                boolean z = this.mEdgeType == 3;
                int i = -1;
                int i2 = z ? -1 : this.mEdgeColor;
                if (z) {
                    i = this.mEdgeColor;
                }
                float f = this.mShadowRadius / 2.0f;
                float f2 = -f;
                setShadowLayer(this.mShadowRadius, f2, f2, i2);
                super.onDraw(canvas);
                setBackgroundSpans(0);
                setShadowLayer(this.mShadowRadius, f, f, i);
                super.onDraw(canvas);
                paint.setStyle(style);
                setBackgroundSpans(this.mBgColor);
            }

            private void setBackgroundSpans(int i) {
                CharSequence text = getText();
                if (text instanceof Spannable) {
                    Spannable spannable = (Spannable) text;
                    MutableBackgroundColorSpan[] mutableBackgroundColorSpanArr = (MutableBackgroundColorSpan[]) spannable.getSpans(0, spannable.length(), MutableBackgroundColorSpan.class);
                    for (MutableBackgroundColorSpan backgroundColor : mutableBackgroundColorSpanArr) {
                        backgroundColor.setBackgroundColor(i);
                    }
                }
            }

            /* access modifiers changed from: protected */
            public void onDraw(Canvas canvas) {
                if (this.mEdgeType == -1 || this.mEdgeType == 0 || this.mEdgeType == 2) {
                    super.onDraw(canvas);
                    return;
                }
                if (this.mEdgeType == 1) {
                    drawEdgeOutline(canvas);
                } else {
                    drawEdgeRaisedOrDepressed(canvas);
                }
            }

            /* access modifiers changed from: protected */
            public void onMeasure(int i, int i2) {
                float size = ((float) MeasureSpec.getSize(i2)) * FONT_PADDING_RATIO;
                setTextSize(0, size);
                this.mOutlineWidth = (0.1f * size) + 1.0f;
                this.mShadowRadius = (EDGE_SHADOW_RATIO * size) + 1.0f;
                this.mShadowOffset = this.mShadowRadius;
                setScaleX(1.0f);
                getPaint().getTextBounds(Cea608CCWidget.DUMMY_TEXT, 0, Cea608CCWidget.DUMMY_TEXT.length(), Cea608CCWidget.this.mTextBounds);
                setScaleX(((float) MeasureSpec.getSize(i)) / ((float) Cea608CCWidget.this.mTextBounds.width()));
                super.onMeasure(i, i2);
            }

            /* access modifiers changed from: 0000 */
            public void setCaptionStyle(CaptionStyle captionStyle) {
                this.mTextColor = captionStyle.foregroundColor;
                this.mBgColor = captionStyle.backgroundColor;
                this.mEdgeType = captionStyle.edgeType;
                this.mEdgeColor = captionStyle.edgeColor;
                setTextColor(this.mTextColor);
                if (this.mEdgeType == 2) {
                    setShadowLayer(this.mShadowRadius, this.mShadowOffset, this.mShadowOffset, this.mEdgeColor);
                } else {
                    setShadowLayer(0.0f, 0.0f, 0.0f, 0);
                }
                invalidate();
            }
        }

        Cea608CCWidget(ClosedCaptionRenderer closedCaptionRenderer, Context context) {
            this(closedCaptionRenderer, context, null);
        }

        Cea608CCWidget(ClosedCaptionRenderer closedCaptionRenderer, Context context, AttributeSet attributeSet) {
            this(closedCaptionRenderer, context, attributeSet, 0);
        }

        Cea608CCWidget(ClosedCaptionRenderer closedCaptionRenderer, Context context, AttributeSet attributeSet, int i) {
            this(context, attributeSet, i, 0);
        }

        Cea608CCWidget(Context context, AttributeSet attributeSet, int i, int i2) {
            super(context, attributeSet, i, i2);
            this.mTextBounds = new Rect();
        }

        public ClosedCaptionLayout createCaptionLayout(Context context) {
            return new CCLayout(context);
        }

        public CaptionStyle getCaptionStyle() {
            return this.mCaptionStyle;
        }

        public void onDisplayChanged(SpannableStringBuilder[] spannableStringBuilderArr) {
            ((CCLayout) this.mClosedCaptionLayout).update(spannableStringBuilderArr);
            if (this.mListener != null) {
                this.mListener.onChanged(this);
            }
        }
    }

    static class Cea608CaptionTrack extends SubtitleTrack {
        private final Cea608CCParser mCCParser = new Cea608CCParser(this.mRenderingWidget);
        private final Cea608CCWidget mRenderingWidget;

        Cea608CaptionTrack(Cea608CCWidget cea608CCWidget, MediaFormat mediaFormat) {
            super(mediaFormat);
            this.mRenderingWidget = cea608CCWidget;
        }

        public RenderingWidget getRenderingWidget() {
            return this.mRenderingWidget;
        }

        public void onData(byte[] bArr, boolean z, long j) {
            this.mCCParser.parse(bArr);
        }

        public void updateView(ArrayList<Cue> arrayList) {
        }
    }

    public ClosedCaptionRenderer(Context context) {
        this.mContext = context;
    }

    public SubtitleTrack createTrack(MediaFormat mediaFormat) {
        if (SubtitleData2.MIMETYPE_TEXT_CEA_608.equals(mediaFormat.getString("mime"))) {
            if (this.mCCWidget == null) {
                this.mCCWidget = new Cea608CCWidget(this, this.mContext);
            }
            return new Cea608CaptionTrack(this.mCCWidget, mediaFormat);
        }
        StringBuilder sb = new StringBuilder();
        sb.append("No matching format: ");
        sb.append(mediaFormat.toString());
        throw new RuntimeException(sb.toString());
    }

    public boolean supports(MediaFormat mediaFormat) {
        if (!mediaFormat.containsKey("mime")) {
            return false;
        }
        return SubtitleData2.MIMETYPE_TEXT_CEA_608.equals(mediaFormat.getString("mime"));
    }
}
