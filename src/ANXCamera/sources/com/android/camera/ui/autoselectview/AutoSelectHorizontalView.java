package com.android.camera.ui.autoselectview;

import android.content.Context;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.support.v7.widget.RecyclerView.AdapterDataObserver;
import android.support.v7.widget.RecyclerView.LayoutManager;
import android.support.v7.widget.RecyclerView.LayoutParams;
import android.support.v7.widget.RecyclerView.ViewHolder;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.Scroller;
import java.util.concurrent.atomic.AtomicBoolean;

public class AutoSelectHorizontalView extends RecyclerView {
    private AtomicBoolean isClickMove = new AtomicBoolean(false);
    /* access modifiers changed from: private */
    public boolean isFirstPositionChanged = true;
    /* access modifiers changed from: private */
    public boolean isInit;
    private boolean isMoveFinished = true;
    /* access modifiers changed from: private */
    public AutoSelectAdapter mAutoSelectAdapter;
    private int mDeltaX;
    /* access modifiers changed from: private */
    public int mInitPosition = 0;
    private int mItemPageCount = 7;
    private int mLastMoveX;
    /* access modifiers changed from: private */
    public LinearLayoutManager mLinearLayoutManager;
    private Scroller mScroller;
    private int mSelectPosition = this.mInitPosition;
    private int mTempSelectPosition = this.mSelectPosition;
    /* access modifiers changed from: private */
    public WrapperAdapter mWrapAdapter;

    class WrapperAdapter extends Adapter {
        private static final int HEADER_FOOTER_TYPE = -1;
        private Adapter adapter;
        /* access modifiers changed from: private */
        public Context context;
        private int headerFooterWidth;
        public int itemPageCount;
        private int itemWidth;

        class HeaderFooterViewHolder extends ViewHolder {
            HeaderFooterViewHolder(View view) {
                super(view);
            }
        }

        public WrapperAdapter(Adapter adapter2, Context context2, int i) {
            this.adapter = adapter2;
            this.context = context2;
            this.itemPageCount = i;
        }

        private boolean isHeaderOrFooter(int i) {
            return i == 0 || i == getItemCount() - 1;
        }

        public int getHeaderFooterWidth() {
            return this.headerFooterWidth;
        }

        public int getItemCount() {
            return this.adapter.getItemCount() + 2;
        }

        public int getItemViewType(int i) {
            if (i == 0 || i == getItemCount() - 1) {
                return -1;
            }
            return this.adapter.getItemViewType(i - 1);
        }

        public int getItemWidth() {
            return this.itemWidth;
        }

        public void onBindViewHolder(ViewHolder viewHolder, int i) {
            if (!isHeaderOrFooter(i)) {
                this.adapter.onBindViewHolder(viewHolder, i - 1);
            }
        }

        public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
            if (i == -1) {
                View view = new View(this.context);
                this.headerFooterWidth = (viewGroup.getMeasuredWidth() / 2) - ((viewGroup.getMeasuredWidth() / this.itemPageCount) / 2);
                view.setLayoutParams(new LayoutParams(this.headerFooterWidth, -1));
                return new HeaderFooterViewHolder(view);
            }
            ViewHolder onCreateViewHolder = this.adapter.onCreateViewHolder(viewGroup, i);
            int measuredWidth = viewGroup.getMeasuredWidth() / this.itemPageCount;
            ViewGroup.LayoutParams layoutParams = onCreateViewHolder.itemView.getLayoutParams();
            if (layoutParams != null) {
                layoutParams.width = measuredWidth;
                this.itemWidth = measuredWidth;
                onCreateViewHolder.itemView.setLayoutParams(layoutParams);
            }
            return onCreateViewHolder;
        }
    }

    public AutoSelectHorizontalView(Context context) {
        super(context);
        init();
    }

    public AutoSelectHorizontalView(Context context, @Nullable AttributeSet attributeSet) {
        super(context, attributeSet);
        init();
    }

    public AutoSelectHorizontalView(Context context, @Nullable AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        init();
    }

    private void calculateSelectedPos() {
        int itemWidth = this.mWrapAdapter.getItemWidth();
        if (itemWidth <= 0) {
            return;
        }
        if (this.mDeltaX > 0) {
            this.mSelectPosition = (this.mDeltaX / itemWidth) + this.mInitPosition;
        } else {
            this.mSelectPosition = this.mInitPosition + (this.mDeltaX / itemWidth);
        }
    }

    private void correctDeltax(Adapter adapter) {
        if (adapter.getItemCount() <= this.mSelectPosition) {
            this.mDeltaX -= this.mWrapAdapter.getItemWidth() * ((this.mSelectPosition - adapter.getItemCount()) + 1);
        }
        calculateSelectedPos();
    }

    private void init() {
        this.mScroller = new Scroller(getContext());
        getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener() {
            public void onGlobalLayout() {
                if (AutoSelectHorizontalView.this.isInit) {
                    if (AutoSelectHorizontalView.this.mAutoSelectAdapter == null) {
                        Log.e("View", "mAutoSelectAdapter  不能为空");
                        return;
                    }
                    if (AutoSelectHorizontalView.this.mInitPosition >= AutoSelectHorizontalView.this.mAutoSelectAdapter.getItemCount()) {
                        AutoSelectHorizontalView.this.mInitPosition = AutoSelectHorizontalView.this.mAutoSelectAdapter.getItemCount() - 1;
                    }
                    if (AutoSelectHorizontalView.this.mInitPosition < 0) {
                        AutoSelectHorizontalView.this.mInitPosition = 0;
                    }
                    if (AutoSelectHorizontalView.this.isFirstPositionChanged) {
                        AutoSelectHorizontalView.this.selectedPositionChanged(AutoSelectHorizontalView.this.mInitPosition);
                    }
                    AutoSelectHorizontalView.this.mLinearLayoutManager.scrollToPositionWithOffset(0, (-AutoSelectHorizontalView.this.mInitPosition) * AutoSelectHorizontalView.this.mWrapAdapter.getItemWidth());
                    AutoSelectHorizontalView.this.isInit = false;
                }
            }
        });
    }

    private void onDataAdd(int i) {
        selectedPositionChanged(this.mSelectPosition);
    }

    /* access modifiers changed from: private */
    public void onDataChanged() {
        selectedPositionChanged(this.mSelectPosition);
    }

    private void onDataRemove(int i) {
        if (i <= this.mSelectPosition) {
            correctDeltax(this.mAutoSelectAdapter);
            selectedPositionChanged(this.mSelectPosition);
            return;
        }
        correctDeltax(this.mAutoSelectAdapter);
    }

    public void computeScroll() {
        super.computeScroll();
        if (this.mScroller.computeScrollOffset()) {
            int currX = this.mScroller.getCurrX() - this.mLastMoveX;
            this.mLastMoveX += currX;
            scrollBy(currX, 0);
        } else if (this.mScroller.isFinished() && !this.isMoveFinished) {
            selectedPositionChanged(this.mSelectPosition);
            this.isMoveFinished = true;
            this.isClickMove.set(false);
        }
    }

    public void moveMiddlePositionChanged(int i) {
        if (this.mAutoSelectAdapter != null) {
            this.mAutoSelectAdapter.onMoveMiddlePoisionChanged(i);
        }
    }

    public void moveToPosition(int i) {
        if (i < 0 || i > this.mAutoSelectAdapter.getItemCount() - 1) {
            Log.e("View", "Your position should be from 0 to + (mAutoSelectAdapter.getItemCount() - 1)");
            return;
        }
        this.isClickMove.set(true);
        this.mLastMoveX = 0;
        this.isMoveFinished = false;
        int itemWidth = this.mWrapAdapter.getItemWidth();
        if (i != this.mSelectPosition) {
            this.mScroller.startScroll(getScrollX(), getScrollY(), (i - this.mSelectPosition) * itemWidth, 0);
            postInvalidate();
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        if (this.mAutoSelectAdapter != null) {
            this.mAutoSelectAdapter = null;
        }
        if (this.mWrapAdapter != null) {
            this.mWrapAdapter.context = null;
            this.mWrapAdapter = null;
        }
    }

    public void onScrollStateChanged(int i) {
        super.onScrollStateChanged(i);
        if (i == 0 && this.mWrapAdapter != null) {
            int itemWidth = this.mWrapAdapter.getItemWidth();
            if (itemWidth != 0) {
                int i2 = this.mDeltaX % itemWidth;
                if (i2 != 0) {
                    if (Math.abs(i2) <= itemWidth / 2) {
                        scrollBy(-i2, 0);
                    } else if (i2 > 0) {
                        scrollBy(itemWidth - i2, 0);
                    } else {
                        scrollBy(-(itemWidth + i2), 0);
                    }
                }
                calculateSelectedPos();
                selectedPositionChanged(this.mSelectPosition);
                this.isClickMove.set(false);
            }
        }
    }

    public void onScrolled(int i, int i2) {
        super.onScrolled(i, i2);
        this.mTempSelectPosition = this.mSelectPosition;
        this.mDeltaX += i;
        calculateSelectedPos();
        if (!this.isClickMove.get() && this.mTempSelectPosition != this.mSelectPosition) {
            int itemWidth = this.mWrapAdapter.getItemWidth();
            if (this.mDeltaX - (this.mSelectPosition * itemWidth) > itemWidth / 2) {
                moveMiddlePositionChanged(this.mSelectPosition + 1);
            } else {
                moveMiddlePositionChanged(this.mSelectPosition);
            }
        }
    }

    public void selectedPositionChanged(int i) {
        if (this.mAutoSelectAdapter != null) {
            this.mAutoSelectAdapter.onSelectedPositionChanged(i);
        }
    }

    public void setAdapter(Adapter adapter) {
        if (!(adapter instanceof AutoSelectAdapter)) {
            Log.e(getClass().getSimpleName(), "mAutoSelectAdapter must extends AutoSelectAdapter<T extends SelectItemBean> ");
            return;
        }
        this.mAutoSelectAdapter = (AutoSelectAdapter) adapter;
        this.mWrapAdapter = new WrapperAdapter(adapter, getContext(), this.mItemPageCount);
        adapter.registerAdapterDataObserver(new AdapterDataObserver() {
            public void onChanged() {
                super.onChanged();
                AutoSelectHorizontalView.this.mWrapAdapter.notifyDataSetChanged();
                AutoSelectHorizontalView.this.onDataChanged();
            }

            public void onItemRangeChanged(int i, int i2) {
                super.onItemRangeChanged(i, i2);
                AutoSelectHorizontalView.this.mWrapAdapter.notifyItemRangeChanged(i + 1, i2);
            }

            public void onItemRangeInserted(int i, int i2) {
                AutoSelectHorizontalView.this.mWrapAdapter.notifyDataSetChanged();
            }

            public void onItemRangeRemoved(int i, int i2) {
                AutoSelectHorizontalView.this.mWrapAdapter.notifyDataSetChanged();
            }
        });
        this.mDeltaX = 0;
        if (this.mLinearLayoutManager == null) {
            this.mLinearLayoutManager = new LinearLayoutManager(getContext());
        }
        this.mLinearLayoutManager.setOrientation(0);
        super.setLayoutManager(this.mLinearLayoutManager);
        super.setAdapter(this.mWrapAdapter);
        this.isInit = true;
    }

    public void setInitPosition(int i) {
        if (this.mAutoSelectAdapter != null) {
            Log.e("View", "This method should be called before setAdapter()!");
            return;
        }
        if (i < 0) {
            i = 0;
        }
        this.mInitPosition = i;
        this.mSelectPosition = i;
    }

    public void setItemPageCount(int i) {
        if (this.mAutoSelectAdapter != null) {
            Log.e("View", "This method should be called before setAdapter()!");
            return;
        }
        if (i % 2 == 0) {
            this.mItemPageCount = i - 1;
        } else {
            this.mItemPageCount = i;
        }
    }

    public void setLayoutManager(LayoutManager layoutManager) {
        if (!(layoutManager instanceof LinearLayoutManager)) {
            Log.e("View", "The LayoutManager here must be LinearLayoutManager!");
        } else {
            this.mLinearLayoutManager = (LinearLayoutManager) layoutManager;
        }
    }
}
