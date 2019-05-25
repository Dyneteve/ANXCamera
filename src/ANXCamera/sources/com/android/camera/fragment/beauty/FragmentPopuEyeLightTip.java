package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import com.android.camera.Util;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.oneplus.camera.R;

public class FragmentPopuEyeLightTip extends BaseFragment {
    public static final int FRAGMENT_INFO = 4089;

    public int getFragmentInto() {
        return 4089;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.eye_light_popu_tip;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources()) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
    }
}
