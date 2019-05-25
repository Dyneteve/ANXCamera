package com.android.camera.fragment.top;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.LayoutTransition;
import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.os.Bundle;
import android.os.Handler;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup.MarginLayoutParams;
import android.view.animation.AlphaAnimation;
import android.view.animation.DecelerateInterpolator;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;
import android.widget.TextView;
import com.android.camera.CameraSettings;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.Util;
import com.android.camera.animation.type.AlphaInOnSubscribe;
import com.android.camera.animation.type.AlphaOutOnSubscribe;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.BaseFragment;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.ui.ToggleSwitch;
import com.android.camera.ui.ToggleSwitch.OnCheckedChangeListener;
import com.android.camera2.Camera2Proxy;
import com.mi.config.b;
import com.oneplus.camera.R;
import io.reactivex.Completable;
import java.util.ArrayList;
import java.util.List;
import miui.view.animation.SineEaseInOutInterpolator;

public class FragmentTopAlert extends BaseFragment {
    public static final int FRAGMENT_INFO = 253;
    public static final long HINT_DELAY_TIME = 2000;
    private static final String TAG = FragmentTopAlert.class.getSimpleName();
    private static int sPendingRecordingTimeState = 0;
    /* access modifiers changed from: private */
    public ToggleSwitch mAiSceneSelectView;
    private Runnable mAlertAiDetectTipHitRunable = new TopAlertRunnable() {
        /* access modifiers changed from: 0000 */
        public void runToSafe() {
            FragmentTopAlert.this.removeViewToTipLayout(FragmentTopAlert.this.mRecommendTip);
        }
    };
    private long mAlertAiSceneSwitchHintTime;
    private int mAlertAiSceneSwitchHintTopMargin;
    private int mAlertImageType = -1;
    private TextView mAlertRecordingText;
    private Runnable mAlertTopHintHideRunnable = new Runnable() {
        public void run() {
            FragmentTopAlert.this.removeViewToToastLayout(FragmentTopAlert.this.mPermanentTip);
        }
    };
    private AlphaAnimation mBlingAnimation;
    private LayoutTransition mCustomStubTransition;
    private LayoutTransition mCustomToastTransition;
    private Handler mHandler;
    private TextView mLiveMusiHintText;
    private ImageView mLiveMusicClose;
    private LinearLayout mLiveMusicHintLayout;
    private TextView mMimojiCreateTitle;
    /* access modifiers changed from: private */
    public TextView mPermanentTip;
    /* access modifiers changed from: private */
    public TextView mRecommendTip;
    private boolean mShow;
    private Runnable mShowAction = new TopAlertRunnable() {
        public void runToSafe() {
            FragmentTopAlert.this.addViewToTipLayout(FragmentTopAlert.this.mAiSceneSelectView);
        }
    };
    private String mStateValueText = "";
    private boolean mStateValueTextFromLighting;
    /* access modifiers changed from: private */
    public TextView mToastAiSwitchTip;
    private ImageView mToastTipFlashHDR;
    private LinearLayout mToastTopTipLayout;
    private int mTopHintTextResource = 0;
    private LinearLayout mTopTipLayout;
    private TextView mVideoUltraClearTip;
    public final Runnable mViewHideRunnable = new TopAlertRunnable() {
        /* access modifiers changed from: 0000 */
        public void runToSafe() {
            FragmentTopAlert.this.removeViewToToastLayout(FragmentTopAlert.this.mToastAiSwitchTip);
        }
    };
    /* access modifiers changed from: private */
    public TextView mZoomTip;

    private abstract class TopAlertRunnable implements Runnable {
        private TopAlertRunnable() {
        }

        public void run() {
            if (FragmentTopAlert.this.isAdded()) {
                runToSafe();
            }
        }

        public abstract void runToSafe();
    }

    /* access modifiers changed from: private */
    public void addViewToTipLayout(View view) {
        if (view != null && this.mTopTipLayout != null && this.mTopTipLayout.indexOfChild(view) == -1) {
            if (this.mTopTipLayout.getLayoutTransition() != customStubViewTransition()) {
                this.mTopTipLayout.setLayoutTransition(customStubViewTransition());
            }
            this.mTopTipLayout.addView(view);
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.width = -2;
            layoutParams.height = -2;
            view.setLayoutParams(layoutParams);
        }
    }

    private void addViewToTipLayout(View view, Runnable runnable, Runnable runnable2) {
        if (view != null && this.mTopTipLayout != null && this.mTopTipLayout.indexOfChild(view) == -1) {
            if (this.mTopTipLayout.getLayoutTransition() != customStubViewTransition()) {
                this.mTopTipLayout.setLayoutTransition(customStubViewTransition());
            }
            if (runnable != null) {
                runnable.run();
            }
            try {
                this.mTopTipLayout.addView(view);
            } catch (IllegalStateException e) {
                Log.w(TAG, "The specified child already has a parent. You must call removeView() on the child's parent first");
            }
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.width = -2;
            layoutParams.height = -2;
            view.setLayoutParams(layoutParams);
            if (runnable2 != null) {
                runnable2.run();
            }
        }
    }

    private void addViewToToastLayout(View view) {
        addViewToToastLayout(view, -1);
    }

    private void addViewToToastLayout(View view, int i) {
        if (view != null && this.mToastTopTipLayout != null && this.mToastTopTipLayout.indexOfChild(view) == -1) {
            if (this.mTopTipLayout.getLayoutTransition() != customStubViewTransition()) {
                this.mTopTipLayout.setLayoutTransition(customStubViewTransition());
            }
            if (i < 0) {
                this.mToastTopTipLayout.addView(view);
            } else {
                this.mToastTopTipLayout.addView(view, i);
            }
            LayoutParams layoutParams = (LayoutParams) view.getLayoutParams();
            layoutParams.width = -2;
            layoutParams.height = -2;
            view.setLayoutParams(layoutParams);
            if (this.mToastTopTipLayout.getChildCount() > 0) {
                this.mToastTopTipLayout.setVisibility(0);
            }
        }
    }

    private void alertAiSceneSelector(String str, String str2, int i, OnCheckedChangeListener onCheckedChangeListener, boolean z) {
        if (!TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            this.mAiSceneSelectView.setTextOnAndOff(str, str2);
        }
        if (i == 0) {
            long currentTimeMillis = HINT_DELAY_TIME - (System.currentTimeMillis() - this.mAlertAiSceneSwitchHintTime);
            if (CameraSettings.getShaderEffect() == FilterInfo.FILTER_ID_NONE) {
                Handler handler = this.mHandler;
                Runnable runnable = this.mShowAction;
                if (currentTimeMillis < 0) {
                    currentTimeMillis = 0;
                }
                handler.postDelayed(runnable, currentTimeMillis);
            }
        } else {
            this.mTopTipLayout.removeCallbacks(this.mShowAction);
            removeViewToTipLayout(this.mAiSceneSelectView);
        }
        this.mAiSceneSelectView.setOnCheckedChangeListener(onCheckedChangeListener);
        this.mAiSceneSelectView.setChecked(z);
    }

    private LayoutTransition customStubViewTransition() {
        if (this.mCustomStubTransition == null) {
            this.mCustomStubTransition = new LayoutTransition();
            this.mCustomStubTransition.setInterpolator(2, new SineEaseInOutInterpolator());
            this.mCustomStubTransition.setStartDelay(2, 0);
            this.mCustomStubTransition.setDuration(2, 100);
            this.mCustomStubTransition.setInterpolator(3, new SineEaseInOutInterpolator());
            this.mCustomStubTransition.setStartDelay(3, 0);
            this.mCustomStubTransition.setDuration(3, 0);
        }
        return this.mCustomStubTransition;
    }

    private LayoutTransition customToastLayoutTransition() {
        if (this.mCustomToastTransition == null) {
            this.mCustomToastTransition = new LayoutTransition();
            this.mCustomToastTransition.setInterpolator(2, new SineEaseInOutInterpolator());
            this.mCustomToastTransition.setStartDelay(2, 0);
            this.mCustomToastTransition.setDuration(2, 100);
            this.mCustomToastTransition.setInterpolator(3, new SineEaseInOutInterpolator());
            this.mCustomToastTransition.setStartDelay(3, 0);
            this.mCustomToastTransition.setDuration(3, 100);
        }
        return this.mCustomToastTransition;
    }

    private int getAlertTopMargin() {
        return Util.getDisplayRect(getContext(), 0).top + getResources().getDimensionPixelSize(R.dimen.top_tip_margin_top);
    }

    private String getZoomRatioTipText() {
        float decimal = HybridZoomingSystem.toDecimal(CameraSettings.readZoom());
        Camera2Proxy currentCamera2Device = Camera2OpenManager.getInstance().getCurrentCamera2Device();
        if (currentCamera2Device == null) {
            return null;
        }
        int id = currentCamera2Device.getId();
        if (decimal == 1.0f) {
            if (id == Camera2DataContainer.getInstance().getMainBackCameraId() || id == Camera2DataContainer.getInstance().getSATCameraId() || id == Camera2DataContainer.getInstance().getBokehCameraId() || id == Camera2DataContainer.getInstance().getFrontCameraId() || id == Camera2DataContainer.getInstance().getBokehFrontCameraId()) {
                return null;
            }
            if (((HybridZoomingSystem.IS_2_SAT || !CameraSettings.isSupportedOpticalZoom()) && id == Camera2DataContainer.getInstance().getUltraWideCameraId()) || this.mCurrentMode == 167) {
                return null;
            }
        }
        if (decimal == HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR && HybridZoomingSystem.IS_3_OR_MORE_SAT && id == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("x ");
        sb.append(decimal);
        return sb.toString();
    }

    private void initHandler() {
        this.mHandler = new Handler();
    }

    private LinearLayout initMusicTipText() {
        return (LinearLayout) LayoutInflater.from(getContext()).inflate(R.layout.top_tip_music_layout, null);
    }

    private TextView initPermanentTip() {
        return (TextView) LayoutInflater.from(getContext()).inflate(R.layout.permanent_top_tip_layout, null);
    }

    private TextView initRecommendTipText() {
        return (TextView) LayoutInflater.from(getContext()).inflate(R.layout.recommend_top_tip_layout, null);
    }

    private void initToastTipLayout() {
        this.mToastTopTipLayout = new LinearLayout(getContext());
        setToastTipLayoutParams();
        this.mTopTipLayout.addView(this.mToastTopTipLayout);
        this.mToastTopTipLayout.setVisibility(8);
        this.mToastTipFlashHDR = initToastTopTipImage();
        this.mToastAiSwitchTip = initToastTopTipText();
    }

    private ImageView initToastTopTipImage() {
        return (ImageView) LayoutInflater.from(getContext()).inflate(R.layout.toast_top_tip_image_layout, null);
    }

    private TextView initToastTopTipText() {
        return (TextView) LayoutInflater.from(getContext()).inflate(R.layout.toast_top_tip_text_layout, null);
    }

    private ToggleSwitch initTopTipToggleSwitch() {
        return (ToggleSwitch) LayoutInflater.from(getContext()).inflate(R.layout.top_tip_toggleswitch_layout, null);
    }

    private TextView initZoomTipText() {
        return (TextView) LayoutInflater.from(getContext()).inflate(R.layout.zoom_top_tip_layout, null);
    }

    static /* synthetic */ void lambda$alertAiSceneSelector$1(ToggleSwitch toggleSwitch, boolean z) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (z) {
            if (configChanges != null) {
                configChanges.onConfigChanged(248);
            }
        } else if (configChanges != null) {
            configChanges.onConfigChanged(249);
        }
    }

    static /* synthetic */ void lambda$alertMoonSelector$2(ToggleSwitch toggleSwitch, boolean z) {
        ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
        if (z) {
            if (configChanges != null) {
                configChanges.onConfigChanged(246);
            }
        } else if (configChanges != null) {
            configChanges.onConfigChanged(247);
        }
    }

    public static /* synthetic */ void lambda$alertSwitchHint$3(FragmentTopAlert fragmentTopAlert) {
        if (fragmentTopAlert.isAdded()) {
            fragmentTopAlert.mToastAiSwitchTip.sendAccessibilityEvent(32768);
        }
    }

    public static /* synthetic */ void lambda$showCloseConfirm$6(FragmentTopAlert fragmentTopAlert, DialogInterface dialogInterface, int i) {
        fragmentTopAlert.removeViewToTipLayout(fragmentTopAlert.mLiveMusicHintLayout);
        LiveConfigChanges liveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        if (liveConfigChanges != null && !liveConfigChanges.isRecording() && !liveConfigChanges.isRecordingPaused()) {
            liveConfigChanges.closeBGM();
            ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).updateConfigItem(245);
        }
    }

    static /* synthetic */ void lambda$showCloseConfirm$7(DialogInterface dialogInterface, int i) {
    }

    public static /* synthetic */ void lambda$updateStateText$5(FragmentTopAlert fragmentTopAlert) {
        fragmentTopAlert.mZoomTip.clearAnimation();
        PropertyValuesHolder ofFloat = PropertyValuesHolder.ofFloat("alpha", new float[]{0.0f, 1.0f});
        ObjectAnimator ofPropertyValuesHolder = ObjectAnimator.ofPropertyValuesHolder(fragmentTopAlert.mZoomTip, new PropertyValuesHolder[]{ofFloat});
        ofPropertyValuesHolder.setDuration(320);
        ofPropertyValuesHolder.addListener(new AnimatorListenerAdapter() {
            public void onAnimationStart(Animator animator) {
                FragmentTopAlert.this.mZoomTip.setVisibility(0);
            }
        });
        ofPropertyValuesHolder.start();
    }

    /* access modifiers changed from: private */
    public void removeViewToTipLayout(View view) {
        if (view != null && this.mTopTipLayout != null && this.mTopTipLayout.indexOfChild(view) != -1) {
            if (this.mTopTipLayout.getLayoutTransition() != customStubViewTransition()) {
                this.mTopTipLayout.setLayoutTransition(customStubViewTransition());
            }
            this.mTopTipLayout.removeView(view);
            if (this.mTopTipLayout.getChildCount() <= 0) {
                this.mTopTipLayout.removeAllViews();
            }
        }
    }

    /* access modifiers changed from: private */
    public void removeViewToToastLayout(View view) {
        if (view != null && this.mToastTopTipLayout != null && this.mToastTopTipLayout.indexOfChild(view) != -1) {
            if (this.mTopTipLayout.getLayoutTransition() != customStubViewTransition()) {
                this.mTopTipLayout.setLayoutTransition(customStubViewTransition());
            }
            this.mToastTopTipLayout.removeView(view);
            if (this.mToastTopTipLayout.getChildCount() <= 0) {
                this.mToastTopTipLayout.removeAllViews();
                setToastTipLayoutParams();
                this.mToastTopTipLayout.setVisibility(8);
            }
        }
    }

    public static void setPendingRecordingState(int i) {
        sPendingRecordingTimeState = i;
    }

    private void setToastTipLayoutParams() {
        if (this.mToastTopTipLayout != null) {
            this.mToastTopTipLayout.setLayoutParams(new LayoutParams(-1, -2));
            this.mToastTopTipLayout.setOrientation(0);
            this.mToastTopTipLayout.setDividerDrawable(getResources().getDrawable(R.drawable.top_tip_horizontal_divider));
            this.mToastTopTipLayout.setShowDividers(2);
            this.mToastTopTipLayout.setLayoutTransition(customToastLayoutTransition());
            this.mToastTopTipLayout.setGravity(17);
        }
    }

    private void setViewMargin(View view, int i) {
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) view.getLayoutParams();
        marginLayoutParams.topMargin = i;
        view.setLayoutParams(marginLayoutParams);
        ViewCompat.setTranslationY(view, 0.0f);
    }

    /* access modifiers changed from: private */
    public void showCloseConfirm() {
        Builder builder = new Builder(getContext());
        builder.setMessage(R.string.live_music_close_message);
        builder.setCancelable(false);
        builder.setPositiveButton(R.string.live_music_close_sure_message, new OnClickListener() {
            public final void onClick(DialogInterface dialogInterface, int i) {
                FragmentTopAlert.lambda$showCloseConfirm$6(FragmentTopAlert.this, dialogInterface, i);
            }
        });
        builder.setNegativeButton(R.string.live_music_close_cancel_message, $$Lambda$FragmentTopAlert$6l0fFR2rpCfR_sLUTli6hKUs7H0.INSTANCE);
        builder.show();
    }

    private void updateAlertStatusView(boolean z) {
        if (!DataRepository.dataItemRunning().getComponentRunningLighting().getComponentValue(171).equals("0")) {
            if (isLandScape()) {
                starAnimatetViewGone(this.mZoomTip, z);
            } else if (!TextUtils.isEmpty(this.mStateValueText)) {
                startAnimateViewVisible(this.mZoomTip, z);
            }
        }
    }

    private void updateStateText(boolean z) {
        if (!TextUtils.isEmpty(this.mStateValueText)) {
            this.mStateValueTextFromLighting = z;
            this.mZoomTip.setText(this.mStateValueText);
            if (this.mTopTipLayout.indexOfChild(this.mZoomTip) == -1 || this.mZoomTip.getVisibility() != 0) {
                this.mZoomTip.setVisibility(4);
                if (!z || !isLandScape()) {
                    addViewToTipLayout(this.mZoomTip, new Runnable() {
                        public final void run() {
                            FragmentTopAlert.this.mTopTipLayout.setLayoutTransition(null);
                        }
                    }, new Runnable() {
                        public final void run() {
                            FragmentTopAlert.lambda$updateStateText$5(FragmentTopAlert.this);
                        }
                    });
                }
            }
        } else {
            this.mStateValueTextFromLighting = false;
            removeViewToTipLayout(this.mZoomTip);
        }
    }

    private void updateTopHint(int i, String str, long j) {
        this.mToastTopTipLayout.removeCallbacks(this.mAlertTopHintHideRunnable);
        if (i == 0) {
            this.mPermanentTip.setText(str);
            this.mPermanentTip.setContentDescription(str);
            addViewToToastLayout(this.mPermanentTip);
            if (j > 0) {
                this.mHandler.postDelayed(this.mAlertTopHintHideRunnable, j);
                return;
            }
            return;
        }
        removeViewToToastLayout(this.mPermanentTip);
    }

    public void alertAiSceneSelector(int i) {
        alertAiSceneSelector(getResources().getString(R.string.text_ai_scene_selector_text_on), getResources().getString(R.string.text_ai_scene_selector_text_off), i, i == 0 ? $$Lambda$FragmentTopAlert$wBjfYLjxrFdyaQ4y4rxtK6qEog.INSTANCE : null, false);
    }

    public void alertFlash(int i, boolean z) {
        int i2 = 1;
        if (i == 0) {
            if (z) {
                i2 = 2;
            }
            if (this.mAlertImageType != i2) {
                this.mAlertImageType = i2;
                if (CameraSettings.isFrontCamera() && b.ik()) {
                    z = false;
                }
                this.mToastTipFlashHDR.setImageResource(z ? R.drawable.ic_alert_flash_torch : R.drawable.ic_alert_flash);
                addViewToToastLayout(this.mToastTipFlashHDR, 0);
            }
        } else if (this.mAlertImageType == 2 || this.mAlertImageType == 1) {
            this.mAlertImageType = -1;
            removeViewToToastLayout(this.mToastTipFlashHDR);
        }
    }

    public void alertHDR(int i, boolean z) {
        int i2 = 3;
        if (i == 0) {
            if (z) {
                i2 = 4;
            }
            if (this.mAlertImageType != i2) {
                this.mAlertImageType = i2;
                this.mToastTipFlashHDR.setImageResource(z ? R.drawable.ic_alert_hdr_live : R.drawable.ic_alert_hdr);
                addViewToToastLayout(this.mToastTipFlashHDR, 0);
            }
        } else if (this.mAlertImageType == 4 || this.mAlertImageType == 3) {
            this.mAlertImageType = -1;
            removeViewToToastLayout(this.mToastTipFlashHDR);
        }
    }

    public void alertLightingHint(int i) {
        int i2;
        if (i != -1) {
            switch (i) {
                case 3:
                    i2 = R.string.lighting_hint_too_close;
                    break;
                case 4:
                    i2 = R.string.lighting_hint_too_far;
                    break;
                case 5:
                    i2 = R.string.lighting_hint_needed;
                    break;
            }
        }
        i2 = -1;
        if (i2 == -1) {
            this.mStateValueText = "";
        } else {
            this.mStateValueText = getResources().getString(i2);
        }
        updateStateText(true);
    }

    public void alertLightingTitle(boolean z) {
        if (z) {
            this.mToastAiSwitchTip.setText(R.string.lighting_hint_title);
            this.mToastAiSwitchTip.setVisibility(0);
            addViewToToastLayout(this.mToastAiSwitchTip);
            this.mTopTipLayout.removeCallbacks(this.mViewHideRunnable);
            this.mHandler.postDelayed(this.mViewHideRunnable, HINT_DELAY_TIME);
        } else if (this.mToastAiSwitchTip.getVisibility() != 8) {
            this.mTopTipLayout.removeCallbacks(this.mViewHideRunnable);
            removeViewToToastLayout(this.mToastAiSwitchTip);
        }
    }

    public void alertMoonSelector(String str, String str2, int i, boolean z) {
        alertAiSceneSelector(str, str2, i, i == 0 ? $$Lambda$FragmentTopAlert$XNMEcQFO7bMMo3Q5uQLIGAKRGw.INSTANCE : null, z);
    }

    public void alertMusicClose(boolean z) {
        if (this.mLiveMusicClose == null) {
            return;
        }
        if (z) {
            this.mLiveMusicClose.setAlpha(1.0f);
            this.mLiveMusicClose.setClickable(true);
            return;
        }
        this.mLiveMusicClose.setAlpha(0.4f);
        this.mLiveMusicClose.setClickable(false);
    }

    public void alertMusicTip(int i, String str) {
        if (i != 0 || TextUtils.isEmpty(str)) {
            removeViewToTipLayout(this.mLiveMusicHintLayout);
            return;
        }
        this.mLiveMusiHintText.setText(str);
        addViewToTipLayout(this.mLiveMusicHintLayout);
    }

    public void alertRecommendTipHint(int i, @StringRes int i2, long j) {
        if (i == 0) {
            this.mRecommendTip.setText(i2);
            this.mRecommendTip.setContentDescription(getString(i2));
            this.mTopTipLayout.removeCallbacks(this.mAlertAiDetectTipHitRunable);
            addViewToTipLayout(this.mRecommendTip);
            if (j >= 0) {
                this.mHandler.postDelayed(this.mAlertAiDetectTipHitRunable, j);
                return;
            }
            return;
        }
        this.mTopTipLayout.removeCallbacks(this.mAlertAiDetectTipHitRunable);
        removeViewToTipLayout(this.mRecommendTip);
    }

    public void alertSwitchHint(int i, @StringRes int i2) {
        alertSwitchHint(i, getString(i2));
    }

    public void alertSwitchHint(int i, String str) {
        this.mToastAiSwitchTip.setTag(Integer.valueOf(i));
        this.mToastAiSwitchTip.setText(str);
        this.mToastAiSwitchTip.setContentDescription(str);
        addViewToToastLayout(this.mToastAiSwitchTip);
        this.mAlertAiSceneSwitchHintTime = System.currentTimeMillis();
        this.mHandler.postDelayed(new Runnable() {
            public final void run() {
                FragmentTopAlert.lambda$alertSwitchHint$3(FragmentTopAlert.this);
            }
        }, 300);
        this.mTopTipLayout.removeCallbacks(this.mViewHideRunnable);
        this.mHandler.postDelayed(this.mViewHideRunnable, HINT_DELAY_TIME);
    }

    public void alertTopHint(int i, @StringRes int i2) {
        alertTopHint(i, i2, 0);
    }

    public void alertTopHint(int i, @StringRes int i2, long j) {
        if (i2 > 0 && i == 0) {
            this.mTopHintTextResource = i2;
        } else if (i == 8) {
            this.mTopHintTextResource = 0;
        }
        String str = null;
        if (this.mTopHintTextResource == 0) {
            i = 8;
        } else {
            str = getString(i2);
        }
        updateTopHint(i, str, j);
    }

    public void alertTopHint(int i, String str) {
        if (TextUtils.isEmpty(str) && i == 0) {
            i = 8;
        }
        updateTopHint(i, str, 0);
    }

    public void alertUpdateValue(int i) {
        this.mStateValueText = "";
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null || !dualController.isZoomVisible()) {
            String zoomRatioTipText = getZoomRatioTipText();
            if (zoomRatioTipText != null) {
                StringBuilder sb = new StringBuilder();
                sb.append(this.mStateValueText);
                sb.append(zoomRatioTipText);
                this.mStateValueText = sb.toString();
            }
            updateStateText(false);
        }
    }

    public void alertVideoUltraClear(int i, @StringRes int i2, int i3, boolean z) {
        if (this.mVideoUltraClearTip.getVisibility() != i) {
            if (i != 0 || !z) {
                this.mVideoUltraClearTip.setVisibility(i);
            } else {
                this.mVideoUltraClearTip.setVisibility(i);
                ViewCompat.setAlpha(this.mVideoUltraClearTip, 0.0f);
                ViewCompat.animate(this.mVideoUltraClearTip).alpha(1.0f).setDuration(320).start();
            }
            setViewMargin(this.mVideoUltraClearTip, i3);
            if (i == 0) {
                this.mVideoUltraClearTip.setText(i2);
                this.mVideoUltraClearTip.setContentDescription(getString(i2));
            }
        }
    }

    public void clear() {
        clearAlertStatus();
        this.mAlertImageType = -1;
        int childCount = this.mToastTopTipLayout.getChildCount();
        ArrayList<View> arrayList = new ArrayList<>();
        for (int i = 0; i < childCount; i++) {
            View childAt = this.mToastTopTipLayout.getChildAt(i);
            Object tag = childAt.getTag();
            if (tag == null || !(tag == null || !(tag instanceof Integer) || ((Integer) tag).intValue() == 2)) {
                arrayList.add(childAt);
            }
        }
        for (View removeView : arrayList) {
            this.mToastTopTipLayout.removeView(removeView);
        }
        arrayList.clear();
        int childCount2 = this.mTopTipLayout.getChildCount();
        for (int i2 = 0; i2 < childCount2; i2++) {
            View childAt2 = this.mTopTipLayout.getChildAt(i2);
            if (i2 != 0) {
                arrayList.add(childAt2);
            } else {
                setToastTipLayoutParams();
            }
        }
        for (View removeView2 : arrayList) {
            this.mTopTipLayout.removeView(removeView2);
        }
        if (this.mVideoUltraClearTip != null && this.mVideoUltraClearTip.getVisibility() != 8) {
            this.mVideoUltraClearTip.setVisibility(8);
        }
    }

    public void clearAlertStatus() {
        this.mStateValueText = "";
        this.mStateValueTextFromLighting = false;
        removeViewToTipLayout(this.mZoomTip);
    }

    public int getFragmentInto() {
        return 253;
    }

    /* access modifiers changed from: protected */
    public int getLayoutResourceId() {
        return R.layout.fragment_top_alert;
    }

    public void hideSwitchHint() {
        removeViewToToastLayout(this.mToastAiSwitchTip);
        if (this.mTopTipLayout.getVisibility() == 0) {
            this.mTopTipLayout.removeCallbacks(this.mViewHideRunnable);
        }
    }

    /* access modifiers changed from: protected */
    public void initView(View view) {
        initHandler();
        this.mAlertRecordingText = (TextView) view.findViewById(R.id.alert_recording_time_view);
        this.mVideoUltraClearTip = (TextView) view.findViewById(R.id.video_ultra_clear_tip);
        if (Util.isNotchDevice) {
            setViewMargin(this.mAlertRecordingText, Util.sStatusBarHeight);
        }
        this.mMimojiCreateTitle = (TextView) view.findViewById(R.id.alert_mimoji_on_create);
        setViewMargin(this.mMimojiCreateTitle, Util.isNotchDevice ? Util.sStatusBarHeight : getResources().getDimensionPixelSize(R.dimen.top_control_panel_extra_margin_top));
        ViewCompat.setAlpha(this.mAlertRecordingText, 0.0f);
        ViewCompat.setAlpha(this.mMimojiCreateTitle, 0.0f);
        if (sPendingRecordingTimeState != 0) {
            setRecordingTimeState(sPendingRecordingTimeState);
            setPendingRecordingState(0);
        }
        this.mTopTipLayout = (LinearLayout) view.findViewById(R.id.top_tip_layout);
        MarginLayoutParams marginLayoutParams = (MarginLayoutParams) this.mTopTipLayout.getLayoutParams();
        marginLayoutParams.topMargin = getAlertTopMargin();
        this.mTopTipLayout.setLayoutParams(marginLayoutParams);
        this.mTopTipLayout.setDividerDrawable(getResources().getDrawable(R.drawable.top_tip_vertical_divider));
        this.mTopTipLayout.setShowDividers(2);
        initToastTipLayout();
        this.mAiSceneSelectView = initTopTipToggleSwitch();
        this.mRecommendTip = initRecommendTipText();
        this.mZoomTip = initZoomTipText();
        updateAlertStatusView(false);
        this.mLiveMusicHintLayout = initMusicTipText();
        this.mLiveMusiHintText = (TextView) this.mLiveMusicHintLayout.findViewById(R.id.live_music_title_hint);
        this.mLiveMusicClose = (ImageView) this.mLiveMusicHintLayout.findViewById(R.id.live_music_close);
        this.mLiveMusicClose.setOnClickListener(new View.OnClickListener() {
            public final void onClick(View view) {
                FragmentTopAlert.this.showCloseConfirm();
            }
        });
        this.mPermanentTip = initPermanentTip();
    }

    public boolean isShow() {
        return this.mShow;
    }

    public void onActivityCreated(@Nullable Bundle bundle) {
        super.onActivityCreated(bundle);
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.reInitAlert(false);
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
        if (this.mBlingAnimation != null) {
            this.mBlingAnimation.cancel();
            this.mBlingAnimation = null;
        }
    }

    public void provideAnimateElement(int i, List<Completable> list, int i2) {
        super.provideAnimateElement(i, list, i2);
        if (162 != i) {
            hideSwitchHint();
        }
        clear();
        setShow(true);
    }

    public void provideRotateItem(List<View> list, int i) {
        super.provideRotateItem(list, i);
        updateAlertStatusView(true);
    }

    public void setRecordingTimeState(int i) {
        switch (i) {
            case 1:
                int i2 = this.mCurrentMode;
                if (i2 != 172) {
                    if (i2 != 177) {
                        switch (i2) {
                            case 161:
                                break;
                            case 162:
                                break;
                            default:
                                switch (i2) {
                                    case 168:
                                    case 169:
                                    case 170:
                                        break;
                                }
                        }
                    }
                    this.mAlertRecordingText.setText("00:15");
                    Completable.create(new AlphaInOnSubscribe(this.mAlertRecordingText)).subscribe();
                    return;
                }
                this.mAlertRecordingText.setText("00:00");
                Completable.create(new AlphaInOnSubscribe(this.mAlertRecordingText)).subscribe();
                return;
            case 2:
                if (this.mBlingAnimation != null) {
                    this.mBlingAnimation.cancel();
                }
                Completable.create(new AlphaOutOnSubscribe(this.mAlertRecordingText)).subscribe();
                return;
            case 3:
                if (this.mBlingAnimation == null) {
                    this.mBlingAnimation = new AlphaAnimation(1.0f, 0.0f);
                    this.mBlingAnimation.setDuration(400);
                    this.mBlingAnimation.setStartOffset(100);
                    this.mBlingAnimation.setInterpolator(new DecelerateInterpolator());
                    this.mBlingAnimation.setRepeatMode(2);
                    this.mBlingAnimation.setRepeatCount(-1);
                }
                this.mAlertRecordingText.startAnimation(this.mBlingAnimation);
                return;
            case 4:
                this.mBlingAnimation.cancel();
                return;
            default:
                return;
        }
    }

    public void setShow(boolean z) {
        this.mShow = z;
    }

    public void showOrHideMimojiCreateTitle(boolean z) {
        if (z) {
            Completable.create(new AlphaInOnSubscribe(this.mMimojiCreateTitle)).subscribe();
        } else {
            Completable.create(new AlphaOutOnSubscribe(this.mMimojiCreateTitle)).subscribe();
        }
    }

    public void updateMusicHint() {
        if (this.mCurrentMode != 174) {
            alertMusicTip(8, null);
            return;
        }
        String[] currentLiveMusic = CameraSettings.getCurrentLiveMusic();
        if (this.mLiveMusicHintLayout.getVisibility() == 0) {
            alertMusicTip(0, this.mLiveMusiHintText.getText().toString());
        } else if (!currentLiveMusic[1].isEmpty()) {
            alertMusicTip(0, currentLiveMusic[1]);
        }
    }

    public void updateRecordingTime(String str) {
        this.mAlertRecordingText.setText(str);
    }
}
