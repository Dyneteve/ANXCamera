package com.android.camera.protocol;

import android.content.ContentValues;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
import android.hardware.camera2.params.MeteringRectangle;
import android.net.Uri;
import android.support.annotation.IdRes;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.app.FragmentManager;
import android.util.Pair;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import com.android.camera.Thumbnail;
import com.android.camera.animation.AnimationComposite;
import com.android.camera.data.data.TypeItem;
import com.android.camera.data.data.config.ComponentManuallyDualLens;
import com.android.camera.data.data.config.ComponentManuallyET;
import com.android.camera.data.data.config.ComponentManuallyFocus;
import com.android.camera.data.data.config.ComponentManuallyISO;
import com.android.camera.data.data.config.ComponentManuallyWB;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.data.data.runing.ComponentRunningShine.ShineType;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.fragment.manually.ManuallyListener;
import com.android.camera.fragment.mimoji.MimojiInfo;
import com.android.camera.module.loader.StartControl;
import com.android.camera.ui.FocusView.ExposureViewListener;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.watermark.WaterMarkData;
import com.android.camera2.CameraHardwareFace;
import com.android.camera2.autozoom.AutoZoomCaptureResult;
import com.ss.android.vesdk.VECommonCallback;
import io.reactivex.Completable;
import io.reactivex.disposables.Disposable;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.List;

public interface ModeProtocol {
    public static final int ADJUST_EV_START = 1;
    public static final int ADJUST_EV_STOP = 2;
    public static final int EVENT_BEAUTY = 2;
    public static final int EVENT_BEAUTYLEVEL = 5;
    public static final int EVENT_BLANK_BEAUTY = 10;
    public static final int EVENT_EYE_POPU_TIP = 9;
    public static final int EVENT_FILTER = 1;
    public static final int EVENT_INTENT_SHOT_FINISH = 6;
    public static final int EVENT_LIVE_SPEED = 13;
    public static final int EVENT_LIVE_STICKER = 12;
    public static final int EVENT_MAKEUP = 3;
    public static final int EVENT_MIMOJI = 14;
    public static final int EVENT_RESTORE_BOTTOM_ACTION = 7;
    public static final int EVENT_STICKER = 4;
    public static final int INDICATOR_FACE_VIEW = 1;
    public static final int INDICATOR_FOCUS_VIEW = 2;
    public static final int INDICATOR_OBJECT_VIEW = 3;
    public static final int PROTOCOL_ACTION = 161;
    public static final int PROTOCOL_ACTION_PROCESSING = 162;
    public static final int PROTOCOL_ACTION_TRACK = 186;
    public static final int PROTOCOL_AUTO_ZOOM_MODULE = 215;
    public static final int PROTOCOL_AUTO_ZOOM_VIEW = 214;
    public static final int PROTOCOL_BACK_STACK = 171;
    public static final int PROTOCOL_BEAUTY_RECORDING = 173;
    public static final int PROTOCOL_BEAUTY_SHOW_STATUS = 213;
    public static final int PROTOCOL_BOKEH_F_NUMBER = 210;
    public static final int PROTOCOL_BOTTOM_MENU = 197;
    public static final int PROTOCOL_BOTTOM_POPUP_TIPS = 175;
    public static final int PROTOCOL_CAMERA_MODULE_SPEC = 195;
    public static final int PROTOCOL_CONFIG_CHANGE = 164;
    public static final int PROTOCOL_DELEGATE = 160;
    public static final int PROTOCOL_DUAL_CONTROLLER = 182;
    public static final int PROTOCOL_EFFECT_CONTROL = 165;
    public static final int PROTOCOL_EV_CHANGED = 169;
    public static final int PROTOCOL_FACE_BEAUTY = 185;
    public static final int PROTOCOL_FILTER_SWITCHER = 183;
    public static final int PROTOCOL_FRONT_BEAUTY = 194;
    public static final int PROTOCOL_LIVE_CONFIG = 201;
    public static final int PROTOCOL_LIVE_MUSIC = 211;
    public static final int PROTOCOL_LIVE_VIDEO_EDITOR = 209;
    public static final int PROTOCOL_MAIN_CONTENT = 166;
    public static final int PROTOCOL_MAKEUP_CONTROL = 180;
    public static final int PROTOCOL_MANUALLY_ADJUST = 181;
    public static final int PROTOCOL_MANUALLY_CHANGE = 174;
    public static final int PROTOCOL_MIMOJI = 217;
    public static final int PROTOCOL_MIMOJI_ALERT = 226;
    public static final int PROTOCOL_MIMOJI_DATA_BASE = 225;
    public static final int PROTOCOL_MIMOJI_EDITOR = 224;
    public static final int PROTOCOL_MODE_CHANGE_CONTROLLER = 179;
    public static final int PROTOCOL_ON_FACE_BEAUTY_CHANGED = 199;
    public static final int PROTOCOL_OPTICAL_ZOOM_RATIO = 203;
    public static final int PROTOCOL_PANORAMA = 176;
    public static final int PROTOCOL_PLAY_VIDEO = 167;
    public static final int PROTOCOL_PREVIEW_CHANGED = 168;
    public static final int PROTOCOL_RECORDING_STATE = 212;
    public static final int PROTOCOL_SCREEN_LIGHT = 196;
    public static final int PROTOCOL_SNAP_INDICATOR = 184;
    public static final int PROTOCOL_STANDALONE_MACRO = 202;
    public static final int PROTOCOL_STICKER_CONTROL = 178;
    public static final int PROTOCOL_TOP_ALERT = 172;
    public static final int PROTOCOL_TOP_CONFIG = 193;
    public static final int PROTOCOL_ULTRA_WIDE = 200;
    public static final int PROTOCOL_VERTICAL = 198;
    public static final int PROTOCOL_WIDE_SELFIE = 216;
    public static final int PROTOCOL_ZOOM_CHANGED = 170;
    public static final int SHOW_FAIL = 3;
    public static final int SHOW_START = 1;
    public static final int SHOW_SUCCESS = 2;

    public interface ActionProcessing extends BaseProtocol {
        public static final int TYPE_TAG = 162;

        void filterUiChange();

        boolean forceSwitchFront();

        void hideExtra();

        boolean isShowFilterView();

        boolean isShowLightingView();

        void processingAudioCapture(boolean z);

        void processingFailed();

        void processingFinish();

        void processingMimojiBack();

        void processingMimojiPrepare();

        void processingPause();

        void processingPostAction();

        void processingPrepare();

        void processingResume();

        void processingStart();

        void processingWorkspace(boolean z);

        void setLightingViewStatus(boolean z);

        void showOrHideBottomViewWithAnim(boolean z);

        boolean showOrHideFilterView();

        boolean showOrHideLightingView();

        void showOrHideMimojiProgress(boolean z);

        void updateLoading(boolean z);

        void updateRecordingTime(String str);

        void updateThumbnail(Thumbnail thumbnail, boolean z, int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface AdjustEvState {
    }

    public interface AutoZoomModuleProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 215;

        void onTrackLost();

        void onTrackLosting();

        void setAutoZoomMode(int i);

        void setAutoZoomStartCapture(RectF rectF);

        void setAutoZoomStopCapture(int i);

        void startAutoZoom();

        void startTracking(RectF rectF);

        void stopAutoZoom();

        void stopTracking(int i);
    }

    public interface AutoZoomViewProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 214;

        void feedData(AutoZoomCaptureResult autoZoomCaptureResult);

        boolean isAutoZoomActive();

        boolean isAutoZoomEnabled();

        void onAutoZoomStarted();

        void onAutoZoomStopped();

        void onTrackingStarted(RectF rectF);

        void onTrackingStopped(int i);
    }

    public interface BackStack extends BaseProtocol {
        public static final int TYPE_TAG = 171;

        <P extends HandleBackTrace> void addInBackStack(P p);

        boolean handleBackStackFromKeyBack();

        void handleBackStackFromShutter();

        boolean handleBackStackFromTapDown(int i, int i2);

        <P extends HandleBackTrace> void removeBackStack(P p);
    }

    public interface BaseDelegate extends BaseProtocol {
        public static final int TYPE_TAG = 160;

        void delegateEvent(int i);

        Disposable delegateMode(@Nullable Completable completable, StartControl startControl, BaseLifecycleListener baseLifecycleListener);

        int getActiveFragment(@IdRes int i);

        AnimationComposite getAnimationComposite();

        int getOriginalFragment(@IdRes int i);

        void init(FragmentManager fragmentManager, int i, BaseLifecycleListener baseLifecycleListener);
    }

    public interface BaseProtocol {
        public static final int TYPE_TAG = -1;

        void registerProtocol();

        void unRegisterProtocol();
    }

    public interface BeautyRecording extends BaseProtocol {
        public static final int TYPE_TAG = 173;

        <P extends HandleBeautyRecording> void addBeautyStack(P p);

        void handleAngleChang(float f);

        void handleBeautyRecordingStart();

        void handleBeautyRecordingStop();

        <P extends HandleBeautyRecording> void removeBeautyStack(P p);
    }

    public interface BokehFNumberController extends BaseProtocol {
        public static final int TYPE_TAG = 210;

        void hideFNumberPanel(boolean z, boolean z2);

        boolean isFNumberVisible();

        void showFNumberPanel(boolean z);

        void updateFNumberValue();

        int visibleHeight();
    }

    public interface BottomMenuProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 197;

        void animateShineBeauty(boolean z);

        void expandShineBottomMenu(ComponentRunningShine componentRunningShine);

        int getBeautyActionMenuType();

        void onBottomMenuAnimate(int i, int i2);

        void onSwitchBeautyActionMenu(int i);

        void onSwitchCameraActionMenu(int i);

        void onSwitchLiveActionMenu(int i);
    }

    public interface BottomPopupTips extends BaseProtocol, LyingDirectHint {
        public static final int FILTER_CLOSE_TYPE = 1;
        public static final int LIGHT_CLOSE_TYPE = 2;
        public static final int NONE_CLOSE_TYPE = 0;
        public static final int TIP_DURATION_2S = 5;
        public static final int TIP_DURATION_3S = 6;
        public static final int TIP_DURATION_6S = 7;
        public static final int TIP_DURATION_LONG = 2;
        public static final int TIP_DURATION_PERSISTED = 4;
        public static final int TIP_DURATION_SHORT = 1;
        public static final int TIP_DURATION_STABLE = 3;
        public static final int TIP_SHOW_ALL = 0;
        public static final int TIP_SHOW_LANDSCAPE = 1;
        public static final int TIP_SHOW_PORTRAIT = 2;
        public static final int TIP_TYPE_3A_LOCK = 8;
        public static final int TIP_TYPE_DUAL_CAMERA = 6;
        public static final int TIP_TYPE_DUAL_CAMERA_SUCCESS = 7;
        public static final int TIP_TYPE_EYE_LIGHT = 10;
        public static final int TIP_TYPE_GROUP_SWITCH = 17;
        public static final int TIP_TYPE_HAND_GESTURE = 16;
        public static final int TIP_TYPE_HINT = 4;
        public static final int TIP_TYPE_LIGHTING = 12;
        public static final int TIP_TYPE_MACRO_MODE = 18;
        public static final int TIP_TYPE_MIMOJI = 19;
        public static final int TIP_TYPE_NEW_SLOW_MOTION = 9;
        public static final int TIP_TYPE_SUPER_NIGHT = 11;
        public static final int TIP_TYPE_ULTRA_WIDE = 13;
        public static final int TIP_TYPE_ULTRA_WIDE_RECOMMEND = 14;
        public static final int TIP_TYPE_WARNING = 5;
        public static final int TIP_ULTRA_PIXEL_NO_SUPPORT_ZOOM = 15;
        public static final int TYPE_TAG = 175;

        @Retention(RetentionPolicy.SOURCE)
        public @interface CloseType {
        }

        @Retention(RetentionPolicy.SOURCE)
        public @interface TipDuration {
        }

        @Retention(RetentionPolicy.SOURCE)
        public @interface TipShowOrientation {
        }

        @Retention(RetentionPolicy.SOURCE)
        public @interface TipType {
        }

        boolean containTips(@StringRes int i);

        void directHideCenterTipImage();

        void directHideTipImage();

        void directShowLeftImageIntro();

        void directShowOrHideLeftTipImage(boolean z);

        void directlyHideTips();

        void directlyShowTips(int i, @StringRes int i2);

        int getCurrentBottomTipMsg();

        void hideCenterTipImage();

        void hideLeftTipImage();

        void hideMimojiTip();

        void hideQrCodeTip();

        void hideSpeedTipImage();

        void hideTipImage();

        boolean isLightingHintVisible();

        boolean isPortraitHintVisible();

        boolean isTipShowing();

        void reConfigBottomTipOfUltraWide();

        void reInitTipImage();

        void selectBeautyTipImage(boolean z);

        void setLightingPattern(String str);

        void setPortraitHintVisible(int i);

        void showCloseTip(int i, boolean z);

        void showMimoji();

        void showMimojiTip();

        void showOrHideCloseImage(boolean z);

        void showQrCodeTip();

        void showTips(int i, @StringRes int i2, int i3);

        void showTips(int i, @StringRes int i2, int i3, int i4);

        void showTipsWithOrientation(int i, @StringRes int i2, int i3, int i4, int i5);

        void updateLeftTipImage();

        void updateTipBottomMargin(int i, boolean z);

        void updateTipImage();
    }

    public interface CameraAction extends BaseProtocol {
        public static final int TYPE_TAG = 161;

        boolean isBlockSnap();

        boolean isDoingAction();

        boolean isRecording();

        void onReviewCancelClicked();

        void onReviewDoneClicked();

        void onShutterButtonClick(int i);

        void onShutterButtonFocus(boolean z, int i);

        boolean onShutterButtonLongClick();

        void onShutterButtonLongClickCancel(boolean z);

        void onThumbnailClicked(View view);
    }

    public interface CameraActionTrack extends BaseProtocol {
        public static final int TYPE_TAG = 186;

        void onTrackShutterButtonMissTaken(long j);

        void onTrackShutterButtonTaken(long j);
    }

    public interface CameraModuleSpecial extends BaseProtocol {
        public static final int TYPE_TAG = 195;

        void showOrHideChip(boolean z);

        void showQRCodeResult();
    }

    public interface ConfigChanges extends BaseProtocol {
        public static final int CHECK_TYPE_FORCE_CLOSE = 4;
        public static final int CHECK_TYPE_MANUALLY = 1;
        public static final int CHECK_TYPE_MUTEX = 3;
        public static final int CHECK_TYPE_WATCH = 2;
        public static final int TYPE_TAG = 164;

        @Retention(RetentionPolicy.SOURCE)
        public @interface ConfigCheckType {
        }

        void closeMutexElement(String str, int... iArr);

        void configBeautySwitch(int i);

        void configBokeh(String str);

        void configDualWaterMarkSwitch();

        void configFlash(String str);

        void configFocusPeakSwitch(int i);

        void configGenderAgeSwitch(int i);

        void configGradienterSwitch(int i);

        void configGroupSwitch(int i);

        void configHHTSwitch(int i);

        void configHdr(String str);

        void configLiveShotSwitch(int i);

        void configMagicFocusSwitch();

        void configMagicMirrorSwitch(int i);

        void configPortraitSwitch(int i);

        void configRawSwitch();

        void configRotationChange(int i, int i2);

        void configScene(int i);

        void configSuperResolutionSwitch(int i);

        void configTiltSwitch(int i);

        void configTimerSwitch();

        void configVideoFast();

        void configVideoHFR();

        void configVideoSlow();

        void onConfigChanged(int i);

        void onThermalNotification(int i);

        void reCheckBeauty();

        void reCheckFrontBokenTip();

        void reCheckHandGesture();

        void reCheckLighting();

        void reCheckLiveShot();

        void reCheckMacroMode();

        void reCheckMutexConfigs(int i);

        void reCheckUltraPixel();

        void reCheckVideoUltraClearTip();

        void restoreAllMutexElement(String str);

        void restoreMutexFlash(String str);

        void setEyeLight(String str);

        void setFilter(int i);

        void setLighting(boolean z, String str, String str2, boolean z2);

        void showCloseTip(int i, boolean z);

        void showOrHideFilter();

        void showOrHideLighting(boolean z);

        void showOrHideShine();

        void showSetting();
    }

    public interface DualController extends BaseProtocol {
        public static final int TYPE_TAG = 182;

        void hideSlideView();

        void hideZoomButton();

        boolean isSlideVisible();

        boolean isZoomVisible();

        void setImmersiveModeEnabled(boolean z);

        void setRecordingOrPausing(boolean z);

        void showZoomButton();

        void updateZoomRatio(int i);

        int visibleHeight();
    }

    public interface EffectCropViewController {
        void destroyEffectCropView();

        void initEffectCropView();

        boolean isAutoZoomViewEnabled();

        boolean isEffectViewMoved();

        boolean isEffectViewVisible();

        boolean onEffectViewTouchEvent(MotionEvent motionEvent);

        void removeTiltShiftMask();

        void setEffectViewVisible(boolean z);

        void updateEffectViewVisible();

        void updateEffectViewVisible(int i);
    }

    public interface EvChangedProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 169;

        void onEvChanged(int i, int i2);

        void resetEvValue();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface EventType {
    }

    public interface FilterProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 165;

        void onFilterChanged(int i, int i2);
    }

    public interface FullScreenProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 196;

        ContentValues getSaveContentValues();

        void hideScreenLight();

        boolean isLiveRecordPreviewShown();

        void onLiveSaveToLocalFinished(Uri uri);

        void quitLiveRecordPreview(boolean z);

        void setScreenLightColor(int i);

        void showScreenLight();

        void startLiveRecordPreview(ContentValues contentValues);

        void startLiveRecordSaving();
    }

    public interface GestureDetected {
        void onPrepare();

        void onSliding(int i);

        void onTapCapture();

        void onTapDown(float f, float f2);

        void onZoom(float f);
    }

    public interface HandleBackTrace {
        public static final int CALLING_KEY_BACK = 1;
        public static final int CALLING_RECEIVER_NOT_SPECIFIED = 1;
        public static final int CALLING_RESTART_MODE = 7;
        public static final int CALLING_SELF = 5;
        public static final int CALLING_SHUTTER = 3;
        public static final int CALLING_SWITCH_MODE = 4;
        public static final int CALLING_TAP_DOWN = 2;
        public static final int CALLING_USER = 6;

        @Retention(RetentionPolicy.SOURCE)
        public @interface CallingFrom {
        }

        boolean canProvide();

        boolean onBackEvent(int i);
    }

    public interface HandleBeautyRecording {
        void onAngleChanged(float f);

        void onBeautyRecordingStart();

        void onBeautyRecordingStop();
    }

    public interface HandlerSwitcher extends BaseProtocol {
        public static final int TYPE_TAG = 183;

        boolean onHandleSwitcher(int i);
    }

    public interface IndicatorProtocol {
        void clearFocusView(int i);

        void clearIndicator(int i);

        int getActiveIndicator();

        CameraHardwareFace[] getFaces();

        RectF getFocusRect(int i);

        RectF getFocusRectInPreviewFrame();

        void initializeFocusView(ExposureViewListener exposureViewListener);

        boolean initializeObjectTrack(RectF rectF, boolean z);

        boolean initializeObjectView(RectF rectF, boolean z);

        boolean isAdjustingObjectView();

        boolean isEvAdjusted(boolean z);

        boolean isFaceExists(int i);

        boolean isFaceStable(int i);

        boolean isFocusViewVisible();

        boolean isIndicatorVisible(int i);

        boolean isNeedExposure(int i);

        boolean isObjectTrackFailed();

        void lightingCancel();

        void lightingDetectFace(CameraHardwareFace[] cameraHardwareFaceArr, boolean z);

        void lightingFocused();

        void lightingStart();

        void mimojiEnd();

        void mimojiFaceDetect(int i);

        void mimojiStart();

        void onStopObjectTrack();

        void reShowFaceRect();

        void setActiveIndicator(int i);

        void setAfRegionView(MeteringRectangle[] meteringRectangleArr, Rect rect, float f);

        void setCameraDisplayOrientation(int i);

        void setDisplaySize(int i, int i2);

        void setEvAdjustable(boolean z);

        boolean setFaces(int i, CameraHardwareFace[] cameraHardwareFaceArr, Rect rect, float f);

        void setFocusViewPosition(int i, int i2, int i3);

        void setFocusViewType(boolean z);

        void setObjectViewListener(ObjectViewListener objectViewListener);

        void setPreviewSize(int i, int i2);

        void setShowGenderAndAge(boolean z);

        void setShowMagicMirror(boolean z);

        void setSkipDrawFace(boolean z);

        void showIndicator(int i, int i2);

        void updateFaceView(boolean z, boolean z2, boolean z3, boolean z4, int i);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface IndicatorType {
    }

    public interface LiveConfigChanges extends BaseProtocol {
        public static final int ACTIVATE_EXPIRED = 2;
        public static final int ACTIVATE_FAIL = 3;
        public static final int ACTIVATE_NOT_MATCH = 4;
        public static final int ACTIVATE_OK = 0;
        public static final int ACTIVATE_TBD = 1;
        public static final int TYPE_TAG = 201;

        @Retention(RetentionPolicy.SOURCE)
        public @interface AuthResult {
        }

        void closeBGM();

        int getAuthResult();

        Pair<String, String> getConcatResult();

        SurfaceTexture getInputSurfaceTexture();

        float getRecordSpeed();

        int getSegments();

        long getStartRecordingTime();

        String getTimeValue();

        long getTotalRecordingTime();

        boolean hasSegments();

        void initPreview(int i, int i2, boolean z, int i3);

        void initResource();

        boolean isRecording();

        boolean isRecordingPaused();

        void onBGMChanged(String str);

        void onDeviceRotationChange(float[] fArr);

        boolean onRecordConcat();

        void onRecordPause();

        void onRecordResume();

        void onRecordReverse();

        void onRecordStart();

        void onRecordStop();

        void onSensorChanged(SensorEvent sensorEvent);

        void release();

        void setBeautify(boolean z, float f);

        void setBeautyFaceReshape(boolean z, float f, float f2);

        void setEffectAudio(boolean z);

        void setFilter(boolean z, String str);

        void setRecordSpeed(int i);

        void startPreview(Surface surface);

        void updateRecordingTime();

        void updateRotation(float f, float f2, float f3);
    }

    public interface LiveVideoEditor extends BaseProtocol {
        public static final int TYPE_TAG = 209;

        void combineVideoAudio(String str, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2);

        boolean init(TextureView textureView, String str, String str2, VECommonCallback vECommonCallback, VECommonCallback vECommonCallback2);

        void onDestory();

        void pausePlay();

        void resumePlay();

        void setRecordParameter(int i, int i2, int i3);

        void startPlay();
    }

    public interface LyingDirectHint {
        void directHideLyingDirectHint();

        void updateLyingDirectHint(boolean z, boolean z2);
    }

    public interface MainContentProtocol extends BaseProtocol, EffectCropViewController, IndicatorProtocol, LyingDirectHint {
        public static final int TYPE_TAG = 166;

        List<WaterMarkData> getFaceWaterMarkInfos();

        void hideDelayNumber();

        void hideReviewViews();

        boolean isFaceLocationOK();

        boolean onViewTouchEvent(int i, MotionEvent motionEvent);

        void performHapticFeedback(int i);

        void setCenterHint(int i, String str, String str2, int i2);

        void setMimojiDetectTipType(int i);

        void setPreviewAspectRatio(float f);

        void showDelayNumber(int i);

        void showReviewViews(Bitmap bitmap);

        void updateContentDescription();

        void updateMimojiFaceDetectResultTip(boolean z);
    }

    public interface MakeupProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 180;

        boolean isSeekBarVisible();

        void onMakeupItemSelected(String str, boolean z);
    }

    public interface ManuallyAdjust extends BaseProtocol {
        public static final int ADJUST_MANUAL = 1;
        public static final int ADJUST_NOT_SPECIFIED = -1;
        public static final int ADJUST_NULL = 0;
        public static final int ADJUST_SCENE = 2;
        public static final int ADJUST_TILT = 3;
        public static final int MANUALLY_ANIMATE_IN = 1;
        public static final int MANUALLY_ANIMATE_OUT = 2;
        public static final int MANUALLY_INVISIBLE = 3;
        public static final int MANUALLY_NOT_SPECIFIED = -1;
        public static final int TYPE_TAG = 181;

        @Retention(RetentionPolicy.SOURCE)
        public @interface AdjustType {
        }

        @Retention(RetentionPolicy.SOURCE)
        public @interface ManuallyVisible {
        }

        void setManuallyLayoutVisible(boolean z);

        int setManuallyVisible(int i, int i2, ManuallyListener manuallyListener);

        int visibleHeight();
    }

    public interface ManuallyValueChanged extends BaseProtocol {
        public static final int TYPE_TAG = 174;

        void onBokehFNumberValueChanged(String str);

        void onDualLensSwitch(ComponentManuallyDualLens componentManuallyDualLens, int i);

        void onDualLensZooming(boolean z);

        void onDualZoomHappened(boolean z);

        void onDualZoomValueChanged(float f, int i);

        void onETValueChanged(ComponentManuallyET componentManuallyET, String str);

        void onFocusValueChanged(ComponentManuallyFocus componentManuallyFocus, String str, String str2);

        void onISOValueChanged(ComponentManuallyISO componentManuallyISO, String str);

        void onWBValueChanged(ComponentManuallyWB componentManuallyWB, String str, boolean z);
    }

    public interface MiBeautyProtocol extends BaseProtocol {
        public static final int DISMISS_ALPHA = 3;
        public static final int DISMISS_SILENT = 1;
        public static final int DISMISS_SLIDE = 2;
        public static final int TYPE_TAG = 194;

        @Retention(RetentionPolicy.SOURCE)
        public @interface DismissType {
        }

        void clearBeauty();

        void closeEyeLight();

        void dismiss(int i);

        List<TypeItem> getSupportedBeautyItems(@ShineType String str);

        boolean isBeautyPanelShow();

        boolean isEyeLightShow();

        void resetBeauty();

        void show();

        void switchShineType(@ShineType String str, boolean z);
    }

    public interface MimojiAlert extends BaseProtocol {
        public static final int TYPE_TAG = 226;

        void firstProgressShow(boolean z);

        int refreshMimojiList();
    }

    public interface MimojiAvatarEngine extends BaseProtocol {
        public static final int TYPE_TAG = 217;

        void backToPreview(boolean z, boolean z2);

        void initAvatarEngine(int i, int i2, int i3, int i4, boolean z);

        boolean isOnCreateMimoji();

        boolean isRecordStopping();

        boolean isRecording();

        void onCaptureImage();

        boolean onCreateCapture();

        void onDeviceRotationChange(int i);

        void onDrawFrame(Rect rect, int i, int i2, boolean z);

        void onMimojiCreate();

        void onMimojiDeleted();

        void onMimojiSelect(MimojiInfo mimojiInfo);

        void onRecordStart(ContentValues contentValues);

        void onRecordStop(boolean z);

        void onResume();

        void releaseRender();

        void setDetectSuccess(boolean z);

        void setDisableSingleTapUp(boolean z);
    }

    public interface MimojiEditor extends BaseProtocol {
        public static final int TYPE_TAG = 224;

        void directlyEnterEditMode(MimojiInfo mimojiInfo, int i);

        void onDeviceRotationChange(int i);

        void onTypeConfigSelect(int i);

        void releaseRender();

        void requestRender();

        void resetConfig();

        void startMimojiEdit(boolean z, int i);
    }

    public interface ModeChangeController extends BaseProtocol {
        public static final int TYPE_TAG = 179;

        boolean canSwipeChangeMode();

        void changeModeByGravity(int i, int i2);

        void changeModeByNewMode(int i, int i2);
    }

    public interface ModeCoordinator {
        <P extends BaseProtocol> void attachProtocol(int i, P p);

        <P extends BaseProtocol> void detachProtocol(int i, P p);

        <P extends BaseProtocol> P getAttachProtocol(int i);
    }

    public interface OnFaceBeautyChangedProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 199;

        void onBeautyChanged(boolean z);
    }

    public interface OnOpticalZoomRatioChangeProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 203;

        void onOpticalZoomRatioUpdate(boolean z);
    }

    public interface PanoramaProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 176;

        ViewGroup getPreivewContainer();

        void initPreviewLayout(int i, int i2, int i3, int i4);

        boolean isShown();

        void onCaptureOrientationDecided(int i, int i2, int i3);

        void onPreviewMoving();

        void requestRender();

        void resetShootUI();

        void setDirectionPosition(Point point, int i);

        void setDirectionTooFast(boolean z, int i);

        void setDisplayPreviewBitmap(Bitmap bitmap);

        void setShootUI();

        void showSmallPreview(boolean z);
    }

    public interface PlayVideoProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 167;

        void playVideo();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ProtocolType {
    }

    public interface RecordState extends BaseProtocol {
        public static final int TYPE_TAG = 212;

        void onFailed();

        void onFinish();

        void onMimojiCreateBack();

        void onPause();

        void onPostPreview();

        void onPostPreviewBack();

        void onPostSavingFinish();

        void onPostSavingStart();

        void onPrepare();

        void onResume();

        void onStart();

        void prepareCreateMimoji();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface ShowType {
    }

    public interface SnapShotIndicator extends BaseProtocol {
        public static final int TYPE_TAG = 184;

        void setSnapNumValue(int i);

        void setSnapNumVisible(boolean z, boolean z2);
    }

    public interface StandaloneMacroProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 202;

        void onSwitchStandaloneMacro(boolean z);
    }

    public interface StickerProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 178;

        void onStickerChanged(String str);
    }

    public interface TopAlert extends BaseProtocol, LyingDirectHint {
        public static final int TYPE_TAG = 172;

        void alertAiDetectTipHint(int i, @StringRes int i2, long j);

        void alertAiSceneSelector(int i);

        void alertFlash(int i, boolean z, boolean z2);

        void alertHDR(int i, boolean z, boolean z2);

        void alertLightingHint(int i);

        void alertLightingTitle(boolean z);

        void alertMimojiFaceDetect(boolean z, @StringRes int i);

        void alertMoonModeSelector(int i, boolean z);

        void alertMusicClose(boolean z);

        void alertSwitchHint(int i, @StringRes int i2);

        void alertSwitchHint(int i, String str);

        void alertTopHint(int i, @StringRes int i2);

        void alertTopHint(int i, @StringRes int i2, long j);

        void alertTopHint(int i, String str);

        void alertUpdateValue(int i);

        void alertVideoUltraClear(int i, @StringRes int i2);

        void clearAlertStatus();

        void disableMenuItem(boolean z, int... iArr);

        void enableMenuItem(boolean z, int... iArr);

        int getCurrentAiSceneLevel();

        void hideAlert();

        void hideConfigMenu();

        void hideExtraMenu();

        void hideSwitchHint();

        void insertConfigItem(int i);

        boolean isExtraMenuShowing();

        void reInitAlert(boolean z);

        void refreshExtraMenu();

        void removeConfigItem(int i);

        void removeExtraMenu(int i);

        void setAiSceneImageLevel(int i);

        void setRecordingTimeState(int i);

        void showConfigMenu();

        void startLiveShotAnimation();

        void updateConfigItem(int... iArr);

        void updateContentDescription();

        void updateRecordingTime(String str);
    }

    public interface TopConfigProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 193;

        void reShowMoon();

        void startAiLens();
    }

    public interface UltraWideProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 200;

        void onSwitchUltraWide(boolean z);
    }

    public interface VerticalProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 198;

        void alertLightingHint(int i);

        boolean isAnyViewVisible();

        void setLightingPattern(String str);
    }

    public interface WideSelfieProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 216;

        void initPreviewLayout(int i, int i2, int i3, int i4);

        void requestRender();

        void resetShootUI();

        void setShootingUI();

        void updateHintText(@StringRes int i);

        void updatePreviewBitmap(Bitmap bitmap, Rect rect, Rect rect2);

        void updateThumbBackgroudLayout(boolean z, boolean z2, int i);
    }

    public interface ZoomProtocol extends BaseProtocol {
        public static final int TYPE_TAG = 170;

        float getMaxZoomRatio();

        float getMinZoomRatio();

        float getZoomRatio();

        void notifyDualZoom(boolean z);

        void notifyZooming(boolean z);

        void onZoomRatioChanged(float f, int i);

        void onZoomSwitchCamera();

        void setMaxZoomRatio(float f);

        void setMinZoomRatio(float f);
    }
}
