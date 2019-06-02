package android.support.v4.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.annotation.ColorInt;
import android.support.annotation.DrawableRes;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.widget.ViewDragHelper.Callback;
import android.util.AttributeSet;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;

public class SlidingPaneLayout extends ViewGroup {
    private static final int DEFAULT_FADE_COLOR = -858993460;
    private static final int DEFAULT_OVERHANG_SIZE = 32;
    static final SlidingPanelLayoutImpl IMPL;
    private static final int MIN_FLING_VELOCITY = 400;
    private static final String TAG = "SlidingPaneLayout";
    private boolean mCanSlide;
    private int mCoveredFadeColor;
    /* access modifiers changed from: private */
    public final ViewDragHelper mDragHelper;
    private boolean mFirstLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    /* access modifiers changed from: private */
    public boolean mIsUnableToDrag;
    private final int mOverhangSize;
    private PanelSlideListener mPanelSlideListener;
    private int mParallaxBy;
    private float mParallaxOffset;
    /* access modifiers changed from: private */
    public final ArrayList<DisableLayerRunnable> mPostedRunnables;
    /* access modifiers changed from: private */
    public boolean mPreservedOpenState;
    private Drawable mShadowDrawableLeft;
    private Drawable mShadowDrawableRight;
    /* access modifiers changed from: private */
    public float mSlideOffset;
    /* access modifiers changed from: private */
    public int mSlideRange;
    /* access modifiers changed from: private */
    public View mSlideableView;
    private int mSliderFadeColor;
    private final Rect mTmpRect;

    class AccessibilityDelegate extends AccessibilityDelegateCompat {
        private final Rect mTmpRect = new Rect();

        AccessibilityDelegate() {
        }

        private void copyNodeInfoNoChildren(AccessibilityNodeInfoCompat accessibilityNodeInfoCompat, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat2) {
            Rect rect = this.mTmpRect;
            accessibilityNodeInfoCompat2.getBoundsInParent(rect);
            accessibilityNodeInfoCompat.setBoundsInParent(rect);
            accessibilityNodeInfoCompat2.getBoundsInScreen(rect);
            accessibilityNodeInfoCompat.setBoundsInScreen(rect);
            accessibilityNodeInfoCompat.setVisibleToUser(accessibilityNodeInfoCompat2.isVisibleToUser());
            accessibilityNodeInfoCompat.setPackageName(accessibilityNodeInfoCompat2.getPackageName());
            accessibilityNodeInfoCompat.setClassName(accessibilityNodeInfoCompat2.getClassName());
            accessibilityNodeInfoCompat.setContentDescription(accessibilityNodeInfoCompat2.getContentDescription());
            accessibilityNodeInfoCompat.setEnabled(accessibilityNodeInfoCompat2.isEnabled());
            accessibilityNodeInfoCompat.setClickable(accessibilityNodeInfoCompat2.isClickable());
            accessibilityNodeInfoCompat.setFocusable(accessibilityNodeInfoCompat2.isFocusable());
            accessibilityNodeInfoCompat.setFocused(accessibilityNodeInfoCompat2.isFocused());
            accessibilityNodeInfoCompat.setAccessibilityFocused(accessibilityNodeInfoCompat2.isAccessibilityFocused());
            accessibilityNodeInfoCompat.setSelected(accessibilityNodeInfoCompat2.isSelected());
            accessibilityNodeInfoCompat.setLongClickable(accessibilityNodeInfoCompat2.isLongClickable());
            accessibilityNodeInfoCompat.addAction(accessibilityNodeInfoCompat2.getActions());
            accessibilityNodeInfoCompat.setMovementGranularities(accessibilityNodeInfoCompat2.getMovementGranularities());
        }

        public boolean filter(View view) {
            return SlidingPaneLayout.this.isDimmed(view);
        }

        public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(view, accessibilityEvent);
            accessibilityEvent.setClassName(SlidingPaneLayout.class.getName());
        }

        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            AccessibilityNodeInfoCompat obtain = AccessibilityNodeInfoCompat.obtain(accessibilityNodeInfoCompat);
            super.onInitializeAccessibilityNodeInfo(view, obtain);
            copyNodeInfoNoChildren(accessibilityNodeInfoCompat, obtain);
            obtain.recycle();
            accessibilityNodeInfoCompat.setClassName(SlidingPaneLayout.class.getName());
            accessibilityNodeInfoCompat.setSource(view);
            ViewParent parentForAccessibility = ViewCompat.getParentForAccessibility(view);
            if (parentForAccessibility instanceof View) {
                accessibilityNodeInfoCompat.setParent((View) parentForAccessibility);
            }
            int childCount = SlidingPaneLayout.this.getChildCount();
            for (int i = 0; i < childCount; i++) {
                View childAt = SlidingPaneLayout.this.getChildAt(i);
                if (!filter(childAt) && childAt.getVisibility() == 0) {
                    ViewCompat.setImportantForAccessibility(childAt, 1);
                    accessibilityNodeInfoCompat.addChild(childAt);
                }
            }
        }

        public boolean onRequestSendAccessibilityEvent(ViewGroup viewGroup, View view, AccessibilityEvent accessibilityEvent) {
            if (!filter(view)) {
                return super.onRequestSendAccessibilityEvent(viewGroup, view, accessibilityEvent);
            }
            return false;
        }
    }

    private class DisableLayerRunnable implements Runnable {
        final View mChildView;

        DisableLayerRunnable(View view) {
            this.mChildView = view;
        }

        public void run() {
            if (this.mChildView.getParent() == SlidingPaneLayout.this) {
                ViewCompat.setLayerType(this.mChildView, 0, null);
                SlidingPaneLayout.this.invalidateChildRegion(this.mChildView);
            }
            SlidingPaneLayout.this.mPostedRunnables.remove(this);
        }
    }

    private class DragHelperCallback extends Callback {
        private DragHelperCallback() {
        }

        public int clampViewPositionHorizontal(View view, int i, int i2) {
            LayoutParams layoutParams = (LayoutParams) SlidingPaneLayout.this.mSlideableView.getLayoutParams();
            if (SlidingPaneLayout.this.isLayoutRtlSupport()) {
                int width = SlidingPaneLayout.this.getWidth() - ((SlidingPaneLayout.this.getPaddingRight() + layoutParams.rightMargin) + SlidingPaneLayout.this.mSlideableView.getWidth());
                return Math.max(Math.min(i, width), width - SlidingPaneLayout.this.mSlideRange);
            }
            int paddingLeft = SlidingPaneLayout.this.getPaddingLeft() + layoutParams.leftMargin;
            return Math.min(Math.max(i, paddingLeft), SlidingPaneLayout.this.mSlideRange + paddingLeft);
        }

        public int clampViewPositionVertical(View view, int i, int i2) {
            return view.getTop();
        }

        public int getViewHorizontalDragRange(View view) {
            return SlidingPaneLayout.this.mSlideRange;
        }

        public void onEdgeDragStarted(int i, int i2) {
            SlidingPaneLayout.this.mDragHelper.captureChildView(SlidingPaneLayout.this.mSlideableView, i2);
        }

        public void onViewCaptured(View view, int i) {
            SlidingPaneLayout.this.setAllChildrenVisible();
        }

        public void onViewDragStateChanged(int i) {
            if (SlidingPaneLayout.this.mDragHelper.getViewDragState() != 0) {
                return;
            }
            if (SlidingPaneLayout.this.mSlideOffset == 0.0f) {
                SlidingPaneLayout.this.updateObscuredViewsVisibility(SlidingPaneLayout.this.mSlideableView);
                SlidingPaneLayout.this.dispatchOnPanelClosed(SlidingPaneLayout.this.mSlideableView);
                SlidingPaneLayout.this.mPreservedOpenState = false;
                return;
            }
            SlidingPaneLayout.this.dispatchOnPanelOpened(SlidingPaneLayout.this.mSlideableView);
            SlidingPaneLayout.this.mPreservedOpenState = true;
        }

        public void onViewPositionChanged(View view, int i, int i2, int i3, int i4) {
            SlidingPaneLayout.this.onPanelDragged(i);
            SlidingPaneLayout.this.invalidate();
        }

        public void onViewReleased(View view, float f, float f2) {
            int i;
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            if (SlidingPaneLayout.this.isLayoutRtlSupport()) {
                int paddingRight = SlidingPaneLayout.this.getPaddingRight() + layoutParams.rightMargin;
                if (f < 0.0f || (f == 0.0f && SlidingPaneLayout.this.mSlideOffset > 0.5f)) {
                    paddingRight += SlidingPaneLayout.this.mSlideRange;
                }
                i = (SlidingPaneLayout.this.getWidth() - paddingRight) - SlidingPaneLayout.this.mSlideableView.getWidth();
            } else {
                int paddingLeft = SlidingPaneLayout.this.getPaddingLeft() + layoutParams.leftMargin;
                i = (f > 0.0f || (f == 0.0f && SlidingPaneLayout.this.mSlideOffset > 0.5f)) ? paddingLeft + SlidingPaneLayout.this.mSlideRange : paddingLeft;
            }
            SlidingPaneLayout.this.mDragHelper.settleCapturedViewAt(i, view.getTop());
            SlidingPaneLayout.this.invalidate();
        }

        public boolean tryCaptureView(View view, int i) {
            if (SlidingPaneLayout.this.mIsUnableToDrag) {
                return false;
            }
            return ((LayoutParams) view.getLayoutParams()).slideable;
        }
    }

    public static class LayoutParams extends MarginLayoutParams {
        private static final int[] ATTRS = {16843137};
        Paint dimPaint;
        boolean dimWhenOffset;
        boolean slideable;
        public float weight = 0.0f;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(int i, int i2) {
            super(i, i2);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ATTRS);
            this.weight = obtainStyledAttributes.getFloat(0, 0.0f);
            obtainStyledAttributes.recycle();
        }

        public LayoutParams(LayoutParams layoutParams) {
            super(layoutParams);
            this.weight = layoutParams.weight;
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        public LayoutParams(MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
        }
    }

    public interface PanelSlideListener {
        void onPanelClosed(View view);

        void onPanelOpened(View view);

        void onPanelSlide(View view, float f);
    }

    static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        boolean isOpen;

        private SavedState(Parcel parcel) {
            super(parcel);
            this.isOpen = parcel.readInt() != 0;
        }

        SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.isOpen ? 1 : 0);
        }
    }

    public static class SimplePanelSlideListener implements PanelSlideListener {
        public void onPanelClosed(View view) {
        }

        public void onPanelOpened(View view) {
        }

        public void onPanelSlide(View view, float f) {
        }
    }

    interface SlidingPanelLayoutImpl {
        void invalidateChildRegion(SlidingPaneLayout slidingPaneLayout, View view);
    }

    static class SlidingPanelLayoutImplBase implements SlidingPanelLayoutImpl {
        SlidingPanelLayoutImplBase() {
        }

        public void invalidateChildRegion(SlidingPaneLayout slidingPaneLayout, View view) {
            ViewCompat.postInvalidateOnAnimation(slidingPaneLayout, view.getLeft(), view.getTop(), view.getRight(), view.getBottom());
        }
    }

    static class SlidingPanelLayoutImplJB extends SlidingPanelLayoutImplBase {
        private Method mGetDisplayList;
        private Field mRecreateDisplayList;

        SlidingPanelLayoutImplJB() {
            try {
                this.mGetDisplayList = View.class.getDeclaredMethod("getDisplayList", null);
            } catch (NoSuchMethodException e) {
                Log.e(SlidingPaneLayout.TAG, "Couldn't fetch getDisplayList method; dimming won't work right.", e);
            }
            try {
                this.mRecreateDisplayList = View.class.getDeclaredField("mRecreateDisplayList");
                this.mRecreateDisplayList.setAccessible(true);
            } catch (NoSuchFieldException e2) {
                Log.e(SlidingPaneLayout.TAG, "Couldn't fetch mRecreateDisplayList field; dimming will be slow.", e2);
            }
        }

        public void invalidateChildRegion(SlidingPaneLayout slidingPaneLayout, View view) {
            if (this.mGetDisplayList == null || this.mRecreateDisplayList == null) {
                view.invalidate();
                return;
            }
            try {
                this.mRecreateDisplayList.setBoolean(view, true);
                this.mGetDisplayList.invoke(view, null);
            } catch (Exception e) {
                Log.e(SlidingPaneLayout.TAG, "Error refreshing display list state", e);
            }
            super.invalidateChildRegion(slidingPaneLayout, view);
        }
    }

    static class SlidingPanelLayoutImplJBMR1 extends SlidingPanelLayoutImplBase {
        SlidingPanelLayoutImplJBMR1() {
        }

        public void invalidateChildRegion(SlidingPaneLayout slidingPaneLayout, View view) {
            ViewCompat.setLayerPaint(view, ((LayoutParams) view.getLayoutParams()).dimPaint);
        }
    }

    static {
        int i = VERSION.SDK_INT;
        if (i >= 17) {
            IMPL = new SlidingPanelLayoutImplJBMR1();
        } else if (i >= 16) {
            IMPL = new SlidingPanelLayoutImplJB();
        } else {
            IMPL = new SlidingPanelLayoutImplBase();
        }
    }

    public SlidingPaneLayout(Context context) {
        this(context, null);
    }

    public SlidingPaneLayout(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public SlidingPaneLayout(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.mSliderFadeColor = DEFAULT_FADE_COLOR;
        this.mFirstLayout = true;
        this.mTmpRect = new Rect();
        this.mPostedRunnables = new ArrayList<>();
        float f = context.getResources().getDisplayMetrics().density;
        this.mOverhangSize = (int) ((32.0f * f) + 0.5f);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        setWillNotDraw(false);
        ViewCompat.setAccessibilityDelegate(this, new AccessibilityDelegate());
        ViewCompat.setImportantForAccessibility(this, 1);
        this.mDragHelper = ViewDragHelper.create(this, 0.5f, new DragHelperCallback());
        this.mDragHelper.setMinVelocity(400.0f * f);
    }

    private boolean closePane(View view, int i) {
        if (!this.mFirstLayout && !smoothSlideTo(0.0f, i)) {
            return false;
        }
        this.mPreservedOpenState = false;
        return true;
    }

    private void dimChildView(View view, float f, int i) {
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (f > 0.0f && i != 0) {
            int i2 = (((int) (((float) ((-16777216 & i) >>> 24)) * f)) << 24) | (16777215 & i);
            if (layoutParams.dimPaint == null) {
                layoutParams.dimPaint = new Paint();
            }
            layoutParams.dimPaint.setColorFilter(new PorterDuffColorFilter(i2, Mode.SRC_OVER));
            if (ViewCompat.getLayerType(view) != 2) {
                ViewCompat.setLayerType(view, 2, layoutParams.dimPaint);
            }
            invalidateChildRegion(view);
        } else if (ViewCompat.getLayerType(view) != 0) {
            if (layoutParams.dimPaint != null) {
                layoutParams.dimPaint.setColorFilter(null);
            }
            DisableLayerRunnable disableLayerRunnable = new DisableLayerRunnable(view);
            this.mPostedRunnables.add(disableLayerRunnable);
            ViewCompat.postOnAnimation(this, disableLayerRunnable);
        }
    }

    /* access modifiers changed from: private */
    public void invalidateChildRegion(View view) {
        IMPL.invalidateChildRegion(this, view);
    }

    /* access modifiers changed from: private */
    public boolean isLayoutRtlSupport() {
        return ViewCompat.getLayoutDirection(this) == 1;
    }

    /* access modifiers changed from: private */
    public void onPanelDragged(int i) {
        if (this.mSlideableView == null) {
            this.mSlideOffset = 0.0f;
            return;
        }
        boolean isLayoutRtlSupport = isLayoutRtlSupport();
        LayoutParams layoutParams = (LayoutParams) this.mSlideableView.getLayoutParams();
        this.mSlideOffset = ((float) ((isLayoutRtlSupport ? (getWidth() - i) - this.mSlideableView.getWidth() : i) - ((isLayoutRtlSupport ? getPaddingRight() : getPaddingLeft()) + (isLayoutRtlSupport ? layoutParams.rightMargin : layoutParams.leftMargin)))) / ((float) this.mSlideRange);
        if (this.mParallaxBy != 0) {
            parallaxOtherViews(this.mSlideOffset);
        }
        if (layoutParams.dimWhenOffset) {
            dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
        }
        dispatchOnPanelSlide(this.mSlideableView);
    }

    private boolean openPane(View view, int i) {
        if (!this.mFirstLayout && !smoothSlideTo(1.0f, i)) {
            return false;
        }
        this.mPreservedOpenState = true;
        return true;
    }

    /* JADX WARNING: Removed duplicated region for block: B:10:0x0024  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void parallaxOtherViews(float f) {
        boolean z;
        int childCount;
        boolean isLayoutRtlSupport = isLayoutRtlSupport();
        LayoutParams layoutParams = (LayoutParams) this.mSlideableView.getLayoutParams();
        if (layoutParams.dimWhenOffset) {
            if ((isLayoutRtlSupport ? layoutParams.rightMargin : layoutParams.leftMargin) <= 0) {
                z = true;
                childCount = getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View childAt = getChildAt(i);
                    if (childAt != this.mSlideableView) {
                        int i2 = (int) ((1.0f - this.mParallaxOffset) * ((float) this.mParallaxBy));
                        this.mParallaxOffset = f;
                        int i3 = i2 - ((int) ((1.0f - f) * ((float) this.mParallaxBy)));
                        childAt.offsetLeftAndRight(isLayoutRtlSupport ? -i3 : i3);
                        if (z) {
                            dimChildView(childAt, isLayoutRtlSupport ? this.mParallaxOffset - 1.0f : 1.0f - this.mParallaxOffset, this.mCoveredFadeColor);
                        }
                    }
                }
            }
        }
        z = false;
        childCount = getChildCount();
        while (i < childCount) {
        }
    }

    private static boolean viewIsOpaque(View view) {
        boolean z = true;
        if (ViewCompat.isOpaque(view)) {
            return true;
        }
        if (VERSION.SDK_INT >= 18) {
            return false;
        }
        Drawable background = view.getBackground();
        if (background == null) {
            return false;
        }
        if (background.getOpacity() != -1) {
            z = false;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x006f, code lost:
        if (android.support.v4.view.ViewCompat.canScrollHorizontally(r0, isLayoutRtlSupport() ? r17 : -r17) != false) goto L_0x0075;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean canScroll(View view, boolean z, int i, int i2, int i3) {
        View view2 = view;
        boolean z2 = true;
        if (view2 instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view2;
            int scrollX = view2.getScrollX();
            int scrollY = view2.getScrollY();
            for (int childCount = viewGroup.getChildCount() - 1; childCount >= 0; childCount--) {
                View childAt = viewGroup.getChildAt(childCount);
                if (i2 + scrollX >= childAt.getLeft() && i2 + scrollX < childAt.getRight() && i3 + scrollY >= childAt.getTop() && i3 + scrollY < childAt.getBottom()) {
                    if (canScroll(childAt, true, i, (i2 + scrollX) - childAt.getLeft(), (i3 + scrollY) - childAt.getTop())) {
                        return true;
                    }
                }
            }
        }
        if (!z) {
            int i4 = i;
        }
        z2 = false;
        return z2;
    }

    @Deprecated
    public boolean canSlide() {
        return this.mCanSlide;
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    public boolean closePane() {
        return closePane(this.mSlideableView, 0);
    }

    public void computeScroll() {
        if (this.mDragHelper.continueSettling(true)) {
            if (!this.mCanSlide) {
                this.mDragHelper.abort();
                return;
            }
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    /* access modifiers changed from: 0000 */
    public void dispatchOnPanelClosed(View view) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelClosed(view);
        }
        sendAccessibilityEvent(32);
    }

    /* access modifiers changed from: 0000 */
    public void dispatchOnPanelOpened(View view) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelOpened(view);
        }
        sendAccessibilityEvent(32);
    }

    /* access modifiers changed from: 0000 */
    public void dispatchOnPanelSlide(View view) {
        if (this.mPanelSlideListener != null) {
            this.mPanelSlideListener.onPanelSlide(view, this.mSlideOffset);
        }
    }

    public void draw(Canvas canvas) {
        int i;
        int i2;
        super.draw(canvas);
        Drawable drawable = isLayoutRtlSupport() ? this.mShadowDrawableRight : this.mShadowDrawableLeft;
        View childAt = getChildCount() > 1 ? getChildAt(1) : null;
        if (childAt != null && drawable != null) {
            int top = childAt.getTop();
            int bottom = childAt.getBottom();
            int intrinsicWidth = drawable.getIntrinsicWidth();
            if (isLayoutRtlSupport()) {
                i2 = childAt.getRight();
                i = i2 + intrinsicWidth;
            } else {
                i = childAt.getLeft();
                i2 = i - intrinsicWidth;
            }
            drawable.setBounds(i2, top, i, bottom);
            drawable.draw(canvas);
        }
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View view, long j) {
        boolean z;
        boolean z2;
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        int save = canvas.save(2);
        if (this.mCanSlide && !layoutParams.slideable && this.mSlideableView != null) {
            canvas.getClipBounds(this.mTmpRect);
            if (isLayoutRtlSupport()) {
                this.mTmpRect.left = Math.max(this.mTmpRect.left, this.mSlideableView.getRight());
            } else {
                this.mTmpRect.right = Math.min(this.mTmpRect.right, this.mSlideableView.getLeft());
            }
            canvas.clipRect(this.mTmpRect);
        }
        if (VERSION.SDK_INT >= 11) {
            z = super.drawChild(canvas, view, j);
        } else if (!layoutParams.dimWhenOffset || this.mSlideOffset <= 0.0f) {
            if (view.isDrawingCacheEnabled()) {
                view.setDrawingCacheEnabled(false);
            }
            z = super.drawChild(canvas, view, j);
        } else {
            if (!view.isDrawingCacheEnabled()) {
                view.setDrawingCacheEnabled(true);
            }
            Bitmap drawingCache = view.getDrawingCache();
            if (drawingCache != null) {
                canvas.drawBitmap(drawingCache, (float) view.getLeft(), (float) view.getTop(), layoutParams.dimPaint);
                z2 = false;
            } else {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("drawChild: child view ");
                sb.append(view);
                sb.append(" returned null drawing cache");
                Log.e(str, sb.toString());
                z2 = super.drawChild(canvas, view, j);
            }
            z = z2;
        }
        canvas.restoreToCount(save);
        return z;
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new LayoutParams(getContext(), attributeSet);
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof MarginLayoutParams ? new LayoutParams((MarginLayoutParams) layoutParams) : new LayoutParams(layoutParams);
    }

    @ColorInt
    public int getCoveredFadeColor() {
        return this.mCoveredFadeColor;
    }

    public int getParallaxDistance() {
        return this.mParallaxBy;
    }

    @ColorInt
    public int getSliderFadeColor() {
        return this.mSliderFadeColor;
    }

    /* access modifiers changed from: 0000 */
    public boolean isDimmed(View view) {
        boolean z = false;
        if (view == null) {
            return false;
        }
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        if (this.mCanSlide && layoutParams.dimWhenOffset && this.mSlideOffset > 0.0f) {
            z = true;
        }
        return z;
    }

    public boolean isOpen() {
        return !this.mCanSlide || this.mSlideOffset == 1.0f;
    }

    public boolean isSlideable() {
        return this.mCanSlide;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mFirstLayout = true;
        int size = this.mPostedRunnables.size();
        for (int i = 0; i < size; i++) {
            ((DisableLayerRunnable) this.mPostedRunnables.get(i)).run();
        }
        this.mPostedRunnables.clear();
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int actionMasked = MotionEventCompat.getActionMasked(motionEvent);
        boolean z = true;
        if (!this.mCanSlide && actionMasked == 0 && getChildCount() > 1) {
            View childAt = getChildAt(1);
            if (childAt != null) {
                this.mPreservedOpenState = !this.mDragHelper.isViewUnder(childAt, (int) motionEvent.getX(), (int) motionEvent.getY());
            }
        }
        if (!this.mCanSlide || (this.mIsUnableToDrag && actionMasked != 0)) {
            this.mDragHelper.cancel();
            return super.onInterceptTouchEvent(motionEvent);
        } else if (actionMasked == 3 || actionMasked == 1) {
            this.mDragHelper.cancel();
            return false;
        } else {
            boolean z2 = false;
            if (actionMasked == 0) {
                this.mIsUnableToDrag = false;
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                this.mInitialMotionX = x;
                this.mInitialMotionY = y;
                if (this.mDragHelper.isViewUnder(this.mSlideableView, (int) x, (int) y) && isDimmed(this.mSlideableView)) {
                    z2 = true;
                }
            } else if (actionMasked == 2) {
                float x2 = motionEvent.getX();
                float y2 = motionEvent.getY();
                float abs = Math.abs(x2 - this.mInitialMotionX);
                float abs2 = Math.abs(y2 - this.mInitialMotionY);
                if (abs > ((float) this.mDragHelper.getTouchSlop()) && abs2 > abs) {
                    this.mDragHelper.cancel();
                    this.mIsUnableToDrag = true;
                    return false;
                }
            }
            if (!this.mDragHelper.shouldInterceptTouchEvent(motionEvent) && !z2) {
                z = false;
            }
            return z;
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int i5;
        int i6;
        int i7;
        boolean isLayoutRtlSupport = isLayoutRtlSupport();
        if (isLayoutRtlSupport) {
            this.mDragHelper.setEdgeTrackingEnabled(2);
        } else {
            this.mDragHelper.setEdgeTrackingEnabled(1);
        }
        int i8 = i3 - i;
        int paddingRight = isLayoutRtlSupport ? getPaddingRight() : getPaddingLeft();
        int paddingLeft = isLayoutRtlSupport ? getPaddingLeft() : getPaddingRight();
        int paddingTop = getPaddingTop();
        int childCount = getChildCount();
        int i9 = paddingRight;
        int i10 = i9;
        if (this.mFirstLayout) {
            float f = (!this.mCanSlide || !this.mPreservedOpenState) ? 0.0f : 1.0f;
            this.mSlideOffset = f;
        }
        int i11 = i9;
        int i12 = 0;
        while (i12 < childCount) {
            View childAt = getChildAt(i12);
            if (childAt.getVisibility() == 8) {
                i5 = paddingRight;
            } else {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                int measuredWidth = childAt.getMeasuredWidth();
                int i13 = 0;
                if (layoutParams.slideable) {
                    int i14 = layoutParams.leftMargin + layoutParams.rightMargin;
                    int min = (Math.min(i10, (i8 - paddingLeft) - this.mOverhangSize) - i11) - i14;
                    this.mSlideRange = min;
                    int i15 = isLayoutRtlSupport ? layoutParams.rightMargin : layoutParams.leftMargin;
                    i5 = paddingRight;
                    int i16 = i14;
                    layoutParams.dimWhenOffset = ((i11 + i15) + min) + (measuredWidth / 2) > i8 - paddingLeft;
                    int i17 = (int) (((float) min) * this.mSlideOffset);
                    i11 += i17 + i15;
                    int i18 = min;
                    this.mSlideOffset = ((float) i17) / ((float) this.mSlideRange);
                } else {
                    i5 = paddingRight;
                    if (!this.mCanSlide || this.mParallaxBy == 0) {
                        i11 = i10;
                    } else {
                        i11 = i10;
                        i13 = (int) ((1.0f - this.mSlideOffset) * ((float) this.mParallaxBy));
                    }
                }
                if (isLayoutRtlSupport) {
                    i7 = (i8 - i11) + i13;
                    i6 = i7 - measuredWidth;
                } else {
                    i6 = i11 - i13;
                    i7 = i6 + measuredWidth;
                }
                childAt.layout(i6, paddingTop, i7, paddingTop + childAt.getMeasuredHeight());
                i10 += childAt.getWidth();
            }
            i12++;
            paddingRight = i5;
        }
        int i19 = paddingRight;
        if (this.mFirstLayout) {
            if (this.mCanSlide) {
                if (this.mParallaxBy != 0) {
                    parallaxOtherViews(this.mSlideOffset);
                }
                if (((LayoutParams) this.mSlideableView.getLayoutParams()).dimWhenOffset) {
                    dimChildView(this.mSlideableView, this.mSlideOffset, this.mSliderFadeColor);
                }
            } else {
                for (int i20 = 0; i20 < childCount; i20++) {
                    dimChildView(getChildAt(i20), 0.0f, this.mSliderFadeColor);
                }
            }
            updateObscuredViewsVisibility(this.mSlideableView);
        }
        this.mFirstLayout = false;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:35:0x00bb, code lost:
        if (r14.width == 0) goto L_0x00ac;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int i10;
        int mode = MeasureSpec.getMode(i);
        int size = MeasureSpec.getSize(i);
        int mode2 = MeasureSpec.getMode(i2);
        int size2 = MeasureSpec.getSize(i2);
        if (mode != 1073741824) {
            if (!isInEditMode()) {
                throw new IllegalStateException("Width must have an exact value or MATCH_PARENT");
            } else if (mode == Integer.MIN_VALUE) {
                mode = 1073741824;
            } else if (mode == 0) {
                mode = 1073741824;
                size = 300;
            }
        } else if (mode2 == 0) {
            if (!isInEditMode()) {
                throw new IllegalStateException("Height must not be UNSPECIFIED");
            } else if (mode2 == 0) {
                mode2 = Integer.MIN_VALUE;
                size2 = 300;
            }
        }
        int i11 = 0;
        int i12 = -1;
        if (mode2 == Integer.MIN_VALUE) {
            i12 = (size2 - getPaddingTop()) - getPaddingBottom();
        } else if (mode2 == 1073741824) {
            int paddingTop = (size2 - getPaddingTop()) - getPaddingBottom();
            i12 = paddingTop;
            i11 = paddingTop;
        }
        float f = 0.0f;
        boolean z = false;
        int paddingLeft = (size - getPaddingLeft()) - getPaddingRight();
        int i13 = paddingLeft;
        int childCount = getChildCount();
        if (childCount > 2) {
            Log.e(TAG, "onMeasure: More than two child views are not supported.");
        }
        this.mSlideableView = null;
        int i14 = i13;
        int i15 = i11;
        int i16 = 0;
        while (true) {
            i3 = 8;
            if (i16 >= childCount) {
                break;
            }
            View childAt = getChildAt(i16);
            LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
            int i17 = mode;
            if (childAt.getVisibility() == 8) {
                layoutParams.dimWhenOffset = false;
            } else {
                if (layoutParams.weight > 0.0f) {
                    f += layoutParams.weight;
                }
                int i18 = layoutParams.leftMargin + layoutParams.rightMargin;
                i10 = size2;
                int i19 = layoutParams.width == -2 ? MeasureSpec.makeMeasureSpec(paddingLeft - i18, Integer.MIN_VALUE) : layoutParams.width == -1 ? MeasureSpec.makeMeasureSpec(paddingLeft - i18, 1073741824) : MeasureSpec.makeMeasureSpec(layoutParams.width, 1073741824);
                int i20 = i18;
                int i21 = layoutParams.height == -2 ? MeasureSpec.makeMeasureSpec(i12, Integer.MIN_VALUE) : layoutParams.height == -1 ? MeasureSpec.makeMeasureSpec(i12, 1073741824) : MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824);
                int i22 = i21;
                childAt.measure(i19, i22);
                int measuredWidth = childAt.getMeasuredWidth();
                int i23 = i22;
                int measuredHeight = childAt.getMeasuredHeight();
                int i24 = i19;
                if (mode2 == Integer.MIN_VALUE && measuredHeight > i15) {
                    i15 = Math.min(measuredHeight, i12);
                }
                i14 -= measuredWidth;
                boolean z2 = i14 < 0;
                layoutParams.slideable = z2;
                boolean z3 = z2 | z;
                if (layoutParams.slideable) {
                    this.mSlideableView = childAt;
                }
                z = z3;
                i16++;
                mode = i17;
                size2 = i10;
            }
            i10 = size2;
            i16++;
            mode = i17;
            size2 = i10;
        }
        int i25 = mode;
        int i26 = size2;
        if (z || f > 0.0f) {
            int i27 = paddingLeft - this.mOverhangSize;
            int i28 = 0;
            while (i28 < childCount) {
                View childAt2 = getChildAt(i28);
                if (childAt2.getVisibility() != i3) {
                    LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                    if (childAt2.getVisibility() != i3) {
                        boolean z4 = layoutParams2.width == 0 && layoutParams2.weight > 0.0f;
                        int measuredWidth2 = z4 ? 0 : childAt2.getMeasuredWidth();
                        if (!z || childAt2 == this.mSlideableView) {
                            i7 = mode2;
                            i6 = childCount;
                            boolean z5 = z4;
                            int i29 = measuredWidth2;
                            if (layoutParams2.weight > 0.0f) {
                                int i30 = layoutParams2.width == 0 ? layoutParams2.height == -2 ? MeasureSpec.makeMeasureSpec(i12, Integer.MIN_VALUE) : layoutParams2.height == -1 ? MeasureSpec.makeMeasureSpec(i12, 1073741824) : MeasureSpec.makeMeasureSpec(layoutParams2.height, 1073741824) : MeasureSpec.makeMeasureSpec(childAt2.getMeasuredHeight(), 1073741824);
                                if (z) {
                                    int i31 = paddingLeft - (layoutParams2.leftMargin + layoutParams2.rightMargin);
                                    i5 = i27;
                                    i4 = i12;
                                    int makeMeasureSpec = MeasureSpec.makeMeasureSpec(i31, 1073741824);
                                    if (i29 != i31) {
                                        childAt2.measure(makeMeasureSpec, i30);
                                    }
                                } else {
                                    i5 = i27;
                                    i4 = i12;
                                    childAt2.measure(MeasureSpec.makeMeasureSpec(i29 + ((int) ((layoutParams2.weight * ((float) Math.max(0, i14))) / f)), 1073741824), i30);
                                }
                            } else {
                                i5 = i27;
                                i4 = i12;
                            }
                            i28++;
                            mode2 = i7;
                            childCount = i6;
                            i27 = i5;
                            i12 = i4;
                            i3 = 8;
                        } else if (layoutParams2.width < 0) {
                            if (measuredWidth2 <= i27) {
                                i7 = mode2;
                                if (layoutParams2.weight <= 0.0f) {
                                    i5 = i27;
                                    i4 = i12;
                                    i6 = childCount;
                                    i28++;
                                    mode2 = i7;
                                    childCount = i6;
                                    i27 = i5;
                                    i12 = i4;
                                    i3 = 8;
                                }
                            } else {
                                i7 = mode2;
                            }
                            if (z4) {
                                i6 = childCount;
                                if (layoutParams2.height == -2) {
                                    i8 = MeasureSpec.makeMeasureSpec(i12, Integer.MIN_VALUE);
                                    i9 = 1073741824;
                                } else if (layoutParams2.height == -1) {
                                    i9 = 1073741824;
                                    i8 = MeasureSpec.makeMeasureSpec(i12, 1073741824);
                                } else {
                                    i9 = 1073741824;
                                    i8 = MeasureSpec.makeMeasureSpec(layoutParams2.height, 1073741824);
                                }
                            } else {
                                i6 = childCount;
                                i9 = 1073741824;
                                i8 = MeasureSpec.makeMeasureSpec(childAt2.getMeasuredHeight(), 1073741824);
                            }
                            boolean z6 = z4;
                            childAt2.measure(MeasureSpec.makeMeasureSpec(i27, i9), i8);
                            i5 = i27;
                            i4 = i12;
                            i28++;
                            mode2 = i7;
                            childCount = i6;
                            i27 = i5;
                            i12 = i4;
                            i3 = 8;
                        } else {
                            i7 = mode2;
                            i6 = childCount;
                            i5 = i27;
                            i4 = i12;
                            i28++;
                            mode2 = i7;
                            childCount = i6;
                            i27 = i5;
                            i12 = i4;
                            i3 = 8;
                        }
                    }
                }
                i5 = i27;
                i7 = mode2;
                i4 = i12;
                i6 = childCount;
                i28++;
                mode2 = i7;
                childCount = i6;
                i27 = i5;
                i12 = i4;
                i3 = 8;
            }
            int i32 = mode2;
            int i33 = i12;
            int i34 = childCount;
        } else {
            int i35 = mode2;
            int i36 = i12;
            int i37 = childCount;
        }
        setMeasuredDimension(size, getPaddingTop() + i15 + getPaddingBottom());
        this.mCanSlide = z;
        if (this.mDragHelper.getViewDragState() != 0 && !z) {
            this.mDragHelper.abort();
        }
    }

    /* access modifiers changed from: protected */
    public void onRestoreInstanceState(Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (savedState.isOpen) {
            openPane();
        } else {
            closePane();
        }
        this.mPreservedOpenState = savedState.isOpen;
    }

    /* access modifiers changed from: protected */
    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.isOpen = isSlideable() ? isOpen() : this.mPreservedOpenState;
        return savedState;
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            this.mFirstLayout = true;
        }
    }

    public boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.mCanSlide) {
            return super.onTouchEvent(motionEvent);
        }
        this.mDragHelper.processTouchEvent(motionEvent);
        switch (motionEvent.getAction() & 255) {
            case 0:
                float x = motionEvent.getX();
                float y = motionEvent.getY();
                this.mInitialMotionX = x;
                this.mInitialMotionY = y;
                break;
            case 1:
                if (isDimmed(this.mSlideableView)) {
                    float x2 = motionEvent.getX();
                    float y2 = motionEvent.getY();
                    float f = x2 - this.mInitialMotionX;
                    float f2 = y2 - this.mInitialMotionY;
                    int touchSlop = this.mDragHelper.getTouchSlop();
                    if ((f * f) + (f2 * f2) < ((float) (touchSlop * touchSlop)) && this.mDragHelper.isViewUnder(this.mSlideableView, (int) x2, (int) y2)) {
                        closePane(this.mSlideableView, 0);
                        break;
                    }
                }
                break;
        }
        return true;
    }

    public boolean openPane() {
        return openPane(this.mSlideableView, 0);
    }

    public void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        if (!isInTouchMode() && !this.mCanSlide) {
            this.mPreservedOpenState = view == this.mSlideableView;
        }
    }

    /* access modifiers changed from: 0000 */
    public void setAllChildrenVisible() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 4) {
                childAt.setVisibility(0);
            }
        }
    }

    public void setCoveredFadeColor(@ColorInt int i) {
        this.mCoveredFadeColor = i;
    }

    public void setPanelSlideListener(PanelSlideListener panelSlideListener) {
        this.mPanelSlideListener = panelSlideListener;
    }

    public void setParallaxDistance(int i) {
        this.mParallaxBy = i;
        requestLayout();
    }

    @Deprecated
    public void setShadowDrawable(Drawable drawable) {
        setShadowDrawableLeft(drawable);
    }

    public void setShadowDrawableLeft(Drawable drawable) {
        this.mShadowDrawableLeft = drawable;
    }

    public void setShadowDrawableRight(Drawable drawable) {
        this.mShadowDrawableRight = drawable;
    }

    @Deprecated
    public void setShadowResource(@DrawableRes int i) {
        setShadowDrawable(getResources().getDrawable(i));
    }

    public void setShadowResourceLeft(int i) {
        setShadowDrawableLeft(getResources().getDrawable(i));
    }

    public void setShadowResourceRight(int i) {
        setShadowDrawableRight(getResources().getDrawable(i));
    }

    public void setSliderFadeColor(@ColorInt int i) {
        this.mSliderFadeColor = i;
    }

    @Deprecated
    public void smoothSlideClosed() {
        closePane();
    }

    @Deprecated
    public void smoothSlideOpen() {
        openPane();
    }

    /* access modifiers changed from: 0000 */
    public boolean smoothSlideTo(float f, int i) {
        int i2;
        if (!this.mCanSlide) {
            return false;
        }
        LayoutParams layoutParams = (LayoutParams) this.mSlideableView.getLayoutParams();
        if (isLayoutRtlSupport()) {
            i2 = (int) (((float) getWidth()) - ((((float) (getPaddingRight() + layoutParams.rightMargin)) + (((float) this.mSlideRange) * f)) + ((float) this.mSlideableView.getWidth())));
        } else {
            i2 = (int) (((float) (getPaddingLeft() + layoutParams.leftMargin)) + (((float) this.mSlideRange) * f));
        }
        if (!this.mDragHelper.smoothSlideViewTo(this.mSlideableView, i2, this.mSlideableView.getTop())) {
            return false;
        }
        setAllChildrenVisible();
        ViewCompat.postInvalidateOnAnimation(this);
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void updateObscuredViewsVisibility(View view) {
        int i;
        int i2;
        int i3;
        int i4;
        View view2 = view;
        boolean isLayoutRtlSupport = isLayoutRtlSupport();
        int width = isLayoutRtlSupport ? getWidth() - getPaddingRight() : getPaddingLeft();
        int paddingLeft = isLayoutRtlSupport ? getPaddingLeft() : getWidth() - getPaddingRight();
        int paddingTop = getPaddingTop();
        int height = getHeight() - getPaddingBottom();
        if (view2 == null || !viewIsOpaque(view)) {
            i = 0;
            i2 = 0;
            i3 = 0;
            i4 = 0;
        } else {
            i4 = view.getLeft();
            i3 = view.getRight();
            i2 = view.getTop();
            i = view.getBottom();
        }
        int i5 = 0;
        int childCount = getChildCount();
        while (i5 < childCount) {
            View childAt = getChildAt(i5);
            if (childAt == view2) {
                boolean z = isLayoutRtlSupport;
                return;
            }
            int max = Math.max(isLayoutRtlSupport ? paddingLeft : width, childAt.getLeft());
            int max2 = Math.max(paddingTop, childAt.getTop());
            boolean z2 = isLayoutRtlSupport;
            int min = Math.min(isLayoutRtlSupport ? width : paddingLeft, childAt.getRight());
            int i6 = (max < i4 || max2 < i2 || min > i3 || Math.min(height, childAt.getBottom()) > i) ? 0 : 4;
            int i7 = min;
            childAt.setVisibility(i6);
            i5++;
            isLayoutRtlSupport = z2;
            view2 = view;
        }
        boolean z3 = isLayoutRtlSupport;
    }
}
