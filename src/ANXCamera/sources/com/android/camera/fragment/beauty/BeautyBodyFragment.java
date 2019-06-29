package com.android.camera.fragment.beauty;

import com.android.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.statistic.CameraStatUtil;

public class BeautyBodyFragment extends BaseBeautyMakeupFragment {
    /* access modifiers changed from: protected */
    public String getClassString() {
        return BeautyBodyFragment.class.getSimpleName();
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return "6";
    }

    /* access modifiers changed from: protected */
    public void initExtraType() {
        this.mHeaderElement = 1;
        this.mFooterElement = -1;
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
    public void onClearClick() {
        BeautyHelper.clearBeauty();
        selectFirstItem();
    }

    /* access modifiers changed from: protected */
    public void onResetClick() {
        BeautyHelper.resetBeauty();
        selectFirstItem();
        if (this.mItemList != null && !this.mItemList.isEmpty()) {
            if ("pref_beautify_skin_smooth_ratio_key".equals(((TypeItem) this.mItemList.get(0)).mKeyOrType)) {
                toast(getResources().getString(R.string.beauty_reset_toast));
            } else {
                toast(getResources().getString(R.string.beauty_body_reset_tip));
            }
        }
        CameraStatUtil.trackBeautyBodyCounter(BeautyConstant.BEAUTY_RESET);
    }
}
