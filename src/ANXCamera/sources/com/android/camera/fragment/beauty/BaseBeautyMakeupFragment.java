package com.android.camera.fragment.beauty;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Recycler;
import android.support.v7.widget.RecyclerView.State;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.fragment.DefaultItemAnimator;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import java.util.List;

public abstract class BaseBeautyMakeupFragment extends BaseBeautyFragment {
    private static final String TAG = "BaseBeautyMakeup";
    protected OnItemClickListener mClickListener;
    private LinearLayout mHeaderRecyclerView;
    private View mHeaderView;
    protected List<TypeItem> mItemList;
    private int mItemWidth;
    /* access modifiers changed from: private */
    public long mLastClickTime;
    int mLastSelectedParam = -1;
    protected MyLayoutManager mLayoutManager;
    protected MakeupSingleCheckAdapter mMakeupAdapter;
    private RecyclerView mMakeupItemList;
    protected int mSelectedParam = 0;
    private int mTotalWidth;

    public class MyLayoutManager extends LinearLayoutManager {
        private boolean isScrollEnabled = true;

        public MyLayoutManager(Context context) {
            super(context);
        }

        public boolean canScrollHorizontally() {
            return this.isScrollEnabled && super.canScrollHorizontally();
        }

        public void onLayoutChildren(Recycler recycler, State state) {
            try {
                super.onLayoutChildren(recycler, state);
            } catch (IndexOutOfBoundsException e) {
                e.printStackTrace();
            }
        }

        public void onMeasure(Recycler recycler, State state, int i, int i2) {
            View viewForPosition = recycler.getViewForPosition(0);
            if (viewForPosition != null) {
                measureChild(viewForPosition, i, i2);
                setMeasuredDimension(MeasureSpec.getSize(i), viewForPosition.getMeasuredHeight());
            }
        }

        public void setScrollEnabled(boolean z) {
            this.isScrollEnabled = z;
        }
    }

    private void initHeaderView() {
        this.mHeaderView = getHeaderView();
        if (this.mHeaderView != null) {
            LayoutParams layoutParams = new LayoutParams(-2, -1);
            this.mHeaderRecyclerView.addView(this.mHeaderView, 0);
            this.mHeaderView.setLayoutParams(layoutParams);
            this.mHeaderView.setOnClickListener(new OnClickListener() {
                public void onClick(View view) {
                    if (System.currentTimeMillis() - BaseBeautyMakeupFragment.this.mLastClickTime < 1000) {
                        Log.d(BaseBeautyMakeupFragment.TAG, "onHeaderClick: too quick!");
                        return;
                    }
                    BaseBeautyMakeupFragment.this.mLastClickTime = System.currentTimeMillis();
                    BaseBeautyMakeupFragment.this.onHeaderClick();
                }
            });
        }
    }

    private final List<TypeItem> initItems() {
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        if (miBeautyProtocol != null) {
            return miBeautyProtocol.getSupportedBeautyItems(getShineType());
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void notifyItemChanged(int i, int i2) {
        if (i > -1) {
            this.mMakeupAdapter.notifyItemChanged(i);
        }
        if (i2 > -1) {
            this.mMakeupAdapter.notifyItemChanged(i2);
        }
    }

    /* access modifiers changed from: private */
    public boolean scrollIfNeed(int i) {
        int i2 = (i == this.mLayoutManager.findFirstVisibleItemPosition() || i == this.mLayoutManager.findFirstCompletelyVisibleItemPosition()) ? Math.max(0, i - 1) : (i == this.mLayoutManager.findLastVisibleItemPosition() || i == this.mLayoutManager.findLastCompletelyVisibleItemPosition()) ? Math.min(i + 1, this.mLayoutManager.getItemCount() - 1) : i;
        if (i2 == i) {
            return false;
        }
        this.mLayoutManager.scrollToPosition(i2);
        return true;
    }

    private void setItemInCenter(int i) {
        this.mLayoutManager.scrollToPositionWithOffset(i, (this.mTotalWidth / 2) - (this.mItemWidth / 2));
    }

    /* access modifiers changed from: protected */
    public int customItemWidth() {
        return getContext().getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_item_width);
    }

    /* access modifiers changed from: protected */
    public View getAnimateView() {
        return this.mHeaderRecyclerView;
    }

    public abstract String getClassString();

    public abstract View getHeaderView();

    /* access modifiers changed from: protected */
    public int getListItemMargin() {
        if (!isNeedScroll()) {
            return getResources().getDimensionPixelSize(R.dimen.beauty_item_margin);
        }
        return 0;
    }

    @ShineType
    public abstract String getShineType();

    /* access modifiers changed from: protected */
    public OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                BaseBeautyMakeupFragment.this.mLastClickTime = System.currentTimeMillis();
                BaseBeautyMakeupFragment.this.mSelectedParam = i;
                Object tag = view.getTag();
                if (tag != null && (tag instanceof TypeItem)) {
                    BaseBeautyMakeupFragment.this.onAdapterItemClick((TypeItem) tag);
                }
            }
        };
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mHeaderRecyclerView = (LinearLayout) view.findViewById(R.id.header_recyclerView);
        this.mMakeupItemList = (RecyclerView) view.findViewById(R.id.makeup_item_list);
        initHeaderView();
        this.mLayoutManager = new MyLayoutManager(getActivity());
        this.mLayoutManager.setOrientation(0);
        this.mLayoutManager.setScrollEnabled(true);
        this.mMakeupItemList.setLayoutManager(this.mLayoutManager);
        this.mMakeupItemList.setFocusable(false);
        this.mItemList = initItems();
        this.mItemWidth = getResources().getDimensionPixelSize(R.dimen.beautycamera_makeup_item_width);
        this.mTotalWidth = getResources().getDisplayMetrics().widthPixels;
        setListPadding(this.mMakeupItemList);
        int listItemMargin = getListItemMargin();
        if (!isNeedScroll()) {
            this.mLayoutManager.setScrollEnabled(false);
        }
        MakeupSingleCheckAdapter makeupSingleCheckAdapter = new MakeupSingleCheckAdapter(getActivity(), this.mItemList, listItemMargin, isCustomWidth(), customItemWidth());
        this.mMakeupAdapter = makeupSingleCheckAdapter;
        this.mClickListener = initOnItemClickListener();
        this.mMakeupAdapter.setOnItemClickListener(new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                BaseBeautyMakeupFragment.this.mLastSelectedParam = BaseBeautyMakeupFragment.this.mSelectedParam;
                BaseBeautyMakeupFragment.this.mClickListener.onItemClick(adapterView, view, i, j);
                if (BaseBeautyMakeupFragment.this.isNeedScroll() && BaseBeautyMakeupFragment.this.scrollIfNeed(BaseBeautyMakeupFragment.this.mSelectedParam)) {
                    BaseBeautyMakeupFragment.this.notifyItemChanged(BaseBeautyMakeupFragment.this.mLastSelectedParam, BaseBeautyMakeupFragment.this.mSelectedParam);
                }
            }
        });
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mMakeupItemList.setAdapter(this.mMakeupAdapter);
        DefaultItemAnimator defaultItemAnimator = new DefaultItemAnimator();
        defaultItemAnimator.setChangeDuration(150);
        defaultItemAnimator.setMoveDuration(150);
        defaultItemAnimator.setAddDuration(150);
        this.mMakeupItemList.setItemAnimator(defaultItemAnimator);
        this.mMakeupAdapter.notifyDataSetChanged();
        setItemInCenter(this.mSelectedParam);
    }

    /* access modifiers changed from: protected */
    public boolean isCustomWidth() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isNeedScroll() {
        return this.mItemList != null && this.mItemList.size() > 4;
    }

    public abstract void onAdapterItemClick(TypeItem typeItem);

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_beauty_makeup, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    public abstract void onHeaderClick();

    /* access modifiers changed from: protected */
    public void onViewCreatedAndVisibleToUser(boolean z) {
        super.onViewCreatedAndVisibleToUser(z);
        if (this.mItemList != null) {
            TypeItem typeItem = (TypeItem) this.mItemList.get(this.mSelectedParam);
            MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
            if (makeupProtocol != null) {
                makeupProtocol.onMakeupItemSelected(typeItem.mKeyOrType, false);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void setListPadding(RecyclerView recyclerView) {
        int i;
        if (recyclerView != null) {
            int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_model_recycler_padding_left);
            if (!isNeedScroll()) {
                dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_padding_left);
                i = getResources().getDimensionPixelSize(R.dimen.beauty_padding_right);
            } else {
                i = 0;
            }
            recyclerView.setPadding(dimensionPixelSize, 0, i, 0);
        }
    }

    /* access modifiers changed from: protected */
    public void toast(String str) {
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_reset_toast_margin_bottom);
        if (!Util.sIsFullScreenNavBarHidden) {
            dimensionPixelSize -= Util.sNavigationBarHeight;
        }
        ToastUtils.showToast(getContext(), str, 80, 0, dimensionPixelSize - (getResources().getDimensionPixelSize(R.dimen.beauty_reset_toast_height) / 2));
    }
}
