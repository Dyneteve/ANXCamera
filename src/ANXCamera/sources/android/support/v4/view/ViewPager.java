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
        public int compare(ItemInfo lhs, ItemInfo rhs) {
            return lhs.position - rhs.position;
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
        public float getInterpolation(float t) {
            float t2 = t - 1.0f;
            return (t2 * t2 * t2 * t2 * t2) + 1.0f;
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

        public LayoutParams(Context context, AttributeSet attrs) {
            super(context, attrs);
            TypedArray a = context.obtainStyledAttributes(attrs, ViewPager.LAYOUT_ATTRS);
            this.gravity = a.getInteger(0, 48);
            a.recycle();
        }
    }

    class MyAccessibilityDelegate extends AccessibilityDelegateCompat {
        MyAccessibilityDelegate() {
        }

        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            event.setClassName(ViewPager.class.getName());
            AccessibilityRecordCompat recordCompat = AccessibilityRecordCompat.obtain();
            recordCompat.setScrollable(canScroll());
            if (event.getEventType() == 4096 && ViewPager.this.mAdapter != null) {
                recordCompat.setItemCount(ViewPager.this.mAdapter.getCount());
                recordCompat.setFromIndex(ViewPager.this.mCurItem);
                recordCompat.setToIndex(ViewPager.this.mCurItem);
            }
        }

        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            info.setClassName(ViewPager.class.getName());
            info.setScrollable(canScroll());
            if (ViewPager.this.canScrollHorizontally(1)) {
                info.addAction(4096);
            }
            if (ViewPager.this.canScrollHorizontally(-1)) {
                info.addAction(8192);
            }
        }

        public boolean performAccessibilityAction(View host, int action, Bundle args) {
            if (super.performAccessibilityAction(host, action, args)) {
                return true;
            }
            if (action != 4096) {
                if (action != 8192 || !ViewPager.this.canScrollHorizontally(-1)) {
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

        private boolean canScroll() {
            return ViewPager.this.mAdapter != null && ViewPager.this.mAdapter.getCount() > 1;
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
            public SavedState createFromParcel(Parcel in, ClassLoader loader) {
                return new SavedState(in, loader);
            }

            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        });
        Parcelable adapterState;
        ClassLoader loader;
        int position;

        public SavedState(Parcelable superState) {
            super(superState);
        }

        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.position);
            out.writeParcelable(this.adapterState, flags);
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

        SavedState(Parcel in, ClassLoader loader2) {
            super(in);
            if (loader2 == null) {
                loader2 = getClass().getClassLoader();
            }
            this.position = in.readInt();
            this.adapterState = in.readParcelable(loader2);
            this.loader = loader2;
        }
    }

    public static class SimpleOnPageChangeListener implements OnPageChangeListener {
        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        }

        public void onPageSelected(int position) {
        }

        public void onPageScrollStateChanged(int state) {
        }
    }

    static class ViewPositionComparator implements Comparator<View> {
        ViewPositionComparator() {
        }

        public int compare(View lhs, View rhs) {
            LayoutParams llp = (LayoutParams) lhs.getLayoutParams();
            LayoutParams rlp = (LayoutParams) rhs.getLayoutParams();
            if (llp.isDecor == rlp.isDecor) {
                return llp.position - rlp.position;
            }
            return llp.isDecor ? 1 : -1;
        }
    }

    public ViewPager(Context context) {
        super(context);
        initViewPager();
    }

    public ViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
        initViewPager();
    }

    /* access modifiers changed from: 0000 */
    public void initViewPager() {
        setWillNotDraw(false);
        setDescendantFocusability(262144);
        setFocusable(true);
        Context context = getContext();
        this.mScroller = new Scroller(context, sInterpolator);
        ViewConfiguration configuration = ViewConfiguration.get(context);
        float density = context.getResources().getDisplayMetrics().density;
        this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(configuration);
        this.mMinimumVelocity = (int) (400.0f * density);
        this.mMaximumVelocity = configuration.getScaledMaximumFlingVelocity();
        this.mLeftEdge = new EdgeEffectCompat(context);
        this.mRightEdge = new EdgeEffectCompat(context);
        this.mFlingDistance = (int) (25.0f * density);
        this.mCloseEnough = (int) (2.0f * density);
        this.mDefaultGutterSize = (int) (16.0f * density);
        ViewCompat.setAccessibilityDelegate(this, new MyAccessibilityDelegate());
        if (ViewCompat.getImportantForAccessibility(this) == 0) {
            ViewCompat.setImportantForAccessibility(this, 1);
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        removeCallbacks(this.mEndScrollRunnable);
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: private */
    public void setScrollState(int newState) {
        if (this.mScrollState != newState) {
            this.mScrollState = newState;
            if (this.mPageTransformer != null) {
                enableLayers(newState != 0);
            }
            dispatchOnScrollStateChanged(newState);
        }
    }

    public void setAdapter(PagerAdapter adapter) {
        if (this.mAdapter != null) {
            this.mAdapter.unregisterDataSetObserver(this.mObserver);
            this.mAdapter.startUpdate((ViewGroup) this);
            for (int i = 0; i < this.mItems.size(); i++) {
                ItemInfo ii = (ItemInfo) this.mItems.get(i);
                this.mAdapter.destroyItem((ViewGroup) this, ii.position, ii.object);
            }
            this.mAdapter.finishUpdate((ViewGroup) this);
            this.mItems.clear();
            removeNonDecorViews();
            this.mCurItem = 0;
            scrollTo(0, 0);
        }
        PagerAdapter oldAdapter = this.mAdapter;
        this.mAdapter = adapter;
        this.mExpectedAdapterCount = 0;
        if (this.mAdapter != null) {
            if (this.mObserver == null) {
                this.mObserver = new PagerObserver();
            }
            this.mAdapter.registerDataSetObserver(this.mObserver);
            this.mPopulatePending = false;
            boolean wasFirstLayout = this.mFirstLayout;
            this.mFirstLayout = true;
            this.mExpectedAdapterCount = this.mAdapter.getCount();
            if (this.mRestoredCurItem >= 0) {
                this.mAdapter.restoreState(this.mRestoredAdapterState, this.mRestoredClassLoader);
                setCurrentItemInternal(this.mRestoredCurItem, false, true);
                this.mRestoredCurItem = -1;
                this.mRestoredAdapterState = null;
                this.mRestoredClassLoader = null;
            } else if (!wasFirstLayout) {
                populate();
            } else {
                requestLayout();
            }
        }
        if (this.mAdapterChangeListener != null && oldAdapter != adapter) {
            this.mAdapterChangeListener.onAdapterChanged(oldAdapter, adapter);
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

    public PagerAdapter getAdapter() {
        return this.mAdapter;
    }

    /* access modifiers changed from: 0000 */
    public void setOnAdapterChangeListener(OnAdapterChangeListener listener) {
        this.mAdapterChangeListener = listener;
    }

    private int getClientWidth() {
        return (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight();
    }

    public void setCurrentItem(int item) {
        this.mPopulatePending = false;
        setCurrentItemInternal(item, !this.mFirstLayout, false);
    }

    public void setCurrentItem(int item, boolean smoothScroll) {
        this.mPopulatePending = false;
        setCurrentItemInternal(item, smoothScroll, false);
    }

    public int getCurrentItem() {
        return this.mCurItem;
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int item, boolean smoothScroll, boolean always) {
        setCurrentItemInternal(item, smoothScroll, always, 0);
    }

    /* access modifiers changed from: 0000 */
    public void setCurrentItemInternal(int item, boolean smoothScroll, boolean always, int velocity) {
        if (this.mAdapter == null || this.mAdapter.getCount() <= 0) {
            setScrollingCacheEnabled(false);
        } else if (always || this.mCurItem != item || this.mItems.size() == 0) {
            boolean dispatchSelected = true;
            if (item < 0) {
                item = 0;
            } else if (item >= this.mAdapter.getCount()) {
                item = this.mAdapter.getCount() - 1;
            }
            int pageLimit = this.mOffscreenPageLimit;
            if (item > this.mCurItem + pageLimit || item < this.mCurItem - pageLimit) {
                for (int i = 0; i < this.mItems.size(); i++) {
                    ((ItemInfo) this.mItems.get(i)).scrolling = true;
                }
            }
            if (this.mCurItem == item) {
                dispatchSelected = false;
            }
            if (this.mFirstLayout) {
                this.mCurItem = item;
                if (dispatchSelected) {
                    dispatchOnPageSelected(item);
                }
                requestLayout();
            } else {
                populate(item);
                scrollToItem(item, smoothScroll, velocity, dispatchSelected);
            }
        } else {
            setScrollingCacheEnabled(false);
        }
    }

    private void scrollToItem(int item, boolean smoothScroll, int velocity, boolean dispatchSelected) {
        ItemInfo curInfo = infoForPosition(item);
        int destX = 0;
        if (curInfo != null) {
            destX = (int) (((float) getClientWidth()) * Math.max(this.mFirstOffset, Math.min(curInfo.offset, this.mLastOffset)));
        }
        if (smoothScroll) {
            smoothScrollTo(destX, 0, velocity);
            if (dispatchSelected) {
                dispatchOnPageSelected(item);
                return;
            }
            return;
        }
        if (dispatchSelected) {
            dispatchOnPageSelected(item);
        }
        completeScroll(false);
        scrollTo(destX, 0);
        pageScrolled(destX);
    }

    @Deprecated
    public void setOnPageChangeListener(OnPageChangeListener listener) {
        this.mOnPageChangeListener = listener;
    }

    public void addOnPageChangeListener(OnPageChangeListener listener) {
        if (this.mOnPageChangeListeners == null) {
            this.mOnPageChangeListeners = new ArrayList();
        }
        this.mOnPageChangeListeners.add(listener);
    }

    public void removeOnPageChangeListener(OnPageChangeListener listener) {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.remove(listener);
        }
    }

    public void clearOnPageChangeListeners() {
        if (this.mOnPageChangeListeners != null) {
            this.mOnPageChangeListeners.clear();
        }
    }

    public void setPageTransformer(boolean reverseDrawingOrder, PageTransformer transformer) {
        if (VERSION.SDK_INT >= 11) {
            int i = 1;
            boolean hasTransformer = transformer != null;
            boolean needsPopulate = hasTransformer != (this.mPageTransformer != null);
            this.mPageTransformer = transformer;
            setChildrenDrawingOrderEnabledCompat(hasTransformer);
            if (hasTransformer) {
                if (reverseDrawingOrder) {
                    i = 2;
                }
                this.mDrawingOrder = i;
            } else {
                this.mDrawingOrder = 0;
            }
            if (needsPopulate) {
                populate();
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void setChildrenDrawingOrderEnabledCompat(boolean enable) {
        if (VERSION.SDK_INT >= 7) {
            if (this.mSetChildrenDrawingOrderEnabled == null) {
                try {
                    this.mSetChildrenDrawingOrderEnabled = ViewGroup.class.getDeclaredMethod("setChildrenDrawingOrderEnabled", new Class[]{Boolean.TYPE});
                } catch (NoSuchMethodException e) {
                    Log.e(TAG, "Can't find setChildrenDrawingOrderEnabled", e);
                }
            }
            try {
                this.mSetChildrenDrawingOrderEnabled.invoke(this, new Object[]{Boolean.valueOf(enable)});
            } catch (Exception e2) {
                Log.e(TAG, "Error changing children drawing order", e2);
            }
        }
    }

    /* access modifiers changed from: protected */
    public int getChildDrawingOrder(int childCount, int i) {
        return ((LayoutParams) ((View) this.mDrawingOrderedChildren.get(this.mDrawingOrder == 2 ? (childCount - 1) - i : i)).getLayoutParams()).childIndex;
    }

    /* access modifiers changed from: 0000 */
    public OnPageChangeListener setInternalPageChangeListener(OnPageChangeListener listener) {
        OnPageChangeListener oldListener = this.mInternalPageChangeListener;
        this.mInternalPageChangeListener = listener;
        return oldListener;
    }

    public int getOffscreenPageLimit() {
        return this.mOffscreenPageLimit;
    }

    public void setOffscreenPageLimit(int limit) {
        if (limit < 1) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Requested offscreen page limit ");
            sb.append(limit);
            sb.append(" too small; defaulting to ");
            sb.append(1);
            Log.w(str, sb.toString());
            limit = 1;
        }
        if (limit != this.mOffscreenPageLimit) {
            this.mOffscreenPageLimit = limit;
            populate();
        }
    }

    public void setPageMargin(int marginPixels) {
        int oldMargin = this.mPageMargin;
        this.mPageMargin = marginPixels;
        int width = getWidth();
        recomputeScrollPosition(width, width, marginPixels, oldMargin);
        requestLayout();
    }

    public int getPageMargin() {
        return this.mPageMargin;
    }

    public void setPageMarginDrawable(Drawable d) {
        this.mMarginDrawable = d;
        if (d != null) {
            refreshDrawableState();
        }
        setWillNotDraw(d == null);
        invalidate();
    }

    public void setPageMarginDrawable(@DrawableRes int resId) {
        setPageMarginDrawable(getContext().getResources().getDrawable(resId));
    }

    /* access modifiers changed from: protected */
    public boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.mMarginDrawable;
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        Drawable d = this.mMarginDrawable;
        if (d != null && d.isStateful()) {
            d.setState(getDrawableState());
        }
    }

    /* access modifiers changed from: 0000 */
    public float distanceInfluenceForSnapDuration(float f) {
        return (float) Math.sin((double) ((float) (((double) (f - 0.5f)) * 0.4712389167638204d)));
    }

    /* access modifiers changed from: 0000 */
    public void smoothScrollTo(int x, int y) {
        smoothScrollTo(x, y, 0);
    }

    /* access modifiers changed from: 0000 */
    public void smoothScrollTo(int x, int y, int velocity) {
        int duration;
        if (getChildCount() == 0) {
            setScrollingCacheEnabled(false);
            return;
        }
        int sx = getScrollX();
        int sy = getScrollY();
        int dx = x - sx;
        int dy = y - sy;
        if (dx == 0 && dy == 0) {
            completeScroll(false);
            populate();
            setScrollState(0);
            return;
        }
        setScrollingCacheEnabled(true);
        setScrollState(2);
        int width = getClientWidth();
        int halfWidth = width / 2;
        float distance = ((float) halfWidth) + (((float) halfWidth) * distanceInfluenceForSnapDuration(Math.min(1.0f, (((float) Math.abs(dx)) * 1.0f) / ((float) width))));
        int velocity2 = Math.abs(velocity);
        if (velocity2 > 0) {
            duration = 4 * Math.round(1000.0f * Math.abs(distance / ((float) velocity2)));
        } else {
            duration = (int) ((1.0f + (((float) Math.abs(dx)) / (((float) this.mPageMargin) + (((float) width) * this.mAdapter.getPageWidth(this.mCurItem))))) * 100.0f);
        }
        int i = velocity2;
        this.mScroller.startScroll(sx, sy, dx, dy, Math.min(duration, MAX_SETTLE_DURATION));
        ViewCompat.postInvalidateOnAnimation(this);
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo addNewItem(int position, int index) {
        ItemInfo ii = new ItemInfo();
        ii.position = position;
        ii.object = this.mAdapter.instantiateItem((ViewGroup) this, position);
        ii.widthFactor = this.mAdapter.getPageWidth(position);
        if (index < 0 || index >= this.mItems.size()) {
            this.mItems.add(ii);
        } else {
            this.mItems.add(index, ii);
        }
        return ii;
    }

    /* access modifiers changed from: 0000 */
    public void dataSetChanged() {
        int adapterCount = this.mAdapter.getCount();
        this.mExpectedAdapterCount = adapterCount;
        boolean needPopulate = this.mItems.size() < (this.mOffscreenPageLimit * 2) + 1 && this.mItems.size() < adapterCount;
        boolean isUpdating = false;
        int newCurrItem = this.mCurItem;
        boolean needPopulate2 = needPopulate;
        int i = 0;
        while (i < this.mItems.size()) {
            ItemInfo ii = (ItemInfo) this.mItems.get(i);
            int newPos = this.mAdapter.getItemPosition(ii.object);
            if (newPos != -1) {
                if (newPos == -2) {
                    this.mItems.remove(i);
                    i--;
                    if (!isUpdating) {
                        this.mAdapter.startUpdate((ViewGroup) this);
                        isUpdating = true;
                    }
                    this.mAdapter.destroyItem((ViewGroup) this, ii.position, ii.object);
                    needPopulate2 = true;
                    if (this.mCurItem == ii.position) {
                        newCurrItem = Math.max(0, Math.min(this.mCurItem, adapterCount - 1));
                        needPopulate2 = true;
                    }
                } else if (ii.position != newPos) {
                    if (ii.position == this.mCurItem) {
                        newCurrItem = newPos;
                    }
                    ii.position = newPos;
                    needPopulate2 = true;
                }
            }
            i++;
        }
        if (isUpdating) {
            this.mAdapter.finishUpdate((ViewGroup) this);
        }
        Collections.sort(this.mItems, COMPARATOR);
        if (needPopulate2) {
            int childCount = getChildCount();
            for (int i2 = 0; i2 < childCount; i2++) {
                LayoutParams lp = (LayoutParams) getChildAt(i2).getLayoutParams();
                if (!lp.isDecor) {
                    lp.widthFactor = 0.0f;
                }
            }
            setCurrentItemInternal(newCurrItem, false, true);
            requestLayout();
        }
    }

    /* access modifiers changed from: 0000 */
    public void populate() {
        populate(this.mCurItem);
    }

    /* access modifiers changed from: 0000 */
    public void populate(int newCurrentItem) {
        String resName;
        int curIndex;
        float f;
        int clientWidth;
        int pageLimit;
        float leftWidthNeeded;
        ItemInfo ii;
        int i = newCurrentItem;
        ItemInfo oldCurInfo = null;
        int focusDirection = 2;
        if (this.mCurItem != i) {
            focusDirection = this.mCurItem < i ? 66 : 17;
            oldCurInfo = infoForPosition(this.mCurItem);
            this.mCurItem = i;
        }
        int focusDirection2 = focusDirection;
        ItemInfo oldCurInfo2 = oldCurInfo;
        if (this.mAdapter == null) {
            sortChildDrawingOrder();
        } else if (this.mPopulatePending) {
            sortChildDrawingOrder();
        } else if (getWindowToken() != null) {
            this.mAdapter.startUpdate((ViewGroup) this);
            int pageLimit2 = this.mOffscreenPageLimit;
            int startPos = Math.max(0, this.mCurItem - pageLimit2);
            int N = this.mAdapter.getCount();
            int endPos = Math.min(N - 1, this.mCurItem + pageLimit2);
            if (N == this.mExpectedAdapterCount) {
                ItemInfo curItem = null;
                int curIndex2 = 0;
                while (true) {
                    if (curIndex2 >= this.mItems.size()) {
                        break;
                    }
                    ItemInfo ii2 = (ItemInfo) this.mItems.get(curIndex2);
                    if (ii2.position < this.mCurItem) {
                        curIndex2++;
                    } else if (ii2.position == this.mCurItem) {
                        curItem = ii2;
                    }
                }
                if (curItem == null && N > 0) {
                    curItem = addNewItem(this.mCurItem, curIndex2);
                }
                if (curItem != null) {
                    float extraWidthLeft = 0.0f;
                    int itemIndex = curIndex2 - 1;
                    ItemInfo ii3 = itemIndex >= 0 ? (ItemInfo) this.mItems.get(itemIndex) : null;
                    int clientWidth2 = getClientWidth();
                    if (clientWidth2 <= 0) {
                        curIndex = curIndex2;
                        f = 0.0f;
                    } else {
                        curIndex = curIndex2;
                        f = (((float) getPaddingLeft()) / ((float) clientWidth2)) + (2.0f - curItem.widthFactor);
                    }
                    float leftWidthNeeded2 = f;
                    int pos = this.mCurItem - 1;
                    int curIndex3 = curIndex;
                    while (true) {
                        if (pos < 0) {
                            break;
                        }
                        if (extraWidthLeft < leftWidthNeeded2 || pos >= startPos) {
                            leftWidthNeeded = leftWidthNeeded2;
                            if (ii3 == null || pos != ii3.position) {
                                extraWidthLeft += addNewItem(pos, itemIndex + 1).widthFactor;
                                curIndex3++;
                                ii = itemIndex >= 0 ? (ItemInfo) this.mItems.get(itemIndex) : null;
                            } else {
                                extraWidthLeft += ii3.widthFactor;
                                itemIndex--;
                                ii = itemIndex >= 0 ? (ItemInfo) this.mItems.get(itemIndex) : null;
                            }
                        } else if (ii3 == null) {
                            float f2 = leftWidthNeeded2;
                            break;
                        } else {
                            leftWidthNeeded = leftWidthNeeded2;
                            if (pos == ii3.position && !ii3.scrolling) {
                                this.mItems.remove(itemIndex);
                                this.mAdapter.destroyItem((ViewGroup) this, pos, ii3.object);
                                itemIndex--;
                                curIndex3--;
                                ii = itemIndex >= 0 ? (ItemInfo) this.mItems.get(itemIndex) : null;
                            }
                            pos--;
                            leftWidthNeeded2 = leftWidthNeeded;
                            int i2 = newCurrentItem;
                        }
                        ii3 = ii;
                        pos--;
                        leftWidthNeeded2 = leftWidthNeeded;
                        int i22 = newCurrentItem;
                    }
                    float extraWidthRight = curItem.widthFactor;
                    int itemIndex2 = curIndex3 + 1;
                    if (extraWidthRight < 2.0f) {
                        ItemInfo ii4 = itemIndex2 < this.mItems.size() ? (ItemInfo) this.mItems.get(itemIndex2) : null;
                        float rightWidthNeeded = clientWidth2 <= 0 ? 0.0f : (((float) getPaddingRight()) / ((float) clientWidth2)) + 2.0f;
                        int pos2 = this.mCurItem + 1;
                        while (true) {
                            if (pos2 >= N) {
                                int i3 = clientWidth2;
                                break;
                            }
                            if (extraWidthRight < rightWidthNeeded || pos2 <= endPos) {
                                pageLimit = pageLimit2;
                                clientWidth = clientWidth2;
                                if (ii4 == null || pos2 != ii4.position) {
                                    ItemInfo ii5 = addNewItem(pos2, itemIndex2);
                                    itemIndex2++;
                                    extraWidthRight += ii5.widthFactor;
                                    ii4 = itemIndex2 < this.mItems.size() ? (ItemInfo) this.mItems.get(itemIndex2) : null;
                                } else {
                                    extraWidthRight += ii4.widthFactor;
                                    itemIndex2++;
                                    ii4 = itemIndex2 < this.mItems.size() ? (ItemInfo) this.mItems.get(itemIndex2) : null;
                                }
                            } else if (ii4 == null) {
                                int i4 = pageLimit2;
                                int i5 = clientWidth2;
                                break;
                            } else {
                                pageLimit = pageLimit2;
                                if (pos2 != ii4.position || ii4.scrolling) {
                                    clientWidth = clientWidth2;
                                } else {
                                    this.mItems.remove(itemIndex2);
                                    clientWidth = clientWidth2;
                                    this.mAdapter.destroyItem((ViewGroup) this, pos2, ii4.object);
                                    ii4 = itemIndex2 < this.mItems.size() ? (ItemInfo) this.mItems.get(itemIndex2) : null;
                                }
                            }
                            pos2++;
                            pageLimit2 = pageLimit;
                            clientWidth2 = clientWidth;
                        }
                        ItemInfo itemInfo = ii4;
                    } else {
                        int i6 = clientWidth2;
                    }
                    calculatePageOffsets(curItem, curIndex3, oldCurInfo2);
                } else {
                    int i7 = pageLimit2;
                    int i8 = curIndex2;
                }
                this.mAdapter.setPrimaryItem((ViewGroup) this, this.mCurItem, curItem != null ? curItem.object : null);
                this.mAdapter.finishUpdate((ViewGroup) this);
                int childCount = getChildCount();
                for (int i9 = 0; i9 < childCount; i9++) {
                    View child = getChildAt(i9);
                    LayoutParams lp = (LayoutParams) child.getLayoutParams();
                    lp.childIndex = i9;
                    if (!lp.isDecor) {
                        if (lp.widthFactor == 0.0f) {
                            ItemInfo ii6 = infoForChild(child);
                            if (ii6 != null) {
                                lp.widthFactor = ii6.widthFactor;
                                lp.position = ii6.position;
                            }
                        }
                    }
                }
                sortChildDrawingOrder();
                if (hasFocus()) {
                    View currentFocused = findFocus();
                    ItemInfo ii7 = currentFocused != null ? infoForAnyChild(currentFocused) : null;
                    if (ii7 == null || ii7.position != this.mCurItem) {
                        int i10 = 0;
                        while (true) {
                            int i11 = i10;
                            if (i11 >= getChildCount()) {
                                break;
                            }
                            View child2 = getChildAt(i11);
                            ItemInfo ii8 = infoForChild(child2);
                            if (ii8 != null && ii8.position == this.mCurItem && child2.requestFocus(focusDirection2)) {
                                break;
                            }
                            i10 = i11 + 1;
                        }
                    }
                }
                return;
            }
            try {
                resName = getResources().getResourceName(getId());
            } catch (NotFoundException e) {
                resName = Integer.toHexString(getId());
            }
            StringBuilder sb = new StringBuilder();
            sb.append("The application's PagerAdapter changed the adapter's contents without calling PagerAdapter#notifyDataSetChanged! Expected adapter item count: ");
            sb.append(this.mExpectedAdapterCount);
            sb.append(", found: ");
            sb.append(N);
            sb.append(" Pager id: ");
            sb.append(resName);
            sb.append(" Pager class: ");
            sb.append(getClass());
            sb.append(" Problematic adapter: ");
            sb.append(this.mAdapter.getClass());
            throw new IllegalStateException(sb.toString());
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

    private void calculatePageOffsets(ItemInfo curItem, int curIndex, ItemInfo oldCurInfo) {
        ItemInfo ii;
        ItemInfo ii2;
        int N = this.mAdapter.getCount();
        int width = getClientWidth();
        float marginOffset = width > 0 ? ((float) this.mPageMargin) / ((float) width) : 0.0f;
        if (oldCurInfo != null) {
            int oldCurPosition = oldCurInfo.position;
            if (oldCurPosition < curItem.position) {
                int itemIndex = 0;
                float offset = oldCurInfo.offset + oldCurInfo.widthFactor + marginOffset;
                int pos = oldCurPosition + 1;
                while (pos <= curItem.position && itemIndex < this.mItems.size()) {
                    Object obj = this.mItems.get(itemIndex);
                    while (true) {
                        ii2 = (ItemInfo) obj;
                        if (pos > ii2.position && itemIndex < this.mItems.size() - 1) {
                            itemIndex++;
                            obj = this.mItems.get(itemIndex);
                        }
                    }
                    while (pos < ii2.position) {
                        offset += this.mAdapter.getPageWidth(pos) + marginOffset;
                        pos++;
                    }
                    ii2.offset = offset;
                    offset += ii2.widthFactor + marginOffset;
                    pos++;
                }
            } else if (oldCurPosition > curItem.position) {
                int itemIndex2 = this.mItems.size() - 1;
                float offset2 = oldCurInfo.offset;
                int pos2 = oldCurPosition - 1;
                while (pos2 >= curItem.position && itemIndex2 >= 0) {
                    Object obj2 = this.mItems.get(itemIndex2);
                    while (true) {
                        ii = (ItemInfo) obj2;
                        if (pos2 < ii.position && itemIndex2 > 0) {
                            itemIndex2--;
                            obj2 = this.mItems.get(itemIndex2);
                        }
                    }
                    while (pos2 > ii.position) {
                        offset2 -= this.mAdapter.getPageWidth(pos2) + marginOffset;
                        pos2--;
                    }
                    offset2 -= ii.widthFactor + marginOffset;
                    ii.offset = offset2;
                    pos2--;
                }
            }
        }
        int itemCount = this.mItems.size();
        float offset3 = curItem.offset;
        int pos3 = curItem.position - 1;
        this.mFirstOffset = curItem.position == 0 ? curItem.offset : -3.4028235E38f;
        this.mLastOffset = curItem.position == N + -1 ? (curItem.offset + curItem.widthFactor) - 1.0f : Float.MAX_VALUE;
        int i = curIndex - 1;
        while (i >= 0) {
            ItemInfo ii3 = (ItemInfo) this.mItems.get(i);
            while (pos3 > ii3.position) {
                offset3 -= this.mAdapter.getPageWidth(pos3) + marginOffset;
                pos3--;
            }
            offset3 -= ii3.widthFactor + marginOffset;
            ii3.offset = offset3;
            if (ii3.position == 0) {
                this.mFirstOffset = offset3;
            }
            i--;
            pos3--;
        }
        float offset4 = curItem.offset + curItem.widthFactor + marginOffset;
        int pos4 = curItem.position + 1;
        int i2 = curIndex + 1;
        while (i2 < itemCount) {
            ItemInfo ii4 = (ItemInfo) this.mItems.get(i2);
            while (pos4 < ii4.position) {
                offset4 += this.mAdapter.getPageWidth(pos4) + marginOffset;
                pos4++;
            }
            if (ii4.position == N - 1) {
                this.mLastOffset = (ii4.widthFactor + offset4) - 1.0f;
            }
            ii4.offset = offset4;
            offset4 += ii4.widthFactor + marginOffset;
            i2++;
            pos4++;
        }
        this.mNeedCalculatePageOffsets = false;
    }

    public Parcelable onSaveInstanceState() {
        SavedState ss = new SavedState(super.onSaveInstanceState());
        ss.position = this.mCurItem;
        if (this.mAdapter != null) {
            ss.adapterState = this.mAdapter.saveState();
        }
        return ss;
    }

    public void onRestoreInstanceState(Parcelable state) {
        if (!(state instanceof SavedState)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(ss.getSuperState());
        if (this.mAdapter != null) {
            this.mAdapter.restoreState(ss.adapterState, ss.loader);
            setCurrentItemInternal(ss.position, false, true);
        } else {
            this.mRestoredCurItem = ss.position;
            this.mRestoredAdapterState = ss.adapterState;
            this.mRestoredClassLoader = ss.loader;
        }
    }

    public void addView(View child, int index, android.view.ViewGroup.LayoutParams params) {
        if (!checkLayoutParams(params)) {
            params = generateLayoutParams(params);
        }
        LayoutParams lp = (LayoutParams) params;
        lp.isDecor |= child instanceof Decor;
        if (!this.mInLayout) {
            super.addView(child, index, params);
        } else if (lp == null || !lp.isDecor) {
            lp.needsMeasure = true;
            addViewInLayout(child, index, params);
        } else {
            throw new IllegalStateException("Cannot add pager decor view during layout");
        }
    }

    public void removeView(View view) {
        if (this.mInLayout) {
            removeViewInLayout(view);
        } else {
            super.removeView(view);
        }
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForChild(View child) {
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = (ItemInfo) this.mItems.get(i);
            if (this.mAdapter.isViewFromObject(child, ii.object)) {
                return ii;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForAnyChild(View child) {
        while (true) {
            ViewParent parent = child.getParent();
            ViewParent parent2 = parent;
            if (parent == this) {
                return infoForChild(child);
            }
            if (parent2 != null && (parent2 instanceof View)) {
                child = (View) parent2;
            }
        }
        return null;
    }

    /* access modifiers changed from: 0000 */
    public ItemInfo infoForPosition(int position) {
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = (ItemInfo) this.mItems.get(i);
            if (ii.position == position) {
                return ii;
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mFirstLayout = true;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:34:0x00a5  */
    /* JADX WARNING: Removed duplicated region for block: B:40:0x00c6  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x00cd  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int maxGutterSize;
        int measuredWidth;
        int widthSize;
        int heightMode;
        int heightSize;
        setMeasuredDimension(getDefaultSize(0, widthMeasureSpec), getDefaultSize(0, heightMeasureSpec));
        int measuredWidth2 = getMeasuredWidth();
        int maxGutterSize2 = measuredWidth2 / 10;
        this.mGutterSize = Math.min(maxGutterSize2, this.mDefaultGutterSize);
        int childWidthSize = (measuredWidth2 - getPaddingLeft()) - getPaddingRight();
        int childHeightSize = (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom();
        int size = getChildCount();
        int childHeightSize2 = childHeightSize;
        int childWidthSize2 = childWidthSize;
        int i = 0;
        while (i < size) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp != null && lp.isDecor) {
                    int hgrav = lp.gravity & 7;
                    int vgrav = lp.gravity & 112;
                    int widthMode = Integer.MIN_VALUE;
                    int heightMode2 = Integer.MIN_VALUE;
                    boolean consumeVertical = vgrav == 48 || vgrav == 80;
                    boolean z = hgrav == 3 || hgrav == 5;
                    boolean consumeHorizontal = z;
                    if (consumeVertical) {
                        widthMode = 1073741824;
                    } else if (consumeHorizontal) {
                        heightMode2 = 1073741824;
                    }
                    int widthSize2 = childWidthSize2;
                    int heightSize2 = childHeightSize2;
                    measuredWidth = measuredWidth2;
                    if (lp.width != -2) {
                        widthMode = 1073741824;
                        if (lp.width != -1) {
                            widthSize = lp.width;
                            if (lp.height != -2) {
                                heightMode2 = 1073741824;
                                if (lp.height != -1) {
                                    heightSize = lp.height;
                                    heightMode = 1073741824;
                                    maxGutterSize = maxGutterSize2;
                                    int i2 = widthSize;
                                    child.measure(MeasureSpec.makeMeasureSpec(widthSize, widthMode), MeasureSpec.makeMeasureSpec(heightSize, heightMode));
                                    if (consumeVertical) {
                                        childHeightSize2 -= child.getMeasuredHeight();
                                    } else if (consumeHorizontal) {
                                        childWidthSize2 -= child.getMeasuredWidth();
                                    }
                                    i++;
                                    measuredWidth2 = measuredWidth;
                                    maxGutterSize2 = maxGutterSize;
                                    int i3 = widthMeasureSpec;
                                    int i4 = heightMeasureSpec;
                                }
                            }
                            heightMode = heightMode2;
                            heightSize = heightSize2;
                            maxGutterSize = maxGutterSize2;
                            int i22 = widthSize;
                            child.measure(MeasureSpec.makeMeasureSpec(widthSize, widthMode), MeasureSpec.makeMeasureSpec(heightSize, heightMode));
                            if (consumeVertical) {
                            }
                            i++;
                            measuredWidth2 = measuredWidth;
                            maxGutterSize2 = maxGutterSize;
                            int i32 = widthMeasureSpec;
                            int i42 = heightMeasureSpec;
                        }
                    }
                    widthSize = widthSize2;
                    if (lp.height != -2) {
                    }
                    heightMode = heightMode2;
                    heightSize = heightSize2;
                    maxGutterSize = maxGutterSize2;
                    int i222 = widthSize;
                    child.measure(MeasureSpec.makeMeasureSpec(widthSize, widthMode), MeasureSpec.makeMeasureSpec(heightSize, heightMode));
                    if (consumeVertical) {
                    }
                    i++;
                    measuredWidth2 = measuredWidth;
                    maxGutterSize2 = maxGutterSize;
                    int i322 = widthMeasureSpec;
                    int i422 = heightMeasureSpec;
                }
            }
            measuredWidth = measuredWidth2;
            maxGutterSize = maxGutterSize2;
            i++;
            measuredWidth2 = measuredWidth;
            maxGutterSize2 = maxGutterSize;
            int i3222 = widthMeasureSpec;
            int i4222 = heightMeasureSpec;
        }
        int i5 = maxGutterSize2;
        this.mChildWidthMeasureSpec = MeasureSpec.makeMeasureSpec(childWidthSize2, 1073741824);
        this.mChildHeightMeasureSpec = MeasureSpec.makeMeasureSpec(childHeightSize2, 1073741824);
        this.mInLayout = true;
        populate();
        this.mInLayout = false;
        int size2 = getChildCount();
        for (int i6 = 0; i6 < size2; i6++) {
            View child2 = getChildAt(i6);
            if (child2.getVisibility() != 8) {
                LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                if (lp2 == null || !lp2.isDecor) {
                    child2.measure(MeasureSpec.makeMeasureSpec((int) (((float) childWidthSize2) * lp2.widthFactor), 1073741824), this.mChildHeightMeasureSpec);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (w != oldw) {
            recomputeScrollPosition(w, oldw, this.mPageMargin, this.mPageMargin);
        }
    }

    private void recomputeScrollPosition(int width, int oldWidth, int margin, int oldMargin) {
        int i = width;
        if (oldWidth <= 0 || this.mItems.isEmpty()) {
            ItemInfo ii = infoForPosition(this.mCurItem);
            int scrollPos = (int) (((float) ((i - getPaddingLeft()) - getPaddingRight())) * (ii != null ? Math.min(ii.offset, this.mLastOffset) : 0.0f));
            if (scrollPos != getScrollX()) {
                completeScroll(false);
                scrollTo(scrollPos, getScrollY());
                return;
            }
            return;
        }
        int newOffsetPixels = (int) (((float) (((i - getPaddingLeft()) - getPaddingRight()) + margin)) * (((float) getScrollX()) / ((float) (((oldWidth - getPaddingLeft()) - getPaddingRight()) + oldMargin))));
        scrollTo(newOffsetPixels, getScrollY());
        if (!this.mScroller.isFinished()) {
            int newDuration = this.mScroller.getDuration() - this.mScroller.timePassed();
            ItemInfo targetInfo = infoForPosition(this.mCurItem);
            ItemInfo itemInfo = targetInfo;
            this.mScroller.startScroll(newOffsetPixels, 0, (int) (targetInfo.offset * ((float) i)), 0, newDuration);
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        boolean z;
        int width;
        int childWidth;
        int count;
        int childLeft;
        int childTop;
        int count2 = getChildCount();
        int width2 = r - l;
        int height = b - t;
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        int paddingRight = getPaddingRight();
        int paddingBottom = getPaddingBottom();
        int scrollX = getScrollX();
        int decorCount = 0;
        int paddingBottom2 = paddingBottom;
        int paddingTop2 = paddingTop;
        int paddingLeft2 = paddingLeft;
        for (int i = 0; i < count2; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.isDecor != 0) {
                    int hgrav = lp.gravity & 7;
                    int vgrav = lp.gravity & 112;
                    LayoutParams layoutParams = lp;
                    if (hgrav == 1) {
                        childLeft = Math.max((width2 - child.getMeasuredWidth()) / 2, paddingLeft2);
                    } else if (hgrav == 3) {
                        childLeft = paddingLeft2;
                        paddingLeft2 += child.getMeasuredWidth();
                    } else if (hgrav != 5) {
                        childLeft = paddingLeft2;
                    } else {
                        childLeft = (width2 - paddingRight) - child.getMeasuredWidth();
                        paddingRight += child.getMeasuredWidth();
                    }
                    int i2 = hgrav;
                    if (vgrav == 16) {
                        childTop = Math.max((height - child.getMeasuredHeight()) / 2, paddingTop2);
                    } else if (vgrav == 48) {
                        childTop = paddingTop2;
                        paddingTop2 += child.getMeasuredHeight();
                    } else if (vgrav != 80) {
                        childTop = paddingTop2;
                    } else {
                        childTop = (height - paddingBottom2) - child.getMeasuredHeight();
                        paddingBottom2 += child.getMeasuredHeight();
                    }
                    int childLeft2 = childLeft + scrollX;
                    int i3 = vgrav;
                    child.layout(childLeft2, childTop, childLeft2 + child.getMeasuredWidth(), childTop + child.getMeasuredHeight());
                    decorCount++;
                }
            }
        }
        int childWidth2 = (width2 - paddingLeft2) - paddingRight;
        int i4 = 0;
        while (i4 < count2) {
            View child2 = getChildAt(i4);
            if (child2.getVisibility() != 8) {
                LayoutParams lp2 = (LayoutParams) child2.getLayoutParams();
                if (!lp2.isDecor) {
                    ItemInfo infoForChild = infoForChild(child2);
                    ItemInfo ii = infoForChild;
                    if (infoForChild != null) {
                        count = count2;
                        int loff = (int) (((float) childWidth2) * ii.offset);
                        int childLeft3 = paddingLeft2 + loff;
                        int childTop2 = paddingTop2;
                        int i5 = loff;
                        if (lp2.needsMeasure != 0) {
                            lp2.needsMeasure = false;
                            childWidth = childWidth2;
                            width = width2;
                            child2.measure(MeasureSpec.makeMeasureSpec((int) (((float) childWidth2) * lp2.widthFactor), 1073741824), MeasureSpec.makeMeasureSpec((height - paddingTop2) - paddingBottom2, 1073741824));
                        } else {
                            childWidth = childWidth2;
                            width = width2;
                        }
                        int childTop3 = childTop2;
                        child2.layout(childLeft3, childTop3, child2.getMeasuredWidth() + childLeft3, child2.getMeasuredHeight() + childTop3);
                        i4++;
                        count2 = count;
                        childWidth2 = childWidth;
                        width2 = width;
                    }
                }
            }
            count = count2;
            childWidth = childWidth2;
            width = width2;
            i4++;
            count2 = count;
            childWidth2 = childWidth;
            width2 = width;
        }
        int i6 = childWidth2;
        int i7 = width2;
        this.mTopPageBounds = paddingTop2;
        this.mBottomPageBounds = height - paddingBottom2;
        this.mDecorChildCount = decorCount;
        if (this.mFirstLayout) {
            z = false;
            scrollToItem(this.mCurItem, false, 0, false);
        } else {
            z = false;
        }
        this.mFirstLayout = z;
    }

    public void computeScroll() {
        if (this.mScroller.isFinished() || !this.mScroller.computeScrollOffset()) {
            completeScroll(true);
            return;
        }
        int oldX = getScrollX();
        int oldY = getScrollY();
        int x = this.mScroller.getCurrX();
        int y = this.mScroller.getCurrY();
        if (!(oldX == x && oldY == y)) {
            scrollTo(x, y);
            if (!pageScrolled(x)) {
                this.mScroller.abortAnimation();
                scrollTo(0, y);
            }
        }
        ViewCompat.postInvalidateOnAnimation(this);
    }

    private boolean pageScrolled(int xpos) {
        if (this.mItems.size() == 0) {
            this.mCalledSuper = false;
            onPageScrolled(0, 0.0f, 0);
            if (this.mCalledSuper) {
                return false;
            }
            throw new IllegalStateException("onPageScrolled did not call superclass implementation");
        }
        ItemInfo ii = infoForCurrentScrollPosition();
        int width = getClientWidth();
        int widthWithMargin = this.mPageMargin + width;
        float marginOffset = ((float) this.mPageMargin) / ((float) width);
        int currentPage = ii.position;
        float pageOffset = ((((float) xpos) / ((float) width)) - ii.offset) / (ii.widthFactor + marginOffset);
        int offsetPixels = (int) (((float) widthWithMargin) * pageOffset);
        this.mCalledSuper = false;
        onPageScrolled(currentPage, pageOffset, offsetPixels);
        if (this.mCalledSuper) {
            return true;
        }
        throw new IllegalStateException("onPageScrolled did not call superclass implementation");
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void onPageScrolled(int position, float offset, int offsetPixels) {
        int childLeft;
        if (this.mDecorChildCount > 0) {
            int scrollX = getScrollX();
            int paddingLeft = getPaddingLeft();
            int paddingRight = getPaddingRight();
            int width = getWidth();
            int childCount = getChildCount();
            int paddingRight2 = paddingRight;
            int paddingLeft2 = paddingLeft;
            for (int i = 0; i < childCount; i++) {
                View child = getChildAt(i);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                if (lp.isDecor) {
                    int hgrav = lp.gravity & 7;
                    if (hgrav == 1) {
                        childLeft = Math.max((width - child.getMeasuredWidth()) / 2, paddingLeft2);
                    } else if (hgrav == 3) {
                        childLeft = paddingLeft2;
                        paddingLeft2 += child.getWidth();
                    } else if (hgrav != 5) {
                        childLeft = paddingLeft2;
                    } else {
                        childLeft = (width - paddingRight2) - child.getMeasuredWidth();
                        paddingRight2 += child.getMeasuredWidth();
                    }
                    int childOffset = (childLeft + scrollX) - child.getLeft();
                    if (childOffset != 0) {
                        child.offsetLeftAndRight(childOffset);
                    }
                }
            }
        }
        dispatchOnPageScrolled(position, offset, offsetPixels);
        if (this.mPageTransformer != null) {
            int scrollX2 = getScrollX();
            int childCount2 = getChildCount();
            for (int i2 = 0; i2 < childCount2; i2++) {
                View child2 = getChildAt(i2);
                if (!((LayoutParams) child2.getLayoutParams()).isDecor) {
                    this.mPageTransformer.transformPage(child2, ((float) (child2.getLeft() - scrollX2)) / ((float) getClientWidth()));
                }
            }
        }
        this.mCalledSuper = true;
    }

    private void dispatchOnPageScrolled(int position, float offset, int offsetPixels) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrolled(position, offset, offsetPixels);
        }
        if (this.mOnPageChangeListeners != null) {
            int z = this.mOnPageChangeListeners.size();
            for (int i = 0; i < z; i++) {
                OnPageChangeListener listener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i);
                if (listener != null) {
                    listener.onPageScrolled(position, offset, offsetPixels);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrolled(position, offset, offsetPixels);
        }
    }

    private void dispatchOnPageSelected(int position) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageSelected(position);
        }
        if (this.mOnPageChangeListeners != null) {
            int z = this.mOnPageChangeListeners.size();
            for (int i = 0; i < z; i++) {
                OnPageChangeListener listener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i);
                if (listener != null) {
                    listener.onPageSelected(position);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageSelected(position);
        }
    }

    private void dispatchOnScrollStateChanged(int state) {
        if (this.mOnPageChangeListener != null) {
            this.mOnPageChangeListener.onPageScrollStateChanged(state);
        }
        if (this.mOnPageChangeListeners != null) {
            int z = this.mOnPageChangeListeners.size();
            for (int i = 0; i < z; i++) {
                OnPageChangeListener listener = (OnPageChangeListener) this.mOnPageChangeListeners.get(i);
                if (listener != null) {
                    listener.onPageScrollStateChanged(state);
                }
            }
        }
        if (this.mInternalPageChangeListener != null) {
            this.mInternalPageChangeListener.onPageScrollStateChanged(state);
        }
    }

    private void completeScroll(boolean postEvents) {
        boolean needPopulate = this.mScrollState == 2;
        if (needPopulate) {
            setScrollingCacheEnabled(false);
            this.mScroller.abortAnimation();
            int oldX = getScrollX();
            int oldY = getScrollY();
            int x = this.mScroller.getCurrX();
            int y = this.mScroller.getCurrY();
            if (!(oldX == x && oldY == y)) {
                scrollTo(x, y);
                if (x != oldX) {
                    pageScrolled(x);
                }
            }
        }
        this.mPopulatePending = false;
        boolean needPopulate2 = needPopulate;
        for (int i = 0; i < this.mItems.size(); i++) {
            ItemInfo ii = (ItemInfo) this.mItems.get(i);
            if (ii.scrolling) {
                needPopulate2 = true;
                ii.scrolling = false;
            }
        }
        if (!needPopulate2) {
            return;
        }
        if (postEvents) {
            ViewCompat.postOnAnimation(this, this.mEndScrollRunnable);
        } else {
            this.mEndScrollRunnable.run();
        }
    }

    private boolean isGutterDrag(float x, float dx) {
        return (x < ((float) this.mGutterSize) && dx > 0.0f) || (x > ((float) (getWidth() - this.mGutterSize)) && dx < 0.0f);
    }

    private void enableLayers(boolean enable) {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            ViewCompat.setLayerType(getChildAt(i), enable ? 2 : 0, null);
        }
    }

    public boolean onInterceptTouchEvent(MotionEvent ev) {
        float y;
        MotionEvent motionEvent = ev;
        int action = ev.getAction() & 255;
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
            float x = ev.getX();
            this.mInitialMotionX = x;
            this.mLastMotionX = x;
            float y2 = ev.getY();
            this.mInitialMotionY = y2;
            this.mLastMotionY = y2;
            this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, 0);
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
            int activePointerId = this.mActivePointerId;
            if (activePointerId != -1) {
                int pointerIndex = MotionEventCompat.findPointerIndex(motionEvent, activePointerId);
                float x2 = MotionEventCompat.getX(motionEvent, pointerIndex);
                float dx = x2 - this.mLastMotionX;
                float xDiff = Math.abs(dx);
                float y3 = MotionEventCompat.getY(motionEvent, pointerIndex);
                float yDiff = Math.abs(y3 - this.mInitialMotionY);
                if (dx == 0.0f || isGutterDrag(this.mLastMotionX, dx)) {
                    y = y3;
                } else {
                    y = y3;
                    if (canScroll(this, false, (int) dx, (int) x2, (int) y3)) {
                        this.mLastMotionX = x2;
                        this.mLastMotionY = y;
                        this.mIsUnableToDrag = true;
                        return false;
                    }
                }
                if (xDiff > ((float) this.mTouchSlop) && 0.5f * xDiff > yDiff) {
                    this.mIsBeingDragged = true;
                    requestParentDisallowInterceptTouchEvent(true);
                    setScrollState(1);
                    this.mLastMotionX = dx > 0.0f ? this.mInitialMotionX + ((float) this.mTouchSlop) : this.mInitialMotionX - ((float) this.mTouchSlop);
                    this.mLastMotionY = y;
                    setScrollingCacheEnabled(true);
                } else if (yDiff > ((float) this.mTouchSlop)) {
                    this.mIsUnableToDrag = true;
                }
                if (this.mIsBeingDragged && performDrag(x2)) {
                    ViewCompat.postInvalidateOnAnimation(this);
                }
            }
        } else if (action == 6) {
            onSecondaryPointerUp(ev);
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        return this.mIsBeingDragged;
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onTouchEvent(MotionEvent ev) {
        MotionEvent motionEvent = ev;
        if (this.mFakeDragging) {
            return true;
        }
        if ((ev.getAction() == 0 && ev.getEdgeFlags() != 0) || this.mAdapter == null || this.mAdapter.getCount() == 0) {
            return false;
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(motionEvent);
        int action = ev.getAction();
        boolean needsInvalidate = false;
        switch (action & 255) {
            case 0:
                this.mScroller.abortAnimation();
                this.mPopulatePending = false;
                populate();
                float x = ev.getX();
                this.mInitialMotionX = x;
                this.mLastMotionX = x;
                float y = ev.getY();
                this.mInitialMotionY = y;
                this.mLastMotionY = y;
                this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, 0);
                break;
            case 1:
                if (this.mIsBeingDragged) {
                    VelocityTracker velocityTracker = this.mVelocityTracker;
                    velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
                    int initialVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
                    this.mPopulatePending = true;
                    int width = getClientWidth();
                    int scrollX = getScrollX();
                    ItemInfo ii = infoForCurrentScrollPosition();
                    setCurrentItemInternal(determineTargetPage(ii.position, ((((float) scrollX) / ((float) width)) - ii.offset) / ii.widthFactor, initialVelocity, (int) (MotionEventCompat.getX(motionEvent, MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId)) - this.mInitialMotionX)), true, true, initialVelocity);
                    this.mActivePointerId = -1;
                    endDrag();
                    int i = action;
                    needsInvalidate = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
            case 2:
                if (!this.mIsBeingDragged) {
                    int pointerIndex = MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId);
                    float x2 = MotionEventCompat.getX(motionEvent, pointerIndex);
                    float xDiff = Math.abs(x2 - this.mLastMotionX);
                    float y2 = MotionEventCompat.getY(motionEvent, pointerIndex);
                    float yDiff = Math.abs(y2 - this.mLastMotionY);
                    if (xDiff > ((float) this.mTouchSlop) && xDiff > yDiff) {
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
                if (this.mIsBeingDragged != 0) {
                    needsInvalidate = false | performDrag(MotionEventCompat.getX(motionEvent, MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId)));
                    break;
                }
                break;
            case 3:
                if (this.mIsBeingDragged) {
                    scrollToItem(this.mCurItem, true, 0, false);
                    this.mActivePointerId = -1;
                    endDrag();
                    needsInvalidate = this.mLeftEdge.onRelease() | this.mRightEdge.onRelease();
                    break;
                }
                break;
            case 5:
                int index = MotionEventCompat.getActionIndex(ev);
                this.mLastMotionX = MotionEventCompat.getX(motionEvent, index);
                this.mActivePointerId = MotionEventCompat.getPointerId(motionEvent, index);
                break;
            case 6:
                onSecondaryPointerUp(ev);
                this.mLastMotionX = MotionEventCompat.getX(motionEvent, MotionEventCompat.findPointerIndex(motionEvent, this.mActivePointerId));
                break;
            default:
                int i2 = action;
                break;
        }
        if (needsInvalidate) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
        return true;
    }

    private void requestParentDisallowInterceptTouchEvent(boolean disallowIntercept) {
        ViewParent parent = getParent();
        if (parent != null) {
            parent.requestDisallowInterceptTouchEvent(disallowIntercept);
        }
    }

    private boolean performDrag(float x) {
        float f = x;
        boolean needsInvalidate = false;
        float deltaX = this.mLastMotionX - f;
        this.mLastMotionX = f;
        float scrollX = ((float) getScrollX()) + deltaX;
        int width = getClientWidth();
        float leftBound = ((float) width) * this.mFirstOffset;
        float rightBound = ((float) width) * this.mLastOffset;
        boolean leftAbsolute = true;
        boolean rightAbsolute = true;
        ItemInfo firstItem = (ItemInfo) this.mItems.get(0);
        ItemInfo lastItem = (ItemInfo) this.mItems.get(this.mItems.size() - 1);
        if (firstItem.position != 0) {
            leftAbsolute = false;
            leftBound = firstItem.offset * ((float) width);
        }
        if (lastItem.position != this.mAdapter.getCount() - 1) {
            rightAbsolute = false;
            rightBound = lastItem.offset * ((float) width);
        }
        if (scrollX < leftBound) {
            if (leftAbsolute) {
                needsInvalidate = this.mLeftEdge.onPull(Math.abs(leftBound - scrollX) / ((float) width));
            }
            scrollX = leftBound;
        } else if (scrollX > rightBound) {
            if (rightAbsolute) {
                needsInvalidate = this.mRightEdge.onPull(Math.abs(scrollX - rightBound) / ((float) width));
            }
            scrollX = rightBound;
        }
        this.mLastMotionX += scrollX - ((float) ((int) scrollX));
        scrollTo((int) scrollX, getScrollY());
        pageScrolled((int) scrollX);
        return needsInvalidate;
    }

    private ItemInfo infoForCurrentScrollPosition() {
        int width = getClientWidth();
        float marginOffset = 0.0f;
        float scrollOffset = width > 0 ? ((float) getScrollX()) / ((float) width) : 0.0f;
        if (width > 0) {
            marginOffset = ((float) this.mPageMargin) / ((float) width);
        }
        int lastPos = -1;
        float lastOffset = 0.0f;
        float lastWidth = 0.0f;
        boolean first = true;
        ItemInfo lastItem = null;
        int i = 0;
        while (i < this.mItems.size()) {
            ItemInfo ii = (ItemInfo) this.mItems.get(i);
            if (!first && ii.position != lastPos + 1) {
                ii = this.mTempItem;
                ii.offset = lastOffset + lastWidth + marginOffset;
                ii.position = lastPos + 1;
                ii.widthFactor = this.mAdapter.getPageWidth(ii.position);
                i--;
            }
            float offset = ii.offset;
            float leftBound = offset;
            float rightBound = ii.widthFactor + offset + marginOffset;
            if (!first && scrollOffset < leftBound) {
                return lastItem;
            }
            if (scrollOffset < rightBound || i == this.mItems.size() - 1) {
                return ii;
            }
            first = false;
            lastPos = ii.position;
            lastOffset = offset;
            lastWidth = ii.widthFactor;
            lastItem = ii;
            i++;
        }
        return lastItem;
    }

    private int determineTargetPage(int currentPage, float pageOffset, int velocity, int deltaX) {
        int targetPage;
        if (Math.abs(deltaX) <= this.mFlingDistance || Math.abs(velocity) <= this.mMinimumVelocity) {
            targetPage = (int) (((float) currentPage) + pageOffset + (currentPage >= this.mCurItem ? 0.4f : 0.6f));
        } else {
            targetPage = velocity > 0 ? currentPage : currentPage + 1;
        }
        if (this.mItems.size() <= 0) {
            return targetPage;
        }
        return Math.max(((ItemInfo) this.mItems.get(0)).position, Math.min(targetPage, ((ItemInfo) this.mItems.get(this.mItems.size() - 1)).position));
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        boolean needsInvalidate = false;
        int overScrollMode = ViewCompat.getOverScrollMode(this);
        if (overScrollMode == 0 || (overScrollMode == 1 && this.mAdapter != null && this.mAdapter.getCount() > 1)) {
            if (!this.mLeftEdge.isFinished()) {
                int restoreCount = canvas.save();
                int height = (getHeight() - getPaddingTop()) - getPaddingBottom();
                int width = getWidth();
                canvas.rotate(270.0f);
                canvas.translate((float) ((-height) + getPaddingTop()), this.mFirstOffset * ((float) width));
                this.mLeftEdge.setSize(height, width);
                needsInvalidate = false | this.mLeftEdge.draw(canvas);
                canvas.restoreToCount(restoreCount);
            }
            if (!this.mRightEdge.isFinished()) {
                int restoreCount2 = canvas.save();
                int width2 = getWidth();
                int height2 = (getHeight() - getPaddingTop()) - getPaddingBottom();
                canvas.rotate(90.0f);
                canvas.translate((float) (-getPaddingTop()), (-(this.mLastOffset + 1.0f)) * ((float) width2));
                this.mRightEdge.setSize(height2, width2);
                needsInvalidate |= this.mRightEdge.draw(canvas);
                canvas.restoreToCount(restoreCount2);
            }
        } else {
            this.mLeftEdge.finish();
            this.mRightEdge.finish();
        }
        if (needsInvalidate) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float offset;
        float marginOffset;
        super.onDraw(canvas);
        if (this.mPageMargin > 0 && this.mMarginDrawable != null && this.mItems.size() > 0 && this.mAdapter != null) {
            int scrollX = getScrollX();
            int width = getWidth();
            float marginOffset2 = ((float) this.mPageMargin) / ((float) width);
            ItemInfo ii = (ItemInfo) this.mItems.get(0);
            float offset2 = ii.offset;
            int itemCount = this.mItems.size();
            int firstPos = ii.position;
            int lastPos = ((ItemInfo) this.mItems.get(itemCount - 1)).position;
            float offset3 = offset2;
            int itemIndex = 0;
            int pos = firstPos;
            while (pos < lastPos) {
                while (pos > ii.position && itemIndex < itemCount) {
                    itemIndex++;
                    ii = (ItemInfo) this.mItems.get(itemIndex);
                }
                if (pos == ii.position) {
                    offset3 = ii.offset + ii.widthFactor + marginOffset2;
                    offset = (ii.offset + ii.widthFactor) * ((float) width);
                } else {
                    float widthFactor = this.mAdapter.getPageWidth(pos);
                    offset = (offset3 + widthFactor) * ((float) width);
                    offset3 += widthFactor + marginOffset2;
                }
                if (((float) this.mPageMargin) + offset > ((float) scrollX)) {
                    marginOffset = marginOffset2;
                    this.mMarginDrawable.setBounds((int) offset, this.mTopPageBounds, (int) (((float) this.mPageMargin) + offset + 0.5f), this.mBottomPageBounds);
                    this.mMarginDrawable.draw(canvas);
                } else {
                    Canvas canvas2 = canvas;
                    marginOffset = marginOffset2;
                }
                if (offset <= ((float) (scrollX + width))) {
                    pos++;
                    marginOffset2 = marginOffset;
                } else {
                    return;
                }
            }
        }
        Canvas canvas3 = canvas;
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
        long time = SystemClock.uptimeMillis();
        MotionEvent ev = MotionEvent.obtain(time, time, 0, 0.0f, 0.0f, 0);
        this.mVelocityTracker.addMovement(ev);
        ev.recycle();
        this.mFakeDragBeginTime = time;
        return true;
    }

    public void endFakeDrag() {
        if (this.mFakeDragging) {
            VelocityTracker velocityTracker = this.mVelocityTracker;
            velocityTracker.computeCurrentVelocity(1000, (float) this.mMaximumVelocity);
            int initialVelocity = (int) VelocityTrackerCompat.getXVelocity(velocityTracker, this.mActivePointerId);
            this.mPopulatePending = true;
            int width = getClientWidth();
            int scrollX = getScrollX();
            ItemInfo ii = infoForCurrentScrollPosition();
            setCurrentItemInternal(determineTargetPage(ii.position, ((((float) scrollX) / ((float) width)) - ii.offset) / ii.widthFactor, initialVelocity, (int) (this.mLastMotionX - this.mInitialMotionX)), true, true, initialVelocity);
            endDrag();
            this.mFakeDragging = false;
            return;
        }
        throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }

    public void fakeDragBy(float xOffset) {
        if (this.mFakeDragging) {
            this.mLastMotionX += xOffset;
            float scrollX = ((float) getScrollX()) - xOffset;
            int width = getClientWidth();
            float leftBound = ((float) width) * this.mFirstOffset;
            float rightBound = ((float) width) * this.mLastOffset;
            ItemInfo firstItem = (ItemInfo) this.mItems.get(0);
            ItemInfo lastItem = (ItemInfo) this.mItems.get(this.mItems.size() - 1);
            if (firstItem.position != 0) {
                leftBound = firstItem.offset * ((float) width);
            }
            if (lastItem.position != this.mAdapter.getCount() - 1) {
                rightBound = lastItem.offset * ((float) width);
            }
            if (scrollX < leftBound) {
                scrollX = leftBound;
            } else if (scrollX > rightBound) {
                scrollX = rightBound;
            }
            this.mLastMotionX += scrollX - ((float) ((int) scrollX));
            scrollTo((int) scrollX, getScrollY());
            pageScrolled((int) scrollX);
            MotionEvent ev = MotionEvent.obtain(this.mFakeDragBeginTime, SystemClock.uptimeMillis(), 2, this.mLastMotionX, 0.0f, 0);
            this.mVelocityTracker.addMovement(ev);
            ev.recycle();
            return;
        }
        throw new IllegalStateException("No fake drag in progress. Call beginFakeDrag first.");
    }

    public boolean isFakeDragging() {
        return this.mFakeDragging;
    }

    private void onSecondaryPointerUp(MotionEvent ev) {
        int pointerIndex = MotionEventCompat.getActionIndex(ev);
        if (MotionEventCompat.getPointerId(ev, pointerIndex) == this.mActivePointerId) {
            int newPointerIndex = pointerIndex == 0 ? 1 : 0;
            this.mLastMotionX = MotionEventCompat.getX(ev, newPointerIndex);
            this.mActivePointerId = MotionEventCompat.getPointerId(ev, newPointerIndex);
            if (this.mVelocityTracker != null) {
                this.mVelocityTracker.clear();
            }
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

    private void setScrollingCacheEnabled(boolean enabled) {
        if (this.mScrollingCacheEnabled != enabled) {
            this.mScrollingCacheEnabled = enabled;
        }
    }

    public boolean canScrollHorizontally(int direction) {
        boolean z = false;
        if (this.mAdapter == null) {
            return false;
        }
        int width = getClientWidth();
        int scrollX = getScrollX();
        if (direction < 0) {
            if (scrollX > ((int) (((float) width) * this.mFirstOffset))) {
                z = true;
            }
            return z;
        } else if (direction <= 0) {
            return false;
        } else {
            if (scrollX < ((int) (((float) width) * this.mLastOffset))) {
                z = true;
            }
            return z;
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0065, code lost:
        if (android.support.v4.view.ViewCompat.canScrollHorizontally(r0, -r17) != false) goto L_0x006b;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean canScroll(View v, boolean checkV, int dx, int x, int y) {
        View view = v;
        boolean z = true;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            int scrollX = view.getScrollX();
            int scrollY = view.getScrollY();
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (x + scrollX >= child.getLeft() && x + scrollX < child.getRight() && y + scrollY >= child.getTop() && y + scrollY < child.getBottom()) {
                    if (canScroll(child, true, dx, (x + scrollX) - child.getLeft(), (y + scrollY) - child.getTop())) {
                        return true;
                    }
                }
            }
        }
        if (!checkV) {
            int i2 = dx;
        }
        z = false;
        return z;
    }

    public boolean dispatchKeyEvent(KeyEvent event) {
        return super.dispatchKeyEvent(event) || executeKeyEvent(event);
    }

    public boolean executeKeyEvent(KeyEvent event) {
        if (event.getAction() != 0) {
            return false;
        }
        int keyCode = event.getKeyCode();
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
            if (KeyEventCompat.hasNoModifiers(event)) {
                return arrowScroll(2);
            }
            if (KeyEventCompat.hasModifiers(event, 1)) {
                return arrowScroll(1);
            }
            return false;
        }
    }

    public boolean arrowScroll(int direction) {
        View currentFocused = findFocus();
        if (currentFocused == this) {
            currentFocused = null;
        } else if (currentFocused != null) {
            boolean isChild = false;
            ViewParent parent = currentFocused.getParent();
            while (true) {
                if (!(parent instanceof ViewGroup)) {
                    break;
                } else if (parent == this) {
                    isChild = true;
                    break;
                } else {
                    parent = parent.getParent();
                }
            }
            if (!isChild) {
                StringBuilder sb = new StringBuilder();
                sb.append(currentFocused.getClass().getSimpleName());
                for (ViewParent parent2 = currentFocused.getParent(); parent2 instanceof ViewGroup; parent2 = parent2.getParent()) {
                    sb.append(" => ");
                    sb.append(parent2.getClass().getSimpleName());
                }
                String str = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("arrowScroll tried to find focus based on non-child current focused view ");
                sb2.append(sb.toString());
                Log.e(str, sb2.toString());
                currentFocused = null;
            }
        }
        boolean handled = false;
        View nextFocused = FocusFinder.getInstance().findNextFocus(this, currentFocused, direction);
        if (nextFocused == null || nextFocused == currentFocused) {
            if (direction == 17 || direction == 1) {
                handled = pageLeft();
            } else if (direction == 66 || direction == 2) {
                handled = pageRight();
            }
        } else if (direction == 17) {
            handled = (currentFocused == null || getChildRectInPagerCoordinates(this.mTempRect, nextFocused).left < getChildRectInPagerCoordinates(this.mTempRect, currentFocused).left) ? nextFocused.requestFocus() : pageLeft();
        } else if (direction == 66) {
            handled = (currentFocused == null || getChildRectInPagerCoordinates(this.mTempRect, nextFocused).left > getChildRectInPagerCoordinates(this.mTempRect, currentFocused).left) ? nextFocused.requestFocus() : pageRight();
        }
        if (handled) {
            playSoundEffect(SoundEffectConstants.getContantForFocusDirection(direction));
        }
        return handled;
    }

    private Rect getChildRectInPagerCoordinates(Rect outRect, View child) {
        if (outRect == null) {
            outRect = new Rect();
        }
        if (child == null) {
            outRect.set(0, 0, 0, 0);
            return outRect;
        }
        outRect.left = child.getLeft();
        outRect.right = child.getRight();
        outRect.top = child.getTop();
        outRect.bottom = child.getBottom();
        ViewParent parent = child.getParent();
        while ((parent instanceof ViewGroup) && parent != this) {
            ViewGroup group = (ViewGroup) parent;
            outRect.left += group.getLeft();
            outRect.right += group.getRight();
            outRect.top += group.getTop();
            outRect.bottom += group.getBottom();
            parent = group.getParent();
        }
        return outRect;
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

    public void addFocusables(ArrayList<View> views, int direction, int focusableMode) {
        int focusableCount = views.size();
        int descendantFocusability = getDescendantFocusability();
        if (descendantFocusability != 393216) {
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == 0) {
                    ItemInfo ii = infoForChild(child);
                    if (ii != null && ii.position == this.mCurItem) {
                        child.addFocusables(views, direction, focusableMode);
                    }
                }
            }
        }
        if ((descendantFocusability == 262144 && focusableCount != views.size()) || !isFocusable()) {
            return;
        }
        if (((focusableMode & 1) != 1 || !isInTouchMode() || isFocusableInTouchMode()) && views != null) {
            views.add(this);
        }
    }

    public void addTouchables(ArrayList<View> views) {
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0) {
                ItemInfo ii = infoForChild(child);
                if (ii != null && ii.position == this.mCurItem) {
                    child.addTouchables(views);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean onRequestFocusInDescendants(int direction, Rect previouslyFocusedRect) {
        int end;
        int increment;
        int index;
        int count = getChildCount();
        if ((direction & 2) != 0) {
            index = 0;
            increment = 1;
            end = count;
        } else {
            index = count - 1;
            increment = -1;
            end = -1;
        }
        for (int i = index; i != end; i += increment) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0) {
                ItemInfo ii = infoForChild(child);
                if (ii != null && ii.position == this.mCurItem && child.requestFocus(direction, previouslyFocusedRect)) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        if (event.getEventType() == 4096) {
            return super.dispatchPopulateAccessibilityEvent(event);
        }
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() == 0) {
                ItemInfo ii = infoForChild(child);
                if (ii != null && ii.position == this.mCurItem && child.dispatchPopulateAccessibilityEvent(event)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams();
    }

    /* access modifiers changed from: protected */
    public android.view.ViewGroup.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams p) {
        return generateDefaultLayoutParams();
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(android.view.ViewGroup.LayoutParams p) {
        return (p instanceof LayoutParams) && super.checkLayoutParams(p);
    }

    public android.view.ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }
}
