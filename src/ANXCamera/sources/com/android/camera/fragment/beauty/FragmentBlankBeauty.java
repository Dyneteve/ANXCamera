package com.android.camera.fragment.beauty;

import android.view.View;
import android.view.animation.Animation;
import com.android.camera.R;
import com.android.camera.fragment.BaseFragment;

@Deprecated
public class FragmentBlankBeauty extends BaseFragment {
    public static final int FRAGMENT_INFO = 4090;

    public int getFragmentInto() {
        return 4090;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_blank_beauty;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        return null;
    }
}
