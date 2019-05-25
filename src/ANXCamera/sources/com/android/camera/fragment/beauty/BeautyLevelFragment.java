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
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import com.android.camera.CameraSettings;
import com.android.camera.Util;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.fragment.beauty.SingleCheckAdapter.LevelItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.oneplus.camera.R;
import java.util.ArrayList;
import java.util.List;

public class BeautyLevelFragment extends BaseBeautyFragment {
    private RecyclerView mLevelItemList;
    private SingleCheckAdapter mSingleCheckAdapter;

    public class MyLayoutManager extends LinearLayoutManager {
        public MyLayoutManager(Context context) {
            super(context);
        }

        public void onMeasure(Recycler recycler, State state, int i, int i2) {
            View viewForPosition = recycler.getViewForPosition(0);
            if (viewForPosition != null) {
                measureChild(viewForPosition, i, i2);
                setMeasuredDimension(MeasureSpec.getSize(i), viewForPosition.getMeasuredHeight());
            }
        }
    }

    private void initView(View view) {
        this.mLevelItemList = (RecyclerView) view.findViewById(R.id.beauty_level_item_list);
        MyLayoutManager myLayoutManager = new MyLayoutManager(getActivity());
        myLayoutManager.setOrientation(0);
        this.mLevelItemList.setLayoutManager(myLayoutManager);
        this.mLevelItemList.setFocusable(false);
        List initBeautyItems = initBeautyItems();
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mLevelItemList.getLayoutParams();
        int provideItemHorizontalMargin = provideItemHorizontalMargin();
        marginLayoutParams.setMarginStart((getResources().getDisplayMetrics().widthPixels - ((getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_size) + (provideItemHorizontalMargin * 2)) * initBeautyItems.size())) / 2);
        this.mSingleCheckAdapter = new SingleCheckAdapter(getActivity(), initBeautyItems, provideItemHorizontalMargin);
        this.mSingleCheckAdapter.setOnItemClickListener(initOnItemClickListener());
        this.mSingleCheckAdapter.setSelectedPosition(beautyLevelToPosition(CameraSettings.getBeautyShowLevel(), initBeautyItems.size() - 1));
        this.mLevelItemList.setAdapter(this.mSingleCheckAdapter);
        this.mSingleCheckAdapter.notifyDataSetChanged();
    }

    /* access modifiers changed from: private */
    public void onLevelClick(AdapterView<?> adapterView, View view, int i, long j) {
        boolean z = !BeautyConstant.LEVEL_CLOSE.equals(CameraSettings.getFaceBeautifyLevel());
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            if (!z && i > 0) {
                bottomMenuProtocol.animateShineBeauty(false);
            } else if (z && i == 0) {
                bottomMenuProtocol.animateShineBeauty(true);
            }
        }
        CameraSettings.setFaceBeautyLevel(i);
        BeautyHelper.onBeautyChanged();
    }

    /* access modifiers changed from: protected */
    public int beautyLevelToPosition(int i, int i2) {
        return Util.clamp(i, 0, i2);
    }

    /* access modifiers changed from: protected */
    public View getAnimateView() {
        return this.mLevelItemList;
    }

    /* access modifiers changed from: protected */
    public List<LevelItem> initBeautyItems() {
        String[] stringArray = getResources().getStringArray(R.array.beauty_level_list);
        ArrayList arrayList = new ArrayList();
        arrayList.add(new LevelItem((int) R.drawable.ic_config_front_beauty_off));
        arrayList.add(new LevelItem(stringArray[0]));
        arrayList.add(new LevelItem(stringArray[1]));
        arrayList.add(new LevelItem(stringArray[2]));
        arrayList.add(new LevelItem(stringArray[3]));
        arrayList.add(new LevelItem(stringArray[4]));
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public OnItemClickListener initOnItemClickListener() {
        return new OnItemClickListener() {
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
                BeautyLevelFragment.this.onLevelClick(adapterView, view, i, j);
            }
        };
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.fragment_beauty_level, viewGroup, false);
        initView(inflate);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public int provideItemHorizontalMargin() {
        return getResources().getDimensionPixelSize(R.dimen.beautycamera_beauty_level_item_margin);
    }

    public void setEnableClick(boolean z) {
        if (this.mSingleCheckAdapter != null) {
            this.mSingleCheckAdapter.setEnableClick(z);
        }
    }

    public void setUserVisibleHint(boolean z) {
        super.setUserVisibleHint(z);
        if (z) {
            if (this.mSingleCheckAdapter != null) {
                this.mSingleCheckAdapter.setEnableClick(true);
            }
        } else if (this.mSingleCheckAdapter != null) {
            this.mSingleCheckAdapter.setEnableClick(false);
        }
    }
}
