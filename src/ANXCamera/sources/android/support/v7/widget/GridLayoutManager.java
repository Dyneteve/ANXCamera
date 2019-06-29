package android.support.v7.widget;

import android.content.Context;
import android.graphics.Rect;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat.CollectionItemInfoCompat;
import android.support.v7.widget.RecyclerView.LayoutManager.LayoutPrefetchRegistry;
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
        int mSpanIndex = -1;
        int mSpanSize = 0;

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
            int size = this.mSpanIndexCache.size() - 1;
            int i2 = 0;
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
            int spanSize = getSpanSize(i);
            int i3 = 0;
            int i4 = 0;
            for (int i5 = 0; i5 < i; i5++) {
                int spanSize2 = getSpanSize(i5);
                i3 += spanSize2;
                if (i3 == i2) {
                    i4++;
                    i3 = 0;
                } else if (i3 > i2) {
                    i4++;
                    i3 = spanSize2;
                }
            }
            return i3 + spanSize > i2 ? i4 + 1 : i4;
        }

        /* JADX WARNING: Removed duplicated region for block: B:12:0x002e  */
        /* JADX WARNING: Removed duplicated region for block: B:20:0x0042 A[RETURN] */
        /* JADX WARNING: Removed duplicated region for block: B:21:0x0043 A[RETURN] */
        public int getSpanIndex(int i, int i2) {
            int i3;
            int i4;
            int spanSize = getSpanSize(i);
            if (spanSize == i2) {
                return 0;
            }
            if (this.mCacheSpanIndices && this.mSpanIndexCache.size() > 0) {
                int findReferenceIndexFromCache = findReferenceIndexFromCache(i);
                if (findReferenceIndexFromCache >= 0) {
                    i3 = this.mSpanIndexCache.get(findReferenceIndexFromCache) + getSpanSize(findReferenceIndexFromCache);
                    i4 = findReferenceIndexFromCache + 1;
                    while (i4 < i) {
                        int spanSize2 = getSpanSize(i4);
                        int i5 = i3 + spanSize2;
                        if (i5 == i2) {
                            i5 = 0;
                        } else if (i5 > i2) {
                            i5 = spanSize2;
                        }
                        i4++;
                    }
                    if (spanSize + i3 > i2) {
                        return i3;
                    }
                    return 0;
                }
            }
            i4 = 0;
            i3 = 0;
            while (i4 < i) {
            }
            if (spanSize + i3 > i2) {
            }
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
        int i5 = -1;
        int i6 = 0;
        if (z) {
            i3 = 1;
            i5 = i;
            i4 = 0;
        } else {
            i4 = i - 1;
            i3 = -1;
        }
        while (i4 != i5) {
            View view = this.mSet[i4];
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.mSpanSize = getSpanSize(recycler, state, getPosition(view));
            layoutParams.mSpanIndex = i6;
            i6 += layoutParams.mSpanSize;
            i4 += i3;
        }
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
        this.mCachedBorders = calculateItemBorders(this.mCachedBorders, this.mSpanCount, i);
    }

    static int[] calculateItemBorders(int[] iArr, int i, int i2) {
        int i3;
        if (!(iArr != null && iArr.length == i + 1 && iArr[iArr.length - 1] == i2)) {
            iArr = new int[(i + 1)];
        }
        int i4 = 0;
        iArr[0] = 0;
        int i5 = i2 / i;
        int i6 = i2 % i;
        int i7 = 0;
        for (int i8 = 1; i8 <= i; i8++) {
            i4 += i6;
            if (i4 <= 0 || i - i4 >= i6) {
                i3 = i5;
            } else {
                i3 = i5 + 1;
                i4 -= i;
            }
            i7 += i3;
            iArr[i8] = i7;
        }
        return iArr;
    }

    private void clearPreLayoutSpanMappingCache() {
        this.mPreLayoutSpanSizeCache.clear();
        this.mPreLayoutSpanIndexCache.clear();
    }

    private void ensureAnchorIsInCorrectSpan(Recycler recycler, State state, AnchorInfo anchorInfo, int i) {
        boolean z = i == 1;
        int spanIndex = getSpanIndex(recycler, state, anchorInfo.mPosition);
        if (z) {
            while (spanIndex > 0 && anchorInfo.mPosition > 0) {
                anchorInfo.mPosition--;
                spanIndex = getSpanIndex(recycler, state, anchorInfo.mPosition);
            }
            return;
        }
        int itemCount = state.getItemCount() - 1;
        int i2 = anchorInfo.mPosition;
        while (i2 < itemCount) {
            int i3 = i2 + 1;
            int spanIndex2 = getSpanIndex(recycler, state, i3);
            if (spanIndex2 <= spanIndex) {
                break;
            }
            i2 = i3;
            spanIndex = spanIndex2;
        }
        anchorInfo.mPosition = i2;
    }

    private void ensureViewSet() {
        if (this.mSet == null || this.mSet.length != this.mSpanCount) {
            this.mSet = new View[this.mSpanCount];
        }
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

    private void guessMeasurement(float f, int i) {
        calculateItemBorders(Math.max(Math.round(f * ((float) this.mSpanCount)), i));
    }

    private void measureChild(View view, int i, boolean z) {
        int i2;
        int i3;
        LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
        Rect rect = layoutParams.mDecorInsets;
        int i4 = rect.top + rect.bottom + layoutParams.topMargin + layoutParams.bottomMargin;
        int i5 = rect.left + rect.right + layoutParams.leftMargin + layoutParams.rightMargin;
        int spaceForSpanRange = getSpaceForSpanRange(layoutParams.mSpanIndex, layoutParams.mSpanSize);
        if (this.mOrientation == 1) {
            i2 = getChildMeasureSpec(spaceForSpanRange, i, i5, layoutParams.width, false);
            i3 = getChildMeasureSpec(this.mOrientationHelper.getTotalSpace(), getHeightMode(), i4, layoutParams.height, true);
        } else {
            int childMeasureSpec = getChildMeasureSpec(spaceForSpanRange, i, i4, layoutParams.height, false);
            int childMeasureSpec2 = getChildMeasureSpec(this.mOrientationHelper.getTotalSpace(), getWidthMode(), i5, layoutParams.width, true);
            i3 = childMeasureSpec;
            i2 = childMeasureSpec2;
        }
        measureChildWithDecorationsAndMargin(view, i2, i3, z);
    }

    private void measureChildWithDecorationsAndMargin(View view, int i, int i2, boolean z) {
        android.support.v7.widget.RecyclerView.LayoutParams layoutParams = (android.support.v7.widget.RecyclerView.LayoutParams) view.getLayoutParams();
        if (z ? shouldReMeasureChild(view, i, i2, layoutParams) : shouldMeasureChild(view, i, i2, layoutParams)) {
            view.measure(i, i2);
        }
    }

    private void updateMeasurements() {
        calculateItemBorders(getOrientation() == 1 ? (getWidth() - getPaddingRight()) - getPaddingLeft() : (getHeight() - getPaddingBottom()) - getPaddingTop());
    }

    public boolean checkLayoutParams(android.support.v7.widget.RecyclerView.LayoutParams layoutParams) {
        return layoutParams instanceof LayoutParams;
    }

    /* access modifiers changed from: 0000 */
    public void collectPrefetchPositionsForLayoutState(State state, LayoutState layoutState, LayoutPrefetchRegistry layoutPrefetchRegistry) {
        int i = this.mSpanCount;
        for (int i2 = 0; i2 < this.mSpanCount && layoutState.hasMore(state) && i > 0; i2++) {
            int i3 = layoutState.mCurrentPosition;
            layoutPrefetchRegistry.addPosition(i3, Math.max(0, layoutState.mScrollingOffset));
            i -= this.mSpanSizeLookup.getSpanSize(i3);
            layoutState.mCurrentPosition += layoutState.mItemDirection;
        }
    }

    /* access modifiers changed from: 0000 */
    public View findReferenceChild(Recycler recycler, State state, int i, int i2, int i3) {
        ensureLayoutState();
        int startAfterPadding = this.mOrientationHelper.getStartAfterPadding();
        int endAfterPadding = this.mOrientationHelper.getEndAfterPadding();
        int i4 = i2 > i ? 1 : -1;
        View view = null;
        View view2 = null;
        while (i != i2) {
            View childAt = getChildAt(i);
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
            i += i4;
        }
        if (view == null) {
            view = view2;
        }
        return view;
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateDefaultLayoutParams() {
        return this.mOrientation == 0 ? new LayoutParams(-2, -1) : new LayoutParams(-1, -2);
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
        return getSpanGroupIndex(recycler, state, state.getItemCount() - 1) + 1;
    }

    public int getRowCountForAccessibility(Recycler recycler, State state) {
        if (this.mOrientation == 0) {
            return this.mSpanCount;
        }
        if (state.getItemCount() < 1) {
            return 0;
        }
        return getSpanGroupIndex(recycler, state, state.getItemCount() - 1) + 1;
    }

    /* access modifiers changed from: 0000 */
    public int getSpaceForSpanRange(int i, int i2) {
        return (this.mOrientation != 1 || !isLayoutRTL()) ? this.mCachedBorders[i2 + i] - this.mCachedBorders[i] : this.mCachedBorders[this.mSpanCount - i] - this.mCachedBorders[(this.mSpanCount - i) - i2];
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
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        boolean z;
        Recycler recycler2 = recycler;
        State state2 = state;
        LayoutState layoutState2 = layoutState;
        LayoutChunkResult layoutChunkResult2 = layoutChunkResult;
        int modeInOther = this.mOrientationHelper.getModeInOther();
        boolean z2 = modeInOther != 1073741824;
        int i9 = getChildCount() > 0 ? this.mCachedBorders[this.mSpanCount] : 0;
        if (z2) {
            updateMeasurements();
        }
        boolean z3 = layoutState2.mItemDirection == 1;
        int i10 = this.mSpanCount;
        if (!z3) {
            i10 = getSpanIndex(recycler2, state2, layoutState2.mCurrentPosition) + getSpanSize(recycler2, state2, layoutState2.mCurrentPosition);
        }
        int i11 = 0;
        int i12 = 0;
        while (i12 < this.mSpanCount && layoutState2.hasMore(state2) && i10 > 0) {
            int i13 = layoutState2.mCurrentPosition;
            int spanSize = getSpanSize(recycler2, state2, i13);
            if (spanSize <= this.mSpanCount) {
                i10 -= spanSize;
                if (i10 < 0) {
                    break;
                }
                View next = layoutState2.next(recycler2);
                if (next == null) {
                    break;
                }
                i11 += spanSize;
                this.mSet[i12] = next;
                i12++;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Item at position ");
                sb.append(i13);
                sb.append(" requires ");
                sb.append(spanSize);
                sb.append(" spans but GridLayoutManager has only ");
                sb.append(this.mSpanCount);
                sb.append(" spans.");
                throw new IllegalArgumentException(sb.toString());
            }
        }
        if (i12 == 0) {
            layoutChunkResult2.mFinished = true;
            return;
        }
        float f = 0.0f;
        int i14 = i12;
        assignSpans(recycler2, state2, i12, i11, z3);
        int i15 = 0;
        for (int i16 = 0; i16 < i14; i16++) {
            View view = this.mSet[i16];
            if (layoutState2.mScrapList != null) {
                z = false;
                if (z3) {
                    addDisappearingView(view);
                } else {
                    addDisappearingView(view, 0);
                }
            } else if (z3) {
                addView(view);
                z = false;
            } else {
                z = false;
                addView(view, 0);
            }
            calculateItemDecorationsForChild(view, this.mDecorInsets);
            measureChild(view, modeInOther, z);
            int decoratedMeasurement = this.mOrientationHelper.getDecoratedMeasurement(view);
            if (decoratedMeasurement > i15) {
                i15 = decoratedMeasurement;
            }
            float decoratedMeasurementInOther = (1.0f * ((float) this.mOrientationHelper.getDecoratedMeasurementInOther(view))) / ((float) ((LayoutParams) view.getLayoutParams()).mSpanSize);
            if (decoratedMeasurementInOther > f) {
                f = decoratedMeasurementInOther;
            }
        }
        if (z2) {
            guessMeasurement(f, i9);
            i15 = 0;
            for (int i17 = 0; i17 < i14; i17++) {
                View view2 = this.mSet[i17];
                measureChild(view2, 1073741824, true);
                int decoratedMeasurement2 = this.mOrientationHelper.getDecoratedMeasurement(view2);
                if (decoratedMeasurement2 > i15) {
                    i15 = decoratedMeasurement2;
                }
            }
        }
        for (int i18 = 0; i18 < i14; i18++) {
            View view3 = this.mSet[i18];
            if (this.mOrientationHelper.getDecoratedMeasurement(view3) != i15) {
                LayoutParams layoutParams = (LayoutParams) view3.getLayoutParams();
                Rect rect = layoutParams.mDecorInsets;
                int i19 = rect.top + rect.bottom + layoutParams.topMargin + layoutParams.bottomMargin;
                int i20 = rect.left + rect.right + layoutParams.leftMargin + layoutParams.rightMargin;
                int spaceForSpanRange = getSpaceForSpanRange(layoutParams.mSpanIndex, layoutParams.mSpanSize);
                if (this.mOrientation == 1) {
                    int childMeasureSpec = getChildMeasureSpec(spaceForSpanRange, 1073741824, i20, layoutParams.width, false);
                    i8 = MeasureSpec.makeMeasureSpec(i15 - i19, 1073741824);
                    i7 = childMeasureSpec;
                } else {
                    i7 = MeasureSpec.makeMeasureSpec(i15 - i20, 1073741824);
                    i8 = getChildMeasureSpec(spaceForSpanRange, 1073741824, i19, layoutParams.height, false);
                }
                measureChildWithDecorationsAndMargin(view3, i7, i8, true);
            }
        }
        int i21 = 0;
        layoutChunkResult2.mConsumed = i15;
        if (this.mOrientation == 1) {
            if (layoutState2.mLayoutDirection == -1) {
                int i22 = layoutState2.mOffset;
                i = i22;
                i2 = i22 - i15;
            } else {
                int i23 = layoutState2.mOffset;
                i2 = i23;
                i = i15 + i23;
            }
            i4 = 0;
            i3 = 0;
        } else if (layoutState2.mLayoutDirection == -1) {
            int i24 = layoutState2.mOffset;
            i2 = 0;
            i = 0;
            int i25 = i24 - i15;
            i3 = i24;
            i4 = i25;
        } else {
            i4 = layoutState2.mOffset;
            i3 = i15 + i4;
            i2 = 0;
            i = 0;
        }
        while (i21 < i14) {
            View view4 = this.mSet[i21];
            LayoutParams layoutParams2 = (LayoutParams) view4.getLayoutParams();
            if (this.mOrientation != 1) {
                i2 = getPaddingTop() + this.mCachedBorders[layoutParams2.mSpanIndex];
                i = this.mOrientationHelper.getDecoratedMeasurementInOther(view4) + i2;
            } else if (isLayoutRTL()) {
                int paddingLeft = getPaddingLeft() + this.mCachedBorders[this.mSpanCount - layoutParams2.mSpanIndex];
                i5 = paddingLeft;
                i6 = paddingLeft - this.mOrientationHelper.getDecoratedMeasurementInOther(view4);
                int i26 = i2;
                int i27 = i;
                layoutDecoratedWithMargins(view4, i6, i26, i5, i27);
                if (!layoutParams2.isItemRemoved() || layoutParams2.isItemChanged()) {
                    layoutChunkResult2.mIgnoreConsumed = true;
                }
                layoutChunkResult2.mFocusable |= view4.hasFocusable();
                i21++;
                i4 = i6;
                i2 = i26;
                i3 = i5;
                i = i27;
            } else {
                i4 = getPaddingLeft() + this.mCachedBorders[layoutParams2.mSpanIndex];
                i3 = this.mOrientationHelper.getDecoratedMeasurementInOther(view4) + i4;
            }
            i6 = i4;
            i5 = i3;
            int i262 = i2;
            int i272 = i;
            layoutDecoratedWithMargins(view4, i6, i262, i5, i272);
            if (!layoutParams2.isItemRemoved()) {
            }
            layoutChunkResult2.mIgnoreConsumed = true;
            layoutChunkResult2.mFocusable |= view4.hasFocusable();
            i21++;
            i4 = i6;
            i2 = i262;
            i3 = i5;
            i = i272;
        }
        Arrays.fill(this.mSet, null);
    }

    /* access modifiers changed from: 0000 */
    public void onAnchorReady(Recycler recycler, State state, AnchorInfo anchorInfo, int i) {
        super.onAnchorReady(recycler, state, anchorInfo, i);
        updateMeasurements();
        if (state.getItemCount() > 0 && !state.isPreLayout()) {
            ensureAnchorIsInCorrectSpan(recycler, state, anchorInfo, i);
        }
        ensureViewSet();
    }

    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00e5, code lost:
        if (r13 == (r2 > r8)) goto L_0x00c0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0103, code lost:
        if (r13 == r10) goto L_0x00c8;
     */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x0112  */
    public View onFocusSearchFailed(View view, int i, Recycler recycler, State state) {
        int i2;
        int i3;
        int i4;
        int i5;
        View view2;
        View view3;
        int i6;
        int i7;
        int i8;
        boolean z;
        Recycler recycler2 = recycler;
        State state2 = state;
        View findContainingItemView = findContainingItemView(view);
        View view4 = null;
        if (findContainingItemView == null) {
            return null;
        }
        LayoutParams layoutParams = (LayoutParams) findContainingItemView.getLayoutParams();
        int i9 = layoutParams.mSpanIndex;
        int i10 = layoutParams.mSpanIndex + layoutParams.mSpanSize;
        if (super.onFocusSearchFailed(view, i, recycler, state) == null) {
            return null;
        }
        if ((convertFocusDirectionToLayoutDirection(i) == 1) != this.mShouldReverseLayout) {
            i4 = getChildCount() - 1;
            i3 = -1;
            i2 = -1;
        } else {
            i3 = getChildCount();
            i2 = 1;
            i4 = 0;
        }
        boolean z2 = this.mOrientation == 1 && isLayoutRTL();
        int spanGroupIndex = getSpanGroupIndex(recycler2, state2, i4);
        int i11 = -1;
        int i12 = -1;
        int i13 = 0;
        int i14 = 0;
        View view5 = null;
        while (i4 != i3) {
            int spanGroupIndex2 = getSpanGroupIndex(recycler2, state2, i4);
            View childAt = getChildAt(i4);
            if (childAt == findContainingItemView) {
                break;
            }
            if (!childAt.hasFocusable() || spanGroupIndex2 == spanGroupIndex) {
                LayoutParams layoutParams2 = (LayoutParams) childAt.getLayoutParams();
                int i15 = layoutParams2.mSpanIndex;
                view2 = findContainingItemView;
                i5 = i3;
                int i16 = layoutParams2.mSpanIndex + layoutParams2.mSpanSize;
                if (childAt.hasFocusable() && i15 == i9 && i16 == i10) {
                    return childAt;
                }
                if ((!childAt.hasFocusable() || view4 != null) && (childAt.hasFocusable() || view5 != null)) {
                    int min = Math.min(i16, i10) - Math.max(i15, i9);
                    if (childAt.hasFocusable()) {
                        if (min <= i13) {
                            if (min == i13) {
                            }
                        }
                    } else if (view4 == null) {
                        i6 = i11;
                        view3 = view5;
                        boolean z3 = false;
                        if (isViewPartiallyVisible(childAt, false, true)) {
                            i8 = i14;
                            if (min <= i8) {
                                if (min == i8) {
                                    i7 = i12;
                                    if (i15 > i7) {
                                        z3 = true;
                                    }
                                }
                                i7 = i12;
                                z = false;
                                if (z) {
                                    if (childAt.hasFocusable()) {
                                        i13 = Math.min(i16, i10) - Math.max(i15, i9);
                                        i14 = i8;
                                        i12 = i7;
                                        view5 = view3;
                                        i11 = layoutParams2.mSpanIndex;
                                        view4 = childAt;
                                    } else {
                                        view5 = childAt;
                                        i14 = Math.min(i16, i10) - Math.max(i15, i9);
                                        i12 = layoutParams2.mSpanIndex;
                                        i11 = i6;
                                    }
                                    i4 += i2;
                                    findContainingItemView = view2;
                                    i3 = i5;
                                    recycler2 = recycler;
                                    state2 = state;
                                }
                            }
                            i7 = i12;
                            z = true;
                            if (z) {
                            }
                        }
                        i8 = i14;
                        i7 = i12;
                        z = false;
                        if (z) {
                        }
                    }
                    i6 = i11;
                    view3 = view5;
                    i8 = i14;
                    i7 = i12;
                    z = false;
                    if (z) {
                    }
                }
                i6 = i11;
                view3 = view5;
                i8 = i14;
                i7 = i12;
                z = true;
                if (z) {
                }
            } else if (view4 != null) {
                break;
            } else {
                view2 = findContainingItemView;
                i6 = i11;
                view3 = view5;
                i5 = i3;
                i8 = i14;
                i7 = i12;
            }
            i14 = i8;
            i12 = i7;
            i11 = i6;
            view5 = view3;
            i4 += i2;
            findContainingItemView = view2;
            i3 = i5;
            recycler2 = recycler;
            state2 = state;
        }
        View view6 = view5;
        if (view4 != null) {
            view6 = view4;
        }
        return view6;
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
            accessibilityNodeInfoCompat.setCollectionItemInfo(CollectionItemInfoCompat.obtain(layoutParams2.getSpanIndex(), layoutParams2.getSpanSize(), spanGroupIndex, 1, this.mSpanCount > 1 && layoutParams2.getSpanSize() == this.mSpanCount, false));
        } else {
            accessibilityNodeInfoCompat.setCollectionItemInfo(CollectionItemInfoCompat.obtain(spanGroupIndex, 1, layoutParams2.getSpanIndex(), layoutParams2.getSpanSize(), this.mSpanCount > 1 && layoutParams2.getSpanSize() == this.mSpanCount, false));
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
    }

    public void onLayoutCompleted(State state) {
        super.onLayoutCompleted(state);
        this.mPendingSpanCountChange = false;
    }

    public int scrollHorizontallyBy(int i, Recycler recycler, State state) {
        updateMeasurements();
        ensureViewSet();
        return super.scrollHorizontallyBy(i, recycler, state);
    }

    public int scrollVerticallyBy(int i, Recycler recycler, State state) {
        updateMeasurements();
        ensureViewSet();
        return super.scrollVerticallyBy(i, recycler, state);
    }

    public void setMeasuredDimension(Rect rect, int i, int i2) {
        int i3;
        int i4;
        if (this.mCachedBorders == null) {
            super.setMeasuredDimension(rect, i, i2);
        }
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int paddingTop = getPaddingTop() + getPaddingBottom();
        if (this.mOrientation == 1) {
            i4 = chooseSize(i2, rect.height() + paddingTop, getMinimumHeight());
            i3 = chooseSize(i, this.mCachedBorders[this.mCachedBorders.length - 1] + paddingLeft, getMinimumWidth());
        } else {
            i3 = chooseSize(i, rect.width() + paddingLeft, getMinimumWidth());
            i4 = chooseSize(i2, this.mCachedBorders[this.mCachedBorders.length - 1] + paddingTop, getMinimumHeight());
        }
        setMeasuredDimension(i3, i4);
    }

    public void setSpanCount(int i) {
        if (i != this.mSpanCount) {
            this.mPendingSpanCountChange = true;
            if (i >= 1) {
                this.mSpanCount = i;
                this.mSpanSizeLookup.invalidateSpanIndexCache();
                requestLayout();
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
