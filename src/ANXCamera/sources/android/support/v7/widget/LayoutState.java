package android.support.v7.widget;

import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.view.View;

class LayoutState {
    static final int INVALID_LAYOUT = Integer.MIN_VALUE;
    static final int ITEM_DIRECTION_HEAD = -1;
    static final int ITEM_DIRECTION_TAIL = 1;
    static final int LAYOUT_END = 1;
    static final int LAYOUT_START = -1;
    static final int SCOLLING_OFFSET_NaN = Integer.MIN_VALUE;
    static final String TAG = "LayoutState";
    int mAvailable;
    int mCurrentPosition;
    int mEndLine = 0;
    int mItemDirection;
    int mLayoutDirection;
    int mStartLine = 0;

    LayoutState() {
    }

    /* access modifiers changed from: 0000 */
    public boolean hasMore(State state) {
        return this.mCurrentPosition >= 0 && this.mCurrentPosition < state.getItemCount();
    }

    /* access modifiers changed from: 0000 */
    public View next(Recycler recycler) {
        View viewForPosition = recycler.getViewForPosition(this.mCurrentPosition);
        this.mCurrentPosition += this.mItemDirection;
        return viewForPosition;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LayoutState{mAvailable=");
        sb.append(this.mAvailable);
        sb.append(", mCurrentPosition=");
        sb.append(this.mCurrentPosition);
        sb.append(", mItemDirection=");
        sb.append(this.mItemDirection);
        sb.append(", mLayoutDirection=");
        sb.append(this.mLayoutDirection);
        sb.append(", mStartLine=");
        sb.append(this.mStartLine);
        sb.append(", mEndLine=");
        sb.append(this.mEndLine);
        sb.append('}');
        return sb.toString();
    }
}
