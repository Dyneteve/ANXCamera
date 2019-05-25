package com.android.camera.fragment.beauty;

import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.ui.ColorImageView;
import com.oneplus.camera.R;

public class MakeupBeautyFragment extends BaseBeautyMakeupFragment {
    private static final String TAG = "MakeupBeautyFragment";
    /* access modifiers changed from: private */
    public ColorImageView mHeaderImageView;

    /* access modifiers changed from: protected */
    public String getClassString() {
        return getClass().getSimpleName();
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
        return "5";
    }

    /* access modifiers changed from: protected */
    public void onAdapterItemClick(TypeItem typeItem) {
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(typeItem.mKeyOrType, true);
        }
    }

    /* access modifiers changed from: protected */
    public void onHeaderClick() {
        if (this.mHeaderImageView != null) {
            this.mHeaderImageView.clearAnimation();
            this.mHeaderImageView.setRotation(0.0f);
            ViewCompat.animate(this.mHeaderImageView).rotation(360.0f).setDuration(500).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    super.onAnimationEnd(view);
                    MakeupBeautyFragment.this.mHeaderImageView.setRotation(0.0f);
                }
            }).start();
        }
        CameraSettings.resetEyeLight();
        BeautyHelper.resetBeauty();
        this.mSelectedParam = 0;
        this.mMakeupAdapter.setSelectedPosition(this.mSelectedParam);
        this.mLayoutManager.scrollToPosition(this.mSelectedParam);
        MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
        if (makeupProtocol != null) {
            makeupProtocol.onMakeupItemSelected(((TypeItem) this.mItemList.get(0)).mKeyOrType, true);
        }
        this.mMakeupAdapter.notifyDataSetChanged();
        toast(getResources().getString(R.string.makeup_reset_toast));
    }
}
