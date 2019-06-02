package android.support.v4.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.support.annotation.ColorInt;
import android.support.annotation.FloatRange;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.text.TextUtils.TruncateAt;
import android.util.AttributeSet;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.TextView;
import java.lang.ref.WeakReference;

public class PagerTitleStrip extends ViewGroup implements Decor {
    private static final int[] ATTRS = {16842804, 16842901, 16842904, 16842927};
    private static final PagerTitleStripImpl IMPL;
    private static final float SIDE_ALPHA = 0.6f;
    private static final String TAG = "PagerTitleStrip";
    private static final int[] TEXT_ATTRS = {16843660};
    private static final int TEXT_SPACING = 16;
    TextView mCurrText;
    private int mGravity;
    private int mLastKnownCurrentPage;
    /* access modifiers changed from: private */
    public float mLastKnownPositionOffset;
    TextView mNextText;
    private int mNonPrimaryAlpha;
    private final PageListener mPageListener;
    ViewPager mPager;
    TextView mPrevText;
    private int mScaledTextSpacing;
    int mTextColor;
    private boolean mUpdatingPositions;
    private boolean mUpdatingText;
    private WeakReference<PagerAdapter> mWatchingAdapter;

    private class PageListener extends DataSetObserver implements OnPageChangeListener, OnAdapterChangeListener {
        private int mScrollState;

        private PageListener() {
        }

        public void onAdapterChanged(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
            PagerTitleStrip.this.updateAdapter(pagerAdapter, pagerAdapter2);
        }

        public void onChanged() {
            PagerTitleStrip.this.updateText(PagerTitleStrip.this.mPager.getCurrentItem(), PagerTitleStrip.this.mPager.getAdapter());
            float f = 0.0f;
            if (PagerTitleStrip.this.mLastKnownPositionOffset >= 0.0f) {
                f = PagerTitleStrip.this.mLastKnownPositionOffset;
            }
            PagerTitleStrip.this.updateTextPositions(PagerTitleStrip.this.mPager.getCurrentItem(), f, true);
        }

        public void onPageScrollStateChanged(int i) {
            this.mScrollState = i;
        }

        public void onPageScrolled(int i, float f, int i2) {
            if (f > 0.5f) {
                i++;
            }
            PagerTitleStrip.this.updateTextPositions(i, f, false);
        }

        public void onPageSelected(int i) {
            if (this.mScrollState == 0) {
                PagerTitleStrip.this.updateText(PagerTitleStrip.this.mPager.getCurrentItem(), PagerTitleStrip.this.mPager.getAdapter());
                float f = 0.0f;
                if (PagerTitleStrip.this.mLastKnownPositionOffset >= 0.0f) {
                    f = PagerTitleStrip.this.mLastKnownPositionOffset;
                }
                PagerTitleStrip.this.updateTextPositions(PagerTitleStrip.this.mPager.getCurrentItem(), f, true);
            }
        }
    }

    interface PagerTitleStripImpl {
        void setSingleLineAllCaps(TextView textView);
    }

    static class PagerTitleStripImplBase implements PagerTitleStripImpl {
        PagerTitleStripImplBase() {
        }

        public void setSingleLineAllCaps(TextView textView) {
            textView.setSingleLine();
        }
    }

    static class PagerTitleStripImplIcs implements PagerTitleStripImpl {
        PagerTitleStripImplIcs() {
        }

        public void setSingleLineAllCaps(TextView textView) {
            PagerTitleStripIcs.setSingleLineAllCaps(textView);
        }
    }

    static {
        if (VERSION.SDK_INT >= 14) {
            IMPL = new PagerTitleStripImplIcs();
        } else {
            IMPL = new PagerTitleStripImplBase();
        }
    }

    public PagerTitleStrip(Context context) {
        this(context, null);
    }

    public PagerTitleStrip(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mLastKnownCurrentPage = -1;
        this.mLastKnownPositionOffset = -1.0f;
        this.mPageListener = new PageListener();
        TextView textView = new TextView(context);
        this.mPrevText = textView;
        addView(textView);
        TextView textView2 = new TextView(context);
        this.mCurrText = textView2;
        addView(textView2);
        TextView textView3 = new TextView(context);
        this.mNextText = textView3;
        addView(textView3);
        TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ATTRS);
        int resourceId = obtainStyledAttributes.getResourceId(0, 0);
        if (resourceId != 0) {
            this.mPrevText.setTextAppearance(context, resourceId);
            this.mCurrText.setTextAppearance(context, resourceId);
            this.mNextText.setTextAppearance(context, resourceId);
        }
        int dimensionPixelSize = obtainStyledAttributes.getDimensionPixelSize(1, 0);
        if (dimensionPixelSize != 0) {
            setTextSize(0, (float) dimensionPixelSize);
        }
        if (obtainStyledAttributes.hasValue(2)) {
            int color = obtainStyledAttributes.getColor(2, 0);
            this.mPrevText.setTextColor(color);
            this.mCurrText.setTextColor(color);
            this.mNextText.setTextColor(color);
        }
        this.mGravity = obtainStyledAttributes.getInteger(3, 80);
        obtainStyledAttributes.recycle();
        this.mTextColor = this.mCurrText.getTextColors().getDefaultColor();
        setNonPrimaryAlpha(0.6f);
        this.mPrevText.setEllipsize(TruncateAt.END);
        this.mCurrText.setEllipsize(TruncateAt.END);
        this.mNextText.setEllipsize(TruncateAt.END);
        boolean z = false;
        if (resourceId != 0) {
            TypedArray obtainStyledAttributes2 = context.obtainStyledAttributes(resourceId, TEXT_ATTRS);
            z = obtainStyledAttributes2.getBoolean(0, false);
            obtainStyledAttributes2.recycle();
        }
        if (z) {
            setSingleLineAllCaps(this.mPrevText);
            setSingleLineAllCaps(this.mCurrText);
            setSingleLineAllCaps(this.mNextText);
        } else {
            this.mPrevText.setSingleLine();
            this.mCurrText.setSingleLine();
            this.mNextText.setSingleLine();
        }
        this.mScaledTextSpacing = (int) (16.0f * context.getResources().getDisplayMetrics().density);
    }

    private static void setSingleLineAllCaps(TextView textView) {
        IMPL.setSingleLineAllCaps(textView);
    }

    /* access modifiers changed from: 0000 */
    public int getMinHeight() {
        Drawable background = getBackground();
        if (background != null) {
            return background.getIntrinsicHeight();
        }
        return 0;
    }

    public int getTextSpacing() {
        return this.mScaledTextSpacing;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (parent instanceof ViewPager) {
            ViewPager viewPager = (ViewPager) parent;
            PagerAdapter adapter = viewPager.getAdapter();
            viewPager.setInternalPageChangeListener(this.mPageListener);
            viewPager.setOnAdapterChangeListener(this.mPageListener);
            this.mPager = viewPager;
            updateAdapter(this.mWatchingAdapter != null ? (PagerAdapter) this.mWatchingAdapter.get() : null, adapter);
            return;
        }
        throw new IllegalStateException("PagerTitleStrip must be a direct child of a ViewPager.");
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mPager != null) {
            updateAdapter(this.mPager.getAdapter(), null);
            this.mPager.setInternalPageChangeListener(null);
            this.mPager.setOnAdapterChangeListener(null);
            this.mPager = null;
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        if (this.mPager != null) {
            float f = 0.0f;
            if (this.mLastKnownPositionOffset >= 0.0f) {
                f = this.mLastKnownPositionOffset;
            }
            updateTextPositions(this.mLastKnownCurrentPage, f, true);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int mode = MeasureSpec.getMode(i);
        int mode2 = MeasureSpec.getMode(i2);
        int size = MeasureSpec.getSize(i);
        int size2 = MeasureSpec.getSize(i2);
        if (mode == 1073741824) {
            int i3 = size2;
            int minHeight = getMinHeight();
            int paddingTop = getPaddingTop() + getPaddingBottom();
            int i4 = i3 - paddingTop;
            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(Math.max(0, (int) (((float) size) * 0.8f)), Integer.MIN_VALUE);
            int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(Math.min(0, i4), Integer.MIN_VALUE);
            this.mPrevText.measure(makeMeasureSpec, makeMeasureSpec2);
            this.mCurrText.measure(makeMeasureSpec, makeMeasureSpec2);
            this.mNextText.measure(makeMeasureSpec, makeMeasureSpec2);
            if (mode2 == 1073741824) {
                setMeasuredDimension(size, size2);
            } else {
                setMeasuredDimension(size, Math.max(minHeight, this.mCurrText.getMeasuredHeight() + paddingTop));
            }
        } else {
            throw new IllegalStateException("Must measure with an exact width");
        }
    }

    public void requestLayout() {
        if (!this.mUpdatingText) {
            super.requestLayout();
        }
    }

    public void setGravity(int i) {
        this.mGravity = i;
        requestLayout();
    }

    public void setNonPrimaryAlpha(@FloatRange(from = 0.0d, to = 1.0d) float f) {
        this.mNonPrimaryAlpha = ((int) (255.0f * f)) & 255;
        int i = (this.mNonPrimaryAlpha << 24) | (this.mTextColor & ViewCompat.MEASURED_SIZE_MASK);
        this.mPrevText.setTextColor(i);
        this.mNextText.setTextColor(i);
    }

    public void setTextColor(@ColorInt int i) {
        this.mTextColor = i;
        this.mCurrText.setTextColor(i);
        int i2 = (this.mNonPrimaryAlpha << 24) | (this.mTextColor & ViewCompat.MEASURED_SIZE_MASK);
        this.mPrevText.setTextColor(i2);
        this.mNextText.setTextColor(i2);
    }

    public void setTextSize(int i, float f) {
        this.mPrevText.setTextSize(i, f);
        this.mCurrText.setTextSize(i, f);
        this.mNextText.setTextSize(i, f);
    }

    public void setTextSpacing(int i) {
        this.mScaledTextSpacing = i;
        requestLayout();
    }

    /* access modifiers changed from: 0000 */
    public void updateAdapter(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2) {
        if (pagerAdapter != null) {
            pagerAdapter.unregisterDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = null;
        }
        if (pagerAdapter2 != null) {
            pagerAdapter2.registerDataSetObserver(this.mPageListener);
            this.mWatchingAdapter = new WeakReference<>(pagerAdapter2);
        }
        if (this.mPager != null) {
            this.mLastKnownCurrentPage = -1;
            this.mLastKnownPositionOffset = -1.0f;
            updateText(this.mPager.getCurrentItem(), pagerAdapter2);
            requestLayout();
        }
    }

    /* access modifiers changed from: 0000 */
    public void updateText(int i, PagerAdapter pagerAdapter) {
        int count = pagerAdapter != null ? pagerAdapter.getCount() : 0;
        this.mUpdatingText = true;
        CharSequence charSequence = null;
        if (i >= 1 && pagerAdapter != null) {
            charSequence = pagerAdapter.getPageTitle(i - 1);
        }
        this.mPrevText.setText(charSequence);
        TextView textView = this.mCurrText;
        CharSequence pageTitle = (pagerAdapter == null || i >= count) ? null : pagerAdapter.getPageTitle(i);
        textView.setText(pageTitle);
        CharSequence charSequence2 = null;
        if (i + 1 < count && pagerAdapter != null) {
            charSequence2 = pagerAdapter.getPageTitle(i + 1);
        }
        this.mNextText.setText(charSequence2);
        int makeMeasureSpec = MeasureSpec.makeMeasureSpec(Math.max(0, (int) (((float) ((getWidth() - getPaddingLeft()) - getPaddingRight())) * 0.8f)), Integer.MIN_VALUE);
        int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(Math.max(0, (getHeight() - getPaddingTop()) - getPaddingBottom()), Integer.MIN_VALUE);
        this.mPrevText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mCurrText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mNextText.measure(makeMeasureSpec, makeMeasureSpec2);
        this.mLastKnownCurrentPage = i;
        if (!this.mUpdatingPositions) {
            updateTextPositions(i, this.mLastKnownPositionOffset, false);
        }
        this.mUpdatingText = false;
    }

    /* access modifiers changed from: 0000 */
    public void updateTextPositions(int i, float f, boolean z) {
        int i2;
        int i3;
        int i4;
        int i5 = i;
        float f2 = f;
        if (i5 != this.mLastKnownCurrentPage) {
            updateText(i5, this.mPager.getAdapter());
        } else if (!z && f2 == this.mLastKnownPositionOffset) {
            return;
        }
        this.mUpdatingPositions = true;
        int measuredWidth = this.mPrevText.getMeasuredWidth();
        int measuredWidth2 = this.mCurrText.getMeasuredWidth();
        int measuredWidth3 = this.mNextText.getMeasuredWidth();
        int i6 = measuredWidth2 / 2;
        int width = getWidth();
        int height = getHeight();
        int paddingLeft = getPaddingLeft();
        int paddingRight = getPaddingRight();
        int paddingTop = getPaddingTop();
        int paddingBottom = getPaddingBottom();
        int i7 = paddingLeft + i6;
        int i8 = paddingRight + i6;
        int i9 = (width - i7) - i8;
        float f3 = f2 + 0.5f;
        if (f3 > 1.0f) {
            f3 -= 1.0f;
        }
        int i10 = ((width - i8) - ((int) (((float) i9) * f3))) - (measuredWidth2 / 2);
        int i11 = i9;
        int i12 = i10 + measuredWidth2;
        int i13 = measuredWidth2;
        int baseline = this.mPrevText.getBaseline();
        int i14 = i6;
        int baseline2 = this.mCurrText.getBaseline();
        int i15 = i7;
        int baseline3 = this.mNextText.getBaseline();
        int i16 = i8;
        int max = Math.max(Math.max(baseline, baseline2), baseline3);
        int i17 = max - baseline;
        int i18 = max - baseline2;
        int i19 = max - baseline3;
        int i20 = baseline;
        int measuredHeight = i17 + this.mPrevText.getMeasuredHeight();
        int i21 = baseline2;
        int measuredHeight2 = i18 + this.mCurrText.getMeasuredHeight();
        int i22 = baseline3;
        int i23 = max;
        int max2 = Math.max(Math.max(measuredHeight, measuredHeight2), i19 + this.mNextText.getMeasuredHeight());
        int i24 = measuredHeight;
        int i25 = this.mGravity & 112;
        int i26 = measuredHeight2;
        if (i25 == 16) {
            int i27 = (((height - paddingTop) - paddingBottom) - max2) / 2;
            int i28 = i25;
            int i29 = height;
            i4 = i27 + i17;
            i3 = i27 + i18;
            i2 = i27 + i19;
        } else if (i25 != 80) {
            int i30 = i25;
            i4 = paddingTop + i17;
            int i31 = height;
            i3 = paddingTop + i18;
            i2 = paddingTop + i19;
        } else {
            int i32 = (height - paddingBottom) - max2;
            int i33 = i25;
            int i34 = height;
            i4 = i32 + i17;
            i2 = i32 + i19;
            i3 = i32 + i18;
        }
        int i35 = paddingTop;
        int i36 = paddingBottom;
        this.mCurrText.layout(i10, i3, i12, this.mCurrText.getMeasuredHeight() + i3);
        int min = Math.min(paddingLeft, (i10 - this.mScaledTextSpacing) - measuredWidth);
        int i37 = i10;
        int i38 = measuredWidth;
        this.mPrevText.layout(min, i4, min + measuredWidth, this.mPrevText.getMeasuredHeight() + i4);
        int max3 = Math.max((width - paddingRight) - measuredWidth3, this.mScaledTextSpacing + i12);
        int i39 = i12;
        this.mNextText.layout(max3, i2, max3 + measuredWidth3, this.mNextText.getMeasuredHeight() + i2);
        this.mLastKnownPositionOffset = f2;
        this.mUpdatingPositions = false;
    }
}
