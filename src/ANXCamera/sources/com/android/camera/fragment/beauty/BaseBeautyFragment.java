package com.android.camera.fragment.beauty;

import android.os.Bundle;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.v4.app.Fragment;
import android.support.v4.view.ViewCompat;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public abstract class BaseBeautyFragment extends Fragment {
    private boolean isOnCreate;
    private boolean isViewCreated;
    private boolean isViewCreatedAndVisibleToUser;
    private boolean isVisibleToUser;

    private void beforeViewGoneToUser() {
        this.isViewCreatedAndVisibleToUser = false;
    }

    private void beforeViewVisibleToUser() {
        this.isViewCreatedAndVisibleToUser = true;
    }

    /* access modifiers changed from: protected */
    public void enterAnim(@NonNull View view) {
        view.clearAnimation();
        view.setAlpha(0.0f);
        ViewCompat.animate(view).setDuration(240).alpha(1.0f).setStartDelay(120).setInterpolator(new QuinticEaseOutInterpolator()).start();
    }

    /* access modifiers changed from: protected */
    public void exitAnim(@NonNull View view) {
        view.clearAnimation();
        ViewCompat.animate(view).setDuration(120).alpha(0.0f).setInterpolator(new QuinticEaseInInterpolator()).start();
    }

    public abstract View getAnimateView();

    @CallSuper
    public void onCreate(Bundle bundle) {
        BaseBeautyFragment.super.onCreate(bundle);
        this.isOnCreate = true;
    }

    public Animation onCreateAnimation(int i, boolean z, int i2) {
        if (z) {
            return BaseBeautyFragment.super.onCreateAnimation(i, z, i2);
        }
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setInterpolator(new QuinticEaseInInterpolator());
        alphaAnimation.setDuration(140);
        return alphaAnimation;
    }

    @CallSuper
    public void onDestroyView() {
        BaseBeautyFragment.super.onDestroyView();
        this.isViewCreated = false;
        if (this.isViewCreatedAndVisibleToUser) {
            beforeViewGoneToUser();
            onViewCreatedAndJumpOut();
        }
    }

    @CallSuper
    public void onViewCreated(View view, Bundle bundle) {
        BaseBeautyFragment.super.onViewCreated(view, bundle);
        this.isViewCreated = true;
        if (!this.isVisibleToUser) {
            return;
        }
        if (this.isOnCreate) {
            this.isOnCreate = false;
            beforeViewVisibleToUser();
            onViewCreatedAndVisibleToUser(true);
            return;
        }
        beforeViewVisibleToUser();
        onViewCreatedAndVisibleToUser(false);
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void onViewCreatedAndJumpOut() {
        if (getAnimateView() != null) {
            exitAnim(getAnimateView());
        }
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void onViewCreatedAndVisibleToUser(boolean z) {
        if (getAnimateView() != null) {
            enterAnim(getAnimateView());
        }
    }

    @CallSuper
    public void setUserVisibleHint(boolean z) {
        this.isVisibleToUser = z;
        BaseBeautyFragment.super.setUserVisibleHint(z);
        if (this.isViewCreated && z) {
            if (this.isOnCreate) {
                this.isOnCreate = false;
                beforeViewVisibleToUser();
                onViewCreatedAndVisibleToUser(true);
            } else {
                beforeViewVisibleToUser();
                onViewCreatedAndVisibleToUser(false);
            }
        }
        if (!z && this.isViewCreatedAndVisibleToUser) {
            beforeViewGoneToUser();
            onViewCreatedAndJumpOut();
        }
    }
}
