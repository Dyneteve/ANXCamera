package com.android.camera.module;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.params.MeteringRectangle;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemProperties;
import android.support.annotation.CallSuper;
import android.support.annotation.StringRes;
import android.support.annotation.WorkerThread;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import com.android.camera.Camera;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraErrorCallbackImpl;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.FileCompat;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.JpegEncodingQualityMappings;
import com.android.camera.MutexModeManager;
import com.android.camera.MutexModeManager.MutexCallBack;
import com.android.camera.R;
import com.android.camera.ThermalDetector;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.log.Log;
import com.android.camera.module.loader.ActionHideLensDirtyDetectHint;
import com.android.camera.module.loader.ActionUpdateLensDirtyDetect;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.preferences.SettingsOverrider;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.EvChangedProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.UltraWideProtocol;
import com.android.camera.protocol.ModeProtocol.ZoomProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.FocusView.ExposureViewListener;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CaptureResultParser;
import com.mi.config.b;
import io.reactivex.Completable;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;

public abstract class BaseModule implements MutexCallBack, Module, EvChangedProtocol, UltraWideProtocol, ZoomProtocol, ExposureViewListener, CameraMetaDataCallback, Consumer<int[]> {
    protected static final int BACK_PRESSED_TIME_INTERVAL = 3000;
    public static final int[] CAMERA_MODES = {0, 2, 4, 6};
    public static final int CAMERA_MODE_IMAGE_CAPTURE = 2;
    public static final int CAMERA_MODE_NORMAL = 0;
    public static final int CAMERA_MODE_SCAN_QR_CODE = 6;
    public static final int CAMERA_MODE_VIDEO_CAPTURE = 4;
    protected static final boolean DEBUG = Util.isDebugOsBuild();
    public static final int LENS_DIRTY_DETECT_HINT_DURATION = 8000;
    protected static final int LENS_DIRTY_DETECT_TIMEOUT = 15000;
    protected static final int SCREEN_DELAY = 60000;
    protected static final int SCREEN_DELAY_KEYGUARD = 30000;
    public static final int SHUTTER_DOWN_FROM_BUTTON = 2;
    public static final int SHUTTER_DOWN_FROM_HARD_KEY = 1;
    public static final int SHUTTER_DOWN_FROM_UNKNOWN = 0;
    public static final int SHUTTER_DOWN_FROM_UNLOCK_OR_LONG_CLICK_OR_AUDIO = 3;
    private static final String TAG = "BaseModule";
    private boolean isShowPreviewDebugInfo;
    protected boolean isZooming;
    protected boolean m3ALockSupported;
    protected boolean mAELockOnlySupported;
    protected Camera mActivity;
    protected int mActualCameraId;
    protected boolean mAeLockSupported;
    protected boolean mAwbLockSupported;
    protected int mBogusCameraId;
    protected Camera2Proxy mCamera2Device;
    protected CameraCapabilities mCameraCapabilities;
    protected boolean mCameraDisabled;
    protected int mCameraDisplayOrientation;
    protected boolean mCameraHardwareError;
    private int mCameraState = 0;
    protected ContentResolver mContentResolver;
    protected boolean mContinuousFocusSupported;
    protected float mDeviceRotation = -1.0f;
    protected Rect mDisplayRect;
    protected int mDisplayRotation = -1;
    protected CameraErrorCallbackImpl mErrorCallback;
    private int mEvState;
    private int mEvValue;
    protected String mFlashAutoModeState;
    protected boolean mFocusAreaSupported;
    protected boolean mFocusOrAELockSupported;
    protected Handler mHandler;
    protected boolean mIgnoreFocusChanged;
    private volatile boolean mIgnoreTouchEvent;
    private AtomicBoolean mIsCreated = new AtomicBoolean(false);
    private AtomicBoolean mIsDeparted = new AtomicBoolean(false);
    private AtomicBoolean mIsFrameAvailable = new AtomicBoolean(false);
    protected long mLastBackPressedTime;
    private Disposable mLensDirtyDetectDisposable;
    private Disposable mLensDirtyDetectHintDisposable;
    protected MainContentProtocol mMainProtocol;
    protected long mMainThreadId = Thread.currentThread().getId();
    protected int mMaxFaceCount;
    private float mMaxZoomRatio = 1.0f;
    protected boolean mMeteringAreaSupported;
    private float mMinZoomRatio = 1.0f;
    protected int mModuleIndex;
    protected MutexModeManager mMutexModePicker;
    protected boolean mObjectTrackingStarted;
    protected boolean mOpenCameraFail;
    protected int mOrientation = -1;
    protected int mOrientationCompensation = 0;
    protected CameraSize mOutPutSize;
    protected volatile boolean mPaused;
    protected int mPendingScreenSlideKeyCode;
    protected CameraSize mPictureSize;
    protected CameraSize mPreviewSize;
    private boolean mRestoring;
    protected SettingsOverrider mSettingsOverrider = new SettingsOverrider();
    protected long mSurfaceCreatedTimestamp;
    protected int mTriggerMode = 10;
    protected int mUIStyle = -1;
    protected CameraCapabilities mUltraCameraCapabilities;
    protected String mUnInterruptableReason;
    private Disposable mUpdateWorkThreadDisposable;
    /* access modifiers changed from: private */
    public ObservableEmitter<int[]> mUpdateWorkThreadEmitter;
    private float mZoomRatio = 1.0f;
    private float mZoomScaled;
    protected boolean mZoomSupported;

    @Retention(RetentionPolicy.SOURCE)
    public @interface CameraMode {
    }

    private void detectLensDirty(CaptureResult captureResult) {
        if (this.mLensDirtyDetectDisposable != null && CaptureResultParser.isLensDirtyDetected(captureResult)) {
            this.mLensDirtyDetectDisposable.dispose();
            this.mLensDirtyDetectDisposable = null;
            Completable.complete().observeOn(GlobalConstant.sCameraSetupScheduler).doOnComplete(new ActionUpdateLensDirtyDetect(this, false)).subscribe();
            if (CameraSettings.shouldShowLensDirtyDetectHint()) {
                this.mActivity.showLensDirtyDetectedHint();
                this.mLensDirtyDetectHintDisposable = Completable.complete().delay(8000, TimeUnit.MILLISECONDS, GlobalConstant.sCameraSetupScheduler).doOnComplete(new ActionHideLensDirtyDetectHint(this)).subscribe();
            }
        }
    }

    protected static String getColorEffectKey() {
        return b.gN() ? "pref_camera_shader_coloreffect_key" : CameraSettings.KEY_COLOR_EFFECT;
    }

    public static int getJpegQuality(boolean z) {
        return JpegEncodingQualityMappings.getQualityNumber(CameraSettings.getJpegQuality(z));
    }

    public static int getPreferencesLocalId(int i, int i2) {
        return i + i2;
    }

    private Rect getTapableRectWithEdgeSlop() {
        Rect rect = new Rect(this.mDisplayRect);
        if (!isRecording()) {
            int i = this.mUIStyle;
            if (i == 1) {
                rect.bottom -= CameraSettings.BOTTOM_CONTROL_HEIGHT - Util.sNavigationBarHeight;
                if (Util.isLongRatioScreen && !Util.isNotchDevice) {
                    rect.bottom += Math.abs(rect.top - ((Util.sWindowHeight - ((int) (((float) (Util.sWindowWidth * 16)) / 9.0f))) - Util.sNavigationBarHeight));
                }
            } else if (i == 3) {
                rect.bottom -= CameraSettings.BOTTOM_CONTROL_HEIGHT;
            } else if (this.mModuleIndex == 165) {
                int i2 = (((int) (((float) Util.sWindowWidth) / 0.75f)) - Util.sWindowWidth) / 2;
                rect.top = ((Util.sWindowHeight - CameraSettings.BOTTOM_CONTROL_HEIGHT) - Util.sWindowWidth) - i2;
                rect.bottom -= i2;
            }
        }
        int calculateDefaultPreviewEdgeSlop = Util.calculateDefaultPreviewEdgeSlop(this.mActivity);
        int i3 = SystemProperties.getInt("camera_touch_edge_slop", -1);
        if (i3 != -1) {
            calculateDefaultPreviewEdgeSlop = Util.dpToPixel((float) i3);
        }
        rect.inset(calculateDefaultPreviewEdgeSlop, calculateDefaultPreviewEdgeSlop);
        return rect;
    }

    private void setCreated(boolean z) {
        this.mIsCreated.set(z);
    }

    private void setIgnoreTouchEvent(boolean z) {
        this.mIgnoreTouchEvent = z;
    }

    private void showDebug(final CaptureResult captureResult, final boolean z) {
        if (Util.isShowAfRegionView() && z) {
            this.mMainProtocol.setAfRegionView((MeteringRectangle[]) captureResult.get(CaptureResult.CONTROL_AF_REGIONS), getActiveArraySize(), getDeviceBasedZoomRatio());
        }
        if (Util.isShowDebugInfoView()) {
            this.mActivity.runOnUiThread(new Runnable() {
                public void run() {
                    if (z) {
                        BaseModule.this.mActivity.showDebugInfo(Util.getDebugInformation(captureResult));
                    } else {
                        BaseModule.this.mActivity.showDebugInfo("");
                    }
                }
            });
        }
    }

    private void switchCameraLens(boolean z, boolean z2) {
        DataItemGlobal dataItemGlobal = (DataItemGlobal) DataRepository.provider().dataGlobal();
        int currentMode = dataItemGlobal.getCurrentMode();
        dataItemGlobal.setCameraId(0);
        this.mActivity.onModeSelected(StartControl.create(currentMode).setStartDelay(0).setResetType(5).setViewConfigType(2).setNeedReConfigureData(z).setNeedBlurAnimation(z2));
    }

    public void accept(@UpdateType int[] iArr) throws Exception {
        if (!this.mUpdateWorkThreadDisposable.isDisposed() && isDeviceAlive()) {
            consumePreference(iArr);
            if (!isAlive() || this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp() != this.mSurfaceCreatedTimestamp) {
                Log.d(TAG, "skip resumePreview on accept");
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean addZoom(float f) {
        return onZoomingActionUpdate(this.mZoomRatio + f, 1);
    }

    /* access modifiers changed from: protected */
    public void applyZoomRatio() {
        if (this.mCamera2Device != null) {
            float deviceBasedZoomRatio = getDeviceBasedZoomRatio();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("applyZoomRatio(): apply zoom ratio to device = ");
            sb.append(deviceBasedZoomRatio);
            Log.d(str, sb.toString());
            this.mCamera2Device.setZoomRatio(deviceBasedZoomRatio);
        }
    }

    public boolean canIgnoreFocusChanged() {
        return this.mIgnoreFocusChanged;
    }

    /* access modifiers changed from: protected */
    public void changeConflictPreference() {
        if (CameraSettings.isStereoModeOn()) {
            List<String> supportedSettingKeys = getSupportedSettingKeys();
            if (supportedSettingKeys != null) {
                ProviderEditor editor = DataRepository.dataItemConfig().editor();
                for (String str : supportedSettingKeys) {
                    if (CameraSettings.isSwitchOn(str)) {
                        editor.remove(str);
                    }
                }
                editor.apply();
            }
        }
    }

    public void checkActivityOrientation() {
        if (isDeviceAlive() && this.mDisplayRotation != Util.getDisplayRotation(this.mActivity)) {
            checkDisplayOrientation();
        }
    }

    public void checkDisplayOrientation() {
        this.mDisplayRotation = Util.getDisplayRotation(this.mActivity);
        this.mCameraDisplayOrientation = Util.getDisplayOrientation(this.mDisplayRotation, this.mBogusCameraId);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("checkDisplayOrientation: ");
        sb.append(this.mDisplayRotation);
        sb.append(" | ");
        sb.append(this.mCameraDisplayOrientation);
        Log.v(str, sb.toString());
        if (this.mActivity.getCameraScreenNail() != null) {
            this.mActivity.getCameraScreenNail().setDisplayOrientation(this.mDisplayRotation);
        }
    }

    /* access modifiers changed from: protected */
    public void consumePreference(@UpdateType int... iArr) {
    }

    /* access modifiers changed from: protected */
    public boolean currentIsMainThread() {
        return this.mMainThreadId == Thread.currentThread().getId();
    }

    public void enableCameraControls(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("enableCameraControls: enable = ");
        sb.append(z);
        sb.append(", caller: ");
        sb.append(Util.getCallers(1));
        Log.d(str, sb.toString());
        setIgnoreTouchEvent(!z);
    }

    public void enterMutexMode(int i) {
    }

    public void exitMutexMode(int i) {
    }

    public View findViewById(int i) {
        return this.mActivity.findViewById(i);
    }

    /* access modifiers changed from: protected */
    public void focusCenter() {
    }

    /* access modifiers changed from: protected */
    public Rect getActiveArraySize() {
        return this.mCameraCapabilities.getActiveArraySize();
    }

    public Camera getActivity() {
        return this.mActivity;
    }

    public int getActualCameraId() {
        return this.mActualCameraId;
    }

    public int getBogusCameraId() {
        return this.mBogusCameraId;
    }

    public CameraCapabilities getCameraCapabilities() {
        return this.mCameraCapabilities;
    }

    public Camera2Proxy getCameraDevice() {
        return this.mCamera2Device;
    }

    /* access modifiers changed from: protected */
    public int getCameraRotation() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public int getCameraState() {
        return this.mCameraState;
    }

    /* access modifiers changed from: protected */
    public Rect getCropRegion() {
        return HybridZoomingSystem.toCropRegion(getDeviceBasedZoomRatio(), getActiveArraySize());
    }

    public final float getDeviceBasedZoomRatio() {
        float f = this.mZoomRatio;
        if (!HybridZoomingSystem.IS_3_OR_MORE_SAT || this.mActualCameraId != Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return f;
        }
        int i = this.mModuleIndex;
        if (i != 165) {
            if (i == 167) {
                return f;
            }
            if (i != 174) {
                switch (i) {
                    case 161:
                    case 162:
                    case 163:
                        break;
                    default:
                        return f;
                }
            }
        }
        return HybridZoomingSystem.clamp(this.mZoomRatio / HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR, 1.0f, this.mCameraCapabilities.getMaxZoomRatio());
    }

    public Handler getHandler() {
        return this.mHandler;
    }

    /* access modifiers changed from: protected */
    public CameraSize getJpegThumbnailSize() {
        return Util.getOptimalJpegThumbnailSize(this.mCameraCapabilities.getSupportedThumbnailSizes(), ((double) this.mPreviewSize.getWidth()) / ((double) this.mPreviewSize.getHeight()));
    }

    public float getMaxZoomRatio() {
        return this.mMaxZoomRatio;
    }

    public float getMinZoomRatio() {
        return this.mMinZoomRatio;
    }

    public int getModuleIndex() {
        return this.mModuleIndex;
    }

    public MutexModeManager getMutexModePicker() {
        return this.mMutexModePicker;
    }

    public abstract int getOperatingMode();

    public CameraSize getPreviewSize() {
        return this.mPreviewSize;
    }

    public Resources getResources() {
        return this.mActivity.getResources();
    }

    /* access modifiers changed from: protected */
    public int getScreenDelay() {
        return (this.mActivity == null || this.mActivity.startFromKeyguard()) ? 30000 : 60000;
    }

    public String getString(int i) {
        return CameraAppImpl.getAndroidContext().getString(i);
    }

    public List<String> getSupportedSettingKeys() {
        return new ArrayList();
    }

    /* access modifiers changed from: protected */
    public int getTriggerMode() {
        return this.mTriggerMode;
    }

    public String getUnInterruptableReason() {
        return this.mUnInterruptableReason;
    }

    public Window getWindow() {
        return this.mActivity.getWindow();
    }

    public float getZoomRatio() {
        return this.mZoomRatio;
    }

    /* access modifiers changed from: protected */
    public void handlePendingScreenSlide() {
        if (this.mPendingScreenSlideKeyCode > 0 && this.mActivity != null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("process pending screen slide: ");
            sb.append(this.mPendingScreenSlideKeyCode);
            Log.d(str, sb.toString());
            this.mActivity.handleScreenSlideKeyEvent(this.mPendingScreenSlideKeyCode, null);
            this.mPendingScreenSlideKeyCode = 0;
        }
    }

    /* access modifiers changed from: protected */
    public boolean handleVolumeKeyEvent(boolean z, boolean z2, int i, boolean z3) {
        if (!isAlive()) {
            return true;
        }
        String str = z3 ? getString(R.string.pref_camera_volumekey_function_entryvalue_shutter) : ModuleManager.isLiveModule() ? DataRepository.dataItemGlobal().getString(CameraSettings.KEY_VOLUME_LIVE_FUNCTION, getString(R.string.pref_live_volumekey_function_default)) : ModuleManager.isVideoCategory(getModuleIndex()) ? DataRepository.dataItemGlobal().getString(CameraSettings.KEY_VOLUME_VIDEO_FUNCTION, getString(R.string.pref_video_volumekey_function_default)) : DataRepository.dataItemGlobal().getString(CameraSettings.KEY_VOLUME_CAMERA_FUNCTION, getString(R.string.pref_camera_volumekey_function_default));
        if (str.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_shutter)) || str.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_timer))) {
            performVolumeKeyClicked(str, i, z2);
            return true;
        } else if (ModuleManager.isPanoramaModule() || ModuleManager.isWideSelfieModule() || !str.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_zoom)) || !isZoomSupported()) {
            return false;
        } else {
            if (z2) {
                onZoomingActionStart(1);
                if (!isZoomEnabled()) {
                    return true;
                }
                boolean addZoom = z ? addZoom(0.1f) : addZoom(-0.1f);
                if (i == 0 && addZoom) {
                    CameraStatUtil.trackZoomAdjusted(CameraStat.ZOOM_MODE_VOLUME);
                }
            } else {
                onZoomingActionEnd(1);
            }
            return true;
        }
    }

    /* access modifiers changed from: protected */
    public boolean hasCameraException() {
        return this.mCameraDisabled || this.mOpenCameraFail || this.mCameraHardwareError;
    }

    /* access modifiers changed from: protected */
    public void hideTipMessage(@StringRes int i) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips == null) {
            return;
        }
        if (i <= 0 || bottomPopupTips.containTips(i)) {
            bottomPopupTips.directlyHideTips();
        }
    }

    public void initByCapability(CameraCapabilities cameraCapabilities) {
        this.mAeLockSupported = cameraCapabilities.isAELockSupported();
        this.mAwbLockSupported = cameraCapabilities.isAWBLockSupported();
        this.mFocusAreaSupported = cameraCapabilities.isAFRegionSupported();
        this.mMeteringAreaSupported = cameraCapabilities.isAERegionSupported();
        boolean z = false;
        boolean z2 = DataRepository.dataItemFeature().go() && !this.mFocusAreaSupported && this.mMeteringAreaSupported && this.mAeLockSupported;
        this.mAELockOnlySupported = z2;
        boolean z3 = this.mFocusAreaSupported || this.mAELockOnlySupported;
        this.mFocusOrAELockSupported = z3;
        if (CameraSettings.isAEAFLockSupport() && (isBackCamera() || this.mAELockOnlySupported)) {
            z = true;
        }
        this.m3ALockSupported = z;
    }

    /* access modifiers changed from: protected */
    public void initializeCapabilities() {
        this.mCameraCapabilities.setOperatingMode(getOperatingMode());
        initByCapability(this.mCameraCapabilities);
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
        initializeZoomRangeFromCapabilities();
    }

    /* access modifiers changed from: protected */
    public void initializeZoomRangeFromCapabilities() {
        if (!this.mZoomSupported) {
            return;
        }
        if (isBackCamera()) {
            int i = this.mModuleIndex;
            if (i != 165) {
                if (i == 167) {
                    setMinZoomRatio(1.0f);
                    if (CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                        setMaxZoomRatio(2.0f);
                        return;
                    } else {
                        setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                        return;
                    }
                } else if (i != 174) {
                    switch (i) {
                        case 161:
                            if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                                setMinZoomRatio(1.0f);
                                if (CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                                    setMaxZoomRatio(2.0f);
                                    return;
                                } else {
                                    setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                                    return;
                                }
                            } else if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                                setMaxZoomRatio(1.0f);
                                return;
                            } else {
                                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                                setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
                                return;
                            }
                        case 162:
                            if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                                setMinZoomRatio(1.0f);
                                if (CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                                    setMaxZoomRatio(2.0f);
                                    return;
                                } else {
                                    setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                                    return;
                                }
                            } else if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                                setMaxZoomRatio(1.0f);
                                return;
                            } else {
                                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                                setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
                                return;
                            }
                        case 163:
                            break;
                        default:
                            setMinZoomRatio(1.0f);
                            setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                            return;
                    }
                } else if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                    setMinZoomRatio(1.0f);
                    if (CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                        setMaxZoomRatio(2.0f);
                        return;
                    } else {
                        setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                        return;
                    }
                } else if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                    setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                    setMaxZoomRatio(1.0f);
                    return;
                } else {
                    setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                    setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
                    return;
                }
            }
            if (!HybridZoomingSystem.IS_3_OR_MORE_SAT) {
                setMinZoomRatio(1.0f);
                if (CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                    setMaxZoomRatio(2.0f);
                } else {
                    setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
                }
            } else if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                setMaxZoomRatio(1.0f);
            } else {
                setMinZoomRatio(HybridZoomingSystem.getMinimumOpticalZoomRatio());
                setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
            }
        } else {
            setMinZoomRatio(1.0f);
            setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
        }
    }

    /* access modifiers changed from: protected */
    public void initializeZoomRatio() {
        if (!HybridZoomingSystem.IS_3_OR_MORE_SAT || !isBackCamera()) {
            Log.d(TAG, "resetZoomRatio(): set zoom ratio to 1.0");
            setZoomRatio(1.0f);
            return;
        }
        int i = this.mModuleIndex;
        if (i != 165) {
            if (i != 174) {
                switch (i) {
                    case 161:
                    case 162:
                        break;
                    case 163:
                        break;
                    default:
                        Log.d(TAG, "resetZoomRatio(): set zoom ratio to 1.0");
                        setZoomRatio(1.0f);
                        return;
                }
            }
            if (!CameraSettings.isUltraWideConfigOpen(this.mModuleIndex)) {
                if (CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("resetZoomRatio(): set zoom ratio to ");
                    sb.append(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    Log.d(str, sb.toString());
                    setZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    return;
                } else if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("resetZoomRatio(): set zoom ratio to ");
                    sb2.append(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    Log.d(str2, sb2.toString());
                    setZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    return;
                } else {
                    String zoomRatioHistory = HybridZoomingSystem.getZoomRatioHistory(this.mModuleIndex, Float.toString(1.0f));
                    String str3 = TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("resetZoomRatio(): set zoom ratio to ");
                    sb3.append(zoomRatioHistory);
                    Log.d(str3, sb3.toString());
                    setZoomRatio(HybridZoomingSystem.toFloat(zoomRatioHistory, 1.0f));
                    return;
                }
            } else {
                return;
            }
        }
        if (!CameraSettings.isUltraWideConfigOpen(this.mModuleIndex)) {
            if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                String str4 = TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("resetZoomRatio(): set zoom ratio to ");
                sb4.append(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                Log.d(str4, sb4.toString());
                setZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
            } else if (CameraSettings.isSupportedOpticalZoom() || CameraSettings.isUltraPixelRear48MPOn()) {
                Log.d(TAG, "resetZoomRatio(): set zoom ratio to 1.0");
                setZoomRatio(1.0f);
            } else {
                String zoomRatioHistory2 = HybridZoomingSystem.getZoomRatioHistory(this.mModuleIndex, Float.toString(1.0f));
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("resetZoomRatio(): set zoom ratio to ");
                sb5.append(zoomRatioHistory2);
                Log.d(str5, sb5.toString());
                setZoomRatio(HybridZoomingSystem.toFloat(zoomRatioHistory2, 1.0f));
            }
        }
    }

    public boolean isAlive() {
        return isCreated() && !isDeparted();
    }

    /* access modifiers changed from: protected */
    public final boolean isBackCamera() {
        return this.mBogusCameraId == 0;
    }

    public boolean isBlockSnap() {
        return isDoingAction();
    }

    /* access modifiers changed from: protected */
    public final boolean isBokehFrontCamera() {
        return this.mActualCameraId == Camera2DataContainer.getInstance().getBokehFrontCameraId();
    }

    /* access modifiers changed from: protected */
    public final boolean isBokehUltraWideBackCamera() {
        return this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideBokehCameraId();
    }

    /* access modifiers changed from: protected */
    public boolean isCameraSwitchingDuringZoomingAllowed() {
        return false;
    }

    public boolean isCaptureIntent() {
        return false;
    }

    public boolean isCreated() {
        return this.mIsCreated.get();
    }

    public boolean isDeparted() {
        return this.mIsDeparted.get();
    }

    public boolean isDeviceAlive() {
        boolean z = this.mCamera2Device != null && isAlive();
        if (!z) {
            String str = "device: %s module: %s|%s";
            Object[] objArr = new Object[3];
            objArr[0] = this.mCamera2Device != null ? "valid" : "invalid";
            objArr[1] = isCreated() ? "created" : "destroyed";
            objArr[2] = isDeparted() ? "departed" : "alive";
            String format = String.format(str, objArr);
            if (DEBUG) {
                new RuntimeException(format).printStackTrace();
            } else {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append(Util.getCallers(1));
                sb.append("|");
                sb.append(format);
                Log.e(str2, sb.toString());
            }
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public final boolean isDualCamera() {
        return this.mActualCameraId == Camera2DataContainer.getInstance().getSATCameraId() || this.mActualCameraId == Camera2DataContainer.getInstance().getBokehCameraId();
    }

    /* access modifiers changed from: protected */
    public final boolean isDualFrontCamera() {
        return this.mActualCameraId == Camera2DataContainer.getInstance().getSATFrontCameraId() || this.mActualCameraId == Camera2DataContainer.getInstance().getBokehFrontCameraId();
    }

    public boolean isFrameAvailable() {
        return this.mIsFrameAvailable.get();
    }

    public final boolean isFrontCamera() {
        return this.mBogusCameraId == 1;
    }

    public boolean isIgnoreTouchEvent() {
        return this.mIgnoreTouchEvent;
    }

    public boolean isInTapableRect(int i, int i2) {
        if (this.mDisplayRect == null) {
            return false;
        }
        return getTapableRectWithEdgeSlop().contains(i, i2);
    }

    public boolean isKeptBitmapTexture() {
        return false;
    }

    public boolean isMeteringAreaOnly() {
        return false;
    }

    public boolean isNeedHapticFeedback() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean isNeedMute() {
        return false;
    }

    public boolean isPortraitMode() {
        return this.mModuleIndex == 171;
    }

    public boolean isPostProcessing() {
        return false;
    }

    public boolean isRecording() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isRestoring() {
        return this.mRestoring;
    }

    public boolean isSelectingCapturedResult() {
        return false;
    }

    public boolean isShowAeAfLockIndicator() {
        return false;
    }

    public boolean isShowCaptureButton() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isSquareModeChange() {
        return ModuleManager.isSquareModule() != (this.mActivity.getCameraScreenNail().getRenderTargetRatio() == 2);
    }

    public boolean isSupportAELockOnly() {
        return this.mAELockOnlySupported;
    }

    public boolean isSupportFocusShoot() {
        return false;
    }

    /* access modifiers changed from: protected */
    public final boolean isTextureExpired() {
        return this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp() != this.mSurfaceCreatedTimestamp;
    }

    public boolean isThermalThreshold() {
        return false;
    }

    /* access modifiers changed from: protected */
    public final boolean isUltraWideBackCamera() {
        return this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId();
    }

    /* access modifiers changed from: protected */
    public boolean isZoomEnabled() {
        return true;
    }

    public boolean isZoomRatioBetweenUltraAndWide() {
        return this.mZoomRatio >= HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR && this.mZoomRatio < HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE;
    }

    /* access modifiers changed from: protected */
    public boolean isZoomSupported() {
        return this.mZoomSupported;
    }

    /* access modifiers changed from: protected */
    public void mapTapCoordinate(Object obj) {
        if (obj instanceof Point) {
            Point point = (Point) obj;
            point.x -= this.mDisplayRect.left;
            point.y -= this.mDisplayRect.top;
        } else if (obj instanceof RectF) {
            RectF rectF = (RectF) obj;
            rectF.left -= (float) this.mDisplayRect.left;
            rectF.right -= (float) this.mDisplayRect.left;
            rectF.top -= (float) this.mDisplayRect.top;
            rectF.bottom -= (float) this.mDisplayRect.top;
        }
    }

    public void notifyDualZoom(boolean z) {
        if (this.mCamera2Device != null && HybridZoomingSystem.IS_2_SAT) {
            this.mCamera2Device.setOpticalZoomToTele(z);
            this.mCamera2Device.resumePreview();
        }
    }

    public void notifyError() {
        this.mCameraHardwareError = true;
        setCameraState(0);
        if (!this.mActivity.isActivityPaused()) {
            onCameraException();
            return;
        }
        this.mActivity.releaseAll(true, true);
        this.mActivity.finish();
    }

    public void notifyZooming(boolean z) {
        this.isZooming = z;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
    }

    public boolean onBackPressed() {
        return false;
    }

    public void onBeautyParameterChanged() {
    }

    @CallSuper
    public void onBroadcastReceived(Context context, Intent intent) {
        if (this.mActivity != null && !this.mActivity.isFinishing() && intent != null) {
            String action = intent.getAction();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onReceive: action=");
            sb.append(action);
            Log.v(str, sb.toString());
            if ("android.intent.action.MEDIA_MOUNTED".equals(action)) {
                Log.d(TAG, "SD card available");
                Storage.initStorage(context);
                this.mActivity.getScreenHint().updateHint();
            } else if ("android.intent.action.MEDIA_UNMOUNTED".equals(action)) {
                Log.d(TAG, "SD card unavailable");
                FileCompat.updateSDPath();
                this.mActivity.getScreenHint().updateHint();
                this.mActivity.getThumbnailUpdater().getLastThumbnail();
            } else if ("android.intent.action.MEDIA_SCANNER_STARTED".equals(action)) {
                Log.d(TAG, "media scanner started");
            } else if ("android.intent.action.MEDIA_SCANNER_FINISHED".equals(action)) {
                this.mActivity.getThumbnailUpdater().getLastThumbnail();
                Log.d(TAG, "media scanner finisheded");
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onCameraException() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCameraException: ");
        sb.append(this.mModuleIndex);
        sb.append(" | ");
        sb.append(this.mBogusCameraId);
        Log.e(str, sb.toString());
        if (currentIsMainThread()) {
            if ((this.mOpenCameraFail || this.mCameraHardwareError) && ((!this.mActivity.isActivityPaused() || this.mOpenCameraFail) && this.mActivity.couldShowErrorDialog())) {
                Camera camera = this.mActivity;
                int i = Util.isInVideoCall(this.mActivity) ? R.string.cannot_connect_camera_volte_call : CameraSettings.updateOpenCameraFailTimes() > 1 ? R.string.cannot_connect_camera_twice : R.string.cannot_connect_camera_once;
                Util.showErrorAndFinish(camera, i);
                this.mActivity.showErrorDialog();
            }
            if (this.mCameraDisabled && this.mActivity.couldShowErrorDialog()) {
                Util.showErrorAndFinish(this.mActivity, R.string.camera_disabled);
                this.mActivity.showErrorDialog();
            }
        } else {
            sendOpenFailMessage();
        }
        enableCameraControls(false);
    }

    /* access modifiers changed from: protected */
    public void onCameraOpened() {
        initializeCapabilities();
        initializeZoomRatio();
        this.mCamera2Device.setMetaDataCallback(this);
        if (isFrontCamera() && this.mActivity.isScreenSlideOff()) {
            this.mCamera2Device.setAELock(true);
        }
        updateLensDirtyDetect(false);
    }

    /* access modifiers changed from: protected */
    public void onCapabilityChanged(CameraCapabilities cameraCapabilities) {
        initByCapability(cameraCapabilities);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCapabilityChanged: mFocusAreaSupported = ");
        sb.append(this.mFocusAreaSupported);
        sb.append(", mAELockOnlySupported = ");
        sb.append(this.mAELockOnlySupported);
        Log.d(str, sb.toString());
    }

    public void onCreate(int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCreate moduleIndex->");
        sb.append(i);
        sb.append(", cameraId->");
        sb.append(i2);
        Log.d(str, sb.toString());
        this.mModuleIndex = i;
        this.mBogusCameraId = i2;
        this.mContentResolver = this.mActivity.getContentResolver();
        this.mErrorCallback = new CameraErrorCallbackImpl(this.mActivity);
        this.mMainProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        this.mMutexModePicker = new MutexModeManager(this);
        this.mUpdateWorkThreadDisposable = Observable.create(new ObservableOnSubscribe<int[]>() {
            public void subscribe(ObservableEmitter<int[]> observableEmitter) throws Exception {
                BaseModule.this.mUpdateWorkThreadEmitter = observableEmitter;
            }
        }).observeOn(GlobalConstant.sCameraSetupScheduler).subscribe((Consumer<? super T>) this);
        if (DataRepository.dataItemFeature().fS() && CameraSettings.isLensDirtyDetectEnabled()) {
            this.mLensDirtyDetectDisposable = Completable.complete().delay(15000, TimeUnit.MILLISECONDS, GlobalConstant.sCameraSetupScheduler).doOnComplete(new ActionUpdateLensDirtyDetect(this, true)).subscribe();
        }
        setCreated(true);
        this.mIsDeparted.set(false);
        this.isShowPreviewDebugInfo = Util.isShowPreviewDebugInfo();
    }

    @CallSuper
    public void onDestroy() {
        if (this.mActivity != null) {
            this.mActivity.getSensorStateManager().setSensorStateListener(null);
        }
        setCreated(false);
        this.mActivity.getImageSaver().onModuleDestroy();
        Log.d(TAG, "onDestroy");
    }

    public void onEvChanged(int i, int i2) {
        if (isAlive()) {
            this.mEvValue = i;
            this.mEvState = i2;
            if (i2 == 1) {
                CameraSettings.writeExposure(i);
                updateStatusBar(1);
            }
            updatePreferenceInWorkThread(12);
        }
    }

    public boolean onGestureTrack(RectF rectF, boolean z) {
        return true;
    }

    public void onHostStopAndNotifyActionStop() {
    }

    /* access modifiers changed from: protected */
    public boolean onInterceptZoomingEvent(float f, float f2, int i) {
        if (isCameraSwitchingDuringZoomingAllowed()) {
            if (f >= HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE && f2 < HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE) {
                switchCameraLens(true, false);
                return true;
            } else if (f < HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE && f2 >= HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE) {
                switchCameraLens(true, false);
                return true;
            }
        }
        return false;
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (i != 701 && i != 700) {
            return false;
        }
        if (!isUnInterruptable()) {
            this.mPendingScreenSlideKeyCode = 0;
            this.mActivity.handleScreenSlideKeyEvent(i, keyEvent);
            return true;
        } else if (i != 701 || !this.mActivity.getCameraIntentManager().isFromScreenSlide().booleanValue() || this.mActivity.isModeSwitched()) {
            this.mPendingScreenSlideKeyCode = i;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("pending screen slide: ");
            sb.append(i);
            sb.append(", reason: ");
            sb.append(getUnInterruptableReason());
            Log.d(str, sb.toString());
            return false;
        } else {
            this.mActivity.moveTaskToBack(false);
            this.mActivity.overridePendingTransition(R.anim.anim_screen_slide_fade_in, R.anim.anim_screen_slide_fade_out);
            return true;
        }
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (i == 82 && !this.mActivity.startFromSecureKeyguard()) {
            openSettingActivity();
        }
        switch (i) {
            case 24:
            case 25:
            case 87:
            case 88:
                boolean z = i == 24 || i == 88;
                if (handleVolumeKeyEvent(z, false, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                    return true;
                }
                break;
        }
        return false;
    }

    public void onLongPress(float f, float f2) {
    }

    public void onNewIntent() {
    }

    public void onNewUriArrived(Uri uri, String str) {
    }

    public void onOrientationChanged(int i, int i2, int i3) {
        if (i != -1) {
            this.mOrientation = i;
            EffectController.getInstance().setOrientation(Util.getShootOrientation(this.mActivity, this.mOrientation));
            checkActivityOrientation();
            if (this.mOrientationCompensation != i2) {
                this.mOrientationCompensation = i2;
            }
        }
    }

    @CallSuper
    public void onPause() {
        Log.d(TAG, "onPause");
        this.mPaused = true;
        this.mPendingScreenSlideKeyCode = 0;
        this.mUpdateWorkThreadDisposable.dispose();
        if (this.mLensDirtyDetectDisposable != null) {
            this.mLensDirtyDetectDisposable.dispose();
        }
        if (this.mLensDirtyDetectHintDisposable != null) {
            this.mLensDirtyDetectHintDisposable.dispose();
        }
        if (this.mActivity != null) {
            this.mActivity.hideLensDirtyDetectedHint();
        }
    }

    public void onPreviewLayoutChanged(Rect rect) {
    }

    @CallSuper
    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        detectLensDirty(captureResult);
        if (this.isShowPreviewDebugInfo) {
            boolean z = !isDoingAction() && this.mModuleIndex != 166;
            showDebug(captureResult, z);
        }
    }

    public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
    }

    public void onPreviewSizeChanged(int i, int i2) {
    }

    @CallSuper
    public void onResume() {
        Log.d(TAG, "onResume");
        this.mPaused = false;
    }

    public void onSaveInstanceState(Bundle bundle) {
        bundle.putInt(Util.KEY_KILLED_MODULE_INDEX, ModuleManager.getActiveModuleIndex());
    }

    public boolean onScale(float f, float f2, float f3) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onScale(): scale = ");
        sb.append(f3);
        Log.d(str, sb.toString());
        if (isZoomEnabled()) {
            this.mZoomScaled += (f3 - 1.0f) / 4.0f;
            float f4 = this.mMaxZoomRatio * this.mZoomScaled;
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onScale(): delta = ");
            sb2.append(f4);
            Log.d(str2, sb2.toString());
            if (Math.abs(f4) >= 0.01f && onZoomingActionUpdate(this.mZoomRatio + f4, 2)) {
                this.mZoomScaled = 0.0f;
                return true;
            }
        }
        return false;
    }

    public boolean onScaleBegin(float f, float f2) {
        this.mZoomScaled = 0.0f;
        onZoomingActionStart(2);
        return true;
    }

    public void onScaleEnd() {
        Log.d(TAG, "onScaleEnd()");
        onZoomingActionEnd(2);
    }

    public void onSharedPreferenceChanged() {
    }

    public void onSingleTapUp(int i, int i2, boolean z) {
    }

    public void onStop() {
    }

    public void onSurfaceTextureReleased() {
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
    }

    public void onSwitchUltraWide(boolean z) {
        switchCameraLens(z, true);
    }

    public void onUserInteraction() {
    }

    public void onWindowFocusChanged(boolean z) {
        if (z) {
            this.mIgnoreFocusChanged = false;
        }
    }

    public void onZoomRatioChanged(float f, int i) {
        onZoomingActionUpdate(f, i);
    }

    public void onZoomSwitchCamera() {
        if (isAlive() && CameraSettings.isSupportedOpticalZoom() && CameraSettings.isZoomByCameraSwitchingSupported()) {
            this.mActivity.getCameraScreenNail().disableSwitchAnimationOnce();
        }
    }

    /* access modifiers changed from: protected */
    public void onZoomingActionEnd(int i) {
    }

    /* access modifiers changed from: protected */
    public void onZoomingActionStart(int i) {
    }

    /* access modifiers changed from: protected */
    public boolean onZoomingActionUpdate(float f, int i) {
        if (!isDeviceAlive()) {
            return false;
        }
        String simpleName = getClass().getSimpleName();
        StringBuilder sb = new StringBuilder();
        sb.append("onZoomingActionUpdate(): newValue = ");
        sb.append(f);
        sb.append(", minValue = ");
        sb.append(this.mMinZoomRatio);
        sb.append(", maxValue = ");
        sb.append(this.mMaxZoomRatio);
        Log.d(simpleName, sb.toString());
        float f2 = this.mZoomRatio;
        float clamp = HybridZoomingSystem.clamp(f, this.mMinZoomRatio, this.mMaxZoomRatio);
        if (f2 == clamp) {
            return false;
        }
        String simpleName2 = getClass().getSimpleName();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("onZoomingActionUpdate(): changed from ");
        sb2.append(f2);
        sb2.append(" to ");
        sb2.append(clamp);
        Log.d(simpleName2, sb2.toString());
        setZoomRatio(clamp);
        if (onInterceptZoomingEvent(f2, clamp, i)) {
            return false;
        }
        int i2 = (f2 > 1.0f ? 1 : (f2 == 1.0f ? 0 : -1));
        boolean z = i2 <= 0 || clamp <= 1.0f;
        if (z) {
            updatePreferenceTrampoline(11, 30, 34, 42, 20);
            if (this.mUltraCameraCapabilities == null) {
                this.mUltraCameraCapabilities = Camera2DataContainer.getInstance().getCapabilities(Camera2DataContainer.getInstance().getUltraWideCameraId());
            }
            onCapabilityChanged(clamp < 1.0f ? this.mUltraCameraCapabilities : this.mCameraCapabilities);
        }
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            updatePreferenceInWorkThread(24, 46, 47);
        } else {
            updatePreferenceInWorkThread(24);
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null || !dualController.isZoomVisible()) {
            updateStatusBar(2);
        } else {
            dualController.updateZoomRatio(i);
        }
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                if (f2 < 1.0f || clamp >= 1.0f) {
                    if (i2 < 0 && clamp >= 1.0f && bottomPopupTips.containTips(R.string.ultra_wide_open_tip_sat)) {
                        bottomPopupTips.directlyHideTips();
                    }
                } else if ((isCameraSwitchingDuringZoomingAllowed() || this.mActualCameraId == Camera2DataContainer.getInstance().getSATCameraId()) && CameraSettings.shouldShowUltraWideSatTip(this.mModuleIndex)) {
                    bottomPopupTips.showTips(13, R.string.ultra_wide_open_tip_sat, 2);
                }
            }
        }
        return true;
    }

    /* access modifiers changed from: protected */
    public void openCamera() {
    }

    public abstract void openSettingActivity();

    /* access modifiers changed from: protected */
    public void performVolumeKeyClicked(String str, int i, boolean z) {
    }

    /* access modifiers changed from: protected */
    public final void playCameraSound(int i) {
        if (this.mActivity != null && !this.mActivity.isActivityPaused() && !isNeedMute() && CameraSettings.isCameraSoundOpen()) {
            this.mActivity.playCameraSound(i);
        }
    }

    public void preTransferOrientation(int i, int i2) {
        this.mOrientation = i;
        this.mOrientationCompensation = i2;
    }

    public void registerProtocol() {
        Log.d(TAG, "registerProtocol");
        ModeCoordinatorImpl.getInstance().attachProtocol(170, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(200, this);
    }

    public void requestRender() {
    }

    public void resetEvValue() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setExposureCompensation(0);
            this.mCamera2Device.setAWBLock(false);
            CameraSettings.resetExposure();
            updatePreferenceInWorkThread(new int[0]);
        }
    }

    @CallSuper
    public void resetMutexModeManually() {
        this.mMutexModePicker.resetMutexMode();
    }

    public final void restartModule() {
        if (!this.mActivity.isActivityPaused()) {
            this.mActivity.onModeSelected(StartControl.create(this.mModuleIndex).setViewConfigType(3).setNeedReConfigureData(false).setNeedBlurAnimation(true).setNeedReConfigureCamera(true));
        }
    }

    /* access modifiers changed from: protected */
    @CallSuper
    public void restoreBottom() {
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromShutter();
        if (baseDelegate.getActiveFragment(R.id.bottom_action) != 241) {
            baseDelegate.delegateEvent(7);
        }
    }

    /* access modifiers changed from: protected */
    public boolean retryOnceIfCameraError(Handler handler) {
        if (DataRepository.dataItemGlobal().isRetriedIfCameraError() || this.mActivity.isActivityPaused()) {
            return false;
        }
        Log.e(TAG, "onCameraException: retry1");
        DataRepository.dataItemGlobal().setRetriedIfCameraError(true);
        handler.post(new Runnable() {
            public void run() {
                BaseModule.this.mActivity.onModeSelected(StartControl.create(BaseModule.this.mModuleIndex).setViewConfigType(1).setNeedBlurAnimation(false).setNeedReConfigureCamera(true));
            }
        });
        return true;
    }

    /* access modifiers changed from: protected */
    public void sendOpenFailMessage() {
    }

    /* access modifiers changed from: protected */
    public void setAWBMode(String str) {
        if (isDeviceAlive()) {
            if (str.equals("manual")) {
                this.mCamera2Device.setAWBMode(0);
                this.mCamera2Device.setCustomAWB(CameraSettings.getCustomWB());
            } else {
                int parseInt = Util.parseInt(str, 1);
                if (Util.isSupported(parseInt, this.mCameraCapabilities.getSupportedAWBModes())) {
                    this.mCamera2Device.setAWBMode(parseInt);
                } else {
                    this.mCamera2Device.setAWBMode(1);
                }
            }
        }
    }

    public void setActivity(Camera camera) {
        this.mActivity = camera;
    }

    public void setCameraDevice(Camera2Proxy camera2Proxy) {
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            this.mUltraCameraCapabilities = Camera2DataContainer.getInstance().getCapabilities(Camera2DataContainer.getInstance().getUltraWideCameraId());
        }
        this.mCamera2Device = camera2Proxy;
        this.mCameraCapabilities = camera2Proxy.getCapabilities();
        this.mZoomSupported = this.mCameraCapabilities.isZoomSupported();
        this.mActualCameraId = camera2Proxy.getId();
    }

    /* access modifiers changed from: protected */
    public void setCameraState(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setCameraState: ");
        sb.append(i);
        Log.d(str, sb.toString());
        this.mCameraState = i;
    }

    /* access modifiers changed from: protected */
    public void setColorEffect(String str) {
        if (isDeviceAlive()) {
            int parseInt = Util.parseInt(str, 0);
            if (Util.isSupported(parseInt, this.mCameraCapabilities.getSupportedColorEffects())) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("colorEffect: ");
                sb.append(str);
                Log.d(str2, sb.toString());
                this.mCamera2Device.setColorEffect(parseInt);
            }
        }
    }

    public void setDeparted() {
        Log.d(TAG, "setDeparted");
        if (this.mUpdateWorkThreadDisposable != null) {
            this.mUpdateWorkThreadDisposable.dispose();
        }
        if (this.mLensDirtyDetectDisposable != null) {
            this.mLensDirtyDetectDisposable.dispose();
        }
        if (this.mLensDirtyDetectHintDisposable != null) {
            this.mLensDirtyDetectHintDisposable.dispose();
        }
        if (this.mActivity != null) {
            this.mActivity.hideLensDirtyDetectedHint();
        }
        this.mIsDeparted.set(true);
        this.mIsFrameAvailable.set(false);
    }

    public void setDisplayRectAndUIStyle(Rect rect, int i) {
        this.mDisplayRect = rect;
        this.mUIStyle = i;
    }

    /* access modifiers changed from: protected */
    @WorkerThread
    public final void setEvValue() {
        if (isAlive()) {
            if (this.mEvState == 2) {
                this.mCamera2Device.setAWBLock(false);
            } else if (this.mEvState == 1) {
                this.mCamera2Device.setExposureCompensation(this.mEvValue);
                this.mCamera2Device.setAWBLock(true);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void setFlashMode(String str) {
        if (isDeviceAlive()) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("flashMode: ");
            sb.append(str);
            Log.d(str2, sb.toString());
            int parseInt = Util.parseInt(str, 0);
            if ((ThermalDetector.getInstance().thermalConstrained() && DataRepository.dataItemConfig().getComponentFlash().isHardwareSupported()) || (isFrontCamera() && this.mActivity.isScreenSlideOff())) {
                parseInt = 0;
            }
            this.mCamera2Device.setOptimizedFlash(CameraSettings.isOptimizedFlashEnable());
            this.mCamera2Device.setFlashMode(parseInt);
        }
    }

    /* access modifiers changed from: protected */
    public void setFocusMode(String str) {
        if (isDeviceAlive()) {
            int convertToFocusMode = AutoFocus.convertToFocusMode(str);
            if (Util.isSupported(convertToFocusMode, this.mCameraCapabilities.getSupportedFocusModes())) {
                this.mCamera2Device.setFocusMode(convertToFocusMode);
            }
        }
    }

    public void setFrameAvailable(boolean z) {
        this.mIsFrameAvailable.set(z);
    }

    /* access modifiers changed from: protected */
    public void setMaxZoomRatio(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setMaxZoomRatio(): ");
        sb.append(f);
        Log.d(str, sb.toString());
        this.mMaxZoomRatio = f;
    }

    /* access modifiers changed from: protected */
    public void setMinZoomRatio(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setMinZoomRatio(): ");
        sb.append(f);
        Log.d(str, sb.toString());
        this.mMinZoomRatio = f;
    }

    public void setModuleIndex(int i) {
        this.mModuleIndex = i;
    }

    public void setRestoring(boolean z) {
        this.mRestoring = z;
    }

    /* access modifiers changed from: protected */
    public void setTriggerMode(int i) {
        this.mTriggerMode = i;
    }

    /* access modifiers changed from: protected */
    @WorkerThread
    public void setZoomRatio(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setZoomRatio(): ");
        sb.append(f);
        Log.d(str, sb.toString());
        this.mZoomRatio = f;
        CameraSettings.writeZoom(f);
        HybridZoomingSystem.setZoomRatioHistory(this.mModuleIndex, String.valueOf(f));
    }

    public boolean shouldReleaseLater() {
        return false;
    }

    /* access modifiers changed from: 0000 */
    public void trackGeneralInfo(int i, boolean z) {
        CameraStatUtil.trackGeneralInfo(i, z, this.mModuleIndex, getTriggerMode(), isFrontCamera(), this.mMutexModePicker, this.mFlashAutoModeState);
    }

    /* access modifiers changed from: protected */
    public void trackModeCustomInfo(int i) {
    }

    /* access modifiers changed from: 0000 */
    public void trackPictureTaken(int i, boolean z, boolean z2, String str, boolean z3, boolean z4) {
        CameraStatUtil.trackPictureTaken(i, z, this.mModuleIndex, isFrontCamera(), z2, str);
        trackModeCustomInfo(i);
        CameraStatUtil.trackBeautyBodyCapture();
        CameraStatUtil.trackMoonMode(z3, z4);
    }

    public void tryRemoveCountDownMessage() {
    }

    public void unRegisterModulePersistProtocol() {
        Log.d(TAG, "unRegisterModulePersist");
    }

    public void unRegisterProtocol() {
        Log.d(TAG, "unRegisterProtocol");
        ModeCoordinatorImpl.getInstance().detachProtocol(170, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(200, this);
    }

    /* access modifiers changed from: protected */
    public void updateAntiBanding(String str) {
        if (isDeviceAlive()) {
            int parseInt = Util.parseInt(str, 3);
            if (Util.isSupported(parseInt, this.mCameraCapabilities.getSupportedAntiBandingModes())) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("antiBanding: ");
                sb.append(str);
                Log.d(str2, sb.toString());
                this.mCamera2Device.setAntiBanding(parseInt);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void updateCameraScreenNailSize(int i, int i2) {
        String simpleName = getClass().getSimpleName();
        StringBuilder sb = new StringBuilder();
        sb.append("updateCameraScreenNailSize: ");
        sb.append(i);
        sb.append("x");
        sb.append(i2);
        Log.d(simpleName, sb.toString());
        if (!(this.mActivity.getCameraScreenNail().getWidth() == i && this.mActivity.getCameraScreenNail().getHeight() == i2 && !isSquareModeChange())) {
            this.mActivity.getCameraScreenNail().setPreviewSize(i, i2);
        }
        this.mMainProtocol.setPreviewSize(i, i2);
    }

    /* access modifiers changed from: protected */
    public final void updateExposureMeteringMode() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setExposureMeteringMode(CameraSettings.getExposureMeteringMode());
        }
    }

    /* access modifiers changed from: protected */
    public void updateFlashPreference() {
    }

    /* access modifiers changed from: protected */
    public void updateHDRPreference() {
    }

    public void updateLensDirtyDetect(boolean z) {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateLensDirtyDetect: mCamera2Device is null...");
            return;
        }
        boolean isLensDirtyDetectEnabled = CameraSettings.isLensDirtyDetectEnabled();
        if (!isLensDirtyDetectEnabled && this.mLensDirtyDetectDisposable != null) {
            this.mLensDirtyDetectDisposable.dispose();
            this.mLensDirtyDetectDisposable = null;
        }
        this.mCamera2Device.setLensDirtyDetect(isLensDirtyDetectEnabled);
        if (z && isFrameAvailable() && !isDoingAction() && !isRecording()) {
            this.mCamera2Device.resumePreview();
        }
    }

    @WorkerThread
    public final void updatePreferenceInWorkThread(@UpdateType int... iArr) {
        if (this.mUpdateWorkThreadDisposable != null && !this.mUpdateWorkThreadDisposable.isDisposed()) {
            this.mUpdateWorkThreadEmitter.onNext(iArr);
        }
    }

    public final void updatePreferenceTrampoline(@UpdateType int... iArr) {
        consumePreference(iArr);
    }

    public void updatePreviewSurface() {
    }

    public void updateScreenSlide(boolean z) {
        if (z && this.mCamera2Device != null) {
            this.mCamera2Device.setAELock(false);
            updatePreferenceInWorkThread(10, 36);
        }
    }

    /* access modifiers changed from: protected */
    public void updateStatusBar(int i) {
        ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertUpdateValue(i);
    }

    /* access modifiers changed from: protected */
    public void updateTipMessage(int i, @StringRes int i2, int i3) {
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            bottomPopupTips.showTips(i, i2, i3);
        }
    }

    /* access modifiers changed from: protected */
    public void updateZoomRatioToggleButtonState(boolean z) {
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.setRecordingOrPausing(z);
            if (z) {
                dualController.hideZoomButton();
            } else {
                dualController.showZoomButton();
                dualController.setImmersiveModeEnabled(false);
            }
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert == null) {
            return;
        }
        if (z) {
            topAlert.alertUpdateValue(2);
        } else {
            topAlert.clearAlertStatus();
        }
    }
}
