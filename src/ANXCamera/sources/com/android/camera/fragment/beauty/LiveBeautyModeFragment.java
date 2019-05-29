package com.android.camera.fragment.beauty;

import android.support.v7.widget.RecyclerView;
import com.android.camera.R;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.statistic.CameraStatUtil;

public class LiveBeautyModeFragment extends BaseBeautyMakeupFragment {
    /* access modifiers changed from: protected */
    public String getClassString() {
        return LiveBeautyModeFragment.class.getSimpleName();
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
        CameraStatUtil.trackLiveBeautyCounter(typeItem.mKeyOrType);
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
