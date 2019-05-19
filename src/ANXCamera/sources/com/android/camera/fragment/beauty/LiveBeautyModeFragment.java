package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ColorImageView;

public class LiveBeautyModeFragment extends BaseBeautyMakeupFragment {
    /* access modifiers changed from: private */
    public ColorImageView mHeaderImageView;

    /* access modifiers changed from: protected */
    public int customItemWidth() {
        return getResources().getDimensionPixelSize(R.dimen.live_beauty_list_item_width);
    }

    /* access modifiers changed from: protected */
    public String getClassString() {
        return LiveBeautyModeFragment.class.getSimpleName();
    }

    /* access modifiers changed from: protected */
    public View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        LayoutParams layoutParams = (LayoutParams) ((LinearLayout) inflate.findViewById(R.id.makeup_item)).getLayoutParams();
        layoutParams.width = getResources().getDimensionPixelSize(R.dimen.live_beauty_list_heard_width);
        inflate.setLayoutParams(layoutParams);
        this.mHeaderImageView = (ColorImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        TextView textView = (TextView) inflate.findViewById(R.id.makeup_item_name);
        textView.setText(R.string.beauty_reset);
        textView.setTextColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_text_normal));
        return inflate;
    }

    /* access modifiers changed from: protected */
    public int getListItemMargin() {
        return super.getListItemMargin();
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return ComponentRunningShine.SHINE_LIVE_BEAUTY;
    }

    /* access modifiers changed from: protected */
    public boolean isCustomWidth() {
        return true;
    }

    /* access modifiers changed from: protected */
    public void onAdapterItemClick(TypeItem typeItem) {
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(typeItem.mKeyOrType, true);
        }
        CameraStatUtil.trackLiveBeautyCounter(typeItem.mKeyOrType);
    }

    /* access modifiers changed from: protected */
    public void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(0.0f);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    super.onAnimationEnd(view);
                    LiveBeautyModeFragment.this.mHeaderImageView.setRotation(0.0f);
                }
            }).start();
        }
        BeautyHelper.resetBeauty();
        this.mSelectedParam = 0;
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mLayoutManager.scrollToPosition(this.mSelectedParam);
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(((TypeItem) this.mItemList.get(0)).mKeyOrType, true);
        }
        this.mMakeupAdapter.notifyDataSetChanged();
        toast(getResources().getString(R.string.beauty_reset_toast));
        CameraStatUtil.trackLiveBeautyCounter(BeautyConstant.BEAUTY_RESET);
    }

    /* access modifiers changed from: protected */
    public void setListPadding(RecyclerView recyclerView) {
        super.setListPadding(recyclerView);
        if (recyclerView != null) {
            recyclerView.setPadding(0, 0, 0, 0);
        }
    }
}
