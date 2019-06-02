package com.android.camera.module;

import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.support.annotation.MainThread;
import android.telephony.PhoneStateListener;
import android.telephony.TelephonyManager;
import android.util.Range;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import android.widget.Toast;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.RotateDialogController;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Util;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.fragment.CtaNoticeFragment;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.fragment.beauty.LiveBeautyFilterFragment.LiveFilterItem;
import com.android.camera.fragment.mimoji.FragmentMimoji;
import com.android.camera.log.Log;
import com.android.camera.module.impl.component.MimojiAvatarEngineImpl;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.FunctionParseAsdScene;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.LiveConfigChanges;
import com.android.camera.protocol.ModeProtocol.LiveVideoEditor;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.storage.Storage;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CameraHardwareFace;
import com.mi.config.b;
import com.ss.android.medialib.TTRecorder.SlamDetectListener;
import com.ss.android.ttve.oauth.TEOAuthResult;
import com.xiaomi.camera.core.ParallelTaskData;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class LiveModule extends BaseModule implements Listener, CameraAction, CameraPreviewCallback, FaceDetectionCallback, FocusCallback, PictureCallback {
    private static final int BEAUTY_SWITCH = 8;
    private static final int FILTER_SWITCH = 2;
    private static final int FRAME_RATE = 30;
    private static final int STICKER_SWITCH = 4;
    /* access modifiers changed from: private */
    public static final String TAG = LiveModule.class.getSimpleName();
    private boolean m3ALocked;
    private String mBaseFileName;
    protected BeautyValues mBeautyValues;
    private CtaNoticeFragment mCtaNoticeFragment;
    private AlertDialog mDialog;
    private boolean mDisableSingleTapUp = false;
    protected boolean mFaceDetectionEnabled;
    protected boolean mFaceDetectionStarted;
    /* access modifiers changed from: private */
    public FocusManager2 mFocusManager;
    private boolean mIsLowLight;
    private boolean mIsPreviewing = false;
    /* access modifiers changed from: private */
    public LiveConfigChanges mLiveConfigChanges;
    private LiveVideoEditor mLiveVideoEditor;
    private int mMessageId;
    private Disposable mMetaDataDisposable;
    /* access modifiers changed from: private */
    public FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    private MimojiAvatarEngineImpl mMimojiAvatarEngine;
    protected int mModuleIndex;
    private int mOldOriginVolumeStream;
    /* access modifiers changed from: private */
    public long mOnResumeTime;
    private boolean mOpenFlash = false;
    protected final PhoneStateListener mPhoneStateListener = new PhoneStateListener() {
        public void onCallStateChanged(int i, String str) {
            if (i == 2 && LiveModule.this.isRecording()) {
                Log.w(LiveModule.TAG, "CALL_STATE_OFFHOOK");
                LiveModule.this.onStop();
            }
            super.onCallStateChanged(i, str);
        }
    };
    private int mQuality = 5;
    private boolean mSaved;
    protected SensorStateListener mSensorStateListener = new SensorStateListener() {
        public boolean isWorking() {
            return LiveModule.this.isAlive() && LiveModule.this.getCameraState() != 0;
        }

        public void notifyDevicePostureChanged() {
            LiveModule.this.mActivity.getEdgeShutterView().onDevicePostureChanged();
        }

        public void onDeviceBecomeStable() {
            Log.v(LiveModule.TAG, "onDeviceBecomeStable");
        }

        public void onDeviceBeginMoving() {
        }

        public void onDeviceKeepMoving(double d) {
            if (!LiveModule.this.mMainProtocol.isEvAdjusted(true) && !LiveModule.this.mPaused && Util.isTimeout(System.currentTimeMillis(), LiveModule.this.mTouchFocusStartingTime, 3000) && !LiveModule.this.is3ALocked() && LiveModule.this.mFocusManager != null && LiveModule.this.mFocusManager.isNeedCancelAutoFocus() && !LiveModule.this.isRecording()) {
                LiveModule.this.mFocusManager.onDeviceKeepMoving(d);
            }
        }

        public void onDeviceKeepStable() {
        }

        public void onDeviceLieChanged(boolean z) {
        }

        public void onDeviceOrientationChanged(float f, boolean z) {
        }

        public void onDeviceRotationChanged(float[] fArr) {
            if (LiveModule.this.mLiveConfigChanges != null) {
                LiveModule.this.mLiveConfigChanges.onDeviceRotationChange(fArr);
            }
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            if (LiveModule.this.mLiveConfigChanges != null) {
                LiveModule.this.mLiveConfigChanges.onSensorChanged(sensorEvent);
            }
        }
    };
    protected boolean mShowFace = false;
    protected TelephonyManager mTelephonyManager;
    private int mTitleId;
    /* access modifiers changed from: private */
    public long mTouchFocusStartingTime;
    private boolean misFaceLocationOk;

    private class LiveAsdConsumer implements Consumer<Integer> {
        private LiveAsdConsumer() {
        }

        public void accept(Integer num) throws Exception {
            LiveModule.this.mimojiLightDetect(num);
        }
    }

    private class MainHandler extends Handler {
        public MainHandler(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message message) {
            int i = message.what;
            if (i == 2) {
                LiveModule.this.getWindow().clearFlags(128);
            } else if (i == 4) {
                LiveModule.this.checkActivityOrientation();
                if (SystemClock.uptimeMillis() - LiveModule.this.mOnResumeTime < 5000) {
                    LiveModule.this.mHandler.sendEmptyMessageDelayed(4, 100);
                }
            } else if (i == 9) {
                LiveModule.this.mMainProtocol.initializeFocusView(LiveModule.this);
            } else if (i == 17) {
                LiveModule.this.mHandler.removeMessages(17);
                LiveModule.this.mHandler.removeMessages(2);
                LiveModule.this.getWindow().addFlags(128);
                LiveModule.this.mHandler.sendEmptyMessageDelayed(2, (long) LiveModule.this.getScreenDelay());
            } else if (i != 31) {
                boolean z = true;
                if (i == 35) {
                    LiveModule liveModule = LiveModule.this;
                    boolean z2 = message.arg1 > 0;
                    if (message.arg2 <= 0) {
                        z = false;
                    }
                    liveModule.handleUpdateFaceView(z2, z);
                } else if (i == 51 && !LiveModule.this.mActivity.isActivityPaused()) {
                    LiveModule.this.mOpenCameraFail = true;
                    LiveModule.this.onCameraException();
                }
            } else {
                LiveModule.this.setOrientationParameter();
            }
        }
    }

    private String createName(long j, int i) {
        if (i > 0) {
            return this.mBaseFileName;
        }
        this.mBaseFileName = new SimpleDateFormat(getString(R.string.video_file_name_format), Locale.ENGLISH).format(new Date(j));
        return this.mBaseFileName;
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null && this.mActivity.isActivityPaused()) {
            this.mActivity.pause();
            this.mActivity.releaseAll(true, true);
        }
    }

    private ContentValues genContentValues(int i, int i2, boolean z) {
        String str;
        String createName = createName(System.currentTimeMillis(), i2);
        if (i2 > 0) {
            String format = String.format(Locale.ENGLISH, "_%d", new Object[]{Integer.valueOf(i2)});
            StringBuilder sb = new StringBuilder();
            sb.append(createName);
            sb.append(format);
            createName = sb.toString();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(createName);
        sb2.append(Util.convertOutputFormatToFileExt(i));
        String sb3 = sb2.toString();
        String convertOutputFormatToMimeType = Util.convertOutputFormatToMimeType(i);
        if (z) {
            StringBuilder sb4 = new StringBuilder();
            sb4.append(Storage.CAMERA_TEMP_DIRECTORY);
            sb4.append('/');
            sb4.append(sb3);
            str = sb4.toString();
            StringBuilder sb5 = new StringBuilder();
            sb5.append(Storage.CAMERA_TEMP_DIRECTORY);
            sb5.append(File.separator);
            sb5.append(Storage.AVOID_SCAN_FILE_NAME);
            Util.createFile(new File(sb5.toString()));
        } else {
            StringBuilder sb6 = new StringBuilder();
            sb6.append(Storage.DIRECTORY);
            sb6.append('/');
            sb6.append(sb3);
            str = sb6.toString();
        }
        String str2 = TAG;
        StringBuilder sb7 = new StringBuilder();
        sb7.append("genContentValues: path=");
        sb7.append(str);
        Log.v(str2, sb7.toString());
        ContentValues contentValues = new ContentValues(8);
        contentValues.put("title", createName);
        contentValues.put("_display_name", sb3);
        contentValues.put("mime_type", convertOutputFormatToMimeType);
        contentValues.put("_data", str);
        StringBuilder sb8 = new StringBuilder();
        sb8.append(Integer.toString(this.mPreviewSize.width));
        sb8.append("x");
        sb8.append(Integer.toString(this.mPreviewSize.height));
        contentValues.put("resolution", sb8.toString());
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (!(currentLocation == null || (currentLocation.getLatitude() == 0.0d && currentLocation.getLongitude() == 0.0d))) {
            contentValues.put("latitude", Double.valueOf(currentLocation.getLatitude()));
            contentValues.put("longitude", Double.valueOf(currentLocation.getLongitude()));
        }
        return contentValues;
    }

    /* access modifiers changed from: private */
    public void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if (this.mFaceDetectionStarted && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    private TEOAuthResult initLiveConfig() {
        this.mLiveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
        this.mLiveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
        if (this.mLiveConfigChanges == null) {
            getActivity().getImplFactory().initModulePersistent(getActivity(), 201, 209);
            this.mLiveConfigChanges = (LiveConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(201);
            this.mLiveVideoEditor = (LiveVideoEditor) ModeCoordinatorImpl.getInstance().getAttachProtocol(209);
            this.mLiveConfigChanges.initResource();
        }
        return this.mLiveConfigChanges.getAuthResult();
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                LiveModule.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).map(new FunctionParseAsdFace(this, isFrontCamera())).map(new FunctionParseAsdScene(this)).subscribe((Consumer<? super T>) new LiveAsdConsumer<Object>());
    }

    private void initMimoji() {
        if (this.mModuleIndex == 177) {
            this.mMimojiAvatarEngine.initAvatarEngine(this.mCameraDisplayOrientation, isFrontCamera() ? 270 : 90, this.mPreviewSize.width, this.mPreviewSize.height, isFrontCamera());
            this.mCamera2Device.startPreviewCallback(this.mMimojiAvatarEngine);
        }
    }

    private void initMimojiEngine() {
        this.mMimojiAvatarEngine = (MimojiAvatarEngineImpl) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        if (this.mMimojiAvatarEngine == null) {
            getActivity().getImplFactory().initModulePersistent(getActivity(), 217);
            this.mMimojiAvatarEngine = (MimojiAvatarEngineImpl) ModeCoordinatorImpl.getInstance().getAttachProtocol(217);
        }
    }

    private void initializeFocusManager() {
        this.mFocusManager = new FocusManager2(this.mCameraCapabilities, this, isFrontCamera(), this.mActivity.getMainLooper());
        Rect renderRect = this.mActivity.getCameraScreenNail() != null ? this.mActivity.getCameraScreenNail().getRenderRect() : null;
        if (renderRect == null || renderRect.width() <= 0) {
            this.mFocusManager.setRenderSize(Util.sWindowWidth, Util.sWindowHeight);
            this.mFocusManager.setPreviewSize(Util.sWindowWidth, Util.sWindowHeight);
            return;
        }
        this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
        this.mFocusManager.setPreviewSize(renderRect.width(), renderRect.height());
    }

    private boolean isEisOn() {
        return isBackCamera() && CameraSettings.isMovieSolidOn();
    }

    static /* synthetic */ void lambda$onDestroy$0() {
        MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
        if (mainContentProtocol != null) {
            mainContentProtocol.setCenterHint(8, null, null, 0);
        }
    }

    /* access modifiers changed from: private */
    public void mimojiLightDetect(Integer num) {
        if (this.mMimojiAvatarEngine != null && this.mMimojiAvatarEngine.isOnCreateMimoji()) {
            if (!this.misFaceLocationOk) {
                if (this.mMainProtocol != null) {
                    this.mMainProtocol.updateMimojiFaceDetectResultTip(false);
                }
                return;
            }
            if (this.mMainProtocol != null) {
                this.mMainProtocol.setMimojiDetectTipType(162);
            }
            if (num.intValue() != 9) {
                this.mIsLowLight = false;
                if (this.mMainProtocol != null) {
                    this.mMainProtocol.updateMimojiFaceDetectResultTip(false);
                }
            } else {
                this.mIsLowLight = true;
                if (this.mMainProtocol != null) {
                    this.mMainProtocol.updateMimojiFaceDetectResultTip(true);
                }
            }
        }
    }

    private void onMimojiCapture() {
        this.mCamera2Device.setShotType(-1);
        this.mCamera2Device.takePicture(this, null);
    }

    private void previewWhenSessionSuccess() {
        setCameraState(1);
        updatePreferenceInWorkThread(UpdateConstant.FUN_TYPES_ON_PREVIEW_SUCCESS);
    }

    private void setOrientation(int i, int i2) {
        if (i != -1) {
            this.mOrientation = i;
            checkActivityOrientation();
            if (this.mOrientationCompensation != i2) {
                this.mOrientationCompensation = i2;
                setOrientationParameter();
            }
        }
    }

    /* access modifiers changed from: private */
    public void setOrientationParameter() {
        if (!(isDeparted() || this.mCamera2Device == null || this.mOrientation == -1)) {
            if (getCameraState() == 1) {
                updatePreferenceInWorkThread(35);
            } else {
                this.mCamera2Device.setDeviceOrientation(this.mOrientation);
            }
        }
    }

    private boolean shouldApplyUltraWideLDC() {
        if (CameraSettings.shouldUltraWideVideoLDCBeVisibleInMode(this.mModuleIndex) && this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isUltraWideVideoLDCEnabled();
        }
        return false;
    }

    private void showAuthError() {
        this.mHandler.post(new Runnable() {
            public void run() {
                Builder builder = new Builder(LiveModule.this.mActivity);
                builder.setTitle(R.string.live_error_title);
                builder.setMessage(R.string.live_error_message);
                builder.setCancelable(false);
                builder.setPositiveButton(R.string.live_error_confirm, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                        LiveModule.this.mActivity.startActivity(new Intent("android.settings.DATE_SETTINGS"));
                    }
                });
                builder.setNegativeButton(R.string.snap_cancel, new OnClickListener() {
                    public void onClick(DialogInterface dialogInterface, int i) {
                    }
                });
                builder.show();
            }
        });
    }

    private void showPreview() {
        pausePreview();
        this.mSaved = false;
        ((FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196)).startLiveRecordPreview(genContentValues(2, 0, false));
        this.mIsPreviewing = true;
    }

    private void startScreenLight(final int i, final int i2) {
        if (!this.mPaused) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (LiveModule.this.mActivity != null) {
                        LiveModule.this.mActivity.setWindowBrightness(i2);
                    }
                    FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                    if (fullScreenProtocol != null) {
                        fullScreenProtocol.setScreenLightColor(i);
                        fullScreenProtocol.showScreenLight();
                    }
                }
            });
        }
    }

    @MainThread
    private void startVideoRecording() {
        keepScreenOn();
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        recordState.onPrepare();
        if (this.mLiveConfigChanges != null) {
            this.mLiveConfigChanges.onRecordStart();
            DataRepository.dataItemLive().setLiveStartOrientation(this.mOrientation);
            CameraStatUtil.trackLiveClick(CameraStat.PARAM_LIVE_CLICK_START);
            trackLiveRecordingParams();
            this.mOldOriginVolumeStream = getActivity().getVolumeControlStream();
            getActivity().setVolumeControlStream(3);
        }
        recordState.onStart();
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT && isBackCamera()) {
            updateZoomRatioToggleButtonState(true);
            if (isUltraWideBackCamera()) {
                setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                setMaxZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR * this.mCameraCapabilities.getMaxZoomRatio());
            } else {
                setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE);
                setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
            }
        }
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        if (this.mMimojiAvatarEngine != null) {
            this.mMimojiAvatarEngine.onRecordStart(genContentValues(2, 0, false));
        }
        trackGeneralInfo(1, false);
    }

    private void stopScreenLight() {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (LiveModule.this.mActivity != null) {
                    LiveModule.this.mActivity.restoreWindowBrightness();
                }
                FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                String access$300 = LiveModule.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("stopScreenLight: protocol = ");
                sb.append(fullScreenProtocol);
                sb.append(", mHandler = ");
                sb.append(LiveModule.this.mHandler);
                Log.d(access$300, sb.toString());
                if (fullScreenProtocol != null) {
                    fullScreenProtocol.hideScreenLight();
                }
            }
        });
    }

    private void trackLiveRecordingParams() {
        boolean z;
        boolean z2;
        int i;
        boolean z3;
        int liveAllSwitchAllValue = CameraSettings.getLiveAllSwitchAllValue();
        String str = CameraSettings.getCurrentLiveMusic()[1];
        boolean z4 = !str.isEmpty();
        LiveFilterItem findLiveFilter = EffectController.getInstance().findLiveFilter(CameraAppImpl.getAndroidContext(), DataRepository.dataItemLive().getLiveFilter());
        if (!findLiveFilter.directoryName.isEmpty()) {
            if ((liveAllSwitchAllValue & 2) == 0) {
                liveAllSwitchAllValue += 2;
            }
            z = true;
        } else {
            z = false;
        }
        String currentLiveStickerName = CameraSettings.getCurrentLiveStickerName();
        if (!currentLiveStickerName.isEmpty()) {
            if ((liveAllSwitchAllValue & 4) == 0) {
                liveAllSwitchAllValue += 4;
            }
            z2 = true;
        } else {
            z2 = false;
        }
        String currentLiveSpeedText = CameraSettings.getCurrentLiveSpeedText();
        int faceBeautyRatio = CameraSettings.getFaceBeautyRatio("key_live_shrink_face_ratio");
        int faceBeautyRatio2 = CameraSettings.getFaceBeautyRatio("key_live_enlarge_eye_ratio");
        int faceBeautyRatio3 = CameraSettings.getFaceBeautyRatio("key_live_smooth_strength");
        if (faceBeautyRatio > 0 || faceBeautyRatio2 > 0 || faceBeautyRatio3 > 0) {
            if ((i & 8) == 0) {
                i += 8;
            }
            z3 = true;
        } else {
            z3 = false;
        }
        CameraStatUtil.trackLiveRecordingParams(z4, str, z, findLiveFilter.directoryName, z2, currentLiveStickerName, currentLiveSpeedText, z3, faceBeautyRatio, faceBeautyRatio2, faceBeautyRatio3, this.mQuality, isFrontCamera());
        CameraSettings.setLiveAllSwitchAddValue(i);
    }

    private void trackLiveVideoParams() {
        int segments = this.mLiveConfigChanges.getSegments();
        float totalRecordingTime = (float) this.mLiveConfigChanges.getTotalRecordingTime();
        int liveAllSwitchAllValue = CameraSettings.getLiveAllSwitchAllValue();
        boolean z = true;
        boolean z2 = (liveAllSwitchAllValue & 2) != 0;
        boolean z3 = (liveAllSwitchAllValue & 4) != 0;
        if ((liveAllSwitchAllValue & 8) == 0) {
            z = false;
        }
        CameraSettings.setLiveAllSwitchAddValue(0);
        CameraStatUtil.trackLiveVideoParams(segments, totalRecordingTime / 1000.0f, z2, z3, z);
        CameraStatUtil.trackUltraWideFunTaken();
    }

    private void updateBeauty() {
        if (this.mModuleIndex != 174) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            CameraSettings.initBeautyValues(this.mBeautyValues, this.mModuleIndex);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("updateBeauty(): ");
            sb.append(this.mBeautyValues);
            Log.d(str, sb.toString());
            this.mCamera2Device.setBeautyValues(this.mBeautyValues);
            return;
        }
        float faceBeautyRatio = ((float) CameraSettings.getFaceBeautyRatio("key_live_shrink_face_ratio")) / 100.0f;
        float faceBeautyRatio2 = ((float) CameraSettings.getFaceBeautyRatio("key_live_enlarge_eye_ratio")) / 100.0f;
        float faceBeautyRatio3 = ((float) CameraSettings.getFaceBeautyRatio("key_live_smooth_strength")) / 100.0f;
        if (faceBeautyRatio > 0.0f || faceBeautyRatio2 > 0.0f || faceBeautyRatio3 > 0.0f) {
            CameraSettings.setLiveBeautyStatus(true);
            if (this.mLiveConfigChanges != null) {
                this.mLiveConfigChanges.setBeautyFaceReshape(true, faceBeautyRatio2, faceBeautyRatio);
                this.mLiveConfigChanges.setBeautify(true, faceBeautyRatio3);
            }
        } else {
            CameraSettings.setLiveBeautyStatus(false);
            if (this.mLiveConfigChanges != null) {
                this.mLiveConfigChanges.setBeautyFaceReshape(false, faceBeautyRatio2, faceBeautyRatio);
                this.mLiveConfigChanges.setBeautify(false, faceBeautyRatio3);
            }
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("shrinkFaceRatio->");
        sb2.append(faceBeautyRatio);
        sb2.append(",enlargEyeRatio->");
        sb2.append(faceBeautyRatio2);
        sb2.append(",smoothStrengthRatio->");
        sb2.append(faceBeautyRatio3);
        Log.d(str2, sb2.toString());
    }

    private void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    private void updateFaceView(boolean z, boolean z2) {
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        this.mHandler.obtainMessage(35, z ? 1 : 0, z2 ? 1 : 0).sendToTarget();
    }

    private void updateFilter() {
        int shaderEffect = CameraSettings.getShaderEffect();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("updateFilter: 0x");
        sb.append(Integer.toHexString(shaderEffect));
        Log.v(str, sb.toString());
        EffectController.getInstance().setEffect(shaderEffect);
    }

    private void updateFocusMode() {
        setFocusMode(this.mFocusManager.setFocusMode(CameraSettings.getFocusMode()));
    }

    private void updateFpsRange() {
        this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
    }

    private void updatePictureAndPreviewSize() {
        List supportedOutputSize = this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class);
        CameraSize optimalPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, supportedOutputSize, (double) (this.mModuleIndex == 177 ? Util.getRatio(CameraSettings.getPictureSizeRatioString()) : 1.77f));
        this.mPreviewSize = optimalPreviewSize;
        this.mPictureSize = this.mPreviewSize;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("previewSize: ");
        sb.append(this.mPreviewSize.toString());
        Log.d(str, sb.toString());
        CameraSize optimalVideoSnapshotPictureSize = Util.getOptimalVideoSnapshotPictureSize(supportedOutputSize, (double) CameraSettings.getPreviewAspectRatio(16, 9), Util.sWindowHeight, Util.sWindowWidth);
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("displaySize: ");
        sb2.append(optimalVideoSnapshotPictureSize.toString());
        Log.d(str2, sb2.toString());
        if (this.mModuleIndex == 177) {
            this.mCamera2Device.setAlgorithmPreviewSize(optimalPreviewSize);
            this.mCamera2Device.setAlgorithmPreviewFormat(35);
            optimalVideoSnapshotPictureSize = optimalPreviewSize;
        }
        updateCameraScreenNailSize(optimalVideoSnapshotPictureSize.width, optimalVideoSnapshotPictureSize.height);
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private void updateVideoStabilization() {
        if (isDeviceAlive()) {
            if (isEisOn()) {
                Log.d(TAG, "videoStabilization: EIS");
                this.mCamera2Device.setEnableEIS(true);
                this.mCamera2Device.setEnableOIS(false);
                if (!this.mCameraCapabilities.isEISPreviewSupported()) {
                    this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(true);
                }
            } else {
                Log.d(TAG, "videoStabilization: OIS");
                this.mCamera2Device.setEnableEIS(false);
                this.mCamera2Device.setEnableOIS(true);
                this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
            }
        }
    }

    public void cancelFocus(boolean z) {
        if (isAlive() && isFrameAvailable() && getCameraState() != 0) {
            if (this.mCamera2Device != null) {
                if (z) {
                    this.mCamera2Device.setFocusMode(4);
                }
                this.mCamera2Device.cancelFocus(this.mModuleIndex);
            }
            if (getCameraState() != 3) {
                setCameraState(1);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean checkCallingState() {
        if (2 != this.mTelephonyManager.getCallState()) {
            return true;
        }
        showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_calling_alert);
        return false;
    }

    public void checkDisplayOrientation() {
        if (isCreated()) {
            super.checkDisplayOrientation();
            if (this.mMainProtocol != null) {
                this.mMainProtocol.setCameraDisplayOrientation(this.mCameraDisplayOrientation);
            }
            if (this.mFocusManager != null) {
                this.mFocusManager.setDisplayOrientation(this.mCameraDisplayOrientation);
            }
        }
    }

    public void closeCamera() {
        if (this.mMetaDataFlowableEmitter != null) {
            this.mMetaDataFlowableEmitter.onComplete();
        }
        if (this.mMetaDataDisposable != null) {
            this.mMetaDataDisposable.dispose();
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.releaseCameraPreviewCallback(null);
            this.mCamera2Device.setFocusCallback(null);
            this.mCamera2Device.setErrorCallback(null);
            if (this.mModuleIndex == 177) {
                this.mCamera2Device.stopPreviewCallback(true);
            }
            this.mCamera2Device = null;
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
            this.mFocusManager.destroy();
        }
        if (this.mActivity != null) {
            this.mActivity.getCameraScreenNail().setExternalFrameProcessor(null);
        }
    }

    /* access modifiers changed from: protected */
    public void consumePreference(int... iArr) {
        for (int i : iArr) {
            switch (i) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 2:
                    updateFilter();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 5:
                    updateFace();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                case 20:
                case 30:
                case 34:
                case 42:
                case 43:
                case 46:
                case 50:
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    break;
                case 14:
                    updateFocusMode();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case 24:
                    applyZoomRatio();
                    break;
                case 25:
                    focusCenter();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 31:
                    updateVideoStabilization();
                    break;
                case 35:
                    updateDeviceOrientation();
                    break;
                case 47:
                    updateUltraWideLDC();
                    break;
                case 54:
                    initMimoji();
                    break;
                case 55:
                    updateModuleRelated();
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("no consumer for this updateType: ");
                    sb.append(i);
                    throw new RuntimeException(sb.toString());
            }
        }
    }

    public void doReverse() {
        if (this.mLiveConfigChanges != null && !this.mLiveConfigChanges.isRecording()) {
            this.mLiveConfigChanges.onRecordReverse();
            if (!this.mLiveConfigChanges.hasSegments()) {
                stopVideoRecording(true, false);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean enableFaceDetection() {
        return DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default));
    }

    /* access modifiers changed from: protected */
    public int getOperatingMode() {
        int i = isEisOn() ? 32772 : DataRepository.dataItemFeature().fp() ? CameraCapabilities.SESSION_OPERATION_MODE_MCTF : 0;
        return this.mModuleIndex == 177 ? CameraCapabilities.SESSION_OPERATION_MODE_MIMOJI : i;
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
    }

    /* access modifiers changed from: protected */
    public boolean is3ALocked() {
        return this.m3ALocked;
    }

    /* access modifiers changed from: protected */
    public boolean isAEAFLockSupported() {
        return true;
    }

    /* access modifiers changed from: protected */
    public boolean isCameraSwitchingDuringZoomingAllowed() {
        return HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mModuleIndex == 174 && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && isBackCamera() && this.mLiveConfigChanges != null && !this.mLiveConfigChanges.isRecording() && !this.mLiveConfigChanges.isRecordingPaused();
    }

    public boolean isDoingAction() {
        FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        return isRecording() || getCameraState() == 3 || (fullScreenProtocol != null && fullScreenProtocol.isLiveRecordPreviewShown()) || this.mOpenFlash;
    }

    public boolean isFaceDetectStarted() {
        return this.mFaceDetectionStarted;
    }

    public boolean isNeedMute() {
        return isRecording();
    }

    public boolean isRecording() {
        return (this.mLiveConfigChanges != null && (this.mLiveConfigChanges.isRecording() || this.mLiveConfigChanges.isRecordingPaused())) || (this.mMimojiAvatarEngine != null && this.mMimojiAvatarEngine.isRecording());
    }

    public boolean isSelectingCapturedResult() {
        FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
        return fullScreenProtocol != null && fullScreenProtocol.isLiveRecordPreviewShown();
    }

    public boolean isShowCaptureButton() {
        return isSupportFocusShoot();
    }

    public boolean isSupportFocusShoot() {
        if (this.mModuleIndex == 177) {
            return DataRepository.dataItemGlobal().isGlobalSwitchOn("pref_camera_focus_shoot_key");
        }
        return false;
    }

    public boolean isUnInterruptable() {
        return false;
    }

    public boolean isUseFaceInfo() {
        return false;
    }

    /* access modifiers changed from: protected */
    public boolean isZoomEnabled() {
        boolean z = true;
        if (getCameraState() == 3 || isFrontCamera() || this.mCamera2Device == null || this.mCamera2Device.isCaptureBusy(true) || DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiCreate()) {
            z = false;
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (!z || dualController == null || !dualController.isZoomVisible() || !dualController.isSlideVisible()) {
            return z;
        }
        return false;
    }

    /* access modifiers changed from: protected */
    public void keepScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(52);
        getWindow().addFlags(128);
    }

    /* access modifiers changed from: protected */
    public void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    /* access modifiers changed from: protected */
    public void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(true);
        }
        this.mFocusManager.setAeAwbLock(true);
        this.m3ALocked = true;
    }

    public boolean multiCapture() {
        return false;
    }

    public void notifyError() {
        if (currentIsMainThread() && isRecording()) {
            stopVideoRecording(true, true);
        }
        super.notifyError();
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public boolean onBackPressed() {
        if (this.mMimojiAvatarEngine != null && DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiCreate()) {
            ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onMimojiCreateBack();
            CameraStatUtil.trackMimojiClick(CameraStat.PARAM_MIMOJI_CLICK_CREATE_SOFT_BACK);
            return true;
        } else if (!isFrameAvailable() || this.mLiveConfigChanges == null) {
            return false;
        } else {
            if (this.mModuleIndex == 177) {
                if (isRecording()) {
                    stopVideoRecording(true, true);
                }
                return true;
            } else if (!this.mLiveConfigChanges.isRecording() && !this.mLiveConfigChanges.isRecordingPaused()) {
                return super.onBackPressed();
            } else {
                long currentTimeMillis = System.currentTimeMillis();
                if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                    this.mLastBackPressedTime = currentTimeMillis;
                    Toast.makeText(this.mActivity, getString(R.string.record_back_pressed_hint), 0).show();
                } else {
                    stopVideoRecording(true, false);
                }
                return true;
            }
        }
    }

    public void onBeautyParameterChanged() {
        updatePreferenceTrampoline(13);
    }

    /* access modifiers changed from: protected */
    public void onCameraOpened() {
        super.onCameraOpened();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.FUN_TYPES_INIT);
        if (this.mModuleIndex == 174) {
            switch (initLiveConfig()) {
                case FAIL:
                case EXPIRED:
                case NOT_MATCH:
                    showAuthError();
                    return;
            }
        } else if (this.mModuleIndex == 177) {
            initMimojiEngine();
        }
        startPreview();
        if (DataRepository.dataItemGlobal().isFirstShowCTAConCollect() && this.mModuleIndex == 174) {
            this.mCtaNoticeFragment = CtaNoticeFragment.showCta(getActivity().getFragmentManager(), false, null);
        }
        this.mOnResumeTime = SystemClock.uptimeMillis();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
        initMetaParser();
    }

    public void onCaptureShutter() {
        this.mActivity.getCameraScreenNail().animateCapture(this.mOrientation);
        this.mActivity.playCameraSound(0);
        this.mMimojiAvatarEngine.onCaptureImage();
    }

    public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize, boolean z) {
        return null;
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        this.mModuleIndex = i;
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mHandler = new MainHandler(this.mActivity.getMainLooper());
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        onCameraOpened();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
        this.mActivity.getSensorStateManager().setRotationVectorEnabled(true);
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mCtaNoticeFragment != null) {
            this.mCtaNoticeFragment.dismiss();
        }
        this.mHandler.post($$Lambda$LiveModule$QVMtqWYbz8yPiLYvpxAglWLwg.INSTANCE);
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessage(45);
        }
        this.mActivity.getSensorStateManager().setRotationVectorEnabled(false);
        this.mActivity.getSensorStateManager().setTTARSensorEnabled(false);
    }

    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        if (isCreated() && cameraHardwareFaceArr != null) {
            if (!b.hm() || cameraHardwareFaceArr.length <= 0 || cameraHardwareFaceArr[0].faceType != 64206) {
                if (!this.mMainProtocol.setFaces(1, cameraHardwareFaceArr, getActiveArraySize(), getDeviceBasedZoomRatio())) {
                    return;
                }
            } else if (this.mObjectTrackingStarted) {
                this.mMainProtocol.setFaces(3, cameraHardwareFaceArr, getActiveArraySize(), getDeviceBasedZoomRatio());
            }
            if (this.mMimojiAvatarEngine != null && this.mMimojiAvatarEngine.isOnCreateMimoji()) {
                this.mMainProtocol.lightingDetectFace(cameraHardwareFaceArr, true);
                this.misFaceLocationOk = this.mMainProtocol.isFaceLocationOK();
            }
        }
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isCreated() && !isDeparted()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    Log.v(TAG, String.format(Locale.ENGLISH, "FocusTime=%1$dms focused=%2$b", new Object[]{Long.valueOf(focusTask.getElapsedTime()), Boolean.valueOf(focusTask.isSuccess())}));
                    if (!this.mFocusManager.isFocusingSnapOnFinish() && getCameraState() != 3) {
                        setCameraState(1);
                    }
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    if (focusTask.isSuccess() && this.m3ALocked) {
                        this.mCamera2Device.lockExposure(true);
                        break;
                    }
                case 2:
                case 3:
                    String str = null;
                    if (focusTask.isFocusing()) {
                        str = "onAutoFocusMoving start";
                    }
                    if (Util.sIsDumpLog && str != null) {
                        Log.v(TAG, str);
                    }
                    if ((getCameraState() != 3 || focusTask.getFocusTrigger() == 3) && !this.m3ALocked) {
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
            }
        }
    }

    public void onHostStopAndNotifyActionStop() {
        onPauseButtonClick();
        doLaterReleaseIfNeed();
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mPaused) {
            return true;
        }
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        switch (i) {
            case 24:
            case 25:
            case 87:
            case 88:
                if (!this.mIsPreviewing) {
                    if (i == 24 || i == 88) {
                        z = true;
                    }
                    if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                        return true;
                    }
                }
                break;
            case 27:
            case 66:
                if (keyEvent.getRepeatCount() == 0) {
                    if (this.mIsPreviewing) {
                        ((FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196)).startLiveRecordSaving();
                    } else {
                        restoreBottom();
                        if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                            onShutterButtonClick(40);
                        } else if (CameraSettings.isFingerprintCaptureEnable()) {
                            onShutterButtonClick(30);
                        }
                    }
                    return true;
                }
                break;
            case Util.KEYCODE_SLIDE_ON /*700*/:
                if (isRecording() && !isPostProcessing()) {
                    if (isBackCamera()) {
                        stopVideoRecording(true, false);
                        break;
                    } else {
                        return false;
                    }
                }
            case Util.KEYCODE_SLIDE_OFF /*701*/:
                if (isRecording() && !isPostProcessing()) {
                    if (isFrontCamera()) {
                        stopVideoRecording(true, false);
                        break;
                    } else {
                        return false;
                    }
                }
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (i != 4) {
            if (i == 27 || i == 66) {
                return true;
            }
        } else if (((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public void onMimojiCreateCompleted(boolean z) {
        setCameraState(1);
    }

    public void onNewUriArrived(final Uri uri, final String str) {
        super.onNewUriArrived(uri, str);
        if (isAlive()) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                    if (fullScreenProtocol != null) {
                        ContentValues saveContentValues = fullScreenProtocol.getSaveContentValues();
                        if (saveContentValues != null) {
                            String asString = saveContentValues.getAsString("title");
                            String access$300 = LiveModule.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("newUri: ");
                            sb.append(str);
                            sb.append(" | ");
                            sb.append(asString);
                            Log.d(access$300, sb.toString());
                            if (asString.equals(str)) {
                                fullScreenProtocol.onLiveSaveToLocalFinished(uri);
                            }
                        }
                    }
                }
            });
        }
    }

    public void onOrientationChanged(int i, int i2, int i3) {
        setOrientation(i, i2);
        if (this.mLiveConfigChanges != null) {
            if (i <= 45 || i > 315) {
                i = 0;
            }
            if (i > 45 && i <= 135) {
                i = 90;
            }
            if (i > 135 && i <= 225) {
                i = 180;
            }
            if (i > 225) {
                i = 270;
            }
            this.mLiveConfigChanges.updateRotation(0.0f, 0.0f, (float) i);
        }
        if (this.mMimojiAvatarEngine != null) {
            this.mMimojiAvatarEngine.onDeviceRotationChange(i);
        }
    }

    public void onPause() {
        super.onPause();
        Log.d(TAG, "onPause");
        if (this.mFocusManager != null) {
            this.mFocusManager.removeMessages();
        }
        if (getActivity().startFromKeyguard()) {
            CameraSettings.setCurrentMimojiState(FragmentMimoji.CLOSE_STATE);
            CameraSettings.setMimojiPannelState(false);
            DataRepository.dataItemLive().getMimojiStatusManager().reset();
        }
        tryRemoveCountDownMessage();
        this.mActivity.getSensorStateManager().reset();
        resetScreenOn();
        closeCamera();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onPauseButtonClick() {
        if (this.mModuleIndex == 177) {
            if (isRecording()) {
                stopVideoRecording(true, true);
            }
            return;
        }
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (this.mLiveConfigChanges.isRecording()) {
            this.mLiveConfigChanges.onRecordPause();
            if (recordState != null) {
                recordState.onPause();
            }
        } else {
            trackLiveRecordingParams();
            this.mLiveConfigChanges.onRecordResume();
            if (recordState != null) {
                recordState.onResume();
            }
        }
    }

    public void onPictureTaken(byte[] bArr) {
    }

    public void onPictureTakenFinished(boolean z) {
    }

    public boolean onPictureTakenImageConsumed(Image image) {
        return false;
    }

    public void onPreviewLayoutChanged(Rect rect) {
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null && this.mActivity.getCameraScreenNail() != null) {
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        if (captureResult != null) {
            super.onPreviewMetaDataUpdate(captureResult);
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onNext(captureResult);
            }
        }
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        if (!isTextureExpired() || !retryOnceIfCameraError(this.mHandler)) {
            this.mHandler.sendEmptyMessage(51);
        } else {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        if (cameraCaptureSession != null && isAlive()) {
            this.mHandler.sendEmptyMessage(9);
            previewWhenSessionSuccess();
        }
    }

    public void onPreviewSizeChanged(int i, int i2) {
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(i, i2);
        }
    }

    public void onResume() {
        super.onResume();
        keepScreenOnAwhile();
    }

    public void onReviewCancelClicked() {
        this.mLiveConfigChanges.onRecordStop();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
        getActivity().setVolumeControlStream(this.mOldOriginVolumeStream);
        this.mIsPreviewing = false;
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT && isBackCamera()) {
            updateZoomRatioToggleButtonState(false);
            setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
            setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
        }
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
    }

    public void onReviewDoneClicked() {
        this.mLiveConfigChanges.onRecordStop();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFinish();
        getActivity().setVolumeControlStream(this.mOldOriginVolumeStream);
        this.mIsPreviewing = false;
        startSaveToLocal();
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT && isBackCamera()) {
            updateZoomRatioToggleButtonState(false);
            setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
            setMaxZoomRatio(this.mCameraCapabilities.getMaxZoomRatio());
        }
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
    }

    public void onShutterButtonClick(int i) {
        if (isRecording()) {
            stopVideoRecording(true, false);
        } else if (!checkCallingState()) {
            Log.d(TAG, "ignore in calling state");
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            recordState.onPrepare();
            recordState.onFailed();
        } else if (this.mMimojiAvatarEngine != null) {
            if (DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiPreview()) {
                turnOnFlashIfNeed();
                onMimojiCapture();
            } else if (DataRepository.dataItemLive().getMimojiStatusManager().IsInMimojiCreate()) {
                Log.d(TAG, "start create mimoji");
                if (this.mIsLowLight) {
                    Log.d(TAG, "mimoji create low light!");
                } else if (this.mMimojiAvatarEngine.onCreateCapture()) {
                    Log.d(TAG, "create mimoji success");
                    setCameraState(3);
                }
            }
        } else {
            startVideoRecording();
            BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
            if (backStack != null) {
                backStack.handleBackStackFromShutter();
            }
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public boolean onShutterButtonLongClick() {
        if (isRecording() || this.mMimojiAvatarEngine == null || this.mMimojiAvatarEngine.isOnCreateMimoji()) {
            return false;
        }
        startVideoRecording();
        return true;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        if (isRecording() && this.mMimojiAvatarEngine != null && !this.mMimojiAvatarEngine.isRecordStopping()) {
            stopVideoRecording(true, false);
        }
    }

    public void onSingleTapUp(int i, int i2, boolean z) {
        if (!this.mPaused && !this.mDisableSingleTapUp && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && isInTapableRect(i, i2) && getCameraState() != 3 && getCameraState() != 0) {
            if (!isFrameAvailable()) {
                Log.w(TAG, "onSingleTapUp: frame not available");
            } else if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(i, i2);
                mapTapCoordinate(point);
                unlockAEAF();
                this.mFocusManager.onSingleTapUp(point.x, point.y, z);
            }
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onThumbnailClicked(View view) {
        if (!isDoingAction() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public boolean onWaitingFocusFinished() {
        return !isBlockSnap() && isAlive();
    }

    public void onZoomingActionEnd(int i) {
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null && !dualController.isSlideVisible()) {
            if (i != 2 && i != 1) {
                return;
            }
            if ((this.mLiveConfigChanges == null || (!this.mLiveConfigChanges.isRecording() && !this.mLiveConfigChanges.isRecordingPaused())) && !CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                dualController.setImmersiveModeEnabled(false);
            }
        }
    }

    public void onZoomingActionStart(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && topAlert.isExtraMenuShowing()) {
            topAlert.hideExtraMenu();
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null) {
            return;
        }
        if (i == 2 || i == 1) {
            dualController.setImmersiveModeEnabled(true);
        }
    }

    /* access modifiers changed from: protected */
    public void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, this.mModuleIndex);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void pausePreview() {
        if (this.mCamera2Device.getFlashMode() == 2) {
            this.mCamera2Device.forceTurnFlashOffAndPausePreview();
        } else {
            this.mCamera2Device.pausePreview();
        }
        if (this.mLiveConfigChanges != null) {
            this.mLiveConfigChanges.setEffectAudio(false);
        }
        setCameraState(0);
    }

    /* access modifiers changed from: protected */
    public void performVolumeKeyClicked(String str, int i, boolean z) {
        if (i == 0 && z) {
            restoreBottom();
            if (isIgnoreTouchEvent()) {
                Log.w(TAG, "ignore volume key");
                return;
            }
            onShutterButtonClick(20);
        }
    }

    public void playFocusSound(int i) {
        playCameraSound(i);
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            getActivity().getImplFactory().initAdditional(getActivity(), 164, 174, 199, 212);
        } else {
            getActivity().getImplFactory().initAdditional(getActivity(), 164, 199, 212);
        }
    }

    /* access modifiers changed from: protected */
    public void resetScreenOn() {
        this.mHandler.removeMessages(17);
        this.mHandler.removeMessages(2);
        this.mHandler.removeMessages(52);
    }

    public void resumePreview() {
        previewWhenSessionSuccess();
        if (this.mLiveConfigChanges != null) {
            this.mLiveConfigChanges.setEffectAudio(true);
        }
    }

    public void setDisableSingleTapUp(boolean z) {
        this.mDisableSingleTapUp = z;
    }

    public boolean shouldReleaseLater() {
        return isRecording() || isSelectingCapturedResult();
    }

    /* access modifiers changed from: protected */
    public void showConfirmMessage(int i, int i2) {
        if (this.mDialog != null && this.mDialog.isShowing()) {
            if (this.mTitleId != i && this.mMessageId != i2) {
                this.mDialog.dismiss();
            } else {
                return;
            }
        }
        this.mTitleId = i;
        this.mMessageId = i2;
        this.mDialog = RotateDialogController.showSystemAlertDialog(this.mActivity, this.mActivity.getString(i), this.mActivity.getString(i2), this.mActivity.getString(17039370), null, null, null);
    }

    public void startFaceDetection() {
        if (this.mFaceDetectionEnabled && !this.mFaceDetectionStarted && isAlive() && this.mMaxFaceCount > 0 && this.mCamera2Device != null) {
            this.mFaceDetectionStarted = true;
            this.mCamera2Device.startFaceDetection();
            updateFaceView(true, true);
        }
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            Log.v(TAG, "startFocus");
            if (this.mFocusOrAELockSupported) {
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void startPreview() {
        if (isDeviceAlive()) {
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setMetaDataCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            this.mCamera2Device.setPreviewSize(this.mPreviewSize);
            this.mQuality = Util.convertSizeToQuality(this.mPreviewSize);
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            Log.d(TAG, "LiveModule, startPreview");
            checkDisplayOrientation();
            int i = isFrontCamera() ? 270 : 90;
            Surface surface = new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture());
            Surface surface2 = null;
            boolean z = false;
            if (this.mModuleIndex == 174) {
                surface2 = new Surface(this.mLiveConfigChanges.getInputSurfaceTexture());
                this.mLiveConfigChanges.initPreview(this.mPreviewSize.width, this.mPreviewSize.height, isFrontCamera(), i);
                this.mLiveVideoEditor.setRecordParameter(this.mPreviewSize.width, this.mPreviewSize.height, DataRepository.dataItemLive().getLiveStartOrientation());
                this.mLiveConfigChanges.startPreview(surface, new SlamDetectListener() {
                    public void onSlam(boolean z) {
                        if (z) {
                            Log.d(LiveModule.TAG, "onSlam open, register tt ar sensor");
                            LiveModule.this.mActivity.getSensorStateManager().setTTARSensorEnabled(true);
                            return;
                        }
                        Log.d(LiveModule.TAG, "onSlam close, unregister tt ar sensor");
                        LiveModule.this.mActivity.getSensorStateManager().setTTARSensorEnabled(false);
                    }
                });
            } else if (this.mModuleIndex == 177) {
                this.mActivity.getCameraScreenNail().setExternalFrameProcessor(this.mMimojiAvatarEngine);
                z = true;
            }
            boolean z2 = z;
            if (isEisOn()) {
                boolean isEISPreviewSupported = this.mCameraCapabilities.isEISPreviewSupported();
            }
            if (!isSelectingCapturedResult()) {
                this.mCamera2Device.startPreviewSession(surface2 == null ? surface : surface2, z2, false, getOperatingMode(), false, this);
            }
        }
    }

    public void startSaveToLocal() {
        if (!this.mSaved) {
            ContentValues saveContentValues = ((FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196)).getSaveContentValues();
            if (saveContentValues != null) {
                this.mSaved = true;
                saveContentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
                getActivity().getImageSaver().addVideo(saveContentValues.getAsString("_data"), saveContentValues, true);
            }
        }
    }

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            this.mFaceDetectionStarted = false;
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mMainProtocol.setActiveIndicator(2);
            updateFaceView(false, z);
        }
    }

    public void stopObjectTracking(boolean z) {
    }

    public void stopVideoRecording(boolean z, boolean z2) {
        boolean z3 = z2;
        RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
        if (isAlive() && recordState != null) {
            keepScreenOnAwhile();
            if (this.mMimojiAvatarEngine != null) {
                recordState.onFinish();
                this.mMimojiAvatarEngine.onRecordStop(z3);
                return;
            }
            this.mLiveConfigChanges.onRecordPause();
            this.mLiveVideoEditor.setRecordParameter(this.mPreviewSize.width, this.mPreviewSize.height, DataRepository.dataItemLive().getLiveStartOrientation());
            boolean hasSegments = this.mLiveConfigChanges.hasSegments();
            if (!hasSegments) {
                Log.d(TAG, "onFinish of no segments !!");
                this.mLiveConfigChanges.onRecordStop();
                recordState.onFinish();
            } else {
                recordState.onPostPreview();
                this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
                Log.v(TAG, "listen none");
                trackLiveVideoParams();
                CameraStatUtil.trackVideoRecorded(isFrontCamera(), getModuleIndex(), false, CameraSettings.isUltraWideConfigOpen(getModuleIndex()), "live", this.mQuality, this.mCamera2Device.getFlashMode(), 30, 0, null, this.mLiveConfigChanges.getTotalRecordingTime() / 1000);
                if (!z3) {
                    showPreview();
                }
            }
            boolean z4 = z3 || !hasSegments;
            if (z4 && HybridZoomingSystem.IS_3_OR_MORE_SAT && isBackCamera()) {
                updateZoomRatioToggleButtonState(false);
                if (isUltraWideBackCamera()) {
                    setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    setMaxZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR * this.mCameraCapabilities.getMaxZoomRatio());
                } else {
                    setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
                }
            }
        }
    }

    public void turnOffFlashIfNeed() {
        if (this.mOpenFlash) {
            this.mOpenFlash = false;
            if (isFrontCamera()) {
                stopScreenLight();
            }
        }
    }

    public void turnOnFlashIfNeed() {
        if (this.mCamera2Device.isNeedFlashOn()) {
            this.mOpenFlash = true;
            if (101 == this.mCamera2Device.getFlashMode()) {
                startScreenLight(Util.getScreenLightColor(SystemProperties.getInt("camera_screen_light_wb", 0)), CameraSettings.getScreenLightBrightness());
            }
        }
    }

    public void unRegisterModulePersistProtocol() {
        super.unRegisterModulePersistProtocol();
        Log.d(TAG, "unRegisterModulePersistProtocol");
        getActivity().getImplFactory().detachModulePersistent();
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        getActivity().getImplFactory().detachAdditional();
        if (this.mMimojiAvatarEngine != null) {
            this.mMimojiAvatarEngine.onResume();
        }
    }

    /* access modifiers changed from: protected */
    public void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.setAELock(false);
        }
        this.mFocusManager.setAeAwbLock(false);
    }

    /* access modifiers changed from: protected */
    public void updateFace() {
        boolean enableFaceDetection = enableFaceDetection();
        if (this.mMainProtocol != null) {
            MainContentProtocol mainContentProtocol = this.mMainProtocol;
            boolean z = !enableFaceDetection || !this.mShowFace;
            mainContentProtocol.setSkipDrawFace(z);
        }
        if (enableFaceDetection) {
            if (!this.mFaceDetectionEnabled) {
                this.mFaceDetectionEnabled = true;
                startFaceDetection();
            }
        } else if (this.mFaceDetectionEnabled) {
            stopFaceDetection(true);
            this.mFaceDetectionEnabled = false;
        }
    }

    public void updateFlashPreference() {
        setFlashMode(DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex));
    }

    /* access modifiers changed from: protected */
    public void updateFocusArea() {
        if (this.mCamera2Device == null) {
            Log.e(TAG, "updateFocusArea: null camera device");
            return;
        }
        Rect cropRegion = getCropRegion();
        Rect activeArraySize = getActiveArraySize();
        this.mActivity.getSensorStateManager().setFocusSensorEnabled(this.mFocusManager.getMeteringAreas(cropRegion, activeArraySize) != null);
        this.mCamera2Device.setAERegions(this.mFocusManager.getMeteringAreas(cropRegion, activeArraySize));
        if (this.mFocusAreaSupported) {
            this.mCamera2Device.setAFRegions(this.mFocusManager.getFocusAreas(cropRegion, activeArraySize));
        } else {
            this.mCamera2Device.resumePreview();
        }
    }
}
