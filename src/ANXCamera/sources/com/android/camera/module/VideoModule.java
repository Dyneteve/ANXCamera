package com.android.camera.module;

import android.annotation.SuppressLint;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.CamcorderProfile;
import android.media.CameraProfile;
import android.media.MediaCodec;
import android.media.MediaRecorder;
import android.media.MediaRecorder.OnErrorListener;
import android.media.MediaRecorder.OnInfoListener;
import android.net.Uri;
import android.os.Build.VERSION;
import android.os.CountDownTimer;
import android.os.ParcelFileDescriptor;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.MainThread;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import android.widget.Toast;
import com.android.camera.AutoLockManager;
import com.android.camera.Camera;
import com.android.camera.CameraIntentManager.CameraExtras;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.Exif;
import com.android.camera.FileCompat;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.LocationManager;
import com.android.camera.R;
import com.android.camera.ToastUtils;
import com.android.camera.Util;
import com.android.camera.constant.AutoFocus;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.constant.UpdateConstant;
import com.android.camera.constant.UpdateConstant.UpdateType;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.config.ComponentConfigSlowMotion;
import com.android.camera.data.provider.DataProvider.ProviderEditor;
import com.android.camera.effect.EffectController;
import com.android.camera.effect.FilterInfo;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.AutoZoomModuleProtocol;
import com.android.camera.protocol.ModeProtocol.AutoZoomViewProtocol;
import com.android.camera.protocol.ModeProtocol.BackStack;
import com.android.camera.protocol.ModeProtocol.DualController;
import com.android.camera.protocol.ModeProtocol.RecordState;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.protocol.ModeProtocol.TopConfigProtocol;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.Storage;
import com.android.camera.ui.ObjectView.ObjectViewListener;
import com.android.camera.ui.PopupManager;
import com.android.camera.ui.RotateTextToast;
import com.android.camera.ui.zoom.ZoomingAction;
import com.android.camera2.Camera2Proxy.PictureCallbackWrapper;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.autozoom.AutoZoomCaptureResult;
import com.mi.config.b;
import com.miui.extravideo.interpolation.VideoInterpolator;
import com.ss.android.medialib.Result.Error;
import com.ss.android.ugc.effectmanager.link.model.configuration.LinkSelectorConfiguration;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.FlowableEmitter;
import io.reactivex.FlowableOnSubscribe;
import io.reactivex.Observable;
import io.reactivex.Single;
import io.reactivex.SingleEmitter;
import io.reactivex.SingleOnSubscribe;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.functions.Function;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import miui.reflect.Method;

public class VideoModule extends VideoBase implements OnErrorListener, OnInfoListener, AutoZoomModuleProtocol, TopConfigProtocol, ObjectViewListener, VideoRecordStateCallback {
    private static final HashMap<String, Integer> HEVC_VIDEO_ENCODER_BITRATE = new HashMap<>();
    private static final int MAX_DURATION_4K = 480000;
    private static final int RESET_VIDEO_AUTO_FOCUS_TIME = 3000;
    public static final Size SIZE_1080 = new Size(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT);
    public static final Size SIZE_720 = new Size(1280, Util.LIMIT_SURFACE_WIDTH);
    private static final long START_OFFSET_MS = 450;
    private static final int VIDEO_HFR_FRAME_RATE_120 = 120;
    private static final int VIDEO_HFR_FRAME_RATE_240 = 240;
    public static final long VIDEO_MAX_SINGLE_FILE_SIZE = 3670016000L;
    public static final long VIDEO_MIN_SINGLE_FILE_SIZE = Math.min(8388608, Storage.LOW_STORAGE_THRESHOLD);
    private static final int VIDEO_NORMAL_FRAME_RATE = 30;
    private AtomicBoolean isAutoZoomTracking = new AtomicBoolean(false);
    private AtomicBoolean isShowOrHideUltraWideHint = new AtomicBoolean(false);
    private Disposable mAutoZoomDataDisposable;
    /* access modifiers changed from: private */
    public FlowableEmitter<CaptureResult> mAutoZoomEmitter;
    private Disposable mAutoZoomUiDisposable;
    /* access modifiers changed from: private */
    public AutoZoomViewProtocol mAutoZoomViewProtocol;
    private boolean mCaptureTimeLapse;
    private CountDownTimer mCountDownTimer;
    private volatile int mCurrentFileNumber;
    private Boolean mDumpOrig960 = null;
    private boolean mFovcEnabled;
    /* access modifiers changed from: private */
    public int mFrameRate;
    private int mHfrFPSLower;
    private int mHfrFPSUpper;
    private final Object mLock = new Object();
    /* access modifiers changed from: private */
    public MediaRecorder mMediaRecorder;
    /* access modifiers changed from: private */
    public boolean mMediaRecorderPostProcessing;
    private boolean mMediaRecorderWorking;
    private String mNextVideoFileName;
    private ContentValues mNextVideoValues;
    private long mPauseClickTime = 0;
    private volatile boolean mPendingStopRecorder;
    private CamcorderProfile mProfile;
    /* access modifiers changed from: private */
    public int mQuality = 5;
    private boolean mQuickCapture;
    private Surface mRecorderSurface;
    private String mRecordingTime;
    private boolean mRecordingTimeCountsDown;
    private String mSlowModeFps;
    /* access modifiers changed from: private */
    public boolean mSnapshotInProgress;
    /* access modifiers changed from: private */
    public String mSpeed = "normal";
    private boolean mSplitWhenReachMaxSize;
    /* access modifiers changed from: private */
    public CountDownLatch mStopRecorderDone;
    private int mTimeBetweenTimeLapseFrameCaptureMs = 0;
    /* access modifiers changed from: private */
    public TopAlert mTopAlert;
    private int mTrackLostCount;
    private long mVideoRecordTime = 0;
    private long mVideoRecordedDuration;

    private final class JpegPictureCallback extends PictureCallbackWrapper {
        Location mLocation;

        public JpegPictureCallback(Location location) {
            this.mLocation = location;
        }

        private void storeImage(byte[] bArr, Location location) {
            long currentTimeMillis = System.currentTimeMillis();
            byte[] bArr2 = bArr;
            Location location2 = location;
            VideoModule.this.mActivity.getImageSaver().addImage(bArr2, VideoModule.this.needImageThumbnail(12), Util.createJpegName(currentTimeMillis), null, System.currentTimeMillis(), null, location2, VideoModule.this.mPictureSize.width, VideoModule.this.mPictureSize.height, null, Exif.getOrientation(bArr), false, false, true, false, false, null, null, -1);
        }

        public void onPictureTaken(byte[] bArr) {
            Log.v(VideoBase.TAG, "onPictureTaken");
            VideoModule.this.mSnapshotInProgress = false;
            if (!VideoModule.this.mPaused) {
                storeImage(bArr, this.mLocation);
            }
        }
    }

    static {
        HEVC_VIDEO_ENCODER_BITRATE.put("3840x2160:30", Integer.valueOf(38500000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1920x1080:30", Integer.valueOf(15400000));
        HEVC_VIDEO_ENCODER_BITRATE.put("1280x720:30", Integer.valueOf(10780000));
        HEVC_VIDEO_ENCODER_BITRATE.put("720x480:30", Integer.valueOf(1379840));
    }

    public VideoModule() {
        super(VideoModule.class.getSimpleName());
    }

    /* access modifiers changed from: private */
    public void consumeAutoZoomData(AutoZoomCaptureResult autoZoomCaptureResult) {
        if (isAlive() && !this.mActivity.isActivityPaused() && this.isAutoZoomTracking.get()) {
            this.mAutoZoomViewProtocol.feedData(autoZoomCaptureResult);
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:12:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:14:0x003f  */
    /* JADX WARNING: Removed duplicated region for block: B:16:0x0041  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private int convertSizeToQuality(String str) {
        boolean z;
        int hashCode = str.hashCode();
        if (hashCode == -1719904874) {
            if (str.equals("1280x720")) {
                z = true;
                switch (z) {
                    case false:
                        break;
                    case true:
                        break;
                }
            }
        } else if (hashCode == 802059049 && str.equals("1920x1080")) {
            z = false;
            switch (z) {
                case false:
                    return 6;
                case true:
                    return 5;
                default:
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("unexpected hfr video size ");
                    sb.append(str);
                    Log.e(str2, sb.toString());
                    return -1;
            }
        }
        z = true;
        switch (z) {
            case false:
                break;
            case true:
                break;
        }
    }

    private void countDownForVideoBokeh() {
        if (this.mMediaRecorderRecording) {
            if (this.mCountDownTimer != null) {
                this.mCountDownTimer.cancel();
            }
            AnonymousClass5 r1 = new CountDownTimer(30450, 1000) {
                public void onFinish() {
                    VideoModule.this.stopVideoRecording(true, false);
                }

                public void onTick(long j) {
                    String millisecondToTimeString = Util.millisecondToTimeString((j + 950) - VideoModule.START_OFFSET_MS, false);
                    if (VideoModule.this.mTopAlert != null) {
                        VideoModule.this.mTopAlert.updateRecordingTime(millisecondToTimeString);
                    }
                }
            };
            this.mCountDownTimer = r1;
            this.mCountDownTimer.start();
        }
    }

    private void forceToNormalMode() {
        ProviderEditor editor = DataRepository.dataItemConfig().editor();
        editor.putString(CameraSettings.KEY_VIDEO_SPEED, "normal");
        editor.apply();
        this.mSpeed = "normal";
    }

    private int getHSRValue() {
        if (isFaceBeautyOn(this.mBeautyValues) || CameraSettings.isVideoBokehOn() || ModuleManager.isFastMotionModule() || ModuleManager.isSlowMotionModule() || CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
            return 0;
        }
        String string = DataRepository.dataItemConfig().getString(CameraSettings.KEY_CAMERA_HSR_VALUE, null);
        if (string == null || string.isEmpty() || string.equals("off")) {
            return 0;
        }
        if ((this.mQuality != 8 || CameraSettings.isSupportFpsRange(3840, 2160, this.mModuleIndex)) && (this.mQuality != 6 || CameraSettings.isSupportFpsRange(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT, this.mModuleIndex))) {
            return Integer.parseInt(string);
        }
        return 0;
    }

    private int getHevcVideoEncoderBitRate(CamcorderProfile camcorderProfile) {
        StringBuilder sb = new StringBuilder();
        sb.append(camcorderProfile.videoFrameWidth);
        sb.append("x");
        sb.append(camcorderProfile.videoFrameHeight);
        sb.append(":");
        sb.append(camcorderProfile.videoFrameRate);
        String sb2 = sb.toString();
        if (HEVC_VIDEO_ENCODER_BITRATE.containsKey(sb2)) {
            return ((Integer) HEVC_VIDEO_ENCODER_BITRATE.get(sb2)).intValue();
        }
        String str = TAG;
        StringBuilder sb3 = new StringBuilder();
        sb3.append("no pre-defined bitrate for ");
        sb3.append(sb2);
        Log.d(str, sb3.toString());
        return camcorderProfile.videoBitRate;
    }

    private String getHfrSetting() {
        String hfrSetting = CameraSettings.getHfrSetting();
        ArrayList supportedHfrSettings = CameraSettings.getSupportedHfrSettings(this.mBogusCameraId);
        return (supportedHfrSettings == null || supportedHfrSettings.contains(hfrSetting)) ? hfrSetting : (String) supportedHfrSettings.get(0);
    }

    private int getOperatingModeForPreview() {
        if (CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
            return CameraCapabilities.SESSION_OPERATION_MODE_AUTO_ZOOM;
        }
        return 0;
    }

    private long getRecorderMaxFileSize(int i) {
        long leftSpace = Storage.getLeftSpace() - Storage.LOW_STORAGE_THRESHOLD;
        if (i > 0) {
            long j = (long) i;
            if (j < leftSpace) {
                leftSpace = j;
            }
        }
        if (leftSpace > VIDEO_MAX_SINGLE_FILE_SIZE && DataRepository.dataItemFeature().ft()) {
            leftSpace = 3670016000L;
        } else if (leftSpace < VIDEO_MIN_SINGLE_FILE_SIZE) {
            leftSpace = VIDEO_MIN_SINGLE_FILE_SIZE;
        }
        return (this.mIntentRequestSize <= 0 || this.mIntentRequestSize >= leftSpace) ? leftSpace : this.mIntentRequestSize;
    }

    private int getRecorderOrientationHint() {
        int sensorOrientation = this.mCameraCapabilities.getSensorOrientation();
        return this.mOrientation != -1 ? isFrontCamera() ? ((sensorOrientation - this.mOrientation) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : (sensorOrientation + this.mOrientation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT : sensorOrientation;
    }

    private long getSpeedRecordVideoLength(long j, double d) {
        if (d == 0.0d) {
            return 0;
        }
        return (long) (((((double) j) / d) / ((double) getNormalVideoFrameRate())) * 1000.0d);
    }

    private void initAutoZoom() {
        if (DataRepository.dataItemFeature().fJ()) {
            if (CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
                startAutoZoom();
            } else {
                stopAutoZoom();
            }
            this.mAutoZoomDataDisposable = Flowable.create(new FlowableOnSubscribe<CaptureResult>() {
                public void subscribe(FlowableEmitter<CaptureResult> flowableEmitter) throws Exception {
                    VideoModule.this.mAutoZoomEmitter = flowableEmitter;
                }
            }, BackpressureStrategy.DROP).observeOn(GlobalConstant.sCameraSetupScheduler).map(new Function<CaptureResult, AutoZoomCaptureResult>() {
                public AutoZoomCaptureResult apply(CaptureResult captureResult) throws Exception {
                    return new AutoZoomCaptureResult(captureResult);
                }
            }).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<AutoZoomCaptureResult>() {
                public void accept(AutoZoomCaptureResult autoZoomCaptureResult) throws Exception {
                    VideoModule.this.consumeAutoZoomData(autoZoomCaptureResult);
                }
            });
        }
    }

    private void initRecorderSurface() {
        this.mRecorderSurface = MediaCodec.createPersistentInputSurface();
    }

    private boolean initializeObjectTrack(RectF rectF, boolean z) {
        mapTapCoordinate(rectF);
        stopObjectTracking(false);
        return this.mMainProtocol.initializeObjectTrack(rectF, z);
    }

    /* JADX WARNING: Removed duplicated region for block: B:58:0x015b  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean initializeRecorder(boolean z) {
        Log.d(TAG, "initializeRecorder>>");
        long currentTimeMillis = System.currentTimeMillis();
        boolean z2 = false;
        if (getActivity() == null) {
            Log.w(TAG, "initializeRecorder: null host");
            return false;
        }
        closeVideoFileDescriptor();
        cleanupEmptyFile();
        if (isCaptureIntent()) {
            parseIntent(this.mActivity.getIntent());
        }
        if (this.mVideoFileDescriptor == null) {
            this.mCurrentVideoValues = genContentValues(this.mOutputFormat, this.mCurrentFileNumber, this.mSlowModeFps, z);
            this.mCurrentVideoFilename = this.mCurrentVideoValues.getAsString("_data");
        }
        if (this.mStopRecorderDone != null) {
            long currentTimeMillis2 = System.currentTimeMillis();
            try {
                this.mStopRecorderDone.await(1000, TimeUnit.MILLISECONDS);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("initializeRecorder: waitTime=");
            sb.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.d(str, sb.toString());
        }
        long currentTimeMillis3 = System.currentTimeMillis();
        synchronized (this.mLock) {
            if (this.mMediaRecorder == null) {
                this.mMediaRecorder = new MediaRecorder();
            } else {
                this.mMediaRecorder.reset();
                if (DEBUG) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("initializeRecorder: t1=");
                    sb2.append(System.currentTimeMillis() - currentTimeMillis3);
                    Log.v(str2, sb2.toString());
                }
            }
        }
        ParcelFileDescriptor parcelFileDescriptor = null;
        try {
            setupRecorder(this.mMediaRecorder);
            if (this.mVideoFileDescriptor != null) {
                this.mMediaRecorder.setOutputFile(this.mVideoFileDescriptor.getFileDescriptor());
            } else {
                if (Storage.isUseDocumentMode()) {
                    if (z) {
                        ParcelFileDescriptor parcelFileDescriptor2 = FileCompat.getParcelFileDescriptor(this.mCurrentVideoFilename, true);
                        try {
                            this.mMediaRecorder.setOutputFile(parcelFileDescriptor2.getFileDescriptor());
                            parcelFileDescriptor = parcelFileDescriptor2;
                        } catch (Exception e2) {
                            Throwable th = e2;
                            parcelFileDescriptor = parcelFileDescriptor2;
                            e = th;
                            try {
                                String str3 = TAG;
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("prepare failed for ");
                                sb3.append(this.mCurrentVideoFilename);
                                Log.e(str3, sb3.toString(), e);
                                releaseMediaRecorder();
                                Util.closeSilently(parcelFileDescriptor);
                                if (DEBUG) {
                                }
                                String str4 = TAG;
                                StringBuilder sb4 = new StringBuilder();
                                sb4.append("initializeRecorder<<time=");
                                sb4.append(System.currentTimeMillis() - currentTimeMillis);
                                Log.d(str4, sb4.toString());
                                return z2;
                            } catch (Throwable th2) {
                                th = th2;
                                Util.closeSilently(parcelFileDescriptor);
                                throw th;
                            }
                        } catch (Throwable th3) {
                            parcelFileDescriptor = parcelFileDescriptor2;
                            th = th3;
                            Util.closeSilently(parcelFileDescriptor);
                            throw th;
                        }
                    }
                }
                this.mMediaRecorder.setOutputFile(this.mCurrentVideoFilename);
            }
            this.mMediaRecorder.setInputSurface(this.mRecorderSurface);
            long currentTimeMillis4 = System.currentTimeMillis();
            this.mMediaRecorder.prepare();
            this.mMediaRecorder.setOnErrorListener(this);
            this.mMediaRecorder.setOnInfoListener(this);
            if (DEBUG) {
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("initializeRecorder: t2=");
                sb5.append(System.currentTimeMillis() - currentTimeMillis4);
                Log.v(str5, sb5.toString());
            }
            Util.closeSilently(parcelFileDescriptor);
            z2 = true;
        } catch (Exception e3) {
            e = e3;
            String str32 = TAG;
            StringBuilder sb32 = new StringBuilder();
            sb32.append("prepare failed for ");
            sb32.append(this.mCurrentVideoFilename);
            Log.e(str32, sb32.toString(), e);
            releaseMediaRecorder();
            Util.closeSilently(parcelFileDescriptor);
            if (DEBUG) {
            }
            String str42 = TAG;
            StringBuilder sb42 = new StringBuilder();
            sb42.append("initializeRecorder<<time=");
            sb42.append(System.currentTimeMillis() - currentTimeMillis);
            Log.d(str42, sb42.toString());
            return z2;
        }
        if (DEBUG) {
            showSurfaceInfo(this.mRecorderSurface);
        }
        String str422 = TAG;
        StringBuilder sb422 = new StringBuilder();
        sb422.append("initializeRecorder<<time=");
        sb422.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str422, sb422.toString());
        return z2;
    }

    /* access modifiers changed from: private */
    public boolean isActivityResumed() {
        Camera activity = getActivity();
        return activity != null && !activity.isActivityPaused();
    }

    private boolean isDump960Orig() {
        if (this.mDumpOrig960 == null) {
            this.mDumpOrig960 = SystemProperties.getBoolean("camera.record.960origdump", false) ? Boolean.TRUE : Boolean.FALSE;
        }
        return this.mDumpOrig960.booleanValue();
    }

    private boolean isEisOn() {
        boolean z = this.mQuality != 0 && (!CameraSettings.is4KHigherVideoQuality(this.mQuality) || isSupport4KUHDEIS()) && !isFaceBeautyOn(this.mBeautyValues) && CameraSettings.isMovieSolidOn() && getHSRValue() != 60 && isNormalMode();
        if (z && !b.iF()) {
            z = isBackCamera();
        }
        if (!b.gH() || z || !CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
            return z;
        }
        return true;
    }

    /* access modifiers changed from: private */
    public boolean isFPS120() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_120.equals(this.mSlowModeFps);
    }

    /* access modifiers changed from: private */
    public boolean isFPS240() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_240.equals(this.mSlowModeFps);
    }

    /* access modifiers changed from: private */
    public boolean isFPS960() {
        return ComponentConfigSlowMotion.DATA_CONFIG_NEW_SLOW_MOTION_960.equals(this.mSlowModeFps);
    }

    private boolean isHFRMode() {
        return CameraSettings.VIDEO_SPEED_HFR.equals(this.mSpeed);
    }

    private boolean isNormalMode() {
        return "normal".equals(this.mSpeed);
    }

    private boolean isSlowMode() {
        return CameraSettings.VIDEO_SPEED_SLOW.equals(this.mSpeed);
    }

    private boolean isSplitWhenReachMaxSize() {
        return this.mSplitWhenReachMaxSize;
    }

    private static boolean isSupport4KUHDEIS() {
        return DataRepository.dataItemFeature().isSupport4KUHDEIS();
    }

    private boolean needDisableEISAndOIS() {
        if (CameraSettings.isVideoBokehOn() && isFrontCamera()) {
            Log.d(TAG, "videoStabilization: disabled EIS and OIS when VIDEO_BOKEH is opened");
            return true;
        } else if (!CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
            return false;
        } else {
            Log.d(TAG, "videoStabilization: disabled EIS and OIS when AutoZoom is opened");
            return true;
        }
    }

    /* access modifiers changed from: private */
    public boolean needImageThumbnail(int i) {
        return i != 12;
    }

    private void notifyAutoZoomStartUiHint() {
        notifyAutoZoomStopUiHint();
        if (this.mTopAlert == null || !this.mTopAlert.isExtraMenuShowing()) {
            this.mAutoZoomUiDisposable = Observable.timer(FragmentTopAlert.HINT_DELAY_TIME, TimeUnit.MILLISECONDS).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<Long>() {
                public void accept(Long l) throws Exception {
                    if (VideoModule.this.mTopAlert != null) {
                        VideoModule.this.mTopAlert.alertAiDetectTipHint(0, R.string.autozoom_click_hint, -1);
                    }
                }
            });
        }
    }

    private void notifyAutoZoomStopUiHint() {
        if (this.mAutoZoomUiDisposable != null && !this.mAutoZoomUiDisposable.isDisposed()) {
            this.mAutoZoomUiDisposable.dispose();
            this.mAutoZoomUiDisposable = null;
        }
    }

    private void onMaxFileSizeReached() {
        if (this.mCurrentVideoFilename != null) {
            saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, false, false);
            this.mCurrentVideoValues = null;
            this.mCurrentVideoFilename = null;
        }
    }

    /* access modifiers changed from: private */
    public void onMediaRecorderReleased() {
        Log.d(TAG, "onMediaRecorderReleased>>");
        long currentTimeMillis = System.currentTimeMillis();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        if (isCaptureIntent() && !this.mPaused) {
            if (this.mCurrentVideoUri == null && this.mCurrentVideoFilename != null) {
                this.mCurrentVideoUri = saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, true);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onMediaRecorderReleased: outputUri=");
                sb.append(this.mCurrentVideoUri);
                Log.d(str, sb.toString());
            }
            boolean z = this.mCurrentVideoUri != null;
            if (this.mQuickCapture) {
                doReturnToCaller(z);
            } else if (z) {
                showAlert();
            }
        }
        if (this.mCurrentVideoFilename != null) {
            if (!isCaptureIntent()) {
                saveVideo(this.mCurrentVideoFilename, this.mCurrentVideoValues, true, false);
            }
            this.mCurrentVideoFilename = null;
            this.mCurrentVideoValues = null;
        } else if (!this.mPaused && !this.mActivity.isActivityPaused()) {
            this.mActivity.getThumbnailUpdater().getLastThumbnail();
        }
        if (this.mMediaRecorderPostProcessing) {
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onPostSavingFinish();
            }
        }
        this.mActivity.sendBroadcast(new Intent(VideoBase.STOP_VIDEO_RECORDING_ACTION));
        this.mTelephonyManager.listen(this.mPhoneStateListener, 0);
        Log.v(TAG, "listen none");
        enableCameraControls(true);
        if (!AutoFocus.LEGACY_CONTINUOUS_VIDEO.equals(this.mVideoFocusMode)) {
            this.mFocusManager.resetFocusStateIfNeeded();
            if (!this.mPaused && !this.mActivity.isActivityPaused()) {
                this.mMainProtocol.clearFocusView(2);
                setVideoFocusMode(AutoFocus.LEGACY_CONTINUOUS_VIDEO, false);
                updatePreferenceInWorkThread(14);
            }
        }
        keepScreenOnAwhile();
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("onMediaRecorderReleased<<time=");
        sb2.append(System.currentTimeMillis() - currentTimeMillis);
        Log.d(str2, sb2.toString());
        ScenarioTrackUtil.trackStopVideoRecordEnd();
        doLaterReleaseIfNeed();
        if (this.mMediaRecorderPostProcessing) {
            this.mMediaRecorderPostProcessing = false;
        }
        this.mMediaRecorderWorking = false;
        this.mHandler.post(new Runnable() {
            public void run() {
                VideoModule.this.handlePendingScreenSlide();
            }
        });
    }

    private void onStartRecorderFail() {
        enableCameraControls(true);
        releaseMediaRecorder();
        this.mAudioManager.abandonAudioFocus(null);
        restoreMusicSound();
        ((RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212)).onFailed();
    }

    private void onStartRecorderSucceed() {
        if (!isFPS960()) {
            enableCameraControls(true);
        }
        this.mActivity.sendBroadcast(new Intent(VideoBase.START_VIDEO_RECORDING_ACTION));
        this.mMediaRecorderWorking = true;
        this.mMediaRecorderRecording = true;
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mModuleIndex != 168 && this.mModuleIndex != 172 && this.mModuleIndex != 169 && this.mModuleIndex != 170 && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && !CameraSettings.isAutoZoomEnabled(this.mModuleIndex) && isBackCamera()) {
            updateZoomRatioToggleButtonState(true);
            if (isUltraWideBackCamera()) {
                setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                setMaxZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR * this.mCameraCapabilities.getMaxZoomRatio());
            } else {
                setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_WIDE);
                setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
            }
        }
        this.mMediaRecorderRecordingPaused = false;
        this.mRecordingStartTime = SystemClock.uptimeMillis();
        this.mPauseClickTime = SystemClock.uptimeMillis();
        this.mRecordingTime = "";
        this.mTelephonyManager.listen(this.mPhoneStateListener, 32);
        Log.v(TAG, "listen call state");
        if (CameraSettings.isVideoBokehOn()) {
            countDownForVideoBokeh();
        } else {
            updateRecordingTime();
        }
        keepScreenOn();
        AutoLockManager.getInstance(this.mActivity).removeMessage();
        trackGeneralInfo(1, false);
        keepPowerSave();
    }

    private void pauseVideoRecording() {
        Log.d(TAG, "pauseVideoRecording");
        if (this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused) {
            try {
                pauseMediaRecorder(this.mMediaRecorder);
            } catch (IllegalStateException e) {
                Log.e(TAG, "failed to pause media recorder");
            }
            this.mVideoRecordedDuration = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            this.mMediaRecorderRecordingPaused = true;
            this.mHandler.removeMessages(42);
            updateRecordingTime();
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:14:0x006f, code lost:
        if (r4 == false) goto L_0x0071;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x0071, code lost:
        com.android.camera.log.Log.e(TAG, "960fps processing failed. delete the files.");
        r1.delete();
        r2.delete();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:20:0x0089, code lost:
        if (0 != 0) goto L_0x008c;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x008c, code lost:
        if (r4 == false) goto L_0x0093;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x008e, code lost:
        r0 = r3.getAbsolutePath();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0093, code lost:
        return r0;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public String postProcessVideo(String str) {
        String str2 = null;
        if (str == null) {
            return null;
        }
        File file = new File(str);
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".bak");
        File file2 = new File(sb.toString());
        File file3 = new File(Storage.generatePrimaryFilepath(file.getName()));
        boolean z = false;
        try {
            if (VideoInterpolator.doDecodeAndEncodeSync(file.getAbsolutePath(), file2.getAbsolutePath(), DataRepository.dataItemFeature().fK()) && file2.renameTo(file3)) {
                z = true;
            }
            if (isDump960Orig()) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append(".orig.mp4");
                file.renameTo(new File(sb2.toString()));
            } else {
                file.delete();
            }
        } catch (Throwable th) {
            if (0 == 0) {
                Log.e(TAG, "960fps processing failed. delete the files.");
                file.delete();
                file2.delete();
            }
            throw th;
        }
    }

    /* access modifiers changed from: private */
    public void releaseMediaRecorder() {
        MediaRecorder mediaRecorder;
        Log.v(TAG, "releaseRecorder");
        synchronized (this.mLock) {
            mediaRecorder = this.mMediaRecorder;
            this.mMediaRecorder = null;
        }
        if (mediaRecorder != null) {
            cleanupEmptyFile();
            long currentTimeMillis = System.currentTimeMillis();
            mediaRecorder.reset();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("releaseRecorder: t1=");
            sb.append(System.currentTimeMillis() - currentTimeMillis);
            Log.v(str, sb.toString());
            long currentTimeMillis2 = System.currentTimeMillis();
            mediaRecorder.release();
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("releaseRecorder: t2=");
            sb2.append(System.currentTimeMillis() - currentTimeMillis2);
            Log.v(str2, sb2.toString());
        }
    }

    private void releaseRecorderSurface() {
        if (this.mRecorderSurface != null) {
            this.mRecorderSurface.release();
        }
    }

    private void releaseResources() {
        if (this.mAutoZoomEmitter != null) {
            this.mAutoZoomEmitter.onComplete();
        }
        if (this.mAutoZoomUiDisposable != null && !this.mAutoZoomUiDisposable.isDisposed()) {
            this.mAutoZoomUiDisposable.dispose();
            this.mAutoZoomUiDisposable = null;
        }
        if (this.mAutoZoomDataDisposable != null && !this.mAutoZoomDataDisposable.isDisposed()) {
            this.mAutoZoomDataDisposable.dispose();
            this.mAutoZoomDataDisposable = null;
        }
        stopTracking(0);
        stopAutoZoom();
        closeCamera();
        releaseMediaRecorder();
    }

    private Uri saveVideo(String str, ContentValues contentValues, boolean z, boolean z2) {
        if (this.mActivity != null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("saveVideo: path=");
            sb.append(str);
            sb.append(" isFinal=");
            sb.append(z);
            Log.w(str2, sb.toString());
            contentValues.put("datetaken", Long.valueOf(System.currentTimeMillis()));
            if (z2) {
                return this.mActivity.getImageSaver().addVideoSync(str, contentValues, false);
            }
            this.mActivity.getImageSaver().addVideo(str, contentValues, z);
        } else {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("saveVideo: failed to save ");
            sb2.append(str);
            Log.w(str3, sb2.toString());
        }
        return null;
    }

    private void setJpegQuality() {
        if (isDeviceAlive()) {
            int jpegEncodingQualityParameter = CameraProfile.getJpegEncodingQualityParameter(this.mBogusCameraId, 2);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("jpegQuality=");
            sb.append(jpegEncodingQualityParameter);
            Log.d(str, sb.toString());
            this.mCamera2Device.setJpegQuality(jpegEncodingQualityParameter);
        }
    }

    private boolean setNextOutputFile(String str) {
        ParcelFileDescriptor parcelFileDescriptor;
        Throwable e;
        if (TextUtils.isEmpty(str)) {
            Log.w(TAG, "setNextOutputFile, filePath is empty");
            return false;
        } else if (!Storage.isUseDocumentMode()) {
            return CompatibilityUtils.setNextOutputFile(this.mMediaRecorder, str);
        } else {
            try {
                parcelFileDescriptor = FileCompat.getParcelFileDescriptor(str, true);
                try {
                    boolean nextOutputFile = CompatibilityUtils.setNextOutputFile(this.mMediaRecorder, parcelFileDescriptor.getFileDescriptor());
                    Util.closeSafely(parcelFileDescriptor);
                    return nextOutputFile;
                } catch (Exception e2) {
                    e = e2;
                    try {
                        String str2 = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("open file failed, filePath ");
                        sb.append(str);
                        Log.d(str2, sb.toString(), e);
                        Util.closeSafely(parcelFileDescriptor);
                        return false;
                    } catch (Throwable th) {
                        th = th;
                        Util.closeSafely(parcelFileDescriptor);
                        throw th;
                    }
                }
            } catch (Exception e3) {
                Throwable th2 = e3;
                parcelFileDescriptor = null;
                e = th2;
                String str22 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("open file failed, filePath ");
                sb2.append(str);
                Log.d(str22, sb2.toString(), e);
                Util.closeSafely(parcelFileDescriptor);
                return false;
            } catch (Throwable th3) {
                th = th3;
                parcelFileDescriptor = null;
                Util.closeSafely(parcelFileDescriptor);
                throw th;
            }
        }
    }

    private void setParameterExtra(MediaRecorder mediaRecorder, String str) {
        Class[] clsArr = {MediaRecorder.class};
        Method method = Util.getMethod(clsArr, "setParameter", "(Ljava/lang/String;)V");
        if (method != null) {
            method.invoke(clsArr[0], mediaRecorder, str);
        }
    }

    private void setSplitWhenReachMaxSize(boolean z) {
        this.mSplitWhenReachMaxSize = z;
    }

    private void setupRecorder(MediaRecorder mediaRecorder) throws FileNotFoundException {
        int i;
        boolean isNormalMode = isNormalMode();
        boolean isHFRMode = isHFRMode();
        boolean z = isNormalMode || isHFRMode || isFPS120() || isFPS240();
        mediaRecorder.setVideoSource(2);
        if (z) {
            mediaRecorder.setAudioSource(5);
        }
        mediaRecorder.setOutputFormat(this.mProfile.fileFormat);
        mediaRecorder.setVideoEncoder(this.mProfile.videoCodec);
        mediaRecorder.setVideoSize(this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        int hSRValue = getHSRValue();
        if (hSRValue > 0) {
            mediaRecorder.setVideoFrameRate(hSRValue);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setVideoFrameRate: ");
            sb.append(hSRValue);
            Log.d(str, sb.toString());
        } else {
            mediaRecorder.setVideoFrameRate(this.mProfile.videoFrameRate);
            String str2 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("setVideoFrameRate: ");
            sb2.append(this.mProfile.videoFrameRate);
            Log.d(str2, sb2.toString());
        }
        if (5 == this.mProfile.videoCodec) {
            i = getHevcVideoEncoderBitRate(this.mProfile);
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("H265 bitrate: ");
            sb3.append(i);
            Log.d(str3, sb3.toString());
        } else {
            i = this.mProfile.videoBitRate;
            String str4 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("H264 bitrate: ");
            sb4.append(i);
            Log.d(str4, sb4.toString());
        }
        mediaRecorder.setVideoEncodingBitRate(i);
        if (z) {
            mediaRecorder.setAudioEncodingBitRate(this.mProfile.audioBitRate);
            mediaRecorder.setAudioChannels(this.mProfile.audioChannels);
            mediaRecorder.setAudioSamplingRate(this.mProfile.audioSampleRate);
            mediaRecorder.setAudioEncoder(this.mProfile.audioCodec);
        }
        if (this.mCaptureTimeLapse) {
            mediaRecorder.setCaptureRate(1000.0d / ((double) this.mTimeBetweenTimeLapseFrameCaptureMs));
        } else if (!isNormalMode) {
            if (isHFRMode || ModuleManager.isVideoNewSlowMotion()) {
                mediaRecorder.setVideoFrameRate(this.mFrameRate);
                mediaRecorder.setVideoEncodingBitRate(VERSION.SDK_INT < 28 ? (int) ((((long) i) * ((long) this.mFrameRate)) / ((long) getNormalVideoFrameRate())) : ((this.mFrameRate / getNormalVideoFrameRate()) / 2) * i);
            }
            mediaRecorder.setCaptureRate((double) this.mFrameRate);
        } else if (hSRValue > 0) {
            mediaRecorder.setVideoFrameRate(hSRValue);
            mediaRecorder.setCaptureRate((double) hSRValue);
        }
        mediaRecorder.setMaxDuration(this.mMaxVideoDurationInMs);
        Location currentLocation = LocationManager.instance().getCurrentLocation();
        if (currentLocation != null) {
            mediaRecorder.setLocation((float) currentLocation.getLatitude(), (float) currentLocation.getLongitude());
        }
        int i2 = SystemProperties.getInt("camera.debug.video_max_size", 0);
        long recorderMaxFileSize = getRecorderMaxFileSize(i2);
        if (recorderMaxFileSize > 0) {
            String str5 = TAG;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("maxFileSize=");
            sb5.append(recorderMaxFileSize);
            Log.v(str5, sb5.toString());
            mediaRecorder.setMaxFileSize(recorderMaxFileSize);
            if (recorderMaxFileSize > VIDEO_MAX_SINGLE_FILE_SIZE) {
                setParameterExtra(mediaRecorder, "param-use-64bit-offset=1");
            }
        }
        if (!DataRepository.dataItemFeature().ft() || (i2 <= 0 && recorderMaxFileSize != VIDEO_MAX_SINGLE_FILE_SIZE)) {
            setSplitWhenReachMaxSize(false);
        } else {
            setSplitWhenReachMaxSize(true);
        }
        if (isFPS240() || isFPS960()) {
            try {
                setParameterExtra(mediaRecorder, "video-param-i-frames-interval=0.033");
            } catch (Exception e) {
                Log.e(TAG, e.getMessage(), e);
            }
        }
        mediaRecorder.setOrientationHint(getRecorderOrientationHint());
        this.mOrientationCompensationAtRecordStart = this.mOrientationCompensation;
    }

    private boolean shouldApplyUltraWideLDC() {
        if (CameraSettings.shouldUltraWideVideoLDCBeVisibleInMode(this.mModuleIndex) && this.mActualCameraId == Camera2DataContainer.getInstance().getUltraWideCameraId()) {
            return CameraSettings.isUltraWideVideoLDCEnabled();
        }
        return false;
    }

    private void showSurfaceInfo(Surface surface) {
        boolean isValid = surface.isValid();
        boolean isSurfaceForHwVideoEncoder = SurfaceUtils.isSurfaceForHwVideoEncoder(surface);
        Size surfaceSize = SurfaceUtils.getSurfaceSize(surface);
        int surfaceFormat = SurfaceUtils.getSurfaceFormat(surface);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("showSurfaceInfo: ");
        sb.append(surface);
        sb.append("|");
        sb.append(isValid);
        sb.append("|");
        sb.append(surfaceSize);
        sb.append("|");
        sb.append(surfaceFormat);
        sb.append("|");
        sb.append(isSurfaceForHwVideoEncoder);
        Log.d(str, sb.toString());
    }

    private void startHighSpeedRecordSession() {
        Log.d(TAG, "startHighSpeedRecordSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startHighSpeedRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)), this);
            this.mFocusManager.resetFocused();
            showSurfaceInfo(this.mRecorderSurface);
        }
    }

    private void startPreviewAfterRecord() {
        if (isDeviceAlive() && !this.mActivity.isActivityPaused()) {
            unlockAEAF();
            if (!isCaptureIntent()) {
                if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                    this.mCamera2Device.startHighSpeedRecordPreview();
                } else {
                    this.mCamera2Device.startRecordPreview();
                }
            }
        }
    }

    private void startPreviewSession() {
        Log.d(TAG, "startPreviewSession");
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setFocusCallback(this);
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            Surface surface = new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture());
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startPreviewSession(surface, false, false, getOperatingModeForPreview(), false, this);
        }
    }

    private void startRecordSession() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startRecordSession: mode=");
        sb.append(this.mSpeed);
        Log.d(str, sb.toString());
        if (isDeviceAlive()) {
            checkDisplayOrientation();
            this.mCamera2Device.setErrorCallback(this.mErrorCallback);
            this.mCamera2Device.setPictureSize(this.mPreviewSize);
            this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
            if (this.mAELockOnlySupported) {
                this.mCamera2Device.setFocusCallback(this);
            }
            int operatingMode = getOperatingMode();
            Log.d(TAG, String.format("startRecordSession: operatingMode = 0x%x", new Object[]{Integer.valueOf(operatingMode)}));
            this.mSurfaceCreatedTimestamp = this.mActivity.getCameraScreenNail().getSurfaceCreatedTimestamp();
            this.mCamera2Device.startRecordSession(new Surface(this.mActivity.getCameraScreenNail().getSurfaceTexture()), this.mRecorderSurface, true, operatingMode, this);
            this.mFocusManager.resetFocused();
            this.mPreviewing = true;
        }
    }

    private boolean startRecorder() {
        if (!initializeRecorder(true)) {
            return false;
        }
        try {
            this.mMediaRecorder.start();
            this.mMediaRecorderWorking = true;
            return true;
        } catch (IllegalStateException e) {
            Log.e(TAG, "could not start recorder", e);
            if (e instanceof IllegalStateException) {
                showConfirmMessage(R.string.confirm_recording_fail_title, R.string.confirm_recording_fail_recorder_busy_alert);
            }
            return false;
        }
    }

    private void startVideoRecordingIfNeeded() {
        if (this.mActivity.getCameraIntentManager().checkCallerLegality()) {
            if (!this.mActivity.getCameraIntentManager().isOpenOnly()) {
                this.mActivity.getIntent().removeExtra(CameraExtras.CAMERA_OPEN_ONLY);
                int timerDurationSeconds = this.mActivity.getCameraIntentManager().getTimerDurationSeconds();
                if (timerDurationSeconds > 60) {
                    Log.e(TAG, "Caller delivered a wrong duration time large as 60s!");
                    return;
                }
                this.mHandler.postDelayed(new Runnable() {
                    public void run() {
                        VideoModule.this.onShutterButtonClick(VideoModule.this.getTriggerMode());
                    }
                }, timerDurationSeconds == -1 ? 1500 : (long) (timerDurationSeconds * 1000));
            } else {
                this.mActivity.getIntent().removeExtra(CameraExtras.TIMER_DURATION_SECONDS);
            }
        }
    }

    @SuppressLint({"CheckResult"})
    private void stopRecorder() {
        this.mPendingStopRecorder = false;
        this.mHandler.removeMessages(46);
        Single.create(new SingleOnSubscribe<Boolean>() {
            public void subscribe(SingleEmitter<Boolean> singleEmitter) throws Exception {
                VideoModule.this.mStopRecorderDone = new CountDownLatch(1);
                long currentTimeMillis = System.currentTimeMillis();
                ScenarioTrackUtil.trackStopVideoRecordStart(VideoModule.this.mSpeed, VideoModule.this.isFrontCamera());
                try {
                    VideoModule.this.mMediaRecorder.setOnErrorListener(null);
                    VideoModule.this.mMediaRecorder.setOnInfoListener(null);
                    VideoModule.this.mMediaRecorder.stop();
                } catch (RuntimeException e) {
                    Log.e(VideoBase.TAG, "failed to stop media recorder", e);
                    if (VideoModule.this.mCurrentVideoFilename != null) {
                        VideoModule.this.deleteVideoFile(VideoModule.this.mCurrentVideoFilename);
                        VideoModule.this.mCurrentVideoFilename = null;
                    }
                }
                if (!VideoModule.this.mPaused && !VideoModule.this.mActivity.isActivityPaused()) {
                    VideoModule.this.playCameraSound(3);
                }
                VideoModule.this.releaseMediaRecorder();
                VideoModule.this.mStopRecorderDone.countDown();
                String str = VideoBase.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("releaseTime=");
                sb.append(System.currentTimeMillis() - currentTimeMillis);
                Log.d(str, sb.toString());
                long uptimeMillis = SystemClock.uptimeMillis() - VideoModule.this.mRecordingStartTime;
                if (VideoModule.this.mCamera2Device != null && ModuleManager.isVideoNewSlowMotion() && (VideoModule.this.isFPS120() || VideoModule.this.isFPS240())) {
                    CameraStatUtil.trackNewSlowMotionVideoRecorded(VideoModule.this.isFPS120() ? CameraSettings.VIDEO_MODE_120 : CameraSettings.VIDEO_MODE_240, VideoModule.this.mQuality, VideoModule.this.mCamera2Device.getFlashMode(), VideoModule.this.mFrameRate, uptimeMillis / 1000);
                }
                if (VideoModule.this.mCurrentVideoFilename != null && VideoModule.this.isFPS960()) {
                    if (!VideoModule.this.mMediaRecorderPostProcessing || !VideoModule.this.isActivityResumed()) {
                        String str2 = VideoBase.TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("uncomplete video.=");
                        sb2.append(uptimeMillis);
                        Log.d(str2, sb2.toString());
                        VideoModule.this.deleteVideoFile(VideoModule.this.mCurrentVideoFilename);
                        VideoModule.this.mCurrentVideoFilename = null;
                        CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FPS960_TOO_SHORT);
                    } else {
                        long currentTimeMillis2 = System.currentTimeMillis();
                        String access$1500 = VideoModule.this.postProcessVideo(VideoModule.this.mCurrentVideoFilename);
                        String str3 = VideoBase.TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("processTime=");
                        sb3.append(System.currentTimeMillis() - currentTimeMillis2);
                        Log.d(str3, sb3.toString());
                        if (access$1500 == null) {
                            VideoModule.this.mCurrentVideoFilename = null;
                            VideoModule.this.mCurrentVideoValues = null;
                            CameraStat.recordCountEvent(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_FPS960_PROCESS_FAILED);
                        } else {
                            VideoModule.this.mCurrentVideoFilename = access$1500;
                            VideoModule.this.mCurrentVideoValues.put("_data", access$1500);
                            CameraStatUtil.trackNewSlowMotionVideoRecorded(CameraSettings.VIDEO_MODE_960, VideoModule.this.mQuality, VideoModule.this.mCamera2Device.getFlashMode(), 960, 10);
                        }
                    }
                }
                singleEmitter.onSuccess(Boolean.TRUE);
            }
        }).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(AndroidSchedulers.mainThread()).subscribe((Consumer<? super T>) new Consumer<Boolean>() {
            public void accept(Boolean bool) throws Exception {
                VideoModule.this.onMediaRecorderReleased();
            }
        });
    }

    private void updateAutoZoomMode() {
        boolean isAutoZoomEnabled = CameraSettings.isAutoZoomEnabled(this.mModuleIndex);
        if (this.mCamera2Device != null && isAlive()) {
            this.mCamera2Device.setAutoZoomMode(isAutoZoomEnabled ? 1 : 0);
            if (isAutoZoomEnabled) {
                this.mCamera2Device.setAutoZoomScaleOffset(0.0f);
            }
        }
    }

    private void updateFpsRange() {
        if (isDeviceAlive()) {
            if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("mHfrFPSLower = ");
                sb.append(this.mHfrFPSLower);
                sb.append(", mHfrFPSUpper = ");
                sb.append(this.mHfrFPSUpper);
                Log.d(str, sb.toString());
                this.mCamera2Device.setVideoFpsRange(new Range(Integer.valueOf(this.mHfrFPSLower), Integer.valueOf(this.mHfrFPSUpper)));
            } else {
                Range[] supportedFpsRange = this.mCameraCapabilities.getSupportedFpsRange();
                int i = 0;
                Range range = supportedFpsRange[0];
                int length = supportedFpsRange.length;
                while (true) {
                    if (i >= length) {
                        break;
                    }
                    Range range2 = supportedFpsRange[i];
                    int hSRValue = getHSRValue();
                    if (hSRValue == 60) {
                        range = new Range(Integer.valueOf(hSRValue), Integer.valueOf(hSRValue));
                        break;
                    }
                    if (((Integer) range.getUpper()).intValue() < ((Integer) range2.getUpper()).intValue() || (range.getUpper() == range2.getUpper() && ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                        range = range2;
                    }
                    i++;
                }
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("bestRange = ");
                sb2.append(range);
                Log.d(str2, sb2.toString());
                this.mCamera2Device.setFpsRange(range);
                this.mCamera2Device.setVideoFpsRange(range);
            }
        }
    }

    private void updateFrontMirror() {
        boolean z = isFrontCamera() && !b.iF() && DataRepository.dataItemFeature().fA() && CameraSettings.isFrontMirror();
        this.mCamera2Device.setFrontMirror(z);
    }

    private void updateHFRDeflicker() {
        if (isFPS960()) {
            this.mCamera2Device.setHFRDeflickerEnable(true);
        }
    }

    private void updateHfrFPSRange(Size size, int i) {
        Range[] supportedHighSpeedVideoFPSRange = this.mCameraCapabilities.getSupportedHighSpeedVideoFPSRange(size);
        int length = supportedHighSpeedVideoFPSRange.length;
        Range range = null;
        for (int i2 = 0; i2 < length; i2++) {
            Range range2 = supportedHighSpeedVideoFPSRange[i2];
            if (((Integer) range2.getUpper()).intValue() == i && (range == null || ((Integer) range.getLower()).intValue() < ((Integer) range2.getLower()).intValue())) {
                range = range2;
            }
        }
        this.mHfrFPSLower = ((Integer) range.getLower()).intValue();
        this.mHfrFPSUpper = ((Integer) range.getUpper()).intValue();
    }

    private void updateMacroMode() {
        this.mCamera2Device.setMacroMode(CameraSettings.isMacroModeEnabled(this.mModuleIndex));
    }

    private void updateMutexModePreference() {
        if ("on".equals(DataRepository.dataItemConfig().getComponentHdr().getComponentValue(this.mModuleIndex))) {
            this.mMutexModePicker.setMutexMode(2);
        }
    }

    private void updatePictureAndPreviewSize() {
        int i;
        int i2;
        int i3;
        double d = ((double) this.mProfile.videoFrameWidth) / ((double) this.mProfile.videoFrameHeight);
        CameraSize optimalVideoSnapshotPictureSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(MediaRecorder.class), d, this.mProfile.videoFrameWidth, this.mProfile.videoFrameHeight);
        this.mVideoSize = optimalVideoSnapshotPictureSize;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("videoSize: ");
        sb.append(optimalVideoSnapshotPictureSize.toString());
        Log.d(str, sb.toString());
        int i4 = Integer.MAX_VALUE;
        if (b.hB()) {
            i4 = optimalVideoSnapshotPictureSize.width;
            i = optimalVideoSnapshotPictureSize.height;
        } else {
            i = Integer.MAX_VALUE;
        }
        CameraSize optimalVideoSnapshotPictureSize2 = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(256), d, i4, i);
        this.mPictureSize = optimalVideoSnapshotPictureSize2;
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("pictureSize: ");
        sb2.append(optimalVideoSnapshotPictureSize2);
        Log.d(str2, sb2.toString());
        if (optimalVideoSnapshotPictureSize.width > Util.sWindowHeight || optimalVideoSnapshotPictureSize.width < 720) {
            i2 = Util.sWindowHeight;
            i3 = Util.sWindowWidth;
        } else {
            i2 = optimalVideoSnapshotPictureSize.width;
            i3 = optimalVideoSnapshotPictureSize.height;
        }
        this.mPreviewSize = Util.getOptimalVideoSnapshotPictureSize(this.mCameraCapabilities.getSupportedOutputSize(SurfaceTexture.class), d, i2, i3);
        updateCameraScreenNailSize(this.mPreviewSize.width, this.mPreviewSize.height);
    }

    private void updateUltraWideLDC() {
        this.mCamera2Device.setUltraWideLDC(shouldApplyUltraWideLDC());
    }

    private void updateVideoStabilization() {
        if (isDeviceAlive()) {
            if (needDisableEISAndOIS()) {
                this.mCamera2Device.setEnableEIS(false);
                this.mCamera2Device.setEnableOIS(false);
                this.mActivity.getCameraScreenNail().setVideoStabilizationCropped(false);
                return;
            }
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

    public void consumePreference(@UpdateType int... iArr) {
        for (int i : iArr) {
            switch (i) {
                case 1:
                    updatePictureAndPreviewSize();
                    break;
                case 3:
                    updateFocusArea();
                    break;
                case 5:
                    updateFace();
                    break;
                case 9:
                    String antiBanding = (!b.he() || (!isHFRMode() && !isSlowMode())) ? CameraSettings.getAntiBanding() : "0";
                    updateAntiBanding(antiBanding);
                    break;
                case 10:
                    updateFlashPreference();
                    break;
                case 11:
                case 20:
                case 30:
                case 34:
                case 42:
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
                    updateVideoFocusMode();
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
                case 33:
                    if (this.mCamera2Device == null) {
                        break;
                    } else {
                        this.mCamera2Device.setVideoSnapshotSize(this.mPictureSize);
                        break;
                    }
                case 35:
                    updateDeviceOrientation();
                    break;
                case 40:
                    updateFrontMirror();
                    break;
                case 47:
                    updateUltraWideLDC();
                    break;
                case 51:
                    updateAutoZoomMode();
                    break;
                case 52:
                    updateMacroMode();
                    break;
                case 53:
                    updateHFRDeflicker();
                    break;
                default:
                    if (!DEBUG) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("no consumer for this updateType: ");
                        sb.append(i);
                        Log.w(str, sb.toString());
                        break;
                    } else {
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("no consumer for this updateType: ");
                        sb2.append(i);
                        throw new RuntimeException(sb2.toString());
                    }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void doLaterReleaseIfNeed() {
        super.doLaterReleaseIfNeed();
        if (isFPS960() && !this.mActivity.isActivityPaused()) {
            if (isTextureExpired()) {
                Log.d(TAG, "doLaterReleaseIfNeed: restartModule...");
                restartModule();
                return;
            }
            Log.d(TAG, "doLaterReleaseIfNeed: dismissBlurCover...");
            this.mActivity.dismissBlurCover();
        }
    }

    /* access modifiers changed from: protected */
    public boolean enableFaceDetection() {
        boolean z = false;
        if (DataRepository.dataItemFeature().gr() && isBackCamera()) {
            return false;
        }
        if (!isHFRMode() && !isSlowMode() && !ModuleManager.isVideoNewSlowMotion() && DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_FACE_DETECTION, getResources().getBoolean(R.bool.pref_camera_facedetection_default))) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public CamcorderProfile fetchProfile(int i, int i2) {
        return CamcorderProfile.get(i, i2);
    }

    /* access modifiers changed from: protected */
    public int getNormalVideoFrameRate() {
        if (isHFRMode() || isSlowMode() || this.mProfile == null) {
            return 30;
        }
        return this.mProfile.videoFrameRate;
    }

    /* access modifiers changed from: protected */
    public int getOperatingMode() {
        boolean z = false;
        if (!isFrontCamera()) {
            int i = 61456;
            if (this.mCameraCapabilities.isSupportVideoBeauty() && isFaceBeautyOn(this.mBeautyValues)) {
                i = 32777;
            } else if (this.mQuality == 0) {
                i = 0;
            } else if (isEisOn()) {
                i = 32772;
            }
            if (this.mCameraCapabilities.isFovcSupported()) {
                if (i != 0) {
                    z = true;
                }
                this.mFovcEnabled = z;
            }
            if (getHSRValue() == 60) {
                i = CameraCapabilities.SESSION_OPERATION_MODE_HSR_60;
            }
            return CameraSettings.isAutoZoomEnabled(this.mModuleIndex) ? CameraCapabilities.SESSION_OPERATION_MODE_AUTO_ZOOM : i;
        } else if (CameraSettings.isVideoBokehOn()) {
            return 32770;
        } else {
            if (isEisOn()) {
                return 32772;
            }
            if (this.mCameraCapabilities.isSupportVideoBeauty()) {
                return CameraCapabilities.SESSION_OPERATION_MODE_VIDEO_BEAUTY;
            }
            return 0;
        }
    }

    public List<String> getSupportedSettingKeys() {
        ArrayList arrayList = new ArrayList();
        if (isBackCamera()) {
            arrayList.add("pref_video_speed_fast_key");
            if (b.he()) {
                arrayList.add("pref_video_speed_slow_key");
            }
        }
        return arrayList;
    }

    /* access modifiers changed from: protected */
    public boolean isAEAFLockSupported() {
        return !this.mMediaRecorderRecording || !isFPS960();
    }

    /* access modifiers changed from: protected */
    public boolean isCameraSwitchingDuringZoomingAllowed() {
        return HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mModuleIndex == 162 && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && isBackCamera() && !this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused;
    }

    public boolean isNeedHapticFeedback() {
        return !this.mMediaRecorderRecording || this.mMediaRecorderRecordingPaused;
    }

    public boolean isNeedMute() {
        return this.mObjectTrackingStarted || (this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused);
    }

    public boolean isPostProcessing() {
        return this.mMediaRecorderPostProcessing;
    }

    /* access modifiers changed from: protected */
    public boolean isShowHFRDuration() {
        return true;
    }

    public boolean isUnInterruptable() {
        if (!super.isUnInterruptable() && !isNormalMode() && this.mMediaRecorder != null && this.mMediaRecorderWorking) {
            this.mUnInterruptableReason = "recorder release";
        }
        return this.mUnInterruptableReason != null;
    }

    /* access modifiers changed from: protected */
    public boolean isZoomEnabled() {
        if ((!isFPS960() || !this.mMediaRecorderRecording) && !CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
            return super.isZoomEnabled();
        }
        return false;
    }

    public boolean onBackPressed() {
        if (!isCreated()) {
            return false;
        }
        if (this.mPaused || this.mActivity.isActivityPaused()) {
            return true;
        }
        if (this.mStereoSwitchThread != null) {
            return false;
        }
        if (isFPS960() && this.mMediaRecorderPostProcessing) {
            return true;
        }
        if (this.mMediaRecorderRecording) {
            long currentTimeMillis = System.currentTimeMillis();
            if (currentTimeMillis - this.mLastBackPressedTime > 3000) {
                this.mLastBackPressedTime = currentTimeMillis;
                ToastUtils.showToast((Context) this.mActivity, (int) R.string.record_back_pressed_hint);
            } else {
                stopVideoRecording(true, false);
            }
            return true;
        } else if (CameraSettings.isStereoModeOn()) {
            return true;
        } else {
            if (!this.isAutoZoomTracking.get()) {
                return super.onBackPressed();
            }
            stopTracking(0);
            return true;
        }
    }

    /* access modifiers changed from: protected */
    public void onCameraOpened() {
        super.onCameraOpened();
        updateBeauty();
        readVideoPreferences();
        initializeFocusManager();
        updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_INIT);
        if (!initializeRecorder(false)) {
            startPreviewSession();
        } else if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
            startHighSpeedRecordSession();
        } else {
            startRecordSession();
        }
        initAutoZoom();
    }

    public void onCreate(int i, int i2) {
        super.onCreate(i, i2);
        changeConflictPreference();
        setCaptureIntent(this.mActivity.getCameraIntentManager().isVideoCaptureIntent());
        EffectController.getInstance().setEffect(FilterInfo.FILTER_ID_NONE);
        this.mActivity.getSensorStateManager().setSensorStateListener(this.mSensorStateListener);
        this.mQuickCapture = this.mActivity.getCameraIntentManager().isQuickCapture().booleanValue();
        this.mMainProtocol.setObjectViewListener(this);
        enableCameraControls(false);
        this.mTelephonyManager = (TelephonyManager) this.mActivity.getSystemService("phone");
        this.mVideoFocusMode = AutoFocus.LEGACY_CONTINUOUS_VIDEO;
        this.mAutoZoomViewProtocol = (AutoZoomViewProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(214);
        this.mTopAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
        initRecorderSurface();
        onCameraOpened();
    }

    public void onDestroy() {
        super.onDestroy();
        releaseRecorderSurface();
        this.mHandler.sendEmptyMessage(45);
    }

    public void onError(MediaRecorder mediaRecorder, int i, int i2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("MediaRecorder error. what=");
        sb.append(i);
        sb.append(" extra=");
        sb.append(i2);
        Log.e(str, sb.toString());
        if (i == 1 || i == 100) {
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            }
            this.mActivity.getScreenHint().updateHint();
        }
    }

    public boolean onGestureTrack(RectF rectF, boolean z) {
        if (this.mInStartingFocusRecording || !isBackCamera() || !b.hg() || CameraSettings.is4KHigherVideoQuality(this.mQuality) || isCaptureIntent()) {
            return false;
        }
        return initializeObjectTrack(rectF, z);
    }

    public void onInfo(MediaRecorder mediaRecorder, int i, int i2) {
        if (!this.mMediaRecorderRecording) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onInfo: ignore event ");
            sb.append(i);
            Log.w(str, sb.toString());
            return;
        }
        switch (i) {
            case 800:
                stopVideoRecording(true, false);
                break;
            case 801:
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("reached max size. fileNumber=");
                sb2.append(this.mCurrentFileNumber);
                Log.w(str2, sb2.toString());
                stopVideoRecording(true, false);
                if (!this.mActivity.getScreenHint().isScreenHintVisible()) {
                    Toast.makeText(this.mActivity, R.string.video_reach_size_limit, 1).show();
                    break;
                }
                break;
            case 802:
                boolean isSplitWhenReachMaxSize = isSplitWhenReachMaxSize();
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("max file size is approaching. split: ");
                sb3.append(isSplitWhenReachMaxSize);
                Log.d(str3, sb3.toString());
                if (isSplitWhenReachMaxSize) {
                    this.mCurrentFileNumber++;
                    ContentValues genContentValues = genContentValues(this.mOutputFormat, this.mCurrentFileNumber);
                    String asString = genContentValues.getAsString("_data");
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("nextVideoPath: ");
                    sb4.append(asString);
                    Log.d(str4, sb4.toString());
                    if (setNextOutputFile(asString)) {
                        this.mNextVideoValues = genContentValues;
                        this.mNextVideoFileName = asString;
                        break;
                    }
                }
                break;
            case 803:
                Log.d(TAG, "next output file started");
                onMaxFileSizeReached();
                this.mCurrentVideoValues = this.mNextVideoValues;
                this.mCurrentVideoFilename = this.mNextVideoFileName;
                this.mNextVideoValues = null;
                this.mNextVideoFileName = null;
                break;
            default:
                String str5 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("onInfo what : ");
                sb5.append(i);
                Log.w(str5, sb5.toString());
                break;
        }
    }

    public void onObjectStable() {
    }

    public void onPause() {
        if (this.mCamera2Device != null && (this.mFovcEnabled || (this.mCameraCapabilities.isEISPreviewSupported() && isEisOn()))) {
            this.mCamera2Device.notifyVideoStreamEnd();
        }
        super.onPause();
        waitStereoSwitchThread();
        stopObjectTracking(false);
        releaseResources();
        updateStereoSettings(false);
        closeVideoFileDescriptor();
        this.mActivity.getSensorStateManager().reset();
        stopFaceDetection(true);
        resetScreenOn();
        this.mHandler.removeCallbacksAndMessages(null);
        if (!this.mActivity.isActivityPaused() && !CameraSettings.isStereoModeOn()) {
            PopupManager.getInstance(this.mActivity).notifyShowPopup(null, 1);
        }
    }

    public void onPauseButtonClick() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onPauseButtonClick: isRecordingPaused=");
        sb.append(this.mMediaRecorderRecordingPaused);
        sb.append(" isRecording=");
        sb.append(this.mMediaRecorderRecording);
        Log.d(str, sb.toString());
        long currentTimeMillis = System.currentTimeMillis();
        if (this.mMediaRecorderRecording && currentTimeMillis - this.mPauseClickTime >= 500) {
            this.mPauseClickTime = currentTimeMillis;
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (this.mMediaRecorderRecordingPaused) {
                try {
                    if (VERSION.SDK_INT >= 24) {
                        CompatibilityUtils.resumeMediaRecorder(this.mMediaRecorder);
                    } else {
                        this.mMediaRecorder.start();
                    }
                    this.mRecordingStartTime = SystemClock.uptimeMillis() - this.mVideoRecordedDuration;
                    this.mVideoRecordedDuration = 0;
                    this.mMediaRecorderRecordingPaused = false;
                    this.mHandler.removeMessages(42);
                    this.mRecordingTime = "";
                    updateRecordingTime();
                    recordState.onResume();
                } catch (IllegalStateException e) {
                    Log.e(TAG, "failed to resume media recorder", e);
                    releaseMediaRecorder();
                    recordState.onFailed();
                }
            } else {
                pauseVideoRecording();
                CameraStatUtil.trackPauseVideoRecording(isFrontCamera());
                recordState.onPause();
            }
            Log.d(TAG, "onPauseButtonClick");
        }
    }

    public void onPreviewLayoutChanged(Rect rect) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onPreviewLayoutChanged: ");
        sb.append(rect);
        Log.v(str, sb.toString());
        this.mActivity.onLayoutChange(rect);
        if (this.mFocusManager != null && this.mActivity.getCameraScreenNail() != null) {
            this.mActivity.getCameraScreenNail().setRenderArea(rect);
            this.mFocusManager.setRenderSize(this.mActivity.getCameraScreenNail().getRenderWidth(), this.mActivity.getCameraScreenNail().getRenderHeight());
            this.mFocusManager.setPreviewSize(rect.width(), rect.height());
        }
    }

    public void onPreviewMetaDataUpdate(CaptureResult captureResult) {
        super.onPreviewMetaDataUpdate(captureResult);
        if (this.isAutoZoomTracking.get()) {
            this.mAutoZoomEmitter.onNext(captureResult);
        }
    }

    public void onPreviewSessionFailed(CameraCaptureSession cameraCaptureSession) {
        super.onPreviewSessionFailed(cameraCaptureSession);
        enableCameraControls(true);
    }

    public void onPreviewSessionSuccess(CameraCaptureSession cameraCaptureSession) {
        super.onPreviewSessionSuccess(cameraCaptureSession);
        if (!isCreated()) {
            Log.w(TAG, "onPreviewSessionSuccess: module is not ready");
            enableCameraControls(true);
            return;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onPreviewSessionSuccess: session=");
        sb.append(cameraCaptureSession);
        Log.d(str, sb.toString());
        this.mFaceDetectionEnabled = false;
        updatePreferenceInWorkThread(UpdateConstant.VIDEO_TYPES_ON_PREVIEW_SUCCESS);
        enableCameraControls(true);
    }

    /* access modifiers changed from: protected */
    @MainThread
    public void onPreviewStart() {
        if (this.mPreviewing) {
            this.mMainProtocol.initializeFocusView(this);
            updateMutexModePreference();
            onShutterButtonFocus(true, 3);
            startVideoRecordingIfNeeded();
        }
    }

    public void onSharedPreferenceChanged() {
        if (!this.mPaused && !this.mActivity.isActivityPaused() && this.mCamera2Device != null) {
            int i = this.mProfile.videoFrameWidth;
            int i2 = this.mProfile.videoFrameHeight;
            readVideoPreferences();
            if (!(this.mProfile.videoFrameWidth == i && this.mProfile.videoFrameHeight == i2)) {
                Log.d(TAG, String.format(Locale.ENGLISH, "profile size changed [%d %d]->[%d %d]", new Object[]{Integer.valueOf(i), Integer.valueOf(i2), Integer.valueOf(this.mProfile.videoFrameWidth), Integer.valueOf(this.mProfile.videoFrameHeight)}));
                updatePreferenceTrampoline(1);
            }
        }
    }

    public void onShutterButtonClick(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onShutterButtonClick isRecording=");
        sb.append(this.mMediaRecorderRecording);
        sb.append(" inStartingFocusRecording=");
        sb.append(this.mInStartingFocusRecording);
        Log.v(str, sb.toString());
        this.mInStartingFocusRecording = false;
        this.mLastBackPressedTime = 0;
        if (isIgnoreTouchEvent()) {
            Log.w(TAG, "onShutterButtonClick: ignore touch event");
        } else if (!isFrontCamera() || !this.mActivity.isScreenSlideOff()) {
            if (this.mMediaRecorderRecording) {
                stopVideoRecording(true, false);
            } else {
                RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
                recordState.onPrepare();
                if (!checkCallingState()) {
                    recordState.onFailed();
                    return;
                }
                this.mActivity.getScreenHint().updateHint();
                if (Storage.isLowStorageAtLastPoint()) {
                    recordState.onFailed();
                    return;
                }
                setTriggerMode(i);
                enableCameraControls(false);
                playCameraSound(2);
                if (this.mFocusManager.canRecord()) {
                    startVideoRecording();
                } else {
                    Log.v(TAG, "wait for autoFocus");
                    this.mInStartingFocusRecording = true;
                    this.mHandler.sendEmptyMessageDelayed(55, 3000);
                }
            }
        }
    }

    public void onShutterButtonFocus(boolean z, int i) {
    }

    public void onSingleTapUp(int i, int i2, boolean z) {
        if (!this.mPaused && this.mCamera2Device != null && this.mCamera2Device.isSessionReady() && !this.mSnapshotInProgress && isInTapableRect(i, i2)) {
            if (!isFrameAvailable()) {
                Log.w(TAG, "onSingleTapUp: frame not available");
            } else if ((!isFrontCamera() || !this.mActivity.isScreenSlideOff()) && !((BackStack) ModeCoordinatorImpl.getInstance().getAttachProtocol(171)).handleBackStackFromTapDown(i, i2) && !this.isAutoZoomTracking.get()) {
                if (this.mObjectTrackingStarted) {
                    stopObjectTracking(false);
                }
                unlockAEAF();
                this.mMainProtocol.setFocusViewType(true);
                this.mTouchFocusStartingTime = System.currentTimeMillis();
                Point point = new Point(i, i2);
                mapTapCoordinate(point);
                this.mFocusManager.onSingleTapUp(point.x, point.y, z);
            }
        }
    }

    public void onStop() {
        super.onStop();
        this.mHandler.removeCallbacksAndMessages(null);
        exitSavePowerMode();
    }

    public void onTrackLost() {
        notifyAutoZoomStartUiHint();
    }

    public void onTrackLosting() {
        this.mTrackLostCount++;
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        if (this.mMediaRecorderRecording) {
            keepPowerSave();
        }
    }

    public void onVideoRecordStopped() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onVideoRecordStopped: ");
        sb.append(this.mPendingStopRecorder);
        Log.d(str, sb.toString());
        if (this.mPendingStopRecorder) {
            stopRecorder();
            startPreviewAfterRecord();
        }
    }

    /* access modifiers changed from: protected */
    public void onWaitStopCallbackTimeout() {
        stopRecorder();
        startPreviewAfterRecord();
    }

    public void onZoomingActionEnd(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onZoomingActionEnd(): ");
        sb.append(ZoomingAction.toString(i));
        sb.append(" @hash: ");
        sb.append(hashCode());
        Log.d(str, sb.toString());
        DualController dualController = (DualController) ModeCoordinatorImpl.getInstance().getAttachProtocol(182);
        if (dualController != null && !dualController.isSlideVisible()) {
            if ((i == 2 || i == 1) && !this.mMediaRecorderRecording && !this.mMediaRecorderRecordingPaused && !CameraSettings.isMacroModeEnabled(this.mModuleIndex)) {
                dualController.setImmersiveModeEnabled(false);
            }
        }
    }

    public void onZoomingActionStart(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onZoomingActionStart(): ");
        sb.append(ZoomingAction.toString(i));
        sb.append(" @hash: ");
        sb.append(hashCode());
        Log.d(str, sb.toString());
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
    public void pauseMediaRecorder(MediaRecorder mediaRecorder) {
        CompatibilityUtils.pauseMediaRecorder(mediaRecorder);
    }

    public void pausePreview() {
        Log.v(TAG, "pausePreview");
        this.mPreviewing = false;
        if (currentIsMainThread()) {
            stopObjectTracking(false);
        }
        if (this.mCamera2Device != null) {
            this.mCamera2Device.pausePreview();
        }
        if (this.mFocusManager != null) {
            this.mFocusManager.resetFocused();
        }
    }

    public void reShowMoon() {
        if (CameraSettings.isAutoZoomEnabled(this.mModuleIndex)) {
            notifyAutoZoomStartUiHint();
        }
    }

    /* access modifiers changed from: protected */
    public void readVideoPreferences() {
        int i;
        int videoQuality = CameraSettings.getVideoQuality(this.mModuleIndex);
        try {
            videoQuality = getActivity().getCameraIntentManager().getVideoQuality() > 0 ? 1 : 0;
        } catch (RuntimeException e) {
        }
        this.mSpeed = DataRepository.dataItemRunning().getVideoSpeed();
        if (ModuleManager.isVideoNewSlowMotion()) {
            this.mSpeed = CameraSettings.VIDEO_MODE_960;
        } else {
            this.mSlowModeFps = null;
        }
        this.mTimeBetweenTimeLapseFrameCaptureMs = 0;
        this.mCaptureTimeLapse = false;
        if (CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed)) {
            this.mTimeBetweenTimeLapseFrameCaptureMs = Integer.parseInt(DataRepository.dataItemGlobal().getString(CameraSettings.KEY_VIDEO_TIME_LAPSE_FRAME_INTERVAL, getString(R.string.pref_video_time_lapse_frame_interval_default)));
            this.mCaptureTimeLapse = this.mTimeBetweenTimeLapseFrameCaptureMs != 0;
            if (this.mCaptureTimeLapse) {
                i += 1000;
                if (i < 1000 || i > 1008) {
                    i += Error.SYN_INIT_FAILED;
                    this.mCaptureTimeLapse = false;
                    forceToNormalMode();
                    RotateTextToast.getInstance(this.mActivity).show(R.string.time_lapse_error, this.mOrientation);
                }
            }
            this.mQuality = i % 1000;
        } else {
            int i2 = 120;
            if (isHFRMode() || isSlowMode()) {
                String hfrSetting = getHfrSetting();
                String[] split = hfrSetting.split(":");
                if (isSlowMode()) {
                    this.mQuality = convertSizeToQuality(split[0]);
                } else {
                    int max = Math.max(Math.min(i, 6), 5);
                    this.mQuality = max;
                }
                if (this.mQuality == -1) {
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("invalid hfr setting: ");
                    sb.append(hfrSetting);
                    Log.e(str, sb.toString());
                    forceToNormalMode();
                    this.mQuality = i;
                } else {
                    i = this.mQuality;
                    Size size = 6 == i ? new Size(1920, ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_END_DEAULT) : new Size(1280, Util.LIMIT_SURFACE_WIDTH);
                    int parseInt = Util.parseInt(split[1], 120);
                    if (isHFRMode()) {
                        List supportedHFRVideoFPSList = this.mCameraCapabilities.getSupportedHFRVideoFPSList(size);
                        if (!supportedHFRVideoFPSList.contains(Integer.valueOf(120))) {
                            i2 = ((Integer) supportedHFRVideoFPSList.get(0)).intValue();
                        }
                    } else {
                        i2 = parseInt;
                    }
                    updateHfrFPSRange(size, i2);
                }
            } else if (ModuleManager.isVideoNewSlowMotion()) {
                this.mQuality = 6;
                Size size2 = SIZE_1080;
                int newSlowMotionIQ = CameraSettings.getNewSlowMotionIQ();
                if (newSlowMotionIQ == 5) {
                    size2 = SIZE_720;
                    this.mQuality = newSlowMotionIQ;
                }
                this.mSlowModeFps = DataRepository.dataItemConfig().getComponentConfigSlowMotion().getComponentValue(172);
                if (isFPS120()) {
                    updateHfrFPSRange(size2, 120);
                } else {
                    if (!CameraSettings.getSupportedHfrSettings(0).contains(CameraSettings.SIZE_FPS_1080_240)) {
                        size2 = SIZE_720;
                        this.mQuality = 5;
                        newSlowMotionIQ = 5;
                    }
                    updateHfrFPSRange(size2, 240);
                }
                i = newSlowMotionIQ;
            } else {
                if (this.mCameraCapabilities.isSupportVideoBeauty() && isFaceBeautyOn(this.mBeautyValues)) {
                    i = Math.min(i, 6);
                }
                this.mQuality = i;
            }
        }
        if (!(this.mProfile == null || this.mProfile.quality % 1000 == this.mQuality)) {
            stopObjectTracking(false);
        }
        this.mProfile = fetchProfile(this.mBogusCameraId, i);
        this.mProfile.videoCodec = CameraSettings.getVideoEncoder();
        this.mOutputFormat = this.mProfile.fileFormat;
        String str2 = TAG;
        Locale locale = Locale.ENGLISH;
        String str3 = "frameRate=%d profileSize=%dx%d codec=%d";
        Object[] objArr = new Object[4];
        objArr[0] = Integer.valueOf(getHSRValue() > 0 ? getHSRValue() : this.mProfile.videoFrameRate);
        objArr[1] = Integer.valueOf(this.mProfile.videoFrameWidth);
        objArr[2] = Integer.valueOf(this.mProfile.videoFrameHeight);
        objArr[3] = Integer.valueOf(this.mProfile.videoCodec);
        Log.d(str2, String.format(locale, str3, objArr));
        if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
            this.mFrameRate = this.mHfrFPSUpper;
        } else {
            this.mFrameRate = this.mProfile.videoFrameRate;
        }
        if (isFPS960()) {
            this.mMaxVideoDurationInMs = 2000;
            return;
        }
        try {
            this.mMaxVideoDurationInMs = this.mActivity.getCameraIntentManager().getVideoDurationTime() * 1000;
        } catch (RuntimeException e2) {
            if (!DataRepository.dataItemFeature().gs() || !CameraSettings.is4KHigherVideoQuality(this.mQuality) || this.mCaptureTimeLapse) {
                this.mMaxVideoDurationInMs = 0;
            } else {
                this.mMaxVideoDurationInMs = MAX_DURATION_4K;
            }
        }
        if (this.mMaxVideoDurationInMs != 0 && this.mMaxVideoDurationInMs < 1000) {
            this.mMaxVideoDurationInMs = 1000;
        }
    }

    public void registerProtocol() {
        super.registerProtocol();
        ModeCoordinatorImpl.getInstance().attachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(215, this);
        ModeCoordinatorImpl.getInstance().attachProtocol(193, this);
        if (HybridZoomingSystem.IS_3_OR_MORE_SAT) {
            getActivity().getImplFactory().initAdditional(getActivity(), 164, 174, 199, 212);
        } else {
            getActivity().getImplFactory().initAdditional(getActivity(), 164, 199, 212);
        }
    }

    /* access modifiers changed from: protected */
    public void resizeForPreviewAspectRatio() {
        if (((this.mCameraCapabilities.getSensorOrientation() - Util.getDisplayRotation(this.mActivity)) + ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT) % 180 == 0) {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.height) / ((float) this.mVideoSize.width));
        } else {
            this.mMainProtocol.setPreviewAspectRatio(((float) this.mVideoSize.width) / ((float) this.mVideoSize.height));
        }
    }

    public void resumePreview() {
        Log.v(TAG, "resumePreview");
        this.mPreviewing = true;
        if (this.mCamera2Device != null) {
            this.mCamera2Device.resumePreview();
        }
    }

    public void setAutoZoomMode(int i) {
        updatePreferenceInWorkThread(51);
    }

    public void setAutoZoomStartCapture(RectF rectF) {
        if (this.mCamera2Device != null && isAlive()) {
            this.mCamera2Device.setAutoZoomStartCapture(new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()});
        }
    }

    public void setAutoZoomStopCapture(int i) {
        if (this.mCamera2Device != null && isAlive()) {
            this.mCamera2Device.setAutoZoomStopCapture(i);
        }
    }

    public void startAiLens() {
    }

    public void startAutoZoom() {
        this.isShowOrHideUltraWideHint.getAndSet(true);
        this.isAutoZoomTracking.getAndSet(false);
        this.mHandler.post(new Runnable() {
            public void run() {
                if (VideoModule.this.mAutoZoomViewProtocol != null) {
                    VideoModule.this.mAutoZoomViewProtocol.onAutoZoomStarted();
                }
            }
        });
        notifyAutoZoomStartUiHint();
    }

    public void startObjectTracking() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startObjectTracking: started=");
        sb.append(this.mObjectTrackingStarted);
        Log.d(str, sb.toString());
    }

    public void startPreview() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startPreview: previewing=");
        sb.append(this.mPreviewing);
        Log.v(str, sb.toString());
        checkDisplayOrientation();
        this.mPreviewing = true;
    }

    public void startTracking(RectF rectF) {
        if (this.mCamera2Device != null && isAlive()) {
            if (this.mTopAlert != null) {
                this.mTopAlert.alertAiDetectTipHint(4, 0, 0);
            }
            notifyAutoZoomStopUiHint();
            this.mCamera2Device.setAutoZoomStopCapture(-1);
            this.mCamera2Device.setAutoZoomStartCapture(new float[]{rectF.left, rectF.top, rectF.width(), rectF.height()});
            this.mCamera2Device.setAutoZoomStartCapture(new float[]{0.0f, 0.0f, 0.0f, 0.0f});
            this.isAutoZoomTracking.getAndSet(true);
            CameraStatUtil.trackSelectObject(this.mMediaRecorderRecording);
        }
    }

    /* access modifiers changed from: protected */
    public void startVideoRecording() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startVideoRecording: mode=");
        sb.append(this.mSpeed);
        Log.v(str, sb.toString());
        if (isDeviceAlive()) {
            ScenarioTrackUtil.trackStartVideoRecordStart(this.mSpeed, isFrontCamera());
            this.mCurrentFileNumber = isCaptureIntent() ? -1 : 0;
            silenceSounds();
            if (!startRecorder()) {
                onStartRecorderFail();
                return;
            }
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                recordState.onStart();
            }
            updatePreferenceTrampoline(UpdateConstant.VIDEO_TYPES_RECORD);
            if (isHFRMode() || isSlowMode() || ModuleManager.isVideoNewSlowMotion()) {
                this.mCamera2Device.startHighSpeedRecording();
            } else {
                this.mCamera2Device.startRecording();
            }
            Log.v(TAG, "startVideoRecording process done");
            this.mTrackLostCount = 0;
            ScenarioTrackUtil.trackStartVideoRecordEnd();
            onStartRecorderSucceed();
        }
    }

    public void stopAutoZoom() {
        this.isShowOrHideUltraWideHint.getAndSet(false);
        this.isAutoZoomTracking.getAndSet(false);
        this.mHandler.post(new Runnable() {
            public void run() {
                if (VideoModule.this.mAutoZoomViewProtocol != null) {
                    VideoModule.this.mAutoZoomViewProtocol.onAutoZoomStopped();
                }
            }
        });
        notifyAutoZoomStopUiHint();
    }

    public void stopObjectTracking(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("stopObjectTracking: started=");
        sb.append(this.mObjectTrackingStarted);
        Log.d(str, sb.toString());
    }

    public void stopTracking(int i) {
        if (this.isAutoZoomTracking.get()) {
            this.isAutoZoomTracking.getAndSet(false);
            if (this.mCamera2Device != null && isAlive()) {
                this.mCamera2Device.setAutoZoomStopCapture(0);
                this.mCamera2Device.setAutoZoomStopCapture(-1);
            }
            this.mAutoZoomViewProtocol.onTrackingStopped(i);
        }
        notifyAutoZoomStartUiHint();
    }

    public void stopVideoRecording(boolean z, boolean z2) {
        long j;
        boolean z3 = z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("stopVideoRecording>>");
        sb.append(this.mMediaRecorderRecording);
        sb.append("|");
        sb.append(z3);
        Log.v(str, sb.toString());
        if (this.mMediaRecorderRecording) {
            if (this.isAutoZoomTracking.get()) {
                stopTracking(0);
            }
            this.mMediaRecorderRecording = false;
            this.mMediaRecorderRecordingPaused = false;
            long currentTimeMillis = System.currentTimeMillis();
            if (isFPS960()) {
                if (FragmentTopAlert.HINT_DELAY_TIME - (SystemClock.uptimeMillis() - this.mRecordingStartTime) <= 100) {
                    this.mMediaRecorderPostProcessing = true;
                }
            }
            if (HybridZoomingSystem.IS_3_OR_MORE_SAT && this.mModuleIndex != 168 && this.mModuleIndex != 172 && this.mModuleIndex != 169 && this.mModuleIndex != 170 && !CameraSettings.isMacroModeEnabled(this.mModuleIndex) && !CameraSettings.isAutoZoomEnabled(this.mModuleIndex) && isBackCamera()) {
                updateZoomRatioToggleButtonState(false);
                if (isUltraWideBackCamera()) {
                    setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    setMaxZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR * this.mCameraCapabilities.getMaxZoomRatio());
                } else {
                    setMinZoomRatio(HybridZoomingSystem.FLOAT_ZOOM_RATIO_ULTR);
                    setMaxZoomRatio(Math.min(6.0f, this.mCameraCapabilities.getMaxZoomRatio()));
                }
            }
            enableCameraControls(false);
            if (this.mCamera2Device != null) {
                this.mCamera2Device.stopRecording(z3 ? null : this);
            }
            if (this.mCountDownTimer != null && CameraSettings.isVideoBokehOn()) {
                this.mCountDownTimer.cancel();
            }
            RecordState recordState = (RecordState) ModeCoordinatorImpl.getInstance().getAttachProtocol(212);
            if (recordState != null) {
                if (this.mMediaRecorderPostProcessing) {
                    recordState.onPostSavingStart();
                } else {
                    recordState.onFinish();
                }
            }
            if (this.mCamera2Device == null || ModuleManager.isVideoNewSlowMotion()) {
                j = currentTimeMillis;
            } else {
                boolean isAutoZoomEnabled = CameraSettings.isAutoZoomEnabled(this.mModuleIndex);
                j = currentTimeMillis;
                CameraStatUtil.trackVideoRecorded(isFrontCamera(), getModuleIndex(), isAutoZoomEnabled, CameraSettings.isUltraWideConfigOpen(getModuleIndex()), this.mSpeed, this.mQuality, this.mCamera2Device.getFlashMode(), this.mFrameRate, this.mTimeBetweenTimeLapseFrameCaptureMs, this.mBeautyValues, this.mVideoRecordTime);
                CameraStatUtil.trackUltraWideVideoTaken();
                if (isAutoZoomEnabled) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("track count is ");
                    sb2.append(this.mTrackLostCount);
                    Log.v(str2, sb2.toString());
                    CameraStatUtil.trackLostCount(this.mTrackLostCount);
                }
            }
            this.mVideoRecordTime = 0;
            if (z3) {
                stopRecorder();
                startPreviewAfterRecord();
            } else {
                this.mPendingStopRecorder = true;
                this.mHandler.sendEmptyMessageDelayed(46, 300);
            }
            AutoLockManager.getInstance(this.mActivity).hibernateDelayed();
            exitSavePowerMode();
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("stopVideoRecording<<time=");
            sb3.append(System.currentTimeMillis() - j);
            Log.v(str3, sb3.toString());
        }
    }

    public boolean takeVideoSnapShoot() {
        if (this.mPaused || this.mActivity.isActivityPaused() || this.mSnapshotInProgress || !this.mMediaRecorderRecording || !isDeviceAlive()) {
            return false;
        }
        if (Storage.isLowStorageAtLastPoint()) {
            Log.w(TAG, "capture: low storage");
            stopVideoRecording(true, false);
            return false;
        } else if (this.mActivity.getImageSaver().isBusy()) {
            Log.w(TAG, "capture: ImageSaver is full");
            RotateTextToast.getInstance(this.mActivity).show(R.string.toast_saving, 0);
            return false;
        } else {
            this.mCamera2Device.setJpegRotation(Util.getJpegRotation(this.mBogusCameraId, this.mOrientation));
            Location currentLocation = LocationManager.instance().getCurrentLocation();
            this.mCamera2Device.setGpsLocation(currentLocation);
            setJpegQuality();
            updateFrontMirror();
            if (!b.hI()) {
                this.mActivity.getCameraScreenNail().animateCapture(getCameraRotation());
            }
            Log.v(TAG, "capture: start");
            this.mCamera2Device.captureVideoSnapshot(new JpegPictureCallback(currentLocation));
            this.mSnapshotInProgress = true;
            CameraStatUtil.trackVideoSnapshot(isFrontCamera());
            return true;
        }
    }

    public void unRegisterProtocol() {
        super.unRegisterProtocol();
        ModeCoordinatorImpl.getInstance().detachProtocol(215, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(161, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(167, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(169, this);
        ModeCoordinatorImpl.getInstance().detachProtocol(193, this);
        getActivity().getImplFactory().detachAdditional();
    }

    /* access modifiers changed from: protected */
    public void updateRecordingTime() {
        String str;
        long j;
        double d;
        super.updateRecordingTime();
        if (this.mMediaRecorderRecording && !isFPS960() && !CameraSettings.isVideoBokehOn()) {
            long uptimeMillis = SystemClock.uptimeMillis() - this.mRecordingStartTime;
            if (this.mMediaRecorderRecordingPaused) {
                uptimeMillis = this.mVideoRecordedDuration;
            }
            boolean z = this.mMaxVideoDurationInMs != 0 && uptimeMillis >= ((long) (this.mMaxVideoDurationInMs - LinkSelectorConfiguration.MS_OF_ONE_MIN));
            long max = z ? Math.max(0, ((long) this.mMaxVideoDurationInMs) - uptimeMillis) + 999 : uptimeMillis;
            long j2 = 1000;
            if (isNormalMode() || isHFRMode()) {
                this.mVideoRecordTime = max / 1000;
                str = Util.millisecondToTimeString(max, false);
            } else {
                if (CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed)) {
                    d = (double) this.mTimeBetweenTimeLapseFrameCaptureMs;
                    j = (long) d;
                } else if (!isSlowMode() || !isShowHFRDuration()) {
                    j = 1000;
                    d = 0.0d;
                } else {
                    d = 1000.0d / ((double) this.mFrameRate);
                    j = (long) ((1000 * getNormalVideoFrameRate()) / this.mFrameRate);
                }
                if (d != 0.0d) {
                    str = Util.millisecondToTimeString(getSpeedRecordVideoLength(uptimeMillis, d), CameraSettings.VIDEO_SPEED_FAST.equals(this.mSpeed));
                    if (str.equals(this.mRecordingTime)) {
                        j2 = (long) d;
                    }
                } else {
                    str = Util.millisecondToTimeString(max, false);
                }
                j2 = j;
            }
            if (this.mTopAlert != null) {
                this.mTopAlert.updateRecordingTime(str);
            }
            this.mRecordingTime = str;
            if (this.mRecordingTimeCountsDown != z) {
                this.mRecordingTimeCountsDown = z;
            }
            long j3 = 500;
            if (!this.mMediaRecorderRecordingPaused) {
                j3 = j2 - (uptimeMillis % j2);
            }
            this.mHandler.sendEmptyMessageDelayed(42, j3);
        }
    }
}
