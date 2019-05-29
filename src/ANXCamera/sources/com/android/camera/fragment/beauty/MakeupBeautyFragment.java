package com.android.camera.fragment.beauty;

import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.data.data.TypeItem;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;

public class MakeupBeautyFragment extends BaseBeautyMakeupFragment {
    private static final String TAG = "MakeupBeautyFragment";

    /* access modifiers changed from: protected */
    public String getClassString() {
        return getClass().getSimpleName();
    }

    /* access modifiers changed from: protected */
    public String getShineType() {
        return "5";
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
        CameraSettings.resetEyeLight();
        BeautyHelper.clearBeauty();
        selectFirstItem();
    }

    /* access modifiers changed from: protected */
    public void onResetClick() {
        CameraSettings.resetEyeLight();
        BeautyHelper.resetBeauty();
        selectFirstItem();
        toast(getResources().getString(R.string.makeup_reset_toast));
    }
}
