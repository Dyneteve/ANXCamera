package com.android.camera.fragment.lifeCircle;

import android.annotation.SuppressLint;
import android.support.v4.app.Fragment;

public class BaseLifeCircleBindFragment extends Fragment {
    public static final String FRAGMENT_TAG = "com.android.camera.bind";
    private final BaseFragmentLifecycle mLifecycle;

    public BaseLifeCircleBindFragment() {
        this(new BaseFragmentLifecycle());
    }

    @SuppressLint({"ValidFragment"})
    public BaseLifeCircleBindFragment(BaseFragmentLifecycle baseFragmentLifecycle) {
        this.mLifecycle = baseFragmentLifecycle;
    }

    public BaseFragmentLifecycle getFragmentLifecycle() {
        return this.mLifecycle;
    }

    public void onDestroy() {
        BaseLifeCircleBindFragment.super.onDestroy();
        this.mLifecycle.onDestroy(FRAGMENT_TAG);
    }

    public void onStart() {
        BaseLifeCircleBindFragment.super.onStart();
        this.mLifecycle.onStart(FRAGMENT_TAG);
    }

    public void onStop() {
        BaseLifeCircleBindFragment.super.onStop();
        this.mLifecycle.onStop(FRAGMENT_TAG);
    }
}
