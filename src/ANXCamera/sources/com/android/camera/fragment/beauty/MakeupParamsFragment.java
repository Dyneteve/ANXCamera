package com.android.camera.fragment.beauty;

import com.android.camera.R;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;

public class MakeupParamsFragment extends BaseBeautyMakeupFragment {
    /* access modifiers changed from: protected */
    public String getClassString() {
        return getClass().getSimpleName();
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return "3";
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
                toast(getResources().getString(R.string.beauty_mode_reset_toast));
            }
        }
    }
}
