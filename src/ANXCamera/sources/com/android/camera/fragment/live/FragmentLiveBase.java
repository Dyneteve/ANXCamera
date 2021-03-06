package com.android.camera.fragment.live;

import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import io.reactivex.Completable;
import java.util.List;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public abstract class FragmentLiveBase extends BaseFragment implements HandleBackTrace {
    protected boolean mIsNeedShowWhenExit = true;
    protected boolean mRemoveFragment;

    private class ExitAnimationListener implements AnimationListener {
        private ExitAnimationListener() {
        }

        public void onAnimationEnd(Animation animation) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_beauty) == 4090) {
                baseDelegate.delegateEvent(10);
            }
            if (FragmentLiveBase.this.mRemoveFragment) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (cameraAction != null && !cameraAction.isDoingAction() && FragmentLiveBase.this.mIsNeedShowWhenExit) {
                    ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).reInitTipImage();
                }
                FragmentLiveBase.this.mRemoveFragment = false;
            }
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT && FragmentLiveBase.this.mCurrentMode == 174 && DataRepository.dataItemGlobal().getCurrentCameraId() == 0) {
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.showZoomButton();
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.clearAlertStatus();
                    }
                }
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }

        public void onAnimationStart(Animation animation) {
        }
    }

    public boolean onBackEvent(int i) {
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_beauty) != getFragmentInto()) {
            return false;
        }
        this.mRemoveFragment = true;
        baseDelegate.delegateEvent(10);
        ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).onSwitchCameraActionMenu(0);
        return true;
    }

    public void onPause() {
        super.onPause();
        onBackEvent(5);
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        if (i2 != 3) {
            onBackEvent(5);
        } else {
            onBackEvent(4);
        }
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(167, 161);
        wrapperAnimation.setDuration(280);
        wrapperAnimation.setInterpolator(new QuinticEaseOutInterpolator());
        return wrapperAnimation;
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(new ExitAnimationListener(), 168, 162);
        wrapperAnimation.setDuration(140);
        wrapperAnimation.setInterpolator(new QuinticEaseInInterpolator());
        return wrapperAnimation;
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
    }
}
