package android.support.v7.widget;

import android.content.Context;
import android.graphics.PointF;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.support.v4.view.accessibility.AccessibilityEventCompat;
import android.support.v4.view.accessibility.AccessibilityRecordCompat;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.LayoutManager.Properties;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.support.v7.widget.helper.ItemTouchHelper.ViewDropHandler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import java.util.List;

public class LinearLayoutManager extends LayoutManager implements ViewDropHandler {
    private static final boolean DEBUG = false;
    public static final int HORIZONTAL = 0;
    public static final int INVALID_OFFSET = Integer.MIN_VALUE;
    private static final float MAX_SCROLL_FACTOR = 0.33f;
    private static final String TAG = "LinearLayoutManager";
    public static final int VERTICAL = 1;
    final AnchorInfo mAnchorInfo;
    private boolean mLastStackFromEnd;
    private LayoutState mLayoutState;
    int mOrientation;
    OrientationHelper mOrientationHelper;
    SavedState mPendingSavedState;
    int mPendingScrollPosition;
    int mPendingScrollPositionOffset;
    private boolean mRecycleChildrenOnDetach;
    private boolean mReverseLayout;
    boolean mShouldReverseLayout;
    private boolean mSmoothScrollbarEnabled;
    private boolean mStackFromEnd;

    class AnchorInfo {
        int mCoordinate;
        boolean mLayoutFromEnd;
        int mPosition;

        AnchorInfo() {
        }

        /* access modifiers changed from: private */
        public boolean isViewValidAsAnchor(View view, State state) {
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            return !layoutParams.isItemRemoved() && layoutParams.getViewLayoutPosition() >= 0 && layoutParams.getViewLayoutPosition() < state.getItemCount();
        }

        /* access modifiers changed from: 0000 */
        public void assignCoordinateFromPadding() {
            this.mCoordinate = this.mLayoutFromEnd ? LinearLayoutManager.this.mOrientationHelper.getEndAfterPadding() : LinearLayoutManager.this.mOrientationHelper.getStartAfterPadding();
        }

        public void assignFromView(View view) {
            if (this.mLayoutFromEnd) {
                this.mCoordinate = LinearLayoutManager.this.mOrientationHelper.getDecoratedEnd(view) + LinearLayoutManager.this.mOrientationHelper.getTotalSpaceChange();
            } else {
                this.mCoordinate = LinearLayoutManager.this.mOrientationHelper.getDecoratedStart(view);
            }
            this.mPosition = LinearLayoutManager.this.getPosition(view);
        }

        public void assignFromViewAndKeepVisibleRect(View view) {
            int totalSpaceChange = LinearLayoutManager.this.mOrientationHelper.getTotalSpaceChange();
            if (totalSpaceChange >= 0) {
                assignFromView(view);
                return;
            }
            this.mPosition = LinearLayoutManager.this.getPosition(view);
            if (this.mLayoutFromEnd) {
                int endAfterPadding = (LinearLayoutManager.this.mOrientationHelper.getEndAfterPadding() - totalSpaceChange) - LinearLayoutManager.this.mOrientationHelper.getDecoratedEnd(view);
                this.mCoordinate = LinearLayoutManager.this.mOrientationHelper.getEndAfterPadding() - endAfterPadding;
                if (endAfterPadding > 0) {
                    int decoratedMeasurement = this.mCoordinate - LinearLayoutManager.this.mOrientationHelper.getDecoratedMeasurement(view);
                    int startAfterPadding = LinearLayoutManager.this.mOrientationHelper.getStartAfterPadding();
                    int min = decoratedMeasurement - (Math.min(LinearLayoutManager.this.mOrientationHelper.getDecoratedStart(view) - startAfterPadding, 0) + startAfterPadding);
                    if (min < 0) {
                        this.mCoordinate += Math.min(endAfterPadding, -min);
                    }
                }
            } else {
                int decoratedStart = LinearLayoutManager.this.mOrientationHelper.getDecoratedStart(view);
                int startAfterPadding2 = decoratedStart - LinearLayoutManager.this.mOrientationHelper.getStartAfterPadding();
                this.mCoordinate = decoratedStart;
                if (startAfterPadding2 > 0) {
                    int endAfterPadding2 = (LinearLayoutManager.this.mOrientationHelper.getEndAfterPadding() - Math.min(0, (LinearLayoutManager.this.mOrientationHelper.getEndAfterPadding() - totalSpaceChange) - LinearLayoutManager.this.mOrientationHelper.getDecoratedEnd(view))) - (LinearLayoutManager.this.mOrientationHelper.getDecoratedMeasurement(view) + decoratedStart);
                    if (endAfterPadding2 < 0) {
                        this.mCoordinate -= Math.min(startAfterPadding2, -endAfterPadding2);
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void reset() {
            this.mPosition = -1;
            this.mCoordinate = Integer.MIN_VALUE;
            this.mLayoutFromEnd = false;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("AnchorInfo{mPosition=");
            sb.append(this.mPosition);
            sb.append(", mCoordinate=");
            sb.append(this.mCoordinate);
            sb.append(", mLayoutFromEnd=");
            sb.append(this.mLayoutFromEnd);
            sb.append('}');
            return sb.toString();
        }
    }

    protected static class LayoutChunkResult {
        public int mConsumed;
        public boolean mFinished;
        public boolean mFocusable;
        public boolean mIgnoreConsumed;

        protected LayoutChunkResult() {
        }

        /* access modifiers changed from: 0000 */
        public void resetInternal() {
            this.mConsumed = 0;
            this.mFinished = false;
            this.mIgnoreConsumed = false;
            this.mFocusable = false;
        }
    }

    static class LayoutState {
        static final int INVALID_LAYOUT = Integer.MIN_VALUE;
        static final int ITEM_DIRECTION_HEAD = -1;
        static final int ITEM_DIRECTION_TAIL = 1;
        static final int LAYOUT_END = 1;
        static final int LAYOUT_START = -1;
        static final int SCOLLING_OFFSET_NaN = Integer.MIN_VALUE;
        static final String TAG = "LinearLayoutManager#LayoutState";
        int mAvailable;
        int mCurrentPosition;
        int mExtra = 0;
        boolean mIsPreLayout = false;
        int mItemDirection;
        int mLastScrollDelta;
        int mLayoutDirection;
        int mOffset;
        boolean mRecycle = true;
        List<ViewHolder> mScrapList = null;
        int mScrollingOffset;

        LayoutState() {
        }

        private View nextViewFromScrapList() {
            int size = this.mScrapList.size();
            for (int i = 0; i < size; i++) {
                View view = ((ViewHolder) this.mScrapList.get(i)).itemView;
                LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
                if (!layoutParams.isItemRemoved() && this.mCurrentPosition == layoutParams.getViewLayoutPosition()) {
                    assignPositionFromScrapList(view);
                    return view;
                }
            }
            return null;
        }

        public void assignPositionFromScrapList() {
            assignPositionFromScrapList(null);
        }

        public void assignPositionFromScrapList(View view) {
            View nextViewInLimitedList = nextViewInLimitedList(view);
            if (nextViewInLimitedList == null) {
                this.mCurrentPosition = -1;
            } else {
                this.mCurrentPosition = ((LayoutParams) nextViewInLimitedList.getLayoutParams()).getViewLayoutPosition();
            }
        }

        /* access modifiers changed from: 0000 */
        public boolean hasMore(State state) {
            return this.mCurrentPosition >= 0 && this.mCurrentPosition < state.getItemCount();
        }

        /* access modifiers changed from: 0000 */
        public void log() {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("avail:");
            sb.append(this.mAvailable);
            sb.append(", ind:");
            sb.append(this.mCurrentPosition);
            sb.append(", dir:");
            sb.append(this.mItemDirection);
            sb.append(", offset:");
            sb.append(this.mOffset);
            sb.append(", layoutDir:");
            sb.append(this.mLayoutDirection);
            Log.d(str, sb.toString());
        }

        /* access modifiers changed from: 0000 */
        public View next(Recycler recycler) {
            if (this.mScrapList != null) {
                return nextViewFromScrapList();
            }
            View viewForPosition = recycler.getViewForPosition(this.mCurrentPosition);
            this.mCurrentPosition += this.mItemDirection;
            return viewForPosition;
        }

        public View nextViewInLimitedList(View view) {
            int size = this.mScrapList.size();
            View view2 = null;
            int i = Integer.MAX_VALUE;
            for (int i2 = 0; i2 < size; i2++) {
                View view3 = ((ViewHolder) this.mScrapList.get(i2)).itemView;
                LayoutParams layoutParams = (LayoutParams) view3.getLayoutParams();
                if (view3 != view && !layoutParams.isItemRemoved()) {
                    int viewLayoutPosition = (layoutParams.getViewLayoutPosition() - this.mCurrentPosition) * this.mItemDirection;
                    if (viewLayoutPosition >= 0 && viewLayoutPosition < i) {
                        view2 = view3;
                        i = viewLayoutPosition;
                        if (viewLayoutPosition == 0) {
                            break;
                        }
                    }
                }
            }
            return view2;
        }
    }

    static class SavedState implements Parcelable {
        public static final Creator<SavedState> CREATOR = new Creator<SavedState>() {
            public SavedState createFromParcel(Parcel parcel) {
                return new SavedState(parcel);
            }

            public SavedState[] newArray(int i) {
                return new SavedState[i];
            }
        };
        boolean mAnchorLayoutFromEnd;
        int mAnchorOffset;
        int mAnchorPosition;

        public SavedState() {
        }

        SavedState(Parcel parcel) {
            this.mAnchorPosition = parcel.readInt();
            this.mAnchorOffset = parcel.readInt();
            boolean z = true;
            if (parcel.readInt() != 1) {
                z = false;
            }
            this.mAnchorLayoutFromEnd = z;
        }

        public SavedState(SavedState savedState) {
            this.mAnchorPosition = savedState.mAnchorPosition;
            this.mAnchorOffset = savedState.mAnchorOffset;
            this.mAnchorLayoutFromEnd = savedState.mAnchorLayoutFromEnd;
        }

        public int describeContents() {
            return 0;
        }

        /* access modifiers changed from: 0000 */
        public boolean hasValidAnchor() {
            return this.mAnchorPosition >= 0;
        }

        /* access modifiers changed from: 0000 */
        public void invalidateAnchor() {
            this.mAnchorPosition = -1;
        }

        public void writeToParcel(Parcel parcel, int i) {
            parcel.writeInt(this.mAnchorPosition);
            parcel.writeInt(this.mAnchorOffset);
            parcel.writeInt(this.mAnchorLayoutFromEnd ? 1 : 0);
        }
    }

    public LinearLayoutManager(Context context) {
        this(context, 1, false);
    }

    public LinearLayoutManager(Context context, int i, boolean z) {
        this.mReverseLayout = false;
        this.mShouldReverseLayout = false;
        this.mStackFromEnd = false;
        this.mSmoothScrollbarEnabled = true;
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        this.mPendingSavedState = null;
        this.mAnchorInfo = new AnchorInfo();
        setOrientation(i);
        setReverseLayout(z);
    }

    public LinearLayoutManager(Context context, AttributeSet attributeSet, int i, int i2) {
        this.mReverseLayout = false;
        this.mShouldReverseLayout = false;
        this.mStackFromEnd = false;
        this.mSmoothScrollbarEnabled = true;
        this.mPendingScrollPosition = -1;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        this.mPendingSavedState = null;
        this.mAnchorInfo = new AnchorInfo();
        Properties properties = getProperties(context, attributeSet, i, i2);
        setOrientation(properties.orientation);
        setReverseLayout(properties.reverseLayout);
        setStackFromEnd(properties.stackFromEnd);
    }

    private int computeScrollExtent(State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return ScrollbarHelper.computeScrollExtent(state, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled);
    }

    private int computeScrollOffset(State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return ScrollbarHelper.computeScrollOffset(state, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled, this.mShouldReverseLayout);
    }

    private int computeScrollRange(State state) {
        if (getChildCount() == 0) {
            return 0;
        }
        ensureLayoutState();
        return ScrollbarHelper.computeScrollRange(state, this.mOrientationHelper, findFirstVisibleChildClosestToStart(!this.mSmoothScrollbarEnabled, true), findFirstVisibleChildClosestToEnd(!this.mSmoothScrollbarEnabled, true), this, this.mSmoothScrollbarEnabled);
    }

    private int convertFocusDirectionToLayoutDirection(int i) {
        int i2 = -1;
        int i3 = Integer.MIN_VALUE;
        if (i == 17) {
            if (this.mOrientation != 0) {
                i2 = Integer.MIN_VALUE;
            }
            return i2;
        } else if (i == 33) {
            if (this.mOrientation != 1) {
                i2 = Integer.MIN_VALUE;
            }
            return i2;
        } else if (i == 66) {
            if (this.mOrientation == 0) {
                i3 = 1;
            }
            return i3;
        } else if (i != 130) {
            switch (i) {
                case 1:
                    return -1;
                case 2:
                    return 1;
                default:
                    return Integer.MIN_VALUE;
            }
        } else {
            if (this.mOrientation == 1) {
                i3 = 1;
            }
            return i3;
        }
    }

    private View findFirstReferenceChild(Recycler recycler, State state) {
        return findReferenceChild(recycler, state, 0, getChildCount(), state.getItemCount());
    }

    private View findFirstVisibleChildClosestToEnd(boolean z, boolean z2) {
        return this.mShouldReverseLayout ? findOneVisibleChild(0, getChildCount(), z, z2) : findOneVisibleChild(getChildCount() - 1, -1, z, z2);
    }

    private View findFirstVisibleChildClosestToStart(boolean z, boolean z2) {
        return this.mShouldReverseLayout ? findOneVisibleChild(getChildCount() - 1, -1, z, z2) : findOneVisibleChild(0, getChildCount(), z, z2);
    }

    private View findLastReferenceChild(Recycler recycler, State state) {
        return findReferenceChild(recycler, state, getChildCount() - 1, -1, state.getItemCount());
    }

    private View findReferenceChildClosestToEnd(Recycler recycler, State state) {
        return this.mShouldReverseLayout ? findFirstReferenceChild(recycler, state) : findLastReferenceChild(recycler, state);
    }

    private View findReferenceChildClosestToStart(Recycler recycler, State state) {
        return this.mShouldReverseLayout ? findLastReferenceChild(recycler, state) : findFirstReferenceChild(recycler, state);
    }

    private int fixLayoutEndGap(int i, Recycler recycler, State state, boolean z) {
        int endAfterPadding = this.mOrientationHelper.getEndAfterPadding() - i;
        if (endAfterPadding <= 0) {
            return 0;
        }
        int i2 = -scrollBy(-endAfterPadding, recycler, state);
        int i3 = i + i2;
        if (z) {
            int endAfterPadding2 = this.mOrientationHelper.getEndAfterPadding() - i3;
            if (endAfterPadding2 > 0) {
                this.mOrientationHelper.offsetChildren(endAfterPadding2);
                return endAfterPadding2 + i2;
            }
        }
        return i2;
    }

    private int fixLayoutStartGap(int i, Recycler recycler, State state, boolean z) {
        int startAfterPadding = i - this.mOrientationHelper.getStartAfterPadding();
        if (startAfterPadding <= 0) {
            return 0;
        }
        int i2 = -scrollBy(startAfterPadding, recycler, state);
        int i3 = i + i2;
        if (z) {
            int startAfterPadding2 = i3 - this.mOrientationHelper.getStartAfterPadding();
            if (startAfterPadding2 > 0) {
                this.mOrientationHelper.offsetChildren(-startAfterPadding2);
                return i2 - startAfterPadding2;
            }
        }
        return i2;
    }

    private View getChildClosestToEnd() {
        return getChildAt(this.mShouldReverseLayout ? 0 : getChildCount() - 1);
    }

    private View getChildClosestToStart() {
        return getChildAt(this.mShouldReverseLayout ? getChildCount() - 1 : 0);
    }

    private void layoutForPredictiveAnimations(Recycler recycler, State state, int i, int i2) {
        Recycler recycler2 = recycler;
        State state2 = state;
        if (!state.willRunPredictiveAnimations() || getChildCount() == 0 || state.isPreLayout() || !supportsPredictiveItemAnimations()) {
            int i3 = i;
            int i4 = i2;
            return;
        }
        List<ViewHolder> scrapList = recycler.getScrapList();
        int size = scrapList.size();
        int position = getPosition(getChildAt(0));
        int i5 = 0;
        int i6 = 0;
        for (int i7 = 0; i7 < size; i7++) {
            ViewHolder viewHolder = (ViewHolder) scrapList.get(i7);
            if (!viewHolder.isRemoved()) {
                boolean z = true;
                if ((viewHolder.getLayoutPosition() < position) != this.mShouldReverseLayout) {
                    z = true;
                }
                if (z) {
                    i6 += this.mOrientationHelper.getDecoratedMeasurement(viewHolder.itemView);
                } else {
                    i5 += this.mOrientationHelper.getDecoratedMeasurement(viewHolder.itemView);
                }
            }
        }
        this.mLayoutState.mScrapList = scrapList;
        if (i6 > 0) {
            updateLayoutStateToFillStart(getPosition(getChildClosestToStart()), i);
            this.mLayoutState.mExtra = i6;
            this.mLayoutState.mAvailable = 0;
            this.mLayoutState.assignPositionFromScrapList();
            fill(recycler2, this.mLayoutState, state2, false);
        } else {
            int i8 = i;
        }
        if (i5 > 0) {
            updateLayoutStateToFillEnd(getPosition(getChildClosestToEnd()), i2);
            this.mLayoutState.mExtra = i5;
            this.mLayoutState.mAvailable = 0;
            this.mLayoutState.assignPositionFromScrapList();
            fill(recycler2, this.mLayoutState, state2, false);
        } else {
            int i9 = i2;
        }
        this.mLayoutState.mScrapList = null;
    }

    private void logChildren() {
        Log.d(TAG, "internal representation of views on the screen");
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("item ");
            sb.append(getPosition(childAt));
            sb.append(", coord:");
            sb.append(this.mOrientationHelper.getDecoratedStart(childAt));
            Log.d(str, sb.toString());
        }
        Log.d(TAG, "==============");
    }

    private void recycleByLayoutState(Recycler recycler, LayoutState layoutState) {
        if (layoutState.mRecycle) {
            if (layoutState.mLayoutDirection == -1) {
                recycleViewsFromEnd(recycler, layoutState.mScrollingOffset);
            } else {
                recycleViewsFromStart(recycler, layoutState.mScrollingOffset);
            }
        }
    }

    private void recycleChildren(Recycler recycler, int i, int i2) {
        if (i != i2) {
            if (i2 > i) {
                for (int i3 = i2 - 1; i3 >= i; i3--) {
                    removeAndRecycleViewAt(i3, recycler);
                }
            } else {
                for (int i4 = i; i4 > i2; i4--) {
                    removeAndRecycleViewAt(i4, recycler);
                }
            }
        }
    }

    private void recycleViewsFromEnd(Recycler recycler, int i) {
        int childCount = getChildCount();
        if (i >= 0) {
            int end = this.mOrientationHelper.getEnd() - i;
            if (this.mShouldReverseLayout) {
                for (int i2 = 0; i2 < childCount; i2++) {
                    if (this.mOrientationHelper.getDecoratedStart(getChildAt(i2)) < end) {
                        recycleChildren(recycler, 0, i2);
                        return;
                    }
                }
            } else {
                for (int i3 = childCount - 1; i3 >= 0; i3--) {
                    if (this.mOrientationHelper.getDecoratedStart(getChildAt(i3)) < end) {
                        recycleChildren(recycler, childCount - 1, i3);
                        return;
                    }
                }
            }
        }
    }

    private void recycleViewsFromStart(Recycler recycler, int i) {
        if (i >= 0) {
            int i2 = i;
            int childCount = getChildCount();
            if (this.mShouldReverseLayout) {
                for (int i3 = childCount - 1; i3 >= 0; i3--) {
                    if (this.mOrientationHelper.getDecoratedEnd(getChildAt(i3)) > i2) {
                        recycleChildren(recycler, childCount - 1, i3);
                        return;
                    }
                }
            } else {
                for (int i4 = 0; i4 < childCount; i4++) {
                    if (this.mOrientationHelper.getDecoratedEnd(getChildAt(i4)) > i2) {
                        recycleChildren(recycler, 0, i4);
                        return;
                    }
                }
            }
        }
    }

    private void resolveShouldLayoutReverse() {
        if (this.mOrientation == 1 || !isLayoutRTL()) {
            this.mShouldReverseLayout = this.mReverseLayout;
        } else {
            this.mShouldReverseLayout = !this.mReverseLayout;
        }
    }

    private boolean updateAnchorFromChildren(Recycler recycler, State state, AnchorInfo anchorInfo) {
        boolean z = false;
        if (getChildCount() == 0) {
            return false;
        }
        View focusedChild = getFocusedChild();
        if (focusedChild != null && anchorInfo.isViewValidAsAnchor(focusedChild, state)) {
            anchorInfo.assignFromViewAndKeepVisibleRect(focusedChild);
            return true;
        } else if (this.mLastStackFromEnd != this.mStackFromEnd) {
            return false;
        } else {
            View findReferenceChildClosestToEnd = anchorInfo.mLayoutFromEnd ? findReferenceChildClosestToEnd(recycler, state) : findReferenceChildClosestToStart(recycler, state);
            if (findReferenceChildClosestToEnd == null) {
                return false;
            }
            anchorInfo.assignFromView(findReferenceChildClosestToEnd);
            if (!state.isPreLayout() && supportsPredictiveItemAnimations()) {
                if (this.mOrientationHelper.getDecoratedStart(findReferenceChildClosestToEnd) >= this.mOrientationHelper.getEndAfterPadding() || this.mOrientationHelper.getDecoratedEnd(findReferenceChildClosestToEnd) < this.mOrientationHelper.getStartAfterPadding()) {
                    z = true;
                }
                if (z) {
                    anchorInfo.mCoordinate = anchorInfo.mLayoutFromEnd ? this.mOrientationHelper.getEndAfterPadding() : this.mOrientationHelper.getStartAfterPadding();
                }
            }
            return true;
        }
    }

    private boolean updateAnchorFromPendingData(State state, AnchorInfo anchorInfo) {
        boolean z = false;
        if (state.isPreLayout() || this.mPendingScrollPosition == -1) {
            return false;
        }
        if (this.mPendingScrollPosition < 0 || this.mPendingScrollPosition >= state.getItemCount()) {
            this.mPendingScrollPosition = -1;
            this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
            return false;
        }
        anchorInfo.mPosition = this.mPendingScrollPosition;
        if (this.mPendingSavedState != null && this.mPendingSavedState.hasValidAnchor()) {
            anchorInfo.mLayoutFromEnd = this.mPendingSavedState.mAnchorLayoutFromEnd;
            if (anchorInfo.mLayoutFromEnd) {
                anchorInfo.mCoordinate = this.mOrientationHelper.getEndAfterPadding() - this.mPendingSavedState.mAnchorOffset;
            } else {
                anchorInfo.mCoordinate = this.mOrientationHelper.getStartAfterPadding() + this.mPendingSavedState.mAnchorOffset;
            }
            return true;
        } else if (this.mPendingScrollPositionOffset == Integer.MIN_VALUE) {
            View findViewByPosition = findViewByPosition(this.mPendingScrollPosition);
            if (findViewByPosition == null) {
                if (getChildCount() > 0) {
                    if ((this.mPendingScrollPosition < getPosition(getChildAt(0))) == this.mShouldReverseLayout) {
                        z = true;
                    }
                    anchorInfo.mLayoutFromEnd = z;
                }
                anchorInfo.assignCoordinateFromPadding();
            } else if (this.mOrientationHelper.getDecoratedMeasurement(findViewByPosition) > this.mOrientationHelper.getTotalSpace()) {
                anchorInfo.assignCoordinateFromPadding();
                return true;
            } else if (this.mOrientationHelper.getDecoratedStart(findViewByPosition) - this.mOrientationHelper.getStartAfterPadding() < 0) {
                anchorInfo.mCoordinate = this.mOrientationHelper.getStartAfterPadding();
                anchorInfo.mLayoutFromEnd = false;
                return true;
            } else if (this.mOrientationHelper.getEndAfterPadding() - this.mOrientationHelper.getDecoratedEnd(findViewByPosition) < 0) {
                anchorInfo.mCoordinate = this.mOrientationHelper.getEndAfterPadding();
                anchorInfo.mLayoutFromEnd = true;
                return true;
            } else {
                anchorInfo.mCoordinate = anchorInfo.mLayoutFromEnd ? this.mOrientationHelper.getDecoratedEnd(findViewByPosition) + this.mOrientationHelper.getTotalSpaceChange() : this.mOrientationHelper.getDecoratedStart(findViewByPosition);
            }
            return true;
        } else {
            anchorInfo.mLayoutFromEnd = this.mShouldReverseLayout;
            if (this.mShouldReverseLayout) {
                anchorInfo.mCoordinate = this.mOrientationHelper.getEndAfterPadding() - this.mPendingScrollPositionOffset;
            } else {
                anchorInfo.mCoordinate = this.mOrientationHelper.getStartAfterPadding() + this.mPendingScrollPositionOffset;
            }
            return true;
        }
    }

    private void updateAnchorInfoForLayout(Recycler recycler, State state, AnchorInfo anchorInfo) {
        if (!updateAnchorFromPendingData(state, anchorInfo) && !updateAnchorFromChildren(recycler, state, anchorInfo)) {
            anchorInfo.assignCoordinateFromPadding();
            anchorInfo.mPosition = this.mStackFromEnd ? state.getItemCount() - 1 : 0;
        }
    }

    private void updateLayoutState(int i, int i2, boolean z, State state) {
        int i3;
        this.mLayoutState.mExtra = getExtraLayoutSpace(state);
        this.mLayoutState.mLayoutDirection = i;
        int i4 = -1;
        if (i == 1) {
            this.mLayoutState.mExtra += this.mOrientationHelper.getEndPadding();
            View childClosestToEnd = getChildClosestToEnd();
            LayoutState layoutState = this.mLayoutState;
            if (!this.mShouldReverseLayout) {
                i4 = 1;
            }
            layoutState.mItemDirection = i4;
            this.mLayoutState.mCurrentPosition = getPosition(childClosestToEnd) + this.mLayoutState.mItemDirection;
            this.mLayoutState.mOffset = this.mOrientationHelper.getDecoratedEnd(childClosestToEnd);
            i3 = this.mOrientationHelper.getDecoratedEnd(childClosestToEnd) - this.mOrientationHelper.getEndAfterPadding();
        } else {
            View childClosestToStart = getChildClosestToStart();
            this.mLayoutState.mExtra += this.mOrientationHelper.getStartAfterPadding();
            LayoutState layoutState2 = this.mLayoutState;
            if (this.mShouldReverseLayout) {
                i4 = 1;
            }
            layoutState2.mItemDirection = i4;
            this.mLayoutState.mCurrentPosition = getPosition(childClosestToStart) + this.mLayoutState.mItemDirection;
            this.mLayoutState.mOffset = this.mOrientationHelper.getDecoratedStart(childClosestToStart);
            i3 = (-this.mOrientationHelper.getDecoratedStart(childClosestToStart)) + this.mOrientationHelper.getStartAfterPadding();
        }
        this.mLayoutState.mAvailable = i2;
        if (z) {
            this.mLayoutState.mAvailable -= i3;
        }
        this.mLayoutState.mScrollingOffset = i3;
    }

    private void updateLayoutStateToFillEnd(int i, int i2) {
        this.mLayoutState.mAvailable = this.mOrientationHelper.getEndAfterPadding() - i2;
        this.mLayoutState.mItemDirection = this.mShouldReverseLayout ? -1 : 1;
        this.mLayoutState.mCurrentPosition = i;
        this.mLayoutState.mLayoutDirection = 1;
        this.mLayoutState.mOffset = i2;
        this.mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
    }

    private void updateLayoutStateToFillEnd(AnchorInfo anchorInfo) {
        updateLayoutStateToFillEnd(anchorInfo.mPosition, anchorInfo.mCoordinate);
    }

    private void updateLayoutStateToFillStart(int i, int i2) {
        this.mLayoutState.mAvailable = i2 - this.mOrientationHelper.getStartAfterPadding();
        this.mLayoutState.mCurrentPosition = i;
        this.mLayoutState.mItemDirection = this.mShouldReverseLayout ? 1 : -1;
        this.mLayoutState.mLayoutDirection = -1;
        this.mLayoutState.mOffset = i2;
        this.mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
    }

    private void updateLayoutStateToFillStart(AnchorInfo anchorInfo) {
        updateLayoutStateToFillStart(anchorInfo.mPosition, anchorInfo.mCoordinate);
    }

    public void assertNotInLayoutOrScroll(String str) {
        if (this.mPendingSavedState == null) {
            super.assertNotInLayoutOrScroll(str);
        }
    }

    public boolean canScrollHorizontally() {
        return this.mOrientation == 0;
    }

    public boolean canScrollVertically() {
        return this.mOrientation == 1;
    }

    public int computeHorizontalScrollExtent(State state) {
        return computeScrollExtent(state);
    }

    public int computeHorizontalScrollOffset(State state) {
        return computeScrollOffset(state);
    }

    public int computeHorizontalScrollRange(State state) {
        return computeScrollRange(state);
    }

    public PointF computeScrollVectorForPosition(int i) {
        if (getChildCount() == 0) {
            return null;
        }
        boolean z = false;
        int i2 = 1;
        if (i < getPosition(getChildAt(0))) {
            z = true;
        }
        if (z != this.mShouldReverseLayout) {
            i2 = -1;
        }
        int i3 = i2;
        return this.mOrientation == 0 ? new PointF((float) i3, 0.0f) : new PointF(0.0f, (float) i3);
    }

    public int computeVerticalScrollExtent(State state) {
        return computeScrollExtent(state);
    }

    public int computeVerticalScrollOffset(State state) {
        return computeScrollOffset(state);
    }

    public int computeVerticalScrollRange(State state) {
        return computeScrollRange(state);
    }

    /* access modifiers changed from: 0000 */
    public LayoutState createLayoutState() {
        return new LayoutState();
    }

    /* access modifiers changed from: 0000 */
    public void ensureLayoutState() {
        if (this.mLayoutState == null) {
            this.mLayoutState = createLayoutState();
        }
        if (this.mOrientationHelper == null) {
            this.mOrientationHelper = OrientationHelper.createOrientationHelper(this, this.mOrientation);
        }
    }

    /* access modifiers changed from: 0000 */
    public int fill(Recycler recycler, LayoutState layoutState, State state, boolean z) {
        int i = layoutState.mAvailable;
        if (layoutState.mScrollingOffset != Integer.MIN_VALUE) {
            if (layoutState.mAvailable < 0) {
                layoutState.mScrollingOffset += layoutState.mAvailable;
            }
            recycleByLayoutState(recycler, layoutState);
        }
        int i2 = layoutState.mAvailable + layoutState.mExtra;
        LayoutChunkResult layoutChunkResult = new LayoutChunkResult();
        while (i2 > 0 && layoutState.hasMore(state)) {
            layoutChunkResult.resetInternal();
            layoutChunk(recycler, state, layoutState, layoutChunkResult);
            if (!layoutChunkResult.mFinished) {
                layoutState.mOffset += layoutChunkResult.mConsumed * layoutState.mLayoutDirection;
                if (!layoutChunkResult.mIgnoreConsumed || this.mLayoutState.mScrapList != null || !state.isPreLayout()) {
                    layoutState.mAvailable -= layoutChunkResult.mConsumed;
                    i2 -= layoutChunkResult.mConsumed;
                }
                if (layoutState.mScrollingOffset != Integer.MIN_VALUE) {
                    layoutState.mScrollingOffset += layoutChunkResult.mConsumed;
                    if (layoutState.mAvailable < 0) {
                        layoutState.mScrollingOffset += layoutState.mAvailable;
                    }
                    recycleByLayoutState(recycler, layoutState);
                }
                if (z && layoutChunkResult.mFocusable) {
                    break;
                }
            } else {
                break;
            }
        }
        return i - layoutState.mAvailable;
    }

    public int findFirstCompletelyVisibleItemPosition() {
        View findOneVisibleChild = findOneVisibleChild(0, getChildCount(), true, false);
        if (findOneVisibleChild == null) {
            return -1;
        }
        return getPosition(findOneVisibleChild);
    }

    public int findFirstVisibleItemPosition() {
        View findOneVisibleChild = findOneVisibleChild(0, getChildCount(), false, true);
        if (findOneVisibleChild == null) {
            return -1;
        }
        return getPosition(findOneVisibleChild);
    }

    public int findLastCompletelyVisibleItemPosition() {
        View findOneVisibleChild = findOneVisibleChild(getChildCount() - 1, -1, true, false);
        if (findOneVisibleChild == null) {
            return -1;
        }
        return getPosition(findOneVisibleChild);
    }

    public int findLastVisibleItemPosition() {
        View findOneVisibleChild = findOneVisibleChild(getChildCount() - 1, -1, false, true);
        if (findOneVisibleChild == null) {
            return -1;
        }
        return getPosition(findOneVisibleChild);
    }

    /* access modifiers changed from: 0000 */
    public View findOneVisibleChild(int i, int i2, boolean z, boolean z2) {
        ensureLayoutState();
        int startAfterPadding = this.mOrientationHelper.getStartAfterPadding();
        int endAfterPadding = this.mOrientationHelper.getEndAfterPadding();
        int i3 = i2 > i ? 1 : -1;
        View view = null;
        for (int i4 = i; i4 != i2; i4 += i3) {
            View childAt = getChildAt(i4);
            int decoratedStart = this.mOrientationHelper.getDecoratedStart(childAt);
            int decoratedEnd = this.mOrientationHelper.getDecoratedEnd(childAt);
            if (decoratedStart < endAfterPadding && decoratedEnd > startAfterPadding) {
                if (!z) {
                    return childAt;
                }
                if (decoratedStart >= startAfterPadding && decoratedEnd <= endAfterPadding) {
                    return childAt;
                }
                if (z2 && view == null) {
                    view = childAt;
                }
            }
        }
        return view;
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
            if (position >= 0 && position < i3) {
                if (((LayoutParams) childAt.getLayoutParams()).isItemRemoved()) {
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

    public View findViewByPosition(int i) {
        int childCount = getChildCount();
        if (childCount == 0) {
            return null;
        }
        int position = i - getPosition(getChildAt(0));
        if (position >= 0 && position < childCount) {
            View childAt = getChildAt(position);
            if (getPosition(childAt) == i) {
                return childAt;
            }
        }
        return super.findViewByPosition(i);
    }

    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2);
    }

    /* access modifiers changed from: protected */
    public int getExtraLayoutSpace(State state) {
        if (state.hasTargetScrollPosition()) {
            return this.mOrientationHelper.getTotalSpace();
        }
        return 0;
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public boolean getRecycleChildrenOnDetach() {
        return this.mRecycleChildrenOnDetach;
    }

    public boolean getReverseLayout() {
        return this.mReverseLayout;
    }

    public boolean getStackFromEnd() {
        return this.mStackFromEnd;
    }

    /* access modifiers changed from: protected */
    public boolean isLayoutRTL() {
        return getLayoutDirection() == 1;
    }

    public boolean isSmoothScrollbarEnabled() {
        return this.mSmoothScrollbarEnabled;
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
        LayoutState layoutState2 = layoutState;
        LayoutChunkResult layoutChunkResult2 = layoutChunkResult;
        View next = layoutState2.next(recycler);
        if (next == null) {
            layoutChunkResult2.mFinished = true;
            return;
        }
        LayoutParams layoutParams = (LayoutParams) next.getLayoutParams();
        if (layoutState2.mScrapList == null) {
            if (this.mShouldReverseLayout == (layoutState2.mLayoutDirection == -1)) {
                addView(next);
            } else {
                addView(next, 0);
            }
        } else {
            if (this.mShouldReverseLayout == (layoutState2.mLayoutDirection == -1)) {
                addDisappearingView(next);
            } else {
                addDisappearingView(next, 0);
            }
        }
        measureChildWithMargins(next, 0, 0);
        layoutChunkResult2.mConsumed = this.mOrientationHelper.getDecoratedMeasurement(next);
        if (this.mOrientation == 1) {
            if (isLayoutRTL()) {
                i4 = getWidth() - getPaddingRight();
                i3 = i4 - this.mOrientationHelper.getDecoratedMeasurementInOther(next);
            } else {
                i3 = getPaddingLeft();
                i4 = this.mOrientationHelper.getDecoratedMeasurementInOther(next) + i3;
            }
            if (layoutState2.mLayoutDirection == -1) {
                i7 = layoutState2.mOffset;
                i2 = layoutState2.mOffset - layoutChunkResult2.mConsumed;
            } else {
                i2 = layoutState2.mOffset;
                i7 = layoutState2.mOffset + layoutChunkResult2.mConsumed;
            }
            i = i7;
        } else {
            i2 = getPaddingTop();
            int decoratedMeasurementInOther = this.mOrientationHelper.getDecoratedMeasurementInOther(next) + i2;
            if (layoutState2.mLayoutDirection == -1) {
                i6 = layoutState2.mOffset;
                i5 = layoutState2.mOffset - layoutChunkResult2.mConsumed;
            } else {
                i5 = layoutState2.mOffset;
                i6 = layoutState2.mOffset + layoutChunkResult2.mConsumed;
            }
            i = decoratedMeasurementInOther;
            i4 = i6;
        }
        layoutDecorated(next, i3 + layoutParams.leftMargin, i2 + layoutParams.topMargin, i4 - layoutParams.rightMargin, i - layoutParams.bottomMargin);
        if (layoutParams.isItemRemoved() || layoutParams.isItemChanged()) {
            layoutChunkResult2.mIgnoreConsumed = true;
        }
        layoutChunkResult2.mFocusable = next.isFocusable();
    }

    /* access modifiers changed from: 0000 */
    public void onAnchorReady(Recycler recycler, State state, AnchorInfo anchorInfo) {
    }

    public void onDetachedFromWindow(RecyclerView recyclerView, Recycler recycler) {
        super.onDetachedFromWindow(recyclerView, recycler);
        if (this.mRecycleChildrenOnDetach) {
            removeAndRecycleAllViews(recycler);
            recycler.clear();
        }
    }

    public View onFocusSearchFailed(View view, int i, Recycler recycler, State state) {
        resolveShouldLayoutReverse();
        if (getChildCount() == 0) {
            return null;
        }
        int convertFocusDirectionToLayoutDirection = convertFocusDirectionToLayoutDirection(i);
        if (convertFocusDirectionToLayoutDirection == Integer.MIN_VALUE) {
            return null;
        }
        ensureLayoutState();
        View findReferenceChildClosestToStart = convertFocusDirectionToLayoutDirection == -1 ? findReferenceChildClosestToStart(recycler, state) : findReferenceChildClosestToEnd(recycler, state);
        if (findReferenceChildClosestToStart == null) {
            return null;
        }
        ensureLayoutState();
        updateLayoutState(convertFocusDirectionToLayoutDirection, (int) (0.33f * ((float) this.mOrientationHelper.getTotalSpace())), false, state);
        this.mLayoutState.mScrollingOffset = Integer.MIN_VALUE;
        this.mLayoutState.mRecycle = false;
        fill(recycler, this.mLayoutState, state, true);
        View childClosestToStart = convertFocusDirectionToLayoutDirection == -1 ? getChildClosestToStart() : getChildClosestToEnd();
        if (childClosestToStart == findReferenceChildClosestToStart || !childClosestToStart.isFocusable()) {
            return null;
        }
        return childClosestToStart;
    }

    public void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (getChildCount() > 0) {
            AccessibilityRecordCompat asRecord = AccessibilityEventCompat.asRecord(accessibilityEvent);
            asRecord.setFromIndex(findFirstVisibleItemPosition());
            asRecord.setToIndex(findLastVisibleItemPosition());
        }
    }

    public void onLayoutChildren(Recycler recycler, State state) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        if (!(this.mPendingSavedState == null && this.mPendingScrollPosition == -1) && state.getItemCount() == 0) {
            removeAndRecycleAllViews(recycler);
            return;
        }
        if (this.mPendingSavedState != null && this.mPendingSavedState.hasValidAnchor()) {
            this.mPendingScrollPosition = this.mPendingSavedState.mAnchorPosition;
        }
        ensureLayoutState();
        this.mLayoutState.mRecycle = false;
        resolveShouldLayoutReverse();
        this.mAnchorInfo.reset();
        this.mAnchorInfo.mLayoutFromEnd = this.mShouldReverseLayout ^ this.mStackFromEnd;
        updateAnchorInfoForLayout(recycler, state, this.mAnchorInfo);
        int extraLayoutSpace = getExtraLayoutSpace(state);
        if (this.mLayoutState.mLastScrollDelta >= 0) {
            i2 = extraLayoutSpace;
            i = 0;
        } else {
            i = extraLayoutSpace;
            i2 = 0;
        }
        int startAfterPadding = i + this.mOrientationHelper.getStartAfterPadding();
        int endPadding = i2 + this.mOrientationHelper.getEndPadding();
        if (!(!state.isPreLayout() || this.mPendingScrollPosition == -1 || this.mPendingScrollPositionOffset == Integer.MIN_VALUE)) {
            View findViewByPosition = findViewByPosition(this.mPendingScrollPosition);
            if (findViewByPosition != null) {
                if (this.mShouldReverseLayout) {
                    i5 = (this.mOrientationHelper.getEndAfterPadding() - this.mOrientationHelper.getDecoratedEnd(findViewByPosition)) - this.mPendingScrollPositionOffset;
                } else {
                    i5 = this.mPendingScrollPositionOffset - (this.mOrientationHelper.getDecoratedStart(findViewByPosition) - this.mOrientationHelper.getStartAfterPadding());
                }
                if (i5 > 0) {
                    startAfterPadding += i5;
                } else {
                    endPadding -= i5;
                }
            }
        }
        onAnchorReady(recycler, state, this.mAnchorInfo);
        detachAndScrapAttachedViews(recycler);
        this.mLayoutState.mIsPreLayout = state.isPreLayout();
        if (this.mAnchorInfo.mLayoutFromEnd) {
            updateLayoutStateToFillStart(this.mAnchorInfo);
            this.mLayoutState.mExtra = startAfterPadding;
            fill(recycler, this.mLayoutState, state, false);
            int i6 = this.mLayoutState.mOffset;
            int i7 = this.mLayoutState.mCurrentPosition;
            if (this.mLayoutState.mAvailable > 0) {
                endPadding += this.mLayoutState.mAvailable;
            }
            updateLayoutStateToFillEnd(this.mAnchorInfo);
            this.mLayoutState.mExtra = endPadding;
            this.mLayoutState.mCurrentPosition += this.mLayoutState.mItemDirection;
            fill(recycler, this.mLayoutState, state, false);
            i3 = this.mLayoutState.mOffset;
            if (this.mLayoutState.mAvailable > 0) {
                int i8 = this.mLayoutState.mAvailable;
                updateLayoutStateToFillStart(i7, i6);
                this.mLayoutState.mExtra = i8;
                fill(recycler, this.mLayoutState, state, false);
                i6 = this.mLayoutState.mOffset;
            }
            i4 = i6;
        } else {
            updateLayoutStateToFillEnd(this.mAnchorInfo);
            this.mLayoutState.mExtra = endPadding;
            fill(recycler, this.mLayoutState, state, false);
            i3 = this.mLayoutState.mOffset;
            int i9 = this.mLayoutState.mCurrentPosition;
            if (this.mLayoutState.mAvailable > 0) {
                startAfterPadding += this.mLayoutState.mAvailable;
            }
            updateLayoutStateToFillStart(this.mAnchorInfo);
            this.mLayoutState.mExtra = startAfterPadding;
            this.mLayoutState.mCurrentPosition += this.mLayoutState.mItemDirection;
            fill(recycler, this.mLayoutState, state, false);
            i4 = this.mLayoutState.mOffset;
            if (this.mLayoutState.mAvailable > 0) {
                int i10 = this.mLayoutState.mAvailable;
                updateLayoutStateToFillEnd(i9, i3);
                this.mLayoutState.mExtra = i10;
                fill(recycler, this.mLayoutState, state, false);
                i3 = this.mLayoutState.mOffset;
            }
        }
        if (getChildCount() > 0) {
            if (this.mShouldReverseLayout ^ this.mStackFromEnd) {
                int fixLayoutEndGap = fixLayoutEndGap(i3, recycler, state, true);
                int i11 = i4 + fixLayoutEndGap;
                int i12 = i3 + fixLayoutEndGap;
                int fixLayoutStartGap = fixLayoutStartGap(i11, recycler, state, false);
                i4 = i11 + fixLayoutStartGap;
                i3 = i12 + fixLayoutStartGap;
            } else {
                int fixLayoutStartGap2 = fixLayoutStartGap(i4, recycler, state, true);
                int i13 = i4 + fixLayoutStartGap2;
                int i14 = i3 + fixLayoutStartGap2;
                int fixLayoutEndGap2 = fixLayoutEndGap(i14, recycler, state, false);
                i4 = i13 + fixLayoutEndGap2;
                i3 = i14 + fixLayoutEndGap2;
            }
        }
        layoutForPredictiveAnimations(recycler, state, i4, i3);
        if (!state.isPreLayout()) {
            this.mPendingScrollPosition = -1;
            this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
            this.mOrientationHelper.onLayoutComplete();
        }
        this.mLastStackFromEnd = this.mStackFromEnd;
        this.mPendingSavedState = null;
    }

    public void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable instanceof SavedState) {
            this.mPendingSavedState = (SavedState) parcelable;
            requestLayout();
        }
    }

    public Parcelable onSaveInstanceState() {
        if (this.mPendingSavedState != null) {
            return new SavedState(this.mPendingSavedState);
        }
        SavedState savedState = new SavedState();
        if (getChildCount() > 0) {
            ensureLayoutState();
            boolean z = this.mLastStackFromEnd ^ this.mShouldReverseLayout;
            savedState.mAnchorLayoutFromEnd = z;
            if (z) {
                View childClosestToEnd = getChildClosestToEnd();
                savedState.mAnchorOffset = this.mOrientationHelper.getEndAfterPadding() - this.mOrientationHelper.getDecoratedEnd(childClosestToEnd);
                savedState.mAnchorPosition = getPosition(childClosestToEnd);
            } else {
                View childClosestToStart = getChildClosestToStart();
                savedState.mAnchorPosition = getPosition(childClosestToStart);
                savedState.mAnchorOffset = this.mOrientationHelper.getDecoratedStart(childClosestToStart) - this.mOrientationHelper.getStartAfterPadding();
            }
        } else {
            savedState.invalidateAnchor();
        }
        return savedState;
    }

    public void prepareForDrop(View view, View view2, int i, int i2) {
        assertNotInLayoutOrScroll("Cannot drop a view during a scroll or layout calculation");
        ensureLayoutState();
        resolveShouldLayoutReverse();
        int position = getPosition(view);
        int position2 = getPosition(view2);
        boolean z = position < position2 ? true : true;
        if (this.mShouldReverseLayout) {
            if (z) {
                scrollToPositionWithOffset(position2, this.mOrientationHelper.getEndAfterPadding() - (this.mOrientationHelper.getDecoratedStart(view2) + this.mOrientationHelper.getDecoratedMeasurement(view)));
            } else {
                scrollToPositionWithOffset(position2, this.mOrientationHelper.getEndAfterPadding() - this.mOrientationHelper.getDecoratedEnd(view2));
            }
        } else if (z) {
            scrollToPositionWithOffset(position2, this.mOrientationHelper.getDecoratedStart(view2));
        } else {
            scrollToPositionWithOffset(position2, this.mOrientationHelper.getDecoratedEnd(view2) - this.mOrientationHelper.getDecoratedMeasurement(view));
        }
    }

    /* access modifiers changed from: 0000 */
    public int scrollBy(int i, Recycler recycler, State state) {
        if (getChildCount() == 0 || i == 0) {
            return 0;
        }
        this.mLayoutState.mRecycle = true;
        ensureLayoutState();
        int i2 = i > 0 ? 1 : -1;
        int abs = Math.abs(i);
        updateLayoutState(i2, abs, true, state);
        int fill = fill(recycler, this.mLayoutState, state, false) + this.mLayoutState.mScrollingOffset;
        if (fill < 0) {
            return 0;
        }
        int i3 = abs > fill ? i2 * fill : i;
        this.mOrientationHelper.offsetChildren(-i3);
        this.mLayoutState.mLastScrollDelta = i3;
        return i3;
    }

    public int scrollHorizontallyBy(int i, Recycler recycler, State state) {
        if (this.mOrientation == 1) {
            return 0;
        }
        return scrollBy(i, recycler, state);
    }

    public void scrollToPosition(int i) {
        this.mPendingScrollPosition = i;
        this.mPendingScrollPositionOffset = Integer.MIN_VALUE;
        if (this.mPendingSavedState != null) {
            this.mPendingSavedState.invalidateAnchor();
        }
        requestLayout();
    }

    public void scrollToPositionWithOffset(int i, int i2) {
        this.mPendingScrollPosition = i;
        this.mPendingScrollPositionOffset = i2;
        if (this.mPendingSavedState != null) {
            this.mPendingSavedState.invalidateAnchor();
        }
        requestLayout();
    }

    public int scrollVerticallyBy(int i, Recycler recycler, State state) {
        if (this.mOrientation == 0) {
            return 0;
        }
        return scrollBy(i, recycler, state);
    }

    public void setOrientation(int i) {
        if (i == 0 || i == 1) {
            assertNotInLayoutOrScroll(null);
            if (i != this.mOrientation) {
                this.mOrientation = i;
                this.mOrientationHelper = null;
                requestLayout();
                return;
            }
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("invalid orientation:");
        sb.append(i);
        throw new IllegalArgumentException(sb.toString());
    }

    public void setRecycleChildrenOnDetach(boolean z) {
        this.mRecycleChildrenOnDetach = z;
    }

    public void setReverseLayout(boolean z) {
        assertNotInLayoutOrScroll(null);
        if (z != this.mReverseLayout) {
            this.mReverseLayout = z;
            requestLayout();
        }
    }

    public void setSmoothScrollbarEnabled(boolean z) {
        this.mSmoothScrollbarEnabled = z;
    }

    public void setStackFromEnd(boolean z) {
        assertNotInLayoutOrScroll(null);
        if (this.mStackFromEnd != z) {
            this.mStackFromEnd = z;
            requestLayout();
        }
    }

    public void smoothScrollToPosition(RecyclerView recyclerView, State state, int i) {
        AnonymousClass1 r0 = new LinearSmoothScroller(recyclerView.getContext()) {
            public PointF computeScrollVectorForPosition(int i) {
                return LinearLayoutManager.this.computeScrollVectorForPosition(i);
            }
        };
        r0.setTargetPosition(i);
        startSmoothScroll(r0);
    }

    public boolean supportsPredictiveItemAnimations() {
        return this.mPendingSavedState == null && this.mLastStackFromEnd == this.mStackFromEnd;
    }

    /* access modifiers changed from: 0000 */
    public void validateChildOrder() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("validating child count ");
        sb.append(getChildCount());
        Log.d(str, sb.toString());
        if (getChildCount() >= 1) {
            boolean z = false;
            int position = getPosition(getChildAt(0));
            int decoratedStart = this.mOrientationHelper.getDecoratedStart(getChildAt(0));
            if (this.mShouldReverseLayout) {
                int i = 1;
                while (i < getChildCount()) {
                    View childAt = getChildAt(i);
                    int position2 = getPosition(childAt);
                    int decoratedStart2 = this.mOrientationHelper.getDecoratedStart(childAt);
                    if (position2 < position) {
                        logChildren();
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("detected invalid position. loc invalid? ");
                        if (decoratedStart2 < decoratedStart) {
                            z = true;
                        }
                        sb2.append(z);
                        throw new RuntimeException(sb2.toString());
                    } else if (decoratedStart2 <= decoratedStart) {
                        i++;
                    } else {
                        logChildren();
                        throw new RuntimeException("detected invalid location");
                    }
                }
            } else {
                int i2 = 1;
                while (i2 < getChildCount()) {
                    View childAt2 = getChildAt(i2);
                    int position3 = getPosition(childAt2);
                    int decoratedStart3 = this.mOrientationHelper.getDecoratedStart(childAt2);
                    if (position3 < position) {
                        logChildren();
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("detected invalid position. loc invalid? ");
                        if (decoratedStart3 < decoratedStart) {
                            z = true;
                        }
                        sb3.append(z);
                        throw new RuntimeException(sb3.toString());
                    } else if (decoratedStart3 >= decoratedStart) {
                        i2++;
                    } else {
                        logChildren();
                        throw new RuntimeException("detected invalid location");
                    }
                }
            }
        }
    }
}
