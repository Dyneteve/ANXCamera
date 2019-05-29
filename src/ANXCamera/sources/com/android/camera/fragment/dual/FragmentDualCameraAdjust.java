package com.android.camera.fragment.dual;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorInflater;
import android.animation.AnimatorSet;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.os.Handler;
import android.os.Message;
import android.support.v4.view.ViewCompat;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.OvershootInterpolator;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.SlideInOnSubscribe;
import com.android.camera.animation.type.SlideOutOnSubscribe;
import com.android.camera.animation.type.TranslateYAlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.ComponentData;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyDualZoom;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.fragment.manually.adapter.AbstractZoomSliderAdapter;
import com.android.camera.fragment.manually.adapter.sat.DuoSatZoomSliderAdapter;
import com.android.camera.fragment.manually.adapter.sat.TriSatZoomSliderAdapter;
import com.android.camera.log.Log;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.ManuallyValueChanged;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.SnapShotIndicator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.ui.HorizontalSlideView;
import com.android.camera.ui.zoom.ZoomRatioToggleView;
import com.android.camera.ui.zoom.ZoomRatioToggleView.ToggleStateListener;
import com.android.camera.ui.zoom.ZoomRatioToggleView.ViewSpec;
import com.android.camera.ui.zoom.ZoomRatioView;
import com.mi.config.b;
import io.reactivex.Completable;
import io.reactivex.functions.Action;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;
import miui.view.animation.ElasticEaseOutInterpolator;
import miui.view.animation.QuadraticEaseInOutInterpolator;

public class FragmentDualCameraAdjust extends BaseFragment implements ManuallyListener, DualController, HandleBackTrace, SnapShotIndicator, ToggleStateListener {
    public static final int FRAGMENT_INFO = 4084;
    private static final int HIDE_POPUP = 1;
    private static final String TAG = "FragmentDualCameraAdjust";
    private int mCurrentState = -1;
    private ViewGroup mDualParentLayout;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                FragmentDualCameraAdjust.this.onBackEvent(5);
            }
        }
    };
    /* access modifiers changed from: private */
    public ViewGroup mHorizontalSlideLayout;
    private HorizontalSlideView mHorizontalSlideView;
    /* access modifiers changed from: private */
    public boolean mIsHiding;
    private boolean mIsRecordingOrPausing = false;
    /* access modifiers changed from: private */
    public boolean mIsZoomTo2X;
    private boolean mPassTouchFromZoomButtonToSlide;
    private AbstractZoomSliderAdapter mSlidingAdapter;
    private float mTouchDownX = -1.0f;
    /* access modifiers changed from: private */
    public AnimatorSet mZoomInAnimator;
    /* access modifiers changed from: private */
    public AnimatorSet mZoomOutAnimator;
    private float mZoomRatio;
    private ValueAnimator mZoomRatioToggleAnimator;
    private ZoomRatioToggleView mZoomRatioToggleView;
    private int mZoomSliderLayoutHeight;
    private int mZoomSliderViewMiddleX = -1;
    private OnTouchListener mZoomSliderViewTouchListener = new OnTouchListener() {
        private boolean mAnimated = false;

        public boolean onTouch(View view, MotionEvent motionEvent) {
            if (motionEvent.getAction() == 2) {
                if (!this.mAnimated) {
                    FragmentDualCameraAdjust.this.mZoomInAnimator.start();
                    this.mAnimated = true;
                }
            } else if ((motionEvent.getAction() == 1 || motionEvent.getAction() == 3) && this.mAnimated) {
                FragmentDualCameraAdjust.this.mZoomOutAnimator.start();
                this.mAnimated = false;
            }
            FragmentDualCameraAdjust.this.sendHideMessage();
            return false;
        }
    };
    private int mZoomSwitchLayoutHeight;

    private void adjustViewBackground(View view, int i) {
        view.setBackgroundResource(R.color.fullscreen_background);
    }

    private void alphaOutZoomButtonAndSlideView() {
        if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            this.mIsHiding = true;
            this.mSlidingAdapter.setEnable(false);
            Completable.create(new TranslateYAlphaOutOnSubscribe(this.mHorizontalSlideLayout, this.mZoomSliderLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe((Action) new Action() {
                public void run() throws Exception {
                    FragmentDualCameraAdjust.this.mIsHiding = false;
                    FragmentDualCameraAdjust.this.mHorizontalSlideLayout.setVisibility(4);
                }
            });
            if (this.mCurrentMode == 163) {
                CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                if (cameraModuleSpecial != null) {
                    cameraModuleSpecial.showOrHideChip(false);
                }
            }
            this.mCurrentState = -1;
            ViewCompat.setTranslationY(this.mZoomRatioToggleView, 0.0f);
            Completable.create(new TranslateYAlphaOutOnSubscribe(this.mZoomRatioToggleView, this.mZoomSliderLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe();
        } else {
            hideZoomButton();
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            if (topAlert != null) {
                topAlert.alertUpdateValue(2);
            }
        }
        notifyTipsMargin();
    }

    /* JADX WARNING: Removed duplicated region for block: B:56:0x00ad  */
    /* JADX WARNING: Removed duplicated region for block: B:57:0x00af  */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x00b4  */
    /* JADX WARNING: Removed duplicated region for block: B:89:0x011e  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static ViewSpec getViewSpecForCapturingMode(int i) {
        boolean z;
        boolean z2;
        int i2;
        boolean z3;
        boolean z4;
        int i3;
        int i4;
        boolean z5 = false;
        int i5 = -1;
        boolean z6 = true;
        if (DataRepository.dataItemGlobal().getCurrentCameraId() != 1 && !CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isAutoZoomEnabled(i) && HybridZoomingSystem.IS_2_OR_MORE_SAT) {
            if (i == 161) {
                i3 = (!HybridZoomingSystem.IS_2_SAT && !CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isUltraWideConfigOpen(i)) ? 1 : -1;
                z2 = i3 == -1;
                if (i3 != -1) {
                    z6 = false;
                }
            } else if (i == 174) {
                i3 = (!HybridZoomingSystem.IS_2_SAT && !CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isUltraWideConfigOpen(i)) ? 1 : -1;
                z2 = i3 == -1;
                if (i3 != -1) {
                    z6 = false;
                }
            } else if (i == 162) {
                if (!HybridZoomingSystem.IS_2_SAT) {
                    MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                    if ((miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) && !CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isUltraWideConfigOpen(i)) {
                        i4 = 1;
                        z2 = i3 != -1;
                        if (i3 != -1) {
                            z6 = false;
                        }
                    }
                }
                i4 = -1;
                if (i3 != -1) {
                }
                if (i3 != -1) {
                }
            } else {
                if (i == 163) {
                    if (!CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isUltraWideConfigOpen(i) && !CameraSettings.isUltraPixelRear48MPOn()) {
                        i5 = 1;
                    }
                    z3 = HybridZoomingSystem.IS_2_SAT;
                    z4 = HybridZoomingSystem.IS_2_SAT;
                } else if (i == 165) {
                    if (!CameraSettings.isMacroModeEnabled(i) && !CameraSettings.isUltraWideConfigOpen(i)) {
                        i5 = 1;
                    }
                    z3 = HybridZoomingSystem.IS_2_SAT;
                    z4 = HybridZoomingSystem.IS_2_SAT;
                } else if (i == 173) {
                    z = true;
                    z2 = true;
                    i5 = 1;
                    if (CameraSettings.isSupportedOpticalZoom()) {
                        z5 = z6;
                    }
                    return new ViewSpec(i5, z2, z, z5);
                } else if (i == 166 && DataRepository.dataItemFeature().fV()) {
                    i2 = 1;
                }
                boolean z7 = z4;
                z2 = z3;
                z = z7;
                if (CameraSettings.isSupportedOpticalZoom()) {
                }
                return new ViewSpec(i5, z2, z, z5);
            }
            i2 = i3;
            z = z6;
            z6 = false;
            if (CameraSettings.isSupportedOpticalZoom()) {
            }
            return new ViewSpec(i5, z2, z, z5);
        }
        z = true;
        z2 = true;
        z6 = false;
        if (CameraSettings.isSupportedOpticalZoom()) {
        }
        return new ViewSpec(i5, z2, z, z5);
    }

    private void initSlideZoomView(ComponentData componentData) {
        if (HybridZoomingSystem.IS_2_SAT || this.mCurrentMode == 173) {
            this.mSlidingAdapter = new DuoSatZoomSliderAdapter(getContext(), componentData, this.mCurrentMode, this);
        } else if (HybridZoomingSystem.IS_3_SAT) {
            this.mSlidingAdapter = new TriSatZoomSliderAdapter(getContext(), componentData, this.mCurrentMode, this);
        }
        this.mHorizontalSlideView.setOnPositionSelectListener(this.mSlidingAdapter);
        this.mHorizontalSlideView.setJustifyEnabled(false);
        this.mHorizontalSlideView.setDrawAdapter(this.mSlidingAdapter);
        if (HybridZoomingSystem.IS_3_SAT) {
            float decimal = HybridZoomingSystem.toDecimal(CameraSettings.readZoom());
            if (decimal < HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR || decimal > HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE) {
                updateZoomSliderPosition();
                return;
            }
            this.mHorizontalSlideView.setSelection(((int) (decimal * 10.0f)) - ((int) (HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR * 10.0f)));
            return;
        }
        updateZoomSliderPosition();
    }

    private void initiateZoomRatio() {
        if (CameraSettings.isZoomByCameraSwitchingSupported()) {
            String cameraLensType = CameraSettings.getCameraLensType(this.mCurrentMode);
            if (ComponentManuallyDualLens.LENS_ULTRA.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR;
            } else if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE;
            } else if (ComponentManuallyDualLens.LENS_TELE.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("initiateZoomRatio(): Unknown camera lens type: ");
                sb.append(cameraLensType);
                throw new IllegalStateException(sb.toString());
            }
            String str = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("initiateZoomRatio(): lens-switch-zoom: ");
            sb2.append(this.mZoomRatio);
            Log.d(str, sb2.toString());
        } else if (HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mCurrentMode == 162) {
            this.mZoomRatio = Float.parseFloat(HybridZoomingSystem.getZoomRatioHistory(this.mCurrentMode, "1.0"));
            String str2 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("initiateZoomRatio(): fake-sat-zoom: ");
            sb3.append(this.mZoomRatio);
            Log.d(str2, sb3.toString());
        } else if (HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mCurrentMode == 174) {
            this.mZoomRatio = Float.parseFloat(HybridZoomingSystem.getZoomRatioHistory(this.mCurrentMode, "1.0"));
            String str3 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("initiateZoomRatio(): fake-sat-zoom: ");
            sb4.append(this.mZoomRatio);
            Log.d(str3, sb4.toString());
        } else if (HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mCurrentMode == 161) {
            this.mZoomRatio = Float.parseFloat(HybridZoomingSystem.getZoomRatioHistory(this.mCurrentMode, "1.0"));
            String str4 = TAG;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("initiateZoomRatio(): fake-sat-zoom: ");
            sb5.append(this.mZoomRatio);
            Log.d(str4, sb5.toString());
        } else if (!HybridZoomingSystem.IS_3_OR_MORE_SAT || CameraSettings.isSupportedOpticalZoom() || !(this.mCurrentMode == 163 || this.mCurrentMode == 165)) {
            this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE;
            String str5 = TAG;
            StringBuilder sb6 = new StringBuilder();
            sb6.append("initiateZoomRatio(): real-sat-zoom: ");
            sb6.append(this.mZoomRatio);
            Log.d(str5, sb6.toString());
        } else {
            this.mZoomRatio = Float.parseFloat(HybridZoomingSystem.getZoomRatioHistory(this.mCurrentMode, "1.0"));
            String str6 = TAG;
            StringBuilder sb7 = new StringBuilder();
            sb7.append("initiateZoomRatio(): fake-sat-zoom: ");
            sb7.append(this.mZoomRatio);
            Log.d(str6, sb7.toString());
        }
    }

    private void notifyTipsMargin() {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directHideTipImage();
            bottomPopupTips.directlyHideTips();
            bottomPopupTips.directShowOrHideLeftTipImage(false);
        }
    }

    /* access modifiers changed from: private */
    public void notifyZoom2X(boolean z) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged == null) {
            return;
        }
        if (Util.isZoomAnimationEnabled() || z) {
            manuallyValueChanged.onDualZoomHappened(z);
        }
    }

    /* access modifiers changed from: private */
    public void notifyZooming(boolean z) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensZooming(z);
        }
    }

    /* access modifiers changed from: private */
    public void requestZoomRatio(float f, int i) {
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualZoomValueChanged(f, i);
        }
    }

    /* access modifiers changed from: private */
    public void sendHideMessage() {
        this.mHandler.removeMessages(1);
        this.mHandler.sendEmptyMessageDelayed(1, 5000);
    }

    private void showSlideView() {
        this.mIsHiding = false;
        this.mSlidingAdapter.setEnable(true);
        this.mHorizontalSlideLayout.setVisibility(0);
        ViewCompat.setTranslationY(this.mHorizontalSlideLayout, (float) this.mZoomSliderLayoutHeight);
        ViewCompat.setAlpha(this.mHorizontalSlideLayout, 1.0f);
        Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, 0).setInterpolator(new DecelerateInterpolator())).subscribe();
        setImmersiveModeEnabled(true);
        ViewCompat.setTranslationY(this.mZoomRatioToggleView, (float) this.mZoomSliderLayoutHeight);
        Completable.create(new TranslateYOnSubscribe(this.mZoomRatioToggleView, 0).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        notifyTipsMargin();
        if (this.mCurrentMode == 163) {
            CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
            if (cameraModuleSpecial != null) {
                cameraModuleSpecial.showOrHideChip(false);
            }
        }
    }

    private void switchCameraLens() {
        String str;
        ComponentManuallyDualLens manuallyDualLens = DataRepository.dataItemConfig().getManuallyDualLens();
        ManuallyValueChanged manuallyValueChanged = (ManuallyValueChanged) ModeCoordinatorImpl.getInstance().getAttachProtocol(174);
        if (manuallyValueChanged != null) {
            manuallyValueChanged.onDualLensSwitch(manuallyDualLens, this.mCurrentMode);
            updateZoomRatio(0);
        }
        String componentValue = manuallyDualLens.getComponentValue(this.mCurrentMode);
        if (ComponentManuallyDualLens.LENS_ULTRA.equals(componentValue)) {
            str = HybridZoomingSystem.STRING_ZOOM_RATIO_ULTR;
        } else if (ComponentManuallyDualLens.LENS_WIDE.equals(componentValue)) {
            str = HybridZoomingSystem.STRING_ZOOM_RATIO_WIDE;
        } else if (ComponentManuallyDualLens.LENS_TELE.equals(componentValue)) {
            str = HybridZoomingSystem.STRING_ZOOM_RATIO_TELE;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("switchCameraLens(): Unknown camera lens type: ");
            sb.append(componentValue);
            throw new IllegalStateException(sb.toString());
        }
        CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, str);
    }

    private void updateZoomSliderPosition() {
        if (this.mSlidingAdapter != null && this.mHorizontalSlideView != null) {
            this.mHorizontalSlideView.setSelection(this.mSlidingAdapter.mapZoomRatioToPosition(CameraSettings.readZoom()) / ((float) (this.mSlidingAdapter.getCount() - 1)));
        }
    }

    public int getFragmentInto() {
        return 4084;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_dual_camera_adjust;
    }

    public void hideSlideView() {
        if (this.mHorizontalSlideLayout.getVisibility() == 0) {
            this.mIsHiding = true;
            this.mSlidingAdapter.setEnable(false);
            Completable.create(new TranslateYOnSubscribe(this.mHorizontalSlideLayout, this.mZoomSliderLayoutHeight).setInterpolator(new ElasticEaseOutInterpolator(1.1f, 2.0f))).subscribe((Action) new Action() {
                public void run() throws Exception {
                    FragmentDualCameraAdjust.this.mIsHiding = false;
                    FragmentDualCameraAdjust.this.mHorizontalSlideLayout.setVisibility(4);
                }
            });
            ViewCompat.setTranslationY(this.mZoomRatioToggleView, 0.0f);
            setImmersiveModeEnabled(false);
            Completable.create(new TranslateYOnSubscribe(this.mZoomRatioToggleView, this.mZoomSliderLayoutHeight).setInterpolator(new OvershootInterpolator())).subscribe();
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.reInitTipImage();
            }
            if (this.mCurrentMode == 163) {
                CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                if (cameraModuleSpecial != null) {
                    cameraModuleSpecial.showOrHideChip(true);
                }
            }
        }
    }

    public void hideZoomButton() {
        if (this.mCurrentState != -1) {
            this.mCurrentState = -1;
            Completable.create(new AlphaOutOnSubscribe(this.mZoomRatioToggleView)).subscribe();
            if (this.mHorizontalSlideLayout != null && this.mHorizontalSlideLayout.getVisibility() == 0) {
                this.mIsHiding = true;
                this.mSlidingAdapter.setEnable(false);
                this.mHorizontalSlideLayout.setVisibility(4);
                ViewCompat.setTranslationY(this.mHorizontalSlideLayout, (float) this.mZoomSliderLayoutHeight);
                ViewCompat.setTranslationY(this.mZoomRatioToggleView, (float) this.mZoomSliderLayoutHeight);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mDualParentLayout = (ViewGroup) view.findViewById(R.id.dual_layout_parent);
        this.mHorizontalSlideLayout = (ViewGroup) view.findViewById(R.id.dual_camera_zoom_slider_container);
        this.mZoomRatioToggleView = (ZoomRatioToggleView) view.findViewById(R.id.zoom_ratio_toggle_button);
        this.mZoomRatioToggleView.setActionListener(this);
        View findViewById = view.findViewById(R.id.sat_optical_zoom_switch_simulator);
        findViewById.setOnClickListener(this.mZoomRatioToggleView);
        findViewById.setOnLongClickListener(this.mZoomRatioToggleView);
        this.mHorizontalSlideView = (HorizontalSlideView) view.findViewById(R.id.dual_camera_zoom_slider);
        this.mHorizontalSlideView.setOnTouchListener(this.mZoomSliderViewTouchListener);
        this.mZoomSliderViewMiddleX = getResources().getDisplayMetrics().widthPixels / 2;
        this.mZoomRatioToggleAnimator = new ValueAnimator();
        this.mZoomRatioToggleAnimator.setInterpolator(new LinearInterpolator());
        if (!Util.isZoomAnimationEnabled() || HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            this.mZoomRatioToggleAnimator.setDuration(0);
        } else {
            this.mZoomRatioToggleAnimator.setDuration(100);
        }
        this.mZoomRatioToggleAnimator.addUpdateListener(new AnimatorUpdateListener() {
            public void onAnimationUpdate(ValueAnimator valueAnimator) {
                float floatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                String str = FragmentDualCameraAdjust.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onAnimationUpdate(): zoom ratio = ");
                sb.append(floatValue);
                Log.d(str, sb.toString());
                FragmentDualCameraAdjust.this.requestZoomRatio(floatValue, 0);
            }
        });
        this.mZoomRatioToggleAnimator.addListener(new AnimatorListener() {
            public void onAnimationCancel(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationEnd(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(false);
                FragmentDualCameraAdjust.this.mIsZoomTo2X = false;
                FragmentDualCameraAdjust.this.notifyZoom2X(false);
            }

            public void onAnimationRepeat(Animator animator) {
            }

            public void onAnimationStart(Animator animator) {
                FragmentDualCameraAdjust.this.notifyZooming(true);
                if (FragmentDualCameraAdjust.this.mIsZoomTo2X) {
                    FragmentDualCameraAdjust.this.notifyZoom2X(true);
                } else {
                    FragmentDualCameraAdjust.this.notifyZoom2X(false);
                }
            }
        });
        this.mZoomInAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_in);
        this.mZoomInAnimator.setTarget(this.mZoomRatioToggleView);
        this.mZoomInAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        this.mZoomOutAnimator = (AnimatorSet) AnimatorInflater.loadAnimator(getContext(), R.animator.zoom_button_zoom_out);
        this.mZoomOutAnimator.setTarget(this.mZoomRatioToggleView);
        this.mZoomOutAnimator.setInterpolator(new QuadraticEaseInOutInterpolator());
        int i = getResources().getDisplayMetrics().widthPixels;
        float f = (float) i;
        this.mHorizontalSlideLayout.getLayoutParams().height = ((int) (((f / 0.75f) - f) / 2.0f)) + getResources().getDimensionPixelSize(R.dimen.square_mode_bottom_cover_extra_margin);
        this.mZoomSliderLayoutHeight = this.mHorizontalSlideLayout.getLayoutParams().height;
        this.mZoomSwitchLayoutHeight = this.mZoomRatioToggleView.getLayoutParams().height;
        adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public boolean isInteractive() {
        if (!isEnableClick()) {
            return false;
        }
        CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
        return cameraAction == null || (!cameraAction.isDoingAction() && !cameraAction.isRecording());
    }

    public boolean isSlideVisible() {
        if (this.mCurrentState == -1 || this.mSlidingAdapter == null) {
            return false;
        }
        return this.mSlidingAdapter.isEnable();
    }

    public boolean isZoomVisible() {
        return !CameraSettings.isMacroModeEnabled(this.mCurrentMode) && this.mCurrentState == 1 && this.mZoomRatioToggleView.getVisibility() == 0;
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        provideAnimateElement(this.mCurrentMode, null, 2);
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        if (i == 3) {
            adjustViewBackground(this.mHorizontalSlideLayout, this.mCurrentMode);
        }
    }

    public boolean onBackEvent(int i) {
        if (this.mDualParentLayout.getVisibility() != 0 || this.mIsHiding) {
            return false;
        }
        boolean z = i == 3 && this.mCurrentMode == 173;
        if (!z && this.mHorizontalSlideLayout.getVisibility() != 0) {
            return false;
        }
        if (z) {
            alphaOutZoomButtonAndSlideView();
        } else {
            hideSlideView();
        }
        return true;
    }

    public void onClick(ZoomRatioView zoomRatioView) {
        int zoomRatioIndex = zoomRatioView.getZoomRatioIndex();
        if (!isSlideVisible()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onClick(): current zoom ratio index = ");
            sb.append(zoomRatioIndex);
            Log.d(str, sb.toString());
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onClick(): current zoom ratio value = ");
            sb2.append(this.mZoomRatio);
            Log.d(str2, sb2.toString());
            if (this.mZoomRatioToggleView.isSuppressed()) {
                if (CameraSettings.isZoomByCameraSwitchingSupported()) {
                    switchCameraLens();
                } else if (this.mZoomRatio == HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE) {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, HybridZoomingSystem.STRING_ZOOM_RATIO_TELE);
                    this.mIsZoomTo2X = true;
                    this.mZoomRatioToggleAnimator.setFloatValues(new float[]{this.mZoomRatio, HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE});
                    this.mZoomRatioToggleAnimator.start();
                } else if (this.mZoomRatio <= HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE) {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, HybridZoomingSystem.STRING_ZOOM_RATIO_WIDE);
                    this.mIsZoomTo2X = false;
                    this.mZoomRatioToggleAnimator.setFloatValues(new float[]{this.mZoomRatio, HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE});
                    this.mZoomRatioToggleAnimator.start();
                } else {
                    CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, HybridZoomingSystem.STRING_ZOOM_RATIO_WIDE);
                    requestZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE, 0);
                    requestZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE, 0);
                }
            } else if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                float opticalZoomRatioAt = HybridZoomingSystem.getOpticalZoomRatioAt(zoomRatioIndex);
                CameraStatUtil.trackDualZoomChanged(this.mCurrentMode, HybridZoomingSystem.toString(opticalZoomRatioAt));
                this.mIsZoomTo2X = false;
                this.mZoomRatioToggleAnimator.setFloatValues(new float[]{this.mZoomRatio, opticalZoomRatioAt});
                this.mZoomRatioToggleAnimator.start();
            }
        }
        onBackEvent(5);
    }

    public boolean onLongClick(ZoomRatioView zoomRatioView) {
        initSlideZoomView(new ComponentManuallyDualZoom(DataRepository.dataItemRunning()));
        showSlideView();
        this.mPassTouchFromZoomButtonToSlide = true;
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.hideQrCodeTip();
        }
        return true;
    }

    public void onManuallyDataChanged(ComponentData componentData, String str, String str2, boolean z) {
        if (!isInModeChanging()) {
            CameraStatUtil.trackZoomAdjusted(CameraStat.ZOOM_MODE_SLIDER);
            requestZoomRatio(Float.valueOf(str2).floatValue(), 3);
        }
    }

    public boolean onTouch(ZoomRatioToggleView zoomRatioToggleView, MotionEvent motionEvent) {
        if (!this.mPassTouchFromZoomButtonToSlide) {
            return false;
        }
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (this.mDegree == 90) {
            motionEvent.setLocation(-y, x);
        } else if (this.mDegree == 180) {
            motionEvent.setLocation(-x, -y);
        } else if (this.mDegree == 270) {
            motionEvent.setLocation(y, x);
        }
        switch (motionEvent.getAction()) {
            case 1:
            case 3:
                motionEvent.setLocation(((float) this.mZoomSliderViewMiddleX) + (motionEvent.getX() - this.mTouchDownX), motionEvent.getY());
                this.mHorizontalSlideView.onTouchEvent(motionEvent);
                this.mZoomSliderViewTouchListener.onTouch(null, motionEvent);
                this.mPassTouchFromZoomButtonToSlide = false;
                this.mTouchDownX = -1.0f;
                break;
            case 2:
                if (this.mTouchDownX != -1.0f) {
                    motionEvent.setLocation(((float) this.mZoomSliderViewMiddleX) + (motionEvent.getX() - this.mTouchDownX), motionEvent.getY());
                    this.mHorizontalSlideView.onTouchEvent(motionEvent);
                    this.mZoomSliderViewTouchListener.onTouch(null, motionEvent);
                    break;
                } else {
                    this.mTouchDownX = motionEvent.getX();
                    motionEvent.setAction(0);
                    motionEvent.setLocation((float) this.mZoomSliderViewMiddleX, motionEvent.getY());
                    this.mHorizontalSlideView.onTouchEvent(motionEvent);
                    break;
                }
        }
        return true;
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        boolean z;
        int i3 = this.mCurrentMode;
        super.provideAnimateElement(i, list, i2);
        boolean z2 = false;
        this.mIsRecordingOrPausing = false;
        initiateZoomRatio();
        ViewSpec viewSpecForCapturingMode = getViewSpecForCapturingMode(this.mCurrentMode);
        if (viewSpecForCapturingMode.visibility == 1) {
            onBackEvent(4);
            int zoomingSourceIdentity = HybridZoomingSystem.getZoomingSourceIdentity();
            if (zoomingSourceIdentity != 0) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("provideAnimateElement(): getZoomingSourceIdentity: ");
                sb.append(zoomingSourceIdentity);
                Log.d(str, sb.toString());
                z = true;
            } else {
                z = false;
            }
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("provideAnimateElement(): initialized zoom ratio: ");
            sb2.append(this.mZoomRatio);
            Log.d(str2, sb2.toString());
            this.mZoomRatioToggleView.setRotation((float) this.mDegree);
            this.mZoomRatioToggleView.setSuppressed(viewSpecForCapturingMode.suppress);
            ZoomRatioToggleView zoomRatioToggleView = this.mZoomRatioToggleView;
            if (z || viewSpecForCapturingMode.immersive) {
                z2 = true;
            }
            zoomRatioToggleView.setImmersive(z2);
            this.mZoomRatioToggleView.setZoomRatio(this.mZoomRatio, -1);
            this.mZoomRatioToggleView.setLongClickAllowed(viewSpecForCapturingMode.useSlider);
            this.mZoomRatioToggleView.startInactiveTimer();
        }
        if (this.mCurrentState != viewSpecForCapturingMode.visibility) {
            this.mCurrentState = viewSpecForCapturingMode.visibility;
            int i4 = this.mCurrentState;
            if (i4 != -1) {
                if (i4 == 1) {
                    if (this.mDualParentLayout.getVisibility() != 0) {
                        SlideInOnSubscribe.directSetResult(this.mDualParentLayout, 80);
                    }
                    SlideOutOnSubscribe.directSetResult(this.mHorizontalSlideLayout, 80);
                    ViewCompat.setTranslationY(this.mZoomRatioToggleView, (float) this.mZoomSliderLayoutHeight);
                    if (list == null || (i == 165 && i3 != 167)) {
                        AlphaInOnSubscribe.directSetResult(this.mZoomRatioToggleView);
                    } else if (i3 == 167) {
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mZoomRatioToggleView).setStartDelayTime(150)));
                    } else {
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mZoomRatioToggleView)));
                    }
                }
            } else if (this.mHorizontalSlideLayout.getVisibility() == 0) {
                if (list == null) {
                    this.mHorizontalSlideLayout.setVisibility(8);
                } else {
                    list.add(Completable.create(new SlideOutOnSubscribe(this.mDualParentLayout, 80)));
                }
            } else if (list == null || i3 == 165) {
                AlphaOutOnSubscribe.directSetResult(this.mZoomRatioToggleView);
            } else {
                list.add(Completable.create(new AlphaOutOnSubscribe(this.mZoomRatioToggleView)));
            }
        }
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mZoomRatioToggleView.getVisibility() == 0) {
            list.add(this.mZoomRatioToggleView);
        }
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(182, this);
        registerBackStack(modeCoordinator, this);
        if (b.isSupportedOpticalZoom() || HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            modeCoordinator.attachProtocol(184, this);
        }
    }

    public void setClickEnable(boolean z) {
        super.setClickEnable(z);
        if (this.mZoomRatioToggleView != null) {
            this.mZoomRatioToggleView.setEnabled(z);
        }
    }

    public void setImmersiveModeEnabled(boolean z) {
        this.mZoomRatioToggleView.setImmersive(z);
    }

    public void setRecordingOrPausing(boolean z) {
        this.mIsRecordingOrPausing = z;
    }

    public void setSnapNumValue(int i) {
        this.mZoomRatioToggleView.setCaptureCount(i);
    }

    public void setSnapNumVisible(boolean z, boolean z2) {
        if (this.mHorizontalSlideLayout != null) {
            if (z) {
                if (z2) {
                    if (this.mHorizontalSlideLayout.getVisibility() == 0) {
                        hideSlideView();
                    }
                    this.mZoomInAnimator.start();
                } else {
                    ViewCompat.setRotation(this.mZoomRatioToggleView, (float) this.mDegree);
                    this.mZoomRatioToggleView.setVisibility(0);
                }
                this.mZoomRatioToggleView.setImmersive(true);
            } else {
                updateZoomRatio(-1);
                this.mZoomRatioToggleView.setImmersive(false);
                if (z2) {
                    this.mZoomOutAnimator.start();
                }
            }
        }
    }

    public void showZoomButton() {
        if (this.mCurrentState != 1 && !this.mIsRecordingOrPausing) {
            this.mCurrentState = 1;
            updateZoomRatio(-1);
            ViewCompat.setRotation(this.mZoomRatioToggleView, (float) this.mDegree);
            Completable.create(new AlphaInOnSubscribe(this.mZoomRatioToggleView)).subscribe();
        }
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(182, this);
        unRegisterBackStack(modeCoordinator, this);
        if (b.isSupportedOpticalZoom() || HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            modeCoordinator.detachProtocol(184, this);
        }
    }

    public void updateZoomRatio(int i) {
        if (CameraSettings.isZoomByCameraSwitchingSupported()) {
            String cameraLensType = CameraSettings.getCameraLensType(this.mCurrentMode);
            if (ComponentManuallyDualLens.LENS_ULTRA.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR;
            } else if (ComponentManuallyDualLens.LENS_WIDE.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE;
            } else if (ComponentManuallyDualLens.LENS_TELE.equals(cameraLensType)) {
                this.mZoomRatio = HybridZoomingSystem.FLOAT_ZOOM_RATIO_TELE;
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("updateZoomRatio(): Unknown camera lens type: ");
                sb.append(cameraLensType);
                throw new IllegalStateException(sb.toString());
            }
        } else {
            this.mZoomRatio = CameraSettings.readZoom();
        }
        if (!this.mZoomRatioToggleAnimator.isRunning() || HybridZoomingSystem.isOpticalZoomRatio(this.mZoomRatio)) {
            this.mZoomRatioToggleView.setZoomRatio(this.mZoomRatio, i);
            if (i != 3) {
                updateZoomSliderPosition();
            }
        }
    }

    public int visibleHeight() {
        if (this.mCurrentState == -1) {
            return 0;
        }
        return this.mHorizontalSlideLayout.getVisibility() == 0 ? this.mZoomSliderLayoutHeight + this.mZoomRatioToggleView.getHeight() : this.mZoomSwitchLayoutHeight;
    }
}
