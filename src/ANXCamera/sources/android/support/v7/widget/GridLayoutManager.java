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
        public int getSpanSize(int position) {
            return 1;
        }

        public int getSpanIndex(int position, int spanCount) {
            return position % spanCount;
        }
    }

    public static class LayoutParams extends android.support.v7.widget.RecyclerView.LayoutParams {
        public static final int INVALID_SPAN_ID = -1;
        /* access modifiers changed from: private */
        public int mSpanIndex = -1;
        /* access modifiers changed from: private */
        public int mSpanSize = 0;

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(android.view.ViewGroup.LayoutParams source) {
            super(source);
        }

        public LayoutParams(android.support.v7.widget.RecyclerView.LayoutParams source) {
            super(source);
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

        public abstract int getSpanSize(int i);

        public void setSpanIndexCacheEnabled(boolean cacheSpanIndices) {
            this.mCacheSpanIndices = cacheSpanIndices;
        }

        public void invalidateSpanIndexCache() {
            this.mSpanIndexCache.clear();
        }

        public boolean isSpanIndexCacheEnabled() {
            return this.mCacheSpanIndices;
        }

        /* access modifiers changed from: 0000 */
        public int getCachedSpanIndex(int position, int spanCount) {
            if (!this.mCacheSpanIndices) {
                return getSpanIndex(position, spanCount);
            }
            int existing = this.mSpanIndexCache.get(position, -1);
            if (existing != -1) {
                return existing;
            }
            int value = getSpanIndex(position, spanCount);
            this.mSpanIndexCache.put(position, value);
            return value;
        }

        public int getSpanIndex(int position, int spanCount) {
            int positionSpanSize = getSpanSize(position);
            if (positionSpanSize == spanCount) {
                return 0;
            }
            int span = 0;
            int startPos = 0;
            if (this.mCacheSpanIndices && this.mSpanIndexCache.size() > 0) {
                int prevKey = findReferenceIndexFromCache(position);
                if (prevKey >= 0) {
                    span = this.mSpanIndexCache.get(prevKey) + getSpanSize(prevKey);
                    startPos = prevKey + 1;
                }
            }
            int span2 = span;
            for (int i = startPos; i < position; i++) {
                int size = getSpanSize(i);
                span2 += size;
                if (span2 == spanCount) {
                    span2 = 0;
                } else if (span2 > spanCount) {
                    span2 = size;
                }
            }
            if (span2 + positionSpanSize <= spanCount) {
                return span2;
            }
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public int findReferenceIndexFromCache(int position) {
            int lo = 0;
            int hi = this.mSpanIndexCache.size() - 1;
            while (lo <= hi) {
                int mid = (lo + hi) >>> 1;
                if (this.mSpanIndexCache.keyAt(mid) < position) {
                    lo = mid + 1;
                } else {
                    hi = mid - 1;
                }
            }
            int index = lo - 1;
            if (index < 0 || index >= this.mSpanIndexCache.size()) {
                return -1;
            }
            return this.mSpanIndexCache.keyAt(index);
        }

        public int getSpanGroupIndex(int adapterPosition, int spanCount) {
            int span = 0;
            int group = 0;
            int positionSpanSize = getSpanSize(adapterPosition);
            for (int i = 0; i < adapterPosition; i++) {
                int size = getSpanSize(i);
                span += size;
                if (span == spanCount) {
                    span = 0;
                    group++;
                } else if (span > spanCount) {
                    span = size;
                    group++;
                }
            }
            if (span + positionSpanSize > spanCount) {
                return group + 1;
            }
            return group;
        }
    }

    public GridLayoutManager(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        setSpanCount(getProperties(context, attrs, defStyleAttr, defStyleRes).spanCount);
    }

    public GridLayoutManager(Context context, int spanCount) {
        super(context);
        setSpanCount(spanCount);
    }

    public GridLayoutManager(Context context, int spanCount, int orientation, boolean reverseLayout) {
        super(context, orientation, reverseLayout);
        setSpanCount(spanCount);
    }

    public void setStackFromEnd(boolean stackFromEnd) {
        if (!stackFromEnd) {
            super.setStackFromEnd(false);
            return;
        }
        throw new UnsupportedOperationException("GridLayoutManager does not support stack from end. Consider using reverse layout");
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

    public int getColumnCountForAccessibility(Recycler recycler, State state) {
        if (this.mOrientation == 1) {
            return this.mSpanCount;
        }
        if (state.getItemCount() < 1) {
            return 0;
        }
        return getSpanGroupIndex(recycler, state, state.getItemCount() - 1);
    }

    public void onInitializeAccessibilityNodeInfoForItem(Recycler recycler, State state, View host, AccessibilityNodeInfoCompat info) {
        android.view.ViewGroup.LayoutParams lp = host.getLayoutParams();
        if (!(lp instanceof LayoutParams)) {
            super.onInitializeAccessibilityNodeInfoForItem(host, info);
            return;
        }
        LayoutParams glp = (LayoutParams) lp;
        int spanGroupIndex = getSpanGroupIndex(recycler, state, glp.getViewLayoutPosition());
        if (this.mOrientation == 0) {
            int spanIndex = glp.getSpanIndex();
            int spanSize = glp.getSpanSize();
            boolean z = this.mSpanCount > 1 && glp.getSpanSize() == this.mSpanCount;
            info.setCollectionItemInfo(CollectionItemInfoCompat.obtain(spanIndex, spanSize, spanGroupIndex, 1, z, false));
        } else {
            int spanIndex2 = glp.getSpanIndex();
            int spanSize2 = glp.getSpanSize();
            boolean z2 = this.mSpanCount > 1 && glp.getSpanSize() == this.mSpanCount;
            info.setCollectionItemInfo(CollectionItemInfoCompat.obtain(spanGroupIndex, 1, spanIndex2, spanSize2, z2, false));
        }
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

    private void clearPreLayoutSpanMappingCache() {
        this.mPreLayoutSpanSizeCache.clear();
        this.mPreLayoutSpanIndexCache.clear();
    }

    private void cachePreLayoutSpanMapping() {
        int childCount = getChildCount();
        for (int i = 0; i < childCount; i++) {
            LayoutParams lp = (LayoutParams) getChildAt(i).getLayoutParams();
            int viewPosition = lp.getViewLayoutPosition();
            this.mPreLayoutSpanSizeCache.put(viewPosition, lp.getSpanSize());
            this.mPreLayoutSpanIndexCache.put(viewPosition, lp.getSpanIndex());
        }
    }

    public void onItemsAdded(RecyclerView recyclerView, int positionStart, int itemCount) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsChanged(RecyclerView recyclerView) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsRemoved(RecyclerView recyclerView, int positionStart, int itemCount) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsUpdated(RecyclerView recyclerView, int positionStart, int itemCount, Object payload) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public void onItemsMoved(RecyclerView recyclerView, int from, int to, int itemCount) {
        this.mSpanSizeLookup.invalidateSpanIndexCache();
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateLayoutParams(Context c, AttributeSet attrs) {
        return new LayoutParams(c, attrs);
    }

    public android.support.v7.widget.RecyclerView.LayoutParams generateLayoutParams(android.view.ViewGroup.LayoutParams lp) {
        if (lp instanceof MarginLayoutParams) {
            return new LayoutParams((MarginLayoutParams) lp);
        }
        return new LayoutParams(lp);
    }

    public boolean checkLayoutParams(android.support.v7.widget.RecyclerView.LayoutParams lp) {
        return lp instanceof LayoutParams;
    }

    public void setSpanSizeLookup(SpanSizeLookup spanSizeLookup) {
        this.mSpanSizeLookup = spanSizeLookup;
    }

    public SpanSizeLookup getSpanSizeLookup() {
        return this.mSpanSizeLookup;
    }

    private void updateMeasurements() {
        int totalSpace;
        if (getOrientation() == 1) {
            totalSpace = (getWidth() - getPaddingRight()) - getPaddingLeft();
        } else {
            totalSpace = (getHeight() - getPaddingBottom()) - getPaddingTop();
        }
        calculateItemBorders(totalSpace);
    }

    private void calculateItemBorders(int totalSpace) {
        if (!(this.mCachedBorders != null && this.mCachedBorders.length == this.mSpanCount + 1 && this.mCachedBorders[this.mCachedBorders.length - 1] == totalSpace)) {
            this.mCachedBorders = new int[(this.mSpanCount + 1)];
        }
        this.mCachedBorders[0] = 0;
        int sizePerSpan = totalSpace / this.mSpanCount;
        int sizePerSpanRemainder = totalSpace % this.mSpanCount;
        int consumedPixels = 0;
        int additionalSize = 0;
        for (int i = 1; i <= this.mSpanCount; i++) {
            int itemSize = sizePerSpan;
            additionalSize += sizePerSpanRemainder;
            if (additionalSize > 0 && this.mSpanCount - additionalSize < sizePerSpanRemainder) {
                itemSize++;
                additionalSize -= this.mSpanCount;
            }
            consumedPixels += itemSize;
            this.mCachedBorders[i] = consumedPixels;
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

    private void ensureAnchorIsInFirstSpan(Recycler recycler, State state, AnchorInfo anchorInfo) {
        int span = getSpanIndex(recycler, state, anchorInfo.mPosition);
        while (span > 0 && anchorInfo.mPosition > 0) {
            anchorInfo.mPosition--;
            span = getSpanIndex(recycler, state, anchorInfo.mPosition);
        }
    }

    /* access modifiers changed from: 0000 */
    public View findReferenceChild(Recycler recycler, State state, int start, int end, int itemCount) {
        ensureLayoutState();
        View outOfBoundsMatch = null;
        int boundsStart = this.mOrientationHelper.getStartAfterPadding();
        int boundsEnd = this.mOrientationHelper.getEndAfterPadding();
        int diff = end > start ? 1 : -1;
        View invalidMatch = null;
        for (int i = start; i != end; i += diff) {
            View view = getChildAt(i);
            int position = getPosition(view);
            if (position >= 0 && position < itemCount && getSpanIndex(recycler, state, position) == 0) {
                if (((android.support.v7.widget.RecyclerView.LayoutParams) view.getLayoutParams()).isItemRemoved()) {
                    if (invalidMatch == null) {
                        invalidMatch = view;
                    }
                } else if (this.mOrientationHelper.getDecoratedStart(view) < boundsEnd && this.mOrientationHelper.getDecoratedEnd(view) >= boundsStart) {
                    return view;
                } else {
                    if (outOfBoundsMatch == null) {
                        outOfBoundsMatch = view;
                    }
                }
            }
        }
        return outOfBoundsMatch != null ? outOfBoundsMatch : invalidMatch;
    }

    private int getSpanGroupIndex(Recycler recycler, State state, int viewPosition) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getSpanGroupIndex(viewPosition, this.mSpanCount);
        }
        int adapterPosition = recycler.convertPreLayoutPositionToPostLayout(viewPosition);
        if (adapterPosition != -1) {
            return this.mSpanSizeLookup.getSpanGroupIndex(adapterPosition, this.mSpanCount);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. ");
        sb.append(viewPosition);
        Log.w(str, sb.toString());
        return 0;
    }

    private int getSpanIndex(Recycler recycler, State state, int pos) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getCachedSpanIndex(pos, this.mSpanCount);
        }
        int cached = this.mPreLayoutSpanIndexCache.get(pos, -1);
        if (cached != -1) {
            return cached;
        }
        int adapterPosition = recycler.convertPreLayoutPositionToPostLayout(pos);
        if (adapterPosition != -1) {
            return this.mSpanSizeLookup.getCachedSpanIndex(adapterPosition, this.mSpanCount);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:");
        sb.append(pos);
        Log.w(str, sb.toString());
        return 0;
    }

    private int getSpanSize(Recycler recycler, State state, int pos) {
        if (!state.isPreLayout()) {
            return this.mSpanSizeLookup.getSpanSize(pos);
        }
        int cached = this.mPreLayoutSpanSizeCache.get(pos, -1);
        if (cached != -1) {
            return cached;
        }
        int adapterPosition = recycler.convertPreLayoutPositionToPostLayout(pos);
        if (adapterPosition != -1) {
            return this.mSpanSizeLookup.getSpanSize(adapterPosition);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Cannot find span size for pre layout position. It is not cached, not in the adapter. Pos:");
        sb.append(pos);
        Log.w(str, sb.toString());
        return 1;
    }

    /* access modifiers changed from: 0000 */
    public void layoutChunk(Recycler recycler, State state, LayoutState layoutState, LayoutChunkResult result) {
        int i;
        int bottom;
        int top;
        Recycler recycler2 = recycler;
        State state2 = state;
        LayoutState layoutState2 = layoutState;
        LayoutChunkResult layoutChunkResult = result;
        int i2 = 0;
        boolean layingOutInPrimaryDirection = layoutState2.mItemDirection == 1;
        int remainingSpan = this.mSpanCount;
        if (!layingOutInPrimaryDirection) {
            remainingSpan = getSpanIndex(recycler2, state2, layoutState2.mCurrentPosition) + getSpanSize(recycler2, state2, layoutState2.mCurrentPosition);
        }
        int count = 0;
        int consumedSpanCount = 0;
        while (count < this.mSpanCount && layoutState2.hasMore(state2) && remainingSpan > 0) {
            int pos = layoutState2.mCurrentPosition;
            int spanSize = getSpanSize(recycler2, state2, pos);
            if (spanSize <= this.mSpanCount) {
                remainingSpan -= spanSize;
                if (remainingSpan < 0) {
                    break;
                }
                View view = layoutState2.next(recycler2);
                if (view == null) {
                    break;
                }
                consumedSpanCount += spanSize;
                this.mSet[count] = view;
                count++;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("Item at position ");
                sb.append(pos);
                sb.append(" requires ");
                sb.append(spanSize);
                sb.append(" spans but GridLayoutManager has only ");
                sb.append(this.mSpanCount);
                sb.append(" spans.");
                throw new IllegalArgumentException(sb.toString());
            }
        }
        int i3 = remainingSpan;
        if (count == 0) {
            layoutChunkResult.mFinished = true;
            return;
        }
        assignSpans(recycler2, state2, count, consumedSpanCount, layingOutInPrimaryDirection);
        int i4 = 0;
        int maxSize = 0;
        while (true) {
            i = 1073741824;
            if (i4 >= count) {
                break;
            }
            View view2 = this.mSet[i4];
            if (layoutState2.mScrapList == null) {
                if (layingOutInPrimaryDirection) {
                    addView(view2);
                } else {
                    addView(view2, i2);
                }
            } else if (layingOutInPrimaryDirection) {
                addDisappearingView(view2);
            } else {
                addDisappearingView(view2, i2);
            }
            LayoutParams lp = (LayoutParams) view2.getLayoutParams();
            int spec = MeasureSpec.makeMeasureSpec(this.mCachedBorders[lp.mSpanIndex + lp.mSpanSize] - this.mCachedBorders[lp.mSpanIndex], 1073741824);
            if (this.mOrientation == 1) {
                i2 = 0;
                measureChildWithDecorationsAndMargin(view2, spec, getMainDirSpec(lp.height), false);
            } else {
                i2 = 0;
                measureChildWithDecorationsAndMargin(view2, getMainDirSpec(lp.width), spec, false);
            }
            int size = this.mOrientationHelper.getDecoratedMeasurement(view2);
            if (size > maxSize) {
                maxSize = size;
            }
            i4++;
        }
        int maxMeasureSpec = getMainDirSpec(maxSize);
        int i5 = i2;
        while (i5 < count) {
            View view3 = this.mSet[i5];
            if (this.mOrientationHelper.getDecoratedMeasurement(view3) != maxSize) {
                LayoutParams lp2 = (LayoutParams) view3.getLayoutParams();
                int spec2 = MeasureSpec.makeMeasureSpec(this.mCachedBorders[lp2.mSpanIndex + lp2.mSpanSize] - this.mCachedBorders[lp2.mSpanIndex], i);
                if (this.mOrientation == 1) {
                    measureChildWithDecorationsAndMargin(view3, spec2, maxMeasureSpec, true);
                } else {
                    measureChildWithDecorationsAndMargin(view3, maxMeasureSpec, spec2, true);
                }
            }
            i5++;
            i = 1073741824;
        }
        layoutChunkResult.mConsumed = maxSize;
        int left = 0;
        int right = 0;
        int top2 = 0;
        int bottom2 = 0;
        if (this.mOrientation == 1) {
            if (layoutState2.mLayoutDirection == -1) {
                bottom2 = layoutState2.mOffset;
                top2 = bottom2 - maxSize;
            } else {
                top2 = layoutState2.mOffset;
                bottom2 = top2 + maxSize;
            }
        } else if (layoutState2.mLayoutDirection == -1) {
            right = layoutState2.mOffset;
            left = right - maxSize;
        } else {
            left = layoutState2.mOffset;
            right = left + maxSize;
        }
        int i6 = 0;
        while (true) {
            int i7 = i6;
            if (i7 < count) {
                View view4 = this.mSet[i7];
                LayoutParams params = (LayoutParams) view4.getLayoutParams();
                int left2 = left;
                int right2 = right;
                if (this.mOrientation == 1) {
                    int left3 = getPaddingLeft() + this.mCachedBorders[params.mSpanIndex];
                    left2 = left3;
                    right2 = this.mOrientationHelper.getDecoratedMeasurementInOther(view4) + left3;
                    top = top2;
                    bottom = bottom2;
                } else {
                    int top3 = getPaddingTop() + this.mCachedBorders[params.mSpanIndex];
                    top = top3;
                    bottom = this.mOrientationHelper.getDecoratedMeasurementInOther(view4) + top3;
                }
                int maxMeasureSpec2 = maxMeasureSpec;
                int maxSize2 = maxSize;
                layoutDecorated(view4, left2 + params.leftMargin, top + params.topMargin, right2 - params.rightMargin, bottom - params.bottomMargin);
                if (params.isItemRemoved() || params.isItemChanged()) {
                    layoutChunkResult.mIgnoreConsumed = true;
                }
                layoutChunkResult.mFocusable |= view4.isFocusable();
                i6 = i7 + 1;
                top2 = top;
                bottom2 = bottom;
                maxSize = maxSize2;
                maxMeasureSpec = maxMeasureSpec2;
                left = left2;
                right = right2;
                Recycler recycler3 = recycler;
            } else {
                int i8 = right;
                int i9 = maxMeasureSpec;
                int i10 = maxSize;
                Arrays.fill(this.mSet, null);
                return;
            }
        }
    }

    private int getMainDirSpec(int dim) {
        if (dim < 0) {
            return MAIN_DIR_SPEC;
        }
        return MeasureSpec.makeMeasureSpec(dim, 1073741824);
    }

    private void measureChildWithDecorationsAndMargin(View child, int widthSpec, int heightSpec, boolean capBothSpecs) {
        calculateItemDecorationsForChild(child, this.mDecorInsets);
        android.support.v7.widget.RecyclerView.LayoutParams lp = (android.support.v7.widget.RecyclerView.LayoutParams) child.getLayoutParams();
        if (capBothSpecs || this.mOrientation == 1) {
            widthSpec = updateSpecWithExtra(widthSpec, lp.leftMargin + this.mDecorInsets.left, lp.rightMargin + this.mDecorInsets.right);
        }
        if (capBothSpecs || this.mOrientation == 0) {
            heightSpec = updateSpecWithExtra(heightSpec, lp.topMargin + this.mDecorInsets.top, lp.bottomMargin + this.mDecorInsets.bottom);
        }
        child.measure(widthSpec, heightSpec);
    }

    private int updateSpecWithExtra(int spec, int startInset, int endInset) {
        if (startInset == 0 && endInset == 0) {
            return spec;
        }
        int mode = MeasureSpec.getMode(spec);
        if (mode == Integer.MIN_VALUE || mode == 1073741824) {
            return MeasureSpec.makeMeasureSpec((MeasureSpec.getSize(spec) - startInset) - endInset, mode);
        }
        return spec;
    }

    private void assignSpans(Recycler recycler, State state, int count, int consumedSpanCount, boolean layingOutInPrimaryDirection) {
        int end;
        int end2;
        int end3;
        int spanDiff;
        int span;
        if (layingOutInPrimaryDirection) {
            end2 = 1;
            end = count;
            end3 = 0;
        } else {
            end3 = count - 1;
            end = -1;
            end2 = -1;
        }
        if (this.mOrientation != 1 || !isLayoutRTL()) {
            span = 0;
            spanDiff = 1;
        } else {
            span = this.mSpanCount - 1;
            spanDiff = -1;
        }
        int span2 = span;
        for (int i = end3; i != end; i += end2) {
            View view = this.mSet[i];
            LayoutParams params = (LayoutParams) view.getLayoutParams();
            params.mSpanSize = getSpanSize(recycler, state, getPosition(view));
            if (spanDiff != -1 || params.mSpanSize <= 1) {
                params.mSpanIndex = span2;
            } else {
                params.mSpanIndex = span2 - (params.mSpanSize - 1);
            }
            span2 += params.mSpanSize * spanDiff;
        }
        Recycler recycler2 = recycler;
        State state2 = state;
    }

    public int getSpanCount() {
        return this.mSpanCount;
    }

    public void setSpanCount(int spanCount) {
        if (spanCount != this.mSpanCount) {
            this.mPendingSpanCountChange = true;
            if (spanCount >= 1) {
                this.mSpanCount = spanCount;
                this.mSpanSizeLookup.invalidateSpanIndexCache();
                return;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("Span count should be at least 1. Provided ");
            sb.append(spanCount);
            throw new IllegalArgumentException(sb.toString());
        }
    }

    public boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null && !this.mPendingSpanCountChange;
    }
}
