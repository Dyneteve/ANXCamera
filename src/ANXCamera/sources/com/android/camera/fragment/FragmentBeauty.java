package com.android.camera.fragment;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.widget.SeekBar;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentDataItem;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.fragment.beauty.BeautyBodyFragment;
import com.android.camera.fragment.beauty.BeautyEyeLightFragment;
import com.android.camera.fragment.beauty.BeautyLevelFragment;
import com.android.camera.fragment.beauty.BeautyParameters;
import com.android.camera.fragment.beauty.BeautySettingManager;
import com.android.camera.fragment.beauty.BeautySmoothLevelFragment;
import com.android.camera.fragment.beauty.IBeautySettingBusiness;
import com.android.camera.fragment.beauty.LiveBeautyFilterFragment;
import com.android.camera.fragment.beauty.LiveBeautyModeFragment;
import com.android.camera.fragment.beauty.MakeupBeautyFragment;
import com.android.camera.fragment.beauty.MakeupParamsFragment;
import com.android.camera.fragment.beauty.RemodelingParamsFragment;
import com.android.camera.fragment.live.FragmentLiveSpeed;
import com.android.camera.fragment.live.FragmentLiveSticker;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.NoScrollViewPager;
import com.android.camera.ui.SeekBarCompat;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatChangeListener;
import com.android.camera.ui.SeekBarCompat.OnSeekBarCompatTouchListener;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import miui.view.animation.QuinticEaseInInterpolator;
import miui.view.animation.QuinticEaseOutInterpolator;

public class FragmentBeauty extends BaseFragment implements OnClickListener, HandleBackTrace, MakeupProtocol, MiBeautyProtocol, Consumer<Integer> {
    public static final int FRAGMENT_INFO = 251;
    private static final int INTERVAL = 5;
    private static final int SEEKBAR_PROGRESS_RATIO = 1;
    /* access modifiers changed from: private */
    public int mActiveProgress;
    /* access modifiers changed from: private */
    public SeekBarCompat mAdjustSeekBar;
    private View mBeautyContent;
    private View mBeautyExtraView;
    private BeautyPagerAdapter mBeautyPagerAdapter;
    private boolean mBeautyPanelShow;
    private BeautySettingManager mBeautySettingManager;
    private ComponentRunningShine mComponentRunningShine;
    private IBeautySettingBusiness mCurrentSettingBusiness;
    /* access modifiers changed from: private */
    public BeautyEyeLightFragment mEyeLightFragment;
    /* access modifiers changed from: private */
    public FlowableEmitter<Integer> mFlowableEmitter;
    List<Fragment> mFragments;
    private boolean mIsEyeLightShow;
    /* access modifiers changed from: private */
    public boolean mIsRTL;
    /* access modifiers changed from: private */
    public boolean mRemoveFragmentBeauty;
    private Disposable mSeekBarDisposable;
    /* access modifiers changed from: private */
    public int mSeekBarMaxProgress = 100;
    private NoScrollViewPager mViewPager;

    private class BeautyPagerAdapter extends FragmentPagerAdapter {
        private List<Fragment> mFragmentList;

        public BeautyPagerAdapter(FragmentManager fragmentManager, List<Fragment> list) {
            super(fragmentManager);
            this.mFragmentList = list;
        }

        public int getCount() {
            if (this.mFragmentList == null) {
                return 0;
            }
            return this.mFragmentList.size();
        }

        public Fragment getItem(int i) {
            String str = BeautyParameters.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("fragment item positon:");
            sb.append(i);
            Log.d(str, sb.toString());
            return (Fragment) this.mFragmentList.get(i);
        }
    }

    private class ExitAnimationListener implements AnimationListener {
        private ExitAnimationListener() {
        }

        public void onAnimationEnd(Animation animation) {
            BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
            if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_beauty) == 4090) {
                baseDelegate.delegateEvent(10);
            }
            if (FragmentBeauty.this.mRemoveFragmentBeauty) {
                CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
                if (!BeautyParameters.isCurrentModeSupportBeauty() || (cameraAction != null && !cameraAction.isDoingAction() && !cameraAction.isRecording())) {
                    BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                    if (bottomPopupTips != null) {
                        bottomPopupTips.reInitTipImage();
                    }
                    if (CameraSettings.shouldShowUltraWideStickyTip(FragmentBeauty.this.mCurrentMode) && bottomPopupTips != null) {
                        bottomPopupTips.directlyShowTips(13, R.string.ultra_wide_open_tip);
                    }
                    FragmentBeauty.this.notifyTipsMargin(0);
                    FragmentBeauty.this.showZoomTipImage();
                    int i = FragmentBeauty.this.mCurrentMode;
                    if (i == 163) {
                        CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                        if (cameraModuleSpecial != null) {
                            cameraModuleSpecial.showOrHideChip(true);
                        }
                    } else if (i == 167) {
                        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
                        if (manuallyAdjust != null) {
                            manuallyAdjust.setManuallyLayoutVisible(true);
                        }
                    } else if (i == 171) {
                        BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
                        if (bokehFNumberController != null) {
                            bokehFNumberController.showFNumberPanel(true);
                        }
                    }
                }
                baseDelegate.delegateEvent(10);
                FragmentBeauty.this.mRemoveFragmentBeauty = false;
            }
        }

        public void onAnimationRepeat(Animation animation) {
        }

        public void onAnimationStart(Animation animation) {
        }
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.android.camera.ui.NoScrollViewPager, android.view.View] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.android.camera.ui.NoScrollViewPager, android.view.View]
  assigns: [com.android.camera.ui.NoScrollViewPager]
  uses: [android.view.View]
  mth insns count: 14
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void extraEnterAnim() {
        this.mViewPager.setTranslationX(0.0f);
        this.mViewPager.setAlpha(1.0f);
        ViewCompat.animate(this.mViewPager).translationX(-100.0f).alpha(0.0f).setDuration(120).setStartDelay(0).setInterpolator(new QuinticEaseInInterpolator()).start();
    }

    /* JADX WARNING: type inference failed for: r0v2, types: [com.android.camera.ui.NoScrollViewPager, android.view.View] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v2, types: [com.android.camera.ui.NoScrollViewPager, android.view.View]
  assigns: [com.android.camera.ui.NoScrollViewPager]
  uses: [android.view.View]
  mth insns count: 14
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void extraExitAnim() {
        this.mViewPager.setTranslationX(-100.0f);
        this.mViewPager.setAlpha(0.0f);
        ViewCompat.animate(this.mViewPager).translationX(0.0f).alpha(1.0f).setDuration(280).setInterpolator(new QuinticEaseOutInterpolator()).setStartDelay(120).start();
    }

    private void initAdjustSeekBar() {
        this.mSeekBarDisposable = Flowable.create(new FlowableOnSubscribe<Integer>() {
            public void subscribe(FlowableEmitter<Integer> flowableEmitter) throws Exception {
                FragmentBeauty.this.mFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).onBackpressureDrop(new Consumer<Integer>() {
            public void accept(@NonNull Integer num) throws Exception {
                String str = Log.VIEW_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("seekbar change too fast :");
                sb.append(num.toString());
                Log.e(str, sb.toString());
            }
        }).subscribe((Consumer<? super T>) this);
        this.mAdjustSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
        this.mAdjustSeekBar.setOnSeekBarChangeListener(new OnSeekBarCompatChangeListener() {
            public void onProgressChanged(SeekBar seekBar, int i, boolean z) {
                if (i == 0 || i == FragmentBeauty.this.mSeekBarMaxProgress || Math.abs(i - FragmentBeauty.this.mActiveProgress) > 5) {
                    FragmentBeauty.this.mActiveProgress = i;
                    FragmentBeauty.this.mFlowableEmitter.onNext(Integer.valueOf(i / 1));
                }
            }

            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        this.mAdjustSeekBar.setOnSeekBarCompatTouchListener(new OnSeekBarCompatTouchListener() {
            private int getNextProgress(MotionEvent motionEvent) {
                int width = FragmentBeauty.this.mAdjustSeekBar.getWidth();
                int x = (int) (((FragmentBeauty.this.mIsRTL ? ((float) width) - motionEvent.getX() : motionEvent.getX()) / ((float) width)) * ((float) FragmentBeauty.this.mSeekBarMaxProgress));
                int pinProgress = FragmentBeauty.this.mAdjustSeekBar.getPinProgress();
                if (pinProgress > 0 && (motionEvent.getAction() == 2 || motionEvent.getAction() == 1)) {
                    if (Math.abs(x + 0) <= 5) {
                        x = 0;
                    } else if (Math.abs(x - pinProgress) <= 5) {
                        x = pinProgress;
                    } else if (Math.abs(x - FragmentBeauty.this.mSeekBarMaxProgress) <= 5) {
                        x = FragmentBeauty.this.mSeekBarMaxProgress;
                    }
                }
                return FragmentBeauty.this.mAdjustSeekBar.isCenterTwoWayMode() ? Util.clamp(x - pinProgress, 0 - pinProgress, FragmentBeauty.this.mSeekBarMaxProgress - pinProgress) : Util.clamp(x, 0, FragmentBeauty.this.mSeekBarMaxProgress);
            }

            public boolean onTouch(View view, MotionEvent motionEvent) {
                switch (motionEvent.getAction()) {
                    case 0:
                        if (!FragmentBeauty.this.mAdjustSeekBar.getThumb().getBounds().contains((int) motionEvent.getX(), (int) motionEvent.getY())) {
                            return true;
                        }
                        break;
                    case 1:
                    case 2:
                        break;
                    default:
                        return false;
                }
                FragmentBeauty.this.mAdjustSeekBar.setProgress(getNextProgress(motionEvent));
                return true;
            }
        });
    }

    private void initShineType() {
        switchShineType(this.mComponentRunningShine.getCurrentType());
    }

    private void initShineType(String str) {
        this.mComponentRunningShine.setCurrentType(str);
        if (isEyeLightShow()) {
            showHideEyeLighting(false);
        }
        char c = 65535;
        int hashCode = str.hashCode();
        if (hashCode != 57) {
            if (hashCode != 1568) {
                switch (hashCode) {
                    case 49:
                        if (str.equals("1")) {
                            c = 1;
                            break;
                        }
                        break;
                    case 50:
                        if (str.equals("2")) {
                            c = 2;
                            break;
                        }
                        break;
                    case 51:
                        if (str.equals("3")) {
                            c = 3;
                            break;
                        }
                        break;
                    case 52:
                        if (str.equals("4")) {
                            c = 4;
                            break;
                        }
                        break;
                    case 53:
                        if (str.equals("5")) {
                            c = 5;
                            break;
                        }
                        break;
                    case 54:
                        if (str.equals("6")) {
                            c = 6;
                            break;
                        }
                        break;
                }
            } else if (str.equals(ComponentRunningShine.SHINE_LIVE_BEAUTY)) {
                c = 7;
            }
        } else if (str.equals("9")) {
            c = 0;
        }
        switch (c) {
            case 0:
                throw new RuntimeException("not allowed, see onMakeupItemSelected");
            case 1:
            case 2:
                this.mCurrentSettingBusiness = null;
                setAdjustSeekBarVisible(false, true);
                return;
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                this.mCurrentSettingBusiness = this.mBeautySettingManager.constructAndGetSetting(str, this.mComponentRunningShine.getTypeElementsBeauty());
                return;
            default:
                this.mCurrentSettingBusiness = null;
                setAdjustSeekBarVisible(false, true);
                return;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:37:0x009c, code lost:
        if (r1.equals("1") != false) goto L_0x00a0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void initViewPager() {
        this.mFragments = new ArrayList();
        Iterator it = this.mComponentRunningShine.getItems().iterator();
        while (true) {
            char c = 0;
            if (it.hasNext()) {
                String str = ((ComponentDataItem) it.next()).mValue;
                int hashCode = str.hashCode();
                switch (hashCode) {
                    case 49:
                        break;
                    case 50:
                        if (str.equals("2")) {
                            c = 1;
                            break;
                        }
                    case 51:
                        if (str.equals("3")) {
                            c = 2;
                            break;
                        }
                    case 52:
                        if (str.equals("4")) {
                            c = 3;
                            break;
                        }
                    case 53:
                        if (str.equals("5")) {
                            c = 4;
                            break;
                        }
                    case 54:
                        if (str.equals("6")) {
                            c = 5;
                            break;
                        }
                    case 55:
                        if (str.equals("7")) {
                            c = 6;
                            break;
                        }
                    default:
                        switch (hashCode) {
                            case 1567:
                                if (str.equals("10")) {
                                    c = 7;
                                    break;
                                }
                            case 1568:
                                if (str.equals(ComponentRunningShine.SHINE_LIVE_BEAUTY)) {
                                    c = 8;
                                    break;
                                }
                            case 1569:
                                if (str.equals("12")) {
                                    c = 9;
                                    break;
                                }
                            case 1570:
                                if (str.equals("13")) {
                                    c = 10;
                                    break;
                                }
                        }
                        c = 65535;
                        break;
                }
                switch (c) {
                    case 0:
                        this.mFragments.add(new BeautyLevelFragment());
                        break;
                    case 1:
                        this.mFragments.add(new BeautySmoothLevelFragment());
                        break;
                    case 2:
                        this.mFragments.add(new MakeupParamsFragment());
                        break;
                    case 3:
                        this.mFragments.add(new RemodelingParamsFragment());
                        break;
                    case 4:
                        this.mFragments.add(new MakeupBeautyFragment());
                        break;
                    case 5:
                        this.mFragments.add(new BeautyBodyFragment());
                        break;
                    case 6:
                        this.mFragments.add(new FragmentFilter());
                        break;
                    case 7:
                        this.mFragments.add(new LiveBeautyFilterFragment());
                        break;
                    case 8:
                        this.mFragments.add(new LiveBeautyModeFragment());
                        break;
                    case 9:
                        this.mFragments.add(new FragmentLiveSticker());
                        break;
                    case 10:
                        this.mFragments.add(new FragmentLiveSpeed());
                        break;
                    default:
                        throw new RuntimeException("unknown beauty type");
                }
            } else {
                this.mBeautyPagerAdapter = new BeautyPagerAdapter(getChildFragmentManager(), this.mFragments);
                this.mViewPager.setAdapter(this.mBeautyPagerAdapter);
                this.mViewPager.setOffscreenPageLimit(2);
                this.mViewPager.setFocusable(false);
                this.mViewPager.setOnTouchListener($$Lambda$FragmentBeauty$TNJSatWOgRFKpHkGpIz0Xtjtopw.INSTANCE);
                return;
            }
        }
    }

    static /* synthetic */ boolean lambda$initViewPager$0(View view, MotionEvent motionEvent) {
        return true;
    }

    /* access modifiers changed from: private */
    public void notifyTipsMargin(int i) {
        if (ModuleManager.isSquareModule()) {
            i = 0;
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.updateTipBottomMargin(i, true);
        }
    }

    private boolean removeFragmentBeauty(int i) {
        if (3 == i && !BeautyParameters.isHiddenBeautyPanelOnShutter()) {
            return false;
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate == null || baseDelegate.getActiveFragment(R.id.bottom_beauty) != 251) {
            return false;
        }
        ((BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197)).onSwitchCameraActionMenu(0);
        View view = getView();
        if (view == null) {
            return false;
        }
        Animation wrapperAnimation = FragmentAnimationFactory.wrapperAnimation(new ExitAnimationListener(), 168, 162);
        wrapperAnimation.setDuration(140);
        wrapperAnimation.setInterpolator(new QuinticEaseInInterpolator());
        view.startAnimation(wrapperAnimation);
        this.mRemoveFragmentBeauty = true;
        return true;
    }

    private void setAdjustSeekBarVisible(boolean z, boolean z2) {
        if (z) {
            if (this.mAdjustSeekBar.getVisibility() != 0) {
                if (z2) {
                    Completable.create(new AlphaInOnSubscribe(this.mAdjustSeekBar)).subscribe();
                } else {
                    AlphaInOnSubscribe.directSetResult(this.mAdjustSeekBar);
                }
            }
        } else if (this.mAdjustSeekBar.getVisibility() == 0) {
            if (z2) {
                Completable.create(new AlphaOutOnSubscribe(this.mAdjustSeekBar)).subscribe();
            } else {
                AlphaOutOnSubscribe.directSetResult(this.mAdjustSeekBar);
            }
        }
    }

    private void setSeekBarMode(int i, int i2) {
        boolean z = false;
        switch (i) {
            case 1:
                this.mSeekBarMaxProgress = 100;
                this.mAdjustSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.seekbar_style));
                break;
            case 2:
                this.mSeekBarMaxProgress = 200;
                this.mAdjustSeekBar.setProgressDrawable(getResources().getDrawable(R.drawable.center_seekbar_style));
                i2 = 100;
                z = true;
                break;
        }
        this.mAdjustSeekBar.setMax(this.mSeekBarMaxProgress);
        this.mAdjustSeekBar.setSeekBarPinProgress(i2);
        this.mAdjustSeekBar.setCenterTwoWayMode(z);
        this.mAdjustSeekBar.setProgress(this.mCurrentSettingBusiness.getProgressByCurrentItem() * 1);
    }

    private void setViewPagerPageByType(String str) {
        List items = this.mComponentRunningShine.getItems();
        for (int i = 0; i < items.size(); i++) {
            if (((ComponentDataItem) items.get(i)).mValue.equals(str)) {
                this.mViewPager.setCurrentItem(i, false);
                return;
            }
        }
    }

    /* access modifiers changed from: private */
    public void showHideExtraLayout(boolean z, Fragment fragment, String str) {
        if (z) {
            FragmentUtils.addFragmentWithTag(getFragmentManager(), (int) R.id.beauty_extra, fragment, str);
        } else {
            FragmentUtils.removeFragmentByTag(getFragmentManager(), str);
        }
    }

    private void showHideEyeLighting(boolean z) {
        setAdjustSeekBarVisible(false, false);
        if (DataRepository.dataItemFeature().fw() && CameraSettings.isSupportBeautyMakeup()) {
            if (this.mEyeLightFragment == null) {
                this.mEyeLightFragment = new BeautyEyeLightFragment();
            }
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (z) {
                topAlert.alertTopHint(0, (int) R.string.eye_light);
                showHideExtraLayout(true, this.mEyeLightFragment, this.mEyeLightFragment.getFragmentTag());
                extraEnterAnim();
                this.mEyeLightFragment.enterAnim(this.mBeautyExtraView, new ViewPropertyAnimatorListener() {
                    public void onAnimationCancel(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        FragmentBeauty.this.mEyeLightFragment.userVisibleHint();
                    }

                    public void onAnimationStart(View view) {
                    }
                });
            } else {
                topAlert.alertTopHint(8, 0);
                this.mEyeLightFragment.exitAnim(this.mBeautyExtraView, new ViewPropertyAnimatorListener() {
                    public void onAnimationCancel(View view) {
                    }

                    public void onAnimationEnd(View view) {
                        FragmentBeauty.this.showHideExtraLayout(false, FragmentBeauty.this.mEyeLightFragment, FragmentBeauty.this.mEyeLightFragment.getFragmentTag());
                        FragmentBeauty.this.mEyeLightFragment.userInvisibleHit();
                        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                        if (bottomPopupTips != null) {
                            bottomPopupTips.directlyHideTips();
                        }
                    }

                    public void onAnimationStart(View view) {
                    }
                });
                extraExitAnim();
            }
            this.mIsEyeLightShow = z;
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0055, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:6:0x0013, code lost:
        if (com.android.camera.HybridZoomingSystem.IS_3_OR_MORE_SAT == false) goto L_0x0055;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void showZoomTipImage() {
        switch (this.mCurrentMode) {
            case 161:
            case 162:
            case 174:
                break;
            case 163:
            case 165:
            case 173:
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null && !CameraSettings.isFrontCamera() && !CameraSettings.isUltraWideConfigOpen(this.mCurrentMode) && !CameraSettings.isUltraPixelOn() && !CameraSettings.isMacroModeEnabled(this.mCurrentMode)) {
                    dualController.showZoomButton();
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.clearAlertStatus();
                        break;
                    }
                }
                break;
            case 166:
                if (!DataRepository.dataItemFeature().fV()) {
                    return;
                }
                break;
        }
    }

    public void accept(@NonNull Integer num) throws Exception {
        this.mCurrentSettingBusiness.setProgressForCurrentItem(num.intValue());
    }

    public void closeEyeLight() {
        if (this.mEyeLightFragment != null) {
            this.mEyeLightFragment.closeEyeLight();
        }
    }

    public void dismiss() {
        onBackEvent(1);
    }

    public int getFragmentInto() {
        return 251;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_beauty;
    }

    public List<TypeItem> getSupportedBeautyItems(@ShineType String str) {
        return this.mBeautySettingManager.constructAndGetSetting(str, this.mComponentRunningShine.getTypeElementsBeauty()).getSupportedTypeArray(str);
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mIsRTL = Util.isLayoutRTL(getContext());
        this.mRemoveFragmentBeauty = false;
        this.mBeautyContent = view.findViewById(R.id.beauty_content);
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (uiStyle == 3 || uiStyle == 1 || this.mCurrentMode == 171 || this.mCurrentMode == 176) {
            this.mBeautyContent.setBackgroundResource(R.color.fullscreen_background);
        } else {
            this.mBeautyContent.setBackgroundResource(R.color.beauty_panel_bg);
        }
        this.mBeautyExtraView = view.findViewById(R.id.beauty_extra);
        this.mViewPager = (NoScrollViewPager) view.findViewById(R.id.beauty_viewPager);
        this.mAdjustSeekBar = (SeekBarCompat) view.findViewById(R.id.beauty_adjust_seekbar);
        this.mComponentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
        initAdjustSeekBar();
        initViewPager();
        initShineType();
    }

    public boolean isBeautyPanelShow() {
        return this.mBeautyPanelShow;
    }

    public boolean isEyeLightShow() {
        return this.mIsEyeLightShow;
    }

    public boolean isSeekBarVisible() {
        return this.mAdjustSeekBar != null && this.mAdjustSeekBar.getVisibility() == 0;
    }

    public boolean needViewClear() {
        if (CameraSettings.isUltraPixelRear48MPOn()) {
            return true;
        }
        return super.needViewClear();
    }

    public boolean onBackEvent(int i) {
        return removeFragmentBeauty(i);
    }

    public void onClick(View view) {
    }

    public void onMakeupItemSelected(String str, boolean z) {
        if (str == "pref_eye_light_type_key") {
            if (z) {
                showHideEyeLighting(!isEyeLightShow());
            } else {
                setAdjustSeekBarVisible(false, false);
            }
        } else if (this.mCurrentSettingBusiness != null) {
            this.mCurrentSettingBusiness.setCurrentType(str);
            this.mActiveProgress = this.mCurrentSettingBusiness.getProgressByCurrentItem() * 1;
            int defaultProgressByCurrentItem = this.mCurrentSettingBusiness.getDefaultProgressByCurrentItem() * 1;
            if (BeautyConstant.isSupportTwoWayAdjustable(str)) {
                setSeekBarMode(2, defaultProgressByCurrentItem);
            } else {
                setSeekBarMode(1, defaultProgressByCurrentItem);
            }
            setAdjustSeekBarVisible(true, true);
        }
    }

    public void onPause() {
        super.onPause();
    }

    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (this.mCurrentMode == 163) {
            CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
            if (cameraModuleSpecial != null) {
                cameraModuleSpecial.showOrHideChip(false);
            }
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        onBackEvent(4);
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
        return null;
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        registerBackStack(modeCoordinator, this);
        modeCoordinator.attachProtocol(194, this);
        modeCoordinator.attachProtocol(180, this);
        this.mBeautyPanelShow = true;
        this.mIsEyeLightShow = false;
        this.mBeautySettingManager = new BeautySettingManager();
    }

    public void resetBeauty() {
        this.mCurrentSettingBusiness.resetBeauty();
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        if (this.mFragments != null) {
            Iterator it = this.mFragments.iterator();
            while (it.hasNext()) {
                BeautyLevelFragment beautyLevelFragment = (Fragment) it.next();
                if (beautyLevelFragment instanceof BeautyLevelFragment) {
                    beautyLevelFragment.setEnableClick(z);
                    return;
                }
            }
        }
    }

    public void switchShineType(String str) {
        initShineType(str);
        setViewPagerPageByType(str);
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        unRegisterBackStack(modeCoordinator, this);
        modeCoordinator.detachProtocol(194, this);
        modeCoordinator.detachProtocol(180, this);
        if (this.mSeekBarDisposable != null && !this.mSeekBarDisposable.isDisposed()) {
            this.mSeekBarDisposable.dispose();
        }
        this.mBeautyPanelShow = false;
        this.mIsEyeLightShow = false;
    }
}
