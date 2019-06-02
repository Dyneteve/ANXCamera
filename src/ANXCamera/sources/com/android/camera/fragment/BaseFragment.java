package com.android.camera.fragment;

import android.os.Bundle;
import android.support.annotation.CallSuper;
import android.support.annotation.LayoutRes;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.PathInterpolator;
import com.android.camera.Util;
import com.android.camera.animation.AnimationDelegate.AnimationResource;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import io.reactivex.Completable;
import java.util.List;

public abstract class BaseFragment extends Fragment implements AnimationResource, BaseProtocol {
    protected static final int LEFT_LANDSCAPE = 90;
    protected static final int RIGHT_LANDSCAPE = 270;
    protected static final int STATE_HIDE = -1;
    protected static final int STATE_SHOW = 1;
    private static final String TAG = BaseFragment.class.getSimpleName();
    protected int mCurrentMode;
    protected int mDegree;
    private boolean mEnableClick = true;
    private boolean mInModeChanging;
    private boolean mIsFullScreenNavBarHidden;
    private boolean mIsnotchScreenHidden;
    private int mLaseFragmentInfo = 240;
    private BaseLifecycleListener mLifecycleListener;
    private boolean mRegistered;
    private boolean mSilentRemove = false;

    private void triggerFragmentAnimationManually(boolean z, int i) {
        Animation provideEnterAnimation = z ? provideEnterAnimation(i) : provideExitAnimation();
        if (provideEnterAnimation != null) {
            getView().startAnimation(provideEnterAnimation);
        }
    }

    public final boolean canProvide() {
        return isAdded();
    }

    public abstract int getFragmentInto();

    @NonNull
    public final String getFragmentTag() {
        return String.valueOf(getFragmentInto());
    }

    @LayoutRes
    public abstract int getLayoutResourceId();

    public abstract void initView(View view);

    public boolean isEnableClick() {
        return this.mEnableClick;
    }

    /* access modifiers changed from: protected */
    public boolean isInModeChanging() {
        return this.mInModeChanging;
    }

    public final boolean isLandScape() {
        return this.mDegree == 90 || this.mDegree == 270;
    }

    public final boolean isLeftLandScape() {
        return this.mDegree == 90;
    }

    public final boolean isRightLandScape() {
        return this.mDegree == 270;
    }

    public boolean needViewClear() {
        return false;
    }

    @CallSuper
    public void notifyAfterFrameAvailable(int i) {
    }

    @CallSuper
    public void notifyDataChanged(int i, int i2) {
        this.mInModeChanging = false;
        this.mCurrentMode = i2;
    }

    public Animation onCreateAnimation(int i, boolean z, int i2) {
        if (z) {
            return provideEnterAnimation(this.mLaseFragmentInfo);
        }
        if (!this.mSilentRemove) {
            return provideExitAnimation();
        }
        return null;
    }

    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        this.mCurrentMode = DataRepository.dataItemGlobal().getCurrentMode();
        this.mIsFullScreenNavBarHidden = Util.sIsFullScreenNavBarHidden;
        this.mIsnotchScreenHidden = Util.sIsnotchScreenHidden;
        View inflate = layoutInflater.inflate(getLayoutResourceId(), viewGroup, false);
        initView(inflate);
        return inflate;
    }

    public void onDestroyView() {
        super.onDestroyView();
        if (this.mRegistered) {
            this.mRegistered = false;
            unRegisterProtocol();
            if (this.mLifecycleListener != null) {
                this.mLifecycleListener.onLifeDestroy(getFragmentTag());
                this.mLifecycleListener = null;
            }
        }
    }

    public void onResume() {
        super.onResume();
        if (!(this.mIsnotchScreenHidden == Util.sIsnotchScreenHidden && this.mIsFullScreenNavBarHidden == Util.sIsFullScreenNavBarHidden)) {
            initView(getView());
        }
        this.mIsnotchScreenHidden = Util.sIsnotchScreenHidden;
        this.mIsFullScreenNavBarHidden = Util.sIsFullScreenNavBarHidden;
    }

    public void onStart() {
        super.onStart();
        if (this.mLifecycleListener != null) {
            this.mLifecycleListener.onLifeStart(getFragmentTag());
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mLifecycleListener != null) {
            this.mLifecycleListener.onLifeStop(getFragmentTag());
        }
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
    }

    public void pendingGone(boolean z) {
        setClickEnable(false);
        this.mSilentRemove = z;
    }

    public void pendingShow() {
        setClickEnable(true);
    }

    @CallSuper
    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        if (list != null) {
            this.mInModeChanging = true;
        }
        this.mCurrentMode = i;
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        return null;
    }

    @CallSuper
    public void provideRotateItem(List<View> list, int i) {
        setDegree(i);
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void register(ModeCoordinator modeCoordinator) {
    }

    /* access modifiers changed from: protected */
    public final void registerBackStack(ModeCoordinator modeCoordinator, HandleBackTrace handleBackTrace) {
        ((BackStack) modeCoordinator.getAttachProtocol(171)).addInBackStack(handleBackTrace);
    }

    public final void registerProtocol() {
        this.mRegistered = true;
        register(ModeCoordinatorImpl.getInstance());
    }

    @CallSuper
    public void setClickEnable(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setClickEnable: ");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mEnableClick = z;
    }

    public final void setDegree(int i) {
        this.mDegree = i;
    }

    public void setEnableClickInitValue(boolean z) {
        this.mEnableClick = z;
    }

    public void setLastFragmentInfo(int i) {
        this.mLaseFragmentInfo = i;
    }

    public void setLifecycleListener(BaseLifecycleListener baseLifecycleListener) {
        this.mLifecycleListener = baseLifecycleListener;
    }

    /* access modifiers changed from: protected */
    public void starAnimatetViewGone(View view, boolean z) {
        if (view.getVisibility() == 0) {
            if (z) {
                Completable.create(new AlphaOutOnSubscribe(view).setDurationTime(260).setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f))).subscribe();
            } else {
                AlphaOutOnSubscribe.directSetResult(view);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void startAnimateViewVisible(View view, boolean z) {
        if (view.getVisibility() != 0) {
            if (z) {
                Completable.create(new AlphaInOnSubscribe(view).setStartDelayTime(240).setDurationTime(300).setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 1.0f))).subscribe();
            } else {
                AlphaInOnSubscribe.directSetResult(view);
            }
        }
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void unRegister(ModeCoordinator modeCoordinator) {
    }

    /* access modifiers changed from: protected */
    public final void unRegisterBackStack(ModeCoordinator modeCoordinator, HandleBackTrace handleBackTrace) {
        BackStack backStack = (BackStack) modeCoordinator.getAttachProtocol(171);
        if (backStack != null) {
            backStack.removeBackStack(handleBackTrace);
        }
    }

    public final void unRegisterProtocol() {
        unRegister(ModeCoordinatorImpl.getInstance());
    }
}
