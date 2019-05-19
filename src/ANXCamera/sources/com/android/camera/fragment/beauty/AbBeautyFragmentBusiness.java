package com.android.camera.fragment.beauty;

import com.android.camera.R;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;

public abstract class AbBeautyFragmentBusiness implements IBeautyFragmentBusiness {
    public Object operate(Object obj) {
        return null;
    }

    public boolean removeFragmentBeauty(int i) {
        if (!BeautyParameters.isHiddenBeautyPanelOnShutter() && 3 == i) {
            return false;
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_beauty) != 251) {
            return false;
        }
        baseDelegate.delegateEvent(10);
        ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).onSwitchCameraActionMenu(0);
        return true;
    }
}
