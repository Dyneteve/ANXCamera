package android.support.v4.view;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.content.res.TypedArray;
import android.database.DataSetObserver;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.os.SystemClock;
import android.support.annotation.CallSuper;
import android.support.annotation.DrawableRes;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.AttributeSet;
import android.util.Log;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SoundEffectConstants;
import android.view.VelocityTracker;
import android.view.View;
import android.view.View.BaseSavedState;
import android.view.View.MeasureSpec;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.Interpolator;
import android.widget.Scroller;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class ViewPager extends ViewGroup {
    private static final int CLOSE_ENOUGH = 2;
    private static final Comparator<ItemInfo> COMPARATOR = new Comparator<ItemInfo>() {
        public int compare(ItemInfo itemInfo, ItemInfo itemInfo2) {
            return itemInfo.position - itemInfo2.position;
        }
    };
    private static final boolean DEBUG = false;
    private static final int DEFAULT_GUTTER_SIZE = 16;
    private static final int DEFAULT_OFFSCREEN_PAGES = 1;
    private static final int DRAW_ORDER_DEFAULT = 0;
    private static final int DRAW_ORDER_FORWARD = 1;
    private static final int DRAW_ORDER_REVERSE = 2;
    private static final int INVALID_POINTER = -1;
    /* access modifiers changed from: private */
    public static final int[] LAYOUT_ATTRS = {16842931};
    private static final int MAX_SETTLE_DURATION = 600;
    private static final int MIN_DISTANCE_FOR_FLING = 25;
    private static final int MIN_FLING_VELOCITY = 400;
    public static final int SCROLL_STATE_DRAGGING = 1;
    public static final int SCROLL_STATE_IDLE = 0;
    public static final int SCROLL_STATE_SETTLING = 2;
    private static final String TAG = "ViewPager";
    private static final boolean USE_CACHE = false;
    private static final Interpolator sInterpolator = new Interpolator() {
        public float getInterpolation(float f) {
            float f2 = f - 1.0f;
            return (f2 * f2 * f2 * f2 * f2) + 1.0f;
        }
    };
    private static final ViewPositionComparator sPositionComparator = new ViewPositionComparator();
    private int mActivePointerId = -1;
    /* access modifiers changed from: private */
    public PagerAdapter mAdapter;
    private OnAdapterChangeListener mAdapterChangeListener;
    private int mBottomPageBounds;
    private boolean mCalledSuper;
    private int mChildHeightMeasureSpec;
    private int mChildWidthMeasureSpec;
    private int mCloseEnough;
    /* access modifiers changed from: private */
    public int mCurItem;
    private int mDecorChildCount;
    private int mDefaultGutterSize;
    private int mDrawingOrder;
    private ArrayList<View> mDrawingOrderedChildren;
    private final Runnable mEndScrollRunnable = new Runnable() {
        public void run() {
            ViewPager.this.setScrollState(0);
            ViewPager.this.populate();
        }
    };
    private int mExpectedAdapterCount;
    private long mFakeDragBeginTime;
    private boolean mFakeDragging;
    private boolean mFirstLayout = true;
    private float mFirstOffset = -3.4028235E38f;
    private int mFlingDistance;
    private int mGutterSize;
    private boolean mInLayout;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private OnPageChangeListener mInternalPageChangeListener;
    private boolean mIsBeingDragged;
    private boolean mIsUnableToDrag;
    private final ArrayList<ItemInfo> mItems = new ArrayList<>();
    private float mLastMotionX;
    private float mLastMotionY;
    private float mLastOffset = Float.MAX_VALUE;
    private EdgeEffectCompat mLeftEdge;
    private Drawable mMarginDrawable;
    private int mMaximumVelocity;
    private int mMinimumVelocity;
    private boolean mNeedCalculatePageOffsets = false;
    private PagerObserver mObserver;
    private int mOffscreenPageLimit = 1;
    private OnPageChangeListener mOnPageChangeListener;
    private List<OnPageChangeListener> mOnPageChangeListeners;
    private int mPageMargin;
    private PageTransformer mPageTransformer;
    private boolean mPopulatePending;
    private Parcelable mRestoredAdapterState = null;
    private ClassLoader mRestoredClassLoader = null;
    private int mRestoredCurItem = -1;
    private EdgeEffectCompat mRightEdge;
    private int mScrollState = 0;
    private Scroller mScroller;
    private boolean mScrollingCacheEnabled;
    private Method mSetChildrenDrawingOrderEnabled;
    private final ItemInfo mTempItem = new ItemInfo();
    private final Rect mTempRect = new Rect();
    private int mTopPageBounds;
    private int mTouchSlop;
    private VelocityTracker mVelocityTracker;

    interface Decor {
    }

    static class ItemInfo {
        Object object;
        float offset;
        int position;
        boolean scrolling;
        float widthFactor;

        ItemInfo() {
        }
    }

    public static class LayoutParams extends android.view.ViewGroup.LayoutParams {
        int childIndex;
        public int gravity;
        public boolean isDecor;
        boolean needsMeasure;
        int position;
        float widthFactor = 0.0f;

        public LayoutParams() {
            super(-1, -1);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
            TypedArray obtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ViewPager.LAYOUT_ATTRS);
            this.gravity = obtainStyledAttributes.getInteger(0, 48);
            obtainStyledAttributes.recycle();
        }
    }

    class MyAccessibilityDelegate extends AccessibilityDelegateCompat {
        MyAccessibilityDelegate() {
        }

        private boolean canScroll() {
            return ViewPager.this.mAdapter != null && ViewPager.this.mAdapter.getCount() > 1;
        }

        public void onInitializeAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
            super.onInitializeAccessibilityEvent(view, accessibilityEvent);
            accessibilityEvent.setClassName(ViewPager.class.getName());
            AccessibilityRecordCompat obtain = AccessibilityRecordCompat.obtain();
            obtain.setScrollable(canScroll());
            if (accessibilityEvent.getEventType() == 4096 && ViewPager.this.mAdapter != null) {
                obtain.setItemCount(ViewPager.this.mAdapter.getCount());
                obtain.setFromIndex(ViewPager.this.mCurItem);
                obtain.setToIndex(ViewPager.this.mCurItem);
            }
        }

        public void onInitializeAccessibilityNodeInfo(View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
            super.onInitializeAccessibilityNodeInfo(view, accessibilityNodeInfoCompat);
            accessibilityNodeInfoCompat.setClassName(ViewPager.class.getName());
            accessibilityNodeInfoCompat.setScrollable(canScroll());
            if (ViewPager.this.canScrollHorizontally(1)) {
                accessibilityNodeInfoCompat.addAction(4096);
            }
            if (ViewPager.this.canScrollHorizontally(-1)) {
                accessibilityNodeInfoCompat.addAction(8192);
            }
        }

        public boolean performAccessibilityAction(View view, int i, Bundle bundle) {
            if (super.performAccessibilityAction(view, i, bundle)) {
                return true;
            }
            if (i != 4096) {
                if (i != 8192 || !ViewPager.this.canScrollHorizontally(-1)) {
                    return false;
                }
                ViewPager.this.setCurrentItem(ViewPager.this.mCurItem - 1);
                return true;
            } else if (!ViewPager.this.canScrollHorizontally(1)) {
                return false;
            } else {
                ViewPager.this.setCurrentItem(ViewPager.this.mCurItem + 1);
                return true;
            }
        }
    }

    interface OnAdapterChangeListener {
        void onAdapterChanged(PagerAdapter pagerAdapter, PagerAdapter pagerAdapter2);
    }

    public interface OnPageChangeListener {
        void onPageScrollStateChanged(int i);

        void onPageScrolled(int i, float f, int i2);

        void onPageSelected(int i);
    }

    public interface PageTransformer {
        void transformPage(View view, float f);
    }

    private class PagerObserver extends DataSetObserver {
        private PagerObserver() {
        }

        public void onChanged() {
            ViewPager.this.dataSetChanged();
        }

        public void onInvalidated() {
            ViewPager.this.dataSetChanged();
        }
    }

    public static class SavedState extends BaseSavedState {
        public static final Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks<SavedState>() {
            public SavedState createFromParcel(Parcel parcel, ClassLoader classLoader) {
                return new SavedState(parcel, classLoader);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        });
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel);
            if (classLoader == null) {
                classLoader = getClass().getClassLoader();
            }
            this.position = parcel.readInt();
            this.adapterState = parcel.readParcelable(classLoader);
            this.loader = classLoader;
        }

        public SavedState(Parcelable parcelable) {
            super(parcelable);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("FragmentPager.SavedState{");
            sb.append(Integer.toHexString(System.identityHashCode(this)));
            sb.append(" position=");
            sb.append(this.position);
            sb.append("}");
            return sb.toString();
        }

        public void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i);
            parcel.writeInt(this.position);
            parcel.writeParcelable(this.adapterState, i);
        }
    }

    public static class SimpleOnPageChangeListener implements OnPageChangeListener {
        public void onPageScrollStateChanged(int i) {
        }

        public void onPageScrolled(int i, float f, int i2) {
        }

        public void onPageSelected(int i) {
        }
    }

    static class ViewPositionComparator implements Comparator<View> {
        ViewPositionComparator() {
        }

        public int compare(View view, View view2) {
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            LayoutParams layoutParams2 = (LayoutParams) view2.getLayoutParams();
            if (layoutParams.isDecor == layoutParams2.isDecor) {
                return layoutParams.position - layoutParams2.position;
            }
            return layoutParams.isDecor ? 1 : -1;
        }
    }

    public ViewPager(Context context) {
        super(context);
        initViewPager();
    }

    public ViewPager(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initViewPager();
    }

    private void calculatePageOffsets(ItemInfo itemInfo, int i, ItemInfo itemInfo2) {
        ItemInfo itemInfo3;
        ItemInfo itemInfo4;
        int count = this.mAdapter.getCount();
        int clientWidth = getClientWidth();
        float f = clientWidth > 0 ? ((float) this.mPageMargin) / ((float) clientWidth) : 0.0f;
        if (itemInfo2 != null) {
            int i2 = itemInfo2.position;
            if (i2 < itemInfo.position) {
                int i3 = 0;
                float f2 = itemInfo2.offset + itemInfo2.widthFactor + f;
                int i4 = i2 + 1;
                while (i4 <= itemInfo.position && i3 < this.mItems.size()) {
                    Object obj = this.mItems.get(i3);
                    while (true) {
                        itemInfo4 = (ItemInfo) obj;
                        if (i4 > itemInfo4.position && i3 < this.mItems.size() - 1) {
                            i3++;
                            obj = this.mItems.get(i3);
                        }
                    }
                    while (i4 < itemInfo4.position) {
                        f2 += this.mAdapter.getPageWidth(i4) + f;
                        i4++;
                    }
                    itemInfo4.offset = f2;
                    f2 += itemInfo4.widthFactor + f;
                    i4++;
                }
            } else if (i2 > itemInfo.position) {
                int size = this.mItems.size() - 1;
                float f3 = itemInfo2.offset;
                int i5 = i2 - 1;
                while (i5 >= itemInfo.position && size >= 0) {
                    Object obj2 = this.mItems.get(size);
                    while (true) {
                        itemInfo3 = (ItemInfo) obj2;
                        if (i5 < itemInfo3.position && size > 0) {
                            size--;
                            obj2 = this.mItems.get(size);
                        }
                    }
                    while (i5 > itemInfo3.position) {
                        f3 -= this.mAdapter.getPageWidth(i5) + f;
                        i5--;
                    }
                    f3 -= itemInfo3.widthFactor + f;
                    itemInfo3.offset = f3;
                    i5--;
                }
            }
        }
        int size2 = this.mItems.size();
        float f4 = itemInfo.offset;
        int i6 = itemInfo.position - 1;
        this.mFirstOffset = itemInfo.position == 0 ? itemInfo.offset : -3.4028235E38f;
        this.mLastOffset = itemInfo.position == count + -1 ? (itemInfo.offset + itemInfo.widthFactor) - 1.0f : Float.MAX_VALUE;
        int i7 = i - 1;
        while (i7 >= 0) {
            ItemInfo itemInfo5 = (ItemInfo) this.mItems.get(i7);
            while (i6 > itemInfo5.position) {
                f4 -= this.mAdapter.getPageWidth(i6) + f;
                i6--;
            }
            f4 -= itemInfo5.widthFactor + f;
            itemInfo5.offset = f4;
            if (itemInfo5.position == 0) {
                this.mFirstOffset = f4;
            }
            i7--;
            i6--;
        }
        float f5 = itemInfo.offset + itemInfo.widthFactor + f;
        int i8 = itemInfo.position + 1;
        int i9 = i + 1;
        while (i9 < size2) {
            ItemInfo itemInfo6 = (ItemInfo) this.mItems.get(i9);
            while (i8 < itemInfo6.position) {
                f5 += this.mAdapter.getPageWidth(i8) + f;
                i8++;
            }
            if (itemInfo6.position == count - 1) {
                this.mLastOffset = (itemInfo6.widthFactor + f5) - 1.0f;
            }
            itemInfo6.offset = f5;
            f5 += itemInfo6.widthFactor + f;
            i9++;
            i8++;
        }
        this.mNeedCalculatePageOffsets = false;
    }

    private void completeScroll(boolean z) {
        boolean z2 = this.mScrollState == 2;
        if (z2) {
            setScrollingCacheEnabled(false);
            this.mScroller.abortAnimation();
            int scrollX = getScrollX();
            int scrollY = getScrollY();
            int currX = this.mScroller.getCurrX();
            int currY = this.mScroller.getCurrY();
            if (!(scrollX == currX && scrollY == currY)) {
                scrollTo(currX, currY);
                if (currX != scrollX) {
                    pageScrolled(currX);
                }
            }
        }
        this.mPopulatePending = false;
        boolean z3 = z2;
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i);
            if (itemInfo.scrolling) {
                z3 = true;
                itemInfo.scrolling = false;
            }
        }
        if (!z3) {
            return;
        }
        if (z) {
            ViewCompat.postOnAnimation(this, this.mEndScrollRunnable);
        } else {
            this.mEndScrollRunnable.run();
        }
    }

    private int determineTargetPage(int i, float f, int i2, int i3) {
        int i4;
        if (Math.abs(i3) <= this.mFlingDistance || Math.abs(i2) <= this.mMinimumVelocity) {
            i4 = (int) (((float) i) + f + (i >= this.mCurItem ? 0.4f : 0.6f));
        } else {
            i4 = i2 > 0 ? i : i + 1;
        }
        if (this.mItems.size() <= 0) {
            return i4;
        }
        return Math.max(((ItemInfo) this.mItems.get(0)).position, Math.min(i4, ((ItemInfo) this.mItems.get(this.mItems.size() - 1)).position));
    }

    private void dispatchOnPageScrolled(int i, float f, int i2) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrolled(i, f, i2);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i3 = 0; i3 < size; i3++) {
                OnPageChangeListener onPageChangeListener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i3);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageScrolled(i, f, i2);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrolled(i, f, i2);
        }
    }

    private void dispatchOnPageSelected(int i) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageSelected(i);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i2 = 0; i2 < size; i2++) {
                OnPageChangeListener onPageChangeListener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i2);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageSelected(i);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageSelected(i);
        }
    }

    private void dispatchOnScrollStateChanged(int i) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrollStateChanged(i);
        }
        if (this.mOnPageChangeListeners != null) {
            int size = this.mOnPageChangeListeners.size();
            for (int i2 = 0; i2 < size; i2++) {
                OnPageChangeListener onPageChangeListener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i2);
                if (onPageChangeListener != null) {
                    onPageChangeListener.onPageScrollStateChanged(i);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrollStateChanged(i);
        }
    }

    private void enableLayers(boolean z) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            ViewCompat.setLayerType(getChildAt(i), z ? 2 : 0, null);
        }
    }

    private void endDrag() {
        this.mIsBeingDragged = false;
        this.mIsUnableToDrag = false;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    private Rect getChildRectInPagerCoordinates(Rect rect, View view) {
        if (rect == null) {
            rect = new Rect();
        }
        if (view == null) {
            rect.set(0, 0, 0, 0);
            return rect;
        }
        rect.left = view.getLeft();
        rect.right = view.getRight();
        rect.top = view.getTop();
        rect.bottom = view.getBottom();
        ViewParent parent = view.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup viewGroup = (ViewGroup) parent;
            rect.left += viewGroup.getLeft();
            rect.right += viewGroup.getRight();
            rect.top += viewGroup.getTop();
            rect.bottom += viewGroup.getBottom();
            parent = viewGroup.getParent();
        }
        return rect;
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    private ItemInfo infoForCurrentScrollPosition() {
        int clientWidth = getClientWidth();
        float f = 0.0f;
        float scrollX = clientWidth > 0 ? ((float) getScrollX()) / ((float) clientWidth) : 0.0f;
        if (clientWidth > 0) {
            f = ((float) this.mPageMargin) / ((float) clientWidth);
        }
        int i = -1;
        float f2 = 0.0f;
        float f3 = 0.0f;
        boolean z = true;
        ItemInfo itemInfo = null;
        int i2 = 0;
        while (i2 < this.mItems.size()) {
            ItemInfo itemInfo2 = (ItemInfo) this.mItems.get(i2);
            if (!z && itemInfo2.position != i + 1) {
                itemInfo2 = this.mTempItem;
                itemInfo2.offset = f2 + f3 + f;
                itemInfo2.position = i + 1;
                itemInfo2.widthFactor = this.mAdapter.getPageWidth(itemInfo2.position);
                i2--;
            }
            float f4 = itemInfo2.offset;
            float f5 = f4;
            float f6 = itemInfo2.widthFactor + f4 + f;
            if (!z && scrollX < f5) {
                return itemInfo;
            }
            if (scrollX < f6 || i2 == this.mItems.size() - 1) {
                return itemInfo2;
            }
            z = false;
            i = itemInfo2.position;
            f2 = f4;
            f3 = itemInfo2.widthFactor;
            itemInfo = itemInfo2;
            i2++;
        }
        return itemInfo;
    }

    private boolean isGutterDrag(float f, float f2) {
        return (f < ((float) this.mGutterSize) && f2 > 0.0f) || (f > ((float) (getWidth() - this.mGutterSize)) && f2 < 0.0f);
    }

    private void onSecondaryPointerUp(MotionEvent motionEvent) {
        int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
        if (MotionEventCompat.getPointerId(motionEvent, actionIndex) == this.mActivePointerId) {
            int i = actionIndex == 0 ? 1 : 0;
            this.mLastMotionX = MotionEventCompat.getX(motionEvent, i);
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, i);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
        }
    }

    private boolean pageScrolled(int i) {
        if (this.mItems.size() == 0) {
            this.mCalledSuper = false;
            onPageScrolled(0, 0.0f, 0);
            if (this.mCalledSuper) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
        int clientWidth = getClientWidth();
        int i2 = this.mPageMargin + clientWidth;
        float f = ((float) this.mPageMargin) / ((float) clientWidth);
        int i3 = infoForCurrentScrollPosition.position;
        float f2 = ((((float) i) / ((float) clientWidth)) - infoForCurrentScrollPosition.offset) / (infoForCurrentScrollPosition.widthFactor + f);
        int i4 = (int) (((float) i2) * f2);
        this.mCalledSuper = false;
        onPageScrolled(i3, f2, i4);
        if (this.mCalledSuper) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    private boolean performDrag(float f) {
        float f2 = f;
        boolean z = false;
        float f3 = this.mLastMotionX - f2;
        this.mLastMotionX = f2;
        float scrollX = ((float) getScrollX()) + f3;
        int clientWidth = getClientWidth();
        float f4 = ((float) clientWidth) * this.mFirstOffset;
        float f5 = ((float) clientWidth) * this.mLastOffset;
        boolean z2 = true;
        boolean z3 = true;
        ItemInfo itemInfo = (ItemInfo) this.mItems.get(0);
        ItemInfo itemInfo2 = (ItemInfo) this.mItems.get(this.mItems.size() - 1);
        if (itemInfo.position != 0) {
            z2 = false;
            f4 = itemInfo.offset * ((float) clientWidth);
        }
        if (itemInfo2.position != this.mAdapter.getCount() - 1) {
            z3 = false;
            f5 = itemInfo2.offset * ((float) clientWidth);
        }
        if (scrollX < f4) {
            if (z2) {
                z = this.mLeftEdge.onPull(Math.abs(f4 - scrollX) / ((float) clientWidth));
            }
            scrollX = f4;
        } else if (scrollX > f5) {
            if (z3) {
                z = this.mRightEdge.onPull(Math.abs(scrollX - f5) / ((float) clientWidth));
            }
            scrollX = f5;
        }
        this.mLastMotionX += scrollX - ((float) ((int) scrollX));
        scrollTo((int) scrollX, getScrollY());
        pageScrolled((int) scrollX);
        return z;
    }

    private void recomputeScrollPosition(int i, int i2, int i3, int i4) {
        int i5 = i;
        if (i2 <= 0 || this.mItems.isEmpty()) {
            ItemInfo infoForPosition = infoForPosition(this.mCurItem);
            int paddingLeft = (int) (((float) ((i5 - getPaddingLeft()) - getPaddingRight())) * (infoForPosition != null ? Math.min(infoForPosition.offset, this.mLastOffset) : 0.0f));
            if (paddingLeft != getScrollX()) {
                completeScroll(false);
                scrollTo(paddingLeft, getScrollY());
                return;
            }
            return;
        }
        int paddingLeft2 = (int) (((float) (((i5 - getPaddingLeft()) - getPaddingRight()) + i3)) * (((float) getScrollX()) / ((float) (((i2 - getPaddingLeft()) - getPaddingRight()) + i4))));
        scrollTo(paddingLeft2, getScrollY());
        if (!this.mScroller.isFinished()) {
            int duration = this.mScroller.getDuration() - this.mScroller.timePassed();
            ItemInfo infoForPosition2 = infoForPosition(this.mCurItem);
            ItemInfo itemInfo = infoForPosition2;
            this.mScroller.startScroll(paddingLeft2, 0, (int) (infoForPosition2.offset * ((float) i5)), 0, duration);
        }
    }

    private void removeNonDecorViews() {
        int i = 0;
        while (i < getChildCount()) {
            if (!((LayoutParams) getChildAt(i).getLayoutParams()).isDecor) {
                removeViewAt(i);
                i--;
            }
            i++;
        }
    }

    private void requestParentDisallowInterceptTouchEvent(boolean z) {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(z);
        }
    }

    private void scrollToItem(int i, boolean z, int i2, boolean z2) {
        ItemInfo infoForPosition = infoForPosition(i);
        int i3 = 0;
        if (infoForPosition != null) {
            i3 = (int) (((float) getClientWidth()) * Math.max(this.mFirstOffset, Math.min(infoForPosition.offset, this.mLastOffset)));
        }
        if (z) {
            smoothScrollTo(i3, 0, i2);
            if (z2) {
                dispatchOnPageSelected(i);
                return;
            }
            return;
        }
        if (z2) {
            dispatchOnPageSelected(i);
        }
        completeScroll(false);
        scrollTo(i3, 0);
        pageScrolled(i3);
    }

    /* access modifiers changed from: private */
    public void setScrollState(int i) {
        if (this.mScrollState != i) {
            this.mScrollState = i;
            if (this.mPageTransformer != null) {
                enableLayers(i != 0);
            }
            dispatchOnScrollStateChanged(i);
        }
    }

    private void setScrollingCacheEnabled(boolean z) {
        if (this.mScrollingCacheEnabled != z) {
            this.mScrollingCacheEnabled = z;
        }
    }

    private void sortChildDrawingOrder() {
        if (this.mDrawingOrder != 0) {
            if (this.mDrawingOrderedChildren == null) {
                this.mDrawingOrderedChildren = new ArrayList<>();
            } else {
                this.mDrawingOrderedChildren.clear();
            }
            int childCount = getChildCount();
            for (int i = 0; i < childCount; i++) {
                this.mDrawingOrderedChildren.add(getChildAt(i));
            }
            Collections.sort(this.mDrawingOrderedChildren, sPositionComparator);
        }
    }

    public void addFocusables(ArrayList<View> arrayList, int i, int i2) {
        int size = arrayList.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i3 = 0; i3 < getChildCount(); i3++) {
                View childAt = getChildAt(i3);
                if (childAt.getVisibility() == 0) {
                    ItemInfo infoForChild = infoForChild(childAt);
                    if (infoForChild != null && infoForChild.position == this.mCurItem) {
                        childAt.addFocusables(arrayList, i, i2);
                    }
                }
            }
        }
        if ((descendantFocusability == 262144 && size != arrayList.size()) || !isFocusable()) {
            return;
        }
        if (((i2 & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) && arrayList != null) {
            arrayList.add(this);
        }
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo addNewItem(int i, int i2) {
        ItemInfo itemInfo = new ItemInfo();
        itemInfo.position = i;
        itemInfo.object = this.mAdapter.instantiateItem((ViewGroup) this, i);
        itemInfo.widthFactor = this.mAdapter.getPageWidth(i);
        if (i2 < 0 || i2 >= this.mItems.size()) {
            this.mItems.add(itemInfo);
        } else {
            this.mItems.add(i2, itemInfo);
        }
        return itemInfo;
    }

    public void addOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        if (this.mOnPageChangeListeners == null) {
            this.mOnPageChangeListeners = new ArrayList();
        }
        this.mOnPageChangeListeners.add(onPageChangeListener);
    }

    public void addTouchables(ArrayList<View> arrayList) {
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem) {
                    childAt.addTouchables(arrayList);
                }
            }
        }
    }

    public void addView(View view, int i, android.view.ViewGroup.LayoutParams layoutParams) {
        if (!checkLayoutParams(layoutParams)) {
            layoutParams = generateLayoutParams(layoutParams);
        }
        LayoutParams layoutParams2 = (LayoutParams) layoutParams;
        layoutParams2.isDecor |= view instanceof Decor;
        if (!this.mInLayout) {
            super.addView(view, i, layoutParams);
        } else if (layoutParams2 == null || !layoutParams2.isDecor) {
            layoutParams2.needsMeasure = true;
            addViewInLayout(view, i, layoutParams);
        } else {
            throw new IllegalStateException("Cannot add pager decor view during layout");
        }
    }

    public boolean arrowScroll(int i) {
        View findFocus = findFocus();
        if (findFocus == this) {
            findFocus = null;
        } else if (findFocus != null) {
            boolean z = false;
            ViewParent parent = findFocus.getParent();
            while (true) {
                if (!(parent instanceof ViewGroup)) {
                    break;
                } else if (parent == this) {
                    z = true;
                    break;
                } else {
                    parent = parent.getParent();
                }
            }
            if (!z) {
                StringBuilder sb = new StringBuilder();
                sb.append(findFocus.getClass().getSimpleName());
                for (ViewParent parent2 = findFocus.getParent(); parent2 instanceof ViewGroup; parent2 = parent2.getParent()) {
                    sb.append(" => ");
                    sb.append(parent2.getClass().getSimpleName());
                }
                String str = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("arrowScroll tried to find focus based on non-child current focused view ");
                sb2.append(sb.toString());
                Log.e(str, sb2.toString());
                findFocus = null;
            }
        }
        boolean z2 = false;
        View findNextFocus = FocusFinder.getInstance().findNextFocus(this, findFocus, i);
        if (findNextFocus == null || findNextFocus == findFocus) {
            if (i == 17 || i == 1) {
                z2 = pageLeft();
            } else if (i == 66 || i == 2) {
                z2 = pageRight();
            }
        } else if (i == 17) {
            z2 = (findFocus == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left < getChildRectInPagerCoordinates(this.mTempRect, findFocus).left) ? findNextFocus.requestFocus() : pageLeft();
        } else if (i == 66) {
            z2 = (findFocus == null || getChildRectInPagerCoordinates(this.mTempRect, findNextFocus).left > getChildRectInPagerCoordinates(this.mTempRect, findFocus).left) ? findNextFocus.requestFocus() : pageRight();
        }
        if (z2) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(i));
        }
        return z2;
    }

    public boolean beginFakeDrag() {
        if (this.mIsBeingDragged) {
            return false;
        }
        this.mFakeDragging = true;
        setScrollState(1);
        this.mLastMotionX = 0.0f;
        this.mInitialMotionX = 0.0f;
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        } else {
            this.mVelocityTracker.clear();
        }
        long uptimeMillis = SystemClock.uptimeMillis();
        MotionEvent obtain = MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, 0.0f, 0.0f, 0);
        this.mVelocityTracker.addMovement(obtain);
        obtain.recycle();
        this.mFakeDragBeginTime = uptimeMillis;
        return true;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0065, code lost:
        if (android.support.v4.view.ViewCompat.canScrollHorizontally(r0, -r17) != false) goto L_0x006b;
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

    public boolean canScrollHorizontally(int i) {
        boolean z = false;
        if (this.mAdapter == null) {
            return false;
        }
        int clientWidth = getClientWidth();
        int scrollX = getScrollX();
        if (i < 0) {
            if (scrollX > ((int) (((float) clientWidth) * this.mFirstOffset))) {
                z = true;
            }
            return z;
        } else if (i <= 0) {
            return false;
        } else {
            if (scrollX < ((int) (((float) clientWidth) * this.mLastOffset))) {
                z = true;
            }
            return z;
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof LayoutParams) && super.checkLayoutParams(layoutParams);
    }

    public void clearOnPageChangeListeners() {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.clear();
        }
    }

    public void computeScroll() {
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            completeScroll(true);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int currX = this.mScroller.getCurrX();
        int currY = this.mScroller.getCurrY();
        if (!(scrollX == currX && scrollY == currY)) {
            scrollTo(currX, currY);
            if (!pageScrolled(currX)) {
                this.mScroller.abortAnimation();
                scrollTo(0, currY);
            }
        }
        ViewCompat.postInvalidateOnAnimation(this);
    }

    /* access modifiers changed from: 0000 */
    public void dataSetChanged() {
        int count = this.mAdapter.getCount();
        this.mExpectedAdapterCount = count;
        boolean z = this.mItems.size() < (this.mOffscreenPageLimit * 2) + 1 && this.mItems.size() < count;
        boolean z2 = false;
        int i = this.mCurItem;
        boolean z3 = z;
        int i2 = 0;
        while (i2 < this.mItems.size()) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i2);
            int itemPosition = this.mAdapter.getItemPosition(itemInfo.object);
            if (itemPosition != -1) {
                if (itemPosition == -2) {
                    this.mItems.remove(i2);
                    i2--;
                    if (!z2) {
                        this.mAdapter.startUpdate((ViewGroup) this);
                        z2 = true;
                    }
                    this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
                    z3 = true;
                    if (this.mCurItem == itemInfo.position) {
                        i = Math.max(0, Math.min(this.mCurItem, count - 1));
                        z3 = true;
                    }
                } else if (itemInfo.position != itemPosition) {
                    if (itemInfo.position == this.mCurItem) {
                        i = itemPosition;
                    }
                    itemInfo.position = itemPosition;
                    z3 = true;
                }
            }
            i2++;
        }
        if (z2) {
            this.mAdapter.finishUpdate((ViewGroup) this);
        }
        Collections.sort(this.mItems, COMPARATOR);
        if (z3) {
            int childCount = getChildCount();
            for (int i3 = 0; i3 < childCount; i3++) {
                LayoutParams layoutParams = (LayoutParams) getChildAt(i3).getLayoutParams();
                if (!layoutParams.isDecor) {
                    layoutParams.widthFactor = 0.0f;
                }
            }
            setCurrentItemInternal(i, false, true);
            requestLayout();
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        return super.dispatchKeyEvent(keyEvent) || executeKeyEvent(keyEvent);
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        if (accessibilityEvent.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(accessibilityEvent);
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem && childAt.dispatchPopulateAccessibilityEvent(accessibilityEvent)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* access modifiers changed from: 0000 */
    public float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((double) ((float) (((double) (f - 0.5f)) * 0.4712389167638204d)));
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        boolean z = false;
        int overScrollMode = ViewCompat.getOverScrollMode(this);
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                int save = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((float) ((-height) + getPaddingTop()), this.mFirstOffset * ((float) width));
                this.mLeftEdge.setSize(height, width);
                z = false | this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(save);
            }
            if (!this.mRightEdge.isFinished()) {
                int save2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate((float) (-getPaddingTop()), (-(this.mLastOffset + 1.0f)) * ((float) width2));
                this.mRightEdge.setSize(height2, width2);
                z |= this.mRightEdge.draw(canvas);
                canvas.restoreToCount(save2);
            }
        } else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (z) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable drawable = this.mMarginDrawable;
        if (drawable != null && drawable.isStateful()) {
            drawable.setState(getDrawableState());
        }
    }

    public void endFakeDrag() {
        if (this.mFakeDragging) {
            VelocityTracker velocityTracker = this.mVelocityTracker;
            velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
            int xVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
            this.mPopulatePending = true;
            int clientWidth = getClientWidth();
            int scrollX = getScrollX();
            ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
            setCurrentItemInternal(determineTargetPage(infoForCurrentScrollPosition.position, ((((float) scrollX) / ((float) clientWidth)) - infoForCurrentScrollPosition.offset) / infoForCurrentScrollPosition.widthFactor, xVelocity, (int) (this.mLastMotionX - this.mInitialMotionX)), true, true, xVelocity);
            endDrag();
            this.mFakeDragging = false;
            return;
        }
        throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }

    public boolean executeKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getAction() != 0) {
            return false;
        }
        int keyCode = keyEvent.getKeyCode();
        if (keyCode != 61) {
            switch (keyCode) {
                case 21:
                    return arrowScroll(17);
                case 22:
                    return arrowScroll(66);
                default:
                    return false;
            }
        } else if (VERSION.SDK_INT < 11) {
            return false;
        } else {
            if (KeyEventCompat.hasNoModifiers(keyEvent)) {
                return arrowScroll(2);
            }
            if (KeyEventCompat.hasModifiers(keyEvent, 1)) {
                return arrowScroll(1);
            }
            return false;
        }
    }

    public void fakeDragBy(float f) {
        if (this.mFakeDragging) {
            this.mLastMotionX += f;
            float scrollX = ((float) getScrollX()) - f;
            int clientWidth = getClientWidth();
            float f2 = ((float) clientWidth) * this.mFirstOffset;
            float f3 = ((float) clientWidth) * this.mLastOffset;
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(0);
            ItemInfo itemInfo2 = (ItemInfo) this.mItems.get(this.mItems.size() - 1);
            if (itemInfo.position != 0) {
                f2 = itemInfo.offset * ((float) clientWidth);
            }
            if (itemInfo2.position != this.mAdapter.getCount() - 1) {
                f3 = itemInfo2.offset * ((float) clientWidth);
            }
            if (scrollX < f2) {
                scrollX = f2;
            } else if (scrollX > f3) {
                scrollX = f3;
            }
            this.mLastMotionX += scrollX - ((float) ((int) scrollX));
            scrollTo((int) scrollX, getScrollY());
            pageScrolled((int) scrollX);
            MotionEvent obtain = MotionEvent.obtain(this.mFakeDragBeginTime, SystemClock.uptimeMillis(), 2, this.mLastMotionX, 0.0f, 0);
            this.mVelocityTracker.addMovement(obtain);
            obtain.recycle();
            return;
        }
        throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
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
        return generateDefaultLayoutParams();
    }

    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: protected */
    public int getChildDrawingOrder(int i, int i2) {
        return ((LayoutParams) ((View) this.mDrawingOrderedChildren.get(this.mDrawingOrder == 2 ? (i - 1) - i2 : i2)).getLayoutParams()).childIndex;
    }

    public int getCurrentItem() {
        return this.mCurItem;
    }

    public int getOffscreenPageLimit() {
        return this.mOffscreenPageLimit;
    }

    public int getPageMargin() {
        return this.mPageMargin;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForAnyChild(View view) {
        while (true) {
            ViewParent parent = view.getParent();
            ViewParent viewParent = parent;
            if (parent == this) {
                return infoForChild(view);
            }
            if (viewParent != null && (viewParent instanceof View)) {
                view = (View) viewParent;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForChild(View view) {
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i);
            if (this.mAdapter.isViewFromObject(view, itemInfo.object)) {
                return itemInfo;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForPosition(int i) {
        for (int i2 = 0; i2 < this.mItems.size(); i2++) {
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(i2);
            if (itemInfo.position == i) {
                return itemInfo;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public void initViewPager() {
        setWillNotDraw(false);
        setDescendantFocusability(262144);
        setFocusable(true);
        Context context = getContext();
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        float f = context.getResources().getDisplayMetrics().density;
        this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(viewConfiguration);
        this.mMinimumVelocity = (int) (400.0f * f);
        this.mMaximumVelocity = viewConfiguration.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffectCompat(context);
        this.mRightEdge = new EdgeEffectCompat(context);
        this.mFlingDistance = (int) (25.0f * f);
        this.mCloseEnough = (int) (2.0f * f);
        this.mDefaultGutterSize = (int) (16.0f * f);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.getImportantForAccessibility(this) == 0) {
            ViewCompat.setImportantForAccessibility(this, 1);
        }
    }

    public boolean isFakeDragging() {
        return this.mFakeDragging;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        removeCallbacks(this.mEndScrollRunnable);
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float f;
        float f2;
        super.onDraw(canvas);
        if (this.mPageMargin > 0 && this.mMarginDrawable != null && this.mItems.size() > 0 && this.mAdapter != null) {
            int scrollX = getScrollX();
            int width = getWidth();
            float f3 = ((float) this.mPageMargin) / ((float) width);
            ItemInfo itemInfo = (ItemInfo) this.mItems.get(0);
            float f4 = itemInfo.offset;
            int size = this.mItems.size();
            int i = itemInfo.position;
            int i2 = ((ItemInfo) this.mItems.get(size - 1)).position;
            float f5 = f4;
            int i3 = 0;
            int i4 = i;
            while (i4 < i2) {
                while (i4 > itemInfo.position && i3 < size) {
                    i3++;
                    itemInfo = (ItemInfo) this.mItems.get(i3);
                }
                if (i4 == itemInfo.position) {
                    f5 = itemInfo.offset + itemInfo.widthFactor + f3;
                    f = (itemInfo.offset + itemInfo.widthFactor) * ((float) width);
                } else {
                    float pageWidth = this.mAdapter.getPageWidth(i4);
                    f = (f5 + pageWidth) * ((float) width);
                    f5 += pageWidth + f3;
                }
                if (((float) this.mPageMargin) + f > ((float) scrollX)) {
                    f2 = f3;
                    this.mMarginDrawable.setBounds((int) f, this.mTopPageBounds, (int) (((float) this.mPageMargin) + f + 0.5f), this.mBottomPageBounds);
                    this.mMarginDrawable.draw(canvas);
                } else {
                    Canvas canvas2 = canvas;
                    f2 = f3;
                }
                if (f <= ((float) (scrollX + width))) {
                    i4++;
                    f3 = f2;
                } else {
                    return;
                }
            }
        }
        Canvas canvas3 = canvas;
    }

    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        float f;
        MotionEvent motionEvent2 = motionEvent;
        int action = motionEvent.getAction() & 255;
        if (action == 3 || action == 1) {
            this.mIsBeingDragged = false;
            this.mIsUnableToDrag = false;
            this.mActivePointerId = -1;
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.recycle();
                this.mVelocityTracker = null;
            }
            return false;
        }
        if (action != 0) {
            if (this.mIsBeingDragged) {
                return true;
            }
            if (this.mIsUnableToDrag) {
                return false;
            }
        }
        if (action == 0) {
            float x = motionEvent.getX();
            this.mInitialMotionX = x;
            this.mLastMotionX = x;
            float y = motionEvent.getY();
            this.mInitialMotionY = y;
            this.mLastMotionY = y;
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent2, 0);
            this.mIsUnableToDrag = false;
            this.mScroller.computeScrollOffset();
            if (this.mScrollState != 2 || Math.abs(this.mScroller.getFinalX() - this.mScroller.getCurrX()) <= this.mCloseEnough) {
                completeScroll(false);
                this.mIsBeingDragged = false;
            } else {
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                this.mIsBeingDragged = true;
                requestParentDisallowInterceptTouchEvent(true);
                setScrollState(1);
            }
        } else if (action == 2) {
            int i = this.mActivePointerId;
            if (i != -1) {
                int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent2, i);
                float x2 = MotionEventCompat.getX(motionEvent2, findPointerIndex);
                float f2 = x2 - this.mLastMotionX;
                float abs = Math.abs(f2);
                float y2 = MotionEventCompat.getY(motionEvent2, findPointerIndex);
                float abs2 = Math.abs(y2 - this.mInitialMotionY);
                if (f2 == 0.0f || isGutterDrag(this.mLastMotionX, f2)) {
                    f = y2;
                } else {
                    f = y2;
                    if (canScroll(this, false, (int) f2, (int) x2, (int) y2)) {
                        this.mLastMotionX = x2;
                        this.mLastMotionY = f;
                        this.mIsUnableToDrag = true;
                        return false;
                    }
                }
                if (abs > ((float) this.mTouchSlop) && 0.5f * abs > abs2) {
                    this.mIsBeingDragged = true;
                    requestParentDisallowInterceptTouchEvent(true);
                    setScrollState(1);
                    this.mLastMotionX = f2 > 0.0f ? this.mInitialMotionX + ((float) this.mTouchSlop) : this.mInitialMotionX - ((float) this.mTouchSlop);
                    this.mLastMotionY = f;
                    setScrollingCacheEnabled(true);
                } else if (abs2 > ((float) this.mTouchSlop)) {
                    this.mIsUnableToDrag = true;
                }
                if (this.mIsBeingDragged && performDrag(x2)) {
                    ViewCompat.postInvalidateOnAnimation(this);
                }
            }
        } else if (action == 6) {
            onSecondaryPointerUp(motionEvent);
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent2);
        return this.mIsBeingDragged;
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean z, int i, int i2, int i3, int i4) {
        boolean z2;
        int i5;
        int i6;
        int i7;
        int i8;
        int i9;
        int childCount = getChildCount();
        int i10 = i3 - i;
        int i11 = i4 - i2;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int i12 = 0;
        int i13 = paddingBottom;
        int i14 = paddingTop;
        int i15 = paddingLeft;
        for (int i16 = 0; i16 < childCount; i16++) {
            View childAt = getChildAt(i16);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i17 = layoutParams.gravity & 7;
                    int i18 = layoutParams.gravity & 112;
                    LayoutParams layoutParams2 = layoutParams;
                    if (i17 == 1) {
                        i8 = Math.max((i10 - childAt.getMeasuredWidth()) / 2, i15);
                    } else if (i17 == 3) {
                        i8 = i15;
                        i15 += childAt.getMeasuredWidth();
                    } else if (i17 != 5) {
                        i8 = i15;
                    } else {
                        i8 = (i10 - paddingRight) - childAt.getMeasuredWidth();
                        paddingRight += childAt.getMeasuredWidth();
                    }
                    int i19 = i17;
                    if (i18 == 16) {
                        i9 = Math.max((i11 - childAt.getMeasuredHeight()) / 2, i14);
                    } else if (i18 == 48) {
                        i9 = i14;
                        i14 += childAt.getMeasuredHeight();
                    } else if (i18 != 80) {
                        i9 = i14;
                    } else {
                        i9 = (i11 - i13) - childAt.getMeasuredHeight();
                        i13 += childAt.getMeasuredHeight();
                    }
                    int i20 = i8 + scrollX;
                    int i21 = i18;
                    childAt.layout(i20, i9, i20 + childAt.getMeasuredWidth(), i9 + childAt.getMeasuredHeight());
                    i12++;
                }
            }
        }
        int i22 = (i10 - i15) - paddingRight;
        int i23 = 0;
        while (i23 < childCount) {
            View childAt2 = getChildAt(i23);
            if (childAt2.getVisibility() != 8) {
                LayoutParams layoutParams3 = (LayoutParams) childAt2.getLayoutParams();
                if (!layoutParams3.isDecor) {
                    ItemInfo infoForChild = infoForChild(childAt2);
                    ItemInfo itemInfo = infoForChild;
                    if (infoForChild != null) {
                        i7 = childCount;
                        int i24 = (int) (((float) i22) * itemInfo.offset);
                        int i25 = i15 + i24;
                        int i26 = i14;
                        int i27 = i24;
                        if (layoutParams3.needsMeasure) {
                            layoutParams3.needsMeasure = false;
                            i6 = i22;
                            i5 = i10;
                            childAt2.measure(MeasureSpec.makeMeasureSpec((int) (((float) i22) * layoutParams3.widthFactor), 1073741824), MeasureSpec.makeMeasureSpec((i11 - i14) - i13, 1073741824));
                        } else {
                            i6 = i22;
                            i5 = i10;
                        }
                        int i28 = i26;
                        childAt2.layout(i25, i28, childAt2.getMeasuredWidth() + i25, childAt2.getMeasuredHeight() + i28);
                        i23++;
                        childCount = i7;
                        i22 = i6;
                        i10 = i5;
                    }
                }
            }
            i7 = childCount;
            i6 = i22;
            i5 = i10;
            i23++;
            childCount = i7;
            i22 = i6;
            i10 = i5;
        }
        int i29 = childCount;
        int i30 = i22;
        int i31 = i10;
        this.mTopPageBounds = i14;
        this.mBottomPageBounds = i11 - i13;
        this.mDecorChildCount = i12;
        if (this.mFirstLayout) {
            z2 = false;
            scrollToItem(this.mCurItem, false, 0, false);
        } else {
            z2 = false;
        }
        this.mFirstLayout = z2;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00c6  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00cd  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onMeasure(int i, int i2) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        setMeasuredDimension(getDefaultSize(0, i), getDefaultSize(0, i2));
        int measuredWidth = getMeasuredWidth();
        int i8 = measuredWidth / 10;
        this.mGutterSize = Math.min(i8, this.mDefaultGutterSize);
        int paddingLeft = (measuredWidth - getPaddingLeft()) - getPaddingRight();
        int measuredHeight = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int childCount = getChildCount();
        int i9 = measuredHeight;
        int i10 = paddingLeft;
        int i11 = 0;
        while (i11 < childCount) {
            View childAt = getChildAt(i11);
            if (childAt.getVisibility() != 8) {
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams != null && layoutParams.isDecor) {
                    int i12 = layoutParams.gravity & 7;
                    int i13 = layoutParams.gravity & 112;
                    int i14 = Integer.MIN_VALUE;
                    int i15 = Integer.MIN_VALUE;
                    boolean z = i13 == 48 || i13 == 80;
                    boolean z2 = i12 == 3 || i12 == 5;
                    boolean z3 = z2;
                    if (z) {
                        i14 = 1073741824;
                    } else if (z3) {
                        i15 = 1073741824;
                    }
                    int i16 = i10;
                    int i17 = i9;
                    i4 = measuredWidth;
                    if (layoutParams.width != -2) {
                        i14 = 1073741824;
                        if (layoutParams.width != -1) {
                            i5 = layoutParams.width;
                            if (layoutParams.height != -2) {
                                i15 = 1073741824;
                                if (layoutParams.height != -1) {
                                    i7 = layoutParams.height;
                                    i6 = 1073741824;
                                    i3 = i8;
                                    int i18 = i5;
                                    childAt.measure(MeasureSpec.makeMeasureSpec(i5, i14), MeasureSpec.makeMeasureSpec(i7, i6));
                                    if (z) {
                                        i9 -= childAt.getMeasuredHeight();
                                    } else if (z3) {
                                        i10 -= childAt.getMeasuredWidth();
                                    }
                                    i11++;
                                    measuredWidth = i4;
                                    i8 = i3;
                                    int i19 = i;
                                    int i20 = i2;
                                }
                            }
                            i6 = i15;
                            i7 = i17;
                            i3 = i8;
                            int i182 = i5;
                            childAt.measure(MeasureSpec.makeMeasureSpec(i5, i14), MeasureSpec.makeMeasureSpec(i7, i6));
                            if (z) {
                            }
                            i11++;
                            measuredWidth = i4;
                            i8 = i3;
                            int i192 = i;
                            int i202 = i2;
                        }
                    }
                    i5 = i16;
                    if (layoutParams.height != -2) {
                    }
                    i6 = i15;
                    i7 = i17;
                    i3 = i8;
                    int i1822 = i5;
                    childAt.measure(MeasureSpec.makeMeasureSpec(i5, i14), MeasureSpec.makeMeasureSpec(i7, i6));
                    if (z) {
                    }
                    i11++;
                    measuredWidth = i4;
                    i8 = i3;
                    int i1922 = i;
                    int i2022 = i2;
                }
            }
            i4 = measuredWidth;
            i3 = i8;
            i11++;
            measuredWidth = i4;
            i8 = i3;
            int i19222 = i;
            int i20222 = i2;
        }
        int i21 = measuredWidth;
        int i22 = i8;
        this.mChildWidthMeasureSpec = MeasureSpec.makeMeasureSpec(i10, 1073741824);
        this.mChildHeightMeasureSpec = MeasureSpec.makeMeasureSpec(i9, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int childCount2 = getChildCount();
        for (int i23 = 0; i23 < childCount2; i23++) {
            View childAt2 = getChildAt(i23);
            if (childAt2.getVisibility() != 8) {
                LayoutParams layoutParams2 = (LayoutParams) childAt2.getLayoutParams();
                if (layoutParams2 == null || !layoutParams2.isDecor) {
                    childAt2.measure(MeasureSpec.makeMeasureSpec((int) (((float) i10) * layoutParams2.widthFactor), 1073741824), this.mChildHeightMeasureSpec);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void onPageScrolled(int i, float f, int i2) {
        int i3;
        if (this.mDecorChildCount > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            int i4 = paddingRight;
            int i5 = paddingLeft;
            for (int i6 = 0; i6 < childCount; i6++) {
                View childAt = getChildAt(i6);
                LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                if (layoutParams.isDecor) {
                    int i7 = layoutParams.gravity & 7;
                    if (i7 == 1) {
                        i3 = Math.max((width - childAt.getMeasuredWidth()) / 2, i5);
                    } else if (i7 == 3) {
                        i3 = i5;
                        i5 += childAt.getWidth();
                    } else if (i7 != 5) {
                        i3 = i5;
                    } else {
                        i3 = (width - i4) - childAt.getMeasuredWidth();
                        i4 += childAt.getMeasuredWidth();
                    }
                    int left = (i3 + scrollX) - childAt.getLeft();
                    if (left != 0) {
                        childAt.offsetLeftAndRight(left);
                    }
                }
            }
        }
        dispatchOnPageScrolled(i, f, i2);
        if (this.mPageTransformer != null) {
            int scrollX2 = getScrollX();
            int childCount2 = getChildCount();
            for (int i8 = 0; i8 < childCount2; i8++) {
                View childAt2 = getChildAt(i8);
                if (!((LayoutParams) childAt2.getLayoutParams()).isDecor) {
                    this.mPageTransformer.transformPage(childAt2, ((float) (childAt2.getLeft() - scrollX2)) / ((float) getClientWidth()));
                }
            }
        }
        this.mCalledSuper = true;
    }

    /* access modifiers changed from: protected */
    public boolean onRequestFocusInDescendants(int i, Rect rect) {
        int i2;
        int i3;
        int i4;
        int childCount = getChildCount();
        if ((i & 2) != 0) {
            i4 = 0;
            i3 = 1;
            i2 = childCount;
        } else {
            i4 = childCount - 1;
            i3 = -1;
            i2 = -1;
        }
        for (int i5 = i4; i5 != i2; i5 += i3) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() == 0) {
                ItemInfo infoForChild = infoForChild(childAt);
                if (infoForChild != null && infoForChild.position == this.mCurItem && childAt.requestFocus(i, rect)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof SavedState)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState savedState = (SavedState) parcelable;
        super.onRestoreInstanceState(savedState.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(savedState.adapterState, savedState.loader);
            setCurrentItemInternal(savedState.position, false, true);
        } else {
            this.mRestoredCurItem = savedState.position;
            this.mRestoredAdapterState = savedState.adapterState;
            this.mRestoredClassLoader = savedState.loader;
        }
    }

    public Parcelable onSaveInstanceState() {
        SavedState savedState = new SavedState(super.onSaveInstanceState());
        savedState.position = this.mCurItem;
        if (this.mAdapter != null) {
            savedState.adapterState = this.mAdapter.saveState();
        }
        return savedState;
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i != i3) {
            recomputeScrollPosition(i, i3, this.mPageMargin, this.mPageMargin);
        }
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        MotionEvent motionEvent2 = motionEvent;
        if (this.mFakeDragging) {
            return true;
        }
        if ((motionEvent.getAction() == 0 && motionEvent.getEdgeFlags() != 0) || this.mAdapter == null || this.mAdapter.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent2);
        int action = motionEvent.getAction();
        boolean z = false;
        switch (action & 255) {
            case 0:
                int i = action;
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                float x = motionEvent.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                float y = motionEvent.getY();
                this.mInitialMotionY = y;
                this.mLastMotionY = y;
                this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent2, 0);
                break;
            case 1:
                if (this.mIsBeingDragged) {
                    VelocityTracker velocityTracker = this.mVelocityTracker;
                    velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
                    int xVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
                    this.mPopulatePending = true;
                    int clientWidth = getClientWidth();
                    int scrollX = getScrollX();
                    ItemInfo infoForCurrentScrollPosition = infoForCurrentScrollPosition();
                    setCurrentItemInternal(determineTargetPage(infoForCurrentScrollPosition.position, ((((float) scrollX) / ((float) clientWidth)) - infoForCurrentScrollPosition.offset) / infoForCurrentScrollPosition.widthFactor, xVelocity, (int) (MotionEventCompat.getX(motionEvent2, MotionEventCompat.findPointerIndex(motionEvent2, this.mActivePointerId)) - this.mInitialMotionX)), true, true, xVelocity);
                    this.mActivePointerId = -1;
                    endDrag();
                    int i2 = action;
                    z = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
            case 2:
                if (!this.mIsBeingDragged) {
                    int findPointerIndex = MotionEventCompat.findPointerIndex(motionEvent2, this.mActivePointerId);
                    float x2 = MotionEventCompat.getX(motionEvent2, findPointerIndex);
                    float abs = Math.abs(x2 - this.mLastMotionX);
                    float y2 = MotionEventCompat.getY(motionEvent2, findPointerIndex);
                    float abs2 = Math.abs(y2 - this.mLastMotionY);
                    if (abs > ((float) this.mTouchSlop) && abs > abs2) {
                        this.mIsBeingDragged = true;
                        requestParentDisallowInterceptTouchEvent(true);
                        this.mLastMotionX = x2 - this.mInitialMotionX > 0.0f ? this.mInitialMotionX + ((float) this.mTouchSlop) : this.mInitialMotionX - ((float) this.mTouchSlop);
                        this.mLastMotionY = y2;
                        setScrollState(1);
                        setScrollingCacheEnabled(true);
                        ViewParent parent = getParent();
                        if (parent != null) {
                            parent.requestDisallowInterceptTouchEvent(true);
                        }
                    }
                }
                if (this.mIsBeingDragged) {
                    z = false | performDrag(MotionEventCompat.getX(motionEvent2, MotionEventCompat.findPointerIndex(motionEvent2, this.mActivePointerId)));
                    break;
                }
                break;
            case 3:
                if (this.mIsBeingDragged) {
                    scrollToItem(this.mCurItem, true, 0, false);
                    this.mActivePointerId = -1;
                    endDrag();
                    z = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
                break;
            case 5:
                int actionIndex = MotionEventCompat.getActionIndex(motionEvent);
                this.mLastMotionX = MotionEventCompat.getX(motionEvent2, actionIndex);
                this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent2, actionIndex);
                break;
            case 6:
                onSecondaryPointerUp(motionEvent);
                this.mLastMotionX = MotionEventCompat.getX(motionEvent2, MotionEventCompat.findPointerIndex(motionEvent2, this.mActivePointerId));
                break;
            default:
                int i3 = action;
                break;
        }
        int i4 = action;
        if (z) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean pageLeft() {
        if (this.mCurItem <= 0) {
            return false;
        }
        setCurrentItem(this.mCurItem - 1, true);
        return true;
    }

    /* access modifiers changed from: 0000 */
    public boolean pageRight() {
        if (this.mAdapter == null || this.mCurItem >= this.mAdapter.getCount() - 1) {
            return false;
        }
        setCurrentItem(this.mCurItem + 1, true);
        return true;
    }

    /* access modifiers changed from: 0000 */
    public void populate() {
        populate(this.mCurItem);
    }

    /* access modifiers changed from: 0000 */
    public void populate(int i) {
        String str;
        int i2;
        float f;
        int i3;
        int i4;
        float f2;
        ItemInfo itemInfo;
        int i5 = i;
        ItemInfo itemInfo2 = null;
        int i6 = 2;
        if (this.mCurItem != i5) {
            i6 = this.mCurItem < i5 ? 66 : 17;
            itemInfo2 = infoForPosition(this.mCurItem);
            this.mCurItem = i5;
        }
        int i7 = i6;
        ItemInfo itemInfo3 = itemInfo2;
        if (this.mAdapter == null) {
            sortChildDrawingOrder();
        } else if (this.mPopulatePending) {
            sortChildDrawingOrder();
        } else if (getWindowToken() != null) {
            this.mAdapter.startUpdate((ViewGroup) this);
            int i8 = this.mOffscreenPageLimit;
            int max = Math.max(0, this.mCurItem - i8);
            int count = this.mAdapter.getCount();
            int min = Math.min(count - 1, this.mCurItem + i8);
            if (count == this.mExpectedAdapterCount) {
                ItemInfo itemInfo4 = null;
                int i9 = 0;
                while (true) {
                    if (i9 >= this.mItems.size()) {
                        break;
                    }
                    ItemInfo itemInfo5 = (ItemInfo) this.mItems.get(i9);
                    if (itemInfo5.position < this.mCurItem) {
                        i9++;
                    } else if (itemInfo5.position == this.mCurItem) {
                        itemInfo4 = itemInfo5;
                    }
                }
                if (itemInfo4 == null && count > 0) {
                    itemInfo4 = addNewItem(this.mCurItem, i9);
                }
                if (itemInfo4 != null) {
                    float f3 = 0.0f;
                    int i10 = i9 - 1;
                    ItemInfo itemInfo6 = i10 >= 0 ? (ItemInfo) this.mItems.get(i10) : null;
                    int clientWidth = getClientWidth();
                    if (clientWidth <= 0) {
                        i2 = i9;
                        f = 0.0f;
                    } else {
                        i2 = i9;
                        f = (((float) getPaddingLeft()) / ((float) clientWidth)) + (2.0f - itemInfo4.widthFactor);
                    }
                    float f4 = f;
                    int i11 = this.mCurItem - 1;
                    int i12 = i2;
                    while (true) {
                        if (i11 < 0) {
                            float f5 = f4;
                            break;
                        }
                        if (f3 < f4 || i11 >= max) {
                            f2 = f4;
                            if (itemInfo6 == null || i11 != itemInfo6.position) {
                                f3 += addNewItem(i11, i10 + 1).widthFactor;
                                i12++;
                                itemInfo = i10 >= 0 ? (ItemInfo) this.mItems.get(i10) : null;
                            } else {
                                f3 += itemInfo6.widthFactor;
                                i10--;
                                itemInfo = i10 >= 0 ? (ItemInfo) this.mItems.get(i10) : null;
                            }
                        } else if (itemInfo6 == null) {
                            float f6 = f4;
                            break;
                        } else {
                            f2 = f4;
                            if (i11 == itemInfo6.position && !itemInfo6.scrolling) {
                                this.mItems.remove(i10);
                                this.mAdapter.destroyItem((ViewGroup) this, i11, itemInfo6.object);
                                i10--;
                                i12--;
                                itemInfo = i10 >= 0 ? (ItemInfo) this.mItems.get(i10) : null;
                            }
                            i11--;
                            f4 = f2;
                            int i13 = i;
                        }
                        itemInfo6 = itemInfo;
                        i11--;
                        f4 = f2;
                        int i132 = i;
                    }
                    float f7 = itemInfo4.widthFactor;
                    int i14 = i12 + 1;
                    if (f7 < 2.0f) {
                        ItemInfo itemInfo7 = i14 < this.mItems.size() ? (ItemInfo) this.mItems.get(i14) : null;
                        float paddingRight = clientWidth <= 0 ? 0.0f : (((float) getPaddingRight()) / ((float) clientWidth)) + 2.0f;
                        int i15 = this.mCurItem + 1;
                        while (true) {
                            if (i15 >= count) {
                                int i16 = i8;
                                int i17 = clientWidth;
                                break;
                            }
                            if (f7 < paddingRight || i15 <= min) {
                                i4 = i8;
                                i3 = clientWidth;
                                if (itemInfo7 == null || i15 != itemInfo7.position) {
                                    ItemInfo addNewItem = addNewItem(i15, i14);
                                    i14++;
                                    f7 += addNewItem.widthFactor;
                                    itemInfo7 = i14 < this.mItems.size() ? (ItemInfo) this.mItems.get(i14) : null;
                                } else {
                                    f7 += itemInfo7.widthFactor;
                                    i14++;
                                    itemInfo7 = i14 < this.mItems.size() ? (ItemInfo) this.mItems.get(i14) : null;
                                }
                            } else if (itemInfo7 == null) {
                                int i18 = i8;
                                int i19 = clientWidth;
                                break;
                            } else {
                                i4 = i8;
                                if (i15 != itemInfo7.position || itemInfo7.scrolling) {
                                    i3 = clientWidth;
                                } else {
                                    this.mItems.remove(i14);
                                    i3 = clientWidth;
                                    this.mAdapter.destroyItem((ViewGroup) this, i15, itemInfo7.object);
                                    itemInfo7 = i14 < this.mItems.size() ? (ItemInfo) this.mItems.get(i14) : null;
                                }
                            }
                            i15++;
                            i8 = i4;
                            clientWidth = i3;
                        }
                        ItemInfo itemInfo8 = itemInfo7;
                    } else {
                        int i20 = i8;
                        int i21 = clientWidth;
                    }
                    calculatePageOffsets(itemInfo4, i12, itemInfo3);
                } else {
                    int i22 = i8;
                    int i23 = i9;
                }
                this.mAdapter.setPrimaryItem((ViewGroup) this, this.mCurItem, itemInfo4 != null ? itemInfo4.object : null);
                this.mAdapter.finishUpdate((ViewGroup) this);
                int childCount = getChildCount();
                for (int i24 = 0; i24 < childCount; i24++) {
                    View childAt = getChildAt(i24);
                    LayoutParams layoutParams = (LayoutParams) childAt.getLayoutParams();
                    layoutParams.childIndex = i24;
                    if (!layoutParams.isDecor) {
                        if (layoutParams.widthFactor == 0.0f) {
                            ItemInfo infoForChild = infoForChild(childAt);
                            if (infoForChild != null) {
                                layoutParams.widthFactor = infoForChild.widthFactor;
                                layoutParams.position = infoForChild.position;
                            }
                        }
                    }
                }
                sortChildDrawingOrder();
                if (hasFocus()) {
                    View findFocus = findFocus();
                    ItemInfo infoForAnyChild = findFocus != null ? infoForAnyChild(findFocus) : null;
                    if (infoForAnyChild == null || infoForAnyChild.position != this.mCurItem) {
                        int i25 = 0;
                        while (true) {
                            int i26 = i25;
                            if (i26 >= getChildCount()) {
                                break;
                            }
                            View childAt2 = getChildAt(i26);
                            ItemInfo infoForChild2 = infoForChild(childAt2);
                            if (infoForChild2 != null && infoForChild2.position == this.mCurItem && childAt2.requestFocus(i7)) {
                                break;
                            }
                            i25 = i26 + 1;
                        }
                    }
                }
                return;
            }
            int i27 = i8;
            try {
                str = getResources().getResourceName(getId());
            } catch (NotFoundException e) {
                str = Integer.toHexString(getId());
            }
            StringBuilder sb = new StringBuilder();
            sb.append("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: ");
            sb.append(this.mExpectedAdapterCount);
            sb.append(", found: ");
            sb.append(count);
            sb.append(" Pager id: ");
            sb.append(str);
            sb.append(" Pager class: ");
            sb.append(getClass());
            sb.append(" Problematic adapter: ");
            sb.append(this.mAdapter.getClass());
            throw new IllegalStateException(sb.toString());
        }
    }

    public void removeOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.remove(onPageChangeListener);
        }
    }

    public void removeView(View view) {
        if (this.mInLayout) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    public void setAdapter(PagerAdapter pagerAdapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
            this.mAdapter.startUpdate((ViewGroup) this);
            for (int i = 0; i < this.mItems.size(); i++) {
                ItemInfo itemInfo = (ItemInfo) this.mItems.get(i);
                this.mAdapter.destroyItem((ViewGroup) this, itemInfo.position, itemInfo.object);
            }
            this.mAdapter.finishUpdate((ViewGroup) this);
            this.mItems.clear();
            removeNonDecorViews();
            this.mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter pagerAdapter2 = this.mAdapter;
        this.mAdapter = pagerAdapter;
        this.mExpectedAdapterCount = 0;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.registerDataSetObserver(this.mObserver);
            this.mPopulatePending = false;
            boolean z = this.mFirstLayout;
            this.mFirstLayout = true;
            this.mExpectedAdapterCount = this.mAdapter.getCount();
            if (this.mRestoredCurItem >= 0) {
                this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
                setCurrentItemInternal(this.mRestoredCurItem, false, true);
                this.mRestoredCurItem = -1;
                this.mRestoredAdapterState = null;
                this.mRestoredClassLoader = null;
            } else if (!z) {
                populate();
            } else {
                requestLayout();
            }
        }
        if (this.mAdapterChangeListener != null && pagerAdapter2 != pagerAdapter) {
            this.mAdapterChangeListener.onAdapterChanged(pagerAdapter2, pagerAdapter);
        }
    }

    /* access modifiers changed from: 0000 */
    public void setChildrenDrawingOrderEnabledCompat(boolean z) {
        if (VERSION.SDK_INT >= 7) {
            if (this.mSetChildrenDrawingOrderEnabled == null) {
                try {
                    this.mSetChildrenDrawingOrderEnabled = ViewGroup.class.getDeclaredMethod("setChildrenDrawingOrderEnabled", new Class[]{Boolean.TYPE});
                } catch (NoSuchMethodException e) {
                    Log.e(TAG, "Can't find setChildrenDrawingOrderEnabled", e);
                }
            }
            try {
                this.mSetChildrenDrawingOrderEnabled.invoke(this, new Object[]{Boolean.valueOf(z)});
            } catch (Exception e2) {
                Log.e(TAG, "Error changing children drawing order", e2);
            }
        }
    }

    public void setCurrentItem(int i) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, !this.mFirstLayout, false);
    }

    public void setCurrentItem(int i, boolean z) {
        this.mPopulatePending = false;
        setCurrentItemInternal(i, z, false);
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int i, boolean z, boolean z2) {
        setCurrentItemInternal(i, z, z2, 0);
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int i, boolean z, boolean z2, int i2) {
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            setScrollingCacheEnabled(false);
        } else if (z2 || this.mCurItem != i || this.mItems.size() == 0) {
            boolean z3 = true;
            if (i < 0) {
                i = 0;
            } else if (i >= this.mAdapter.getCount()) {
                i = this.mAdapter.getCount() - 1;
            }
            int i3 = this.mOffscreenPageLimit;
            if (i > this.mCurItem + i3 || i < this.mCurItem - i3) {
                for (int i4 = 0; i4 < this.mItems.size(); i4++) {
                    ((ItemInfo) this.mItems.get(i4)).scrolling = true;
                }
            }
            if (this.mCurItem == i) {
                z3 = false;
            }
            if (this.mFirstLayout) {
                this.mCurItem = i;
                if (z3) {
                    dispatchOnPageSelected(i);
                }
                requestLayout();
            } else {
                populate(i);
                scrollToItem(i, z, i2, z3);
            }
        } else {
            setScrollingCacheEnabled(false);
        }
    }

    /* access modifiers changed from: 0000 */
    public OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener onPageChangeListener) {
        OnPageChangeListener onPageChangeListener2 = this.mInternalPageChangeListener;
        this.mInternalPageChangeListener = onPageChangeListener;
        return onPageChangeListener2;
    }

    public void setOffscreenPageLimit(int i) {
        if (i < 1) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Requested offscreen page limit ");
            sb.append(i);
            sb.append(" too small; defaulting to ");
            sb.append(1);
            Log.w(str, sb.toString());
            i = 1;
        }
        if (i != this.mOffscreenPageLimit) {
            this.mOffscreenPageLimit = i;
            populate();
        }
    }

    /* access modifiers changed from: 0000 */
    public void setOnAdapterChangeListener(OnAdapterChangeListener onAdapterChangeListener) {
        this.mAdapterChangeListener = onAdapterChangeListener;
    }

    @Deprecated
    public void setOnPageChangeListener(OnPageChangeListener onPageChangeListener) {
        this.mOnPageChangeListener = onPageChangeListener;
    }

    public void setPageMargin(int i) {
        int i2 = this.mPageMargin;
        this.mPageMargin = i;
        int width = getWidth();
        recomputeScrollPosition(width, width, i, i2);
        requestLayout();
    }

    public void setPageMarginDrawable(@DrawableRes int i) {
        setPageMarginDrawable(getContext().getResources().getDrawable(i));
    }

    public void setPageMarginDrawable(Drawable drawable) {
        this.mMarginDrawable = drawable;
        if (drawable != null) {
            refreshDrawableState();
        }
        setWillNotDraw(drawable == null);
        invalidate();
    }

    public void setPageTransformer(boolean z, PageTransformer pageTransformer) {
        if (VERSION.SDK_INT >= 11) {
            int i = 1;
            boolean z2 = pageTransformer != null;
            boolean z3 = z2 != (this.mPageTransformer != null);
            this.mPageTransformer = pageTransformer;
            setChildrenDrawingOrderEnabledCompat(z2);
            if (z2) {
                if (z) {
                    i = 2;
                }
                this.mDrawingOrder = i;
            } else {
                this.mDrawingOrder = 0;
            }
            if (z3) {
                populate();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void smoothScrollTo(int i, int i2) {
        smoothScrollTo(i, i2, 0);
    }

    /* access modifiers changed from: 0000 */
    public void smoothScrollTo(int i, int i2, int i3) {
        int i4;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        int i5 = i - scrollX;
        int i6 = i2 - scrollY;
        if (i5 == 0 && i6 == 0) {
            completeScroll(false);
            populate();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int clientWidth = getClientWidth();
        int i7 = clientWidth / 2;
        float distanceInfluenceForSnapDuration = ((float) i7) + (((float) i7) * distanceInfluenceForSnapDuration(Math.min(1.0f, (((float) Math.abs(i5)) * 1.0f) / ((float) clientWidth))));
        int abs = Math.abs(i3);
        if (abs > 0) {
            i4 = 4 * Math.round(1000.0f * Math.abs(distanceInfluenceForSnapDuration / ((float) abs)));
        } else {
            i4 = (int) ((1.0f + (((float) Math.abs(i5)) / (((float) this.mPageMargin) + (((float) clientWidth) * this.mAdapter.getPageWidth(this.mCurItem))))) * 100.0f);
        }
        int i8 = abs;
        this.mScroller.startScroll(scrollX, scrollY, i5, i6, Math.min(i4, MAX_SETTLE_DURATION));
        ViewCompat.postInvalidateOnAnimation(this);
    }

    /* access modifiers changed from: protected */
    public boolean verifyDrawable(Drawable drawable) {
        return super.verifyDrawable(drawable) || drawable == this.mMarginDrawable;
    }
}
