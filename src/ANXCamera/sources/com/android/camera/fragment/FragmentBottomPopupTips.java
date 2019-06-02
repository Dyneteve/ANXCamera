package com.android.camera.fragment;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.animation.ValueAnimator.AnimatorUpdateListener;
import android.os.Handler;
import android.os.Message;
import android.support.annotation.StringRes;
import android.support.v4.view.ViewCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.Animation;
import android.view.animation.OvershootInterpolator;
import android.view.animation.PathInterpolator;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.android.camera.ActivityBase;
import com.android.camera.Camera;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.R;
import com.android.camera.Util;
import com.android.camera.animation.FragmentAnimationFactory;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.animation.type.TranslateYOnSubscribe;
import com.android.camera.constant.DurationConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.mimoji.FragmentMimoji;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BokehFNumberController;
import com.android.camera.protocol.ModeProtocol.BottomMenuProtocol;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.HandleBackTrace;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.ManuallyAdjust;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.ModeCoordinator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.VerticalProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.mi.config.b;
import io.reactivex.Completable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;
import miui.view.animation.BackEaseOutInterpolator;

public class FragmentBottomPopupTips extends BaseFragment implements OnClickListener, BottomPopupTips, HandleBackTrace {
    private static final int ANIM_DELAY_SHOW = 3;
    private static final int ANIM_DIRECT_HIDE = 1;
    private static final int ANIM_DIRECT_SHOW = 0;
    private static final int ANIM_HIDE = 4;
    private static final int ANIM_SHOW = 2;
    private static final int CALL_TYPE_NOTIFY = 1;
    private static final int CALL_TYPE_PROVIDE = 0;
    private static final int CENTER_TIP_IMAGE_MIMOJI = 34;
    private static final int CENTER_TIP_IMAGE_SPEED = 33;
    public static final int FRAGMENT_INFO = 4081;
    private static final int LEFT_TIP_IMAGE_CLOSE = 20;
    private static final int LEFT_TIP_IMAGE_LIGHTING = 19;
    private static final int LEFT_TIP_IMAGE_STICKER = 18;
    private static final int LEFT_TIP_IMAGE_ULTRA_WIDE = 21;
    private static final long MAX_RED_DOT_TIME = 86400000;
    private static final int MSG_HIDE_TIP = 1;
    private static final int TIP_IMAGE_INVALID = -1;
    private static final int TIP_IMAGE_STICKER = 2;
    private static final int TIP_SHINE = 3;
    private boolean INIT_TAG = false;
    private int mBottomTipHeight;
    private View mCenterRedDot;
    private ImageView mCenterTipImage;
    private ImageView mCloseIv;
    private int mCloseType = 0;
    @StringRes
    private int mCurrentTipMessage;
    /* access modifiers changed from: private */
    public int mCurrentTipType;
    private Handler mHandler = new Handler() {
        public void handleMessage(Message message) {
            if (message.what == 1) {
                FragmentBottomPopupTips.this.mTipMessage.setVisibility(8);
                if (FragmentBottomPopupTips.this.mCurrentMode == 163) {
                    CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                    if (cameraModuleSpecial != null) {
                        cameraModuleSpecial.showOrHideChip(true);
                    }
                }
                if (FragmentBottomPopupTips.this.mLastTipType == 6 && FragmentBottomPopupTips.this.mCurrentTipType != 8 && !FragmentBottomPopupTips.this.isPortraitHintVisible()) {
                    FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                } else if (FragmentBottomPopupTips.this.mLastTipType == 10 && CameraSettings.isEyeLightOpen()) {
                    FragmentBottomPopupTips.this.showTips(FragmentBottomPopupTips.this.mLastTipType, FragmentBottomPopupTips.this.mLastTipMessage, 4);
                } else if (FragmentBottomPopupTips.this.mLastTipType == 18 && CameraSettings.isMacroModeEnabled(FragmentBottomPopupTips.this.mCurrentMode)) {
                    FragmentBottomPopupTips.this.showTips(18, R.string.macro_mode_tip, 4);
                } else if (FragmentBottomPopupTips.this.mLastTipType != 8 || !CameraSettings.isMacroModeEnabled(FragmentBottomPopupTips.this.mCurrentMode)) {
                    FragmentBottomPopupTips.this.updateLyingDirectHint(false, true);
                } else {
                    FragmentBottomPopupTips.this.showTips(18, R.string.macro_mode_tip, 4);
                }
                FragmentBottomPopupTips.this.mLastTipType = 4;
            }
        }
    };
    private boolean mIsShowLeftImageIntro;
    private boolean mIsShowLyingDirectHint;
    /* access modifiers changed from: private */
    @StringRes
    public int mLastTipMessage;
    /* access modifiers changed from: private */
    public int mLastTipType;
    /* access modifiers changed from: private */
    public FrameLayout mLeftImageIntro;
    private AnimatorSet mLeftImageIntroAnimator;
    private TextView mLeftImageIntroContent;
    private int mLeftImageIntroRadius;
    private int mLeftImageIntroWidth;
    private ImageView mLeftTipImage;
    private TextView mLightingPattern;
    private TextView mLyingDirectHint;
    /* access modifiers changed from: private */
    public TextView mMimojiTextview;
    private View mPortraitSuccessHint;
    /* access modifiers changed from: private */
    public TextView mQrCodeButton;
    private View mRootView;
    private ViewGroup mSpeedTipImage;
    private ImageView mTipImage;
    /* access modifiers changed from: private */
    public TextView mTipMessage;
    private int stringLightingRes;

    @Retention(RetentionPolicy.SOURCE)
    @interface TipImageType {
    }

    private void adjustViewBackground(int i) {
        int uiStyle = DataRepository.dataItemRunning().getUiStyle();
        if (uiStyle == 1 || uiStyle == 3) {
            this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit_full_screen);
            this.mMimojiTextview.setBackgroundResource(R.drawable.btn_camera_mode_exit);
            return;
        }
        this.mQrCodeButton.setBackgroundResource(R.drawable.btn_camera_mode_exit);
        this.mMimojiTextview.setBackgroundResource(R.drawable.btn_camera_mode_exit);
    }

    private int checkLeftImageTipClose(int i) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing == null || !actionProcessing.isShowLightingView()) {
            return i;
        }
        return 20;
    }

    private void closeFilter() {
        showCloseTip(1, false);
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.showOrHideFilter();
        }
    }

    private void closeLight() {
        showCloseTip(2, false);
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.showOrHideLighting(false);
        }
        updateLeftTipImage();
    }

    /* access modifiers changed from: private */
    public void directHideLeftImageIntro() {
        this.mIsShowLeftImageIntro = false;
        if (this.mLeftImageIntroAnimator != null) {
            this.mLeftImageIntroAnimator.cancel();
        }
        if (this.mLeftImageIntro.getVisibility() == 0) {
            AlphaOutOnSubscribe.directSetResult(this.mLeftImageIntro);
        }
    }

    private int getLeftImageIntroWide() {
        this.mLeftImageIntroContent.measure(0, 0);
        int measuredWidth = this.mLeftImageIntroContent.getMeasuredWidth();
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_left_padding);
        return measuredWidth + dimensionPixelSize + getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_right_padding) + ((this.mLeftImageIntroRadius - dimensionPixelSize) * 2);
    }

    private int getTipBottomMargin(int i) {
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        ManuallyAdjust manuallyAdjust = (ManuallyAdjust) ModeCoordinatorImpl.getInstance().getAttachProtocol(181);
        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
        BokehFNumberController bokehFNumberController = (BokehFNumberController) ModeCoordinatorImpl.getInstance().getAttachProtocol(210);
        int dimensionPixelSize = getResources().getDimensionPixelSize(R.dimen.beauty_extra_tip_bottom_margin);
        if (this.mCurrentMode == 165) {
            if (CameraSettings.isUltraWideConfigOpen(this.mCurrentMode) && ((this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() != 0) || HybridZoomingSystem.IS_3_OR_MORE_SAT)) {
                return (getResources().getDimensionPixelSize(R.dimen.manually_indicator_layout_height) / 2) - (i / 2);
            }
            return getResources().getDimensionPixelSize(R.dimen.tips_margin_bottom_normal) + ((((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2);
        } else if (manuallyAdjust != null && manuallyAdjust.visibleHeight() > 0) {
            return manuallyAdjust.visibleHeight();
        } else {
            if (this.mCenterTipImage.getVisibility() == 0 && (!HybridZoomingSystem.IS_3_OR_MORE_SAT || !CameraSettings.isSupportedOpticalZoom())) {
                return (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) ? this.mTipImage.getHeight() : getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + dimensionPixelSize;
            }
            if (dualController != null && dualController.isZoomVisible()) {
                return dualController.visibleHeight();
            }
            if (bokehFNumberController == null || !bokehFNumberController.isFNumberVisible()) {
                MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
                if (makeupProtocol == null || !makeupProtocol.isSeekBarVisible()) {
                    return (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) ? (getResources().getDimensionPixelSize(R.dimen.manually_indicator_layout_height) / 2) - (i / 2) : getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height) + dimensionPixelSize;
                }
                return getResources().getDimensionPixelSize(R.dimen.beautycamera_popup_fragment_height) + getResources().getDimensionPixelSize(R.dimen.beauty_fragment_height);
            }
            return ((int) this.mRootView.getTranslationY()) + bokehFNumberController.visibleHeight();
        }
    }

    private void hideAllTipImage() {
        hideTipImage();
        hideLeftTipImage();
        directHideLeftImageIntro();
        hideSpeedTipImage();
        hideZoomTipImage(this.mCurrentMode);
        hideCenterTipImage();
    }

    private boolean hideTip(View view) {
        if (view.getVisibility() == 8) {
            return false;
        }
        view.setVisibility(8);
        return true;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0038, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x0011, code lost:
        if (com.android.camera.HybridZoomingSystem.IS_3_OR_MORE_SAT == false) goto L_0x0038;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void hideZoomTipImage(int i) {
        switch (i) {
            case 161:
            case 162:
            case 174:
                break;
            case 163:
            case 165:
            case 173:
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                if (dualController != null) {
                    dualController.hideZoomButton();
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.alertUpdateValue(2);
                        break;
                    }
                }
                break;
            case 166:
                if (!DataRepository.dataItemFeature().fW()) {
                    return;
                }
                break;
        }
    }

    private boolean isPortraitSuccessHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    private void onLeftImageClick(View view) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        switch (((Integer) view.getTag()).intValue()) {
            case 19:
                if (configChanges != null) {
                    configChanges.onConfigChanged(203);
                    return;
                }
                return;
            case 20:
                switch (this.mCloseType) {
                    case 1:
                        closeFilter();
                        return;
                    case 2:
                        closeLight();
                        return;
                    default:
                        return;
                }
            case 21:
                if (configChanges != null && !HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                    configChanges.onConfigChanged(205);
                    return;
                }
                return;
            default:
                return;
        }
    }

    private void reConfigBottomTipOf960FPS() {
        if (CameraSettings.isFPS960(this.mCurrentMode)) {
            showTips(9, R.string.fps960_toast, 4);
        }
    }

    private void reConfigBottomTipOfMacro() {
        if (CameraSettings.isMacroModeEnabled(this.mCurrentMode)) {
            showTips(18, R.string.macro_mode_tip, 4);
        }
    }

    private void reConfigBottomTipOfMimoji() {
        if (this.mCurrentMode == 177 && !DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiCreate()) {
            showTips(19, R.string.mimoji_tips, 2);
        }
    }

    private void reIntTipViewMarginBottom(View view, int i) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        int tipBottomMargin = getTipBottomMargin(i);
        if (marginLayoutParams.bottomMargin != tipBottomMargin) {
            marginLayoutParams.bottomMargin = tipBottomMargin;
            view.setLayoutParams(marginLayoutParams);
        }
    }

    /* access modifiers changed from: private */
    public void setBeautyIntroButtonWidth(View view, int i) {
        if (view != null) {
            LayoutParams layoutParams = view.getLayoutParams();
            layoutParams.width = i;
            view.setLayoutParams(layoutParams);
        }
    }

    private void showBeauty(int i) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (configChanges != null) {
            configChanges.showOrHideShine();
        }
    }

    private void showLiveSpeed() {
        CameraStatUtil.trackLiveClick(CameraStat.KEY_LIVE_SPEED);
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(165);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(13);
        }
    }

    private void showLiveSticker() {
        CameraStatUtil.trackLiveClick(CameraStat.KEY_LIVE_STICKER);
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(164);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(12);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private void showMimojiPanel() {
        BottomMenuProtocol bottomMenuProtocol = (BottomMenuProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(197);
        if (bottomMenuProtocol != null) {
            bottomMenuProtocol.onSwitchLiveActionMenu(166);
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null) {
            baseDelegate.delegateEvent(14);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.directlyHideTips();
        }
    }

    private void startLeftImageIntroAnim(int i) {
        if (i != 1) {
            directShowOrHideLeftTipImage(false);
            this.mLeftImageIntro.setVisibility(0);
            if (this.mLeftImageIntroAnimator == null) {
                ValueAnimator ofInt = ValueAnimator.ofInt(new int[]{this.mLeftImageIntroWidth, this.mLeftImageIntroRadius * 2});
                ofInt.setDuration(300);
                ObjectAnimator ofFloat = ObjectAnimator.ofFloat(this.mLeftImageIntroContent, "alpha", new float[]{1.0f, 0.0f});
                ofFloat.setDuration(250);
                ofInt.addUpdateListener(new AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimator valueAnimator) {
                        FragmentBottomPopupTips.this.setBeautyIntroButtonWidth(FragmentBottomPopupTips.this.mLeftImageIntro, ((Integer) valueAnimator.getAnimatedValue()).intValue());
                    }
                });
                this.mLeftImageIntroAnimator = new AnimatorSet();
                this.mLeftImageIntroAnimator.playTogether(new Animator[]{ofInt, ofFloat});
                this.mLeftImageIntroAnimator.setInterpolator(new PathInterpolator(0.25f, 0.1f, 0.25f, 0.1f));
                this.mLeftImageIntroAnimator.setStartDelay(FragmentTopAlert.HINT_DELAY_TIME);
                this.mLeftImageIntroAnimator.addListener(new AnimatorListenerAdapter() {
                    private boolean cancelled;

                    public void onAnimationCancel(Animator animator) {
                        this.cancelled = true;
                    }

                    public void onAnimationEnd(Animator animator) {
                        if (FragmentBottomPopupTips.this.canProvide() && !this.cancelled) {
                            FragmentBottomPopupTips.this.directHideLeftImageIntro();
                            FragmentBottomPopupTips.this.updateLeftTipImage();
                        }
                    }

                    public void onAnimationStart(Animator animator) {
                        this.cancelled = false;
                    }
                });
            } else {
                this.mLeftImageIntro.setAlpha(1.0f);
                this.mLeftImageIntroContent.clearAnimation();
                this.mLeftImageIntroAnimator.cancel();
            }
            this.mLeftImageIntroAnimator.start();
            CameraSettings.addPopupUltraWideIntroShowTimes();
        }
    }

    /* JADX WARNING: type inference failed for: r5v0 */
    /* JADX WARNING: type inference failed for: r5v1, types: [int] */
    /* JADX WARNING: type inference failed for: r5v2 */
    /* JADX WARNING: type inference failed for: r5v3 */
    /* JADX WARNING: type inference failed for: r5v4 */
    /* JADX WARNING: type inference failed for: r5v5 */
    /* JADX WARNING: type inference failed for: r5v6 */
    /* JADX WARNING: type inference failed for: r5v7 */
    /* JADX WARNING: type inference failed for: r5v8 */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x003c, code lost:
        if (com.android.camera.CameraSettings.getMimojiPannelState() == false) goto L_0x0028;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00eb, code lost:
        if (r1 != false) goto L_0x00ee;
     */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r5v5
  assigns: []
  uses: []
  mth insns count: 117
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
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0110  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x011f  */
    /* JADX WARNING: Removed duplicated region for block: B:69:0x0138  */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x0147  */
    /* JADX WARNING: Removed duplicated region for block: B:71:0x014d  */
    /* JADX WARNING: Unknown variable types count: 2 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateCenterTipImage(int i, int i2, List<Completable> list) {
        int i3;
        ? r5;
        boolean z;
        char c = 1;
        if (i != 174) {
            if (i == 177) {
                if (getActivity().startFromKeyguard()) {
                    if (!this.INIT_TAG) {
                        this.INIT_TAG = true;
                        CameraSettings.setCurrentMimojiState(FragmentMimoji.CLOSE_STATE);
                    }
                } else if (DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiPreview()) {
                }
                i3 = 34;
            }
            i3 = -1;
        } else {
            i3 = 18;
        }
        ? r52 = 2130837748;
        if (i3 != -1) {
            if (i3 == 18) {
                if (!"".equals(CameraSettings.getCurrentLiveSticker())) {
                    r52 = R.drawable.ic_live_sticker_on;
                }
                if (this.mCenterRedDot != null) {
                    boolean tTLiveStickerNeedRedDot = CameraSettings.getTTLiveStickerNeedRedDot();
                    long liveStickerRedDotTime = CameraSettings.getLiveStickerRedDotTime();
                    long currentTimeMillis = System.currentTimeMillis();
                    if ((liveStickerRedDotTime <= 0 || currentTimeMillis - liveStickerRedDotTime < MAX_RED_DOT_TIME) && tTLiveStickerNeedRedDot) {
                        this.mCenterRedDot.setVisibility(0);
                    }
                }
            } else if (i3 != 34) {
                z = true;
                r5 = 0;
            } else {
                String currentMimojiState = CameraSettings.getCurrentMimojiState();
                if (!FragmentMimoji.ADD_STATE.equals(currentMimojiState) && !FragmentMimoji.CLOSE_STATE.equals(currentMimojiState)) {
                    z = true;
                    r5 = R.drawable.ic_live_sticker_on;
                }
            }
            z = true;
            r5 = r52;
        } else {
            if (this.mCenterRedDot != null) {
                this.mCenterRedDot.setVisibility(8);
            }
            z = false;
            r5 = 0;
        }
        if (r5 > 0) {
            this.mCenterTipImage.setImageResource(r5);
        }
        updateImageBgColor(i, this.mCenterTipImage, false);
        if (this.mCenterTipImage.getTag() == null || ((Integer) this.mCenterTipImage.getTag()).intValue() != i3) {
            if (z) {
                ViewCompat.setRotation(this.mCenterTipImage, (float) this.mDegree);
            }
            this.mCenterTipImage.setTag(Integer.valueOf(i3));
            if (list != null) {
                if (z) {
                    if (i2 != 165) {
                        c = 2;
                    } else if (!b.isSupportedOpticalZoom()) {
                        c = 3;
                    }
                } else if (!(i2 == 165 || this.mCurrentMode == 165)) {
                    c = 4;
                }
                switch (c) {
                    case 0:
                        AlphaInOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mCenterTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mCenterTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mCenterTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)));
                        break;
                }
            }
            c = 0;
            switch (c) {
                case 0:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        }
    }

    private void updateImageBgColor(int i, View view, boolean z) {
        int i2;
        int i3;
        if (z) {
            i2 = R.drawable.bg_popup_indicator;
            i3 = R.drawable.square_module_bg_popup_indicator;
        } else {
            i2 = R.drawable.bg_popup_indicator_no_stroke;
            i3 = R.drawable.square_module_bg_popup_indicator_no_stroke;
        }
        if (i != 165) {
            view.setBackgroundResource(i2);
        } else {
            view.setBackgroundResource(i3);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:100:0x0168, code lost:
        r3 = r10;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:101:0x0169, code lost:
        directHideLeftImageIntro();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:102:0x016d, code lost:
        if (r12 == 165) goto L_0x0177;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:104:0x0171, code lost:
        if (r9.mCurrentMode != 165) goto L_0x0174;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:105:0x0174, code lost:
        r3 = 4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:106:0x0177, code lost:
        switch(r3) {
            case 0: goto L_0x01b8;
            case 1: goto L_0x01b2;
            case 2: goto L_0x01a3;
            case 3: goto L_0x018a;
            case 4: goto L_0x017b;
            default: goto L_0x017a;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:107:0x017b, code lost:
        r13.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaOutOnSubscribe(r9.mLeftTipImage)));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:108:0x018a, code lost:
        r13.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaInOnSubscribe(r9.mLeftTipImage).setStartDelayTime(150).setDurationTime(150)));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:109:0x01a3, code lost:
        r13.add(io.reactivex.Completable.create(new com.android.camera.animation.type.AlphaInOnSubscribe(r9.mLeftTipImage)));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:110:0x01b2, code lost:
        com.android.camera.animation.type.AlphaOutOnSubscribe.directSetResult(r9.mLeftTipImage);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:111:0x01b8, code lost:
        com.android.camera.animation.type.AlphaInOnSubscribe.directSetResult(r9.mLeftTipImage);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:112:0x01be, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x003d, code lost:
        if (com.android.camera.data.DataRepository.dataItemFeature().fh() != false) goto L_0x00ac;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x0048, code lost:
        if (com.android.camera.data.DataRepository.dataItemFeature().fg() != false) goto L_0x00ac;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:52:0x00a9, code lost:
        r10 = 21;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:53:0x00ab, code lost:
        r10 = -1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:54:0x00ac, code lost:
        r10 = checkLeftImageTipClose(r10);
        r0 = com.android.camera.R.drawable.ic_live_sticker_normal;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00b6, code lost:
        if (r10 == -1) goto L_0x0102;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:56:0x00b8, code lost:
        if (r10 == 21) goto L_0x00e4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:58:0x00bc, code lost:
        if (r10 == 34) goto L_0x00e1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x00be, code lost:
        switch(r10) {
            case 18: goto L_0x00ce;
            case 19: goto L_0x00c5;
            default: goto L_0x00c1;
        };
     */
    /* JADX WARNING: Code restructure failed: missing block: B:60:0x00c1, code lost:
        r2 = true;
        r0 = 0;
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x00c5, code lost:
        r0 = com.android.camera.R.drawable.ic_light;
        r1 = com.android.camera.R.string.accessibility_lighting_panel_on;
        r2 = true;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:63:0x00d8, code lost:
        if ("".equals(com.android.camera.CameraSettings.getCurrentLiveSticker()) == false) goto L_0x00db;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x00db, code lost:
        r0 = com.android.camera.R.drawable.ic_live_sticker_on;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x00e1, code lost:
        r2 = true;
        r1 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x00e4, code lost:
        r0 = com.android.camera.CameraSettings.isUltraWideConfigOpen(r9.mCurrentMode);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:67:0x00ea, code lost:
        if (r0 == false) goto L_0x00f0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x00ec, code lost:
        r1 = com.android.camera.R.drawable.icon_config_ultra_wide_on;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:69:0x00f0, code lost:
        r1 = com.android.camera.R.drawable.icon_config_ultra_wide_off;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x00f3, code lost:
        if (r0 == false) goto L_0x00f9;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x00f5, code lost:
        r0 = com.android.camera.R.string.accessibility_ultra_wide_on;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x00f9, code lost:
        r0 = com.android.camera.R.string.accessibility_ultra_wide_off;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x00fc, code lost:
        r2 = true;
        r8 = r1;
        r1 = r0;
        r0 = r8;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x0102, code lost:
        r0 = 0;
        r1 = 0;
        r2 = false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x0107, code lost:
        if (r0 <= 0) goto L_0x010e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x0109, code lost:
        r9.mLeftTipImage.setImageResource(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x010e, code lost:
        if (r1 <= 0) goto L_0x011f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:79:0x0114, code lost:
        if (com.android.camera.Util.isAccessible() == false) goto L_0x011f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:80:0x0116, code lost:
        r9.mLeftTipImage.setContentDescription(getString(r1));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:81:0x011f, code lost:
        updateImageBgColor(r11, r9.mLeftTipImage, false);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:82:0x012a, code lost:
        if (r9.mLeftTipImage.getTag() == null) goto L_0x013b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:84:0x0138, code lost:
        if (((java.lang.Integer) r9.mLeftTipImage.getTag()).intValue() != r10) goto L_0x013b;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:85:0x013a, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:86:0x013b, code lost:
        if (r2 == false) goto L_0x0145;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:87:0x013d, code lost:
        android.support.v4.view.ViewCompat.setRotation(r9.mLeftTipImage, (float) r9.mDegree);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:88:0x0145, code lost:
        r9.mLeftTipImage.setTag(java.lang.Integer.valueOf(r10));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:89:0x014e, code lost:
        if (r13 != null) goto L_0x0156;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:90:0x0150, code lost:
        if (r2 == false) goto L_0x0177;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:91:0x0152, code lost:
        r3 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:93:0x0158, code lost:
        if (r2 == false) goto L_0x016d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:94:0x015a, code lost:
        if (r12 != 165) goto L_0x0167;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:96:0x0160, code lost:
        if (com.mi.config.b.isSupportedOpticalZoom() == false) goto L_0x0165;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:97:0x0162, code lost:
        r3 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:98:0x0165, code lost:
        r10 = 3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:99:0x0167, code lost:
        r10 = 2;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateLeftTipImage(int i, int i2, int i3, List<Completable> list) {
        int currentCameraId = DataRepository.dataItemGlobal().getCurrentCameraId();
        boolean isNormalIntent = DataRepository.dataItemGlobal().isNormalIntent();
        char c = 1;
        boolean z = DataRepository.dataItemFeature().isSupportUltraWide() && !HybridZoomingSystem.IS_3_OR_MORE_SAT;
        switch (i2) {
            case 161:
            case 174:
                if (z && currentCameraId == 0) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 162:
                if (!CameraSettings.isMacroModeEnabled(i2) && currentCameraId == 0 && isNormalIntent && z && !CameraSettings.isAutoZoomEnabled(i2)) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 163:
            case 165:
                if (!CameraSettings.isMacroModeEnabled(i2) && !CameraSettings.isUltraPixelRear48MPOn() && z && currentCameraId == 0) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 168:
            case 169:
            case 170:
                if (currentCameraId == 0 && isNormalIntent && z && !CameraSettings.isAutoZoomEnabled(i2)) {
                    if (this.mIsShowLeftImageIntro) {
                        startLeftImageIntroAnim(i);
                        return;
                    }
                }
                break;
            case 171:
                if (isNormalIntent) {
                    int i4 = 19;
                    switch (currentCameraId) {
                        case 0:
                            break;
                        case 1:
                            break;
                        default:
                            i4 = -1;
                            break;
                    }
                }
        }
    }

    private void updateLightingPattern(boolean z, boolean z2) {
        if (z) {
            this.stringLightingRes = -1;
        }
        if (!DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171).equals("0")) {
            if (isLandScape()) {
                starAnimatetViewGone(this.mLightingPattern, z2);
            } else if (this.stringLightingRes > 0) {
                startAnimateViewVisible(this.mLightingPattern, z2);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:34:0x00b5, code lost:
        if (r4 != false) goto L_0x00b8;
     */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x00d2  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x00e1  */
    /* JADX WARNING: Removed duplicated region for block: B:47:0x00fa  */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x010f  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateSpeedTipImage(int i, int i2, List<Completable> list) {
        boolean z;
        boolean z2;
        int i3;
        int i4 = i != 174 ? -1 : 33;
        char c = 1;
        if (i4 == -1) {
            z = true;
            i3 = 0;
            z2 = false;
        } else if (i4 != 33) {
            z2 = true;
            z = true;
            i3 = 0;
        } else {
            i3 = R.layout.bottom_popup_tips_center_live_speed;
            z2 = true;
            z = false;
        }
        boolean z3 = this.mSpeedTipImage.getTag() == null || ((Integer) this.mSpeedTipImage.getTag()).intValue() != i4;
        if (z3) {
            this.mSpeedTipImage.removeAllViews();
            if (i3 > 0) {
                this.mSpeedTipImage.addView(LayoutInflater.from(getContext()).inflate(i3, null));
            }
        }
        if (i4 == 33) {
            ((TextView) this.mSpeedTipImage.findViewById(R.id.live_speed_text)).setText(CameraSettings.getCurrentLiveSpeedText());
            ImageView imageView = (ImageView) this.mSpeedTipImage.findViewById(R.id.icon);
            if (CameraSettings.getCurrentLiveSpeed().equals(String.valueOf(2))) {
                imageView.setImageResource(R.drawable.ic_live_speed_normal);
            } else {
                imageView.setImageResource(R.drawable.ic_live_speed_mod);
            }
        }
        if (z3) {
            if (!z2 || !z) {
                ViewCompat.setRotation(this.mSpeedTipImage, 0.0f);
            } else {
                ViewCompat.setRotation(this.mSpeedTipImage, (float) this.mDegree);
            }
            this.mSpeedTipImage.setTag(Integer.valueOf(i4));
            if (list != null) {
                if (!z2) {
                    c = 4;
                } else if (i2 != 163) {
                    c = 2;
                } else if (!b.isSupportedOpticalZoom()) {
                    c = 3;
                }
                switch (c) {
                    case 0:
                        AlphaInOnSubscribe.directSetResult(this.mSpeedTipImage);
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mSpeedTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mSpeedTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mSpeedTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mSpeedTipImage)));
                        break;
                }
            }
            c = 0;
            switch (c) {
                case 0:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0022, code lost:
        if (com.android.camera.data.DataRepository.dataItemRunning().supportPopShineEntry() != false) goto L_0x003d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x002f, code lost:
        if (com.android.camera.CameraSettings.isMacroModeEnabled(r11) == false) goto L_0x0032;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x003a, code lost:
        if (com.android.camera.data.DataRepository.dataItemRunning().supportPopShineEntry() == false) goto L_0x005c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:17:0x003d, code lost:
        r3 = 3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0047, code lost:
        if (com.android.camera.data.DataRepository.dataItemRunning().supportPopShineEntry() != false) goto L_0x003d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0059, code lost:
        if (com.android.camera.data.DataRepository.dataItemRunning().supportPopShineEntry() == false) goto L_0x005c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00e2, code lost:
        if (r8 != false) goto L_0x00e5;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:57:0x00f2, code lost:
        if (com.mi.config.b.isSupportedOpticalZoom() != false) goto L_0x00e5;
     */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x0106  */
    /* JADX WARNING: Removed duplicated region for block: B:65:0x0115  */
    /* JADX WARNING: Removed duplicated region for block: B:66:0x012e  */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x013d  */
    /* JADX WARNING: Removed duplicated region for block: B:68:0x0143  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateTipImage(int i, int i2, List<Completable> list) {
        boolean z;
        int i3;
        int i4;
        char c = 3;
        if (i != 165) {
            if (i != 171) {
                if (i != 174) {
                    switch (i) {
                        case 162:
                            if (!CameraSettings.isAutoZoomEnabled(i)) {
                                break;
                            }
                            break;
                        case 161:
                            break;
                        case 163:
                            break;
                        default:
                            switch (i) {
                                case 176:
                                    break;
                                case 177:
                                    updateCenterTipImage(i, i2, list);
                                    break;
                            }
                    }
                }
            }
        }
        if (!CameraSettings.isMacroModeEnabled(i)) {
        }
        int i5 = -1;
        boolean z2 = true;
        if (i5 != -1) {
            if (i5 != 34) {
                switch (i5) {
                    case 2:
                        i4 = R.drawable.ic_beauty_sticker;
                        break;
                    case 3:
                        i4 = DataRepository.dataItemRunning().getComponentRunningShine().getBottomEntryRes(i);
                        i3 = R.string.accessibility_beauty_panel_open;
                        z = true;
                        break;
                    default:
                        z = true;
                        i4 = 0;
                        i3 = 0;
                        break;
                }
            } else {
                i4 = DataRepository.dataItemRunning().getComponentRunningShine().getBottomEntryRes(i);
            }
            z = true;
            i3 = 0;
        } else {
            i4 = 0;
            i3 = 0;
            z = false;
        }
        if (i4 > 0) {
            this.mTipImage.setImageResource(i4);
        }
        if (i3 > 0 && Util.isAccessible()) {
            this.mTipImage.setContentDescription(getString(i3));
        }
        updateImageBgColor(i, this.mTipImage, false);
        if (this.mTipImage.getTag() == null || ((Integer) this.mTipImage.getTag()).intValue() != i5) {
            if (z) {
                ViewCompat.setRotation(this.mTipImage, (float) this.mDegree);
            }
            this.mTipImage.setTag(Integer.valueOf(i5));
            if (list != null) {
                if (!z) {
                    if (!(i2 == 165 || this.mCurrentMode == 165)) {
                        c = 4;
                    }
                    c = 1;
                } else if (i2 != 165) {
                    c = 2;
                }
                switch (c) {
                    case 0:
                        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                        if (actionProcessing == null || !actionProcessing.isShowLightingView()) {
                            z2 = false;
                        }
                        if (z2) {
                            this.mTipImage.setTag(Integer.valueOf(-1));
                        }
                        if (!z2) {
                            AlphaInOnSubscribe.directSetResult(this.mTipImage);
                            break;
                        }
                        break;
                    case 1:
                        AlphaOutOnSubscribe.directSetResult(this.mTipImage);
                        break;
                    case 2:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage)));
                        break;
                    case 3:
                        list.add(Completable.create(new AlphaInOnSubscribe(this.mTipImage).setStartDelayTime(150).setDurationTime(150)));
                        break;
                    case 4:
                        list.add(Completable.create(new AlphaOutOnSubscribe(this.mTipImage)));
                        break;
                }
            }
            c = 0;
            switch (c) {
                case 0:
                    break;
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    break;
            }
        }
    }

    public boolean containTips(@StringRes int i) {
        return this.mTipMessage.getVisibility() == 0 && getString(i).equals(this.mTipMessage.getText().toString());
    }

    public void directHideCenterTipImage() {
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() != 4) {
            this.mCenterTipImage.setVisibility(8);
        }
    }

    public void directHideLyingDirectHint() {
        this.mLyingDirectHint.setVisibility(8);
    }

    public void directHideTipImage() {
        if (this.mTipImage.getVisibility() != 4) {
            this.mTipImage.setTag(Integer.valueOf(-1));
            this.mTipImage.setVisibility(4);
        }
    }

    public void directShowLeftImageIntro() {
        if (CameraSettings.isShowUltraWideIntro()) {
            this.mIsShowLeftImageIntro = true;
        }
        updateLeftTipImage(0, this.mCurrentMode, this.mCurrentMode, null);
    }

    public void directShowOrHideLeftTipImage(boolean z) {
        if (this.mLeftTipImage != null) {
            if (z) {
                updateLeftTipImage();
                this.mLeftTipImage.setVisibility(0);
            } else {
                this.mLeftTipImage.setTag(Integer.valueOf(-1));
                this.mLeftTipImage.setVisibility(4);
            }
        }
    }

    public void directlyHideTips() {
        ViewCompat.animate(this.mTipMessage).cancel();
        this.mHandler.removeCallbacksAndMessages(null);
        if (this.mTipMessage.getVisibility() == 0) {
            this.mTipMessage.setVisibility(8);
            CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
            if (cameraModuleSpecial != null) {
                cameraModuleSpecial.showOrHideChip(true);
            }
            if (this.mLastTipType == 6 && !isPortraitHintVisible()) {
                showTips(this.mLastTipType, this.mLastTipMessage, 4);
            }
            this.mLastTipType = 4;
        }
    }

    public void directlyShowTips(int i, @StringRes int i2) {
        ViewCompat.animate(this.mTipMessage).cancel();
        this.mHandler.removeCallbacksAndMessages(null);
        if (this.mTipMessage.getVisibility() != 0) {
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = i;
            this.mCurrentTipMessage = i2;
            AlphaInOnSubscribe.directSetResult(this.mTipMessage);
            this.mTipMessage.setText(i2);
        }
    }

    public int getCurrentBottomTipMsg() {
        return this.mCurrentTipType;
    }

    public int getFragmentInto() {
        return 4081;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_bottom_popup_tips;
    }

    public void hideCenterTipImage() {
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() != 4) {
            this.mCenterTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mCenterTipImage)).subscribe();
            if (this.mCenterRedDot != null) {
                this.mCenterRedDot.setVisibility(8);
            }
        }
    }

    public void hideLeftTipImage() {
        if (this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() != 4) {
            this.mLeftTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mLeftTipImage)).subscribe();
        }
    }

    public void hideMimojiTip() {
        if (this.mMimojiTextview.getVisibility() != 8) {
            this.mMimojiTextview.setVisibility(8);
        }
    }

    public void hideQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 8) {
            this.mQrCodeButton.setVisibility(8);
        }
    }

    public void hideSpeedTipImage() {
        if (this.mSpeedTipImage != null && this.mSpeedTipImage.getVisibility() != 4) {
            this.mSpeedTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mSpeedTipImage)).subscribe();
        }
    }

    public void hideTipImage() {
        if (this.mTipImage != null && this.mTipImage.getVisibility() != 4) {
            this.mTipImage.setTag(Integer.valueOf(-1));
            Completable.create(new AlphaOutOnSubscribe(this.mTipImage)).subscribe();
        }
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        this.mRootView = view;
        this.mTipImage = (ImageView) view.findViewById(R.id.popup_tip_image);
        ((FrameLayout.LayoutParams) this.mTipImage.getLayoutParams()).gravity = 8388693;
        this.mLeftTipImage = (ImageView) view.findViewById(R.id.popup_left_tip_image);
        ((FrameLayout.LayoutParams) this.mLeftTipImage.getLayoutParams()).gravity = 8388691;
        this.mLeftTipImage.setImageResource(R.drawable.ic_new_effect_button_normal);
        this.mLeftTipImage.setOnClickListener(this);
        this.mSpeedTipImage = (ViewGroup) view.findViewById(R.id.popup_speed_tip_image);
        this.mSpeedTipImage.setOnClickListener(this);
        LinearLayout linearLayout = (LinearLayout) view.findViewById(R.id.popup_center_tip_layout);
        if (!HybridZoomingSystem.IS_3_OR_MORE_SAT || !CameraSettings.isSupportedOpticalZoom()) {
            ((FrameLayout.LayoutParams) linearLayout.getLayoutParams()).gravity = 81;
        } else {
            ((FrameLayout.LayoutParams) linearLayout.getLayoutParams()).gravity = 8388691;
        }
        this.mCenterTipImage = (ImageView) linearLayout.findViewById(R.id.popup_center_tip_image);
        this.mCenterTipImage.setOnClickListener(this);
        this.mCenterRedDot = linearLayout.findViewById(R.id.popup_center_red_dot);
        this.mLeftImageIntro = (FrameLayout) view.findViewById(R.id.popup_left_tip_intro);
        this.mLeftImageIntro.setOnClickListener(this);
        this.mLeftImageIntroContent = (TextView) view.findViewById(R.id.popup_left_tip_intro_text);
        this.mLeftImageIntroRadius = getResources().getDimensionPixelSize(R.dimen.popup_tip_beauty_intro_radius);
        this.mLeftImageIntroWidth = getLeftImageIntroWide();
        this.mQrCodeButton = (TextView) view.findViewById(R.id.popup_tips_qrcode);
        this.mMimojiTextview = (TextView) view.findViewById(R.id.popup_tips_mimoji);
        this.mLyingDirectHint = (TextView) view.findViewById(R.id.bottom_lying_direct_hint_text);
        this.mTipMessage = (TextView) view.findViewById(R.id.popup_tips_message);
        this.mPortraitSuccessHint = view.findViewById(R.id.portrait_success_hint);
        this.mLightingPattern = (TextView) view.findViewById(R.id.lighting_pattern);
        ((MarginLayoutParams) view.getLayoutParams()).bottomMargin = Util.getBottomHeight(getResources());
        this.mTipImage.setOnClickListener(this);
        this.mQrCodeButton.setOnClickListener(this);
        adjustViewBackground(this.mCurrentMode);
        provideAnimateElement(this.mCurrentMode, null, 2);
        if (((ActivityBase) getContext()).getCameraIntentManager().isFromScreenSlide().booleanValue()) {
            Util.startScreenSlideAlphaInAnimation(this.mTipImage);
        }
        this.mCloseIv = (ImageView) view.findViewById(R.id.close_iv);
        this.mCloseIv.setOnClickListener(this);
        this.mBottomTipHeight = getResources().getDimensionPixelSize(R.dimen.portrait_hint_height);
    }

    public boolean isLightingHintVisible() {
        VerticalProtocol verticalProtocol = (VerticalProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(198);
        return (verticalProtocol != null ? verticalProtocol.isAnyViewVisible() : false) || this.mLightingPattern.getVisibility() == 0;
    }

    public boolean isPortraitHintVisible() {
        return this.mPortraitSuccessHint.getVisibility() == 0;
    }

    public boolean isTipShowing() {
        return this.mTipMessage != null && this.mTipMessage.getVisibility() == 0;
    }

    public void notifyAfterFrameAvailable(int i) {
        super.notifyAfterFrameAvailable(i);
        reConfigBottomTipOfUltraWide();
        reConfigBottomTipOfMacro();
        reConfigBottomTipOf960FPS();
        reConfigBottomTipOfMimoji();
    }

    public void notifyDataChanged(int i, int i2) {
        super.notifyDataChanged(i, i2);
        switch (i) {
            case 2:
                directlyHideTips();
                break;
            case 3:
                adjustViewBackground(this.mCurrentMode);
                break;
        }
        updateTipImage(this.mCurrentMode, this.mCurrentMode, null);
        updateLeftTipImage(1, this.mCurrentMode, this.mCurrentMode, null);
        updateSpeedTipImage(this.mCurrentMode, this.mCurrentMode, null);
        updateCenterTipImage(this.mCurrentMode, this.mCurrentMode, null);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0036, code lost:
        if (r3.mCurrentTipType != 9) goto L_0x0039;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0038, code lost:
        return false;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0039, code lost:
        hideTip(r3.mTipMessage);
        hideTip(r3.mPortraitSuccessHint);
        hideTip(r3.mQrCodeButton);
        hideTip(r3.mLightingPattern);
        r3.mHandler.removeCallbacksAndMessages(null);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0054, code lost:
        return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean onBackEvent(int i) {
        switch (i) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                if (this.mCurrentTipType == 6 || this.mCurrentTipType == 7 || this.mCurrentTipType == 11 || this.mCurrentTipType == 9 || this.mCurrentTipType == 12 || this.mCurrentTipType == 18 || this.mCurrentTipType == 13 || this.mCurrentTipType == 17) {
                    return false;
                }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:24:0x0089, code lost:
        r3 = ((java.lang.Integer) r3.getTag()).intValue();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:25:0x0095, code lost:
        if (r3 == 18) goto L_0x00a3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:27:0x0099, code lost:
        if (r3 == 34) goto L_0x009c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:0x009c, code lost:
        hideAllTipImage();
        showMimojiPanel();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:0x00a3, code lost:
        hideAllTipImage();
        showLiveSticker();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:30:0x00ab, code lost:
        if (r2.mCenterRedDot == null) goto L_0x00f3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00ad, code lost:
        r2.mCenterRedDot.setVisibility(8);
        com.android.camera.CameraSettings.setTTLiveStickerNeedRedDot(false);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00b9, code lost:
        onLeftImageClick(r3);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00f3, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onClick(View view) {
        if (isEnableClick()) {
            CameraAction cameraAction = (CameraAction) ModeCoordinatorImpl.getInstance().getAttachProtocol(161);
            if (cameraAction != null && cameraAction.isDoingAction()) {
                return;
            }
            if (!CameraSettings.isFrontCamera() || !((Camera) getContext()).isScreenSlideOff()) {
                switch (view.getId()) {
                    case R.id.popup_tip_image /*2131558465*/:
                        int intValue = ((Integer) view.getTag()).intValue();
                        hideAllTipImage();
                        CameraSettings.setPopupTipBeautyIntroClicked();
                        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
                        switch (intValue) {
                            case 2:
                                baseDelegate.delegateEvent(4);
                                break;
                            case 3:
                                hideQrCodeTip();
                                CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_BEAUTY_BUTTON);
                                showBeauty(this.mCurrentMode);
                                break;
                        }
                    case R.id.popup_left_tip_image /*2131558466*/:
                        break;
                    case R.id.popup_center_tip_image /*2131558468*/:
                        break;
                    case R.id.popup_left_tip_intro /*2131558470*/:
                        view.setTag(Integer.valueOf(21));
                        CameraSettings.setPopupUltraWideIntroClicked();
                        directHideLeftImageIntro();
                        break;
                    case R.id.popup_speed_tip_image /*2131558472*/:
                        if (((Integer) view.getTag()).intValue() == 33) {
                            hideAllTipImage();
                            showLiveSpeed();
                            break;
                        }
                        break;
                    case R.id.popup_tips_qrcode /*2131558474*/:
                        hideQrCodeTip();
                        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_QRCODE_DETECTED);
                        ((CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195)).showQRCodeResult();
                        break;
                    case R.id.close_iv /*2131558478*/:
                        switch (this.mCloseType) {
                            case 1:
                                closeFilter();
                                break;
                            case 2:
                                closeLight();
                                break;
                        }
                }
            }
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        if (i2 == 3 || this.mCurrentMode != i) {
            this.mCloseIv.setVisibility(8);
            this.mCloseType = 0;
        }
        int i3 = this.mCurrentMode;
        super.provideAnimateElement(i, list, i2);
        if (isInModeChanging()) {
            this.mIsShowLyingDirectHint = false;
            directHideLyingDirectHint();
        }
        onBackEvent(4);
        updateTipBottomMargin(0, false);
        updateTipImage(i, i3, list);
        updateLeftTipImage(0, i, i3, list);
        updateSpeedTipImage(i, i3, list);
        updateCenterTipImage(i, i3, list);
    }

    /* access modifiers changed from: protected */
    public Animation provideEnterAnimation(int i) {
        if (i == 240 || i == getFragmentInto()) {
            return null;
        }
        return FragmentAnimationFactory.wrapperAnimation(161);
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        if (this.mTipImage.getVisibility() == 0) {
            list.add(this.mTipImage);
        }
        if (this.mLeftTipImage != null && this.mLeftTipImage.getVisibility() == 0) {
            list.add(this.mLeftTipImage);
        }
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() == 0) {
            list.add(this.mCenterTipImage);
        }
        if (!(this.mSpeedTipImage == null || this.mSpeedTipImage.getVisibility() != 0 || ((Integer) this.mSpeedTipImage.getTag()).intValue() == 33)) {
            list.add(this.mSpeedTipImage);
        }
        if (this.mCenterTipImage != null && this.mCenterTipImage.getVisibility() == 0) {
            list.add(this.mCenterTipImage);
        }
        updateLightingPattern(false, true);
    }

    public void reConfigBottomTipOfUltraWide() {
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            if (!(163 == this.mCurrentMode || 165 == this.mCurrentMode || 162 == this.mCurrentMode || 174 == this.mCurrentMode || 161 == this.mCurrentMode)) {
                return;
            }
        } else if (!(163 == this.mCurrentMode || 165 == this.mCurrentMode || 162 == this.mCurrentMode)) {
            return;
        }
        boolean isAutoZoomEnabled = CameraSettings.isAutoZoomEnabled(this.mCurrentMode);
        if ((162 != this.mCurrentMode || !isAutoZoomEnabled) && !CameraSettings.isMacroModeEnabled(this.mCurrentMode)) {
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                if (HybridZoomingSystem.toFloat(HybridZoomingSystem.getZoomRatioHistory(this.mCurrentMode, "1.0"), 1.0f) >= 1.0f) {
                    return;
                }
            } else if (!CameraSettings.isUltraWideConfigOpen(this.mCurrentMode)) {
                return;
            }
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                    showTips(13, R.string.ultra_wide_open_tip, 4);
                } else if (CameraSettings.shouldShowUltraWideSatTip(this.mCurrentMode)) {
                    showTips(13, R.string.ultra_wide_open_tip_sat, 2);
                }
            }
        }
    }

    public void reInitTipImage() {
        provideAnimateElement(this.mCurrentMode, null, 2);
        reConfigBottomTipOfMacro();
        reConfigBottomTipOf960FPS();
    }

    /* access modifiers changed from: protected */
    public void register(ModeCoordinator modeCoordinator) {
        super.register(modeCoordinator);
        modeCoordinator.attachProtocol(175, this);
        registerBackStack(modeCoordinator, this);
        boolean z = DataRepository.dataItemGlobal().getBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", true);
        if (CameraSettings.isShowUltraWideIntro() && !z) {
            this.mIsShowLeftImageIntro = true;
        }
    }

    public void selectBeautyTipImage(boolean z) {
        if (z) {
            this.mTipImage.setImageResource(R.drawable.ic_beauty_on);
        } else {
            this.mTipImage.setImageResource(R.drawable.ic_beauty_normal);
        }
    }

    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void setLightingPattern(String str) {
        char c;
        this.stringLightingRes = -1;
        switch (str.hashCode()) {
            case 48:
                if (str.equals("0")) {
                    c = 0;
                    break;
                }
            case 49:
                if (str.equals("1")) {
                    c = 1;
                    break;
                }
            case 50:
                if (str.equals("2")) {
                    c = 2;
                    break;
                }
            case 51:
                if (str.equals("3")) {
                    c = 3;
                    break;
                }
            case 52:
                if (str.equals("4")) {
                    c = 4;
                    break;
                }
            case 53:
                if (str.equals("5")) {
                    c = 5;
                    break;
                }
            case 54:
                if (str.equals("6")) {
                    c = 6;
                    break;
                }
            case 55:
                if (str.equals("7")) {
                    c = 7;
                    break;
                }
            case 56:
                if (str.equals("8")) {
                    c = 8;
                    break;
                }
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                this.stringLightingRes = -1;
                break;
            case 1:
                this.stringLightingRes = R.string.lighting_pattern_nature;
                break;
            case 2:
                this.stringLightingRes = R.string.lighting_pattern_stage;
                break;
            case 3:
                this.stringLightingRes = R.string.lighting_pattern_movie;
                break;
            case 4:
                this.stringLightingRes = R.string.lighting_pattern_rainbow;
                break;
            case 5:
                this.stringLightingRes = R.string.lighting_pattern_shutter;
                break;
            case 6:
                this.stringLightingRes = R.string.lighting_pattern_dot;
                break;
            case 7:
                this.stringLightingRes = R.string.lighting_pattern_leaf;
                break;
            case 8:
                this.stringLightingRes = R.string.lighting_pattern_holi;
                break;
        }
        if (this.stringLightingRes == -1) {
            AlphaOutOnSubscribe.directSetResult(this.mLightingPattern);
            return;
        }
        this.mCurrentTipType = 12;
        hideTip(this.mTipMessage);
        hideTip(this.mPortraitSuccessHint);
        directHideTipImage();
        reIntTipViewMarginBottom(this.mLightingPattern, this.mBottomTipHeight);
        this.mLightingPattern.setText(this.stringLightingRes);
        if (!isLandScape()) {
            AlphaInOnSubscribe.directSetResult(this.mLightingPattern);
        }
    }

    public void setPortraitHintVisible(int i) {
        if (i != 0 || !isLightingHintVisible()) {
            this.mLastTipType = i == 0 ? 7 : 4;
            directlyHideTips();
            if (i == 0) {
                reIntTipViewMarginBottom(this.mPortraitSuccessHint, this.mBottomTipHeight);
            }
            this.mPortraitSuccessHint.setVisibility(i);
        }
    }

    public void showCloseTip(int i, boolean z) {
        if (!z) {
            this.mCloseType = 0;
        } else if (this.mCurrentMode != 167) {
            this.mCloseType = i;
        } else {
            return;
        }
        showOrHideCloseImage(z);
    }

    public void showMimoji() {
        hideAllTipImage();
        showMimojiPanel();
    }

    public void showMimojiTip() {
        if (this.mMimojiTextview.getVisibility() != 0) {
            hideTip(this.mTipMessage);
            reIntTipViewMarginBottom(this.mMimojiTextview, this.mMimojiTextview.getBackground().getIntrinsicHeight());
            AlphaInOnSubscribe.directSetResult(this.mMimojiTextview);
            Completable.create(new AlphaOutOnSubscribe(this.mMimojiTextview).setStartDelayTime(3000)).subscribe();
            if (Util.isAccessible()) {
                this.mMimojiTextview.postDelayed(new Runnable() {
                    public void run() {
                        FragmentBottomPopupTips.this.mMimojiTextview.sendAccessibilityEvent(128);
                    }
                }, 100);
            }
        }
    }

    public void showOrHideCloseImage(boolean z) {
        if (this.mLeftTipImage != null) {
            this.mLeftTipImage.setImageResource(R.drawable.ic_manually_indicator);
            if (z) {
                if (Util.isAccessible() && this.mCloseType == 2) {
                    this.mLeftTipImage.setContentDescription(getString(R.string.accessibility_lighting_panel_off));
                }
                this.mLeftTipImage.setTag(Integer.valueOf(20));
                Completable.create(new AlphaInOnSubscribe(this.mLeftTipImage)).subscribe();
            } else {
                this.mLeftTipImage.setTag(Integer.valueOf(-1));
                Completable.create(new AlphaOutOnSubscribe(this.mLeftTipImage)).subscribe();
            }
        }
    }

    public void showQrCodeTip() {
        if (this.mQrCodeButton.getVisibility() != 0) {
            directHideLyingDirectHint();
            hideTip(this.mTipMessage);
            reIntTipViewMarginBottom(this.mQrCodeButton, this.mQrCodeButton.getBackground().getIntrinsicHeight());
            AlphaInOnSubscribe.directSetResult(this.mQrCodeButton);
            if (Util.isAccessible()) {
                this.mQrCodeButton.postDelayed(new Runnable() {
                    public void run() {
                        FragmentBottomPopupTips.this.mQrCodeButton.sendAccessibilityEvent(128);
                    }
                }, 100);
            }
        }
    }

    public void showTips(int i, @StringRes int i2, int i3) {
        int i4;
        if (i == 6 && this.mCurrentMode != 171) {
            return;
        }
        if (!(i == 10 && CameraSettings.getBogusCameraId() == 0) && !isLightingHintVisible()) {
            if (isPortraitSuccessHintVisible()) {
                hideTip(this.mPortraitSuccessHint);
            }
            this.mLastTipType = this.mCurrentTipType;
            this.mLastTipMessage = this.mCurrentTipMessage;
            this.mCurrentTipType = i;
            this.mCurrentTipMessage = i2;
            hideTip(this.mQrCodeButton);
            directHideLyingDirectHint();
            reIntTipViewMarginBottom(this.mTipMessage, this.mBottomTipHeight);
            AlphaInOnSubscribe.directSetResult(this.mTipMessage);
            this.mTipMessage.setText(i2);
            if (Util.isAccessible()) {
                this.mTipMessage.setContentDescription(getString(this.mCurrentTipMessage));
                this.mTipMessage.postDelayed(new Runnable() {
                    public void run() {
                        if (FragmentBottomPopupTips.this.isAdded()) {
                            FragmentBottomPopupTips.this.mTipMessage.sendAccessibilityEvent(4);
                        }
                    }
                }, 3000);
            }
            switch (i3) {
                case 1:
                    i4 = 1000;
                    break;
                case 2:
                    i4 = 5000;
                    break;
                case 3:
                    i4 = DurationConstant.DURATION_VIDEO_RECORDING_FUN;
                    break;
                case 5:
                    i4 = 2000;
                    break;
                case 6:
                    i4 = 3000;
                    break;
                case 7:
                    i4 = DurationConstant.DURATION_LANDSCAPE_HINT;
                    break;
                default:
                    i4 = 0;
                    break;
            }
            this.mHandler.removeCallbacksAndMessages(null);
            if (i4 > 0) {
                this.mHandler.sendEmptyMessageDelayed(1, (long) i4);
            }
            if (this.mCurrentMode == 163) {
                CameraModuleSpecial cameraModuleSpecial = (CameraModuleSpecial) ModeCoordinatorImpl.getInstance().getAttachProtocol(195);
                if (cameraModuleSpecial != null) {
                    cameraModuleSpecial.showOrHideChip(false);
                }
            }
        }
    }

    public void showTips(final int i, final int i2, final int i3, int i4) {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                FragmentBottomPopupTips.this.showTips(i, i2, i3);
            }
        }, (long) i4);
    }

    public void showTipsWithOrientation(int i, int i2, int i3, int i4, int i5) {
        switch (i5) {
            case 0:
                showTips(i, i2, i3, i4);
                return;
            case 1:
                if (isLandScape()) {
                    showTips(i, i2, i3, i4);
                    return;
                }
                return;
            case 2:
                if (!isLandScape()) {
                    showTips(i, i2, i3, i4);
                    return;
                }
                return;
            default:
                return;
        }
    }

    /* access modifiers changed from: protected */
    public void unRegister(ModeCoordinator modeCoordinator) {
        super.unRegister(modeCoordinator);
        this.mHandler.removeCallbacksAndMessages(null);
        modeCoordinator.detachProtocol(175, this);
        unRegisterBackStack(modeCoordinator, this);
        this.mIsShowLeftImageIntro = false;
    }

    public void updateLeftTipImage() {
        updateLeftTipImage(1, this.mCurrentMode, this.mCurrentMode, null);
    }

    public void updateLyingDirectHint(boolean z, boolean z2) {
        if (!z2) {
            this.mIsShowLyingDirectHint = z;
        }
        if (this.mIsShowLyingDirectHint) {
            DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
            boolean z3 = true;
            boolean z4 = dualController != null && dualController.isSlideVisible();
            MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
            boolean z5 = makeupProtocol != null && makeupProtocol.isSeekBarVisible();
            MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
            if (miBeautyProtocol == null || !miBeautyProtocol.isBeautyPanelShow()) {
                z3 = false;
            }
            if (isTipShowing() || z4 || z5 || z3 || this.mQrCodeButton.getVisibility() == 0 || this.mLyingDirectHint.getVisibility() == 0) {
                this.mLyingDirectHint.setVisibility(8);
                return;
            }
            this.mLyingDirectHint.setRotation(180.0f);
            reIntTipViewMarginBottom(this.mLyingDirectHint, this.mBottomTipHeight);
            this.mLyingDirectHint.setVisibility(0);
            CameraStatUtil.trackLyingDirectShow(180);
        } else if (this.mLyingDirectHint.getVisibility() == 0) {
            this.mLyingDirectHint.setVisibility(8);
        }
    }

    public void updateTipBottomMargin(int i, boolean z) {
        if (this.mRootView.getPaddingTop() < i) {
            this.mRootView.setPadding(0, (int) (((float) i) * 1.2f), 0, 0);
        }
        if (!z) {
            TranslateYOnSubscribe.directSetResult(this.mRootView, -i);
        } else if (((float) i) < ViewCompat.getTranslationY(this.mRootView)) {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -i).setInterpolator(new OvershootInterpolator())).subscribe();
        } else {
            Completable.create(new TranslateYOnSubscribe(this.mRootView, -i).setInterpolator(new BackEaseOutInterpolator())).subscribe();
        }
    }

    public void updateTipImage() {
        updateTipImage(this.mCurrentMode, this.mCurrentMode, null);
    }
}
