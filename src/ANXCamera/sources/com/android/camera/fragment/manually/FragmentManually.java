package com.android.camera.fragment.manually;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.view.ViewCompat;
import android.support.v7.widget.RecyclerView;
import android.support.v7.widget.RecyclerView.Adapter;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageView;
import com.android.camera.CameraSettings;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.data.data.config.DataItemConfig;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.beauty.LinearLayoutManagerWrapper;
import com.android.camera.fragment.manually.adapter.ExtraRecyclerViewAdapter;
import com.android.camera.fragment.manually.adapter.ManuallyAdapter;
import com.android.camera.fragment.manually.adapter.ManuallySingleAdapter;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera2.CameraCapabilities;
import com.mi.config.b;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;

public class FragmentManually extends BaseFragment implements OnClickListener, ManuallyListener, HandleBackTrace, ManuallyAdjust {
    private Adapter mAdapter;
    private int mCurrentAdjustType = -1;
    private ManuallyDecoration mDecoration;
    private FragmentManuallyExtra mFragmentManuallyExtra;
    /* access modifiers changed from: private */
    public ImageView mIndicatorButton;
    /* access modifiers changed from: private */
    public boolean mIsHiding;
    private List<ComponentData> mManuallyComponents;
    /* access modifiers changed from: private */
    public ViewGroup mManuallyParent;
    /* access modifiers changed from: private */
    public RecyclerView mRecyclerView;
    private ViewGroup mRecyclerViewLayout;

    private void adjustViewBackground(int i) {
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (uiStyle != 3) {
            switch (uiStyle) {
                case 0:
                    this.mRecyclerViewLayout.setBackgroundResource(R.color.halfscreen_background);
                    return;
                case 1:
                    break;
                default:
                    return;
            }
        }
        this.mRecyclerViewLayout.setBackgroundResource(R.color.fullscreen_background);
    }

    private FragmentManuallyExtra getExtraFragment() {
        if (this.mFragmentManuallyExtra == null || !this.mFragmentManuallyExtra.isAdded()) {
            return null;
        }
        return this.mFragmentManuallyExtra;
    }

    private void hideTips() {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private void initManually() {
        initManuallyDataList();
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        this.mDecoration.setStyle(this.mManuallyComponents.size());
        this.mRecyclerView.addItemDecoration(this.mDecoration);
        ManuallyAdapter manuallyAdapter = new ManuallyAdapter(this.mCurrentMode, this, this.mManuallyComponents);
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.settings_screen_height);
        FragmentManuallyExtra extraFragment = getExtraFragment();
        if (extraFragment != null) {
            extraFragment.updateData();
            manuallyAdapter.setSelectedTitle(extraFragment.getCurrentTitle());
        }
        this.mAdapter = manuallyAdapter;
    }

    private List<ComponentData> initManuallyDataList() {
        if (this.mManuallyComponents == null) {
            this.mManuallyComponents = new ArrayList();
        } else {
            this.mManuallyComponents.clear();
        }
        DataItemConfig dataItemConfig = DataRepository.dataItemConfig();
        this.mManuallyComponents.add(new ComponentManuallyWB(dataItemConfig));
        if (b.hp()) {
            ComponentManuallyFocus manuallyFocus = DataRepository.dataItemConfig().getManuallyFocus();
            CameraCapabilities currentCameraCapabilities = Camera2DataContainer.getInstance().getCurrentCameraCapabilities();
            if (currentCameraCapabilities != null) {
                manuallyFocus.setFixedFocusLens(!currentCameraCapabilities.isAFRegionSupported());
            }
            this.mManuallyComponents.add(manuallyFocus);
            this.mManuallyComponents.add(new ComponentManuallyET(dataItemConfig));
        }
        this.mManuallyComponents.add(new ComponentManuallyISO(dataItemConfig));
        if (CameraSettings.isSupportedOpticalZoom() || DataRepository.dataItemFeature().isSupportUltraWide()) {
            this.mManuallyComponents.add(new ComponentManuallyDualLens(dataItemConfig));
        }
        return this.mManuallyComponents;
    }

    private int initRecyclerView(int i, ManuallyListener manuallyListener) {
        this.mCurrentAdjustType = i;
        switch (i) {
            case 0:
                this.mCurrentAdjustType = 0;
                this.mManuallyParent.setVisibility(4);
                return 0;
            case 1:
                this.mCurrentAdjustType = 1;
                initManually();
                break;
            case 2:
                this.mCurrentAdjustType = 2;
                initScene(manuallyListener);
                break;
            case 3:
                this.mCurrentAdjustType = 3;
                initTilt(manuallyListener);
                break;
        }
        return this.mRecyclerView.getLayoutParams().height;
    }

    private void initScene(ManuallyListener manuallyListener) {
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        ExtraRecyclerViewAdapter extraRecyclerViewAdapter = new ExtraRecyclerViewAdapter(DataRepository.dataItemRunning().getComponentRunningSceneValue(), this.mCurrentMode, manuallyListener, (int) (((float) getResources().getDisplayMetrics().widthPixels) / 5.5f));
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.manual_popup_layout_height);
        this.mAdapter = extraRecyclerViewAdapter;
    }

    private void initTilt(ManuallyListener manuallyListener) {
        ComponentRunningTiltValue componentRunningTiltValue = DataRepository.dataItemRunning().getComponentRunningTiltValue();
        this.mRecyclerView.removeItemDecoration(this.mDecoration);
        this.mDecoration.setStyle(componentRunningTiltValue.getItems().size());
        this.mRecyclerView.addItemDecoration(this.mDecoration);
        ManuallySingleAdapter manuallySingleAdapter = new ManuallySingleAdapter(componentRunningTiltValue, this.mCurrentMode, manuallyListener, getResources().getDisplayMetrics().widthPixels / componentRunningTiltValue.getItems().size());
        this.mRecyclerView.getLayoutParams().height = getResources().getDimensionPixelSize(R.dimen.settings_screen_height);
        this.mAdapter = manuallySingleAdapter;
    }

    private void notifyTipsMargin(int i) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.updateTipBottomMargin(i, true);
        }
    }

    private void reInitManuallyLayout(int i, List<Completable> list) {
        if (this.mCurrentAdjustType != i) {
            switch (i) {
                case 0:
                    initRecyclerView(0, this);
                    break;
                case 1:
                    initRecyclerView(1, this);
                    break;
            }
            if (i == 0) {
                if (list == null) {
                    AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                } else if (this.mIndicatorButton.getVisibility() == 0) {
                    list.add(Completable.create(new AlphaOutOnSubscribe(this.mIndicatorButton)));
                } else {
                    list.add(Completable.create(new SlideOutOnSubscribe(this.mManuallyParent, 80)));
                }
            }
        }
    }

    private void setManuallyLayoutViewVisible(int i) {
        FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(254));
        switch (i) {
            case 1:
                if (this.mIndicatorButton.getVisibility() != 0) {
                    Completable.create(new SlideInOnSubscribe(this.mManuallyParent, 80)).subscribe();
                    break;
                } else {
                    return;
                }
            case 2:
                this.mCurrentAdjustType = 0;
                if (this.mIndicatorButton.getVisibility() != 0) {
                    Completable.create(new SlideOutOnSubscribe(this.mManuallyParent, 80)).subscribe();
                    break;
                } else {
                    Completable.create(new AlphaOutOnSubscribe(this.mIndicatorButton)).subscribe();
                    AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                    break;
                }
            case 3:
                this.mCurrentAdjustType = 0;
                if (this.mIndicatorButton.getVisibility() != 0) {
                    SlideOutOnSubscribe.directSetResult(this.mManuallyParent, 80);
                    break;
                } else {
                    AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
                    break;
                }
        }
    }

    public int getFragmentInto() {
        return 247;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_manually;
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mIndicatorButton = (ImageView) view.findViewById(R.id.manually_indicator);
        this.mIndicatorButton.setOnClickListener(this);
        this.mManuallyParent = (ViewGroup) view.findViewById(R.id.manually_adjust_layout);
        this.mRecyclerViewLayout = (ViewGroup) this.mManuallyParent.findViewById(R.id.manually_recycler_view_layout);
        this.mRecyclerView = this.mRecyclerViewLayout.findViewById(R.id.manually_recycler_view);
        this.mDecoration = new ManuallyDecoration(1, getResources().getColor(R.color.effect_divider_color));
        LinearLayoutManagerWrapper linearLayoutManagerWrapper = new LinearLayoutManagerWrapper(getContext(), "manually_recycler_view");
        linearLayoutManagerWrapper.setOrientation(0);
        this.mRecyclerView.setLayoutManager(linearLayoutManagerWrapper);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        if (this.mCurrentMode == 167 && this.mManuallyParent.getVisibility() != 0) {
            AlphaOutOnSubscribe.directSetResult(this.mIndicatorButton);
            Completable.create(new SlideInOnSubscribe(this.mManuallyParent, 80)).subscribe();
        }
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        adjustViewBackground(this.mCurrentMode);
        if (this.mCurrentAdjustType == 1 && this.mAdapter != null) {
            initManuallyDataList();
            this.mRecyclerView.setAdapter(this.mAdapter);
            this.mAdapter.notifyDataSetChanged();
        }
        FragmentManuallyExtra extraFragment = getExtraFragment();
        if (extraFragment != null) {
            extraFragment.notifyDataChanged(i, this.mCurrentMode);
        }
    }

    public boolean onBackEvent(int i) {
        if (this.mManuallyParent.getVisibility() != 0 || i == 3 || this.mIsHiding) {
            return false;
        }
        if (i == 2 && this.mFragmentManuallyExtra != null && this.mFragmentManuallyExtra.isAnimateIng()) {
            return false;
        }
        this.mIsHiding = true;
        float height = (float) this.mManuallyParent.getHeight();
        ViewCompat.animate(this.mManuallyParent).setStartDelay(0).translationY(height).setInterpolator(new OvershootInterpolator()).withEndAction(new Runnable() {
            public void run() {
                FragmentManually.this.mIsHiding = false;
                FragmentManually.this.mManuallyParent.setVisibility(4);
            }
        }).start();
        this.mIndicatorButton.setVisibility(0);
        ViewCompat.setTranslationY(this.mIndicatorButton, 0.0f);
        ViewCompat.setAlpha(this.mIndicatorButton, 0.0f);
        ViewCompat.animate(this.mIndicatorButton).setStartDelay(0).translationY(height).setDuration(300).setInterpolator(new OvershootInterpolator()).alpha(1.0f).start();
        return true;
    }

    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction == null || !cameraAction.isDoingAction()) {
                if (view.getId() != R.id.manually_indicator) {
                    ComponentData componentData = (ComponentData) view.getTag();
                    int displayTitleString = componentData.getDisplayTitleString();
                    if (displayTitleString != R.string.pref_camera_zoom_mode_title) {
                        this.mFragmentManuallyExtra = getExtraFragment();
                        if (this.mFragmentManuallyExtra == null) {
                            hideTips();
                            this.mFragmentManuallyExtra = new FragmentManuallyExtra();
                            this.mFragmentManuallyExtra.setComponentData(componentData, this.mCurrentMode, true, this);
                            FragmentUtils.addFragmentWithTag(getChildFragmentManager(), (int) R.id.manually_popup, (Fragment) this.mFragmentManuallyExtra, this.mFragmentManuallyExtra.getFragmentTag());
                            this.mRecyclerView.getAdapter().setSelectedTitle(displayTitleString);
                        } else if (this.mFragmentManuallyExtra.getCurrentTitle() == displayTitleString) {
                            this.mFragmentManuallyExtra.animateOut();
                            this.mRecyclerView.getAdapter().setSelectedTitle(-1);
                        } else {
                            hideTips();
                            this.mFragmentManuallyExtra.resetData(componentData);
                            this.mRecyclerView.getAdapter().setSelectedTitle(displayTitleString);
                        }
                    } else {
                        FragmentUtils.removeFragmentByTag(getChildFragmentManager(), String.valueOf(254));
                        this.mRecyclerView.getAdapter().setSelectedTitle(-1);
                        onManuallyDataChanged(componentData, null, null, false);
                    }
                } else {
                    hideTips();
                    this.mManuallyParent.setVisibility(0);
                    ViewCompat.animate(this.mManuallyParent).setStartDelay(100).translationY(0.0f).setInterpolator(new DecelerateInterpolator()).start();
                    ViewCompat.animate(this.mIndicatorButton).setInterpolator(new DecelerateInterpolator()).alpha(0.0f).setDuration(100).withEndAction(new Runnable() {
                        public void run() {
                            ViewCompat.setTranslationY(FragmentManually.this.mIndicatorButton, 0.0f);
                            FragmentManually.this.mIndicatorButton.setVisibility(4);
                        }
                    }).start();
                }
            }
        }
    }

    public Animation onCreateAnimation(int i, boolean z, int i2) {
        return super.onCreateAnimation(i, z, i2);
    }

    public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
        if (isEnableClick()) {
            ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
            if (manuallyValueChanged != null) {
                switch (componentData.getDisplayTitleString()) {
                    case R.string.pref_camera_whitebalance_title /*2131296363*/:
                        if (str2.equals("manual")) {
                            getExtraFragment().showCustomWB((ComponentManuallyWB) componentData);
                        }
                        manuallyValueChanged.onWBValueChanged((ComponentManuallyWB) componentData, str2, z);
                        break;
                    case R.string.pref_camera_iso_title /*2131296433*/:
                        manuallyValueChanged.onISOValueChanged((ComponentManuallyISO) componentData, str2);
                        break;
                    case R.string.pref_manual_exposure_title /*2131296573*/:
                        manuallyValueChanged.onETValueChanged((ComponentManuallyET) componentData, str2);
                        break;
                    case R.string.pref_qc_focus_position_title /*2131296613*/:
                        manuallyValueChanged.onFocusValueChanged((ComponentManuallyFocus) componentData, str, str2);
                        break;
                    case R.string.pref_camera_zoom_mode_title /*2131296664*/:
                        manuallyValueChanged.onDualLensSwitch((ComponentManuallyDualLens) componentData, this.mCurrentMode);
                        break;
                }
                if (this.mRecyclerView.getAdapter() != null) {
                    this.mRecyclerView.post(new Runnable() {
                        public void run() {
                            FragmentManually.this.mRecyclerView.getAdapter().notifyDataSetChanged();
                        }
                    });
                }
            }
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        reInitManuallyLayout(i != 167 ? 0 : 1, list);
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        return null;
    }

    /* access modifiers changed from: protected */
    public Animation provideExitAnimation() {
        return null;
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(181, this);
        registerBackStack(modeCoordinator, this);
    }

    public void setManuallyLayoutVisible(boolean z) {
        if (z) {
            this.mCurrentAdjustType = this.mCurrentMode != 167 ? 0 : 1;
            this.mManuallyParent.setVisibility(0);
            return;
        }
        this.mCurrentAdjustType = 0;
        this.mManuallyParent.setVisibility(4);
    }

    public int setManuallyVisible(int i, int i2, ManuallyListener manuallyListener) {
        int initRecyclerView = initRecyclerView(i, manuallyListener);
        if (this.mAdapter != null) {
            this.mRecyclerView.setAdapter(this.mAdapter);
        }
        setManuallyLayoutViewVisible(i2);
        return initRecyclerView;
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        modeCoordinator.detachProtocol(181, this);
        unRegisterBackStack(modeCoordinator, this);
        FragmentTransaction beginTransaction = getChildFragmentManager().beginTransaction();
        if (this.mFragmentManuallyExtra != null) {
            beginTransaction.remove(this.mFragmentManuallyExtra);
        }
        beginTransaction.commitAllowingStateLoss();
    }

    public int visibleHeight() {
        if (this.mCurrentAdjustType == 0 || this.mCurrentAdjustType == -1) {
            return 0;
        }
        return this.mIndicatorButton.getVisibility() == 0 ? this.mIndicatorButton.getHeight() : this.mManuallyParent.getHeight() + (getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal) / 2);
    }
}
