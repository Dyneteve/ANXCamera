package android.support.v7.widget;

import android.content.Context;
import android.graphics.Rect;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionItemInfoCompat;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseIntArray;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup.MarginLayoutParams;
import java.util.Arrays;

public class GridLayoutManager extends LinearLayoutManager {
    private static final boolean DEBUG = false;
    public static final int DEFAULT_SPAN_COUNT = -1;
    static final int MAIN_DIR_SPEC = MeasureSpec.makeMeasureSpec(0, 0);
    private static final String TAG = "GridLayoutManager";
    int[] mCachedBorders;
    final Rect mDecorInsets = new Rect();
    boolean mPendingSpanCountChange = false;
    final SparseIntArray mPreLayoutSpanIndexCache = new SparseIntArray();
    final SparseIntArray mPreLayoutSpanSizeCache = new SparseIntArray();
    View[] mSet;
    int mSpanCount = -1;
    SpanSizeLookup mSpanSizeLookup = new DefaultSpanSizeLookup();

    public static final class DefaultSpanSizeLookup extends SpanSizeLookup {
        public int getSpanIndex(int i, int i2) {
            return i % i2;
        }

        public int getSpanSize(int i) {
            return 1;
        }
    }

    public static class LayoutParams extends android.support.v7.widget.RecyclerView.LayoutParams {
        public static final int INVALID_SPAN_ID = -1;
        /* access modifiers changed from: private */
        public int mSpanIndex = -1;
        /* access modifiers changed from: private */
        public int mSpanSize = 0;

        public LayoutParams(int i, int i2) {
            super(i, i2);
        }

        public LayoutParams(Context context, AttributeSet attributeSet) {
            super(context, attributeSet);
        }

        public LayoutParams(android.support.v7.widget.RecyclerView.LayoutParams layoutParams) {
            super(layoutParams);
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
            super(layoutParams);
        }

        public LayoutParams(MarginLayoutParams marginLayoutParams) {
            super(marginLayoutParams);
        }

        public int getSpanIndex() {
            return this.mSpanIndex;
        }

        public int getSpanSize() {
            return this.mSpanSize;
        }
    }

    public static abstract class SpanSizeLookup {
        private boolean mCacheSpanIndices = false;
        final SparseIntArray mSpanIndexCache = new SparseIntArray();

        /* access modifiers changed from: 0000 */
        public int findReferenceIndexFromCache(int i) {
            int i2 = 0;
            int size = this.mSpanIndexCache.size() - 1;
            while (i2 <= size) {
                int i3 = (i2 + size) >>> 1;
                if (this.mSpanIndexCache.keyAt(i3) < i) {
                    i2 = i3 + 1;
                } else {
                    size = i3 - 1;
                }
            }
            int i4 = i2 - 1;
            if (i4 < 0 || i4 >= this.mSpanIndexCache.size()) {
                return -1;
            }
            return this.mSpanIndexCache.keyAt(i4);
        }

        /* access modifiers changed from: 0000 */
        public int getCachedSpanIndex(int i, int i2) {
            if (!this.mCacheSpanIndices) {
                return getSpanIndex(i, i2);
            }
            int i3 = this.mSpanIndexCache.get(i, -1);
            if (i3 != -1) {
                return i3;
            }
            int spanIndex = getSpanIndex(i, i2);
            this.mSpanIndexCache.put(i, spanIndex);
            return spanIndex;
        }

        public int getSpanGroupIndex(int i, int i2) {
            int i3 = 0;
            int i4 = 0;
            int spanSize = getSpanSize(i);
            for (int i5 = 0; i5 < i; i5++) {
                int spanSize2 = getSpanSize(i5);
                i3 += spanSize2;
                if (i3 == i2) {
                    i3 = 0;
                    i4++;
                } else if (i3 > i2) {
                    i3 = spanSize2;
                    i4++;
                }
            }
            return i3 + spanSize > i2 ? i4 + 1 : i4;
        }

        public int getSpanIndex(int i, int i2) {
            int spanSize = getSpanSize(i);
            if (spanSize == i2) {
                return 0;
            }
            int i3 = 0;
            int i4 = 0;
            if (this.mCacheSpanIndices && this.mSpanIndexCache.size() > 0) {
                int findReferenceIndexFromCache = findReferenceIndexFromCache(i);
                if (findReferenceIndexFromCache >= 0) {
                    i3 = this.mSpanIndexCache.get(findReferenceIndexFromCache) + getSpanSize(findReferenceIndexFromCache);
                    i4 = findReferenceIndexFromCache + 1;
                }
            }
            int i5 = i3;
            for (int i6 = i4; i6 < i; i6++) {
                int spanSize2 = getSpanSize(i6);
                i5 += spanSize2;
                if (i5 == i2) {
                    i5 = 0;
                } else if (i5 > i2) {
                    i5 = spanSize2;
                }
            }
            if (i5 + spanSize <= i2) {
                return i5;
            }
            return 0;
        }

        public abstract int getSpanSize(int i);

        public void invalidateSpanIndexCache() {
            this.mSpanIndexCache.clear();
        }

        public boolean isSpanIndexCacheEnabled() {
            return this.mCacheSpanIndices;
        }

        public void setSpanIndexCacheEnabled(boolean z) {
            this.mCacheSpanIndices = z;
        }
    }

    public GridLayoutManager(Context context, int i) {
        super(context);
        setSpanCount(i);
    }

    public GridLayoutManager(Context context, int i, int i2, boolean z) {
        super(context, i2, z);
        setSpanCount(i);
    }

    public GridLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        setSpanCount(getProperties(context, attributeSet, i, i2).spanCount);
    }

    private void assignSpans(Recycler recycler, State state, int i, int i2, boolean z) {
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        if (z) {
            i4 = 1;
            i3 = i;
            i5 = 0;
        } else {
            i5 = i - 1;
            i3 = -1;
            i4 = -1;
        }
        if (this.mOrientation != 1 || !isLayoutRTL()) {
            i7 = 0;
            i6 = 1;
        } else {
            i7 = this.mSpanCount - 1;
            i6 = -1;
        }
        int i8 = i7;
        for (int i9 = i5; i9 != i3; i9 += i4) {
            View view = this.mSet[i9];
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.mSpanSize = getSpanSize(recycler, state, getPosition(view));
            if (i6 != -1 || layoutParams.mSpanSize <= 1) {
                layoutParams.mSpanIndex = i8;
            } else {
                layoutParams.mSpanIndex = i8 - (layoutParams.mSpanSize - 1);
            }
            i8 += layoutParams.mSpanSize * i6;
        }
        Recycler recycler2 = recycler;
        State state2 = state;
    }

    private void cachePreLayoutSpanMapping() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            LayoutParams layoutParams = (LayoutParams) getChildAt(i).getLayoutParams();
            int viewLayoutPosition = layoutParams.getViewLayoutPosition();
            this.mPreLayoutSpanSizeCache.put(viewLayoutPosition, layoutParams.getSpanSize());
            this.mPreLayoutSpanIndexCache.put(viewLayoutPosition, layoutParams.getSpanIndex());
        }
    }

    private void calculateItemBorders(int i) {
        if (!(this.mCachedBorders != null && this.mCachedBorders.length == this.mSpanCount + 1 && this.mCachedBorders[this.mCachedBorders.length - 1] == i)) {
            this.mCachedBorders = new int[(this.mSpanCount + 1)];
        }
        this.mCachedBorders[0] = 0;
        int i2 = i / this.mSpanCount;
        int i3 = i % this.mSpanCount;
        int i4 = 0;
        int i5 = 0;
        for (int i6 = 1; i6 <= this.mSpanCount; i6++) {
            int i7 = i2;
            i5 += i3;
            if (i5 > 0 && this.mSpanCount - i5 < i3) {
                i7++;
                i5 -= this.mSpanCount;
            }
            i4 += i7;
            this.mCachedBorders[i6] = i4;
        }
    }

    private void clearPreLayoutSpanMappingCache() {
        this.mPreLayoutSpanSizeCache.clear();
        this.mPreLayoutSpanIndexCache.clear();
    }

    private void ensureAnchorIsInFirstSpan(Recycler recycler, State state, AnchorInfo anchorInfo) {
        int spanIndex = getSpanIndex(recycler, state, anchorInfo.mPosition);
        while (spanIndex > 0 && anchorInfo.mPosition > 0) {
            anchorInfo.mPosition--;
            spanIndex = getSpanIndex(recycler, state, anchorInfo.mPosition);
        }
    }

    private int getMainDirSpec(int i) {
        return i < 0 ? MAIN_DIR_SPEC : MeasureSpec.makeMeasureSpec(i, 1073741824);
    }

    private int getSpanGroupIndex(Recycler recycler, State state, int i) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getSpanGroupIndex(i, this.mSpanCount);
        }
        int convertPreLayoutPositionToPostLayout = recycler.convertPreLayoutPositionToPostLayout(i);
        if (convertPreLayoutPositionToPostLayout != -1) {
            return this.mSpanSizeLookup.getSpanGroupIndex(convertPreLayoutPositionToPostLayout, this.mSpanCount);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. ");
        sb.append(i);
        Log.w(str, sb.toString());
        return 0;
    }

    private int getSpanIndex(Recycler recycler, State state, int i) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getCachedSpanIndex(i, this.mSpanCount);
        }
        int i2 = this.mPreLayoutSpanIndexCache.get(i, -1);
        if (i2 != -1) {
            return i2;
        }
        int convertPreLayoutPositionToPostLayout = recycler.convertPreLayoutPositionToPostLayout(i);
        if (convertPreLayoutPositionToPostLayout != -1) {
            return this.mSpanSizeLookup.getCachedSpanIndex(convertPreLayoutPositionToPostLayout, this.mSpanCount);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:");
        sb.append(i);
        Log.w(str, sb.toString());
        return 0;
    }

    private int getSpanSize(Recycler recycler, State state, int i) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getSpanSize(i);
        }
        int i2 = this.mPreLayoutSpanSizeCache.get(i, -1);
        if (i2 != -1) {
            return i2;
        }
        int convertPreLayoutPositionToPostLayout = recycler.convertPreLayoutPositionToPostLayout(i);
        if (convertPreLayoutPositionToPostLayout != -1) {
            return this.mSpanSizeLookup.getSpanSize(convertPreLayoutPositionToPostLayout);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:");
        sb.append(i);
        Log.w(str, sb.toString());
        return 1;
    }

    private void measureChildWithDecorationsAndMargin(View view, int i, int i2, boolean z) {
        calculateItemDecorationsForChild(view, this.mDecorInsets);
        android.support.v7.widget.RecyclerView.LayoutParams layoutParams = (android.support.v7.widget.RecyclerView.LayoutParams) view.getLayoutParams();
        if (z || this.mOrientation == 1) {
            i = updateSpecWithExtra(i, layoutParams.leftMargin + this.mDecorInsets.left, layoutParams.rightMargin + this.mDecorInsets.right);
        }
        if (z || this.mOrientation == 0) {
            i2 = updateSpecWithExtra(i2, layoutParams.topMargin + this.mDecorInsets.top, layoutParams.bottomMargin + this.mDecorInsets.bottom);
        }
        view.measure(i, i2);
    }

    private void updateMeasurements() {
        calculateItemBorders(getOrientation() == 1 ? (getWidth() - getPaddingRight()) - getPaddingLeft() : (getHeight() - getPaddingBottom()) - getPaddingTop());
    }

    private int updateSpecWithExtra(int i, int i2, int i3) {
        if (i2 == 0 && i3 == 0) {
            return i;
        }
        int mode = MeasureSpec.getMode(i);
        return (mode == Integer.MIN_VALUE || mode == 1073741824) ? MeasureSpec.makeMeasureSpec((MeasureSpec.getSize(i) - i2) - i3, mode) : i;
    }

    public boolean checkLayoutParams(android.support.v7.widget.RecyclerView.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    /* access modifiers changed from: 0000 */
    public View findReferenceChild(Recycler recycler, State state, int i, int i2, int i3) {
        ensureLayoutState();
        View view = null;
        int startAfterPadding = this.mOrientationHelper.getStartAfterPadding();
        int endAfterPadding = this.mOrientationHelper.getEndAfterPadding();
        int i4 = i2 > i ? 1 : -1;
        View view2 = null;
        for (int i5 = i; i5 != i2; i5 += i4) {
            View childAt = getChildAt(i5);
            int position = getPosition(childAt);
            if (position >= 0 && position < i3 && getSpanIndex(recycler, state, position) == 0) {
                if (((android.support.v7.widget.RecyclerView.LayoutParams) childAt.getLayoutParams()).isItemRemoved()) {
                    if (view2 == null) {
                        view2 = childAt;
                    }
                } else if (this.mOrientationHelper.getDecoratedStart(childAt) < endAfterPadding && this.mOrientationHelper.getDecoratedEnd(childAt) >= startAfterPadding) {
                    return childAt;
                } else {
                    if (view == null) {
                        view = childAt;
                    }
                }
            }
        }
        return view != null ? view : view2;
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateLayoutParams(Context context, AttributeSet attributeSet) {
        return new LayoutParams(context, attributeSet);
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof MarginLayoutParams ? new LayoutParams((MarginLayoutParams) layoutParams) : new LayoutParams(layoutParams);
    }

    public int getColumnCountForAccessibility(Recycler recycler, State state) {
        if (this.mOrientation == 1) {
            return this.mSpanCount;
        }
        if (state.getItemCount() < 1) {
            return 0;
        }
        return getSpanGroupIndex(recycler, state, state.getItemCount() - 1);
    }

    public int getRowCountForAccessibility(Recycler recycler, State state) {
        if (this.mOrientation == 0) {
            return this.mSpanCount;
        }
        if (state.getItemCount() < 1) {
            return 0;
        }
        return getSpanGroupIndex(recycler, state, state.getItemCount() - 1);
    }

    public int getSpanCount() {
        return this.mSpanCount;
    }

    public SpanSizeLookup getSpanSizeLookup() {
        return this.mSpanSizeLookup;
    }

    /* access modifiers changed from: 0000 */
    public void layoutChunk(Recycler recycler, State state, LayoutState layoutState, LayoutChunkResult layoutChunkResult) {
        int i;
        int i2;
        int i3;
        Recycler recycler2 = recycler;
        State state2 = state;
        LayoutState layoutState2 = layoutState;
        LayoutChunkResult layoutChunkResult2 = layoutChunkResult;
        int i4 = 0;
        boolean z = layoutState2.mItemDirection == 1;
        int i5 = this.mSpanCount;
        if (!z) {
            i5 = getSpanIndex(recycler2, state2, layoutState2.mCurrentPosition) + getSpanSize(recycler2, state2, layoutState2.mCurrentPosition);
        }
        int i6 = 0;
        int i7 = 0;
        while (i6 < this.mSpanCount && layoutState2.hasMore(state2) && i5 > 0) {
            int i8 = layoutState2.mCurrentPosition;
            int spanSize = getSpanSize(recycler2, state2, i8);
            if (spanSize <= this.mSpanCount) {
                i5 -= spanSize;
                if (i5 < 0) {
                    break;
                }
                View next = layoutState2.next(recycler2);
                if (next == null) {
                    break;
                }
                i7 += spanSize;
                this.mSet[i6] = next;
                i6++;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Item at position ");
                sb.append(i8);
                sb.append(" requires ");
                sb.append(spanSize);
                sb.append(" spans but GridLayoutManager has only ");
                sb.append(this.mSpanCount);
                sb.append(" spans.");
                throw new IllegalArgumentException(sb.toString());
            }
        }
        int i9 = i5;
        if (i6 == 0) {
            layoutChunkResult2.mFinished = true;
            return;
        }
        assignSpans(recycler2, state2, i6, i7, z);
        int i10 = 0;
        int i11 = 0;
        while (true) {
            i = 1073741824;
            if (i10 >= i6) {
                break;
            }
            View view = this.mSet[i10];
            if (layoutState2.mScrapList == null) {
                if (z) {
                    addView(view);
                } else {
                    addView(view, i4);
                }
            } else if (z) {
                addDisappearingView(view);
            } else {
                addDisappearingView(view, i4);
            }
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            int makeMeasureSpec = MeasureSpec.makeMeasureSpec(this.mCachedBorders[layoutParams.mSpanIndex + layoutParams.mSpanSize] - this.mCachedBorders[layoutParams.mSpanIndex], 1073741824);
            if (this.mOrientation == 1) {
                i4 = 0;
                measureChildWithDecorationsAndMargin(view, makeMeasureSpec, getMainDirSpec(layoutParams.height), false);
            } else {
                i4 = 0;
                measureChildWithDecorationsAndMargin(view, getMainDirSpec(layoutParams.width), makeMeasureSpec, false);
            }
            int decoratedMeasurement = this.mOrientationHelper.getDecoratedMeasurement(view);
            if (decoratedMeasurement > i11) {
                i11 = decoratedMeasurement;
            }
            i10++;
        }
        int mainDirSpec = getMainDirSpec(i11);
        int i12 = i4;
        while (i12 < i6) {
            View view2 = this.mSet[i12];
            if (this.mOrientationHelper.getDecoratedMeasurement(view2) != i11) {
                LayoutParams layoutParams2 = (LayoutParams) view2.getLayoutParams();
                int makeMeasureSpec2 = MeasureSpec.makeMeasureSpec(this.mCachedBorders[layoutParams2.mSpanIndex + layoutParams2.mSpanSize] - this.mCachedBorders[layoutParams2.mSpanIndex], i);
                if (this.mOrientation == 1) {
                    measureChildWithDecorationsAndMargin(view2, makeMeasureSpec2, mainDirSpec, true);
                } else {
                    measureChildWithDecorationsAndMargin(view2, mainDirSpec, makeMeasureSpec2, true);
                }
            }
            i12++;
            i = 1073741824;
        }
        layoutChunkResult2.mConsumed = i11;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        int i16 = 0;
        if (this.mOrientation == 1) {
            if (layoutState2.mLayoutDirection == -1) {
                i16 = layoutState2.mOffset;
                i15 = i16 - i11;
            } else {
                i15 = layoutState2.mOffset;
                i16 = i15 + i11;
            }
        } else if (layoutState2.mLayoutDirection == -1) {
            i14 = layoutState2.mOffset;
            i13 = i14 - i11;
        } else {
            i13 = layoutState2.mOffset;
            i14 = i13 + i11;
        }
        int i17 = 0;
        while (true) {
            int i18 = i17;
            if (i18 < i6) {
                View view3 = this.mSet[i18];
                LayoutParams layoutParams3 = (LayoutParams) view3.getLayoutParams();
                int i19 = i13;
                int i20 = i14;
                if (this.mOrientation == 1) {
                    int paddingLeft = getPaddingLeft() + this.mCachedBorders[layoutParams3.mSpanIndex];
                    i19 = paddingLeft;
                    i20 = this.mOrientationHelper.getDecoratedMeasurementInOther(view3) + paddingLeft;
                    i3 = i15;
                    i2 = i16;
                } else {
                    int paddingTop = getPaddingTop() + this.mCachedBorders[layoutParams3.mSpanIndex];
                    i3 = paddingTop;
                    i2 = this.mOrientationHelper.getDecoratedMeasurementInOther(view3) + paddingTop;
                }
                int i21 = mainDirSpec;
                int i22 = i11;
                layoutDecorated(view3, i19 + layoutParams3.leftMargin, i3 + layoutParams3.topMargin, i20 - layoutParams3.rightMargin, i2 - layoutParams3.bottomMargin);
                if (layoutParams3.isItemRemoved() || layoutParams3.isItemChanged()) {
                    layoutChunkResult2.mIgnoreConsumed = true;
                }
                layoutChunkResult2.mFocusable |= view3.isFocusable();
                i17 = i18 + 1;
                i15 = i3;
                i16 = i2;
                i11 = i22;
                mainDirSpec = i21;
                i13 = i19;
                i14 = i20;
                Recycler recycler3 = recycler;
            } else {
                int i23 = i13;
                int i24 = i14;
                int i25 = mainDirSpec;
                int i26 = i11;
                Arrays.fill(this.mSet, null);
                return;
            }
        }
    }

    /* access modifiers changed from: 0000 */
    public void onAnchorReady(Recycler recycler, State state, AnchorInfo anchorInfo) {
        super.onAnchorReady(recycler, state, anchorInfo);
        updateMeasurements();
        if (state.getItemCount() > 0 && !state.isPreLayout()) {
            ensureAnchorIsInFirstSpan(recycler, state, anchorInfo);
        }
        if (this.mSet == null || this.mSet.length != this.mSpanCount) {
            this.mSet = new View[this.mSpanCount];
        }
    }

    public void onInitializeAccessibilityNodeInfoForItem(Recycler recycler, State state, View view, AccessibilityNodeInfoCompat accessibilityNodeInfoCompat) {
        android.view.ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof LayoutParams)) {
            super.onInitializeAccessibilityNodeInfoForItem(view, accessibilityNodeInfoCompat);
            return;
        }
        LayoutParams layoutParams2 = (LayoutParams) layoutParams;
        int spanGroupIndex = getSpanGroupIndex(recycler, state, layoutParams2.getViewLayoutPosition());
        if (this.mOrientation == 0) {
            int spanIndex = layoutParams2.getSpanIndex();
            int spanSize = layoutParams2.getSpanSize();
            boolean z = this.mSpanCount > 1 && layoutParams2.getSpanSize() == this.mSpanCount;
            accessibilityNodeInfoCompat.setCollectionItemInfo(CollectionItemInfoCompat.obtain(spanIndex, spanSize, spanGroupIndex, 1, z, false));
        } else {
            int spanIndex2 = layoutParams2.getSpanIndex();
            int spanSize2 = layoutParams2.getSpanSize();
            boolean z2 = this.mSpanCount > 1 && layoutParams2.getSpanSize() == this.mSpanCount;
            accessibilityNodeInfoCompat.setCollectionItemInfo(CollectionItemInfoCompat.obtain(spanGroupIndex, 1, spanIndex2, spanSize2, z2, false));
        }
    }

    public void onItemsAdded(RecyclerView recyclerView, int i, int i2) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsChanged(RecyclerView recyclerView) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsMoved(RecyclerView recyclerView, int i, int i2, int i3) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsRemoved(RecyclerView recyclerView, int i, int i2) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsUpdated(RecyclerView recyclerView, int i, int i2, Object obj) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onLayoutChildren(Recycler recycler, State state) {
        if (state.isPreLayout()) {
            cachePreLayoutSpanMapping();
        }
        super.onLayoutChildren(recycler, state);
        clearPreLayoutSpanMappingCache();
        if (!state.isPreLayout()) {
            this.mPendingSpanCountChange = false;
        }
    }

    public void setSpanCount(int i) {
        if (i != this.mSpanCount) {
            this.mPendingSpanCountChange = true;
            if (i >= 1) {
                this.mSpanCount = i;
                this.mSpanSizeLookup.invalidateSpanIndexCache();
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Span count should be at least 1. Provided ");
            sb.append(i);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public void setSpanSizeLookup(SpanSizeLookup spanSizeLookup) {
        this.mSpanSizeLookup = spanSizeLookup;
    }

    public void setStackFromEnd(boolean z) {
        if (!z) {
            super.setStackFromEnd(false);
            return;
        }
        throw new UnsupportedOperationException("GridLayoutManager does not support stack from end. Consider using reverse layout");
    }

    public boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null && !this.mPendingSpanCountChange;
    }
}
