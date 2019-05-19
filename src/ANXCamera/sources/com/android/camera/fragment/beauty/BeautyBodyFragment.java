package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.android.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.ColorImageView;

public class BeautyBodyFragment extends BaseBeautyMakeupFragment {
    /* access modifiers changed from: private */
    public ColorImageView mHeaderImageView;

    /* access modifiers changed from: protected */
    public String getClassString() {
        return BeautyBodyFragment.class.getSimpleName();
    }

    /* access modifiers changed from: protected */
    public View getHeaderView() {
        View inflate = LayoutInflater.from(getContext()).inflate(R.layout.beauty_header_layout, null);
        this.mHeaderImageView = (ColorImageView) inflate.findViewById(R.id.makeup_item_icon);
        this.mHeaderImageView.setColor(getResources().getColor(R.color.beautycamera_beauty_advanced_item_backgroud_normal));
        this.mHeaderImageView.setImageResource(R.drawable.icon_beauty_reset);
        ((TextView) inflate.findViewById(R.id.makeup_item_name)).setText(R.string.beauty_reset);
        return inflate;
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return "6";
    }

    /* access modifiers changed from: protected */
    public void onAdapterItemClick(TypeItem typeItem) {
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(typeItem.mKeyOrType, true);
        }
        CameraStatUtil.trackBeautyBodyCounter(typeItem.mKeyOrType);
    }

    /* access modifiers changed from: protected */
    public void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(0.0f);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    BeautyBodyFragment.super.onAnimationEnd(view);
                    BeautyBodyFragment.this.mHeaderImageView.setRotation(0.0f);
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
        if ("pref_beautify_skin_smooth_ratio_key".equals(((TypeItem) this.mItemList.get(0)).mKeyOrType)) {
            toast(getResources().getString(R.string.beauty_reset_toast));
        } else {
            toast(getResources().getString(R.string.beauty_body_reset_tip));
        }
        CameraStatUtil.trackBeautyBodyCounter(BeautyConstant.BEAUTY_RESET);
    }
}
