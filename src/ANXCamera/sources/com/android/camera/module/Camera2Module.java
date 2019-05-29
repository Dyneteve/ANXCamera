package com.android.camera.module;

import android.annotation.TargetApi;
import android.app.FragmentManager;
import android.content.Context;
import android.content.Intent;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.hardware.SensorEvent;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.location.Location;
import android.media.Image;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.provider.MiuiSettings.ScreenEffect;
import android.text.TextUtils;
import android.util.Range;
import android.util.Size;
import android.view.KeyEvent;
import android.view.Surface;
import android.view.View;
import com.android.camera.BasePreferenceActivity;
import com.android.camera.Camera;
import com.android.camera.CameraIntentManager;
import com.android.camera.CameraIntentManager.CameraExtras;
import com.android.camera.CameraPreferenceActivity;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.LocalParallelService.ServiceStatusListener;
import com.android.camera.LocationManager;
import com.android.camera.PictureSizeManager;
import com.android.camera.R;
import com.android.camera.SensorStateManager.SensorStateListener;
import com.android.camera.Thumbnail;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.BeautyConstant;
import com.android.camera.constant.CameraScene;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigFlash;
import com.android.camera.data.data.config.ComponentConfigHdr;
import com.android.camera.data.data.config.SupportedConfigFactory;
import com.android.camera.data.data.runing.ComponentRunningShine;
import com.android.camera.data.data.runing.ComponentRunningTiltValue;
import com.android.camera.data.data.runing.DataItemRunning;
import com.android.camera.db.DbRepository;
import com.android.camera.db.element.SaveTask;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FaceAnalyzeInfo;
import com.android.camera.effect.FilterInfo;
import com.android.camera.effect.draw_mode.DrawExtTexAttribute;
import com.android.camera.effect.renders.DeviceWatermarkParam;
import com.android.camera.fragment.GoogleLensFragment;
import com.android.camera.fragment.GoogleLensFragment.OnClickListener;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseAiScene;
import com.android.camera.module.loader.FunctionParseAsdFace;
import com.android.camera.module.loader.FunctionParseAsdHdr;
import com.android.camera.module.loader.FunctionParseAsdLivePhoto;
import com.android.camera.module.loader.FunctionParseAsdScene;
import com.android.camera.module.loader.FunctionParseAsdUltraWide;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.android.camera.module.loader.PredicateFilterAiScene;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusManager2;
import com.android.camera.module.loader.camera2.FocusManager2.Listener;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.preferences.CameraSettingPreferences;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.BaseDelegate;
import com.android.camera.protocol.ModeProtocol.BottomPopupTips;
import com.android.camera.protocol.ModeProtocol.CameraAction;
import com.android.camera.protocol.ModeProtocol.CameraModuleSpecial;
import com.android.camera.protocol.ModeProtocol.ConfigChanges;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.FilterProtocol;
import com.android.camera.protocol.ModeProtocol.FullScreenProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.MakeupProtocol;
import com.android.camera.protocol.ModeProtocol.MiBeautyProtocol;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.SnapShotIndicator;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.RotateTextToast;
import com.android.camera.ui.zoom.ZoomingAction;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.BeautyBodySlimCountCallback;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.CaptureCallback;
import com.android.camera2.Camera2Proxy.FaceDetectionCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.HDRCheckerCallback;
import com.android.camera2.Camera2Proxy.LivePhotoResultCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.UltraWideCheckCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.CameraHardwareFace;
import com.android.lens.LensAgent;
import com.android.zxing.PreviewDecodeManager;
import com.google.lens.sdk.LensApi;
import com.google.lens.sdk.LensApi.LensAvailabilityCallback;
import com.mi.config.b;
import com.xiaomi.camera.base.CameraDeviceUtil;
import com.xiaomi.camera.base.PerformanceTracker;
import com.xiaomi.camera.core.ParallelTaskData;
import com.xiaomi.camera.core.ParallelTaskDataParameter;
import com.xiaomi.camera.core.ParallelTaskDataParameter.Builder;
import com.xiaomi.camera.core.PictureInfo;
import com.xiaomi.camera.liveshot.CircularMediaRecorder;
import com.xiaomi.camera.liveshot.LivePhotoResult;
import com.xiaomi.engine.BufferFormat;
import com.xiaomi.engine.GraphDescriptorBean;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Completable;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Queue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

@TargetApi(21)
public class Camera2Module extends BaseModule implements Listener, CameraAction, CameraModuleSpecial, FilterProtocol, TopConfigProtocol, ObjectViewListener, BeautyBodySlimCountCallback, CameraMetaDataCallback, CameraPreviewCallback, FaceDetectionCallback, FocusCallback, HDRCheckerCallback, LivePhotoResultCallback, PictureCallback, ScreenLightCallback, UltraWideCheckCallback {
    private static final int BURST_SHOOTING_DELAY = 0;
    private static final long CAPTURE_DURATION_THRESHOLD = 12000;
    private static final float MOON_AF_DISTANCE = 0.5f;
    private static final int REQUEST_CROP = 1000;
    /* access modifiers changed from: private */
    public static final String TAG = Camera2Module.class.getSimpleName();
    private static boolean mIsBeautyFrontOn = false;
    private static final String sTempCropFilename = "crop-temp";
    /* access modifiers changed from: private */
    public float[] curGyroscope;
    private volatile boolean isDetectedInHDR;
    /* access modifiers changed from: private */
    public volatile boolean isResetFromMutex = false;
    private boolean isSilhouette;
    /* access modifiers changed from: private */
    public float[] lastGyroscope;
    private boolean m3ALocked;
    private int mAFEndLogTimes;
    private Disposable mAiSceneDisposable;
    private boolean mAiSceneEnabled;
    /* access modifiers changed from: private */
    public FlowableEmitter<CaptureResult> mAiSceneFlowableEmitter;
    /* access modifiers changed from: private */
    public String mAlgorithmName;
    private BeautyValues mBeautyValues;
    private boolean mBlockQuickShot = (!CameraSettings.isCameraQuickShotEnable());
    private Intent mBroadcastIntent;
    /* access modifiers changed from: private */
    public Disposable mBurstDisposable;
    /* access modifiers changed from: private */
    public ObservableEmitter mBurstEmitter;
    private long mBurstNextDelayTime = 0;
    /* access modifiers changed from: private */
    public long mBurstStartTime;
    private final Object mCameraDeviceLock = new Object();
    private long mCaptureStartTime;
    private String mCaptureWaterMarkStr;
    private CircularMediaRecorder mCircularMediaRecorder = null;
    private final Object mCircularMediaRecorderStateLock = new Object();
    /* access modifiers changed from: private */
    public Disposable mCountdownDisposable;
    private String mCropValue;
    private int mCurrentAiScene;
    private int mCurrentAsdScene = -1;
    private int mCurrentDetectedScene;
    /* access modifiers changed from: private */
    public boolean mEnableParallelSession;
    private boolean mEnabledPreviewThumbnail;
    /* access modifiers changed from: private */
    public boolean mEnteringMoonMode;
    protected boolean mFaceDetected;
    private boolean mFaceDetectionEnabled;
    private boolean mFaceDetectionStarted;
    private int mFilterId;
    /* access modifiers changed from: private */
    public FocusManager2 mFocusManager;
    private FunctionParseAiScene mFunctionParseAiScene;
    private boolean mHasAiSceneFilterEffect;
    private boolean mHdrCheckEnabled;
    private boolean mIsAiConflict;
    private boolean mIsBeautyBodySlimOn;
    private boolean mIsCurrentLensEnabled;
    private boolean mIsFaceConflict;
    private boolean mIsGenderAgeOn;
    private volatile boolean mIsGoogleLensAvailable;
    /* access modifiers changed from: private */
    public boolean mIsGradienterOn;
    private boolean mIsImageCaptureIntent;
    private boolean mIsLensServiceBound = false;
    private boolean mIsMagicMirrorOn;
    private boolean mIsMicrophoneEnabled = true;
    /* access modifiers changed from: private */
    public boolean mIsMoonMode;
    private boolean mIsPortraitLightingOn;
    private boolean mIsSaveCaptureImage;
    private boolean mIsUltraWideConflict;
    /* access modifiers changed from: private */
    public int mJpegRotation;
    private boolean mKeepBitmapTexture;
    private long mLastAsdSceneShowTime = 0;
    private long mLastCaptureTime;
    private long mLastChangeSceneTime = 0;
    private String mLastFlashMode;
    private LensApi mLensApi;
    /* access modifiers changed from: private */
    public int mLensStatus = 1;
    private Queue<LivePhotoResult> mLivePhotoQueue = new LinkedBlockingQueue(120);
    private boolean mLiveShotEnabled;
    /* access modifiers changed from: private */
    public Location mLocation;
    private boolean mLongPressedAutoFocus;
    private Disposable mMetaDataDisposable;
    /* access modifiers changed from: private */
    public FlowableEmitter<CaptureResult> mMetaDataFlowableEmitter;
    /* access modifiers changed from: private */
    public boolean mMultiSnapStatus = false;
    /* access modifiers changed from: private */
    public boolean mMultiSnapStopRequest = false;
    private boolean mNeedAutoFocus;
    /* access modifiers changed from: private */
    public long mOnResumeTime;
    private int mOperatingMode;
    private boolean mPendingMultiCapture;
    private boolean mQuickCapture;
    private boolean mQuickShotAnimateEnable = false;
    /* access modifiers changed from: private */
    public int mReceivedJpegCallbackNum = 0;
    private Uri mSaveUri;
    private String mSceneMode;
    private SensorStateListener mSensorStateListener = new SensorStateListener() {
        public boolean isWorking() {
            return Camera2Module.this.isAlive() && Camera2Module.this.getCameraState() != 0;
        }

        public void notifyDevicePostureChanged() {
        }

        public void onDeviceBecomeStable() {
        }

        public void onDeviceBeginMoving() {
            if (!Camera2Module.this.mPaused && CameraSettings.isEdgePhotoEnable()) {
                Camera2Module.this.mActivity.getEdgeShutterView().onDeviceMoving();
            }
        }

        public void onDeviceKeepMoving(double d) {
            if (!Camera2Module.this.mPaused && Camera2Module.this.mFocusManager != null && !Camera2Module.this.mMultiSnapStatus && !Camera2Module.this.is3ALocked() && !Camera2Module.this.mMainProtocol.isEvAdjusted(true)) {
                Camera2Module.this.mFocusManager.onDeviceKeepMoving(d);
            }
        }

        public void onDeviceKeepStable() {
        }

        public void onDeviceOrientationChanged(float f, boolean z) {
            Camera2Module.this.mDeviceRotation = f;
            if (Camera2Module.this.getCameraState() != 3) {
                EffectController.getInstance().setDeviceRotation(Camera2Module.this.mActivity.getSensorStateManager().isDeviceLying(), Util.getShootRotation(Camera2Module.this.mActivity, Camera2Module.this.mDeviceRotation));
            }
            Camera2Module.this.mHandler.removeMessages(33);
            if (!Camera2Module.this.mPaused) {
                int roundOrientation = Util.roundOrientation(Math.round(f), Camera2Module.this.mOrientation);
                Camera2Module.this.mHandler.obtainMessage(33, roundOrientation, (Util.getDisplayRotation(Camera2Module.this.mActivity) + roundOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT).sendToTarget();
            }
        }

        public void onDeviceRotationChanged(float[] fArr) {
        }

        public void onSensorChanged(SensorEvent sensorEvent) {
            if (sensorEvent.sensor.getType() == 4) {
                Camera2Module.this.lastGyroscope = Camera2Module.this.curGyroscope;
                Camera2Module.this.curGyroscope = sensorEvent.values;
            }
        }
    };
    private ServiceStatusListener mServiceStatusListener;
    /* access modifiers changed from: private */
    public int mShootOrientation;
    /* access modifiers changed from: private */
    public float mShootRotation;
    private boolean mShouldDoMFNR;
    private long mShutterCallbackTime;
    private long mShutterLag;
    private Disposable mSuperNightDisposable;
    /* access modifiers changed from: private */
    public final Consumer<Integer> mSuperNightEventConsumer = new SuperNightEventConsumer();
    /* access modifiers changed from: private */
    public int mTotalJpegCallbackNum = 1;
    private volatile boolean mUltraWideAELocked;
    /* access modifiers changed from: private */
    public boolean mUpdateImageTitle = false;
    private CameraSize mVideoSize;
    private boolean mVolumeLongPress = false;
    /* access modifiers changed from: private */
    public boolean mWaitingSuperNightResult;

    private static class AsdSceneConsumer implements Consumer<Integer> {
        private WeakReference<BaseModule> mModule;

        public AsdSceneConsumer(BaseModule baseModule) {
            this.mModule = new WeakReference<>(baseModule);
        }

        public void accept(Integer num) throws Exception {
            if (this.mModule != null && this.mModule.get() != null) {
                BaseModule baseModule = (BaseModule) this.mModule.get();
                if (baseModule instanceof Camera2Module) {
                    ((Camera2Module) baseModule).consumeAsdSceneResult(num.intValue());
                }
            }
        }
    }

    private final class JpegQuickPictureCallback extends PictureCallbackWrapper {
        String mBurstShotTitle;
        boolean mDropped;
        Location mLocation;
        String mPressDownTitle;
        int mSavedJpegCallbackNum;

        public JpegQuickPictureCallback(Location location) {
            this.mLocation = location;
        }

        private String getBurstShotTitle() {
            String str;
            if (Camera2Module.this.mUpdateImageTitle && this.mBurstShotTitle != null && this.mSavedJpegCallbackNum == 1) {
                this.mPressDownTitle = this.mBurstShotTitle;
                this.mBurstShotTitle = null;
            }
            if (this.mBurstShotTitle == null) {
                long currentTimeMillis = System.currentTimeMillis();
                this.mBurstShotTitle = Util.createJpegName(currentTimeMillis);
                if (this.mBurstShotTitle.length() != 19) {
                    this.mBurstShotTitle = Util.createJpegName(currentTimeMillis + 1000);
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append(this.mBurstShotTitle);
            if (Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(Storage.UBIFOCUS_SUFFIX);
                sb2.append(this.mSavedJpegCallbackNum - 1);
                str = sb2.toString();
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("_BURST");
                sb3.append(this.mSavedJpegCallbackNum);
                str = sb3.toString();
            }
            sb.append(str);
            return sb.toString();
        }

        public void onPictureTaken(byte[] bArr) {
            int height;
            int width;
            if (!Camera2Module.this.mPaused && bArr != null && Camera2Module.this.mReceivedJpegCallbackNum < Camera2Module.this.mTotalJpegCallbackNum && Camera2Module.this.mMultiSnapStatus) {
                if (this.mSavedJpegCallbackNum == 1 && !Camera2Module.this.mMultiSnapStopRequest && !Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                    Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                }
                if (Storage.isLowStorageAtLastPoint()) {
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                        Camera2Module.this.trackGeneralInfo(this.mSavedJpegCallbackNum, true);
                        Camera2Module.this.trackPictureTaken(this.mSavedJpegCallbackNum, true, this.mLocation != null, Camera2Module.this.getCurrentAiSceneName(), Camera2Module.this.mEnteringMoonMode, Camera2Module.this.mIsMoonMode);
                        Camera2Module.this.stopMultiSnap();
                    }
                    return;
                }
                Camera2Module.access$904(Camera2Module.this);
                if (!Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                    this.mSavedJpegCallbackNum++;
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                        Camera2Module.this.playCameraSound(4);
                    }
                    Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(this.mSavedJpegCallbackNum));
                    boolean z = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum;
                    int orientation = z ? 0 : Exif.getOrientation(bArr);
                    if ((Camera2Module.this.mJpegRotation + orientation) % 180 == 0) {
                        height = Camera2Module.this.mPictureSize.getWidth();
                        width = Camera2Module.this.mPictureSize.getHeight();
                    } else {
                        height = Camera2Module.this.mPictureSize.getHeight();
                        width = Camera2Module.this.mPictureSize.getWidth();
                    }
                    int i = height;
                    int i2 = width;
                    String burstShotTitle = getBurstShotTitle();
                    boolean z2 = Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum - 1;
                    if (!Camera2Module.this.mMutexModePicker.isUbiFocus() || Camera2Module.this.mReceivedJpegCallbackNum != Camera2Module.this.mTotalJpegCallbackNum) {
                        boolean z3 = (Camera2Module.this.mReceivedJpegCallbackNum != 1 || Camera2Module.this.mMultiSnapStopRequest) && (Camera2Module.this.mReceivedJpegCallbackNum == Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped);
                        Camera2Module.this.mActivity.getImageSaver().addImage(bArr, z3, burstShotTitle, null, System.currentTimeMillis(), null, this.mLocation, i, i2, null, orientation, z, z2, true, false, false, null, Camera2Module.this.getPictureInfo(), -1);
                        this.mDropped = false;
                    }
                } else {
                    String access$400 = Camera2Module.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("CaptureBurst queue full and drop ");
                    sb.append(Camera2Module.this.mReceivedJpegCallbackNum);
                    Log.e(access$400, sb.toString());
                    this.mDropped = true;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                        Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                    }
                }
                if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped) {
                    Camera2Module.this.stopMultiSnap();
                }
            }
        }

        public void onPictureTakenFinished(boolean z) {
            Camera2Module.this.stopMultiSnap();
            Camera2Module.this.mBurstEmitter.onComplete();
        }
    }

    private final class JpegRepeatingCaptureCallback extends PictureCallbackWrapper {
        String mBurstShotTitle;
        private boolean mDropped;
        private WeakReference<Camera2Module> mModule;
        ParallelTaskDataParameter mParallelParameter = null;
        String mPressDownTitle;

        public JpegRepeatingCaptureCallback(Camera2Module camera2Module) {
            this.mModule = new WeakReference<>(camera2Module);
        }

        private String getBurstShotTitle() {
            String str;
            if (Camera2Module.this.mUpdateImageTitle && this.mBurstShotTitle != null && Camera2Module.this.mReceivedJpegCallbackNum == 1) {
                this.mPressDownTitle = this.mBurstShotTitle;
                this.mBurstShotTitle = null;
            }
            if (this.mBurstShotTitle == null) {
                long currentTimeMillis = System.currentTimeMillis();
                this.mBurstShotTitle = Util.createJpegName(currentTimeMillis);
                if (this.mBurstShotTitle.length() != 19) {
                    this.mBurstShotTitle = Util.createJpegName(currentTimeMillis + 1000);
                }
            }
            StringBuilder sb = new StringBuilder();
            sb.append(this.mBurstShotTitle);
            if (Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(Storage.UBIFOCUS_SUFFIX);
                sb2.append(Camera2Module.this.mReceivedJpegCallbackNum - 1);
                str = sb2.toString();
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("_BURST");
                sb3.append(Camera2Module.this.mReceivedJpegCallbackNum);
                str = sb3.toString();
            }
            sb.append(str);
            return sb.toString();
        }

        private boolean tryCheckNeedStop() {
            if (!Storage.isLowStorageAtLastPoint()) {
                return false;
            }
            if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mMultiSnapStatus) {
                Camera2Module.this.trackGeneralInfo(Camera2Module.this.mReceivedJpegCallbackNum, true);
                Camera2Module.this.trackPictureTaken(Camera2Module.this.mReceivedJpegCallbackNum, true, Camera2Module.this.mLocation != null, Camera2Module.this.getCurrentAiSceneName(), Camera2Module.this.mEnteringMoonMode, Camera2Module.this.mIsMoonMode);
                Camera2Module.this.stopMultiSnap();
            }
            return true;
        }

        /* JADX WARNING: Removed duplicated region for block: B:34:0x00a5  */
        /* JADX WARNING: Removed duplicated region for block: B:35:0x00aa  */
        /* JADX WARNING: Removed duplicated region for block: B:38:0x00f1  */
        /* JADX WARNING: Removed duplicated region for block: B:39:0x00f3  */
        /* JADX WARNING: Removed duplicated region for block: B:48:0x0135  */
        /* JADX WARNING: Removed duplicated region for block: B:49:0x0141  */
        /* JADX WARNING: Removed duplicated region for block: B:52:0x014c  */
        /* JADX WARNING: Removed duplicated region for block: B:53:0x0151  */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize, boolean z) {
            List list;
            boolean z2 = true;
            if (!Camera2Module.this.mEnableParallelSession || Camera2Module.this.mPaused || Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || !Camera2Module.this.mMultiSnapStatus) {
                String access$400 = Camera2Module.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStart: revNum = ");
                sb.append(Camera2Module.this.mReceivedJpegCallbackNum);
                sb.append(" paused = ");
                sb.append(Camera2Module.this.mPaused);
                sb.append(" status = ");
                sb.append(Camera2Module.this.mMultiSnapStatus);
                Log.d(access$400, sb.toString());
                parallelTaskData.setAbandoned(true);
                return parallelTaskData;
            }
            if (Camera2Module.this.mReceivedJpegCallbackNum == 1 && !Camera2Module.this.mMultiSnapStopRequest) {
                if (!Camera2Module.this.is3ALocked()) {
                    Camera2Module.this.mFocusManager.onShutter();
                }
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                    Camera2Module.this.mActivity.getImageSaver().updateImage(getBurstShotTitle(), this.mPressDownTitle);
                }
            }
            if (tryCheckNeedStop()) {
                Log.d(Camera2Module.TAG, "onCaptureStart: need stop multi capture, return null");
                return null;
            }
            if (this.mParallelParameter == null) {
                if (CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
                    List faceWaterMarkInfos = ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).getFaceWaterMarkInfos();
                    if (faceWaterMarkInfos != null && !faceWaterMarkInfos.isEmpty()) {
                        list = new ArrayList(faceWaterMarkInfos);
                        Builder jpegRotation = new Builder(Camera2Module.this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), Camera2Module.this.mOutPutSize != null ? cameraSize.toSizeObject() : Camera2Module.this.mOutPutSize.toSizeObject()).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(Camera2Module.this.isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != Camera2Module.this.mOrientation ? 0 : Camera2Module.this.mOrientation).setJpegRotation(Camera2Module.this.mJpegRotation);
                        float access$2400 = (CameraSettings.isGradienterOn() || Camera2Module.this.mShootRotation != -1.0f) ? Camera2Module.this.mShootRotation : 0.0f;
                        this.mParallelParameter = jpegRotation.setShootRotation(access$2400).setShootOrientation(Camera2Module.this.mShootOrientation).setLocation(Camera2Module.this.mLocation == null ? new Location(Camera2Module.this.mLocation) : null).setTimeWaterMarkString(!CameraSettings.isTimeWaterMarkOpen() ? Util.getTimeWatermark() : null).setFaceWaterMarkList(list).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(Camera2Module.this.isFrontCamera()).setBokehFrontCamera(Camera2Module.this.isBokehFrontCamera()).setAlgorithmName(Camera2Module.this.mAlgorithmName).setPictureInfo(Camera2Module.this.getPictureInfo()).setSuffix(Camera2Module.this.getSuffix()).setGradienterOn(Camera2Module.this.mIsGradienterOn).setTiltShiftMode(Camera2Module.getTiltShiftMode()).setSaveGroupshotPrimitive(false).setDeviceWatermarkParam(Camera2Module.this.getDeviceWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(true)).build();
                    }
                }
                list = null;
                Builder jpegRotation2 = new Builder(Camera2Module.this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), Camera2Module.this.mOutPutSize != null ? cameraSize.toSizeObject() : Camera2Module.this.mOutPutSize.toSizeObject()).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(Camera2Module.this.isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != Camera2Module.this.mOrientation ? 0 : Camera2Module.this.mOrientation).setJpegRotation(Camera2Module.this.mJpegRotation);
                if (CameraSettings.isGradienterOn()) {
                }
                this.mParallelParameter = jpegRotation2.setShootRotation(access$2400).setShootOrientation(Camera2Module.this.mShootOrientation).setLocation(Camera2Module.this.mLocation == null ? new Location(Camera2Module.this.mLocation) : null).setTimeWaterMarkString(!CameraSettings.isTimeWaterMarkOpen() ? Util.getTimeWatermark() : null).setFaceWaterMarkList(list).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(Camera2Module.this.isFrontCamera()).setBokehFrontCamera(Camera2Module.this.isBokehFrontCamera()).setAlgorithmName(Camera2Module.this.mAlgorithmName).setPictureInfo(Camera2Module.this.getPictureInfo()).setSuffix(Camera2Module.this.getSuffix()).setGradienterOn(Camera2Module.this.mIsGradienterOn).setTiltShiftMode(Camera2Module.getTiltShiftMode()).setSaveGroupshotPrimitive(false).setDeviceWatermarkParam(Camera2Module.this.getDeviceWaterMarkParam()).setJpegQuality(BaseModule.getJpegQuality(true)).build();
            }
            parallelTaskData.fillParameter(this.mParallelParameter);
            if (!Camera2Module.this.mActivity.getImageSaver().isSaveQueueFull()) {
                Camera2Module.access$904(Camera2Module.this);
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus()) {
                    Camera2Module.this.playCameraSound(4);
                }
                String access$4002 = Camera2Module.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onCaptureStart: revNum = ");
                sb2.append(Camera2Module.this.mReceivedJpegCallbackNum);
                Log.d(access$4002, sb2.toString());
                Camera2Module.this.mBurstEmitter.onNext(Integer.valueOf(Camera2Module.this.mReceivedJpegCallbackNum));
                if (!Camera2Module.this.mMutexModePicker.isUbiFocus() && Camera2Module.this.mReceivedJpegCallbackNum <= Camera2Module.this.mTotalJpegCallbackNum) {
                    String generateFilepath = Storage.generateFilepath(getBurstShotTitle());
                    String access$4003 = Camera2Module.TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("onCaptureStart: savePath = ");
                    sb3.append(generateFilepath);
                    Log.d(access$4003, sb3.toString());
                    parallelTaskData.setSavePath(generateFilepath);
                    if (Camera2Module.this.mReceivedJpegCallbackNum != Camera2Module.this.mTotalJpegCallbackNum && !Camera2Module.this.mMultiSnapStopRequest && !this.mDropped) {
                        z2 = false;
                    }
                    parallelTaskData.setNeedThumbnail(z2);
                    Camera2Module.this.beginParallelProcess(parallelTaskData, false);
                    this.mDropped = false;
                    if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum || Camera2Module.this.mMultiSnapStopRequest || this.mDropped) {
                        Camera2Module.this.stopMultiSnap();
                    }
                    return parallelTaskData;
                }
            } else {
                String access$4004 = Camera2Module.TAG;
                StringBuilder sb4 = new StringBuilder();
                sb4.append("onCaptureStart: queue full and drop ");
                sb4.append(Camera2Module.this.mReceivedJpegCallbackNum);
                Log.e(access$4004, sb4.toString());
                this.mDropped = true;
                if (Camera2Module.this.mReceivedJpegCallbackNum >= Camera2Module.this.mTotalJpegCallbackNum) {
                    Camera2Module.this.mActivity.getThumbnailUpdater().getLastThumbnailUncached();
                }
            }
            parallelTaskData = null;
            Camera2Module.this.stopMultiSnap();
            return parallelTaskData;
        }

        public void onPictureTakenFinished(boolean z) {
            Camera2Module.this.stopMultiSnap();
            Camera2Module.this.mBurstEmitter.onComplete();
            if (this.mModule.get() != null) {
                ((Camera2Module) this.mModule.get()).onPictureTakenFinished(true);
                PerformanceTracker.trackPictureCapture(1);
                return;
            }
            Log.e(Camera2Module.TAG, "callback onShotFinished null");
        }
    }

    private static class MainHandler extends Handler {
        private WeakReference<Camera2Module> mModule;

        public MainHandler(Camera2Module camera2Module, Looper looper) {
            super(looper);
            this.mModule = new WeakReference<>(camera2Module);
        }

        public void handleMessage(Message message) {
            Camera2Module camera2Module = (Camera2Module) this.mModule.get();
            if (camera2Module != null) {
                if (!camera2Module.isCreated()) {
                    removeCallbacksAndMessages(null);
                } else if (camera2Module.getActivity() != null) {
                    int i = message.what;
                    if (i == 2) {
                        camera2Module.getWindow().clearFlags(128);
                    } else if (i == 4) {
                        camera2Module.checkActivityOrientation();
                        if (SystemClock.uptimeMillis() - camera2Module.mOnResumeTime < 5000) {
                            sendEmptyMessageDelayed(4, 100);
                        }
                    } else if (i == 17) {
                        removeMessages(17);
                        removeMessages(2);
                        camera2Module.getWindow().addFlags(128);
                        sendEmptyMessageDelayed(2, (long) camera2Module.getScreenDelay());
                    } else if (i == 31) {
                        camera2Module.setOrientationParameter();
                    } else if (i != 33) {
                        boolean z = false;
                        if (i != 35) {
                            switch (i) {
                                case 9:
                                    camera2Module.mMainProtocol.initializeFocusView(camera2Module);
                                    camera2Module.mMainProtocol.setObjectViewListener(camera2Module);
                                    break;
                                case 10:
                                    camera2Module.mOpenCameraFail = true;
                                    camera2Module.onCameraException();
                                    break;
                                case 11:
                                    break;
                                default:
                                    switch (i) {
                                        case 44:
                                            camera2Module.restartModule();
                                            break;
                                        case 45:
                                            camera2Module.setActivity(null);
                                            break;
                                        default:
                                            switch (i) {
                                                case 48:
                                                    camera2Module.setCameraState(1);
                                                    break;
                                                case 49:
                                                    if (camera2Module.isAlive()) {
                                                        camera2Module.stopMultiSnap();
                                                        camera2Module.mBurstEmitter.onComplete();
                                                        break;
                                                    } else {
                                                        return;
                                                    }
                                                case 50:
                                                    Log.w(Camera2Module.TAG, "Oops, capture timeout later release timeout!");
                                                    camera2Module.onPictureTakenFinished(false);
                                                    break;
                                                case 51:
                                                    if (!camera2Module.mActivity.isActivityPaused()) {
                                                        camera2Module.mOpenCameraFail = true;
                                                        camera2Module.onCameraException();
                                                        break;
                                                    }
                                                    break;
                                                case 52:
                                                    camera2Module.onShutterButtonClick(camera2Module.getTriggerMode());
                                                    break;
                                                default:
                                                    switch (i) {
                                                        case 56:
                                                            if (camera2Module.mMainProtocol != null && camera2Module.mMainProtocol.isFaceExists(1) && camera2Module.mMainProtocol.isFocusViewVisible() && camera2Module.mCamera2Device != null && 4 == camera2Module.mCamera2Device.getFocusMode()) {
                                                                camera2Module.mMainProtocol.clearFocusView(7);
                                                                break;
                                                            }
                                                        case 57:
                                                            PreviewDecodeManager.getInstance().reset();
                                                            break;
                                                        default:
                                                            StringBuilder sb = new StringBuilder();
                                                            sb.append("no consumer for this message: ");
                                                            sb.append(message.what);
                                                            throw new RuntimeException(sb.toString());
                                                    }
                                            }
                                            break;
                                    }
                            }
                        } else {
                            boolean z2 = message.arg1 > 0;
                            if (message.arg2 > 0) {
                                z = true;
                            }
                            camera2Module.handleUpdateFaceView(z2, z);
                        }
                    } else {
                        camera2Module.setOrientation(message.arg1, message.arg2);
                    }
                }
            }
        }
    }

    private static class SuperNightEventConsumer implements Consumer<Integer> {
        private final WeakReference<Camera2Module> mCamera2ModuleRef;

        private SuperNightEventConsumer(Camera2Module camera2Module) {
            this.mCamera2ModuleRef = new WeakReference<>(camera2Module);
        }

        public void accept(Integer num) throws Exception {
            Camera2Module camera2Module = (Camera2Module) this.mCamera2ModuleRef.get();
            if (camera2Module != null && camera2Module.isAlive()) {
                int intValue = num.intValue();
                if (intValue == 300) {
                    Log.d(Camera2Module.TAG, "SuperNight: show capture instruction hint");
                    BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                    if (bottomPopupTips != null) {
                        bottomPopupTips.showTips(11, R.string.super_night_toast, 4);
                    }
                } else if (intValue == 2000) {
                    Log.d(Camera2Module.TAG, "SuperNight: trigger shutter animation, sound and post saving");
                    camera2Module.mWaitingSuperNightResult = true;
                    camera2Module.animateCapture();
                    camera2Module.playCameraSound(0);
                    RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
                    if (recordState != null) {
                        recordState.onPostSavingStart();
                    }
                }
            }
        }
    }

    static /* synthetic */ int access$904(Camera2Module camera2Module) {
        int i = camera2Module.mReceivedJpegCallbackNum + 1;
        camera2Module.mReceivedJpegCallbackNum = i;
        return i;
    }

    /* access modifiers changed from: private */
    public void animateCapture() {
        if (!this.mIsImageCaptureIntent) {
            this.mActivity.getCameraScreenNail().animateCapture(getCameraRotation());
        }
    }

    private void applyBacklightEffect() {
        trackAISceneChanged(this.mModuleIndex, 23);
        setAiSceneEffect(23);
        updateHDR("normal");
        resetEvValue();
    }

    private void backlightHandle(TopAlert topAlert, ConfigChanges configChanges) {
        if (!CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
            configChanges.closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
            topAlert.alertHDR(8, false, false);
            topAlert.alertAiSceneSelector(0);
            applyBacklightEffect();
            this.mCamera2Device.setASD(false);
            resumePreviewInWorkThread();
        }
    }

    /* access modifiers changed from: private */
    public void beginParallelProcess(ParallelTaskData parallelTaskData, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("algo begin: ");
        sb.append(parallelTaskData.getSavePath());
        sb.append(" | ");
        sb.append(Thread.currentThread().getName());
        Log.i(str, sb.toString());
        if (z && DbRepository.dbItemSaveTask().getItemByPath(parallelTaskData.getSavePath()) == null) {
            SaveTask saveTask = (SaveTask) DbRepository.dbItemSaveTask().generateItem(System.currentTimeMillis());
            saveTask.setPath(parallelTaskData.getSavePath());
            DbRepository.dbItemSaveTask().endItemAndInsert(saveTask, 0);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("beginParallelProcess endItemAndInsert end getSavePath:");
            sb2.append(parallelTaskData.getSavePath());
            Log.d(str2, sb2.toString());
        }
        if (this.mServiceStatusListener == null) {
            this.mServiceStatusListener = new ServiceStatusListener() {
                public void onImagePostProcessStart(ParallelTaskData parallelTaskData) {
                    if (4 != parallelTaskData.getAlgoType()) {
                        Camera2Module.this.onPictureTakenFinished(true);
                        PerformanceTracker.trackPictureCapture(1);
                        if (Camera2Module.this.mCamera2Device != null) {
                            Camera2Module.this.mCamera2Device.onParallelImagePostProcStart();
                        }
                    }
                }
            };
            AlgoConnector.getInstance().setServiceStatusListener(this.mServiceStatusListener);
        }
    }

    private long calculateTimeout(int i) {
        long j = CAPTURE_DURATION_THRESHOLD;
        if (i == 167) {
            return (Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) / 1000000) + CAPTURE_DURATION_THRESHOLD;
        }
        if (i == 173) {
            j = 24000;
        }
        return j;
    }

    private boolean checkShutterCondition() {
        if (isBlockSnap() || isIgnoreTouchEvent()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("checkShutterCondition: blockSnap=");
            sb.append(isBlockSnap());
            sb.append(" ignoreTouchEvent=");
            sb.append(isIgnoreTouchEvent());
            Log.w(str, sb.toString());
            return false;
        } else if (Storage.isLowStorageAtLastPoint()) {
            Log.w(TAG, "checkShutterCondition: low storage");
            return false;
        } else if (!isFrontCamera() || !this.mActivity.isScreenSlideOff()) {
            BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
            if (backStack != null) {
                backStack.handleBackStackFromShutter();
            }
            return true;
        } else {
            Log.w(TAG, "checkShutterCondition: screen is slide off");
            return false;
        }
    }

    private void configParallelSession() {
        GraphDescriptorBean graphDescriptorBean;
        if (isPortraitMode()) {
            int i = (isDualFrontCamera() || isDualCamera() || isBokehUltraWideBackCamera()) ? 2 : 1;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("configParallelSession: inputStreamNum = ");
            sb.append(i);
            Log.d(str, sb.toString());
            graphDescriptorBean = new GraphDescriptorBean(32770, i, true, CameraDeviceUtil.getCameraCombinationMode(this.mActualCameraId));
        } else {
            graphDescriptorBean = new GraphDescriptorBean(0, 1, true, CameraDeviceUtil.getCameraCombinationMode(this.mActualCameraId));
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("[QCFA] configParallelSession: mPictureSize = ");
        sb2.append(this.mPictureSize);
        Log.d(str2, sb2.toString());
        String str3 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("[QCFA] configParallelSession: mOutPutSize = ");
        sb3.append(this.mOutPutSize);
        Log.d(str3, sb3.toString());
        BufferFormat bufferFormat = new BufferFormat(this.mPictureSize.width, this.mPictureSize.height, 35, graphDescriptorBean);
        LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder(true);
        localBinder.configCaptureSession(bufferFormat);
        localBinder.setImageSaver(this.mActivity.getImageSaver());
        localBinder.setJpegOutputSize(this.mOutPutSize.width, this.mOutPutSize.height);
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Removed duplicated region for block: B:80:0x01ad  */
    /* JADX WARNING: Removed duplicated region for block: B:83:0x01b7  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void consumeAiSceneResult(int i, boolean z) {
        boolean z2 = false;
        if (i == 36) {
            i = 0;
        }
        if (this.mCurrentAiScene == i || isDoingAction() || !isAlive() || this.mActivity.isActivityPaused()) {
            return;
        }
        if (!z || !this.isResetFromMutex) {
            if (!z) {
                this.isResetFromMutex = false;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("consumeAiSceneResult: ");
            sb.append(i);
            sb.append("; isReset: ");
            sb.append(z);
            Log.d(str, sb.toString());
            TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
            ConfigChanges configChanges = (ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164);
            if (!isFrontCamera()) {
                this.mCamera2Device.setCameraAI30(i == 25);
            }
            if (this.mIsGoogleLensAvailable) {
                if (!LensAgent.isConflictAiScene(this.mCurrentAiScene) && LensAgent.isConflictAiScene(i)) {
                    this.mIsAiConflict = true;
                    showOrHideChip(false);
                } else if (LensAgent.isConflictAiScene(this.mCurrentAiScene) && !LensAgent.isConflictAiScene(i)) {
                    this.mIsAiConflict = false;
                    showOrHideChip(true);
                }
            }
            checkCloseMoonMode(i, 8);
            if (i != -1) {
                if (i == 1) {
                    int parseInt = Integer.parseInt(CameraSettings.getSharpness());
                    if (parseInt < 6) {
                        parseInt++;
                    }
                    this.mCurrentAiScene = i;
                    configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                    this.mCamera2Device.setSharpness(parseInt);
                } else if (i == 4) {
                    this.mCamera2Device.setContrast(Integer.parseInt(CameraSettings.getContrast()));
                    this.mCurrentAiScene = i;
                    configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                    updateSuperResolution();
                } else if (i == 10) {
                    configChanges.closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
                    setFlashMode("0");
                    updateMfnr(true);
                    updateOIS();
                } else if (i == 15 || i == 19) {
                    int parseInt2 = Integer.parseInt(CameraSettings.getSharpness());
                    if (parseInt2 < 6) {
                        parseInt2++;
                    }
                    this.mCamera2Device.setSharpness(parseInt2);
                    this.mCurrentAiScene = i;
                    configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                } else {
                    if (i != 37) {
                        switch (i) {
                            case 7:
                            case 8:
                                this.mCurrentAiScene = i;
                                configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                break;
                            default:
                                switch (i) {
                                    case 25:
                                        trackAISceneChanged(this.mModuleIndex, 25);
                                        topAlert.setAiSceneImageLevel(25);
                                        topAlert.alertAiSceneSelector(8);
                                        setAiSceneEffect(25);
                                        this.mCurrentAiScene = i;
                                        updateHDRPreference();
                                        configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                        this.mCamera2Device.setASD(false);
                                        resumePreviewInWorkThread();
                                        return;
                                    case 26:
                                    case 27:
                                    case 28:
                                    case 29:
                                    case 30:
                                    case 31:
                                        if (!DataRepository.dataItemFeature().fa()) {
                                            configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                            updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                                            i = 0;
                                            break;
                                        } else {
                                            this.mCurrentAiScene = i;
                                            configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                            break;
                                        }
                                    default:
                                        switch (i) {
                                            case 34:
                                                break;
                                            case 35:
                                                if (showMoonMode(false)) {
                                                    topAlert.setAiSceneImageLevel(i);
                                                    this.mCamera2Device.setASD(true);
                                                    trackAISceneChanged(this.mModuleIndex, i);
                                                    this.mCurrentAiScene = i;
                                                    return;
                                                }
                                                break;
                                            default:
                                                updateHDRPreference();
                                                configChanges.restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_AI);
                                                updatePreferenceInWorkThread(UpdateConstant.AI_SCENE_CONFIG);
                                                break;
                                        }
                                }
                        }
                    }
                    this.mCurrentAiScene = i;
                    trackAISceneChanged(this.mModuleIndex, i);
                    topAlert.setAiSceneImageLevel(i);
                    topAlert.alertAiSceneSelector(8);
                    if (z2) {
                        setAiSceneEffect(i);
                    }
                    this.mCamera2Device.setASD(true);
                    if (!z) {
                        this.mCurrentAiScene = i;
                    }
                    updateBeauty();
                    resumePreviewInWorkThread();
                    return;
                }
                z2 = true;
                trackAISceneChanged(this.mModuleIndex, i);
                topAlert.setAiSceneImageLevel(i);
                topAlert.alertAiSceneSelector(8);
                if (z2) {
                }
                this.mCamera2Device.setASD(true);
                if (!z) {
                }
                updateBeauty();
                resumePreviewInWorkThread();
                return;
            }
            backlightHandle(topAlert, configChanges);
            topAlert.setAiSceneImageLevel(23);
            this.mCurrentAiScene = i;
        }
    }

    /* access modifiers changed from: private */
    public void consumeAsdSceneResult(int i) {
        if (!isDoingAction() && isAlive() && !this.mActivity.isActivityPaused()) {
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.mLastAsdSceneShowTime > 500 && this.mCurrentAsdScene != i) {
                exitAsdScene(this.mCurrentAsdScene);
                enterAsdScene(i);
                this.mCurrentAsdScene = i;
                this.mLastAsdSceneShowTime = currentTimeMillis;
            }
        }
    }

    /* JADX WARNING: type inference failed for: r2v0 */
    /* JADX WARNING: type inference failed for: r2v1, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v2, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v3, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v4 */
    /* JADX WARNING: type inference failed for: r4v2, types: [java.io.FileOutputStream] */
    /* JADX WARNING: type inference failed for: r2v5 */
    /* JADX WARNING: type inference failed for: r2v6 */
    /* JADX WARNING: type inference failed for: r2v7 */
    /* JADX WARNING: type inference failed for: r2v16, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v17, types: [java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r1v12, types: [java.io.OutputStream, java.io.Closeable] */
    /* JADX WARNING: type inference failed for: r2v18 */
    /* JADX WARNING: type inference failed for: r2v19 */
    /* JADX WARNING: type inference failed for: r2v20 */
    /* JADX WARNING: type inference failed for: r2v21 */
    /* JADX WARNING: type inference failed for: r2v22 */
    /* JADX WARNING: type inference failed for: r2v23 */
    /* JADX WARNING: type inference failed for: r2v24 */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r2v4
  assigns: []
  uses: []
  mth insns count: 118
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
    /* JADX WARNING: Unknown top exception splitter block from list: {B:56:0x010b=Splitter:B:56:0x010b, B:51:0x00fc=Splitter:B:51:0x00fc} */
    /* JADX WARNING: Unknown variable types count: 8 */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void doAttach() {
        ? r2;
        ? r22;
        ? r23;
        ? r24;
        if (!this.mPaused) {
            byte[] storedJpegData = this.mActivity.getImageSaver().getStoredJpegData();
            if (this.mIsSaveCaptureImage) {
                this.mActivity.getImageSaver().saveStoredData();
            }
            ? r25 = 0;
            if (this.mCropValue != null) {
                try {
                    File fileStreamPath = this.mActivity.getFileStreamPath(sTempCropFilename);
                    fileStreamPath.delete();
                    ? openFileOutput = this.mActivity.openFileOutput(sTempCropFilename, 0);
                    try {
                        openFileOutput.write(storedJpegData);
                        openFileOutput.close();
                        Uri fromFile = Uri.fromFile(fileStreamPath);
                        Util.closeSilently(null);
                        Bundle bundle = new Bundle();
                        if (ComponentRunningTiltValue.TILT_CIRCLE.equals(this.mCropValue)) {
                            bundle.putString("circleCrop", "true");
                        }
                        if (this.mSaveUri != null) {
                            bundle.putParcelable("output", this.mSaveUri);
                        } else {
                            bundle.putBoolean("return-data", true);
                        }
                        Intent intent = new Intent("com.android.camera.action.CROP");
                        intent.setData(fromFile);
                        intent.putExtras(bundle);
                        this.mActivity.startActivityForResult(intent, 1000);
                    } catch (FileNotFoundException e) {
                        ? r26 = openFileOutput;
                    } catch (IOException e2) {
                        r25 = openFileOutput;
                        try {
                            r22 = r22;
                            this.mActivity.setResult(0);
                            this.mActivity.finish();
                            Util.closeSilently(r22);
                        } catch (Throwable th) {
                            th = th;
                            r2 = r22;
                            Util.closeSilently(r2);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        r2 = openFileOutput;
                        Util.closeSilently(r2);
                        throw th;
                    }
                } catch (FileNotFoundException e3) {
                    r22 = r22;
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                    Util.closeSilently(r22);
                } catch (IOException e4) {
                    r22 = r22;
                    this.mActivity.setResult(0);
                    this.mActivity.finish();
                    Util.closeSilently(r22);
                }
            } else if (this.mSaveUri != null) {
                try {
                    ? openOutputStream = this.mContentResolver.openOutputStream(this.mSaveUri);
                    try {
                        openOutputStream.write(storedJpegData);
                        openOutputStream.close();
                        this.mActivity.setResult(-1);
                        this.mActivity.finish();
                        Util.closeSilently(openOutputStream);
                    } catch (Exception e5) {
                        e = e5;
                        r24 = openOutputStream;
                        try {
                            Log.e(TAG, "Exception when doAttach: ", e);
                            this.mActivity.finish();
                            Util.closeSilently(r24);
                        } catch (Throwable th3) {
                            th = th3;
                            r23 = r24;
                            this.mActivity.finish();
                            Util.closeSilently(r23);
                            throw th;
                        }
                    } catch (Throwable th4) {
                        th = th4;
                        r23 = openOutputStream;
                        this.mActivity.finish();
                        Util.closeSilently(r23);
                        throw th;
                    }
                } catch (Exception e6) {
                    e = e6;
                    r24 = r25;
                    Log.e(TAG, "Exception when doAttach: ", e);
                    this.mActivity.finish();
                    Util.closeSilently(r24);
                }
            } else {
                this.mActivity.setResult(-1, new Intent("inline-data").putExtra("data", Util.rotate(Util.makeBitmap(storedJpegData, 51200), Exif.getOrientation(storedJpegData))));
                this.mActivity.finish();
            }
        }
    }

    private void doLaterReleaseIfNeed() {
        if (this.mActivity != null) {
            if (this.mHandler != null) {
                this.mHandler.removeMessages(50);
            }
            if (this.mActivity.isActivityPaused()) {
                boolean z = this.mCamera2Device != null && this.mCamera2Device.isSessionReady();
                if (z) {
                    Log.d(TAG, "doLaterRelease");
                } else {
                    Log.d(TAG, "doLaterRelease but session is closed");
                }
                this.mActivity.releaseAll(true, z);
            } else if (!isDeparted()) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.handlePendingScreenSlide();
                    }
                });
                if (isTextureExpired()) {
                    Log.d(TAG, "surfaceTexture expired, restartModule");
                    this.mHandler.post(new Runnable() {
                        public void run() {
                            Camera2Module.this.restartModule();
                        }
                    });
                }
            }
        }
    }

    private boolean enableFrontMFNR() {
        return b.iv() && (this.mOperatingMode == 32773 || (DataRepository.dataItemFeature().gl() && this.mOperatingMode == 36865));
    }

    private boolean enablePreviewAsThumbnail() {
        boolean z = false;
        if (!isAlive()) {
            return false;
        }
        if (this.mEnableParallelSession) {
            return true;
        }
        if (this.mIsPortraitLightingOn) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        if (CameraSettings.isGradienterOn()) {
            return false;
        }
        if (CameraSettings.isPortraitModeBackOn()) {
            return true;
        }
        if (this.mModuleIndex == 167 || this.mModuleIndex == 173 || this.mModuleIndex == 175 || CameraSettings.showGenderAge() || CameraSettings.isMagicMirrorOn() || CameraSettings.isTiltShiftOn() || CameraSettings.isUltraPixelOn()) {
            return false;
        }
        if (this.mCamera2Device != null && this.mCamera2Device.isNeedPreviewThumbnail()) {
            z = true;
        }
        return z;
    }

    private void enterAsdScene(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (i == 0) {
            topAlert.alertFlash(0, false, false);
        } else if (i != 9) {
            switch (i) {
                case 4:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_too_close_hint, 4);
                        return;
                    }
                    return;
                case 5:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_too_far_hint, 4);
                        return;
                    }
                    return;
                case 6:
                    if (!this.m3ALocked) {
                        updateTipMessage(6, R.string.portrait_mode_lowlight_hint, 4);
                        return;
                    }
                    return;
                case 7:
                    if (!this.m3ALocked) {
                        setPortraitSuccessHintVisible(0);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else {
            String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
            if ("3".equals(componentValue)) {
                topAlert.alertFlash(0, false, false);
                updatePreferenceInWorkThread(10);
            } else if (ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue)) {
                topAlert.alertFlash(0, false, false);
                Log.d(TAG, "enterAsdScene(): turn off HDR as FLASH has higher priority than HDR");
                onHDRSceneChanged(false);
                updatePreferenceInWorkThread(10);
            }
        }
    }

    private void exitAsdScene(int i) {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (i == 0) {
            String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
            if (!"1".equals(componentValue) && !ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON.equals(componentValue) && !"2".equals(componentValue)) {
                topAlert.alertFlash(8, false, false);
            }
        } else if (i != 9) {
            switch (i) {
                case 4:
                case 5:
                case 6:
                    if (!this.m3ALocked) {
                        hideTipMessage(0);
                        return;
                    }
                    return;
                case 7:
                    if (!this.m3ALocked) {
                        setPortraitSuccessHintVisible(8);
                        return;
                    }
                    return;
                default:
                    return;
            }
        } else {
            String componentValue2 = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
            if ("3".equals(componentValue2) || ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO.equals(componentValue2)) {
                topAlert.alertFlash(8, false, false);
            }
            updatePreferenceInWorkThread(10);
        }
    }

    private CameraSize getBestSubPictureSize(int i, boolean z, CameraSize cameraSize) {
        int i2 = z ? Camera2DataContainer.getInstance().getAuxFrontCameraId() : DataRepository.dataItemRunning().isSwitchOn("pref_ultra_wide_bokeh_enabled") ? Camera2DataContainer.getInstance().getUltraWideCameraId() : Camera2DataContainer.getInstance().getAuxCameraId();
        CameraSize cameraSize2 = null;
        List supportedOutputSize = this.mCameraCapabilities.getSupportedOutputSize(i);
        CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(i2);
        if (capabilities != null) {
            List supportedOutputSize2 = capabilities.getSupportedOutputSize(i);
            List supportedHighResolutionOutputSize = capabilities.getSupportedHighResolutionOutputSize(i);
            if (supportedHighResolutionOutputSize.size() > 0) {
                supportedOutputSize2.addAll(supportedHighResolutionOutputSize);
            }
            ArrayList arrayList = new ArrayList(0);
            for (int i3 = 0; i3 < supportedOutputSize2.size(); i3++) {
                CameraSize cameraSize3 = (CameraSize) supportedOutputSize2.get(i3);
                if (cameraSize3.compareTo(cameraSize) <= 0 && supportedOutputSize.contains(cameraSize3)) {
                    arrayList.add(cameraSize3);
                }
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getBestSubPictureSize: matchSizes = ");
            sb.append(arrayList);
            Log.d(str, sb.toString());
            cameraSize2 = PictureSizeManager.getBestPictureSize((List<CameraSize>) arrayList);
        }
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("Camera ");
        sb2.append(i2);
        sb2.append("'s size is ");
        sb2.append(z ? "frontSubSize: " : "backSubSize: ");
        sb2.append(cameraSize2);
        Log.d(str2, sb2.toString());
        return cameraSize2;
    }

    private String getCalibrationDataFileName(int i) {
        return isFrontCamera() ? "front_dual_camera_caldata.bin" : i == Camera2DataContainer.getInstance().getUltraWideBokehCameraId() ? "back_dual_camera_caldata_wu.bin" : "back_dual_camera_caldata.bin";
    }

    private int getCountDownTimes(int i) {
        int timerDurationSeconds = this.mBroadcastIntent != null ? CameraIntentManager.getInstance(this.mBroadcastIntent).getTimerDurationSeconds() : this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
        if (timerDurationSeconds != -1) {
            if (this.mBroadcastIntent != null) {
                this.mBroadcastIntent.removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
            } else {
                this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
            }
            if (timerDurationSeconds != 0) {
                return timerDurationSeconds != 5 ? 3 : 5;
            }
            return 0;
        } else if (i != 100 || !CameraSettings.isHandGestureOpen()) {
            return CameraSettings.getCountDownTimes();
        } else {
            int countDownTimes = CameraSettings.getCountDownTimes();
            if (countDownTimes == 0) {
                countDownTimes = 3;
            }
            return countDownTimes;
        }
    }

    /* access modifiers changed from: private */
    public String getCurrentAiSceneName() {
        int i = this.mCurrentAiScene;
        if (this.mModuleIndex != 163 && this.mModuleIndex != 167) {
            return null;
        }
        String str = "off";
        if (!CameraSettings.getAiSceneOpen(this.mModuleIndex)) {
            return str;
        }
        String str2 = "未知";
        if (i == -1) {
            i = this.isSilhouette ? 24 : 23;
        }
        TypedArray obtainTypedArray = getResources().obtainTypedArray(R.array.ai_scene_names);
        String string = (i < 0 || i >= obtainTypedArray.length()) ? str2 : obtainTypedArray.getString(i);
        obtainTypedArray.recycle();
        return string;
    }

    /* access modifiers changed from: private */
    public DeviceWatermarkParam getDeviceWaterMarkParam() {
        float f;
        float f2;
        float f3;
        float resourceFloat;
        float resourceFloat2;
        float resourceFloat3;
        boolean isDualCameraWaterMarkOpen = CameraSettings.isDualCameraWaterMarkOpen();
        boolean isFrontCameraWaterMarkOpen = CameraSettings.isFrontCameraWaterMarkOpen();
        if (isDualCameraWaterMarkOpen) {
            resourceFloat = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_size_ratio, 0.0f);
            resourceFloat2 = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_x_ratio, 0.0f);
            resourceFloat3 = CameraSettings.getResourceFloat(R.dimen.dualcamera_watermark_padding_y_ratio, 0.0f);
        } else if (isFrontCameraWaterMarkOpen) {
            resourceFloat = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_size_ratio, 0.0f);
            resourceFloat2 = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_x_ratio, 0.0f);
            resourceFloat3 = CameraSettings.getResourceFloat(R.dimen.frontcamera_watermark_padding_y_ratio, 0.0f);
        } else {
            f3 = 0.0f;
            f2 = 0.0f;
            f = 0.0f;
            DeviceWatermarkParam deviceWatermarkParam = new DeviceWatermarkParam(isDualCameraWaterMarkOpen, isFrontCameraWaterMarkOpen, CameraSettings.getDualCameraWaterMarkFilePathVendor(), f3, f2, f);
            return deviceWatermarkParam;
        }
        f = resourceFloat3;
        f2 = resourceFloat2;
        f3 = resourceFloat;
        DeviceWatermarkParam deviceWatermarkParam2 = new DeviceWatermarkParam(isDualCameraWaterMarkOpen, isFrontCameraWaterMarkOpen, CameraSettings.getDualCameraWaterMarkFilePathVendor(), f3, f2, f);
        return deviceWatermarkParam2;
    }

    private String getManualValue(String str, String str2) {
        return ModuleManager.isManualModule() ? CameraSettingPreferences.instance().getString(str, str2) : str2;
    }

    /* access modifiers changed from: private */
    public PictureInfo getPictureInfo() {
        PictureInfo bokehFrontCamera = new PictureInfo().setFrontMirror(isFrontMirror()).setSensorType(isFrontCamera()).setBokehFrontCamera(isBokehFrontCamera());
        if (isPortraitMode()) {
            bokehFrontCamera.setAiEnabled(this.mAiSceneEnabled);
            bokehFrontCamera.setAiType(this.mCurrentAiScene);
        }
        bokehFrontCamera.end();
        return bokehFrontCamera;
    }

    private String getPrefix() {
        return isLivePhotoStarted() ? Storage.LIVE_SHOT_PREFIX : "";
    }

    private String getRequestFlashMode() {
        if (isSupportSceneMode()) {
            String flashModeByScene = CameraSettings.getFlashModeByScene(this.mSceneMode);
            if (!TextUtils.isEmpty(flashModeByScene)) {
                return flashModeByScene;
            }
        }
        if (!this.mMutexModePicker.isSupportedFlashOn() && !this.mMutexModePicker.isSupportedTorch()) {
            return "0";
        }
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (this.mCurrentAsdScene == 9) {
            if (componentValue.equals("3")) {
                return "2";
            }
            if (componentValue.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
                return ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_ON;
            }
        }
        return componentValue;
    }

    /* access modifiers changed from: private */
    public String getSuffix() {
        return !this.mMutexModePicker.isNormal() ? this.mMutexModePicker.getSuffix() : "";
    }

    /* access modifiers changed from: private */
    public static String getTiltShiftMode() {
        if (CameraSettings.isTiltShiftOn()) {
            return DataRepository.dataItemRunning().getComponentRunningTiltValue().getComponentValue(160);
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void handleUpdateFaceView(boolean z, boolean z2) {
        boolean isFrontCamera = isFrontCamera();
        if (!z) {
            this.mMainProtocol.updateFaceView(z, z2, isFrontCamera, false, -1);
        } else if ((this.mFaceDetectionStarted || isFaceBeautyMode()) && 1 != this.mCamera2Device.getFocusMode()) {
            this.mMainProtocol.updateFaceView(z, true, isFrontCamera, true, this.mCameraDisplayOrientation);
        }
    }

    private void hidePostCaptureAlert() {
        enableCameraControls(true);
        if (this.mCamera2Device.isSessionReady()) {
            resumePreview();
        } else {
            startPreview();
        }
        this.mMainProtocol.setEffectViewVisible(true);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
    }

    private void hideSceneSelector() {
        this.mHandler.post($$Lambda$Camera2Module$qHFMpOoCCTSO6YFl_47nU6Q0rA.INSTANCE);
    }

    private void initAiSceneParser() {
        this.mFunctionParseAiScene = new FunctionParseAiScene(this.mModuleIndex);
        this.mAiSceneDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                Camera2Module.this.mAiSceneFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(this.mFunctionParseAiScene).filter(new PredicateFilterAiScene(this)).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<Integer>() {
            public void accept(Integer num) {
                Camera2Module.this.consumeAiSceneResult(num.intValue(), false);
            }
        });
    }

    private void initFlashAutoStateForTrack(boolean z) {
        this.mFlashAutoModeState = null;
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        if (!componentValue.equals("3") && !componentValue.equals(ComponentConfigFlash.FLASH_VALUE_SCREEN_LIGHT_AUTO)) {
            return;
        }
        if (this.mCurrentAsdScene == 9 || z) {
            this.mFlashAutoModeState = CameraStatUtil.AUTO_ON;
        } else {
            this.mFlashAutoModeState = CameraStatUtil.AUTO_OFF;
        }
    }

    private void initMetaParser() {
        this.mMetaDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
            public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                Camera2Module.this.mMetaDataFlowableEmitter = flowableEmitter;
            }
        }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(new FunctionParseAsdFace(this, isFrontCamera())).map(new FunctionParseAsdHdr(this)).map(new FunctionParseAsdUltraWide(this.mModuleIndex, this)).map(new FunctionParseAsdLivePhoto(this)).sample(500, TimeUnit.MILLISECONDS).observeOn(GlobalConstant.sCameraSetupScheduler).map(new FunctionParseAsdScene(this)).observeOn(AndroidSchedulers.mainThread()).onTerminateDetach().subscribe((Consumer<? super T>) new AsdSceneConsumer<Object>(this));
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

    /* access modifiers changed from: private */
    public boolean is3ALocked() {
        return this.m3ALocked;
    }

    private boolean isEnableQcfa() {
        boolean z = false;
        if (!this.mCameraCapabilities.isSupportedQcfa()) {
            return false;
        }
        if (isInQCFAMode()) {
            return true;
        }
        if (CameraSettings.isUltraPixelOn() && (b.iJ() || b.rK || b.rM)) {
            z = true;
        }
        return z;
    }

    private boolean isFaceBeautyOn(BeautyValues beautyValues) {
        if (beautyValues == null) {
            return false;
        }
        return beautyValues.isFaceBeautyOn();
    }

    /* access modifiers changed from: private */
    public boolean isFrontMirror() {
        if (!isFrontCamera()) {
            return false;
        }
        if (CameraSettings.isLiveShotOn()) {
            return true;
        }
        return CameraSettings.isFrontMirror();
    }

    private boolean isInCountDown() {
        return this.mCountdownDisposable != null && !this.mCountdownDisposable.isDisposed();
    }

    private boolean isInQCFAMode() {
        boolean z = false;
        if (getModuleIndex() != 163 && getModuleIndex() != 165) {
            return false;
        }
        if (this.mCameraCapabilities.isSupportedQcfa() && isFrontCamera()) {
            z = true;
        }
        return z;
    }

    private boolean isLaunchedByMainIntent() {
        String str;
        if (this.mActivity != null) {
            Intent intent = this.mActivity.getIntent();
            if (intent != null) {
                str = intent.getAction();
                return "android.intent.action.MAIN".equals(str);
            }
        }
        str = null;
        return "android.intent.action.MAIN".equals(str);
    }

    private static boolean isLiveShotAvailable(int i) {
        return i == 0 || i == 5 || i == 8;
    }

    private boolean isNeedRawStream() {
        if (ModuleManager.isManualModule() && CameraSettings.isEnableDNG()) {
            for (CameraSize cameraSize : this.mCameraCapabilities.getSupportedOutputSize(37)) {
                if (cameraSize.width == this.mPictureSize.width && cameraSize.height == this.mPictureSize.height) {
                    return true;
                }
            }
        }
        return false;
    }

    private boolean isParallelQueueFull() {
        boolean z = false;
        if (!this.mEnableParallelSession) {
            return false;
        }
        if (this.mActivity.getImageSaver().isSaveQueueFull()) {
            Log.d(TAG, "isParallelQueueFull: ImageSaver queue is full");
            return true;
        }
        LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder();
        if (localBinder != null) {
            z = localBinder.needWaitProcess();
        } else {
            Log.w(TAG, "isParallelQueueFull: NOTICE: CHECK WHY BINDER IS NULL!");
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isParallelQueueFull: isNeedWaitProcess:");
        sb.append(z);
        Log.w(str, sb.toString());
        return z;
    }

    private boolean isParallelSessionEnable() {
        return CameraSettings.isCameraParallelProcessEnable() && getModuleIndex() != 173 && getModuleIndex() != 167 && !isUltraWideBackCamera() && !this.mIsImageCaptureIntent;
    }

    private boolean isPortraitSuccessHintShowing() {
        return ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).isPortraitHintVisible();
    }

    private boolean isTriggerQcfaModeChange(boolean z, boolean z2) {
        if (!this.mCameraCapabilities.isSupportedQcfa()) {
            return false;
        }
        if ((this.mModuleIndex == 171 && isBokehFrontCamera()) || DataRepository.dataItemFeature().gd() > 0) {
            return false;
        }
        if (z) {
            if (!mIsBeautyFrontOn) {
                if (this.mOperatingMode == 32775) {
                    return true;
                }
                DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex);
            }
        } else if (z2) {
        }
        return false;
    }

    private boolean isUseSwMfnr() {
        if (CameraSettings.isGroupShotOn()) {
            Log.d(TAG, "GroupShot is on");
            return false;
        } else if (!DataRepository.dataItemFeature().ff() && (isUltraWideBackCamera() || isZoomRatioBetweenUltraAndWide())) {
            Log.d(TAG, "SwMfnr force off for ultra wide camera");
            return false;
        } else if (!CameraSettings.isMfnrSatEnable()) {
            Log.d(TAG, "Mfnr not enabled");
            return false;
        } else if (!DataRepository.dataItemFeature().fe()) {
            Log.d(TAG, "SwMfnr is not supported");
            return false;
        } else if (!this.mMutexModePicker.isNormal()) {
            Log.d(TAG, "Mutex mode is not normal");
            return false;
        } else if (DataRepository.dataItemFeature().ff() && this.mModuleIndex != 167 && this.mModuleIndex != 173) {
            Log.d(TAG, "For the devices does not have hardware MFNR, use software MFNR");
            return true;
        } else if (!isFrontCamera() || isDualFrontCamera()) {
            return false;
        } else {
            if (this.mOperatingMode == 32773 && b.iv()) {
                return true;
            }
            if (this.mOperatingMode != 32773 || b.iv()) {
                return DataRepository.dataItemFeature().isSupportUltraWide() || b.ry || b.rH;
            }
            return false;
        }
    }

    private void keepScreenOnAwhile() {
        this.mHandler.sendEmptyMessageDelayed(17, 1000);
    }

    static /* synthetic */ void lambda$hideSceneSelector$2() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null) {
            topAlert.alertAiSceneSelector(8);
        }
    }

    public static /* synthetic */ void lambda$onFaceDetected$3(Camera2Module camera2Module, CameraHardwareFace[] cameraHardwareFaceArr) {
        if (cameraHardwareFaceArr.length > 0) {
            if (!camera2Module.mIsFaceConflict) {
                camera2Module.mIsFaceConflict = true;
                camera2Module.showOrHideChip(false);
            }
        } else if (camera2Module.mIsFaceConflict) {
            camera2Module.mIsFaceConflict = false;
            camera2Module.showOrHideChip(true);
        }
    }

    public static /* synthetic */ void lambda$onLongPress$5(Camera2Module camera2Module, float f, float f2, int i, int i2, int i3) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onOptionClick: which = ");
        sb.append(i3);
        Log.d(str, sb.toString());
        CameraStatUtil.trackGoogleLensPickerValue(i3 == 0);
        switch (i3) {
            case 0:
                DataRepository.dataItemGlobal().editor().putBoolean(CameraSettings.KEY_GOOGLE_LENS_OOBE, true).apply();
                DataRepository.dataItemGlobal().editor().putString(CameraSettings.KEY_LONG_PRESS_VIEWFINDER, camera2Module.getString(R.string.pref_camera_long_press_viewfinder_default)).apply();
                LensAgent.getInstance().onFocusChange(2, f / ((float) Util.sWindowWidth), f2 / ((float) Util.sWindowHeight));
                return;
            case 1:
                DataRepository.dataItemGlobal().editor().putString(CameraSettings.KEY_LONG_PRESS_VIEWFINDER, camera2Module.getString(R.string.pref_camera_long_press_viewfinder_lock_ae_af)).apply();
                DataRepository.dataItemGlobal().editor().putBoolean(CameraSettings.KEY_EN_FIRST_CHOICE_LOCK_AE_AF_TOAST, true).apply();
                camera2Module.onSingleTapUp(i, i2, true);
                if (camera2Module.m3ALockSupported) {
                    camera2Module.lockAEAF();
                }
                camera2Module.mMainProtocol.performHapticFeedback(0);
                return;
            default:
                return;
        }
    }

    public static /* synthetic */ void lambda$onPause$7(Camera2Module camera2Module) {
        if (camera2Module.mLensApi != null && camera2Module.mIsLensServiceBound) {
            Log.d(TAG, "Unbind Lens service: E");
            camera2Module.mIsLensServiceBound = false;
            try {
                camera2Module.mLensApi.onPause();
            } catch (Exception e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Unknown error when pause LensAPI->");
                sb.append(e.getMessage());
                Log.d(str, sb.toString());
            }
            Log.d(TAG, "Unbind Lens service: X");
        }
    }

    public static /* synthetic */ void lambda$onResume$6(Camera2Module camera2Module) {
        if (camera2Module.mLensApi != null && !camera2Module.mIsLensServiceBound && !camera2Module.mActivity.isActivityPaused()) {
            Log.d(TAG, "Bind Lens service: E");
            camera2Module.mLensApi.onResume();
            camera2Module.mIsLensServiceBound = true;
            Log.d(TAG, "Bind Lens service: X");
        }
    }

    public static /* synthetic */ void lambda$onUltraWideChanged$11(Camera2Module camera2Module, boolean z, int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("isOpenUltraWide: ");
        sb.append(z);
        sb.append("; type: ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (camera2Module.mIsGoogleLensAvailable) {
            camera2Module.mIsUltraWideConflict = z;
            camera2Module.showOrHideChip(!z);
        }
        BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
        if (bottomPopupTips != null) {
            if (!camera2Module.isZoomRatioBetweenUltraAndWide() || !bottomPopupTips.containTips(R.string.ultra_wide_recommend_tip_hint)) {
                if (z) {
                    if (171 != camera2Module.getModuleIndex()) {
                        if (i == 2) {
                            camera2Module.trackAISceneChanged(camera2Module.mModuleIndex, 36);
                        }
                        bottomPopupTips.showTips(14, R.string.ultra_wide_recommend_tip_hint, 7);
                    } else {
                        return;
                    }
                } else if (bottomPopupTips.containTips(R.string.ultra_wide_recommend_tip_hint)) {
                    bottomPopupTips.directlyHideTips();
                }
                return;
            }
            bottomPopupTips.directlyHideTips();
        }
    }

    public static /* synthetic */ void lambda$registerProtocol$0(Camera2Module camera2Module) {
        camera2Module.mIsFaceConflict = false;
        camera2Module.mIsAiConflict = false;
        camera2Module.mIsUltraWideConflict = false;
        camera2Module.showOrHideChip(true);
    }

    public static /* synthetic */ void lambda$startNormalCapture$4(Camera2Module camera2Module, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCaptureCompleted and enable shot = ");
        sb.append(z);
        Log.d(str, sb.toString());
        if (DataRepository.dataItemFeature().gt()) {
            if (!camera2Module.isKeptBitmapTexture() && !camera2Module.mMultiSnapStatus && z) {
                camera2Module.setCameraState(1);
                camera2Module.enableCameraControls(true);
            }
            if (camera2Module.mCamera2Device != null) {
                camera2Module.mCamera2Device.unRegisterCaptureCallback();
            }
        }
    }

    public static /* synthetic */ void lambda$unRegisterProtocol$1(Camera2Module camera2Module) {
        camera2Module.showOrHideChip(false);
        camera2Module.mIsFaceConflict = false;
        camera2Module.mIsUltraWideConflict = false;
        camera2Module.mIsAiConflict = false;
    }

    public static /* synthetic */ void lambda$updateDecodePreview$10(Camera2Module camera2Module, int i, Image image, Camera2Proxy camera2Proxy, int i2) {
        if (!camera2Module.mPaused) {
            LensAgent.getInstance().onNewImage(image, i);
        }
    }

    private void lockAEAF() {
        Log.d(TAG, "lockAEAF");
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(true);
        }
        this.m3ALocked = true;
    }

    private boolean needQuickShot() {
        boolean z = false;
        if (this.mBlockQuickShot || this.mIsImageCaptureIntent || !CameraSettings.isCameraQuickShotEnable()) {
            return false;
        }
        if (enablePreviewAsThumbnail() && ((this.mModuleIndex == 163 || this.mModuleIndex == 165) && getZoomRatio() == 1.0f && !CameraSettings.isFrontCamera() && !CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && !this.mCamera2Device.isNeedFlashOn() && !CameraSettings.isUltraPixelOn() && !CameraSettings.isLiveShotOn() && (this.mBeautyValues == null || !this.mBeautyValues.isFaceBeautyOn()))) {
            z = true;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("needQuickShot bRet:");
        sb.append(z);
        Log.d(str, sb.toString());
        return z;
    }

    private boolean needShowThumbProgressImmediately() {
        return Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) > 250000000 && this.mModuleIndex != 173;
    }

    private void onShutter(boolean z) {
        if (getCameraState() == 0) {
            Log.d(TAG, "onShutter: preview stopped");
            return;
        }
        this.mShutterCallbackTime = System.currentTimeMillis();
        this.mShutterLag = this.mShutterCallbackTime - this.mCaptureStartTime;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("mShutterLag = ");
        sb.append(this.mShutterLag);
        sb.append("ms");
        Log.v(str, sb.toString());
        if (this.mEnableParallelSession || z) {
            this.mEnabledPreviewThumbnail = true;
            this.mActivity.getCameraScreenNail().requestReadPixels();
        } else if (this.mReceivedJpegCallbackNum == 0) {
            if (enablePreviewAsThumbnail()) {
                this.mEnabledPreviewThumbnail = true;
                this.mActivity.getCameraScreenNail().requestReadPixels();
            } else if (this.mModuleIndex != 173) {
                updateThumbProgress(false);
                animateCapture();
                playCameraSound(0);
            }
        }
    }

    private void parseIntent() {
        CameraIntentManager cameraIntentManager = this.mActivity.getCameraIntentManager();
        this.mIsImageCaptureIntent = cameraIntentManager.isImageCaptureIntent();
        if (this.mIsImageCaptureIntent) {
            this.mSaveUri = cameraIntentManager.getExtraSavedUri();
            this.mCropValue = cameraIntentManager.getExtraCropValue();
            this.mIsSaveCaptureImage = cameraIntentManager.getExtraShouldSaveCapture().booleanValue();
            this.mQuickCapture = cameraIntentManager.isQuickCapture().booleanValue();
        }
    }

    private void prepareEffectProcessor(int i) {
    }

    private void prepareMultiCapture() {
        Log.d(TAG, "prepareMultiCapture");
        this.mMultiSnapStatus = true;
        this.mMultiSnapStopRequest = false;
        Util.clearMemoryLimit();
        prepareNormalCapture();
        CameraCapabilities cameraCapabilities = this.mCameraCapabilities;
        this.mTotalJpegCallbackNum = CameraCapabilities.getBurstShootCount();
        this.mHandler.removeMessages(49);
        if (!is3ALocked()) {
            this.mFocusManager.onShutter();
        }
    }

    private void prepareNormalCapture() {
        Log.d(TAG, "prepareNormalCapture");
        initFlashAutoStateForTrack(this.mCamera2Device.isNeedFlashOn());
        this.mEnabledPreviewThumbnail = false;
        boolean z = true;
        this.mTotalJpegCallbackNum = 1;
        this.mReceivedJpegCallbackNum = 0;
        this.mCaptureStartTime = System.currentTimeMillis();
        ScenarioTrackUtil.trackCaptureTimeStart(isFrontCamera(), this.mModuleIndex);
        this.mLastCaptureTime = this.mCaptureStartTime;
        setCameraState(3);
        this.mJpegRotation = Util.getJpegRotation(this.mBogusCameraId, this.mOrientation);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("prepareNormalCapture: mOrientation = ");
        sb.append(this.mOrientation);
        sb.append(", mJpegRotation = ");
        sb.append(this.mJpegRotation);
        Log.d(str, sb.toString());
        this.mCamera2Device.setJpegRotation(this.mJpegRotation);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        this.mCamera2Device.setGpsLocation(currentLocation);
        this.mLocation = currentLocation;
        updateFrontMirror();
        updateBeauty();
        updateShotDetermine();
        Camera2Proxy camera2Proxy = this.mCamera2Device;
        StringBuilder sb2 = new StringBuilder();
        sb2.append(getPrefix());
        sb2.append(Util.createJpegName(System.currentTimeMillis()));
        sb2.append(getSuffix());
        String generateFilepath = Storage.generateFilepath(sb2.toString());
        if (this.mMultiSnapStatus || !this.mEnableParallelSession) {
            z = false;
        }
        camera2Proxy.setShotSavePath(generateFilepath, z);
        if (!enablePreviewAsThumbnail() || this.mMutexModePicker.isHdr()) {
            this.mQuickShotAnimateEnable = false;
        } else {
            this.mQuickShotAnimateEnable = CameraSettings.isCameraQuickShotAnimateEnable();
        }
        setWaterMark();
        setPictureOrientation();
        updateJpegQuality();
        updateAlgorithmName();
        if (needShowThumbProgressImmediately()) {
            updateThumbProgress(false);
        }
        prepareSuperNight();
    }

    private void prepareSuperNight() {
        if (this.mModuleIndex == 173) {
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            recordState.onPrepare();
            recordState.onStart();
            this.mSuperNightDisposable = Observable.just(Integer.valueOf(300), Integer.valueOf(2000)).flatMap(new Function<Integer, ObservableSource<Integer>>() {
                public ObservableSource<Integer> apply(Integer num) throws Exception {
                    return Observable.just(num).delaySubscription((long) num.intValue(), TimeUnit.MILLISECONDS);
                }
            }).doOnDispose(new Action() {
                public void run() throws Exception {
                    Log.d(Camera2Module.TAG, "SuperNight: force trigger shutter animation, sound and post saving");
                    AndroidSchedulers.mainThread().scheduleDirect(new Runnable() {
                        public void run() {
                            try {
                                Camera2Module.this.mSuperNightEventConsumer.accept(Integer.valueOf(2000));
                            } catch (Exception e) {
                            }
                        }
                    });
                }
            }).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mSuperNightEventConsumer);
        }
    }

    private void previewWhenSessionSuccess() {
        setCameraState(1);
        this.mFaceDetectionEnabled = false;
        updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_ON_PREVIEW_SUCCESS);
        if (ModuleManager.isManualModule()) {
            updatePreferenceInWorkThread(UpdateConstant.CAMERA_TYPES_MANUALLY);
        }
    }

    private void releaseEffectProcessor() {
    }

    private void resetAiSceneInHdrOrFlashOn() {
        if (this.mAiSceneEnabled && !this.isResetFromMutex && this.mCurrentAiScene != 0) {
            if (this.mCurrentAiScene == -1 || this.mCurrentAiScene == 10) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        Camera2Module.this.consumeAiSceneResult(0, true);
                        Camera2Module.this.isResetFromMutex = true;
                    }
                });
            }
        }
    }

    private void resetAsdSceneInHdrOrFlashChange() {
        if (b.it() && isFrontCamera() && this.mCurrentAsdScene != -1 && this.mCurrentAsdScene == 9) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    Camera2Module.this.consumeAsdSceneResult(-1);
                }
            });
        }
    }

    private void resetGradienter() {
        if (CameraSettings.isGradienterOn()) {
            this.mActivity.getSensorStateManager().setGradienterEnabled(false);
        }
    }

    private void resetScreenOn() {
        if (this.mHandler != null) {
            this.mHandler.removeMessages(17);
            this.mHandler.removeMessages(2);
        }
    }

    private void resumePreviewInWorkThread() {
        updatePreferenceInWorkThread(new int[0]);
    }

    private void setAiSceneEffect(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAiSceneEffect: ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (!DataRepository.dataItemFeature().fq() || !CameraSettings.isBackCamera() || i != 25) {
            if (CameraSettings.isFrontCamera() || isPortraitMode()) {
                if (i != 0) {
                    Log.d(TAG, "setAiSceneEffect: front camera or portrait mode nonsupport!");
                    return;
                } else if (CameraSettings.getPortraitLightingPattern() != 0) {
                    Log.d(TAG, "setAiSceneEffect: scene = 0 but portrait lighting is on...");
                    return;
                }
            }
            ArrayList filterInfo = EffectController.getInstance().getFilterInfo(5);
            if (i < 0 || i > filterInfo.size()) {
                Log.e(TAG, "setAiSceneEffect: scene unknown!");
                return;
            }
            int shaderEffect = CameraSettings.getShaderEffect();
            if (FilterInfo.getCategory(shaderEffect) == 5 || shaderEffect == FilterInfo.FILTER_ID_NONE) {
                int id = ((FilterInfo) filterInfo.get(i)).getId();
                EffectController.getInstance().setAiSceneEffect(id);
                this.mHasAiSceneFilterEffect = id != FilterInfo.FILTER_ID_NONE;
                if (EffectController.getInstance().hasEffect()) {
                    prepareEffectProcessor(id);
                }
                return;
            }
            return;
        }
        Log.d(TAG, "supportAi30: AI 3.0 back camera in HUMAN SCENE not apply filter!");
    }

    private void setEffectFilter(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setEffectFilter: ");
        sb.append(i);
        Log.d(str, sb.toString());
        EffectController.getInstance().setEffect(i);
        this.mFilterId = i;
        if (this.mCircularMediaRecorder != null) {
            this.mCircularMediaRecorder.setFilterId(i);
        }
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(i);
        }
    }

    private void setLightingEffect() {
        int shaderEffect = CameraSettings.getShaderEffect();
        if (FilterInfo.getCategory(shaderEffect) == 5 || shaderEffect == FilterInfo.FILTER_ID_NONE) {
            int portraitLightingPattern = CameraSettings.getPortraitLightingPattern();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setLightingEffect: ");
            sb.append(portraitLightingPattern);
            Log.d(str, sb.toString());
            int id = ((FilterInfo) EffectController.getInstance().getFilterInfo(6).get(portraitLightingPattern)).getId();
            EffectController.getInstance().setLightingEffect(id);
            if (EffectController.getInstance().hasEffect()) {
                prepareEffectProcessor(id);
            }
        }
    }

    /* access modifiers changed from: private */
    public void setOrientation(int i, int i2) {
        if (i != -1) {
            this.mOrientation = i;
            EffectController.getInstance().setOrientation(Util.getShootOrientation(this.mActivity, this.mOrientation));
            checkActivityOrientation();
            if (this.mOrientationCompensation != i2) {
                this.mOrientationCompensation = i2;
                setOrientationParameter();
            }
        }
    }

    /* access modifiers changed from: private */
    public void setOrientationParameter() {
        if (!isDeparted()) {
            if (!(this.mCamera2Device == null || this.mOrientation == -1)) {
                if (getCameraState() == 1) {
                    updatePreferenceInWorkThread(35);
                } else {
                    this.mCamera2Device.setDeviceOrientation(this.mOrientation);
                }
            }
            if (this.mCircularMediaRecorder != null) {
                this.mCircularMediaRecorder.setOrientationHint(this.mOrientationCompensation);
            }
        }
    }

    private void setPictureOrientation() {
        this.mShootRotation = this.mActivity.getSensorStateManager().isDeviceLying() ? -1.0f : this.mDeviceRotation;
        this.mShootOrientation = this.mOrientation == -1 ? 0 : this.mOrientation;
    }

    private void setPortraitSuccessHintVisible(int i) {
        ((BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175)).setPortraitHintVisible(i);
    }

    private boolean setSceneMode(String str) {
        int parseInt = Util.parseInt(str, -1);
        this.mCamera2Device.setSceneMode(parseInt);
        if (!Util.isSupported(parseInt, this.mCameraCapabilities.getSupportedSceneModes())) {
            return false;
        }
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("sceneMode=");
        sb.append(str);
        Log.d(str2, sb.toString());
        return true;
    }

    private void setVideoSize(int i, int i2) {
        if (this.mCameraDisplayOrientation % 180 == 0) {
            this.mVideoSize = new CameraSize(i, i2);
        } else {
            this.mVideoSize = new CameraSize(i2, i);
        }
    }

    private void setWaterMark() {
        if (this.mMultiSnapStatus || this.mModuleIndex == 165 || CameraSettings.isGradienterOn() || CameraSettings.getShaderEffect() != FilterInfo.FILTER_ID_NONE || this.mHasAiSceneFilterEffect || CameraSettings.isTiltShiftOn() || DataRepository.dataItemFeature().fn()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
            this.mCamera2Device.setTimeWaterMarkEnable(false);
            return;
        }
        if (CameraSettings.isDualCameraWaterMarkOpen()) {
            this.mCamera2Device.setDualCamWaterMarkEnable(true);
        } else {
            this.mCamera2Device.setDualCamWaterMarkEnable(false);
        }
        if (CameraSettings.isTimeWaterMarkOpen()) {
            this.mCamera2Device.setTimeWaterMarkEnable(true);
            this.mCaptureWaterMarkStr = Util.getTimeWatermark();
            this.mCamera2Device.setTimeWatermarkValue(this.mCaptureWaterMarkStr);
        } else {
            this.mCaptureWaterMarkStr = null;
            this.mCamera2Device.setTimeWaterMarkEnable(false);
        }
    }

    private boolean shouldApplyNormalWideLDC() {
        if (CameraSettings.shouldNormalWideLDCBeVisibleInMode(this.mModuleIndex) && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && this.mActualCameraId != Camera2DataContainer.getInstance().getUltraWideCameraId() && !CameraSettings.isUltraPixelOn() && !isZoomRatioBetweenUltraAndWide()) {
            return CameraSettings.isNormalWideLDCEnabled();
        }
        return false;
    }

    private boolean shouldApplyUltraWideLDC() {
        if (!CameraSettings.shouldUltraWideLDCBeVisibleInMode(this.mModuleIndex)) {
            return false;
        }
        if (CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
            return true;
        }
        if (this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isUltraWideLDCEnabled();
        }
        if (isZoomRatioBetweenUltraAndWide()) {
            return CameraSettings.isUltraWideLDCEnabled();
        }
        return false;
    }

    private boolean shouldChangeAiScene(int i) {
        if (isDoingAction() || !isAlive() || this.mCurrentDetectedScene == i || System.currentTimeMillis() - this.mLastChangeSceneTime <= 300) {
            return false;
        }
        this.mCurrentDetectedScene = i;
        this.mLastChangeSceneTime = System.currentTimeMillis();
        return true;
    }

    private boolean shouldDoMultiFrameCapture() {
        boolean z = false;
        if (this.mIsMoonMode) {
            Log.d(TAG, "shouldDoMultiFrameCapture: return false in moon mode");
            return false;
        }
        if (this.mMutexModePicker.isHdr() || this.mShouldDoMFNR || this.mMutexModePicker.isSuperResolution() || CameraSettings.isGroupShotOn()) {
            z = true;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("shouldDoMultiFrameCapture: ");
        sb.append(z);
        Log.d(str, sb.toString());
        return z;
    }

    private boolean showMoonMode(boolean z) {
        if (CameraSettings.isUltraWideConfigOpen(getModuleIndex()) || CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
            return false;
        }
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert == null) {
            return false;
        }
        this.mEnteringMoonMode = true;
        topAlert.alertMoonModeSelector(0, z);
        if (!z) {
            updateMoonNight();
        } else {
            updateMoon(true);
        }
        return true;
    }

    private void showPostCaptureAlert() {
        enableCameraControls(false);
        this.mFocusManager.removeMessages();
        stopFaceDetection(true);
        pausePreview();
        this.mMainProtocol.setEffectViewVisible(false);
        ((BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160)).delegateEvent(6);
        resetMetaDataManager();
    }

    private void startCount(final int i, int i2) {
        if (checkShutterCondition()) {
            setTriggerMode(i2);
            tryRemoveCountDownMessage();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("startCount: ");
            sb.append(i);
            Log.d(str, sb.toString());
            Observable.interval(1, TimeUnit.SECONDS).take((long) i).observeOn(AndroidSchedulers.mainThread()).subscribe((Observer<? super T>) new Observer<Long>() {
                public void onComplete() {
                    Camera2Module.this.tryRemoveCountDownMessage();
                    Camera2Module.this.onShutterButtonFocus(true, 3);
                    Camera2Module.this.startNormalCapture(Camera2Module.this.getTriggerMode());
                    Camera2Module.this.onShutterButtonFocus(false, 0);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.reInitAlert(true);
                    }
                }

                public void onError(Throwable th) {
                }

                public void onNext(Long l) {
                    int intValue = i - (l.intValue() + 1);
                    if (intValue > 0) {
                        Camera2Module.this.playCameraSound(5);
                        Camera2Module.this.mMainProtocol.showDelayNumber(intValue);
                    }
                }

                public void onSubscribe(Disposable disposable) {
                    Camera2Module.this.mCountdownDisposable = disposable;
                    Camera2Module.this.playCameraSound(7);
                    TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (topAlert != null) {
                        topAlert.hideAlert();
                    }
                    Camera2Module.this.mMainProtocol.clearFocusView(7);
                    Camera2Module.this.mMainProtocol.showDelayNumber(i);
                }
            });
        }
    }

    /* access modifiers changed from: private */
    public void startLensActivity() {
        if (b.fY() || !Util.isGlobalVersion()) {
            Log.d(TAG, "start ai lens");
            try {
                Intent intent = new Intent();
                intent.setAction("android.media.action.XIAOAI_CONTROL");
                intent.setPackage(CameraSettings.AI_LENS_PACKAGE);
                intent.putExtra("preview_width", this.mPreviewSize.width);
                intent.putExtra("preview_height", this.mPreviewSize.height);
                getActivity().startActivity(intent);
                getActivity().overridePendingTransition(R.anim.anim_fade_in, R.anim.anim_fade_out);
            } catch (Exception e) {
                Log.e(TAG, "onClick: occur a exception", e);
            }
        } else if (this.mLensApi != null && this.mLensStatus == 0) {
            this.mLensApi.launchLensActivity(this.mActivity, 0);
        }
    }

    private void startLiveShotAnimation() {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (!(this.mCircularMediaRecorder == null || this.mHandler == null)) {
                this.mHandler.post(new Runnable() {
                    public void run() {
                        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                        if (topAlert != null) {
                            topAlert.startLiveShotAnimation();
                        }
                    }
                });
            }
        }
    }

    /* access modifiers changed from: private */
    public void startNormalCapture(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startNormalCapture mode -> ");
        sb.append(i);
        Log.d(str, sb.toString());
        prepareNormalCapture();
        if (!CameraSettings.isGroupShotOn() || isParallelSessionEnable()) {
            this.mHandler.sendEmptyMessageDelayed(50, calculateTimeout(this.mModuleIndex));
            this.mCamera2Device.setQuickShotAnimation(this.mQuickShotAnimateEnable);
            this.mCamera2Device.takePicture(this, this.mActivity.getImageSaver());
            if (needQuickShot()) {
                Log.d(TAG, "startNormalCapture force set CameraStateConstant.IDLE");
                setCameraState(1);
                enableCameraControls(true);
            } else {
                this.mBlockQuickShot = true;
            }
            if (isFrontCamera() && DataRepository.dataItemFeature().gt() && 32775 != this.mOperatingMode) {
                this.mCamera2Device.registerCaptureCallback(new CaptureCallback() {
                    public final void onCaptureCompleted(boolean z) {
                        Camera2Module.lambda$startNormalCapture$4(Camera2Module.this, z);
                    }
                });
                return;
            }
            return;
        }
        this.mCamera2Device.captureGroupShotPictures(this, this.mActivity.getImageSaver(), this.mTotalJpegCallbackNum, this.mActivity);
        this.mBlockQuickShot = true;
    }

    /* access modifiers changed from: private */
    public void stopMultiSnap() {
        Log.d(TAG, "stopMultiSnap: start");
        this.mHandler.removeMessages(49);
        if (this.mMultiSnapStatus) {
            this.mLastCaptureTime = System.currentTimeMillis();
            if (this.mCamera2Device != null && this.mMultiSnapStatus) {
                this.mCamera2Device.captureAbortBurst();
                this.mMultiSnapStatus = false;
            }
            int i = !this.mMutexModePicker.isUbiFocus() ? this.mReceivedJpegCallbackNum : 1;
            boolean z = !this.mMutexModePicker.isUbiFocus();
            trackGeneralInfo(i, z);
            trackPictureTaken(i, z, this.mLocation != null, getCurrentAiSceneName(), this.mEnteringMoonMode, this.mIsMoonMode);
            animateCapture();
            this.mUpdateImageTitle = false;
            this.mHandler.sendEmptyMessageDelayed(48, 800);
        }
    }

    private void trackAISceneChanged(int i, int i2) {
        CameraStatUtil.trackAISceneChanged(i, i2, getResources());
    }

    private void trackBeautyInfo(int i, boolean z, BeautyValues beautyValues) {
        CameraStatUtil.trackBeautyInfo(i, z ? CameraStat.VALUE_FRONT_CAMERA : CameraStat.VALUE_BACK_CAMERA, beautyValues);
    }

    private void trackManualInfo(int i) {
        CameraStatUtil.trackPictureTakenInManual(i, getManualValue(CameraSettings.KEY_WHITE_BALANCE, getString(R.string.pref_camera_whitebalance_default)), getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default)), getManualValue(CameraSettings.KEY_QC_ISO, getString(R.string.pref_camera_iso_default)), this.mModuleIndex);
        CameraStatUtil.trackUltraWideManualTaken(this.mModuleIndex);
    }

    private void unlockAEAF() {
        Log.d(TAG, "unlockAEAF");
        this.m3ALocked = false;
        if (this.mAeLockSupported) {
            this.mCamera2Device.unlockExposure();
            if (this.mUltraWideAELocked) {
                String focusMode = CameraSettings.getFocusMode();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unlockAEAF: focusMode = ");
                sb.append(focusMode);
                Log.d(str, sb.toString());
                setFocusMode(focusMode);
                this.mUltraWideAELocked = false;
            }
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
        }
    }

    private void updateAiScene() {
        if (this.mFunctionParseAiScene != null) {
            this.mFunctionParseAiScene.resetScene();
        }
        this.mCurrentAiScene = 0;
        this.mAiSceneEnabled = CameraSettings.getAiSceneOpen(this.mModuleIndex);
        if (isFrontCamera() && this.mActivity.isScreenSlideOff()) {
            this.mAiSceneEnabled = false;
        }
        this.mCamera2Device.setASD(this.mAiSceneEnabled);
        if ((isFrontCamera() && ModuleManager.isCapture()) || !this.mAiSceneEnabled) {
            this.mCamera2Device.setCameraAI30(this.mAiSceneEnabled);
        }
        setAiSceneEffect(0);
        if (this.mAiSceneEnabled) {
            this.mCamera2Device.setASDPeriod(300);
            return;
        }
        hideSceneSelector();
        updateHDRPreference();
        updateFlashPreference();
        updateBeauty();
    }

    private void updateAlgorithmName() {
        String str = !b.iB() ? this.mCamera2Device.isBokehEnabled() ? DataRepository.dataItemFeature().fX() > 0 ? Util.ALGORITHM_NAME_SOFT_PORTRAIT_ENCRYPTED : Util.ALGORITHM_NAME_SOFT_PORTRAIT : isPortraitMode() ? "portrait" : this.mMutexModePicker.getAlgorithmName() : null;
        this.mAlgorithmName = str;
    }

    private void updateBeauty() {
        if (this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 171) {
            if (this.mBeautyValues == null) {
                this.mBeautyValues = new BeautyValues();
            }
            CameraSettings.initBeautyValues(this.mBeautyValues, this.mModuleIndex);
            if (!DataRepository.dataItemConfig().getComponentConfigBeauty().isClosed(this.mModuleIndex) && this.mCurrentAiScene == 25 && !isFaceBeautyOn(this.mBeautyValues)) {
                ComponentRunningShine componentRunningShine = DataRepository.dataItemRunning().getComponentRunningShine();
                if (componentRunningShine.supportBeautyLevel()) {
                    this.mBeautyValues.mBeautyLevel = BeautyConstant.LEVEL_LOW;
                } else if (componentRunningShine.supportSmoothLevel()) {
                    this.mBeautyValues.mBeautySkinSmooth = 10;
                }
                Log.d(TAG, String.format(Locale.ENGLISH, "Human scene mode detected, auto set beauty level from %s to %s", new Object[]{BeautyConstant.LEVEL_CLOSE, this.mBeautyValues.mBeautyLevel}));
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("updateBeauty(): ");
            sb.append(this.mBeautyValues);
            Log.d(str, sb.toString());
            this.mCamera2Device.setBeautyValues(this.mBeautyValues);
            this.mIsBeautyBodySlimOn = this.mBeautyValues.isBeautyBodyOn();
            updateFaceAgeAnalyze();
        }
    }

    private void updateBokeh() {
        boolean z = false;
        boolean z2 = isFrontCamera() && !isBokehFrontCamera() && ((ModuleManager.isPortraitModule() && DataRepository.dataItemFeature().gC()) || (DataRepository.dataItemFeature().gE() && "on".equals(DataRepository.dataItemConfig().getComponentBokeh().getComponentValue(this.mModuleIndex))));
        this.mCamera2Device.setMiBokeh(z2);
        if (ModuleManager.isPortraitModule() && (isBackCamera() || isBokehFrontCamera())) {
            z = true;
        }
        this.mCamera2Device.setRearBokehEnable(z);
    }

    private void updateContrast() {
        this.mCamera2Device.setContrast(Integer.parseInt(getString(R.string.pref_camera_contrast_default)));
    }

    private void updateDecodePreview() {
        if (this.mIsGoogleLensAvailable) {
            int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("updateDecodePreview: getSensorOrientation = ");
            sb.append(sensorOrientation);
            Log.d(str, sb.toString());
            this.mCamera2Device.startPreviewCallback(new PreviewCallback(sensorOrientation) {
                private final /* synthetic */ int f$1;

                {
                    this.f$1 = r2;
                }

                public final void onPreviewFrame(Image image, Camera2Proxy camera2Proxy, int i) {
                    Camera2Module.lambda$updateDecodePreview$10(Camera2Module.this, this.f$1, image, camera2Proxy, i);
                }
            });
            return;
        }
        if (scanQRCodeEnabled() || b.ge()) {
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("updateDecodePreview: PreviewDecodeManager AlgorithmPreviewSize = ");
            sb2.append(this.mCamera2Device.getAlgorithmPreviewSize());
            Log.d(str2, sb2.toString());
            this.mCamera2Device.startPreviewCallback(PreviewDecodeManager.getInstance().getPreviewCallback());
            PreviewDecodeManager.getInstance().startDecode();
        }
    }

    private void updateDeviceOrientation() {
        this.mCamera2Device.setDeviceOrientation(this.mOrientation);
    }

    private void updateExposureTime() {
        this.mCamera2Device.setExposureTime(Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))));
        updateManualEvAdjust();
    }

    private void updateEyeLight() {
        if (isFrontCamera() && DataRepository.dataItemFeature().fD()) {
            this.mCamera2Device.setEyeLight(Integer.parseInt(CameraSettings.getEyeLightType()));
        }
    }

    private void updateFNumber() {
        this.mCamera2Device.setFNumber(CameraSettings.readFNumber());
    }

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0058  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x0067  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0071  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateFace() {
        boolean z;
        boolean z2;
        if (this.mMultiSnapStatus || this.mMutexModePicker.isUbiFocus()) {
            z2 = false;
        } else if (CameraSettings.isMagicMirrorOn() || CameraSettings.isPortraitModeBackOn() || CameraSettings.isGroupShotOn() || CameraSettings.showGenderAge()) {
            z2 = true;
            z = true;
            if (this.mMainProtocol != null) {
                MainContentProtocol mainContentProtocol = this.mMainProtocol;
                boolean z3 = !z2 || !z;
                mainContentProtocol.setSkipDrawFace(z3);
            }
            if (z2) {
                if (!this.mFaceDetectionEnabled) {
                    this.mFaceDetectionEnabled = true;
                    startFaceDetection();
                    return;
                }
                return;
            } else if (this.mFaceDetectionEnabled) {
                stopFaceDetection(true);
                this.mFaceDetectionEnabled = false;
                return;
            } else {
                return;
            }
        } else {
            z2 = DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default));
            if (CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn()) {
                z = false;
                if (this.mMainProtocol != null) {
                }
                if (z2) {
                }
            }
        }
        z = true;
        if (this.mMainProtocol != null) {
        }
        if (z2) {
        }
    }

    private void updateFaceAgeAnalyze() {
        this.mIsGenderAgeOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_show_gender_age_key");
        boolean z = this.mIsGenderAgeOn ? true : this.mBeautyValues != null ? isFaceBeautyOn(this.mBeautyValues) : false;
        this.mCamera2Device.setFaceAgeAnalyze(z);
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(FilterInfo.FILTER_ID_NONE);
        }
    }

    private void updateFaceScore() {
        this.mIsMagicMirrorOn = DataRepository.dataItemRunning().isSwitchOn("pref_camera_magic_mirror_key");
        this.mCamera2Device.setFaceScore(this.mIsMagicMirrorOn);
        if (EffectController.getInstance().hasEffect()) {
            prepareEffectProcessor(FilterInfo.FILTER_ID_NONE);
        }
    }

    private void updateFilter() {
        setEffectFilter(CameraSettings.getShaderEffect());
    }

    private void updateFocusArea() {
        if (this.mActivity != null && !this.mActivity.isActivityPaused() && isAlive()) {
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

    private void updateFocusMode() {
        String focusMode = this.mIsMoonMode ? this.mFocusManager.setFocusMode("manual") : this.mFocusManager.setFocusMode(CameraSettings.getFocusMode());
        setFocusMode(focusMode);
        if (CameraSettings.isFocusModeSwitching() && isBackCamera()) {
            CameraSettings.setFocusModeSwitching(false);
            this.mFocusManager.resetFocusStateIfNeeded();
        }
        if (focusMode.equals("manual")) {
            float minimumFocusDistance = (this.mCameraCapabilities.getMinimumFocusDistance() * ((float) CameraSettings.getFocusPosition())) / 1000.0f;
            if (this.mIsMoonMode) {
                minimumFocusDistance = 0.5f;
            }
            this.mCamera2Device.setFocusDistance(minimumFocusDistance);
        }
    }

    private void updateFpsRange() {
        Range[] supportedFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
        Range range = supportedFpsRange[0];
        int length = supportedFpsRange.length;
        for (int i = 0; i < length; i++) {
            Range range2 = supportedFpsRange[i];
            if (((Integer) range.getUpper()).intValue() < ((Integer) range2.getUpper()).intValue() || (range.getUpper() == range2.getUpper() && ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                range = range2;
            }
        }
        if (b.rD && CameraSettings.isPortraitModeBackOn()) {
            this.mCamera2Device.setFpsRange(new Range(Integer.valueOf(30), Integer.valueOf(30)));
        }
    }

    private void updateFrontMirror() {
        this.mCamera2Device.setFrontMirror(isFrontMirror());
    }

    private void updateHDR(String str) {
        if ("auto".equals(str)) {
            this.isDetectedInHDR = false;
        }
        int mutexHdrMode = getMutexHdrMode(str);
        stopObjectTracking(true);
        if (mutexHdrMode != 0) {
            this.mMutexModePicker.setMutexMode(mutexHdrMode);
        } else if (this.mMutexModePicker.isHdr()) {
            resetMutexModeManually();
        }
        if (isFrontCamera() && isTriggerQcfaModeChange(false, true)) {
            this.mHandler.sendEmptyMessage(44);
        }
    }

    private void updateISO() {
        String string = getString(R.string.pref_camera_iso_default);
        String manualValue = getManualValue(CameraSettings.KEY_QC_ISO, string);
        if (manualValue == null || manualValue.equals(string)) {
            this.mCamera2Device.setISO(0);
        } else {
            this.mCamera2Device.setISO(Math.min(Util.parseInt(manualValue, 0), this.mCameraCapabilities.getMaxIso()));
        }
        updateManualEvAdjust();
    }

    private void updateJpegQuality() {
        this.mCamera2Device.setJpegQuality(getJpegQuality(this.mMultiSnapStatus));
    }

    private void updateJpegThumbnailSize() {
        CameraSize jpegThumbnailSize = getJpegThumbnailSize();
        this.mCamera2Device.setJpegThumbnailSize(jpegThumbnailSize);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("thumbnailSize=");
        sb.append(jpegThumbnailSize);
        Log.d(str, sb.toString());
    }

    private void updateLiveShot() {
        if (DataRepository.dataItemFeature().fL() && this.mModuleIndex == 163) {
            if (CameraSettings.isLiveShotOn()) {
                startLiveShot();
            } else {
                stopLiveShot(false);
            }
        }
    }

    private void updateMacroMode() {
        this.mCamera2Device.setMacroMode(CameraSettings.isMacroModeEnabled(this.mModuleIndex));
    }

    private void updateMfnr(boolean z) {
        boolean z2 = false;
        if (!isUseSwMfnr() && z && this.mModuleIndex != 167 && ((!b.rC || isDualCamera()) && this.mMutexModePicker.isNormal() && !CameraSettings.isGroupShotOn() && ((!isFrontCamera() || enableFrontMFNR()) && (DataRepository.dataItemFeature().fc() || getZoomRatio() == 1.0f || isUltraWideBackCamera() || isZoomRatioBetweenUltraAndWide())))) {
            z2 = true;
        }
        if (this.mCamera2Device != null) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setMfnr to ");
            sb.append(z2);
            Log.d(str, sb.toString());
            this.mCamera2Device.setMfnr(z2);
        }
    }

    private void updateMute() {
    }

    private void updateNormalWideLDC() {
        this.mCamera2Device.setNormalWideLDC(shouldApplyNormalWideLDC());
    }

    private void updateOIS() {
        boolean z = isDualCamera() && getZoomRatio() > 1.0f;
        boolean isPortraitModeBackOn = CameraSettings.isPortraitModeBackOn();
        boolean z2 = this.mModuleIndex == 167 && Long.parseLong(getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default))) > 1000000000;
        if (z || isPortraitModeBackOn || z2) {
            this.mCamera2Device.setEnableOIS(false);
        } else {
            this.mCamera2Device.setEnableOIS(true);
        }
    }

    private void updatePictureAndPreviewSize() {
        CameraSize bestPictureSize = getBestPictureSize(this.mCameraCapabilities.getSupportedOutputSize(this.mEnableParallelSession ? 35 : 256));
        if (b.rK && getOperatingMode() == 36867) {
            bestPictureSize = new CameraSize(bestPictureSize.width / 2, bestPictureSize.height / 2);
        }
        this.mPictureSize = bestPictureSize;
        List supportedOutputSize = this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class);
        double previewAspectRatio = (double) CameraSettings.getPreviewAspectRatio(bestPictureSize.width, bestPictureSize.height);
        this.mPreviewSize = Util.getOptimalPreviewSize(this.mModuleIndex, this.mBogusCameraId, supportedOutputSize, previewAspectRatio);
        this.mCamera2Device.setPreviewSize(this.mPreviewSize);
        if (this.mIsGoogleLensAvailable) {
            this.mCamera2Device.setAlgorithmPreviewSize(Util.getAlgorithmPreviewSize(supportedOutputSize, previewAspectRatio, this.mPreviewSize));
        } else {
            this.mCamera2Device.setAlgorithmPreviewSize(this.mPreviewSize);
        }
        this.mCamera2Device.setAlgorithmPreviewFormat(35);
        if (this.mEnableParallelSession) {
            List supportedOutputSize2 = this.mCameraCapabilities.getSupportedOutputSize(256);
            if (this.mModuleIndex == 165) {
                this.mOutPutSize = PictureSizeManager.getBestSquareSize(supportedOutputSize2);
                if (this.mOutPutSize.getWidth() == 0) {
                    int i = bestPictureSize.width > bestPictureSize.height ? bestPictureSize.height : bestPictureSize.width;
                    throw new RuntimeException(String.format(Locale.ENGLISH, "size %dx%d is not supported!", new Object[]{Integer.valueOf(i), Integer.valueOf(i)}));
                }
            } else {
                this.mOutPutSize = PictureSizeManager.getBestPictureSize(supportedOutputSize2);
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("output picture Size: ");
            sb.append(this.mOutPutSize);
            Log.d(str, sb.toString());
        }
        Log.d(TAG, String.format(Locale.ENGLISH, "updateSize: picture size is: %s, preview size is: %s", new Object[]{bestPictureSize, this.mPreviewSize}));
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
        checkDisplayOrientation();
        setVideoSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void updatePortraitLighting() {
        String valueOf = String.valueOf(CameraSettings.getPortraitLightingPattern());
        this.mIsPortraitLightingOn = !valueOf.equals("0");
        this.mCamera2Device.setPortraitLighting(Integer.parseInt(valueOf));
        setLightingEffect();
    }

    private void updateSaturation() {
        this.mCamera2Device.setSaturation(Integer.parseInt(getString(R.string.pref_camera_saturation_default)));
    }

    private void updateScene() {
        DataItemRunning dataItemRunning = DataRepository.dataItemRunning();
        if (this.mMutexModePicker.isSceneHdr()) {
            this.mSceneMode = CameraScene.HDR;
        } else if (!dataItemRunning.isSwitchOn("pref_camera_scenemode_setting_key")) {
            this.mSceneMode = "-1";
        } else {
            this.mSceneMode = dataItemRunning.getComponentRunningSceneValue().getComponentValue(this.mModuleIndex);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("sceneMode=");
        sb.append(this.mSceneMode);
        sb.append(" mutexMode=");
        sb.append(this.mMutexModePicker.getMutexMode());
        Log.d(str, sb.toString());
        if (!setSceneMode(this.mSceneMode)) {
            this.mSceneMode = "-1";
        }
        this.mHandler.post(new Runnable() {
            public void run() {
                Camera2Module.this.updateSceneModeUI();
            }
        });
        if ("0".equals(this.mSceneMode) || "-1".equals(this.mSceneMode)) {
            this.mFocusManager.overrideFocusMode(null);
        } else {
            this.mFocusManager.overrideFocusMode(AutoFocus.LEGACY_CONTINUOUS_PICTURE);
        }
    }

    /* access modifiers changed from: private */
    public void updateSceneModeUI() {
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (DataRepository.dataItemRunning().isSwitchOn("pref_camera_scenemode_setting_key")) {
            DataRepository.dataItemConfig().getComponentHdr().setComponentValue(163, "off");
            String flashModeByScene = CameraSettings.getFlashModeByScene(this.mSceneMode);
            if (topAlert != null) {
                topAlert.disableMenuItem(false, 194);
                if (flashModeByScene != null) {
                    topAlert.disableMenuItem(false, 193);
                } else {
                    topAlert.enableMenuItem(false, 193);
                }
                topAlert.hideExtraMenu();
            }
        } else if (topAlert != null) {
            topAlert.enableMenuItem(false, 193, 194);
        }
        if (topAlert != null) {
            topAlert.updateConfigItem(193, 194);
        }
        updatePreferenceInWorkThread(11, 10);
    }

    private void updateSharpness() {
        this.mCamera2Device.setSharpness(Integer.parseInt(getString(R.string.pref_camera_sharpness_default)));
    }

    /* JADX WARNING: Removed duplicated region for block: B:13:0x0032  */
    /* JADX WARNING: Removed duplicated region for block: B:17:0x003a  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void updateShotDetermine() {
        boolean z;
        int i;
        int i2 = 0;
        if (this.mModuleIndex == 171) {
            if (!isBackCamera()) {
                z = DataRepository.dataItemFeature().fh();
            } else if (b.iu() || DataRepository.dataItemFeature().fg()) {
                z = true;
            }
            if (!this.mIsImageCaptureIntent) {
                i = z ? -3 : -2;
            } else {
                this.mEnableParallelSession = isParallelSessionEnable();
                int i3 = this.mModuleIndex;
                if (!(i3 == 163 || i3 == 165)) {
                    if (i3 == 171) {
                        if (this.mEnableParallelSession) {
                            if (shouldDoMultiFrameCapture()) {
                                i2 = 8;
                            } else {
                                if (isDualFrontCamera() || isDualCamera() || isBokehUltraWideBackCamera()) {
                                    if (z) {
                                        i = 6;
                                    }
                                } else if (z) {
                                    i = 7;
                                }
                                i2 = 5;
                            }
                        } else if (z) {
                            i2 = 2;
                        }
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("enableParallel=");
                        sb.append(this.mEnableParallelSession);
                        sb.append(" shotType=");
                        sb.append(i2);
                        Log.d(str, sb.toString());
                        this.mCamera2Device.setShotType(i2);
                    } else if (i3 != 175) {
                        this.mEnableParallelSession = false;
                        return;
                    }
                }
                if (this.mEnableParallelSession) {
                    i2 = shouldDoMultiFrameCapture() ? 8 : 5;
                }
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("enableParallel=");
                sb2.append(this.mEnableParallelSession);
                sb2.append(" shotType=");
                sb2.append(i2);
                Log.d(str2, sb2.toString());
                this.mCamera2Device.setShotType(i2);
            }
            i2 = i;
            String str22 = TAG;
            StringBuilder sb22 = new StringBuilder();
            sb22.append("enableParallel=");
            sb22.append(this.mEnableParallelSession);
            sb22.append(" shotType=");
            sb22.append(i2);
            Log.d(str22, sb22.toString());
            this.mCamera2Device.setShotType(i2);
        }
        z = false;
        if (!this.mIsImageCaptureIntent) {
        }
        i2 = i;
        String str222 = TAG;
        StringBuilder sb222 = new StringBuilder();
        sb222.append("enableParallel=");
        sb222.append(this.mEnableParallelSession);
        sb222.append(" shotType=");
        sb222.append(i2);
        Log.d(str222, sb222.toString());
        this.mCamera2Device.setShotType(i2);
    }

    private void updateSuperResolution() {
        if (isFrontCamera() || ModuleManager.isManualModule() || this.mModuleIndex == 173) {
            return;
        }
        if (isUltraWideBackCamera()) {
            Log.d(TAG, "SR force off for ultra wide camera");
        } else if (CameraSettings.isSREnable()) {
            if (getZoomRatio() <= 1.0f) {
                if (!DataRepository.dataItemRunning().isSwitchOn("pref_camera_super_resolution_key")) {
                    if (this.mMutexModePicker.isSuperResolution()) {
                        this.mMutexModePicker.resetMutexMode();
                    } else if (this.mCamera2Device != null) {
                        this.mCamera2Device.setSuperResolution(false);
                    }
                }
            } else if (CameraSettings.isGroupShotOn()) {
                if (this.mMutexModePicker.isSuperResolution()) {
                    this.mMutexModePicker.resetMutexMode();
                }
            } else if (this.mMutexModePicker.isNormal()) {
                this.mMutexModePicker.setMutexMode(10);
            }
        }
    }

    private void updateSwMfnr() {
        boolean isUseSwMfnr = isUseSwMfnr();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSwMfnr to ");
        sb.append(isUseSwMfnr);
        Log.d(str, sb.toString());
        this.mCamera2Device.setSwMfnr(isUseSwMfnr);
    }

    private void updateThumbProgress(boolean z) {
        ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
        if (actionProcessing != null) {
            actionProcessing.updateLoading(z);
        }
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private void updateWhiteBalance() {
        setAWBMode(getManualValue(CameraSettings.KEY_WHITE_BALANCE, "1"));
    }

    private void updateZsl() {
        this.mCamera2Device.setEnableZsl(this.mModuleIndex != 167);
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

    public void checkCloseMoonMode(int i, int i2) {
        if (this.mEnteringMoonMode) {
            if ((this.mCurrentAiScene == 10 || this.mCurrentAiScene == 35) && i != this.mCurrentAiScene) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null) {
                    topAlert.alertMoonModeSelector(i2, false);
                    if (i2 != 0) {
                        this.mEnteringMoonMode = false;
                    }
                }
                updateMoon(false);
                if (this.mMutexModePicker.isSuperResolution()) {
                    this.mCamera2Device.setSuperResolution(true);
                }
            }
        }
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
        Log.d(TAG, "closeCamera: E");
        setCameraState(0);
        synchronized (this.mCameraDeviceLock) {
            if (this.mCamera2Device != null) {
                if (this.mMultiSnapStatus) {
                    this.mCamera2Device.captureAbortBurst();
                    this.mMultiSnapStatus = false;
                }
                if (this.mBurstDisposable != null) {
                    this.mBurstDisposable.dispose();
                }
                if (this.mMetaDataFlowableEmitter != null) {
                    this.mMetaDataFlowableEmitter.onComplete();
                }
                if (this.mMetaDataDisposable != null) {
                    this.mMetaDataDisposable.dispose();
                }
                if (this.mAiSceneFlowableEmitter != null) {
                    this.mAiSceneFlowableEmitter.onComplete();
                }
                if (this.mAiSceneDisposable != null) {
                    this.mAiSceneDisposable.dispose();
                }
                if (this.mSuperNightDisposable != null) {
                    this.mSuperNightDisposable.dispose();
                }
                this.mCamera2Device.setScreenLightCallback(null);
                this.mCamera2Device.setMetaDataCallback(null);
                this.mCamera2Device.setErrorCallback(null);
                this.mCamera2Device.releaseCameraPreviewCallback(null);
                this.mCamera2Device.setFocusCallback(null);
                this.mCamera2Device.setASD(false);
                if (scanQRCodeEnabled() || b.ge() || this.mIsGoogleLensAvailable) {
                    this.mCamera2Device.stopPreviewCallback(true);
                }
                if (this.mFaceDetectionStarted) {
                    this.mFaceDetectionStarted = false;
                }
                this.m3ALocked = false;
                this.mCamera2Device = null;
            }
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.setAeAwbLock(false);
            this.mFocusManager.destroy();
        }
        if (scanQRCodeEnabled() || b.ge() || this.mIsGoogleLensAvailable) {
            PreviewDecodeManager.getInstance().quit();
        }
        Log.d(TAG, "closeCamera: X");
    }

    public void consumePreference(@UpdateType int... iArr) {
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
                case 4:
                    updateScene();
                    break;
                case 5:
                    updateFace();
                    break;
                case 6:
                    updateWhiteBalance();
                    break;
                case 7:
                    updateJpegQuality();
                    break;
                case 8:
                    updateJpegThumbnailSize();
                    break;
                case 9:
                    updateAntiBanding(CameraSettings.getAntiBanding());
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                    updateHDRPreference();
                    break;
                case 12:
                    setEvValue();
                    break;
                case 13:
                    updateBeauty();
                    updateEyeLight();
                    break;
                case 14:
                    updateFocusMode();
                    break;
                case 15:
                    updateISO();
                    break;
                case 16:
                    updateExposureTime();
                    break;
                case 19:
                    updateFpsRange();
                    break;
                case 20:
                    updateOIS();
                    break;
                case 21:
                    updateMute();
                    break;
                case 22:
                    updateZsl();
                    break;
                case 23:
                    updateDecodePreview();
                    break;
                case 24:
                    applyZoomRatio();
                    break;
                case 25:
                    focusCenter();
                    break;
                case 26:
                    updateContrast();
                    break;
                case 27:
                    updateSaturation();
                    break;
                case 28:
                    updateSharpness();
                    break;
                case 29:
                    updateExposureMeteringMode();
                    break;
                case 30:
                    updateSuperResolution();
                    break;
                case 34:
                    updateMfnr(CameraSettings.isMfnrSatEnable());
                    break;
                case 35:
                    updateDeviceOrientation();
                    break;
                case 36:
                    updateAiScene();
                    break;
                case 37:
                    updateBokeh();
                    break;
                case 38:
                    updateFaceAgeAnalyze();
                    break;
                case 39:
                    updateFaceScore();
                    break;
                case 40:
                    updateFrontMirror();
                    break;
                case 42:
                    updateSwMfnr();
                    break;
                case 43:
                    updatePortraitLighting();
                    break;
                case 44:
                    updateShotDetermine();
                    break;
                case 45:
                    updateEyeLight();
                    break;
                case 46:
                    updateNormalWideLDC();
                    break;
                case 47:
                    updateUltraWideLDC();
                    break;
                case 48:
                    updateFNumber();
                    break;
                case 49:
                    updateLiveShot();
                    break;
                case 50:
                    break;
                case 52:
                    updateMacroMode();
                    break;
                default:
                    StringBuilder sb = new StringBuilder();
                    sb.append("no consumer for this updateType: ");
                    sb.append(i);
                    throw new RuntimeException(sb.toString());
            }
        }
    }

    public void enterMutexMode(int i) {
        if (this.mCamera2Device == null) {
            Log.d(TAG, "enterMutexMode error, mCamera2Device is null");
            return;
        }
        if (i == 1) {
            this.mCamera2Device.setHDR(true);
        } else if (i == 3) {
            this.mCamera2Device.setHHT(true);
        } else if (i == 10) {
            this.mCamera2Device.setSuperResolution(true);
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
        updateSwMfnr();
    }

    public void exitMutexMode(int i) {
        if (i == 1) {
            this.mCamera2Device.setHDR(false);
            updateSuperResolution();
        } else if (i == 3) {
            this.mCamera2Device.setHHT(false);
        } else if (i == 10) {
            this.mCamera2Device.setSuperResolution(false);
        }
        updateMfnr(CameraSettings.isMfnrSatEnable());
        updateSwMfnr();
    }

    /* access modifiers changed from: protected */
    public void focusCenter() {
    }

    /* access modifiers changed from: protected */
    public CameraSize getBestPictureSize(List<CameraSize> list) {
        PictureSizeManager.initialize(list, getMaxPictureSize(), this.mModuleIndex, this.mBogusCameraId);
        return PictureSizeManager.getBestPictureSize();
    }

    public CircularMediaRecorder getCircularMediaRecorder() {
        CircularMediaRecorder circularMediaRecorder;
        synchronized (this.mCircularMediaRecorderStateLock) {
            circularMediaRecorder = this.mCircularMediaRecorder;
        }
        return circularMediaRecorder;
    }

    public int getFilterId() {
        return this.mFilterId;
    }

    /* access modifiers changed from: protected */
    public int getMaxPictureSize() {
        return 0;
    }

    /* access modifiers changed from: protected */
    public int getMutexHdrMode(String str) {
        if ("normal".equals(str)) {
            return 1;
        }
        return (!b.hg() || !"live".equals(str)) ? 0 : 2;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:64:0x0102, code lost:
        if (r0 != 175) goto L_0x0105;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:73:0x0123, code lost:
        if (com.android.camera.CameraSettings.isUltraPixelOn() != false) goto L_0x0128;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public int getOperatingMode() {
        int i;
        if (!isParallelSessionEnable()) {
            boolean isFrontCamera = isFrontCamera();
            int i2 = CameraCapabilities.SESSION_OPERATION_MODE_NORMAL_ULTRA_PIXEL_PHOTOGRAPHY;
            if (isFrontCamera) {
                mIsBeautyFrontOn = true;
                if (!isPortraitMode() || !DataRepository.dataItemFeature().fh()) {
                    if (!isPortraitMode() || !isBokehFrontCamera()) {
                        if (!this.mCameraCapabilities.isSupportedQcfa() || mIsBeautyFrontOn || !"off".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex)) || DataRepository.dataItemFeature().gd() > 0) {
                            i = 32773;
                            i2 = i;
                            if (this.mModuleIndex == 163 && CameraSettings.isUltraPixelOn()) {
                                i2 = 32775;
                            }
                        } else {
                            i2 = 32775;
                            i2 = 32775;
                        }
                    }
                } else if (!isBokehFrontCamera()) {
                    i = 33009;
                    i2 = i;
                    i2 = 32775;
                }
                i2 = 32770;
                i2 = 32775;
            } else {
                int moduleIndex = getModuleIndex();
                if (moduleIndex != 163) {
                    if (moduleIndex == 167) {
                        i2 = CameraSettings.isUltraPixelOn() ? CameraCapabilities.SESSION_OPERATION_MODE_PROFESSIONAL_ULTRA_PIXEL_PHOTOGRAPHY : 32771;
                    } else if (moduleIndex == 171) {
                        i2 = 32770;
                    } else if (moduleIndex == 173) {
                        i2 = CameraCapabilities.SESSION_OPERATION_MODE_SUPER_NIGHT;
                    }
                }
                i2 = 32769;
            }
            this.mOperatingMode = i2;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("getOperatingMode: ");
            sb.append(String.format("operatingMode = 0x%x", new Object[]{Integer.valueOf(i2)}));
            Log.d(str, sb.toString());
            return i2;
        } else if (isInQCFAMode()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_QCFA");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_QCFA;
        } else if (171 == getModuleIndex()) {
            if (!isFrontCamera() || isDualFrontCamera()) {
                Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_DUAL_BOKEH");
                return 36864;
            }
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_SINGLE_BOKEH;
        } else if (CameraSettings.isUltraPixelOn()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_HD");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_HD;
        } else if (CameraSettings.isSupportedOpticalZoom()) {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_SAT");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_SAT;
        } else {
            Log.d(TAG, "getOperatingMode: SESSION_OPERATION_MODE_ALGO_UP_NORMAL");
            return CameraCapabilities.SESSION_OPERATION_MODE_ALGO_UP_NORMAL;
        }
    }

    public void initializeCapabilities() {
        super.initializeCapabilities();
        this.mContinuousFocusSupported = Util.isSupported(4, this.mCameraCapabilities.getSupportedFocusModes());
        this.mMaxFaceCount = this.mCameraCapabilities.getMaxFaceCount();
    }

    /* access modifiers changed from: protected */
    public boolean isAutoRestartInNonZSL() {
        return false;
    }

    public boolean isBeautyBodySlimCountDetectStarted() {
        return this.mIsBeautyBodySlimOn;
    }

    public boolean isBlockSnap() {
        return this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3 || (this.mCamera2Device != null && this.mCamera2Device.isCaptureBusy(this.mMutexModePicker.isHdr())) || isParallelQueueFull() || isInCountDown();
    }

    /* access modifiers changed from: protected */
    public boolean isCameraSwitchingDuringZoomingAllowed() {
        if (CameraSettings.isSupportedOpticalZoom()) {
            return super.isCameraSwitchingDuringZoomingAllowed();
        }
        boolean z = HybridZoomingSystem.IS_3_OR_MORE_SAT && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && isBackCamera();
        return z;
    }

    /* access modifiers changed from: protected */
    public boolean isDetectedHHT() {
        return false;
    }

    public boolean isDoingAction() {
        if (this.mPaused || this.isZooming || isKeptBitmapTexture() || this.mMultiSnapStatus || getCameraState() == 0 || getCameraState() == 3) {
            return true;
        }
        return (this.mCamera2Device != null && this.mCamera2Device.isCaptureBusy(true)) || isParallelQueueFull() || isInCountDown();
    }

    /* access modifiers changed from: protected */
    public boolean isFaceBeautyMode() {
        return false;
    }

    public boolean isFaceDetectStarted() {
        return this.mFaceDetectionStarted;
    }

    public boolean isGyroStable() {
        return Util.isGyroscopeStable(this.curGyroscope, this.lastGyroscope);
    }

    public boolean isHdrDetectStarted() {
        return this.mHdrCheckEnabled;
    }

    public boolean isKeptBitmapTexture() {
        return this.mKeepBitmapTexture;
    }

    public boolean isLivePhotoStarted() {
        return this.mLiveShotEnabled;
    }

    public boolean isMeteringAreaOnly() {
        boolean z = false;
        if (this.mCamera2Device == null) {
            return false;
        }
        int focusMode = this.mCamera2Device.getFocusMode();
        if ((!this.mFocusAreaSupported && this.mMeteringAreaSupported && !this.mFocusOrAELockSupported) || 5 == focusMode || focusMode == 0) {
            z = true;
        }
        return z;
    }

    public boolean isNeedMute() {
        return CameraSettings.isLiveShotOn();
    }

    public boolean isSelectingCapturedResult() {
        boolean z = false;
        if (!this.mIsImageCaptureIntent) {
            return false;
        }
        BaseDelegate baseDelegate = (BaseDelegate) ModeCoordinatorImpl.getInstance().getAttachProtocol(160);
        if (baseDelegate != null && baseDelegate.getActiveFragment(R.id.bottom_action) == 4083) {
            z = true;
        }
        return z;
    }

    public boolean isShowAeAfLockIndicator() {
        return this.m3ALocked;
    }

    public boolean isShowCaptureButton() {
        return !this.mMutexModePicker.isBurstShoot() && isSupportFocusShoot();
    }

    public boolean isSupportFocusShoot() {
        return DataRepository.dataItemGlobal().isGlobalSwitchOn("pref_camera_focus_shoot_key");
    }

    /* access modifiers changed from: protected */
    public boolean isSupportSceneMode() {
        return false;
    }

    public boolean isUltraWideDetectStarted() {
        return true;
    }

    public boolean isUnInterruptable() {
        this.mUnInterruptableReason = null;
        if (isKeptBitmapTexture()) {
            this.mUnInterruptableReason = "bitmap cover";
        } else if (getCameraState() == 3) {
            this.mUnInterruptableReason = "snapshot";
        }
        return this.mUnInterruptableReason != null;
    }

    public boolean isUseFaceInfo() {
        return this.mIsGenderAgeOn || this.mIsMagicMirrorOn;
    }

    /* access modifiers changed from: protected */
    public boolean isZoomEnabled() {
        boolean z = true;
        if (getCameraState() == 3 || this.mMutexModePicker.isUbiFocus() || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || isFrontCamera() || this.mCamera2Device == null || this.mCamera2Device.isCaptureBusy(true) || CameraSettings.isUltraPixelOn()) {
            z = false;
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (!z || dualController == null || !dualController.isZoomVisible() || !dualController.isSlideVisible()) {
            return z;
        }
        return false;
    }

    public boolean multiCapture() {
        if (isDoingAction() || !this.mPendingMultiCapture) {
            return false;
        }
        this.mPendingMultiCapture = false;
        this.mActivity.getScreenHint().updateHint();
        if (Storage.isLowStorageAtLastPoint()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Not enough space or storage not ready. remaining=");
            sb.append(Storage.getLeftSpace());
            Log.i(str, sb.toString());
            return false;
        } else if (this.mActivity.getImageSaver().isBusy()) {
            Log.d(TAG, "ImageSaver is busy, wait for a moment!");
            RotateTextToast.getInstance(this.mActivity).show(R.string.toast_saving, 0);
            return false;
        } else if (this.mIsMoonMode) {
            return false;
        } else {
            ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement(SupportedConfigFactory.CLOSE_BY_BURST_SHOOT, 193, 194, 196, 239, 201, 206);
            BackStack backStack = (BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171);
            if (backStack != null) {
                backStack.handleBackStackFromShutter();
            }
            prepareMultiCapture();
            Observable.create(new ObservableOnSubscribe<Integer>() {
                public void subscribe(ObservableEmitter<Integer> observableEmitter) throws Exception {
                    Camera2Module.this.mBurstEmitter = observableEmitter;
                }
            }).observeOn(AndroidSchedulers.mainThread()).map(new Function<Integer, Integer>() {
                public Integer apply(Integer num) throws Exception {
                    SnapShotIndicator snapShotIndicator = (SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184);
                    if (snapShotIndicator != null) {
                        MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                        boolean z = miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow();
                        snapShotIndicator.setSnapNumVisible(!z, false);
                        snapShotIndicator.setSnapNumValue(num.intValue());
                    }
                    return num;
                }
            }).subscribe((Observer<? super T>) new Observer<Integer>() {
                public void onComplete() {
                    ((SnapShotIndicator) ModeCoordinatorImpl.getInstance().getAttachProtocol(184)).setSnapNumVisible(false, true);
                    ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).restoreAllMutexElement(SupportedConfigFactory.CLOSE_BY_BURST_SHOOT);
                }

                public void onError(Throwable th) {
                }

                public void onNext(Integer num) {
                }

                public void onSubscribe(Disposable disposable) {
                    Camera2Module.this.mBurstStartTime = System.currentTimeMillis();
                    Camera2Module.this.mBurstDisposable = disposable;
                }
            });
            this.mBurstNextDelayTime = 0;
            if (isParallelSessionEnable()) {
                this.mCamera2Device.setShotType(9);
                this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegRepeatingCaptureCallback(this), this.mActivity.getImageSaver());
            } else {
                this.mCamera2Device.setShotType(3);
                this.mCamera2Device.captureBurstPictures(this.mTotalJpegCallbackNum, new JpegQuickPictureCallback(LocationManager.instance().getCurrentLocation()), this.mActivity.getImageSaver());
            }
            return true;
        }
    }

    public void notifyFocusAreaUpdate() {
        updatePreferenceTrampoline(3);
    }

    public boolean onBackPressed() {
        if (!isFrameAvailable()) {
            return false;
        }
        tryRemoveCountDownMessage();
        if (this.mMultiSnapStatus) {
            onShutterButtonLongClickCancel(false);
            return true;
        }
        if (getCameraState() == 3) {
            long currentTimeMillis = System.currentTimeMillis();
            if (this.mModuleIndex == 173) {
                if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                    this.mLastBackPressedTime = currentTimeMillis;
                    ToastUtils.showToast((Context) this.mActivity, (int) R.string.capture_back_pressed_hint);
                    return true;
                }
            } else if (currentTimeMillis - this.mLastCaptureTime < CAPTURE_DURATION_THRESHOLD) {
                return true;
            }
        }
        return super.onBackPressed();
    }

    public void onBeautyBodySlimCountChange(final boolean z) {
        this.mHandler.post(new Runnable() {
            public void run() {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                if (topAlert != null) {
                    if (z) {
                        topAlert.alertAiDetectTipHint(0, R.string.beauty_body_slim_count_tip, FunctionParseBeautyBodySlimCount.TIP_TIME);
                    } else {
                        topAlert.alertAiDetectTipHint(8, R.string.beauty_body_slim_count_tip, 0);
                    }
                }
            }
        });
    }

    public void onBeautyParameterChanged() {
        if (b.iv()) {
            updatePreferenceInWorkThread(13, 34, 42);
            return;
        }
        updatePreferenceInWorkThread(13);
    }

    public void onBroadcastReceived(Context context, Intent intent) {
        if (intent != null && isAlive()) {
            if (CameraIntentManager.ACTION_VOICE_CONTROL.equals(intent.getAction())) {
                Log.d(TAG, "on Receive voice control broadcast action intent");
                String voiceControlAction = CameraIntentManager.getInstance(intent).getVoiceControlAction();
                this.mBroadcastIntent = intent;
                char c = 65535;
                if (voiceControlAction.hashCode() == 1270567718 && voiceControlAction.equals("CAPTURE")) {
                    c = 0;
                }
                if (c == 0) {
                    onShutterButtonClick(getTriggerMode());
                    this.mBroadcastIntent = null;
                }
                CameraIntentManager.removeInstance(intent);
            }
            super.onBroadcastReceived(context, intent);
        }
    }

    /* access modifiers changed from: protected */
    public void onCameraOpened() {
        super.onCameraOpened();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.CAMERA_TYPES_INIT);
        if (this.mEnableParallelSession && isPortraitMode()) {
            Util.saveCameraCalibrationToFile(this.mCameraCapabilities.getCameraCalibrationData(), getCalibrationDataFileName(this.mActualCameraId));
        }
        if (!isKeptBitmapTexture()) {
            startPreview();
        }
        initMetaParser();
        if (DataRepository.dataItemFeature().fj()) {
            initAiSceneParser();
        }
        this.mOnResumeTime = SystemClock.uptimeMillis();
        this.mHandler.sendEmptyMessage(4);
        this.mHandler.sendEmptyMessage(31);
    }

    /* access modifiers changed from: protected */
    public void onCapabilityChanged(CameraCapabilities cameraCapabilities) {
        super.onCapabilityChanged(cameraCapabilities);
        this.mUltraWideAELocked = false;
        if (this.mFocusManager != null) {
            this.mFocusManager.setCharacteristics(cameraCapabilities);
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.onCapabilityChanged(cameraCapabilities);
        }
    }

    public void onCaptureShutter() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCaptureShutter: cameraState = ");
        sb.append(getCameraState());
        sb.append(", isParallel = ");
        sb.append(this.mEnableParallelSession);
        Log.d(str, sb.toString());
        onShutter(true);
    }

    /* JADX WARNING: Removed duplicated region for block: B:28:0x0088  */
    /* JADX WARNING: Removed duplicated region for block: B:29:0x008d  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x00cb  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x00cd  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0101  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x01a6  */
    /* JADX WARNING: Removed duplicated region for block: B:74:0x01ee  */
    /* JADX WARNING: Removed duplicated region for block: B:77:0x01f7  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public ParallelTaskData onCaptureStart(ParallelTaskData parallelTaskData, CameraSize cameraSize, boolean z) {
        List list;
        ImageSaver imageSaver;
        if (isDeparted()) {
            Log.w(TAG, "onCaptureStart: departed");
            parallelTaskData.setAbandoned(true);
            return parallelTaskData;
        }
        boolean z2 = CameraSettings.isLiveShotOn() && isLiveShotAvailable(parallelTaskData.getParallelType());
        if (z2) {
            startLiveShotAnimation();
        }
        if (!z || (CameraSettings.isGroupShotOn() && !this.mEnableParallelSession)) {
            onShutter(z);
        }
        String str = null;
        if (CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()) {
            List faceWaterMarkInfos = ((MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166)).getFaceWaterMarkInfos();
            if (faceWaterMarkInfos != null && !faceWaterMarkInfos.isEmpty()) {
                list = new ArrayList(faceWaterMarkInfos);
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureStart: ");
                sb.append(cameraSize.width);
                sb.append("x");
                sb.append(cameraSize.height);
                Log.d(str2, sb.toString());
                Builder jpegRotation = new Builder(this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), this.mOutPutSize != null ? cameraSize.toSizeObject() : this.mOutPutSize.toSizeObject()).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != this.mOrientation ? 0 : this.mOrientation).setJpegRotation(this.mJpegRotation);
                float f = (CameraSettings.isGradienterOn() || this.mShootRotation != -1.0f) ? this.mShootRotation : 0.0f;
                Builder location = jpegRotation.setShootRotation(f).setShootOrientation(this.mShootOrientation).setLocation(this.mLocation);
                if (CameraSettings.isTimeWaterMarkOpen()) {
                    str = Util.getTimeWatermark();
                }
                parallelTaskData.fillParameter(location.setTimeWaterMarkString(str).setFaceWaterMarkList(list).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(isFrontCamera()).setBokehFrontCamera(isBokehFrontCamera()).setAlgorithmName(this.mAlgorithmName).setPictureInfo(getPictureInfo()).setSuffix(getSuffix()).setGradienterOn(this.mIsGradienterOn).setTiltShiftMode(getTiltShiftMode()).setSaveGroupshotPrimitive(CameraSettings.isSaveGroushotPrimitiveOn()).setDeviceWatermarkParam(getDeviceWaterMarkParam()).setJpegQuality(getJpegQuality(false)).setPrefix(getPrefix()).build());
                boolean z3 = z && !this.mEnabledPreviewThumbnail;
                parallelTaskData.setNeedThumbnail(z3);
                parallelTaskData.setCurrentModuleIndex(this.mModuleIndex);
                boolean z4 = this.mCameraCapabilities == null && this.mCameraCapabilities.isAdaptiveSnapshotSizeInSatModeSupported();
                parallelTaskData.setAdaptiveSnapshotSize(z4);
                parallelTaskData.setLiveShotTask(false);
                if (z2 && this.mActivity != null) {
                    imageSaver = this.mActivity.getImageSaver();
                    if (imageSaver != null) {
                        synchronized (this.mCircularMediaRecorderStateLock) {
                            if (this.mCircularMediaRecorder != null) {
                                parallelTaskData.setLiveShotTask(true);
                                this.mCircularMediaRecorder.snapshot(this.mOrientationCompensation, imageSaver, parallelTaskData, this.mFilterId);
                            }
                        }
                    }
                }
                String str3 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onCaptureStart: isParallel = ");
                sb2.append(this.mEnableParallelSession);
                sb2.append(", shotType = ");
                sb2.append(parallelTaskData.getParallelType());
                sb2.append(", isLiveShot = ");
                sb2.append(z2);
                Log.d(str3, sb2.toString());
                if (this.mEnableParallelSession) {
                    beginParallelProcess(parallelTaskData, true);
                }
                if (CameraSettings.isHandGestureOpen()) {
                    Log.d(TAG, "send msg: reset hand gesture");
                    this.mHandler.removeMessages(57);
                    this.mHandler.sendEmptyMessageDelayed(57, 0);
                }
                return parallelTaskData;
            }
        }
        list = null;
        String str22 = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("onCaptureStart: ");
        sb3.append(cameraSize.width);
        sb3.append("x");
        sb3.append(cameraSize.height);
        Log.d(str22, sb3.toString());
        Builder jpegRotation2 = new Builder(this.mPreviewSize.toSizeObject(), cameraSize.toSizeObject(), this.mOutPutSize != null ? cameraSize.toSizeObject() : this.mOutPutSize.toSizeObject()).setHasDualWaterMark(CameraSettings.isDualCameraWaterMarkOpen()).setMirror(isFrontMirror()).setLightingPattern(CameraSettings.getPortraitLightingPattern()).setFilterId(EffectController.getInstance().getEffectForSaving(false)).setOrientation(-1 != this.mOrientation ? 0 : this.mOrientation).setJpegRotation(this.mJpegRotation);
        if (CameraSettings.isGradienterOn()) {
        }
        Builder location2 = jpegRotation2.setShootRotation(f).setShootOrientation(this.mShootOrientation).setLocation(this.mLocation);
        if (CameraSettings.isTimeWaterMarkOpen()) {
        }
        parallelTaskData.fillParameter(location2.setTimeWaterMarkString(str).setFaceWaterMarkList(list).setAgeGenderAndMagicMirrorWater(CameraSettings.isAgeGenderAndMagicMirrorWaterOpen()).setFrontCamera(isFrontCamera()).setBokehFrontCamera(isBokehFrontCamera()).setAlgorithmName(this.mAlgorithmName).setPictureInfo(getPictureInfo()).setSuffix(getSuffix()).setGradienterOn(this.mIsGradienterOn).setTiltShiftMode(getTiltShiftMode()).setSaveGroupshotPrimitive(CameraSettings.isSaveGroushotPrimitiveOn()).setDeviceWatermarkParam(getDeviceWaterMarkParam()).setJpegQuality(getJpegQuality(false)).setPrefix(getPrefix()).build());
        if (z) {
        }
        parallelTaskData.setNeedThumbnail(z3);
        parallelTaskData.setCurrentModuleIndex(this.mModuleIndex);
        if (this.mCameraCapabilities == null) {
        }
        parallelTaskData.setAdaptiveSnapshotSize(z4);
        parallelTaskData.setLiveShotTask(false);
        imageSaver = this.mActivity.getImageSaver();
        if (imageSaver != null) {
        }
        String str32 = TAG;
        StringBuilder sb22 = new StringBuilder();
        sb22.append("onCaptureStart: isParallel = ");
        sb22.append(this.mEnableParallelSession);
        sb22.append(", shotType = ");
        sb22.append(parallelTaskData.getParallelType());
        sb22.append(", isLiveShot = ");
        sb22.append(z2);
        Log.d(str32, sb22.toString());
        if (this.mEnableParallelSession) {
        }
        if (CameraSettings.isHandGestureOpen()) {
        }
        return parallelTaskData;
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        parseIntent();
        this.mHandler = new MainHandler(this, this.mActivity.getMainLooper());
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        boolean z = 163 == getModuleIndex() && !this.mIsImageCaptureIntent && isBackCamera() && CameraSettings.isAvailableGoogleLens();
        this.mIsGoogleLensAvailable = z;
        onCameraOpened();
        if (!b.fY()) {
            this.mLensApi = new LensApi(this.mActivity);
            this.mLensApi.checkLensAvailability(new LensAvailabilityCallback() {
                public void onAvailabilityStatusFetched(int i) {
                    Camera2Module.this.mLensStatus = i;
                    CameraSettings.setGoogleLensAvailability(Camera2Module.this.mLensStatus == 0);
                }
            });
        }
    }

    public void onDestroy() {
        super.onDestroy();
        if (this.mHandler != null) {
            this.mHandler.sendEmptyMessage(45);
        }
    }

    public void onFaceDetected(CameraHardwareFace[] cameraHardwareFaceArr, FaceAnalyzeInfo faceAnalyzeInfo) {
        if (isAlive() && this.mActivity.getCameraScreenNail().getFrameAvailableFlag() && cameraHardwareFaceArr != null) {
            if (b.iI()) {
                boolean z = cameraHardwareFaceArr.length > 0;
                if (z != this.mFaceDetected && isFrontCamera() && (this.mModuleIndex == 163 || this.mModuleIndex == 165 || this.mModuleIndex == 171)) {
                    this.mCamera2Device.resumePreview();
                }
                this.mFaceDetected = z;
            }
            if (!b.hj() || cameraHardwareFaceArr.length <= 0 || cameraHardwareFaceArr[0].faceType != 64206) {
                if (this.mIsGoogleLensAvailable && this.mActivity != null) {
                    this.mActivity.runOnUiThread(new Runnable(cameraHardwareFaceArr) {
                        private final /* synthetic */ CameraHardwareFace[] f$1;

                        {
                            this.f$1 = r2;
                        }

                        public final void run() {
                            Camera2Module.lambda$onFaceDetected$3(Camera2Module.this, this.f$1);
                        }
                    });
                }
                if (this.mMainProtocol.setFaces(1, cameraHardwareFaceArr, getActiveArraySize(), getDeviceBasedZoomRatio())) {
                    if (this.mIsPortraitLightingOn) {
                        this.mMainProtocol.lightingDetectFace(cameraHardwareFaceArr, false);
                    }
                    if (!this.mMainProtocol.isFaceExists(1) || !this.mMainProtocol.isFocusViewVisible()) {
                        this.mHandler.removeMessages(56);
                    } else if (!this.mHandler.hasMessages(56)) {
                        this.mHandler.sendEmptyMessage(56);
                    }
                }
            } else if (this.mObjectTrackingStarted) {
                this.mMainProtocol.setFaces(3, cameraHardwareFaceArr, getActiveArraySize(), getDeviceBasedZoomRatio());
            }
        }
    }

    public void onFilterChanged(int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onFilterChanged: category = ");
        sb.append(i);
        sb.append(", newIndex = ");
        sb.append(i2);
        Log.d(str, sb.toString());
        updatePreferenceTrampoline(2);
        this.mMainProtocol.updateEffectViewVisible();
    }

    public void onFocusStateChanged(FocusTask focusTask) {
        if (isFrameAvailable() && !isDeparted()) {
            switch (focusTask.getFocusTrigger()) {
                case 1:
                    Log.v(TAG, String.format(Locale.ENGLISH, "FocusTime=%1$dms focused=%2$b", new Object[]{Long.valueOf(focusTask.getElapsedTime()), Boolean.valueOf(focusTask.isSuccess())}));
                    if (!this.mFocusManager.isFocusingSnapOnFinish() && getCameraState() != 3) {
                        setCameraState(1);
                    }
                    this.mFocusManager.onFocusResult(focusTask);
                    this.mActivity.getSensorStateManager().reset();
                    if (focusTask.isSuccess() && this.m3ALocked) {
                        if (isZoomRatioBetweenUltraAndWide() && this.mUltraCameraCapabilities != null) {
                            boolean isAFRegionSupported = this.mUltraCameraCapabilities.isAFRegionSupported();
                            String str = TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("onFocusStateChanged: isUltraFocusAreaSupported = ");
                            sb.append(isAFRegionSupported);
                            Log.d(str, sb.toString());
                            if (!isAFRegionSupported) {
                                this.mCamera2Device.setFocusMode(0);
                                this.mCamera2Device.setFocusDistance(0.0f);
                                this.mUltraWideAELocked = true;
                            }
                        }
                        this.mCamera2Device.lockExposure(true);
                        break;
                    }
                case 2:
                case 3:
                    String str2 = null;
                    if (focusTask.isFocusing()) {
                        str2 = "onAutoFocusMoving start";
                        this.mAFEndLogTimes = 0;
                    } else if (this.mAFEndLogTimes == 0) {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("onAutoFocusMoving end. result=");
                        sb2.append(focusTask.isSuccess());
                        str2 = sb2.toString();
                        this.mAFEndLogTimes++;
                    }
                    if (Util.sIsDumpLog && str2 != null) {
                        Log.v(TAG, str2);
                    }
                    if ((getCameraState() != 3 || focusTask.getFocusTrigger() == 3) && !this.m3ALocked) {
                        this.mFocusManager.onFocusResult(focusTask);
                        break;
                    }
            }
        }
    }

    public void onGradienterSwitched(boolean z) {
        this.mIsGradienterOn = z;
        this.mActivity.getSensorStateManager().setGradienterEnabled(z);
        updatePreferenceTrampoline(2, 5);
    }

    public void onHDRSceneChanged(final boolean z) {
        if (this.isDetectedInHDR != z && !this.mPaused) {
            ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
            if (!componentHdr.isEmpty()) {
                if ("auto".equals(componentHdr.getComponentValue(this.mModuleIndex))) {
                    if (!z || (getZoomRatio() <= 1.0f && this.mCurrentAiScene != -1 && (this.mCamera2Device == null || !this.mCamera2Device.isNeedFlashOn()))) {
                        this.mHandler.post(new Runnable() {
                            public void run() {
                                ((TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172)).alertHDR(z ? 0 : 8, false, false);
                            }
                        });
                        if (z) {
                            if (this.mMutexModePicker.isNormal()) {
                                this.mMutexModePicker.setMutexMode(1);
                            }
                        } else if (this.mMutexModePicker.isMorphoHdr()) {
                            this.mMutexModePicker.resetMutexMode();
                        }
                        this.isDetectedInHDR = z;
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onHDRSceneChanged: ");
                        sb.append(z);
                        Log.d(str, sb.toString());
                    }
                }
            }
        }
    }

    public void onHanGestureSwitched(boolean z) {
        if (z) {
            PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 1);
            PreviewDecodeManager.getInstance().startDecode();
            return;
        }
        PreviewDecodeManager.getInstance().stopDecode(1);
    }

    public void onHostStopAndNotifyActionStop() {
        boolean z;
        super.onHostStopAndNotifyActionStop();
        if (this.mSuperNightDisposable == null || this.mSuperNightDisposable.isDisposed()) {
            z = false;
        } else {
            z = true;
            this.mSuperNightDisposable.dispose();
        }
        if (z || this.mWaitingSuperNightResult) {
            this.mWaitingSuperNightResult = false;
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
            doLaterReleaseIfNeed();
        }
    }

    /* access modifiers changed from: protected */
    public boolean onInterceptZoomingEvent(float f, float f2, int i) {
        if (f2 < HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE) {
            onUltraWideChanged(false, -1);
        }
        return super.onInterceptZoomingEvent(f, f2, i);
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        boolean z = false;
        if (!isFrameAvailable()) {
            return false;
        }
        switch (i) {
            case 24:
            case 25:
            case 87:
            case 88:
                if (i == 24 || i == 88) {
                    z = true;
                }
                if (handleVolumeKeyEvent(z, true, keyEvent.getRepeatCount(), keyEvent.getDevice().isExternal())) {
                    return true;
                }
                break;
            case 27:
            case 66:
                if (keyEvent.getRepeatCount() == 0) {
                    if (!Util.isFingerPrintKeyEvent(keyEvent)) {
                        onShutterButtonClick(40);
                    } else if (CameraSettings.isFingerprintCaptureEnable()) {
                        onShutterButtonClick(30);
                    }
                }
                return true;
            case 80:
                if (keyEvent.getRepeatCount() == 0) {
                    onShutterButtonFocus(true, 1);
                }
                return true;
        }
        return super.onKeyDown(i, keyEvent);
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        if (i == 4 && ((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromKeyBack()) {
            return true;
        }
        return super.onKeyUp(i, keyEvent);
    }

    public void onLivePhotoResultCallback(LivePhotoResult livePhotoResult) {
        this.mLivePhotoQueue.offer(livePhotoResult);
    }

    public void onLongPress(float f, float f2) {
        int i = (int) f;
        int i2 = (int) f2;
        if (isInTapableRect(i, i2)) {
            if (!this.mIsCurrentLensEnabled || !this.mIsGoogleLensAvailable || !CameraSettings.isAvailableLongPressGoogleLens()) {
                onSingleTapUp(i, i2, true);
                if (this.m3ALockSupported && this.mCamera2Device.getFocusMode() != AutoFocus.convertToFocusMode("manual")) {
                    lockAEAF();
                }
                this.mMainProtocol.performHapticFeedback(0);
                return;
            }
            if (DataRepository.dataItemGlobal().getString(CameraSettings.KEY_LONG_PRESS_VIEWFINDER, null) == null) {
                CameraStatUtil.trackGoogleLensPicker();
                FragmentManager fragmentManager = this.mActivity.getFragmentManager();
                $$Lambda$Camera2Module$9KdvQJ1ufYk7McktpCbSN5QWTY r0 = new OnClickListener(f, f2, i, i2) {
                    private final /* synthetic */ float f$1;
                    private final /* synthetic */ float f$2;
                    private final /* synthetic */ int f$3;
                    private final /* synthetic */ int f$4;

                    {
                        this.f$1 = r2;
                        this.f$2 = r3;
                        this.f$3 = r4;
                        this.f$4 = r5;
                    }

                    public final void onOptionClick(int i) {
                        Camera2Module.lambda$onLongPress$5(Camera2Module.this, this.f$1, this.f$2, this.f$3, this.f$4, i);
                    }
                };
                GoogleLensFragment.showOptions(fragmentManager, r0);
            } else {
                CameraStatUtil.trackGoogleLensTouchAndHold();
                LensAgent.getInstance().onFocusChange(0, f / ((float) Util.sWindowWidth), f2 / ((float) Util.sWindowHeight));
            }
        }
    }

    public void onObjectStable() {
    }

    public void onOrientationChanged(int i, int i2, int i3) {
        if (!this.mIsGradienterOn) {
            setOrientation(i, i2);
        }
    }

    public void onPause() {
        super.onPause();
        stopLiveShot(true);
        if (this.mFocusManager != null) {
            this.mFocusManager.removeMessages();
        }
        resetGradienter();
        tryRemoveCountDownMessage();
        this.mActivity.getSensorStateManager().reset();
        resetScreenOn();
        closeCamera();
        releaseEffectProcessor();
        if (!b.fY()) {
            this.mActivity.runOnUiThread(new Runnable() {
                public final void run() {
                    Camera2Module.lambda$onPause$7(Camera2Module.this);
                }
            });
        }
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onPictureTaken(byte[] bArr) {
    }

    public void onPictureTakenFinished(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onPictureTakenFinished: succeed = ");
        sb.append(z);
        Log.d(str, sb.toString());
        if (this.mPaused) {
            Log.d(TAG, "onPictureTakenFinished: but Camera exit in other thread, return to avoid unknown crash");
            return;
        }
        if (z) {
            trackGeneralInfo(1, false);
            trackPictureTaken(1, false, this.mLocation != null, getCurrentAiSceneName(), this.mEnteringMoonMode, this.mIsMoonMode);
            long currentTimeMillis = System.currentTimeMillis() - this.mCaptureStartTime;
            CameraStatUtil.trackTakePictureCost(currentTimeMillis, isFrontCamera(), this.mModuleIndex);
            if (this.mModuleIndex == 171 && DataRepository.dataItemFeature().isSupportBokehAdjust()) {
                CameraStatUtil.trackBokehTaken();
            }
            ScenarioTrackUtil.trackCaptureTimeEnd();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("mCaptureStartTime(from onShutterButtonClick start to jpegCallback finished) = ");
            sb2.append(currentTimeMillis);
            sb2.append("ms");
            Log.d(str2, sb2.toString());
            if (this.mIsImageCaptureIntent) {
                if (this.mQuickCapture) {
                    doAttach();
                } else if (isAlive()) {
                    this.mKeepBitmapTexture = true;
                    showPostCaptureAlert();
                }
            } else if (this.mLongPressedAutoFocus) {
                this.mLongPressedAutoFocus = false;
                this.mFocusManager.cancelLongPressedAutoFocus();
            }
        }
        this.mReceivedJpegCallbackNum++;
        if (!isKeptBitmapTexture() && !this.mMultiSnapStatus && this.mBlockQuickShot && (!CameraSettings.isGroupShotOn() || (CameraSettings.isGroupShotOn() && z))) {
            setCameraState(1);
            enableCameraControls(true);
            this.mBlockQuickShot = false;
        }
        this.mHandler.removeMessages(50);
        if (this.mModuleIndex == 173) {
            this.mWaitingSuperNightResult = false;
            if (this.mSuperNightDisposable != null && !this.mSuperNightDisposable.isDisposed()) {
                this.mSuperNightDisposable.dispose();
            }
            Completable.fromAction(new Action() {
                public void run() {
                    RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
                    if (recordState != null) {
                        recordState.onPostSavingFinish();
                    }
                }
            }).subscribeOn(AndroidSchedulers.mainThread()).subscribe();
        }
        doLaterReleaseIfNeed();
        PreviewDecodeManager.getInstance().resetScanResult();
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
            boolean z = false;
            if (DataRepository.dataItemFeature().gl() || !isFrontCamera()) {
                this.mShouldDoMFNR = false;
            } else if (b.iK()) {
                this.mShouldDoMFNR = true;
            } else {
                Integer num = (Integer) captureResult.get(CaptureResult.SENSOR_SENSITIVITY);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onPreviewMetaDataUpdate: iso = ");
                sb.append(num);
                Log.c(str, sb.toString());
                if (num != null && num.intValue() >= 800) {
                    z = true;
                }
                this.mShouldDoMFNR = z;
            }
            if (this.mMetaDataFlowableEmitter != null) {
                this.mMetaDataFlowableEmitter.onNext(captureResult);
            }
            if (!(this.mAiSceneFlowableEmitter == null || !this.mAiSceneEnabled || this.mCamera2Device == null)) {
                this.mAiSceneFlowableEmitter.onNext(captureResult);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:52:0x014b, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onPreviewPixelsRead(byte[] bArr, int i, int i2) {
        boolean z;
        byte[] bArr2;
        boolean z2;
        animateCapture();
        playCameraSound(0);
        Bitmap createBitmap = Bitmap.createBitmap(i, i2, Config.ARGB_8888);
        createBitmap.copyPixelsFromBuffer(ByteBuffer.wrap(bArr));
        boolean z3 = isFrontCamera() && !isFrontMirror();
        if (this.mEnableParallelSession) {
            if (this.mIsGradienterOn) {
                createBitmap = Util.rotateAndUpscaleBitmap(createBitmap, this.mShootRotation, z3, this.mModuleIndex == 165);
                z2 = false;
                z = true;
            } else if (z3) {
                Bitmap flipBitmap = (this.mOrientation == 90 || this.mOrientation == 270) ? Util.flipBitmap(createBitmap, 1) : Util.flipBitmap(createBitmap, 0);
                createBitmap = flipBitmap;
                z = false;
                z2 = false;
            } else {
                z2 = z3;
                z = false;
            }
            bArr2 = Util.getBitmapData(createBitmap);
        } else {
            z2 = z3;
            z = false;
            bArr2 = null;
        }
        int i3 = this.mShootOrientation - this.mDisplayRotation;
        if (isFrontCamera() && b.ik() && i3 % 180 == 0) {
            i3 = 0;
        }
        synchronized (this.mCameraDeviceLock) {
            if (isAlive()) {
                if (isDeviceAlive()) {
                    if (z) {
                        i3 = 0;
                    }
                    Thumbnail createThumbnail = Thumbnail.createThumbnail(null, createBitmap, i3, z2);
                    createThumbnail.startWaitingForUri();
                    this.mActivity.getThumbnailUpdater().setThumbnail(createThumbnail, true, true);
                    this.mCamera2Device.onPreviewThumbnailReceived(createThumbnail);
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onPreviewPixelsRead: isParallel = ");
                    sb.append(this.mEnableParallelSession);
                    sb.append(" data = ");
                    sb.append(bArr2);
                    Log.d(str, sb.toString());
                    if (bArr2 != null && this.mEnableParallelSession) {
                        String parallelShotSavePath = this.mCamera2Device.getParallelShotSavePath();
                        ParallelTaskData parallelTaskData = new ParallelTaskData(System.currentTimeMillis(), -1, parallelShotSavePath);
                        parallelTaskData.fillJpegData(bArr2, 0);
                        parallelTaskData.fillParameter(new Builder(new Size(i, i2), new Size(i, i2), new Size(i, i2)).setOrientation(this.mOrientation).build());
                        if (DbRepository.dbItemSaveTask().getItemByPath(parallelShotSavePath) == null) {
                            SaveTask saveTask = (SaveTask) DbRepository.dbItemSaveTask().generateItem(System.currentTimeMillis());
                            saveTask.setPath(parallelTaskData.getSavePath());
                            DbRepository.dbItemSaveTask().endItemAndInsert(saveTask, 0);
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("onPreviewPixelsRead endItemAndInsert end getSavePath:");
                            sb2.append(parallelShotSavePath);
                            Log.d(str2, sb2.toString());
                        }
                        this.mActivity.getImageSaver().onParallelProcessFinish(parallelTaskData);
                    }
                }
            }
            Log.d(TAG, "onPreviewPixelsRead: module is dead");
        }
    }

    public void onPreviewSessionClosed(CameraCaptureSession cameraCaptureSession) {
        Log.d(TAG, "onPreviewSessionClosed: ");
        setCameraState(0);
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        if (!isTextureExpired() || !retryOnceIfCameraError(this.mHandler)) {
            this.mHandler.sendEmptyMessage(51);
        } else {
            Log.d(TAG, "sessionFailed due to surfaceTexture expired, retry");
        }
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onPreviewSessionSuccess: ");
        sb.append(Thread.currentThread().getName());
        Log.d(str, sb.toString());
        if (cameraCaptureSession != null && isAlive()) {
            if (!isKeptBitmapTexture()) {
                this.mHandler.sendEmptyMessage(9);
            }
            if (this.mEnableParallelSession) {
                configParallelSession();
            }
            previewWhenSessionSuccess();
            if (this.mActivity.getCameraIntentManager().checkCallerLegality()) {
                if (!this.mActivity.getCameraIntentManager().isOpenOnly()) {
                    this.mActivity.getIntent().removeExtra(CameraExtras.CAMERA_OPEN_ONLY);
                    this.mHandler.sendEmptyMessageDelayed(52, 1000);
                } else {
                    this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
                }
            }
        }
    }

    public void onPreviewSizeChanged(int i, int i2) {
        if (this.mFocusManager != null) {
            this.mFocusManager.setPreviewSize(i, i2);
        }
    }

    public void onResume() {
        super.onResume();
        this.mHandler.removeMessages(50);
        if (!isSelectingCapturedResult()) {
            this.mKeepBitmapTexture = false;
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
        }
        keepScreenOnAwhile();
        if (!b.fY()) {
            this.mActivity.runOnUiThread(new Runnable() {
                public final void run() {
                    Camera2Module.lambda$onResume$6(Camera2Module.this);
                }
            });
        }
    }

    public void onReviewCancelClicked() {
        this.mKeepBitmapTexture = false;
        if (isSelectingCapturedResult()) {
            this.mActivity.getCameraScreenNail().releaseBitmapIfNeeded();
            hidePostCaptureAlert();
            return;
        }
        this.mActivity.setResult(0, new Intent());
        this.mActivity.finish();
    }

    public void onReviewDoneClicked() {
        doAttach();
    }

    public void onShutterButtonClick(int i) {
        if (i == 100) {
            this.mActivity.onUserInteraction();
        }
        int countDownTimes = getCountDownTimes(i);
        if (countDownTimes > 0) {
            startCount(countDownTimes, i);
        } else if (checkShutterCondition()) {
            setTriggerMode(i);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onShutterButtonClick ");
            sb.append(String.valueOf(getCameraState()));
            Log.d(str, sb.toString());
            this.mFocusManager.prepareCapture(this.mNeedAutoFocus, 2);
            this.mFocusManager.doSnap();
            if (this.mFocusManager.isFocusingSnapOnFinish()) {
                enableCameraControls(false);
            }
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public boolean onShutterButtonLongClick() {
        if (isDoingAction() || this.mIsImageCaptureIntent) {
            return false;
        }
        if (!CameraSettings.isBurstShootingEnable() || !ModuleManager.isCameraModule() || this.mIsImageCaptureIntent || CameraSettings.isGroupShotOn() || CameraSettings.isGradienterOn() || CameraSettings.isTiltShiftOn() || DataRepository.dataItemRunning().isSwitchOn("pref_camera_hand_night_key") || DataRepository.dataItemRunning().isSwitchOn("pref_camera_scenemode_setting_key") || CameraSettings.isStereoModeOn() || CameraSettings.isPortraitModeBackOn() || !isBackCamera() || this.mMultiSnapStatus || this.mHandler.hasMessages(24) || this.mPendingMultiCapture || isUltraWideBackCamera() || CameraSettings.isUltraPixelOn()) {
            this.mLongPressedAutoFocus = true;
            this.mMainProtocol.setFocusViewType(false);
            this.mFocusManager.requestAutoFocus();
            this.mActivity.getScreenHint().updateHint();
            return false;
        }
        if (b.hv()) {
            this.mUpdateImageTitle = true;
        }
        this.mPendingMultiCapture = true;
        this.mFocusManager.doMultiSnap(true);
        return true;
    }

    public void onShutterButtonLongClickCancel(boolean z) {
        Log.d(TAG, "onShutterButtonLongClickCancel: start");
        this.mPendingMultiCapture = false;
        if (this.mMultiSnapStatus) {
            this.mHandler.sendEmptyMessageDelayed(49, FragmentTopAlert.HINT_DELAY_TIME);
        }
        this.mMultiSnapStopRequest = true;
        if (!this.mLongPressedAutoFocus) {
            return;
        }
        if (z) {
            onShutterButtonClick(10);
            return;
        }
        this.mLongPressedAutoFocus = false;
        this.mFocusManager.cancelLongPressedAutoFocus();
    }

    public void onSingleTapUp(int i, int i2, boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onSingleTapUp mPaused: ");
        sb.append(this.mPaused);
        sb.append("; mCamera2Device: ");
        sb.append(this.mCamera2Device);
        sb.append("; isInCountDown: ");
        sb.append(isInCountDown());
        sb.append("; getCameraState: ");
        sb.append(getCameraState());
        sb.append("; mMultiSnapStatus: ");
        sb.append(this.mMultiSnapStatus);
        sb.append("; Camera2Module: ");
        sb.append(this);
        Log.v(str, sb.toString());
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && this.mCamera2Device.isPreviewReady() && isInTapableRect(i, i2) && getCameraState() != 3 && getCameraState() != 4 && getCameraState() != 0 && !isInCountDown() && !this.mMultiSnapStatus) {
            if (this.mIsMoonMode) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                boolean z2 = false;
                boolean z3 = miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow();
                if (topAlert != null && topAlert.isExtraMenuShowing()) {
                    z2 = true;
                }
                if (!z3 && !z2) {
                    return;
                }
            }
            if (isFrameAvailable()) {
                if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2)) {
                    tryRemoveCountDownMessage();
                    if ((this.mFocusAreaSupported || this.mMeteringAreaSupported) && !this.mMutexModePicker.isUbiFocus()) {
                        if (this.mObjectTrackingStarted) {
                            stopObjectTracking(true);
                        }
                        this.mMainProtocol.setFocusViewType(true);
                        Point point = new Point(i, i2);
                        mapTapCoordinate(point);
                        unlockAEAF();
                        setCameraState(2);
                        this.mFocusManager.onSingleTapUp(point.x, point.y, z);
                        if (!this.mFocusAreaSupported && this.mMeteringAreaSupported) {
                            this.mActivity.getSensorStateManager().reset();
                        }
                    }
                }
            }
        }
    }

    public void onStop() {
        super.onStop();
        if (this.mHandler != null) {
            this.mHandler.removeCallbacksAndMessages(null);
        }
    }

    public void onSurfaceTextureReleased() {
        Log.d(TAG, "onSurfaceTextureReleased: no further preview frame will be available");
    }

    public void onSurfaceTextureUpdated(DrawExtTexAttribute drawExtTexAttribute) {
        if (this.mCircularMediaRecorder != null) {
            this.mCircularMediaRecorder.onSurfaceTextureUpdated(drawExtTexAttribute);
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.onPreviewComing();
        }
    }

    public void onThumbnailClicked(View view) {
        if (!isDoingAction() && this.mActivity.getThumbnailUpdater().getThumbnail() != null) {
            this.mActivity.gotoGallery();
        }
    }

    public void onTiltShiftSwitched(boolean z) {
        if (z) {
            resetEvValue();
        }
        this.mMainProtocol.initEffectCropView();
        updatePreferenceTrampoline(2, 5);
        this.mMainProtocol.updateEffectViewVisible();
        this.mMainProtocol.setEvAdjustable(!z);
    }

    public void onUltraWideChanged(boolean z, int i) {
        this.mHandler.post(new Runnable(z, i) {
            private final /* synthetic */ boolean f$1;
            private final /* synthetic */ int f$2;

            {
                this.f$1 = r2;
                this.f$2 = r3;
            }

            public final void run() {
                Camera2Module.lambda$onUltraWideChanged$11(Camera2Module.this, this.f$1, this.f$2);
            }
        });
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (!isDoingAction()) {
            keepScreenOnAwhile();
        }
    }

    public boolean onWaitingFocusFinished() {
        if (isBlockSnap() || !isAlive()) {
            return false;
        }
        startNormalCapture(getTriggerMode());
        return true;
    }

    public void onZoomingActionEnd(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onZoomingActionEnd(): ");
        sb.append(ZoomingAction.toString(i));
        Log.d(str, sb.toString());
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null && !dualController.isSlideVisible()) {
            if (i == 1 || i == 2) {
                dualController.setImmersiveModeEnabled(false);
            }
        }
    }

    public void onZoomingActionStart(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onZoomingActionStart(): ");
        sb.append(ZoomingAction.toString(i));
        Log.d(str, sb.toString());
        TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        if (topAlert != null && topAlert.isExtraMenuShowing()) {
            topAlert.hideExtraMenu();
        }
        if (!isZoomEnabled() && CameraSettings.isUltraPixelOn()) {
            BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
            if (bottomPopupTips != null) {
                bottomPopupTips.showTips(15, R.string.zoom_no_support_tip_48M, 1);
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController == null) {
            return;
        }
        if (i == 1 || i == 2) {
            dualController.setImmersiveModeEnabled(true);
        }
    }

    /* access modifiers changed from: protected */
    public void openSettingActivity() {
        Intent intent = new Intent();
        intent.setClass(this.mActivity, CameraPreferenceActivity.class);
        intent.putExtra(BasePreferenceActivity.FROM_WHERE, this.mModuleIndex);
        intent.putExtra(CameraPreferenceActivity.IS_IMAGE_CAPTURE_INTENT, this.mIsImageCaptureIntent);
        intent.putExtra(":miui:starting_window_label", getResources().getString(R.string.pref_camera_settings_category));
        if (this.mActivity.startFromKeyguard()) {
            intent.putExtra("StartActivityWhenLocked", true);
        }
        this.mActivity.startActivity(intent);
        this.mActivity.setJumpFlag(2);
        CameraStatUtil.trackGotoSettings(this.mModuleIndex);
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        if (this.mCamera2Device != null) {
            this.mCamera2Device.pausePreview();
        }
        setCameraState(0);
    }

    /* access modifiers changed from: protected */
    public void performVolumeKeyClicked(String str, int i, boolean z) {
        if (!this.mPaused && getCameraState() != 0) {
            if (!isDoingAction()) {
                restoreBottom();
            }
            if (i == 0) {
                if (z) {
                    onShutterButtonFocus(true, 1);
                    if (str.equals(getString(R.string.pref_camera_volumekey_function_entryvalue_timer))) {
                        startCount(2, 20);
                    } else {
                        onShutterButtonClick(20);
                    }
                } else {
                    onShutterButtonFocus(false, 0);
                    if (this.mVolumeLongPress) {
                        this.mVolumeLongPress = false;
                        onShutterButtonLongClickCancel(false);
                    }
                }
            } else if (z && !this.mVolumeLongPress) {
                this.mUpdateImageTitle = true;
                this.mVolumeLongPress = onShutterButtonLongClick();
                if (!this.mVolumeLongPress && this.mLongPressedAutoFocus) {
                    this.mVolumeLongPress = true;
                }
            }
        }
    }

    public void playFocusSound(int i) {
        playCameraSound(i);
    }

    public void reShowMoon() {
        if (this.mEnteringMoonMode) {
            showMoonMode(this.mIsMoonMode);
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(195, this);
        getActivity().getImplFactory().initAdditional(getActivity(), 164, 174, 199);
        boolean z = false;
        if (getModuleIndex() == 173) {
            getActivity().getImplFactory().initAdditional(getActivity(), 212);
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("registerProtocol: mIsGoogleLensAvailable = ");
        sb.append(this.mIsGoogleLensAvailable);
        sb.append(", activity is null ? ");
        if (this.mActivity == null) {
            z = true;
        }
        sb.append(z);
        Log.d(str, sb.toString());
        if (this.mIsGoogleLensAvailable && this.mActivity != null) {
            this.mActivity.runOnUiThread(new Runnable() {
                public final void run() {
                    Camera2Module.lambda$registerProtocol$0(Camera2Module.this);
                }
            });
        }
    }

    /* access modifiers changed from: protected */
    public void resetMetaDataManager() {
        CameraSettings.isSupportedMetadata();
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        previewWhenSessionSuccess();
        this.mBlockQuickShot = !CameraSettings.isCameraQuickShotEnable();
    }

    public boolean scanQRCodeEnabled() {
        return CameraSettings.isScanQRCode(this.mActivity) && this.mModuleIndex == 163 && !this.mIsImageCaptureIntent && CameraSettings.isBackCamera() && !this.mMultiSnapStatus && !CameraSettings.isStereoModeOn() && !CameraSettings.isPortraitModeBackOn() && (!DataRepository.dataItemFeature().gm() || !CameraSettings.isUltraPixelOn()) && !CameraSettings.isUltraWideConfigOpen(this.mModuleIndex) && !CameraSettings.isMacroModeEnabled(this.mModuleIndex);
    }

    /* access modifiers changed from: protected */
    public void sendOpenFailMessage() {
        this.mHandler.sendEmptyMessage(10);
    }

    public void setFrameAvailable(boolean z) {
        super.setFrameAvailable(z);
        if (z && this.mActivity != null && CameraSettings.isCameraSoundOpen()) {
            this.mActivity.loadCameraSound(1);
            this.mActivity.loadCameraSound(0);
            this.mActivity.loadCameraSound(4);
            this.mActivity.loadCameraSound(5);
            this.mActivity.loadCameraSound(7);
        }
        if (z && this.mCamera2Device != null) {
            this.mCamera2Device.releaseFakeSurfaceIfNeed();
        }
    }

    public boolean shouldReleaseLater() {
        return !this.mIsImageCaptureIntent && getCameraState() == 3 && !this.mMultiSnapStatus && (this.mHandler == null || (!this.mHandler.hasMessages(48) && !this.mHandler.hasMessages(49))) && !this.mFocusManager.isFocusing() && (this.mModuleIndex != 167 || getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default)).equals(getString(R.string.pref_camera_exposuretime_default)));
    }

    public void showOrHideChip(boolean z) {
        if (this.mIsGoogleLensAvailable) {
            boolean z2 = false;
            if (z) {
                BottomPopupTips bottomPopupTips = (BottomPopupTips) ModeCoordinatorImpl.getInstance().getAttachProtocol(175);
                boolean z3 = bottomPopupTips != null && bottomPopupTips.isTipShowing();
                DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
                boolean z4 = dualController != null && dualController.isSlideVisible();
                MakeupProtocol makeupProtocol = (MakeupProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(180);
                boolean z5 = makeupProtocol != null && makeupProtocol.isSeekBarVisible();
                MiBeautyProtocol miBeautyProtocol = (MiBeautyProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(194);
                boolean z6 = miBeautyProtocol != null && miBeautyProtocol.isBeautyPanelShow();
                boolean z7 = !this.mIsAiConflict && !this.mIsFaceConflict && !this.mIsUltraWideConflict && !this.mIsMoonMode && !z3 && !z4 && !z5 && !z6;
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("pre showOrHideChip: isTipsShow = ");
                sb.append(z3);
                sb.append(", isZoomSlideVisible = ");
                sb.append(z4);
                sb.append(", isSeekBarVisible = ");
                sb.append(z5);
                sb.append(", isMakeupVisible = ");
                sb.append(z6);
                sb.append(", mIsAiConflict = ");
                sb.append(this.mIsAiConflict);
                sb.append(", mIsUltraWideConflict = ");
                sb.append(this.mIsUltraWideConflict);
                sb.append(", mIsMoonMode = ");
                sb.append(this.mIsMoonMode);
                sb.append(", mIsFaceConflict = ");
                sb.append(this.mIsFaceConflict);
                sb.append(", final isShow = ");
                sb.append(z7);
                sb.append(", mIsCurrentLensEnabled = ");
                sb.append(this.mIsCurrentLensEnabled);
                Log.d(str, sb.toString());
                z = z7;
            }
            if (this.mIsCurrentLensEnabled != z) {
                this.mIsCurrentLensEnabled = z;
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("showOrHideChip: show = ");
                sb2.append(z);
                sb2.append(", isChipsEnabled = ");
                sb2.append(CameraSettings.isAvailableChipsGoogleLens());
                Log.d(str2, sb2.toString());
                LensAgent instance = LensAgent.getInstance();
                if (z && CameraSettings.isAvailableChipsGoogleLens()) {
                    z2 = true;
                }
                instance.showOrHideChip(z2);
            }
        }
    }

    public void showQRCodeResult() {
        if (!this.mPaused) {
            String scanResult = PreviewDecodeManager.getInstance().getScanResult();
            if (scanResult == null || scanResult.isEmpty()) {
                Log.e(TAG, "showQRCodeResult: get a null result!");
                return;
            }
            Camera camera = this.mActivity;
            camera.dismissKeyguard();
            Intent intent = new Intent(Util.QRCODE_RECEIVER_ACTION);
            intent.addFlags(32);
            intent.setPackage("com.xiaomi.scanner");
            intent.putExtra("result", scanResult);
            camera.sendBroadcast(intent);
            camera.setJumpFlag(3);
            PreviewDecodeManager.getInstance().resetScanResult();
        }
    }

    public void startAiLens() {
        this.mHandler.postDelayed(new Runnable() {
            public void run() {
                Camera2Module.this.startLensActivity();
            }
        }, 300);
    }

    public void startFaceDetection() {
        if (this.mFaceDetectionEnabled && !this.mFaceDetectionStarted && this.mActivity != null && !this.mActivity.isActivityPaused() && isAlive() && this.mMaxFaceCount > 0 && this.mCamera2Device != null) {
            this.mFaceDetectionStarted = true;
            this.mMainProtocol.setActiveIndicator(1);
            this.mCamera2Device.startFaceDetection();
            updateFaceView(true, true);
        }
    }

    public void startFocus() {
        if (isDeviceAlive() && isFrameAvailable()) {
            if (this.mFocusOrAELockSupported) {
                this.mCamera2Device.startFocus(FocusTask.create(1), this.mModuleIndex);
            } else {
                this.mCamera2Device.resumePreview();
            }
        }
    }

    public void startLiveShot() {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (this.mCircularMediaRecorder == null) {
                CircularMediaRecorder circularMediaRecorder = new CircularMediaRecorder(this.mVideoSize.width, this.mVideoSize.height, getActivity().getGLView().getEGLContext14(), this.mIsMicrophoneEnabled, this.mLivePhotoQueue);
                this.mCircularMediaRecorder = circularMediaRecorder;
            }
            this.mLiveShotEnabled = true;
            this.mCircularMediaRecorder.setOrientationHint(this.mOrientationCompensation);
            this.mCircularMediaRecorder.start();
        }
        this.mActivity.getSensorStateManager().setGyroscopeEnabled(true);
    }

    public void startObjectTracking() {
    }

    /* JADX WARNING: Removed duplicated region for block: B:33:0x00e6  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00f9  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x0100  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startPreview() {
        boolean z;
        boolean z2;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setMetaDataCallback(this);
            this.mCamera2Device.setScreenLightCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("startPreview: set PictureSize with ");
            sb.append(this.mPictureSize);
            Log.d(str, sb.toString());
            this.mCamera2Device.setPictureSize(this.mPictureSize);
            if (this.mEnableParallelSession && isPortraitMode()) {
                CameraSize bestSubPictureSize = getBestSubPictureSize(35, isFrontCamera(), this.mPictureSize);
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("startPreview: set SubPictureSize with ");
                sb2.append(bestSubPictureSize);
                Log.d(str2, sb2.toString());
                this.mCamera2Device.setSubPictureSize(bestSubPictureSize);
            }
            boolean z3 = false;
            boolean z4 = this.mEnableParallelSession && isEnableQcfa();
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("[QCFA] startPreview: set qcfa enable ");
            sb3.append(z4);
            Log.d(str3, sb3.toString());
            this.mCamera2Device.setQcfaEnable(z4);
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            if (!this.mIsGoogleLensAvailable) {
                if (scanQRCodeEnabled()) {
                    PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 0);
                    z2 = true;
                } else {
                    z2 = false;
                }
                if (b.ge() && isFrontCamera() && (this.mModuleIndex == 163 || this.mModuleIndex == 171)) {
                    z3 = true;
                }
                if (z3) {
                    PreviewDecodeManager.getInstance().init(this.mBogusCameraId, 1);
                } else {
                    z = z2;
                    if (z) {
                        PreviewDecodeManager.getInstance().initHandler();
                    }
                    SurfaceTexture surfaceTexture = this.mActivity.getCameraScreenNail().getSurfaceTexture();
                    this.mCamera2Device.startPreviewSession(surfaceTexture == null ? new Surface(surfaceTexture) : null, z, isNeedRawStream(), getOperatingMode(), this.mEnableParallelSession, this, PreviewDecodeManager.getInstance().getHandler());
                }
            }
            z = true;
            if (z) {
            }
            SurfaceTexture surfaceTexture2 = this.mActivity.getCameraScreenNail().getSurfaceTexture();
            this.mCamera2Device.startPreviewSession(surfaceTexture2 == null ? new Surface(surfaceTexture2) : null, z, isNeedRawStream(), getOperatingMode(), this.mEnableParallelSession, this, PreviewDecodeManager.getInstance().getHandler());
        }
    }

    public void startScreenLight(final int i, final int i2) {
        if (!this.mPaused) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    if (Camera2Module.this.mActivity != null) {
                        Camera2Module.this.mActivity.setWindowBrightness(i2);
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

    public void stopFaceDetection(boolean z) {
        if (this.mFaceDetectionEnabled && this.mFaceDetectionStarted) {
            if (!b.isMTKPlatform() || !(getCameraState() == 3 || getCameraState() == 0)) {
                this.mCamera2Device.stopFaceDetection();
            }
            this.mFaceDetectionStarted = false;
            this.mMainProtocol.setActiveIndicator(2);
            updateFaceView(false, z);
        }
    }

    public void stopLiveShot(boolean z) {
        synchronized (this.mCircularMediaRecorderStateLock) {
            if (this.mCircularMediaRecorder != null) {
                this.mCircularMediaRecorder.stop();
                if (z) {
                    this.mCircularMediaRecorder.release();
                    this.mCircularMediaRecorder = null;
                }
            }
            this.mLiveShotEnabled = false;
        }
        this.mActivity.getSensorStateManager().setGyroscopeEnabled(false);
        this.mLivePhotoQueue.clear();
    }

    public void stopObjectTracking(boolean z) {
    }

    public void stopScreenLight() {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (Camera2Module.this.mActivity != null) {
                    Camera2Module.this.mActivity.restoreWindowBrightness();
                }
                FullScreenProtocol fullScreenProtocol = (FullScreenProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(196);
                String access$400 = Camera2Module.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("stopScreenLight: protocol = ");
                sb.append(fullScreenProtocol);
                sb.append(", mHandler = ");
                sb.append(Camera2Module.this.mHandler);
                Log.d(access$400, sb.toString());
                if (fullScreenProtocol != null) {
                    fullScreenProtocol.hideScreenLight();
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public void trackModeCustomInfo(int i) {
        if (this.mModuleIndex == 167) {
            trackManualInfo(i);
        } else if (this.mModuleIndex == 163) {
            if (isFaceBeautyOn(this.mBeautyValues)) {
                trackBeautyInfo(i, isFrontCamera(), new BeautyValues(this.mBeautyValues));
            }
            CameraStatUtil.trackUltraWidePictureTaken();
        } else if (this.mModuleIndex == 165) {
            CameraStatUtil.trackUltraWidePictureTaken();
        }
    }

    public void tryRemoveCountDownMessage() {
        if (this.mCountdownDisposable != null && !this.mCountdownDisposable.isDisposed()) {
            this.mCountdownDisposable.dispose();
            this.mCountdownDisposable = null;
            this.mHandler.post(new Runnable() {
                public void run() {
                    Log.d(Camera2Module.TAG, "run: hide delay number in main thread");
                    Camera2Module.this.mMainProtocol.hideDelayNumber();
                }
            });
        }
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("unRegisterProtocol: mIsGoogleLensAvailable = ");
        sb.append(this.mIsGoogleLensAvailable);
        sb.append(", activity is null ? ");
        sb.append(this.mActivity == null);
        Log.d(str, sb.toString());
        if (this.mIsGoogleLensAvailable && this.mActivity != null) {
            this.mActivity.runOnUiThread(new Runnable() {
                public final void run() {
                    Camera2Module.lambda$unRegisterProtocol$1(Camera2Module.this);
                }
            });
        }
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(165, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(193, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(195, this);
        getActivity().getImplFactory().detachAdditional();
    }

    public void updateBacklight() {
        if (!isDoingAction() && isAlive()) {
            this.isSilhouette = false;
            applyBacklightEffect();
            resumePreviewInWorkThread();
        }
    }

    /* access modifiers changed from: protected */
    public void updateFaceView(boolean z, boolean z2) {
        if (this.mHandler.hasMessages(35)) {
            this.mHandler.removeMessages(35);
        }
        this.mHandler.obtainMessage(35, z ? 1 : 0, z2 ? 1 : 0).sendToTarget();
    }

    public void updateFlashPreference() {
        String componentValue = DataRepository.dataItemConfig().getComponentFlash().getComponentValue(this.mModuleIndex);
        String requestFlashMode = getRequestFlashMode();
        if (Util.parseInt(requestFlashMode, 0) != 0) {
            resetAiSceneInHdrOrFlashOn();
        }
        setFlashMode(requestFlashMode);
        if (!TextUtils.equals(componentValue, this.mLastFlashMode) && (Util.parseInt(componentValue, 0) == 103 || Util.parseInt(componentValue, 0) == 0)) {
            resetAsdSceneInHdrOrFlashChange();
        }
        this.mLastFlashMode = componentValue;
        stopObjectTracking(true);
    }

    public void updateHDRPreference() {
        ComponentConfigHdr componentHdr = DataRepository.dataItemConfig().getComponentHdr();
        if (!componentHdr.isEmpty()) {
            String componentValue = componentHdr.getComponentValue(this.mModuleIndex);
            if (this.mIsMoonMode) {
                componentValue = "off";
            }
            if (getZoomRatio() != 1.0f && this.mMutexModePicker.isHdr() && "auto".equals(componentValue)) {
                onHDRSceneChanged(false);
            }
            updateHDR(componentValue);
            if ((!"off".equals(componentValue) || this.mAiSceneEnabled) && getZoomRatio() == 1.0f) {
                resetAiSceneInHdrOrFlashOn();
                resetAsdSceneInHdrOrFlashChange();
                if ("auto".equals(componentValue)) {
                    this.mHdrCheckEnabled = true;
                } else {
                    this.mHdrCheckEnabled = false;
                }
                this.mCamera2Device.setHDRCheckerEnable(true);
            } else {
                this.mCamera2Device.setHDRCheckerEnable(false);
                this.mHdrCheckEnabled = false;
            }
        }
    }

    public void updateManualEvAdjust() {
        if (this.mModuleIndex == 167) {
            String manualValue = getManualValue(CameraSettings.KEY_QC_EXPOSURETIME, getString(R.string.pref_camera_exposuretime_default));
            String manualValue2 = getManualValue(CameraSettings.KEY_QC_ISO, getString(R.string.pref_camera_iso_default));
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("MODE_MANUAL: exposureTime = ");
            sb.append(manualValue);
            sb.append("iso = ");
            sb.append(manualValue2);
            Log.d(str, sb.toString());
            boolean z = b.iC() ? getString(R.string.pref_camera_exposuretime_default).equals(manualValue) : getString(R.string.pref_camera_iso_default).equals(manualValue2) || getString(R.string.pref_camera_exposuretime_default).equals(manualValue);
            if (this.mHandler != null) {
                this.mHandler.post(new Runnable(z) {
                    private final /* synthetic */ boolean f$1;

                    {
                        this.f$1 = r2;
                    }

                    public final void run() {
                        Camera2Module.this.mMainProtocol.setEvAdjustable(this.f$1);
                    }
                });
            }
            if (1 == this.mCamera2Device.getFocusMode() && this.m3ALocked) {
                if (this.mActivity != null) {
                    this.mActivity.runOnUiThread(new Runnable() {
                        public final void run() {
                            Camera2Module.this.mFocusManager.cancelFocus();
                        }
                    });
                }
                unlockAEAF();
            }
        }
    }

    public void updateMoon(boolean z) {
        if (z) {
            this.mIsMoonMode = true;
            this.mCamera2Device.setSuperResolution(false);
            updateFocusMode();
            updateHDRPreference();
            this.mCurrentAiScene = 35;
            this.mCamera2Device.setASDScene(35);
            resumePreviewInWorkThread();
            if (this.mZoomSupported) {
                setMinZoomRatio(1.0f);
                setMaxZoomRatio(20.0f);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("updateMoon(): Override zoom ratio range to: [");
                sb.append(getMinZoomRatio());
                sb.append(",");
                sb.append(getMaxZoomRatio());
                sb.append("]");
                Log.d(str, sb.toString());
            }
        } else if (this.mIsMoonMode) {
            this.mIsMoonMode = false;
            setFocusMode(this.mFocusManager.setFocusMode(CameraSettings.getFocusMode()));
            updateHDRPreference();
            this.mCamera2Device.setASDScene(-35);
            initializeZoomRangeFromCapabilities();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("updateMoon(): Restore zoom ratio range to: [");
            sb2.append(getMinZoomRatio());
            sb2.append(",");
            sb2.append(getMaxZoomRatio());
            sb2.append("]");
            Log.d(str2, sb2.toString());
            if (getZoomRatio() > getMaxZoomRatio()) {
                onZoomingActionUpdate(getMaxZoomRatio(), -1);
            }
        }
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null) {
            dualController.hideSlideView();
        }
    }

    public void updateMoonNight() {
        this.mIsMoonMode = false;
        checkCloseMoonMode(10, 0);
        ((ConfigChanges) ModeCoordinatorImpl.getInstance().getAttachProtocol(164)).closeMutexElement(SupportedConfigFactory.CLOSE_BY_AI, 193);
        setFlashMode("0");
        updateMfnr(true);
        updateOIS();
        setAiSceneEffect(10);
        this.mCurrentAiScene = 10;
        resumePreviewInWorkThread();
    }

    public void updatePreviewSurface() {
        if (this.mMainProtocol != null) {
            this.mMainProtocol.initEffectCropView();
        }
        checkDisplayOrientation();
        if (this.mActivity != null) {
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            if (this.mPreviewSize != null) {
                updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
            }
            if (this.mCamera2Device != null) {
                boolean updateDeferPreviewSession = this.mCamera2Device.updateDeferPreviewSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()));
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("updatePreviewSurface: result = ");
                sb.append(updateDeferPreviewSession);
                Log.d(str, sb.toString());
            }
        }
    }

    public void updateSilhouette() {
        if (!isDoingAction() && isAlive()) {
            this.isSilhouette = true;
            trackAISceneChanged(this.mModuleIndex, 24);
            setAiSceneEffect(24);
            updateHDR("off");
            resumePreviewInWorkThread();
        }
    }
}
