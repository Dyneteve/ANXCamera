package com.android.camera2;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.RectF;
import android.graphics.SurfaceTexture;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCaptureSession;
import android.hardware.camera2.CameraCaptureSession.StateCallback;
import android.hardware.camera2.CameraConstrainedHighSpeedCaptureSession;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CaptureRequest;
import android.hardware.camera2.CaptureRequest.Builder;
import android.hardware.camera2.CaptureRequest.Key;
import android.hardware.camera2.CaptureResult;
import android.hardware.camera2.TotalCaptureResult;
import android.hardware.camera2.impl.CameraMetadataNative;
import android.hardware.camera2.params.InputConfiguration;
import android.hardware.camera2.params.MeteringRectangle;
import android.hardware.camera2.params.OutputConfiguration;
import android.hardware.camera2.utils.SurfaceUtils;
import android.location.Location;
import android.media.Image;
import android.media.ImageReader;
import android.media.ImageReader.OnImageAvailableListener;
import android.media.ImageWriter;
import android.media.ImageWriter.OnImageReleasedListener;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.os.SystemProperties;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Range;
import android.util.Size;
import android.view.Surface;
import android.view.SurfaceHolder;
import com.android.camera.CameraSettings;
import com.android.camera.CameraSize;
import com.android.camera.HybridZoomingSystem;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.Thumbnail;
import com.android.camera.Util;
import com.android.camera.data.DataRepository;
import com.android.camera.fragment.beauty.BeautyValues;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.loader.FunctionParseBeautyBodySlimCount;
import com.android.camera.module.loader.camera2.Camera2DataContainer;
import com.android.camera.module.loader.camera2.FocusTask;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.statistic.CameraStat;
import com.android.camera2.Camera2Proxy.CameraMetaDataCallback;
import com.android.camera2.Camera2Proxy.CameraPreviewCallback;
import com.android.camera2.Camera2Proxy.CaptureBusyCallback;
import com.android.camera2.Camera2Proxy.CaptureCallback;
import com.android.camera2.Camera2Proxy.FocusCallback;
import com.android.camera2.Camera2Proxy.PictureCallback;
import com.android.camera2.Camera2Proxy.PreviewCallback;
import com.android.camera2.Camera2Proxy.ScreenLightCallback;
import com.android.camera2.Camera2Proxy.VideoRecordStateCallback;
import com.android.camera2.compat.MiCameraCompat;
import com.android.camera2.vendortag.CaptureRequestVendorTags;
import com.android.camera2.vendortag.CaptureResultVendorTags;
import com.android.camera2.vendortag.VendorTagHelper;
import com.android.camera2.vendortag.struct.AWBFrameControl;
import com.mi.config.b;
import com.xiaomi.camera.core.ParallelCallback;
import com.xiaomi.protocol.IImageReaderParameterSets;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Objects;
import java.util.concurrent.ConcurrentLinkedDeque;

@TargetApi(21)
public class MiCamera2 extends Camera2Proxy {
    private static final int DEF_QUICK_SHOT_THRESHOLD_INTERVAL_TIME = 50;
    private static final int DEF_QUICK_SHOT_THRESHOLD_SHOT_CACHE_COUNT = 10;
    private static final int DEF_QUICK_SHOT_THRESHOLD_SHOT_CACHE_TIME_OUT = 10000;
    private static final int MAX_IMAGE_BUFFER_SIZE = (b.jx() ? 12 : 10);
    private static final int MSG_CHECK_CAMERA_ALIVE = 3;
    private static final int MSG_WAITING_AF_LOCK_TIMEOUT = 1;
    private static final int MSG_WAITING_LOCAL_PARALLER_SERVICE_READY = 2;
    /* access modifiers changed from: private */
    public static final String TAG = MiCamera2.class.getSimpleName();
    static final MeteringRectangle[] ZERO_WEIGHT_3A_REGION;
    private CameraDevice mCameraDevice;
    private Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private Handler mCameraPreviewHandler;
    /* access modifiers changed from: private */
    public final CameraCapabilities mCapabilities;
    private CaptureBusyCallback mCaptureBusyCallback = null;
    private PictureCaptureCallback mCaptureCallback;
    /* access modifiers changed from: private */
    public CameraCaptureSession mCaptureSession;
    private CaptureSessionStateCallback mCaptureSessionStateCallback;
    private long mCaptureTime = 0;
    /* access modifiers changed from: private */
    public CameraConfigs mConfigs;
    private long mCurrentFrameNum = -1;
    /* access modifiers changed from: private */
    public List<OutputConfiguration> mDeferOutputConfigurations = new ArrayList();
    /* access modifiers changed from: private */
    public Surface mDeferPreviewSurface;
    private ImageReader mDepthReader;
    private int mDisplayOrientation;
    private boolean mEnableParallelSession;
    private SurfaceTexture mFakeOutputTexture;
    /* access modifiers changed from: private */
    public int mFocusLockRequestHashCode;
    private CaptureCallback mFrontQuickCaptureCallback;
    /* access modifiers changed from: private */
    public Handler mHelperHandler;
    private Range<Integer> mHighSpeedFpsRange;
    private volatile boolean mIsCameraClosed;
    private boolean mIsCaptureCompleted = true;
    /* access modifiers changed from: private */
    public volatile boolean mIsCaptureSessionClosed;
    private boolean mIsPreviewCallbackEnabled;
    private boolean mIsPreviewCallbackStarted;
    private long mLastFrameNum = -1;
    /* access modifiers changed from: private */
    public MiCamera2Shot mMiCamera2Shot;
    /* access modifiers changed from: private */
    public ConcurrentLinkedDeque<MiCamera2Shot> mMiCamera2ShotQueue = new ConcurrentLinkedDeque<>();
    private List<Surface> mParallelCaptureSurfaceList;
    /* access modifiers changed from: private */
    public volatile boolean mPendingNotifyVideoEnd;
    private ImageReader mPhotoImageReader;
    private ImageReader mPortraitRawImageReader;
    /* access modifiers changed from: private */
    public int mPreCaptureRequestHashCode;
    /* access modifiers changed from: private */
    public MiCamera2Preview mPreviewControl;
    private ImageReader mPreviewImageReader;
    private CaptureRequest mPreviewRequest;
    /* access modifiers changed from: private */
    public Builder mPreviewRequestBuilder;
    /* access modifiers changed from: private */
    public Surface mPreviewSurface;
    private ImageReader mRawImageReader;
    private ImageWriter mRawImageWriter;
    private Surface mRecordSurface;
    private List<ImageReader> mRemoteImageReaderList = new ArrayList();
    private int mScreenLightColorTemperature;
    /* access modifiers changed from: private */
    public int mSessionId;
    /* access modifiers changed from: private */
    public final Object mSessionLock = new Object();
    /* access modifiers changed from: private */
    public boolean mSetRepeatingEarly = DataRepository.dataItemFeature().gR();
    /* access modifiers changed from: private */
    public final Object mShotQueueLock = new Object();
    /* access modifiers changed from: private */
    public boolean mToTele;
    /* access modifiers changed from: private */
    public VideoRecordStateCallback mVideoRecordStateCallback;
    /* access modifiers changed from: private */
    public final Object mVideoRecordStateLock = new Object();
    /* access modifiers changed from: private */
    public int mVideoSessionId;
    private ImageReader mVideoSnapshotImageReader;

    private class CaptureSessionStateCallback extends StateCallback {
        private WeakReference<CameraPreviewCallback> mClientCb;
        private int mId;

        public CaptureSessionStateCallback(int i, CameraPreviewCallback cameraPreviewCallback) {
            this.mId = i;
            this.mClientCb = new WeakReference<>(cameraPreviewCallback);
        }

        public void onClosed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onClosed: id=");
            sb.append(this.mId);
            sb.append(" sessionId=");
            sb.append(MiCamera2.this.mSessionId);
            Log.e(access$000, sb.toString());
            if (this.mId == MiCamera2.this.mSessionId && this.mClientCb != null) {
                CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                if (cameraPreviewCallback != null) {
                    cameraPreviewCallback.onPreviewSessionClosed(cameraCaptureSession);
                }
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onConfigureFailed: id=");
            sb.append(this.mId);
            sb.append(" sessionId=");
            sb.append(MiCamera2.this.mSessionId);
            Log.e(access$000, sb.toString());
            if (this.mId == MiCamera2.this.mSessionId && this.mClientCb != null) {
                CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                if (cameraPreviewCallback != null) {
                    cameraPreviewCallback.onPreviewSessionFailed(cameraCaptureSession);
                }
            }
        }

        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            if (this.mId == MiCamera2.this.mSessionId) {
                synchronized (MiCamera2.this.mSessionLock) {
                    String access$000 = MiCamera2.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onConfigured: id = ");
                    sb.append(this.mId);
                    sb.append(", session = ");
                    sb.append(cameraCaptureSession);
                    sb.append(", reprocessable = ");
                    sb.append(cameraCaptureSession.isReprocessable());
                    Log.d(access$000, sb.toString());
                    MiCamera2.this.mCaptureSession = cameraCaptureSession;
                    if (MiCamera2.this.mCaptureSession.isReprocessable()) {
                        MiCamera2.this.prepareRawImageWriter(MiCamera2.this.mConfigs.getSensorRawImageSize(), MiCamera2.this.mCaptureSession.getInputSurface());
                    }
                }
                MiCamera2.this.mIsCaptureSessionClosed = false;
                if (MiCamera2.this.mPendingNotifyVideoEnd && this.mId == MiCamera2.this.mVideoSessionId) {
                    MiCamera2.this.notifyVideoStreamEnd();
                    MiCamera2.this.mPendingNotifyVideoEnd = false;
                }
                synchronized (MiCamera2.this.mSessionLock) {
                    if (!MiCamera2.this.mDeferOutputConfigurations.isEmpty() && MiCamera2.this.mSetRepeatingEarly) {
                        MiCamera2.this.resumePreview();
                    }
                }
                boolean updateDeferPreviewSession = MiCamera2.this.updateDeferPreviewSession(MiCamera2.this.mDeferPreviewSurface);
                String access$0002 = MiCamera2.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("onConfigured: updateDeferPreviewSession result = ");
                sb2.append(updateDeferPreviewSession);
                Log.d(access$0002, sb2.toString());
                if (updateDeferPreviewSession) {
                    onPreviewSessionSuccess();
                }
            }
        }

        public void onPreviewSessionSuccess() {
            boolean isEmpty;
            synchronized (MiCamera2.this.mSessionLock) {
                isEmpty = MiCamera2.this.mDeferOutputConfigurations.isEmpty();
            }
            if (isEmpty && this.mId == MiCamera2.this.mSessionId && this.mClientCb != null) {
                CameraPreviewCallback cameraPreviewCallback = (CameraPreviewCallback) this.mClientCb.get();
                if (cameraPreviewCallback != null) {
                    cameraPreviewCallback.onPreviewSessionSuccess(MiCamera2.this.mCaptureSession);
                }
            }
        }

        public void setClientCb(CameraPreviewCallback cameraPreviewCallback) {
            this.mClientCb = new WeakReference<>(cameraPreviewCallback);
        }
    }

    private class HighSpeedCaptureSessionStateCallback extends StateCallback {
        private final WeakReference<CameraPreviewCallback> mClientCb;
        private final int mId;

        public HighSpeedCaptureSessionStateCallback(int i, CameraPreviewCallback cameraPreviewCallback) {
            this.mId = i;
            this.mClientCb = new WeakReference<>(cameraPreviewCallback);
        }

        public void onClosed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onHighSpeedClosed: ");
            sb.append(cameraCaptureSession);
            Log.d(access$000, sb.toString());
            synchronized (MiCamera2.this.mSessionLock) {
                if (MiCamera2.this.mCaptureSession != null && MiCamera2.this.mCaptureSession.equals(cameraCaptureSession)) {
                    MiCamera2.this.mCaptureSession = null;
                }
            }
            if (this.mClientCb.get() != null) {
                ((CameraPreviewCallback) this.mClientCb.get()).onPreviewSessionClosed(cameraCaptureSession);
            }
        }

        public void onConfigureFailed(@NonNull CameraCaptureSession cameraCaptureSession) {
            String access$000 = MiCamera2.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onHighSpeedConfigureFailed: id=");
            sb.append(this.mId);
            sb.append(" sessionId=");
            sb.append(MiCamera2.this.mSessionId);
            Log.e(access$000, sb.toString());
            if (this.mClientCb.get() != null) {
                ((CameraPreviewCallback) this.mClientCb.get()).onPreviewSessionFailed(cameraCaptureSession);
            }
        }

        public void onConfigured(@NonNull CameraCaptureSession cameraCaptureSession) {
            if (this.mId == MiCamera2.this.mSessionId) {
                synchronized (MiCamera2.this.mSessionLock) {
                    String access$000 = MiCamera2.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onHighSpeedConfigured: id=");
                    sb.append(this.mId);
                    sb.append(" highSpeedSession=");
                    sb.append(cameraCaptureSession);
                    Log.d(access$000, sb.toString());
                    MiCamera2.this.mCaptureSession = cameraCaptureSession;
                }
                MiCamera2.this.mIsCaptureSessionClosed = false;
                MiCamera2.this.applySettingsForVideo(MiCamera2.this.mPreviewRequestBuilder);
                MiCameraCompat.applyIsHfrPreview(MiCamera2.this.mPreviewRequestBuilder, true);
                if (this.mClientCb.get() != null) {
                    ((CameraPreviewCallback) this.mClientCb.get()).onPreviewSessionSuccess(cameraCaptureSession);
                }
            }
        }
    }

    private class PictureCaptureCallback extends CameraCaptureSession.CaptureCallback {
        private boolean mAELockOnlySupported;
        private FocusTask mAutoFocusTask;
        private boolean mFocusAreaSupported;
        private int mLastResultAEState = -1;
        private int mLastResultAFState = -1;
        private FocusTask mManuallyFocusTask;
        private boolean mPartialResultSupported;
        private CaptureResult mPreviewCaptureResult;
        private final Object mPreviewCaptureResultLock = new Object();
        private int mState = 0;
        private final Object mStateLock = new Object();
        private FocusTask mTorchFocusTask;

        PictureCaptureCallback() {
            this.mPartialResultSupported = MiCamera2.this.mCapabilities.isPartialMetadataSupported();
            onCapabilityChanged(MiCamera2.this.mCapabilities);
        }

        private boolean isAeLocked(Integer num) {
            switch (num.intValue()) {
                case 2:
                case 3:
                case 4:
                    return true;
                default:
                    return false;
            }
        }

        private Boolean isAutoFocusing(Integer num) {
            int intValue = num.intValue();
            return (intValue == 1 || intValue == 3) ? Boolean.TRUE : Boolean.FALSE;
        }

        private Boolean isFocusLocked(Integer num) {
            int intValue = num.intValue();
            if (intValue != 2) {
                switch (intValue) {
                    case 4:
                        break;
                    case 5:
                    case 6:
                        return Boolean.FALSE;
                    default:
                        return null;
                }
            }
            return Boolean.TRUE;
        }

        private void process(@NonNull CaptureResult captureResult) {
            synchronized (this.mPreviewCaptureResultLock) {
                this.mPreviewCaptureResult = captureResult;
            }
            processVideoRecordStatus(captureResult);
            if (HybridZoomingSystem.IS_2_SAT && MiCamera2.this.mToTele && CaptureResultParser.getFastZoomResult(captureResult)) {
                Log.d(MiCamera2.TAG, "process: CaptureResultParser fast zoom...");
                MiCamera2.this.setOpticalZoomToTele(false);
                MiCamera2.this.resumePreview();
            }
            CameraMetaDataCallback metadataCallback = MiCamera2.this.getMetadataCallback();
            int state = getState();
            if (state != 1) {
                switch (state) {
                    case 9:
                        if (MiCamera2.this.mIsCaptureSessionClosed) {
                            Log.w(MiCamera2.TAG, "process: STATE_WAITING_FLASH_CLOSE but capture session is closed");
                            return;
                        }
                        Integer num = (Integer) captureResult.get(CaptureResult.FLASH_STATE);
                        if (num == null || num.intValue() == 2) {
                            setState(8);
                            MiCamera2.this.captureStillPicture();
                            return;
                        }
                        return;
                    case 10:
                        Integer num2 = (Integer) captureResult.get(CaptureResult.FLASH_STATE);
                        if (num2 != null && 3 == num2.intValue()) {
                            MiCamera2.this.triggerPrecapture();
                            return;
                        }
                        return;
                    case 11:
                        Integer num3 = (Integer) captureResult.get(CaptureResult.FLASH_STATE);
                        if (num3 == null || num3.intValue() == 2) {
                            setState(0);
                            MiCamera2.this.pausePreview();
                            return;
                        }
                        return;
                    default:
                        return;
                }
            } else if (metadataCallback != null) {
                metadataCallback.onPreviewMetaDataUpdate(captureResult);
            }
        }

        private void processAeResult(CaptureResult captureResult) {
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
            if (num != null) {
                FocusCallback focusCallback = MiCamera2.this.getFocusCallback();
                if (focusCallback != null && num.intValue() != this.mLastResultAEState && this.mManuallyFocusTask != null) {
                    Log.d(MiCamera2.TAG, String.format(Locale.ENGLISH, "aeState changed from %d to %d,", new Object[]{Integer.valueOf(this.mLastResultAEState), Integer.valueOf(num.intValue())}));
                    this.mLastResultAEState = num.intValue();
                    if (this.mAutoFocusTask != null) {
                        this.mAutoFocusTask = null;
                        return;
                    }
                    boolean isAeLocked = isAeLocked(num);
                    if (isAeLocked) {
                        Log.d(MiCamera2.TAG, "AE has been already converged, lock AE");
                        this.mManuallyFocusTask.setResult(isAeLocked);
                        focusCallback.onFocusStateChanged(this.mManuallyFocusTask);
                        this.mManuallyFocusTask = null;
                    }
                }
            }
        }

        private void processAfResult(CaptureResult captureResult) {
            Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
            if (num != null) {
                FocusCallback focusCallback = MiCamera2.this.getFocusCallback();
                if (focusCallback != null && num.intValue() != this.mLastResultAFState) {
                    Log.d(MiCamera2.TAG, String.format(Locale.ENGLISH, "afState changed from %d to %d", new Object[]{Integer.valueOf(this.mLastResultAFState), Integer.valueOf(num.intValue())}));
                    this.mLastResultAFState = num.intValue();
                    if (this.mManuallyFocusTask == null) {
                        if (isAutoFocusing(num).booleanValue()) {
                            this.mAutoFocusTask = FocusTask.create(2);
                            focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                        } else {
                            Boolean isFocusLocked = isFocusLocked(num);
                            if (!(isFocusLocked == null || this.mAutoFocusTask == null)) {
                                this.mAutoFocusTask.setResult(isFocusLocked.booleanValue());
                                focusCallback.onFocusStateChanged(this.mAutoFocusTask);
                                this.mAutoFocusTask = null;
                            }
                        }
                    } else if (this.mAutoFocusTask != null) {
                        this.mAutoFocusTask = null;
                    } else {
                        Boolean isFocusLocked2 = isFocusLocked(num);
                        if (isFocusLocked2 != null) {
                            this.mManuallyFocusTask.setResult(isFocusLocked2.booleanValue());
                            focusCallback.onFocusStateChanged(this.mManuallyFocusTask);
                            this.mManuallyFocusTask = null;
                        }
                    }
                }
            }
        }

        private void processPartial(@NonNull CaptureResult captureResult) {
            if (this.mFocusAreaSupported) {
                processAfResult(captureResult);
            } else if (this.mAELockOnlySupported) {
                processAeResult(captureResult);
            }
            switch (getState()) {
                case 3:
                    Integer num = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    if (num != null) {
                        if (4 == num.intValue() || 5 == num.intValue() || 2 == num.intValue() || 6 == num.intValue() || (MiCamera2.this.mFocusLockRequestHashCode == captureResult.getRequest().hashCode() && num.intValue() == 0)) {
                            if (MiCamera2.this.mFocusLockRequestHashCode == captureResult.getRequest().hashCode() || MiCamera2.this.mFocusLockRequestHashCode == 0) {
                                if (MiCamera2.this.mHelperHandler != null) {
                                    MiCamera2.this.mHelperHandler.removeMessages(1);
                                }
                                if (MiCamera2.this.needOptimizedFlash()) {
                                    MiCamera2.this.runCaptureSequence();
                                    return;
                                } else {
                                    MiCamera2.this.runPreCaptureSequence();
                                    return;
                                }
                            } else {
                                return;
                            }
                        } else if (MiCamera2.this.mFocusLockRequestHashCode == captureResult.getRequest().hashCode()) {
                            MiCamera2.this.mFocusLockRequestHashCode = 0;
                            return;
                        } else {
                            return;
                        }
                    } else {
                        return;
                    }
                case 4:
                    Integer num2 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    Integer num3 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    Integer num4 = (Integer) captureResult.get(CaptureResult.CONTROL_AWB_STATE);
                    String access$000 = MiCamera2.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("STATE_WAITING_AE_LOCK:  AF = ");
                    sb.append(Util.controlAFStateToString(num2));
                    Log.d(access$000, sb.toString());
                    String access$0002 = MiCamera2.TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("STATE_WAITING_AE_LOCK:  AE = ");
                    sb2.append(Util.controlAEStateToString(num3));
                    Log.d(access$0002, sb2.toString());
                    String access$0003 = MiCamera2.TAG;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("STATE_WAITING_AE_LOCK: AWB = ");
                    sb3.append(Util.controlAWBStateToString(num4));
                    Log.d(access$0003, sb3.toString());
                    if (num3 == null || num3.intValue() == 3) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_AE_LOCK: runCaptureSequence()");
                        MiCamera2.this.runCaptureSequence();
                        return;
                    }
                    Log.d(MiCamera2.TAG, "STATE_WAITING_AE_LOCK: keep stay in STATE_WAITING_AE_LOCK");
                    return;
                case 5:
                    Integer num5 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    Integer num6 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    Integer num7 = (Integer) captureResult.get(CaptureResult.CONTROL_AWB_STATE);
                    String access$0004 = MiCamera2.TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("STATE_WAITING_AE_CONVERGED:  AF = ");
                    sb4.append(Util.controlAFStateToString(num5));
                    Log.d(access$0004, sb4.toString());
                    String access$0005 = MiCamera2.TAG;
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("STATE_WAITING_AE_CONVERGED:  AE = ");
                    sb5.append(Util.controlAEStateToString(num6));
                    Log.d(access$0005, sb5.toString());
                    String access$0006 = MiCamera2.TAG;
                    StringBuilder sb6 = new StringBuilder();
                    sb6.append("STATE_WAITING_AE_CONVERGED: AWB = ");
                    sb6.append(Util.controlAWBStateToString(num7));
                    Log.d(access$0006, sb6.toString());
                    if (num6 == null || num6.intValue() == 2) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_AE_CONVERGED: lockFocus()");
                        MiCamera2.this.lockFocus();
                        return;
                    }
                    Log.d(MiCamera2.TAG, "STATE_WAITING_AE_CONVERGED: keep stay in STATE_WAITING_AE_CONVERGED");
                    return;
                case 6:
                    Integer num8 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    Integer num9 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    Integer num10 = (Integer) captureResult.get(CaptureResult.CONTROL_AWB_STATE);
                    String access$0007 = MiCamera2.TAG;
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("STATE_WAITING_PRECAPTURE:  AF = ");
                    sb7.append(Util.controlAFStateToString(num8));
                    Log.d(access$0007, sb7.toString());
                    String access$0008 = MiCamera2.TAG;
                    StringBuilder sb8 = new StringBuilder();
                    sb8.append("STATE_WAITING_PRECAPTURE:  AE = ");
                    sb8.append(Util.controlAEStateToString(num9));
                    Log.d(access$0008, sb8.toString());
                    String access$0009 = MiCamera2.TAG;
                    StringBuilder sb9 = new StringBuilder();
                    sb9.append("STATE_WAITING_PRECAPTURE: AWB = ");
                    sb9.append(Util.controlAWBStateToString(num10));
                    Log.d(access$0009, sb9.toString());
                    if (num9 == null || num9.intValue() == 5 || num9.intValue() == 4) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_PRECAPTURE: switch to STATE_WAITING_NON_PRECAPTURE(1)");
                        setState(7);
                        return;
                    } else if (MiCamera2.this.mPreCaptureRequestHashCode == captureResult.getRequest().hashCode()) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_PRECAPTURE: switch to STATE_WAITING_NON_PRECAPTURE(2)");
                        setState(7);
                        return;
                    } else {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_PRECAPTURE: keep stay in STATE_WAITING_PRECAPTURE");
                        return;
                    }
                case 7:
                    Integer num11 = (Integer) captureResult.get(CaptureResult.CONTROL_AF_STATE);
                    Integer num12 = (Integer) captureResult.get(CaptureResult.CONTROL_AE_STATE);
                    Integer num13 = (Integer) captureResult.get(CaptureResult.CONTROL_AWB_STATE);
                    String access$00010 = MiCamera2.TAG;
                    StringBuilder sb10 = new StringBuilder();
                    sb10.append("STATE_WAITING_NON_PRECAPTURE:  AF = ");
                    sb10.append(Util.controlAFStateToString(num11));
                    Log.d(access$00010, sb10.toString());
                    String access$00011 = MiCamera2.TAG;
                    StringBuilder sb11 = new StringBuilder();
                    sb11.append("STATE_WAITING_NON_PRECAPTURE:  AE = ");
                    sb11.append(Util.controlAEStateToString(num12));
                    Log.d(access$00011, sb11.toString());
                    String access$00012 = MiCamera2.TAG;
                    StringBuilder sb12 = new StringBuilder();
                    sb12.append("STATE_WAITING_NON_PRECAPTURE: AWB = ");
                    sb12.append(Util.controlAWBStateToString(num13));
                    Log.d(access$00012, sb12.toString());
                    if (num12 != null && num12.intValue() == 5) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_NON_PRECAPTURE: keep stay in STATE_WAITING_NON_PRECAPTURE");
                        return;
                    } else if (!MiCamera2.this.mCapabilities.isAutoFocusSupported() || MiCamera2.this.mConfigs.getFocusMode() == 0) {
                        Log.d(MiCamera2.TAG, "STATE_WAITING_NON_PRECAPTURE: lockExposure()");
                        MiCamera2.this.lockExposure(false);
                        return;
                    } else if (MiCamera2.this.needOptimizedFlash()) {
                        setState(5);
                        return;
                    } else {
                        MiCamera2.this.lockExposure(false);
                        return;
                    }
                default:
                    return;
            }
        }

        private void processVideoRecordStatus(CaptureResult captureResult) {
            synchronized (MiCamera2.this.mVideoRecordStateLock) {
                if (MiCamera2.this.mVideoRecordStateCallback != null) {
                    Integer num = (Integer) VendorTagHelper.getValue(captureResult, CaptureResultVendorTags.VIDEO_RECORD_STATE);
                    if (num != null && 2 == num.intValue()) {
                        MiCamera2.this.mVideoRecordStateCallback.onVideoRecordStopped();
                        MiCamera2.this.mVideoRecordStateCallback = null;
                    }
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public Integer getCurrentAEState() {
            if (getPreviewCaptureResult() == null) {
                return null;
            }
            return (Integer) getPreviewCaptureResult().get(CaptureResult.CONTROL_AE_STATE);
        }

        /* access modifiers changed from: 0000 */
        public int getCurrentColorTemperature() {
            CaptureResult previewCaptureResult = getPreviewCaptureResult();
            int i = 0;
            if (previewCaptureResult == null) {
                return 0;
            }
            AWBFrameControl aWBFrameControl = CaptureResultParser.getAWBFrameControl(previewCaptureResult);
            if (aWBFrameControl != null) {
                i = aWBFrameControl.getColorTemperature();
            }
            return i;
        }

        /* access modifiers changed from: 0000 */
        public CaptureResult getPreviewCaptureResult() {
            CaptureResult captureResult;
            synchronized (this.mPreviewCaptureResultLock) {
                if (this.mPreviewCaptureResult == null) {
                    String access$000 = MiCamera2.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("returned a null PreviewCaptureResult, mState is ");
                    sb.append(this.mState);
                    Log.w(access$000, sb.toString());
                }
                captureResult = this.mPreviewCaptureResult;
            }
            return captureResult;
        }

        public int getState() {
            int i;
            synchronized (this.mStateLock) {
                i = this.mState;
            }
            return i;
        }

        /* access modifiers changed from: 0000 */
        public void onCapabilityChanged(CameraCapabilities cameraCapabilities) {
            this.mFocusAreaSupported = cameraCapabilities.isAFRegionSupported();
            this.mAELockOnlySupported = DataRepository.dataItemFeature().gV() && !this.mFocusAreaSupported && cameraCapabilities.isAERegionSupported() && cameraCapabilities.isAELockSupported();
        }

        public void onCaptureCompleted(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull TotalCaptureResult totalCaptureResult) {
            if (totalCaptureResult.getFrameNumber() == 0) {
                String access$000 = MiCamera2.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCaptureCompleted Sequence: ");
                sb.append(totalCaptureResult.getSequenceId());
                sb.append(" first frame received");
                Log.d(access$000, sb.toString());
                MiCamera2.this.triggerDeviceChecking(false);
            }
            if (getState() == 0) {
                setState(1);
            }
            if (!this.mPartialResultSupported) {
                processPartial(totalCaptureResult);
            }
            process(totalCaptureResult);
            MiCamera2.this.updateFrameNumber(totalCaptureResult.getFrameNumber());
        }

        public void onCaptureProgressed(@NonNull CameraCaptureSession cameraCaptureSession, @NonNull CaptureRequest captureRequest, @NonNull CaptureResult captureResult) {
            processPartial(captureResult);
        }

        /* access modifiers changed from: 0000 */
        public void setFocusTask(FocusTask focusTask) {
            this.mManuallyFocusTask = focusTask;
        }

        /* access modifiers changed from: 0000 */
        public void setState(int i) {
            synchronized (this.mStateLock) {
                String access$000 = MiCamera2.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("setState: ");
                sb.append(i);
                Log.d(access$000, sb.toString());
                this.mState = i;
            }
        }

        /* access modifiers changed from: 0000 */
        public void showAutoFocusFinish(boolean z) {
            if (this.mTorchFocusTask != null) {
                FocusCallback focusCallback = MiCamera2.this.getFocusCallback();
                if (focusCallback != null) {
                    this.mTorchFocusTask.setResult(z);
                    focusCallback.onFocusStateChanged(this.mTorchFocusTask);
                    this.mTorchFocusTask = null;
                }
            }
        }

        /* access modifiers changed from: 0000 */
        public void showAutoFocusStart() {
            FocusCallback focusCallback = MiCamera2.this.getFocusCallback();
            if (focusCallback != null) {
                this.mTorchFocusTask = FocusTask.create(3);
                focusCallback.onFocusStateChanged(this.mTorchFocusTask);
            }
        }
    }

    static {
        MeteringRectangle meteringRectangle = new MeteringRectangle(0, 0, 0, 0, 0);
        ZERO_WEIGHT_3A_REGION = new MeteringRectangle[]{meteringRectangle};
    }

    public MiCamera2(CameraDevice cameraDevice, int i, CameraCapabilities cameraCapabilities, @NonNull Handler handler, @NonNull Handler handler2, @NonNull Handler handler3) {
        super(i);
        this.mCameraDevice = cameraDevice;
        this.mCapabilities = cameraCapabilities;
        this.mIsCameraClosed = false;
        this.mConfigs = new CameraConfigs();
        this.mCameraHandler = handler;
        this.mCameraPreviewHandler = handler2;
        this.mCameraMainThreadHandler = handler3;
        this.mHelperHandler = initHelperHandler(this.mCameraHandler.getLooper());
        this.mCaptureCallback = new PictureCaptureCallback();
    }

    private void abortCaptures() {
        if (DataRepository.dataItemFeature().he()) {
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession != null) {
                    try {
                        Log.d(TAG, "abortCaptures E");
                        this.mCaptureSession.abortCaptures();
                        Log.d(TAG, "abortCaptures X");
                    } catch (CameraAccessException e) {
                        Log.e(TAG, "abortCaptures(): failed", e);
                    } catch (IllegalStateException e2) {
                        Log.e(TAG, "abortCaptures, IllegalState", e2);
                    }
                }
            }
        }
    }

    private void applyCommonSettings(Builder builder, int i) {
        builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
        CaptureRequestBuilder.applyFocusMode(builder, this.mConfigs);
        CaptureRequestBuilder.applyFaceDetection(builder, this.mConfigs);
        CaptureRequestBuilder.applyAntiBanding(builder, this.mConfigs);
        CaptureRequestBuilder.applyExposureCompensation(builder, i, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyZoomRatio(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyBeautyValues(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyAELock(builder, this.mConfigs.isAELocked());
        CaptureRequestBuilder.applyAWBLock(builder, this.mConfigs.isAWBLocked());
        CaptureRequestBuilder.applyEyeLight(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyWaterMark(builder, i, this.mCapabilities, this.mConfigs);
        if (this.mPreviewControl.needForCapture()) {
            CaptureRequestBuilder.applyContrast(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applySaturation(builder, this.mConfigs);
            CaptureRequestBuilder.applySharpness(builder, this.mConfigs);
            CaptureRequestBuilder.applyExposureMeteringMode(builder, this.mConfigs);
            CaptureRequestBuilder.applySceneMode(builder, this.mConfigs);
            CaptureRequestBuilder.applySuperNightScene(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyHHT(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyHDR(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applySuperResolution(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyHwMfnr(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applySwMfnr(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyMiBokeh(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyRearBokeh(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFaceAgeAnalyze(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFaceScore(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFrontMirror(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyCameraAi30Enable(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyMacroMode(builder, i, this.mCapabilities, this.mConfigs);
        }
        if (this.mPreviewControl.needForPortrait()) {
            CaptureRequestBuilder.applyContrast(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applySaturation(builder, this.mConfigs);
            CaptureRequestBuilder.applySharpness(builder, this.mConfigs);
            if (this.mPreviewControl.needForFrontCamera()) {
                CaptureRequestBuilder.applyMiBokeh(builder, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applyFrontMirror(builder, i, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applyFaceAgeAnalyze(builder, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applyFaceScore(builder, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applyHwMfnr(builder, i, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applySwMfnr(builder, i, this.mCapabilities, this.mConfigs);
            } else {
                CaptureRequestBuilder.applyRearBokeh(builder, this.mCapabilities, this.mConfigs);
            }
            if (this.mCapabilities.isMFNRBokehSupported()) {
                CaptureRequestBuilder.applyHwMfnr(builder, i, this.mCapabilities, this.mConfigs);
            }
            CaptureRequestBuilder.applyPortraitLighting(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFNumber(builder, this.mCapabilities, this.mConfigs);
        }
        if (this.mPreviewControl.needForManually()) {
            CaptureRequestBuilder.applyAWBMode(builder, this.mConfigs.getAWBMode());
            CaptureRequestBuilder.applyCustomAWB(builder, this.mConfigs.getAwbCustomValue());
            CaptureRequestBuilder.applyIso(builder, i, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyExposureTime(builder, i, this.mConfigs);
        }
        CaptureRequestBuilder.applyFocusDistance(builder, this.mConfigs);
        CaptureRequestBuilder.applyNormalWideLDC(builder, i, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyUltraWideLDC(builder, this.mCapabilities, this.mConfigs);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0045, code lost:
        r0 = 2;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:18:0x0062, code lost:
        if (r11.mPreviewControl.needForCapture() != false) goto L_0x0042;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:0x0065, code lost:
        if (r0 == 3) goto L_0x0058;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:9:0x003f, code lost:
        if (r11.mPreviewControl.needForCapture() != false) goto L_0x0042;
     */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x008f  */
    /* JADX WARNING: Removed duplicated region for block: B:37:0x011b  */
    private void applyFlashMode(Builder builder, int i) {
        boolean z;
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("applyFlashMode: request = ");
        sb.append(builder);
        sb.append(", applyType = ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (builder != null) {
            int flashMode = this.mConfigs.getFlashMode();
            if (i != 3) {
                if (i == 6 && needOptimizedFlash()) {
                }
                z = false;
                ScreenLightCallback screenLightCallback = getScreenLightCallback();
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("applyFlashMode: flashMode = ");
                sb2.append(flashMode);
                sb2.append(", mScreenLightCallback = ");
                sb2.append(screenLightCallback);
                Log.d(str2, sb2.toString());
                if (flashMode != 101) {
                    if (flashMode != 103) {
                        switch (flashMode) {
                            case 0:
                                builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
                                break;
                            case 1:
                                builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(3));
                                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(1));
                                break;
                            case 2:
                                if (this.mCapabilities.isSupportSnapShotTorch()) {
                                    MiCameraCompat.applySnapshotTorch(builder, z);
                                }
                                builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
                                break;
                            case 3:
                                builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(2));
                                builder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(1));
                                break;
                            case 4:
                                builder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(4));
                                break;
                        }
                    } else {
                        String str3 = TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("applyFlashMode: FLASH_MODE_SCREEN_LIGHT_AUTO applyType = ");
                        sb3.append(i);
                        Log.d(str3, sb3.toString());
                        if (screenLightCallback != null) {
                            screenLightCallback.stopScreenLight();
                        }
                    }
                } else if (screenLightCallback != null) {
                    if (i == 6) {
                        this.mScreenLightColorTemperature = this.mCaptureCallback.getCurrentColorTemperature();
                    }
                    int screenLightColor = Util.getScreenLightColor(SystemProperties.getInt("camera_screen_light_wb", this.mScreenLightColorTemperature));
                    int screenLightBrightness = CameraSettings.getScreenLightBrightness();
                    int i2 = SystemProperties.getInt("camera_screen_light_delay", 0);
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("applyFlashMode: FLASH_MODE_SCREEN_LIGHT_ON color = ");
                    sb4.append(screenLightColor);
                    sb4.append(", brightness = ");
                    sb4.append(screenLightBrightness);
                    sb4.append(", delay = ");
                    sb4.append(i2);
                    sb4.append(", mCameraHandler = ");
                    sb4.append(this.mCameraHandler);
                    Log.d(str4, sb4.toString());
                    if (i == 6 || i == 3) {
                        screenLightCallback.startScreenLight(screenLightColor, screenLightBrightness);
                    } else if (i2 == 0) {
                        screenLightCallback.stopScreenLight();
                    } else {
                        this.mCameraHandler.postDelayed(new Runnable() {
                            public final void run() {
                                ScreenLightCallback.this.stopScreenLight();
                            }
                        }, (long) i2);
                    }
                }
            }
            if (needOptimizedFlash()) {
                if (getExposureTime() <= 0) {
                }
            }
            flashMode = 0;
            z = false;
            ScreenLightCallback screenLightCallback2 = getScreenLightCallback();
            String str22 = TAG;
            StringBuilder sb22 = new StringBuilder();
            sb22.append("applyFlashMode: flashMode = ");
            sb22.append(flashMode);
            sb22.append(", mScreenLightCallback = ");
            sb22.append(screenLightCallback2);
            Log.d(str22, sb22.toString());
            if (flashMode != 101) {
            }
            flashMode = 2;
            z = true;
            ScreenLightCallback screenLightCallback22 = getScreenLightCallback();
            String str222 = TAG;
            StringBuilder sb222 = new StringBuilder();
            sb222.append("applyFlashMode: flashMode = ");
            sb222.append(flashMode);
            sb222.append(", mScreenLightCallback = ");
            sb222.append(screenLightCallback22);
            Log.d(str222, sb222.toString());
            if (flashMode != 101) {
            }
        }
    }

    private void applySettingsForFocusCapture(Builder builder) {
        CaptureRequestBuilder.applyAFRegions(builder, this.mConfigs);
        CaptureRequestBuilder.applyAERegions(builder, this.mConfigs);
        CaptureRequestBuilder.applyZoomRatio(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyAWBMode(builder, this.mConfigs.getAWBMode());
        CaptureRequestBuilder.applyCustomAWB(builder, this.mConfigs.getAwbCustomValue());
        CaptureRequestBuilder.applyExposureCompensation(builder, 1, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyAntiShake(builder, this.mCapabilities, this.mConfigs);
        if (this.mPreviewControl.needForCapture()) {
            CaptureRequestBuilder.applyContrast(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applySaturation(builder, this.mConfigs);
            CaptureRequestBuilder.applySharpness(builder, this.mConfigs);
        }
        if (this.mPreviewControl.needForManually()) {
            CaptureRequestBuilder.applyIso(builder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyExposureTime(builder, 1, this.mConfigs);
        }
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        applyFlashMode(builder, 1);
        CaptureRequestBuilder.applyFpsRange(builder, this.mConfigs);
    }

    private void applySettingsForJpeg(Builder builder) {
        if (builder != null) {
            Location gpsLocation = this.mConfigs.getGpsLocation();
            if (gpsLocation != null) {
                builder.set(CaptureRequest.JPEG_GPS_LOCATION, new Location(gpsLocation));
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("jpegRotation=");
            sb.append(this.mConfigs.getJpegRotation());
            Log.d(str, sb.toString());
            builder.set(CaptureRequest.JPEG_ORIENTATION, Integer.valueOf(this.mConfigs.getJpegRotation()));
            CameraSize thumbnailSize = this.mConfigs.getThumbnailSize();
            if (thumbnailSize != null) {
                builder.set(CaptureRequest.JPEG_THUMBNAIL_SIZE, new Size(thumbnailSize.getWidth(), thumbnailSize.getHeight()));
            }
            byte jpegQuality = (byte) this.mConfigs.getJpegQuality();
            builder.set(CaptureRequest.JPEG_THUMBNAIL_QUALITY, Byte.valueOf(jpegQuality));
            builder.set(CaptureRequest.JPEG_QUALITY, Byte.valueOf(jpegQuality));
        }
    }

    private void applySettingsForLockFocus(Builder builder) {
        builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
        CaptureRequestBuilder.applyAFRegions(builder, this.mConfigs);
        CaptureRequestBuilder.applyAERegions(builder, this.mConfigs);
        applyCommonSettings(builder, 1);
        builder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
        if (needOptimizedFlash() || needScreenLight()) {
            applyFlashMode(builder, 6);
        }
    }

    private void applySettingsForPreCapture(Builder builder) {
        applyCommonSettings(builder, 1);
        applyFlashMode(builder, 6);
        builder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(1));
    }

    private void applySettingsForPreview(Builder builder) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("applySettingsForPreview: ");
        sb.append(builder);
        Log.d(str, sb.toString());
        if (builder != null) {
            applyFlashMode(builder, 1);
            applyCommonSettings(builder, 1);
            CaptureRequestBuilder.applyLensDirtyDetect(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyAELock(builder, this.mConfigs.isAELocked());
            CaptureRequestBuilder.applyAWBLock(builder, this.mConfigs.isAWBLocked());
            CaptureRequestBuilder.applyAntiShake(builder, this.mCapabilities, this.mConfigs);
            builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        }
    }

    /* access modifiers changed from: private */
    public void applySettingsForVideo(Builder builder) {
        if (builder != null) {
            builder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            applyFlashMode(builder, 1);
            CaptureRequestBuilder.applyLensDirtyDetect(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFocusMode(builder, this.mConfigs);
            CaptureRequestBuilder.applyFaceDetection(builder, this.mConfigs);
            CaptureRequestBuilder.applyAntiBanding(builder, this.mConfigs);
            CaptureRequestBuilder.applyExposureMeteringMode(builder, this.mConfigs);
            CaptureRequestBuilder.applyExposureCompensation(builder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyZoomRatio(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyAntiShake(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyAELock(builder, this.mConfigs.isAELocked());
            CaptureRequestBuilder.applyBeautyValues(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyVideoFpsRange(builder, this.mConfigs);
            CaptureRequestBuilder.applyFrontMirror(builder, 3, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyDeviceOrientation(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyUltraWideLDC(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyMacroMode(builder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyHFRDeflicker(builder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    private int capture(CaptureRequest captureRequest, CameraCaptureSession.CaptureCallback captureCallback, Handler handler) throws CameraAccessException {
        synchronized (this.mSessionLock) {
            if (this.mCaptureSession == null) {
                Log.w(TAG, "capture: null session");
                return 0;
            } else if (this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession) {
                int captureBurst = this.mCaptureSession.captureBurst(createHighSpeedRequestList(captureRequest), captureCallback, handler);
                return captureBurst;
            } else {
                int capture = this.mCaptureSession.capture(captureRequest, captureCallback, handler);
                return capture;
            }
        }
    }

    /* access modifiers changed from: private */
    public void captureStillPicture() {
        if (checkCaptureSession(CameraStat.CATEGORY_CAMERA)) {
            MiCamera2Shot miCamera2Shot = null;
            switch (this.mConfigs.getShotType()) {
                case -3:
                case -2:
                case 0:
                case 2:
                    miCamera2Shot = new MiCamera2ShotStill(this);
                    miCamera2Shot.setQuickShotAnimation(this.mConfigs.isQuickShotAnimation());
                    break;
                case -1:
                    miCamera2Shot = new MiCamera2ShotPreview(this, this.mCaptureCallback.getPreviewCaptureResult());
                    break;
                case 5:
                case 6:
                case 7:
                    miCamera2Shot = new MiCamera2ShotParallelStill(this, this.mCaptureCallback.getPreviewCaptureResult());
                    miCamera2Shot.setQuickShotAnimation(this.mConfigs.isQuickShotAnimation());
                    break;
                case 8:
                    miCamera2Shot = new MiCamera2ShotParallelBurst(this, this.mCaptureCallback.getPreviewCaptureResult());
                    break;
                case 10:
                    miCamera2Shot = new MiCamera2ShotRawBurst(this);
                    miCamera2Shot.setQuickShotAnimation(this.mConfigs.isQuickShotAnimation());
                    break;
            }
            if (this.mConfigs.isNeedSequence()) {
                if (this.mMiCamera2ShotQueue.offerLast(miCamera2Shot)) {
                    this.mCaptureTime = System.currentTimeMillis();
                    String str = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("capture: mMiCamera2ShotQueue.offer, size:");
                    sb.append(this.mMiCamera2ShotQueue.size());
                    Log.d(str, sb.toString());
                } else {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("capture: mMiCamera2ShotQueue.offer failure, size:");
                    sb2.append(this.mMiCamera2ShotQueue.size());
                    Log.e(str2, sb2.toString());
                }
            }
            this.mMiCamera2Shot = miCamera2Shot;
            if (this.mMiCamera2Shot != null) {
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("startShot holder: ");
                sb3.append(this.mMiCamera2Shot.hashCode());
                Log.d(str3, sb3.toString());
                this.mMiCamera2Shot.startShot();
                triggerDeviceChecking(true);
            }
        }
    }

    private boolean checkCameraDevice(String str) {
        if (this.mCameraDevice != null) {
            return true;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("camera ");
        sb.append(getId());
        sb.append(" is closed when ");
        sb.append(str);
        String sb2 = sb.toString();
        RuntimeException runtimeException = new RuntimeException(sb2);
        if (!Build.IS_DEBUGGABLE || this.mIsCameraClosed) {
            Log.e(TAG, sb2, runtimeException);
            return false;
        }
        throw runtimeException;
    }

    private boolean checkCaptureSession(String str) {
        synchronized (this.mSessionLock) {
            if (this.mCaptureSession != null) {
                return true;
            }
            StringBuilder sb = new StringBuilder();
            sb.append("session for camera ");
            sb.append(getId());
            sb.append(" is closed when ");
            sb.append(str);
            sb.append(", mIsCaptureSessionClosed = ");
            sb.append(this.mIsCaptureSessionClosed);
            String sb2 = sb.toString();
            RuntimeException runtimeException = new RuntimeException(sb2);
            if (Build.IS_DEBUGGABLE) {
                if (!this.mIsCaptureSessionClosed) {
                    throw runtimeException;
                }
            }
            Log.e(TAG, sb2, runtimeException);
            return false;
        }
    }

    private List<CaptureRequest> createHighSpeedRequestList(CaptureRequest captureRequest) {
        if (captureRequest != null) {
            Collection targets = captureRequest.getTargets();
            Range range = (Range) captureRequest.get(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE);
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("createHighSpeedRequestList() fpsRange = ");
            sb.append(range);
            Log.d(str, sb.toString());
            int intValue = ((Integer) range.getUpper()).intValue() / 30;
            ArrayList arrayList = new ArrayList();
            Builder constructCaptureRequestBuilder = CompatibilityUtils.constructCaptureRequestBuilder(new CameraMetadataNative(captureRequest.getNativeCopy()), false, -1, captureRequest);
            Iterator it = targets.iterator();
            Surface surface = (Surface) it.next();
            if (targets.size() != 1 || SurfaceUtils.isSurfaceForHwVideoEncoder(surface)) {
                constructCaptureRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
            } else {
                constructCaptureRequestBuilder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(1));
            }
            constructCaptureRequestBuilder.setPartOfCHSRequestList(true);
            Builder builder = null;
            if (targets.size() == 2) {
                builder = CompatibilityUtils.constructCaptureRequestBuilder(new CameraMetadataNative(captureRequest.getNativeCopy()), false, -1, captureRequest);
                builder.set(CaptureRequest.CONTROL_CAPTURE_INTENT, Integer.valueOf(3));
                builder.addTarget(surface);
                Surface surface2 = (Surface) it.next();
                builder.addTarget(surface2);
                builder.setPartOfCHSRequestList(true);
                if (SurfaceUtils.isSurfaceForHwVideoEncoder(surface)) {
                    surface2 = surface;
                }
                constructCaptureRequestBuilder.addTarget(surface2);
            } else {
                constructCaptureRequestBuilder.addTarget(surface);
            }
            for (int i = 0; i < intValue; i++) {
                if (i != 0 || builder == null) {
                    arrayList.add(constructCaptureRequestBuilder.build());
                } else {
                    arrayList.add(builder.build());
                }
            }
            return Collections.unmodifiableList(arrayList);
        }
        throw new IllegalArgumentException("Input capture request must not be null");
    }

    private int genSessionId() {
        int i = this.mSessionId + 1;
        this.mSessionId = i;
        if (i == Integer.MAX_VALUE) {
            this.mSessionId = 0;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("generateSessionId: id=");
        sb.append(this.mSessionId);
        Log.v(str, sb.toString());
        return this.mSessionId;
    }

    private long getCaptureInterval() {
        long hc = DataRepository.dataItemFeature().hc() - (System.currentTimeMillis() - this.mCaptureTime);
        if (this.mConfigs.isHDREnabled() || this.mConfigs.isHDRCheckerEnabled()) {
            hc += 800;
        }
        if (CameraSettings.isUltraPixelFront32MPOn()) {
            hc += 600;
        }
        if (this.mConfigs.isMiBokehEnabled()) {
            hc += 800;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("getCaptureInterval: return ");
        sb.append(hc);
        Log.d(str, sb.toString());
        if (hc > 0) {
            return hc;
        }
        return 0;
    }

    private long getExposureTime() {
        return this.mConfigs.getExposureTime();
    }

    private Builder initFocusRequestBuilder(int i) throws CameraAccessException {
        Builder builder;
        if (i == 160) {
            throw new IllegalArgumentException("Module index is error!");
        } else if (i == 166) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("initFocusRequestBuilder: error caller for ");
            sb.append(i);
            Log.e(str, sb.toString());
            return null;
        } else {
            if (!(i == 162 || i == 172)) {
                switch (i) {
                    case 168:
                    case 169:
                    case 170:
                        break;
                    default:
                        builder = this.mCameraDevice.createCaptureRequest(1);
                        break;
                }
            }
            builder = this.mCameraDevice.createCaptureRequest(3);
            builder.addTarget(this.mPreviewSurface);
            if (this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession) {
                builder.addTarget(this.mRecordSurface);
                builder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
            }
            return builder;
        }
    }

    private Handler initHelperHandler(Looper looper) {
        return new Handler(looper) {
            public void handleMessage(Message message) {
                switch (message.what) {
                    case 1:
                        Log.e(MiCamera2.TAG, "waiting af lock timeOut");
                        MiCamera2.this.runCaptureSequence();
                        return;
                    case 2:
                        boolean updateDeferPreviewSession = MiCamera2.this.updateDeferPreviewSession(MiCamera2.this.mPreviewSurface);
                        String access$000 = MiCamera2.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("handleMessage: MSG_WAITING_LOCAL_PARALLER_SERVICE_READY updateDeferPreviewSession result = ");
                        sb.append(updateDeferPreviewSession);
                        Log.d(access$000, sb.toString());
                        return;
                    case 3:
                        if (message.arg1 == 1 && MiCamera2.this.mPreviewControl.needForManually() && MiCamera2.this.mConfigs.getExposureTime() / 1000000 >= 5000) {
                            removeMessages(3);
                            sendEmptyMessageDelayed(3, 5000 + (MiCamera2.this.mConfigs.getExposureTime() / 1000000));
                            return;
                        } else if (message.arg1 != 0) {
                            return;
                        } else {
                            if (MiCamera2.this.isDeviceAlive()) {
                                sendEmptyMessageDelayed(3, 5000);
                                return;
                            } else {
                                MiCamera2.this.notifyOnError(238);
                                return;
                            }
                        }
                    default:
                        return;
                }
            }
        };
    }

    /* access modifiers changed from: private */
    public boolean isDeviceAlive() {
        if (0 > this.mCurrentFrameNum || this.mCurrentFrameNum != this.mLastFrameNum) {
            this.mLastFrameNum = this.mCurrentFrameNum;
            return true;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("camera device maybe dead, current framenum is ");
        sb.append(this.mLastFrameNum);
        Log.e(str, sb.toString());
        return false;
    }

    private boolean isLocalParallelServiceReady() {
        return !this.mEnableParallelSession || AlgoConnector.getInstance().getLocalBinder() != null;
    }

    public static /* synthetic */ void lambda$preparePreviewImageReader$0(MiCamera2 miCamera2, ImageReader imageReader) {
        Image acquireNextImage = imageReader.acquireNextImage();
        if (acquireNextImage != null) {
            PreviewCallback previewCallback = miCamera2.getPreviewCallback();
            if (previewCallback != null) {
                previewCallback.onPreviewFrame(acquireNextImage, miCamera2, miCamera2.mConfigs.getDeviceOrientation());
            }
            acquireNextImage.close();
        }
    }

    public static /* synthetic */ void lambda$setCaptureEnable$1(MiCamera2 miCamera2, boolean z) {
        boolean z2 = false;
        boolean z3 = miCamera2.mMiCamera2ShotQueue.size() < DataRepository.dataItemFeature().hd();
        CaptureCallback captureCallback = miCamera2.mFrontQuickCaptureCallback;
        if (z && z3) {
            z2 = true;
        }
        captureCallback.onCaptureCompleted(z2);
        miCamera2.mIsCaptureCompleted = true;
    }

    /* access modifiers changed from: private */
    public void lockFocus() {
        if (checkCaptureSession("lockFocus")) {
            Log.v(TAG, "lockFocus");
            try {
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(1);
                createCaptureRequest.addTarget(this.mPreviewSurface);
                applySettingsForLockFocus(createCaptureRequest);
                CaptureRequest build = createCaptureRequest.build();
                this.mFocusLockRequestHashCode = build.hashCode();
                this.mCaptureCallback.setState(3);
                this.mCaptureCallback.showAutoFocusStart();
                capture(build, this.mCaptureCallback, this.mCameraHandler);
                setAFModeToPreview(1);
                if (this.mHelperHandler != null) {
                    this.mHelperHandler.removeMessages(1);
                    this.mHelperHandler.sendEmptyMessageDelayed(1, 3000);
                }
            } catch (CameraAccessException | IllegalStateException e) {
                e.printStackTrace();
                notifyOnError(-1);
            }
        }
    }

    /* access modifiers changed from: private */
    public boolean needOptimizedFlash() {
        boolean z = false;
        if (useLegacyFlashStrategy()) {
            return false;
        }
        if (this.mConfigs.isNeedFlash() && (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 3 || getExposureTime() > 0)) {
            z = true;
        }
        return z;
    }

    private boolean needScreenLight() {
        return this.mConfigs.isNeedFlash() && this.mConfigs.getFlashMode() == 101;
    }

    /* access modifiers changed from: private */
    public void notifyCaptureBusyCallback(boolean z) {
        boolean z2;
        synchronized (this.mShotQueueLock) {
            if (this.mMiCamera2ShotQueue != null) {
                if (!this.mMiCamera2ShotQueue.isEmpty()) {
                    z2 = false;
                }
            }
            z2 = true;
        }
        if (this.mCaptureBusyCallback != null && z2) {
            this.mCaptureBusyCallback.onCaptureCompleted(z);
            this.mCaptureBusyCallback = null;
        }
    }

    private void prepareDepthImageReader(CameraSize cameraSize) {
        if (this.mDepthReader != null) {
            this.mDepthReader.close();
        }
        AnonymousClass6 r0 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null) {
                    if (MiCamera2.this.mMiCamera2Shot == null) {
                        Log.w(MiCamera2.TAG, "onImageAvailable: NO depth image processor!");
                        acquireNextImage.close();
                        return;
                    }
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 2);
                }
            }
        };
        this.mDepthReader = ImageReader.newInstance(cameraSize.getWidth() / 2, cameraSize.getHeight() / 2, 540422489, 2);
        this.mDepthReader.setOnImageAvailableListener(r0, this.mCameraHandler);
    }

    private void preparePhotoImageReader() {
        preparePhotoImageReader(this.mConfigs.getPhotoSize(), this.mConfigs.getPhotoFormat(), this.mConfigs.getPhotoMaxImages());
    }

    private void preparePhotoImageReader(@NonNull CameraSize cameraSize, int i, int i2) {
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        this.mPhotoImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), i, i2);
        this.mPhotoImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                MiCamera2Shot miCamera2Shot;
                Log.d(MiCamera2.TAG, "onImageAvailable: main");
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage == null) {
                    Log.w(MiCamera2.TAG, "onImageAvailable: null image");
                    return;
                }
                synchronized (MiCamera2.this.mShotQueueLock) {
                    if (!MiCamera2.this.mMiCamera2ShotQueue.isEmpty()) {
                        miCamera2Shot = (MiCamera2Shot) MiCamera2.this.mMiCamera2ShotQueue.peek();
                        if (miCamera2Shot instanceof MiCamera2ShotStill) {
                            if (acquireNextImage.getTimestamp() != ((MiCamera2ShotStill) miCamera2Shot).getTimeStamp()) {
                                miCamera2Shot = MiCamera2.this.replaceCorrectShot(acquireNextImage);
                            } else {
                                MiCamera2.this.mMiCamera2ShotQueue.removeFirst();
                            }
                        } else {
                            MiCamera2.this.mMiCamera2ShotQueue.removeFirst();
                        }
                        String access$000 = MiCamera2.TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("onImageAvailable: mMiCamera2ShotQueue.poll, size:");
                        sb.append(MiCamera2.this.mMiCamera2ShotQueue.size());
                        Log.d(access$000, sb.toString());
                        MiCamera2.this.notifyCaptureBusyCallback(true);
                    } else {
                        miCamera2Shot = MiCamera2.this.mMiCamera2Shot;
                    }
                }
                if (miCamera2Shot != null) {
                    miCamera2Shot.onImageReceived(acquireNextImage, 0);
                } else {
                    acquireNextImage.close();
                    Log.w(MiCamera2.TAG, "onImageAvailable: NO main image processor!");
                }
            }
        }, this.mCameraHandler);
    }

    private void preparePortraitRawImageReader(CameraSize cameraSize) {
        if (this.mPortraitRawImageReader != null) {
            this.mPortraitRawImageReader.close();
        }
        AnonymousClass7 r0 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null) {
                    if (MiCamera2.this.mMiCamera2Shot == null) {
                        Log.w(MiCamera2.TAG, "onImageAvailable: NO portrait image processor!");
                        acquireNextImage.close();
                        return;
                    }
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 1);
                }
            }
        };
        this.mPortraitRawImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mPortraitRawImageReader.setOnImageAvailableListener(r0, this.mCameraHandler);
    }

    private void preparePreviewImageReader() {
        preparePreviewImageReader(this.mConfigs.getAlgorithmPreviewSize(), this.mConfigs.getAlgorithmPreviewFormat(), this.mConfigs.getPreviewMaxImages());
    }

    private void preparePreviewImageReader(@NonNull CameraSize cameraSize, int i, int i2) {
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        this.mPreviewImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), i, i2);
        this.mPreviewImageReader.setOnImageAvailableListener(new OnImageAvailableListener() {
            public final void onImageAvailable(ImageReader imageReader) {
                MiCamera2.lambda$preparePreviewImageReader$0(MiCamera2.this, imageReader);
            }
        }, this.mCameraPreviewHandler);
    }

    private void prepareRawImageReader(@NonNull CameraSize cameraSize, boolean z) {
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        AnonymousClass3 r0 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null) {
                    if (MiCamera2.this.mMiCamera2Shot == null) {
                        Log.w(MiCamera2.TAG, "onImageAvailable: NO raw image processor!");
                        acquireNextImage.close();
                        return;
                    }
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 3);
                }
            }
        };
        this.mRawImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 32, z ? 10 : 2);
        this.mRawImageReader.setOnImageAvailableListener(r0, this.mCameraHandler);
    }

    /* access modifiers changed from: private */
    public void prepareRawImageWriter(@NonNull CameraSize cameraSize, @NonNull Surface surface) {
        if (this.mRawImageWriter != null) {
            this.mRawImageWriter.close();
        }
        AnonymousClass4 r2 = new OnImageReleasedListener() {
            public void onImageReleased(ImageWriter imageWriter) {
                Log.d(MiCamera2.TAG, "The enqueued imaged has be consumed");
            }
        };
        this.mRawImageWriter = ImageWriter.newInstance(surface, 2);
        this.mRawImageWriter.setOnImageReleasedListener(r2, this.mCameraHandler);
    }

    private List<Surface> prepareRemoteImageReader(@Nullable List<IImageReaderParameterSets> list) {
        if (list == null || list.size() == 0) {
            if (list == null) {
                list = new ArrayList<>();
            }
            IImageReaderParameterSets iImageReaderParameterSets = new IImageReaderParameterSets(this.mConfigs.getPhotoSize().getWidth(), this.mConfigs.getPhotoSize().getHeight(), 35, MAX_IMAGE_BUFFER_SIZE, 0);
            list.add(iImageReaderParameterSets);
            if (this.mConfigs.getShotType() == 6) {
                IImageReaderParameterSets iImageReaderParameterSets2 = new IImageReaderParameterSets(this.mConfigs.getSubPhotoSize().getWidth(), this.mConfigs.getSubPhotoSize().getHeight(), 35, MAX_IMAGE_BUFFER_SIZE, 1);
                list.add(iImageReaderParameterSets2);
            } else if (isQcfaEnable()) {
                int width = this.mConfigs.getPhotoSize().getWidth() / 2;
                int height = this.mConfigs.getPhotoSize().getHeight() / 2;
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[QCFA] prepareRemoteImageReader: ");
                sb.append(width);
                sb.append("x");
                sb.append(height);
                Log.d(str, sb.toString());
                IImageReaderParameterSets iImageReaderParameterSets3 = new IImageReaderParameterSets(width, height, 35, MAX_IMAGE_BUFFER_SIZE, 0);
                iImageReaderParameterSets3.setShouldHoldImages(false);
                list.add(iImageReaderParameterSets3);
            }
            LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder(true);
            if (localBinder == null) {
                Log.d(TAG, "prepareRemoteImageReader: ParallelService is not ready");
                ArrayList arrayList = new ArrayList();
                for (IImageReaderParameterSets iImageReaderParameterSets4 : list) {
                    ImageReader newInstance = ImageReader.newInstance(iImageReaderParameterSets4.width, iImageReaderParameterSets4.height, iImageReaderParameterSets4.format, iImageReaderParameterSets4.maxImages);
                    arrayList.add(newInstance.getSurface());
                    this.mRemoteImageReaderList.add(newInstance);
                }
                return arrayList;
            }
            try {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("prepareRemoteImageReader: to prepare remote surfaces with configurations:");
                sb2.append(list);
                Log.d(str2, sb2.toString());
                List<Surface> configCaptureOutputBuffer = localBinder.configCaptureOutputBuffer(list);
                if (configCaptureOutputBuffer != null) {
                    return configCaptureOutputBuffer;
                }
                throw new RemoteException("Config capture output buffer failed!");
            } catch (RemoteException e) {
                e.printStackTrace();
                return null;
            }
        } else {
            throw new IllegalArgumentException("The given \"params\" should be null or an empty list");
        }
    }

    private void prepareVideoSnapshotImageReader(CameraSize cameraSize) {
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        AnonymousClass5 r0 = new OnImageAvailableListener() {
            public void onImageAvailable(ImageReader imageReader) {
                Image acquireNextImage = imageReader.acquireNextImage();
                if (acquireNextImage != null) {
                    if (MiCamera2.this.mMiCamera2Shot == null) {
                        Log.w(MiCamera2.TAG, "onImageAvailable: NO video image processor!");
                        acquireNextImage.close();
                        return;
                    }
                    MiCamera2.this.mMiCamera2Shot.onImageReceived(acquireNextImage, 0);
                }
            }
        };
        this.mVideoSnapshotImageReader = ImageReader.newInstance(cameraSize.getWidth(), cameraSize.getHeight(), 256, 2);
        this.mVideoSnapshotImageReader.setOnImageAvailableListener(r0, this.mCameraHandler);
    }

    /* access modifiers changed from: private */
    public MiCamera2Shot replaceCorrectShot(Image image) {
        Iterator it = this.mMiCamera2ShotQueue.iterator();
        while (it.hasNext()) {
            MiCamera2Shot miCamera2Shot = (MiCamera2Shot) it.next();
            if ((miCamera2Shot instanceof MiCamera2ShotStill) && ((MiCamera2ShotStill) miCamera2Shot).getTimeStamp() == image.getTimestamp()) {
                it.remove();
                return miCamera2Shot;
            }
        }
        return (MiCamera2Shot) this.mMiCamera2ShotQueue.pollFirst();
    }

    private void reset() {
        Log.v(TAG, "E: reset");
        this.mIsCaptureSessionClosed = true;
        synchronized (this.mSessionLock) {
            this.mCaptureSession = null;
        }
        this.mCameraDevice = null;
        this.mPreviewSurface = null;
        this.mDeferPreviewSurface = null;
        this.mRecordSurface = null;
        this.mSessionId = 0;
        this.mPhotoImageReader = null;
        this.mRawImageReader = null;
        this.mPreviewImageReader = null;
        this.mVideoSnapshotImageReader = null;
        this.mDepthReader = null;
        this.mPortraitRawImageReader = null;
        releaseCameraPreviewCallback(null);
        resetShotQueue("reset");
        Log.v(TAG, "X: reset");
    }

    private void resetShotQueue(String str) {
        synchronized (this.mShotQueueLock) {
            if (!this.mMiCamera2ShotQueue.isEmpty()) {
                String str2 = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("resetShotQueue !!! ");
                sb.append(str);
                sb.append(" size:");
                sb.append(this.mMiCamera2ShotQueue.size());
                Log.d(str2, sb.toString());
                Iterator it = this.mMiCamera2ShotQueue.iterator();
                while (it.hasNext()) {
                    ((MiCamera2Shot) it.next()).makeClobber();
                }
                this.mMiCamera2ShotQueue.clear();
                notifyCaptureBusyCallback(false);
            }
        }
    }

    /* access modifiers changed from: private */
    public void runCaptureSequence() {
        this.mCaptureCallback.showAutoFocusFinish(true);
        if (getExposureTime() > 0) {
            waitFlashClosed();
            return;
        }
        this.mCaptureCallback.setState(8);
        captureStillPicture();
    }

    /* access modifiers changed from: private */
    public void runPreCaptureSequence() {
        Log.v(TAG, "runPreCaptureSequence");
        try {
            Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(1);
            createCaptureRequest.addTarget(this.mPreviewSurface);
            applySettingsForPreCapture(createCaptureRequest);
            CaptureRequest build = createCaptureRequest.build();
            this.mPreCaptureRequestHashCode = build.hashCode();
            this.mCaptureCallback.setState(6);
            capture(build, this.mCaptureCallback, this.mCameraHandler);
        } catch (CameraAccessException | IllegalStateException e) {
            e.printStackTrace();
            notifyOnError(-1);
        }
    }

    private void setAFModeToPreview(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAFModeToPreview: focusMode=");
        sb.append(i);
        Log.d(str, sb.toString());
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(i));
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
        CaptureRequestBuilder.applyAFRegions(this.mPreviewRequestBuilder, this.mConfigs);
        CaptureRequestBuilder.applyAERegions(this.mPreviewRequestBuilder, this.mConfigs);
        resumePreview();
    }

    private void setVideoRecordControl(int i) throws CameraAccessException {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setVideoRecordControl: ");
        sb.append(i);
        Log.d(str, sb.toString());
        Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
        if (1 == i) {
            createCaptureRequest.addTarget(this.mPreviewSurface);
        } else {
            createCaptureRequest.addTarget(this.mRecordSurface);
        }
        applySettingsForVideo(createCaptureRequest);
        VendorTagHelper.setValue(createCaptureRequest, CaptureRequestVendorTags.VIDEO_RECORD_CONTROL, Integer.valueOf(i));
        capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
    }

    private void triggerCapture() {
        if (isNeedFlashOn()) {
            this.mConfigs.setNeedFlash(true);
            if (needOptimizedFlash()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(2));
                CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, false);
                if (this.mCapabilities.isSupportSnapShotTorch()) {
                    MiCameraCompat.applySnapshotTorch(this.mPreviewRequestBuilder, true);
                }
                resumePreview();
                this.mCaptureCallback.setState(10);
            } else if (needScreenLight()) {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
                resumePreview();
                triggerPrecapture();
            } else {
                triggerPrecapture();
            }
        } else {
            this.mConfigs.setNeedFlash(false);
            captureStillPicture();
        }
    }

    /* access modifiers changed from: private */
    public void triggerDeviceChecking(boolean z) {
        if (b.sP && DataRepository.dataItemFeature().gP() && this.mHelperHandler != null) {
            Log.d(TAG, "triggerDeviceChecking");
            this.mHelperHandler.sendMessage(this.mHelperHandler.obtainMessage(3, z ? 1 : 0, 0));
        }
    }

    /* access modifiers changed from: private */
    public void triggerPrecapture() {
        if (!this.mCapabilities.isAutoFocusSupported() || this.mConfigs.getFocusMode() == 0) {
            runPreCaptureSequence();
        } else if (needOptimizedFlash()) {
            boolean z = this.mConfigs.getISO() == 0 || this.mConfigs.getExposureTime() == 0;
            if (DataRepository.dataItemFeature().hp() && z) {
                runPreCaptureSequence();
            } else if (!DataRepository.dataItemFeature().ho() || !z) {
                lockFocus();
            } else {
                this.mCaptureCallback.setState(5);
            }
        } else {
            lockFocus();
        }
    }

    private void unlockFocus() {
        if (checkCaptureSession("unlockFocus")) {
            Log.d(TAG, "unlockFocus");
            try {
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                capture(this.mPreviewRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                CaptureRequestBuilder.applyFocusMode(this.mPreviewRequestBuilder, this.mConfigs);
                applyFlashMode(this.mPreviewRequestBuilder, 1);
                CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, this.mConfigs.isAELocked());
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_PRECAPTURE_TRIGGER, Integer.valueOf(0));
                this.mCaptureCallback.setState(1);
                resumePreview();
            } catch (CameraAccessException e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("unlockFocus: ");
                sb.append(e.getMessage());
                Log.e(str, sb.toString());
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to unlock focus, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    private void waitFlashClosed() {
        this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_MODE, Integer.valueOf(1));
        this.mPreviewRequestBuilder.set(CaptureRequest.FLASH_MODE, Integer.valueOf(0));
        resumePreview();
        this.mCaptureCallback.setState(9);
    }

    /* access modifiers changed from: 0000 */
    public void applySettingsForCapture(Builder builder, int i) {
        if (builder != null) {
            boolean z = false;
            builder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(0));
            applyFlashMode(builder, i);
            applyCommonSettings(builder, i);
            applySettingsForJpeg(builder);
            if (!b.isMTKPlatform()) {
                CaptureRequestBuilder.applyZsl(builder, this.mConfigs);
            } else {
                CompatibilityUtils.setZsl(builder, true);
                VendorTagHelper.setValueQuietly(builder, CaptureRequestVendorTags.ZSL_CAPTURE_MODE, Integer.valueOf(1));
            }
            CaptureRequestBuilder.applyAntiShake(builder, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyFpsRange(builder, this.mConfigs);
            boolean z2 = i != 4;
            if (this.mMiCamera2ShotQueue.size() > 1) {
                z2 = false;
            }
            CaptureRequestBuilder.applyDepurpleEnable(builder, this.mCapabilities, z2);
            CameraCapabilities cameraCapabilities = this.mCapabilities;
            if (needScreenLight() || needOptimizedFlash()) {
                z = true;
            }
            CaptureRequestBuilder.applyBackwardCaptureHint(cameraCapabilities, builder, z);
        }
    }

    /* access modifiers changed from: 0000 */
    public void applySettingsForVideoShot(Builder builder, int i) {
        applySettingsForJpeg(builder);
        CaptureRequestBuilder.applyVideoFlash(builder, this.mConfigs);
        CaptureRequestBuilder.applyExposureCompensation(builder, i, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyZoomRatio(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyAntiShake(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyBeautyValues(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyFrontMirror(builder, i, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyAELock(builder, this.mConfigs.isAELocked());
        CaptureRequestBuilder.applyFpsRange(builder, this.mConfigs);
        CaptureRequestBuilder.applyUltraWideLDC(builder, this.mCapabilities, this.mConfigs);
        CaptureRequestBuilder.applyMacroMode(builder, i, this.mCapabilities, this.mConfigs);
    }

    public void cancelContinuousShot() {
    }

    public void cancelFocus(int i) {
        if (checkCaptureSession("cancelFocus")) {
            try {
                Builder initFocusRequestBuilder = initFocusRequestBuilder(i);
                initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
                initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(2));
                CaptureRequestBuilder.applyZoomRatio(initFocusRequestBuilder, this.mCapabilities, this.mConfigs);
                applyFlashMode(initFocusRequestBuilder, 1);
                CaptureRequestBuilder.applyAWBMode(initFocusRequestBuilder, this.mConfigs.getAWBMode());
                CaptureRequestBuilder.applyCustomAWB(initFocusRequestBuilder, this.mConfigs.getAwbCustomValue());
                CaptureRequestBuilder.applyExposureCompensation(initFocusRequestBuilder, 1, this.mCapabilities, this.mConfigs);
                CaptureRequestBuilder.applyAntiShake(initFocusRequestBuilder, this.mCapabilities, this.mConfigs);
                if (this.mPreviewControl.needForCapture()) {
                    CaptureRequestBuilder.applyContrast(initFocusRequestBuilder, this.mCapabilities, this.mConfigs);
                    CaptureRequestBuilder.applySaturation(initFocusRequestBuilder, this.mConfigs);
                    CaptureRequestBuilder.applySharpness(initFocusRequestBuilder, this.mConfigs);
                }
                if (this.mPreviewControl.needForManually()) {
                    CaptureRequestBuilder.applyIso(initFocusRequestBuilder, 1, this.mCapabilities, this.mConfigs);
                    CaptureRequestBuilder.applyExposureTime(initFocusRequestBuilder, 1, this.mConfigs);
                }
                CaptureRequestBuilder.applyFpsRange(initFocusRequestBuilder, this.mConfigs);
                capture(initFocusRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
                this.mConfigs.setAERegions(null);
                this.mConfigs.setAFRegions(null);
                setAFModeToPreview(this.mConfigs.getFocusMode());
            } catch (CameraAccessException e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("cancelFocus: ");
                sb.append(e.getMessage());
                Log.e(str, sb.toString());
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to cancel focus, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void cancelSession() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("cancelSession: id=");
        sb.append(getId());
        Log.d(str, sb.toString());
        this.mIsCaptureSessionClosed = true;
        try {
            this.mSessionId = genSessionId();
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession != null) {
                    this.mCaptureSession.stopRepeating();
                    abortCaptures();
                    if (this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession) {
                        this.mCaptureSession.replaceSessionClose();
                    } else {
                        this.mCaptureSession.replaceSessionClose();
                    }
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("cancelSession: reset session ");
                    sb2.append(this.mCaptureSession);
                    Log.d(str2, sb2.toString());
                    this.mCaptureSession = null;
                }
            }
            resetConfigs();
        } catch (CameraAccessException e) {
            Log.e(TAG, "Failed to stop repeating session", e);
        } catch (IllegalStateException e2) {
            Log.e(TAG, "Failed to stop repeating, IllegalState", e2);
        }
    }

    public void captureAbortBurst() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("captureAbortBurst: shot queue size");
        sb.append(this.mMiCamera2ShotQueue.size());
        Log.d(str, sb.toString());
        synchronized (this.mSessionLock) {
            if (this.mCaptureSession == null) {
                Log.w(TAG, "captureAbortBurst: null session");
                return;
            }
            try {
                this.mCaptureSession.stopRepeating();
            } catch (CameraAccessException e) {
                e.printStackTrace();
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to abort burst, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void captureBurstPictures(int i, @NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback) {
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        if (this.mConfigs.getShotType() == 9) {
            this.mMiCamera2Shot = new MiCamera2ShotParallelRepeating(this, i);
            this.mMiCamera2ShotQueue.offerLast(this.mMiCamera2Shot);
            this.mCaptureTime = System.currentTimeMillis();
            this.mMiCamera2Shot.startShot();
            return;
        }
        this.mMiCamera2Shot = new MiCamera2ShotBurst(this, i);
        this.mMiCamera2Shot.startShot();
    }

    public void captureGroupShotPictures(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback, int i, Context context) {
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        this.mMiCamera2Shot = new MiCamera2ShotGroup(this, i, context, this.mCaptureCallback.getPreviewCaptureResult());
        this.mMiCamera2Shot.startShot();
    }

    public void captureVideoSnapshot(PictureCallback pictureCallback) {
        setPictureCallback(pictureCallback);
        this.mMiCamera2Shot = new MiCamera2ShotVideo(this);
        this.mMiCamera2Shot.startShot();
    }

    public void close() {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("E: close: cameraId = ");
        sb.append(getId());
        Log.d(str, sb.toString());
        this.mIsCameraClosed = true;
        abortCaptures();
        if (this.mCameraDevice != null) {
            if (DataRepository.dataItemFeature().gM() && !DataRepository.dataItemFeature().he()) {
                try {
                    this.mCameraDevice.flush();
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                }
            }
            this.mCameraDevice.close();
        }
        if (this.mPhotoImageReader != null) {
            this.mPhotoImageReader.close();
        }
        if (this.mPreviewImageReader != null) {
            this.mPreviewImageReader.close();
        }
        if (this.mRawImageReader != null) {
            this.mRawImageReader.close();
        }
        if (this.mVideoSnapshotImageReader != null) {
            this.mVideoSnapshotImageReader.close();
        }
        if (this.mMiCamera2Shot != null) {
            this.mMiCamera2Shot.makeClobber();
            this.mMiCamera2Shot = null;
        }
        reset();
        String str2 = TAG;
        StringBuilder sb2 = new StringBuilder();
        sb2.append("X: close: cameraId = ");
        sb2.append(getId());
        Log.d(str2, sb2.toString());
    }

    public void forceTurnFlashONAndPausePreview() {
        int flashMode = this.mConfigs.getFlashMode();
        this.mConfigs.setFlashMode(2);
        applyFlashMode(this.mPreviewRequestBuilder, 1);
        resumePreview();
        this.mCaptureCallback.setState(10);
        this.mConfigs.setFlashMode(flashMode);
    }

    public void forceTurnFlashOffAndPausePreview() {
        int flashMode = this.mConfigs.getFlashMode();
        this.mConfigs.setFlashMode(0);
        applyFlashMode(this.mPreviewRequestBuilder, 1);
        resumePreview();
        this.mCaptureCallback.setState(11);
        this.mConfigs.setFlashMode(flashMode);
    }

    public int getAlgorithmPreviewFormat() {
        return this.mConfigs.getAlgorithmPreviewFormat();
    }

    public CameraSize getAlgorithmPreviewSize() {
        return this.mConfigs.getAlgorithmPreviewSize();
    }

    /* access modifiers changed from: protected */
    public CameraConfigs getCameraConfigs() {
        return this.mConfigs;
    }

    /* access modifiers changed from: protected */
    public CameraDevice getCameraDevice() {
        return this.mCameraDevice;
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public CameraCapabilities getCapabilities() {
        return this.mCapabilities;
    }

    /* access modifiers changed from: protected */
    public CameraCaptureSession getCaptureSession() {
        return this.mCaptureSession;
    }

    /* access modifiers changed from: protected */
    public ImageReader getDepthImageReader() {
        return this.mDepthReader;
    }

    public int getExposureCompensation() {
        return this.mConfigs.getExposureCompensationIndex();
    }

    public int getFlashMode() {
        return this.mConfigs.getFlashMode();
    }

    public int getFocusMode() {
        return this.mConfigs.getFocusMode();
    }

    public String getParallelShotSavePath() {
        return this.mConfigs.getThumbnailShotPath();
    }

    /* access modifiers changed from: protected */
    public ImageReader getPhotoImageReader() {
        return this.mPhotoImageReader;
    }

    public int getPictureFormat() {
        return this.mConfigs.getPhotoFormat();
    }

    public int getPictureMaxImages() {
        return this.mConfigs.getPhotoMaxImages();
    }

    public CameraSize getPictureSize() {
        return this.mConfigs.getPhotoSize();
    }

    /* access modifiers changed from: protected */
    public ImageReader getPortraitRawImageReader() {
        return this.mPortraitRawImageReader;
    }

    public int getPreviewMaxImages() {
        return this.mConfigs.getPreviewMaxImages();
    }

    /* access modifiers changed from: protected */
    public Builder getPreviewRequestBuilder() {
        return this.mPreviewRequestBuilder;
    }

    public CameraSize getPreviewSize() {
        return this.mConfigs.getPreviewSize();
    }

    /* access modifiers changed from: protected */
    public Surface getPreviewSurface() {
        return this.mPreviewSurface;
    }

    /* access modifiers changed from: protected */
    public ImageReader getRawImageReader() {
        return this.mRawImageReader;
    }

    /* access modifiers changed from: protected */
    public ImageWriter getRawImageWriter() {
        return this.mRawImageWriter;
    }

    /* access modifiers changed from: protected */
    public Surface getRecordSurface() {
        return this.mRecordSurface;
    }

    /* access modifiers changed from: protected */
    public List<Surface> getRemoteSurfaceList() {
        return this.mParallelCaptureSurfaceList;
    }

    public int getSceneMode() {
        return this.mConfigs.getSceneMode();
    }

    public CameraSize getSensorRawImageSize() {
        return this.mConfigs.getSensorRawImageSize();
    }

    /* access modifiers changed from: protected */
    public ImageReader getVideoSnapshotImageReader() {
        return this.mVideoSnapshotImageReader;
    }

    public float getZoomRatio() {
        return this.mConfigs.getZoomRatio();
    }

    /* access modifiers changed from: protected */
    public boolean isBeautyOn() {
        BeautyValues beautyValues = this.mConfigs.getBeautyValues();
        if (beautyValues != null) {
            return beautyValues.isFaceBeautyOn();
        }
        Log.d(TAG, "Assume front beauty is off in case beautyValues is unavailable.");
        return false;
    }

    public boolean isBokehEnabled() {
        return this.mConfigs.isMiBokehEnabled();
    }

    public boolean isCaptureBusy(boolean z) {
        if (!this.mIsCaptureCompleted) {
            Log.d(TAG, "isCaptureBusy: mIsCaptureComplete = false");
            return true;
        } else if (this.mMiCamera2ShotQueue.isEmpty()) {
            return false;
        } else {
            long currentTimeMillis = System.currentTimeMillis() - this.mCaptureTime;
            if (currentTimeMillis > FunctionParseBeautyBodySlimCount.TIP_INTERVAL_TIME) {
                StringBuilder sb = new StringBuilder();
                sb.append("isCaptureBusy: timeout:");
                sb.append(currentTimeMillis);
                resetShotQueue(sb.toString());
                return false;
            } else if (z) {
                Log.d(TAG, "isCaptureBusy: simple return true");
                return true;
            } else {
                if (!(this.mCaptureCallback == null || this.mCaptureCallback.getPreviewCaptureResult() == null)) {
                    Integer num = (Integer) this.mCaptureCallback.getPreviewCaptureResult().get(CaptureResult.SENSOR_SENSITIVITY);
                    if (num == null || num.intValue() >= 800) {
                        String str = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("isCaptureBusy: iso:");
                        sb2.append(num);
                        Log.d(str, sb2.toString());
                        return true;
                    } else if (this.mCapabilities.isSensorHdrSupported()) {
                        Byte b = (Byte) VendorTagHelper.getValue(this.mCaptureCallback.getPreviewCaptureResult(), CaptureResultVendorTags.SENSOR_HDR_ENABLE);
                        if (b != null && b.byteValue() > 0) {
                            String str2 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("isCaptureBusy: sensorHdr:");
                            sb3.append(b);
                            Log.d(str2, sb3.toString());
                            return true;
                        }
                    }
                }
                if (currentTimeMillis < 50) {
                    String str3 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("isCaptureBusy: time:");
                    sb4.append(currentTimeMillis);
                    Log.d(str3, sb4.toString());
                    return true;
                }
                int size = this.mMiCamera2ShotQueue.size();
                if (size <= 10) {
                    return false;
                }
                String str4 = TAG;
                StringBuilder sb5 = new StringBuilder();
                sb5.append("isCaptureBusy: size:");
                sb5.append(size);
                Log.d(str4, sb5.toString());
                return true;
            }
        }
    }

    public boolean isFacingFront() {
        return this.mCapabilities.getFacing() == 0;
    }

    public boolean isNeedFlashOn() {
        boolean z = true;
        if (this.mConfigs.getFlashMode() == 1 || this.mConfigs.getFlashMode() == 101) {
            return true;
        }
        if (this.mConfigs.getFlashMode() != 3) {
            return false;
        }
        Integer currentAEState = this.mCaptureCallback.getCurrentAEState();
        if (currentAEState == null || currentAEState.intValue() != 4) {
            z = false;
        }
        return z;
    }

    public boolean isNeedPreviewThumbnail() {
        return !this.mConfigs.isHDREnabled() && (this.mConfigs.isMfnrEnabled() || this.mConfigs.isSwMfnrEnabled() || this.mConfigs.isSuperResolutionEnabled());
    }

    public boolean isPreviewReady() {
        return (this.mCaptureCallback.getPreviewCaptureResult() == null || this.mCaptureCallback.getState() == 0) ? false : true;
    }

    public boolean isQcfaEnable() {
        return this.mConfigs.isQcfaEnable();
    }

    public boolean isSessionReady() {
        boolean z;
        synchronized (this.mSessionLock) {
            z = this.mCaptureSession != null;
        }
        return z;
    }

    public void lockExposure(boolean z) {
        if (checkCaptureSession("lockExposure")) {
            if (z) {
                setAELock(true);
            } else {
                this.mCaptureCallback.setState(4);
            }
            CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    public void lockExposure(boolean z, boolean z2) {
        if (checkCaptureSession("lockExposure")) {
            if (!z2) {
                this.mCaptureCallback.setState(4);
            }
            if (z) {
                setAELock(true);
            }
            CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    public void notifyVideoStreamEnd() {
        try {
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession == null || this.mCameraDevice == null || this.mRecordSurface == null) {
                    Log.w(TAG, "notifyVideoStreamEnd: null session");
                    this.mPendingNotifyVideoEnd = true;
                    return;
                }
                this.mCaptureSession.stopRepeating();
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
                createCaptureRequest.addTarget(this.mRecordSurface);
                applySettingsForVideo(createCaptureRequest);
                MiCameraCompat.applyVideoStreamState(createCaptureRequest, false);
                int capture = capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("notifyVideoStreamEnd: requestId=");
                sb.append(capture);
                Log.v(str, sb.toString());
            }
        } catch (CameraAccessException e) {
            Log.e(TAG, e.getMessage(), e);
            notifyOnError(e.getReason());
        } catch (IllegalArgumentException | IllegalStateException e2) {
            Log.e(TAG, "notifyVideoStreamEnd: ", e2);
        }
    }

    public void onCapabilityChanged(CameraCapabilities cameraCapabilities) {
        if (this.mCaptureCallback != null) {
            this.mCaptureCallback.onCapabilityChanged(cameraCapabilities);
        }
    }

    /* access modifiers changed from: protected */
    public void onCapturePictureFinished(boolean z, MiCamera2Shot miCamera2Shot) {
        boolean needResumePreviewAfterCapture = this.mPreviewControl.needResumePreviewAfterCapture(this.mConfigs);
        this.mConfigs.setNeedFlash(false);
        this.mCaptureCallback.setState(1);
        applySettingsForPreview(this.mPreviewRequestBuilder);
        if (needResumePreviewAfterCapture) {
            resumePreview();
        }
        PictureCallback pictureCallback = getPictureCallback();
        if (!z && pictureCallback != null) {
            pictureCallback.onPictureTakenFinished(false);
        }
        if (!z && !this.mMiCamera2ShotQueue.isEmpty()) {
            synchronized (this.mShotQueueLock) {
                boolean remove = this.mMiCamera2ShotQueue.remove(miCamera2Shot);
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("onCapturePictureFinished failure: mMiCamera2ShotQueue.poll, size: ");
                sb.append(this.mMiCamera2ShotQueue.size());
                sb.append(" removeResult: ");
                sb.append(remove);
                Log.d(str, sb.toString());
                notifyCaptureBusyCallback(z);
            }
        }
    }

    public void onMultiSnapEnd(boolean z, MiCamera2Shot miCamera2Shot) {
        Log.d(TAG, "onMultiSnapEnd:");
        if (this.mMiCamera2ShotQueue.remove(miCamera2Shot)) {
            notifyCaptureBusyCallback(z);
        }
    }

    public void onParallelImagePostProcStart() {
        synchronized (this.mShotQueueLock) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onParallelImagePostProcStart: mMiCamera2ShotQueue.poll, size:");
            sb.append(this.mMiCamera2ShotQueue.size());
            Log.d(str, sb.toString());
            if (!this.mMiCamera2ShotQueue.isEmpty()) {
                this.mMiCamera2ShotQueue.pollFirst();
                notifyCaptureBusyCallback(true);
            }
        }
    }

    public void onPreviewComing() {
        synchronized (this.mShotQueueLock) {
            if (!this.mMiCamera2ShotQueue.isEmpty()) {
                Iterator it = this.mMiCamera2ShotQueue.iterator();
                while (it.hasNext()) {
                    ((MiCamera2Shot) it.next()).onPreviewComing();
                }
            }
        }
    }

    public void onPreviewThumbnailReceived(Thumbnail thumbnail) {
        if (this.mMiCamera2Shot != null) {
            this.mMiCamera2Shot.onPreviewThumbnailReceived(thumbnail);
        }
    }

    public void pausePreview() {
        if (checkCaptureSession("pausePreview")) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("pausePreview: cameraId=");
            sb.append(getId());
            Log.v(str, sb.toString());
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession == null) {
                    Log.w(TAG, "pausePreview: null session");
                    return;
                }
                try {
                    this.mCaptureSession.stopRepeating();
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                    Log.e(TAG, "Failed to pause preview");
                    notifyOnError(e.getReason());
                } catch (IllegalStateException e2) {
                    Log.e(TAG, "Failed to pause preview, IllegalState", e2);
                    notifyOnError(256);
                }
            }
        }
    }

    public boolean registerCaptureCallback(CaptureCallback captureCallback) {
        boolean z = false;
        if (this.mConfigs.getShotType() == 0) {
            this.mFrontQuickCaptureCallback = captureCallback;
            this.mIsCaptureCompleted = false;
            z = true;
        }
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("registerCaptureCallback: ");
        sb.append(z);
        Log.d(str, sb.toString());
        return z;
    }

    public void releaseCameraPreviewCallback(@Nullable CameraPreviewCallback cameraPreviewCallback) {
        if (this.mCaptureSessionStateCallback != null) {
            this.mCaptureSessionStateCallback.setClientCb(cameraPreviewCallback);
        }
    }

    public void releaseFakeSurfaceIfNeed() {
        if (this.mFakeOutputTexture != null) {
            this.mFakeOutputTexture = null;
        }
    }

    public void releasePictureCallback() {
        setPictureCallback(null);
    }

    public void releasePreview(int i) {
        if (this.mHelperHandler != null) {
            this.mHelperHandler.removeCallbacksAndMessages(null);
            this.mHelperHandler = null;
        }
        if (i == 0) {
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession == null) {
                    Log.w(TAG, "releasePreview: null session");
                    return;
                }
                try {
                    Log.v(TAG, "E: releasePreview");
                    this.mCaptureSession.stopRepeating();
                    abortCaptures();
                    this.mCaptureSession.close();
                    Log.v(TAG, "X: releasePreview");
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                    Log.e(TAG, "Failed to release preview");
                    notifyOnError(e.getReason());
                } catch (IllegalStateException e2) {
                    try {
                        Log.e(TAG, "Failed to release preview, IllegalState", e2);
                        notifyOnError(256);
                    } catch (Throwable th) {
                        this.mCaptureSession = null;
                        throw th;
                    }
                }
                this.mCaptureSession = null;
            }
        } else {
            synchronized (this.mSessionLock) {
                this.mCaptureSession = null;
            }
        }
        this.mIsCaptureSessionClosed = true;
    }

    public void resetConfigs() {
        Log.v(TAG, "E: resetConfigs");
        if (this.mConfigs != null) {
            this.mConfigs = new CameraConfigs();
        }
        this.mSessionId = 0;
        releaseCameraPreviewCallback(null);
        Log.v(TAG, "X: resetConfigs");
    }

    public void resumePreview() {
        if (checkCaptureSession("resumePreview")) {
            boolean z = this.mCaptureSession instanceof CameraConstrainedHighSpeedCaptureSession;
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("resumePreview: cameraId=");
            sb.append(getId());
            sb.append(" highSpeed=");
            sb.append(z);
            Log.v(str, sb.toString());
            synchronized (this.mSessionLock) {
                if (this.mCaptureSession != null) {
                    try {
                        this.mPreviewRequest = this.mPreviewRequestBuilder.build();
                        if (z) {
                            int repeatingBurst = this.mCaptureSession.setRepeatingBurst(createHighSpeedRequestList(this.mPreviewRequest), this.mCaptureCallback, this.mCameraHandler);
                            String str2 = TAG;
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("high speed repeating sequenceId: ");
                            sb2.append(repeatingBurst);
                            Log.d(str2, sb2.toString());
                        } else {
                            int repeatingRequest = this.mCaptureSession.setRepeatingRequest(this.mPreviewRequest, this.mCaptureCallback, this.mCameraHandler);
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("repeating sequenceId: ");
                            sb3.append(repeatingRequest);
                            Log.d(str3, sb3.toString());
                        }
                    } catch (CameraAccessException e) {
                        Log.e(TAG, "Failed to resume preview", e);
                        notifyOnError(e.getReason());
                    } catch (IllegalArgumentException | IllegalStateException e2) {
                        Log.e(TAG, "Failed to resume preview, IllegalState", e2);
                        notifyOnError(256);
                    }
                }
            }
        }
    }

    public void setAELock(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAELock: ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mConfigs.setAELock(z)) {
            CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, z);
        }
    }

    public void setAERegions(MeteringRectangle[] meteringRectangleArr) {
        Log.v(TAG, "setAERegions");
        if (this.mConfigs.setAERegions(meteringRectangleArr)) {
            CaptureRequestBuilder.applyAERegions(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setAFRegions(MeteringRectangle[] meteringRectangleArr) {
        Log.v(TAG, "setAFRegions");
        if (this.mConfigs.setAFRegions(meteringRectangleArr)) {
            CaptureRequestBuilder.applyAFRegions(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setASD(boolean z) {
        if (this.mConfigs.setAiSceneDetectEnable(z)) {
            CaptureRequestBuilder.applyAiSceneDetectEnable(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setASDPeriod(int i) {
        if (this.mConfigs.setAiSceneDetectPeriod(i)) {
            CaptureRequestBuilder.applyAiSceneDetectPeriod(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setASDScene(int i) {
        if (this.mConfigs.setASDScene(i)) {
            CaptureRequestBuilder.applyASDScene(this.mCapabilities, this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setAWBLock(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAWBLock: ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mConfigs.setAWBLock(z)) {
            CaptureRequestBuilder.applyAWBLock(this.mPreviewRequestBuilder, z);
        }
    }

    public void setAWBMode(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAWBMode: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setAWBMode(i)) {
            CaptureRequestBuilder.applyAWBMode(this.mPreviewRequestBuilder, this.mConfigs.getAWBMode());
        }
    }

    public void setAlgorithmPreviewFormat(int i) {
        if (i != this.mConfigs.getAlgorithmPreviewFormat()) {
            this.mConfigs.setAlgorithmPreviewFormat(i);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public void setAlgorithmPreviewSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getAlgorithmPreviewSize(), cameraSize)) {
            this.mConfigs.setAlgorithmPreviewSize(cameraSize);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public void setAntiBanding(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setAntiBanding: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setAntiBanding(i)) {
            CaptureRequestBuilder.applyAntiBanding(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setAutoZoomMode(int i) {
        this.mConfigs.setAutoZoomMode(i);
        CaptureRequestBuilder.applyAutoZoomMode(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
    }

    public void setAutoZoomScaleOffset(float f) {
        this.mConfigs.setAutoZoomScaleOffset(f);
        CaptureRequestBuilder.applyAutoZoomScaleOffset(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
    }

    public void setAutoZoomStartCapture(float[] fArr) {
        if (checkCameraDevice("setAutoZoomStartCapture")) {
            try {
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
                createCaptureRequest.addTarget(this.mPreviewSurface);
                createCaptureRequest.addTarget(this.mRecordSurface);
                applySettingsForVideo(createCaptureRequest);
                VendorTagHelper.setValue(createCaptureRequest, CaptureRequestVendorTags.AUTOZOOM_START, fArr);
                capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    public void setAutoZoomStopCapture(int i) {
        if (checkCameraDevice("setAutoZoomStopCapture")) {
            try {
                Builder createCaptureRequest = this.mCameraDevice.createCaptureRequest(3);
                createCaptureRequest.addTarget(this.mPreviewSurface);
                createCaptureRequest.addTarget(this.mRecordSurface);
                applySettingsForVideo(createCaptureRequest);
                VendorTagHelper.setValue(createCaptureRequest, CaptureRequestVendorTags.AUTOZOOM_STOP, Integer.valueOf(i));
                capture(createCaptureRequest.build(), this.mCaptureCallback, this.mCameraHandler);
            } catch (CameraAccessException e) {
                Log.e(TAG, e.getMessage());
            }
        }
    }

    public void setBeautyValues(BeautyValues beautyValues) {
        this.mConfigs.setBeautyValues(beautyValues);
        CaptureRequestBuilder.applyBeautyValues(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
    }

    public void setBurstShotSpeed(int i) {
    }

    public void setCameraAI30(boolean z) {
        if (this.mConfigs.setCameraAi30Enable(z)) {
            CaptureRequestBuilder.applyCameraAi30Enable(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setCaptureBusyCallback(CaptureBusyCallback captureBusyCallback) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setCaptureBusyCallback: ");
        sb.append(captureBusyCallback);
        Log.d(str, sb.toString());
        if (captureBusyCallback == null) {
            this.mCaptureBusyCallback = null;
            return;
        }
        synchronized (this.mShotQueueLock) {
            if (this.mMiCamera2ShotQueue.isEmpty()) {
                Log.d(TAG, "setCaptureBusyCallback: shot queue empty");
                captureBusyCallback.onCaptureCompleted(true);
            } else {
                this.mCaptureBusyCallback = captureBusyCallback;
            }
        }
    }

    public void setCaptureEnable(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setCaptureEnable: ");
        sb.append(z);
        sb.append(" | ");
        sb.append(this.mFrontQuickCaptureCallback);
        Log.d(str, sb.toString());
        if (this.mFrontQuickCaptureCallback != null) {
            this.mCameraHandler.postDelayed(new Runnable(z) {
                private final /* synthetic */ boolean f$1;

                {
                    this.f$1 = r2;
                }

                public final void run() {
                    MiCamera2.lambda$setCaptureEnable$1(MiCamera2.this, this.f$1);
                }
            }, getCaptureInterval());
        }
    }

    public void setCaptureTriggerFlow(int[] iArr) {
        this.mConfigs.setCaptureTriggerFlow(iArr);
    }

    public void setColorEffect(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setColorEffect: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setColorEffect(i)) {
            CaptureRequestBuilder.applyColorEffect(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setContrast(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setContrast: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setContrastLevel(i)) {
            CaptureRequestBuilder.applyContrast(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setCustomAWB(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setCustomAWB: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setCustomAWB(i)) {
            CaptureRequestBuilder.applyCustomAWB(this.mPreviewRequestBuilder, this.mConfigs.getAwbCustomValue());
        }
    }

    public void setDeviceOrientation(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setDeviceOrientation: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setDeviceOrientation(i)) {
            CaptureRequestBuilder.applyDeviceOrientation(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setDisplayOrientation(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setDisplayOrientation: ");
        sb.append(i);
        Log.v(str, sb.toString());
        this.mDisplayOrientation = i;
    }

    public void setDualCamWaterMarkEnable(boolean z) {
        this.mConfigs.setDualCamWaterMarkEnable(z);
    }

    public void setEnableEIS(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setEnableEIS: ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mConfigs.setEnableEIS(z)) {
            CaptureRequestBuilder.applyAntiShake(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setEnableOIS(boolean z) {
        if (this.mCapabilities.isSupportOIS()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setEnableOIS ");
            sb.append(z);
            Log.v(str, sb.toString());
            this.mConfigs.setEnableOIS(z);
            CaptureRequestBuilder.applyAntiShake(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setEnableZsl(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setEnableZsl ");
        sb.append(z);
        Log.v(str, sb.toString());
        this.mConfigs.setEnableZsl(z);
        CaptureRequestBuilder.applyZsl(this.mPreviewRequestBuilder, this.mConfigs);
    }

    public void setExposureCompensation(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setExposureCompensation: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setExposureCompensationIndex(i)) {
            CaptureRequestBuilder.applyExposureCompensation(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setExposureMeteringMode(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setExposureMeteringMode: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setExposureMeteringMode(i)) {
            CaptureRequestBuilder.applyExposureMeteringMode(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setExposureTime(long j) {
        if (this.mConfigs.setExposureTime(j)) {
            CaptureRequestBuilder.applySceneMode(this.mPreviewRequestBuilder, this.mConfigs);
            CaptureRequestBuilder.applyExposureCompensation(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyIso(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyExposureTime(this.mPreviewRequestBuilder, 1, this.mConfigs);
        }
    }

    public void setEyeLight(int i) {
        if (this.mConfigs.setEyeLight(i)) {
            CaptureRequestBuilder.applyEyeLight(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setFNumber(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFNumber ");
        sb.append(str);
        sb.append(" for ");
        sb.append(this.mPreviewRequestBuilder);
        Log.d(str2, sb.toString());
        this.mConfigs.setFNumber(str);
        CaptureRequestBuilder.applyFNumber(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
    }

    public void setFaceAgeAnalyze(boolean z) {
        if (this.mConfigs.setFaceAgeAnalyzeEnabled(z)) {
            CaptureRequestBuilder.applyFaceAgeAnalyze(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setFaceScore(boolean z) {
        if (this.mConfigs.setFaceScoreEnabled(z)) {
            CaptureRequestBuilder.applyFaceScore(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setFaceWaterMarkEnable(boolean z) {
        this.mConfigs.setFaceWaterMarkEnable(z);
    }

    public void setFaceWaterMarkFormat(String str) {
        this.mConfigs.setFaceWaterMarkFormat(str);
    }

    public void setFlashMode(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFlashMode: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setFlashMode(i)) {
            applyFlashMode(this.mPreviewRequestBuilder, 1);
        }
    }

    public void setFocusDistance(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFocusDistance: ");
        sb.append(f);
        Log.v(str, sb.toString());
        if (this.mConfigs.setFocusDistance(f)) {
            CaptureRequestBuilder.applyFocusDistance(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setFocusMode(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFocusMode: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setFocusMode(i)) {
            CaptureRequestBuilder.applyFocusMode(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setFpsRange(Range<Integer> range) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFpsRange: ");
        sb.append(range);
        Log.v(str, sb.toString());
        this.mConfigs.setPreviewFpsRange(range);
        CaptureRequestBuilder.applyFpsRange(this.mPreviewRequestBuilder, this.mConfigs);
    }

    public void setFrontMirror(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setFrontMirror: ");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mConfigs.setFrontMirror(z);
    }

    public void setGpsLocation(Location location) {
        this.mConfigs.setGpsLocation(location);
    }

    public void setHDR(boolean z) {
        if (this.mConfigs.setHDREnabled(z)) {
            CaptureRequestBuilder.applyHDR(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setHDRCheckerEnable(boolean z) {
        if (this.mConfigs.setHDRCheckerEnabled(z)) {
            CaptureRequestBuilder.applyHDRCheckerEnable(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setHFRDeflickerEnable(boolean z) {
        if (this.mConfigs.setHFRDeflickerEnable(z)) {
            CaptureRequestBuilder.applyHFRDeflicker(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setHHT(boolean z) {
        if (this.mConfigs.setHHTEnabled(z)) {
            CaptureRequestBuilder.applyHHT(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setISO(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setISO: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setISO(i)) {
            CaptureRequestBuilder.applyExposureCompensation(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyIso(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
            CaptureRequestBuilder.applyExposureTime(this.mPreviewRequestBuilder, 1, this.mConfigs);
        }
    }

    public void setJpegQuality(int i) {
        this.mConfigs.setJpegQuality(i);
    }

    public void setJpegRotation(int i) {
        this.mConfigs.setJpegRotation(i);
    }

    public void setJpegThumbnailSize(CameraSize cameraSize) {
        this.mConfigs.setThumbnailSize(cameraSize);
    }

    public void setLensDirtyDetect(boolean z) {
        if (this.mConfigs.setLensDirtyDetectEnabled(z)) {
            CaptureRequestBuilder.applyLensDirtyDetect(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setMacroMode(boolean z) {
        if (this.mConfigs.setMacroMode(z)) {
            CaptureRequestBuilder.applyMacroMode(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setMfnr(boolean z) {
        if (this.mConfigs.setMfnrEnabled(z)) {
            CaptureRequestBuilder.applyHwMfnr(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setMiBokeh(boolean z) {
        if (this.mConfigs.setMiBokehEnabled(z)) {
            CaptureRequestBuilder.applyMiBokeh(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setModuleParameter(int i, int i2) {
        this.mPreviewControl = new MiCamera2PreviewNormal(i, i2);
    }

    public void setNeedPausePreview(boolean z) {
        this.mConfigs.setPausePreview(z);
    }

    public void setNeedSequence(boolean z) {
        this.mConfigs.setNeedSequence(z);
    }

    public void setNormalWideLDC(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setNormalWideLDC: ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mConfigs.setNormalWideLDCEnabled(z)) {
            CaptureRequestBuilder.applyNormalWideLDC(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setOpticalZoomToTele(boolean z) {
        if (DataRepository.dataItemFeature().ge() && this.mCapabilities.isSupportFastZoomIn()) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("setOpticalZoomToTele: toTele = ");
            sb.append(z);
            Log.d(str, sb.toString());
            this.mToTele = z;
        }
        MiCameraCompat.applyStFastZoomIn(this.mPreviewRequestBuilder, z);
    }

    public void setOptimizedFlash(boolean z) {
        this.mConfigs.setOptimizedFlash(z);
    }

    public void setPictureFormat(int i) {
        if (this.mConfigs.getPhotoFormat() != i) {
            this.mConfigs.setPhotoFormat(i);
            preparePhotoImageReader();
        }
    }

    public void setPictureMaxImages(int i) {
        if (i > this.mConfigs.getPhotoMaxImages()) {
            this.mConfigs.setPhotoMaxImages(i);
            preparePhotoImageReader();
        }
    }

    public void setPictureSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getPhotoSize(), cameraSize)) {
            this.mConfigs.setPhotoSize(cameraSize);
            preparePhotoImageReader();
        }
    }

    public void setPortraitLighting(int i) {
        if (this.mConfigs.setPortraitLightingPattern(i)) {
            CaptureRequestBuilder.applyPortraitLighting(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setPreviewMaxImages(int i) {
        if (i > this.mConfigs.getPreviewMaxImages()) {
            this.mConfigs.setPreviewMaxImages(i);
            if (this.mIsPreviewCallbackEnabled) {
                preparePreviewImageReader();
            }
        }
    }

    public void setPreviewSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getPreviewSize(), cameraSize)) {
            this.mConfigs.setPreviewSize(cameraSize);
        }
    }

    public void setQcfaEnable(boolean z) {
        this.mConfigs.setQcfaEnable(z);
    }

    public void setQuickShotAnimation(boolean z) {
        this.mConfigs.setQuickShotAnimation(z);
    }

    public void setRearBokehEnable(boolean z) {
        if (this.mConfigs.setRearBokehEnable(z)) {
            CaptureRequestBuilder.applyRearBokeh(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void setSaturation(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSaturation: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setSaturationLevel(i)) {
            CaptureRequestBuilder.applySaturation(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setSceneMode(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSceneMode: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setSceneMode(i)) {
            CaptureRequestBuilder.applySceneMode(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setSensorRawImageSize(CameraSize cameraSize, boolean z) {
        if (!Objects.equals(this.mConfigs.getSensorRawImageSize(), cameraSize)) {
            this.mConfigs.setSensorRawImageSize(cameraSize);
            prepareRawImageReader(cameraSize, z);
        }
    }

    public void setSharpness(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setSharpness: ");
        sb.append(i);
        Log.v(str, sb.toString());
        if (this.mConfigs.setSharpnessLevel(i)) {
            CaptureRequestBuilder.applySharpness(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setShot2Gallery(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setShot2Gallery: isShot2Gallery=");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mConfigs.setShot2Gallery(z);
    }

    public void setShotSavePath(String str, boolean z) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setShotSavePath: ");
        sb.append(str);
        sb.append(", isParallel:");
        sb.append(z);
        Log.d(str2, sb.toString());
        this.mConfigs.setShotPath(str, z);
    }

    public void setShotType(int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setShotType: algo=");
        sb.append(i);
        Log.d(str, sb.toString());
        this.mConfigs.setShotType(i);
    }

    public void setSubPictureSize(CameraSize cameraSize) {
        if (!Objects.equals(this.mConfigs.getSubPhotoSize(), cameraSize)) {
            this.mConfigs.setSubPhotoSize(cameraSize);
        }
    }

    public void setSuperNight(boolean z) {
        this.mConfigs.setSuperNightEnabled(z);
    }

    public void setSuperResolution(boolean z) {
        if (this.mConfigs.setSuperResolutionEnabled(z)) {
            CaptureRequestBuilder.applySuperResolution(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setSwMfnr(boolean z) {
        if (this.mConfigs.setSwMfnrEnabled(z)) {
            CaptureRequestBuilder.applySwMfnr(this.mPreviewRequestBuilder, 1, this.mCapabilities, this.mConfigs);
        }
    }

    public void setTimeWaterMarkEnable(boolean z) {
        this.mConfigs.setTimeWaterMarkEnable(z);
    }

    public void setTimeWatermarkValue(String str) {
        this.mConfigs.setTimeWaterMarkValue(str);
    }

    public void setUltraWideLDC(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setUltraWideLDC: ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mConfigs.setUltraWideLDCEnabled(z)) {
            CaptureRequestBuilder.applyUltraWideLDC(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public <T> void setVendorSetting(Key<T> key, T t) {
        if (this.mPreviewRequestBuilder != null) {
            this.mPreviewRequestBuilder.set(key, t);
        }
    }

    public void setVideoFpsRange(Range<Integer> range) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setVideoFpsRange: ");
        sb.append(range);
        Log.v(str, sb.toString());
        if (this.mConfigs.setVideoFpsRange(range)) {
            CaptureRequestBuilder.applyVideoFpsRange(this.mPreviewRequestBuilder, this.mConfigs);
        }
    }

    public void setVideoSnapshotSize(CameraSize cameraSize) {
        this.mConfigs.setVideoSnapshotSize(cameraSize);
    }

    public void setZoomRatio(float f) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("setZoomRatio(): ");
        sb.append(f);
        Log.v(str, sb.toString());
        if (this.mConfigs.setZoomRatio(f)) {
            CaptureRequestBuilder.applyZoomRatio(this.mPreviewRequestBuilder, this.mCapabilities, this.mConfigs);
        }
    }

    public void startFaceDetection() {
        Log.v(TAG, "startFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(true);
        CaptureRequestBuilder.applyFaceDetection(this.mPreviewRequestBuilder, this.mConfigs);
    }

    public void startFocus(FocusTask focusTask, int i) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("startFocus: ");
        sb.append(i);
        Log.v(str, sb.toString());
        try {
            this.mCaptureCallback.setFocusTask(focusTask);
            Builder initFocusRequestBuilder = initFocusRequestBuilder(i);
            initFocusRequestBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            applySettingsForFocusCapture(initFocusRequestBuilder);
            initFocusRequestBuilder.set(CaptureRequest.CONTROL_AF_TRIGGER, Integer.valueOf(1));
            capture(initFocusRequestBuilder.build(), this.mCaptureCallback, this.mCameraHandler);
            this.mConfigs.setFocusMode(1);
            this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_MODE, Integer.valueOf(1));
            if (this.mPreviewControl.needForVideo()) {
                applySettingsForVideo(this.mPreviewRequestBuilder);
            } else {
                applySettingsForPreview(this.mPreviewRequestBuilder);
            }
            resumePreview();
        } catch (CameraAccessException e) {
            e.printStackTrace();
            Log.e(TAG, "Failed to start focus");
            notifyOnError(e.getReason());
        }
    }

    public void startHighSpeedRecordPreview() {
        if (checkCameraDevice("startHighSpeedRecordPreview")) {
            Log.d(TAG, "startHighSpeedRecordPreview");
            applySettingsForVideo(this.mPreviewRequestBuilder);
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, true);
            resumePreview();
        }
    }

    public void startHighSpeedRecordSession(@NonNull Surface surface, @NonNull Surface surface2, Range<Integer> range, CameraPreviewCallback cameraPreviewCallback) {
        if (checkCameraDevice("startHighSpeedRecordSession")) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("startHighSpeedRecordSession: previewSurface = ");
            sb.append(surface);
            sb.append(" recordSurface = ");
            sb.append(surface2);
            sb.append(" fpsRange = ");
            sb.append(range);
            Log.d(str, sb.toString());
            this.mPreviewSurface = surface;
            this.mRecordSurface = surface2;
            this.mHighSpeedFpsRange = range;
            this.mSessionId = genSessionId();
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AE_TARGET_FPS_RANGE, this.mHighSpeedFpsRange);
                synchronized (this.mSessionLock) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("startHighSpeedRecordSession: reset session ");
                    sb2.append(this.mCaptureSession);
                    Log.d(str2, sb2.toString());
                    this.mCaptureSession = null;
                }
                List<Surface> asList = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                if (b.isMTKPlatform()) {
                    if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 120) {
                        this.mCameraDevice.createConstrainedHighSpeedCaptureSession(asList, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                    } else if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 240) {
                        VendorTagHelper.setValueQuietly(this.mPreviewRequestBuilder, CaptureRequestVendorTags.SMVR_MODE, CaptureRequestVendorTags.VALUE_SMVR_MODE_240FPS);
                        this.mCameraDevice.createCaptureSession(asList, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                    } else if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 480) {
                        VendorTagHelper.setValueQuietly(this.mPreviewRequestBuilder, CaptureRequestVendorTags.SMVR_MODE, CaptureRequestVendorTags.VALUE_SMVR_MODE_480FPS);
                        this.mCameraDevice.createCaptureSession(asList, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("Unsupported High Speed Recording: ");
                        sb3.append(this.mHighSpeedFpsRange);
                        throw new UnsupportedOperationException(sb3.toString());
                    }
                } else if (((Integer) this.mHighSpeedFpsRange.getUpper()).intValue() == 120 && !DataRepository.dataItemFeature().gC()) {
                    ArrayList arrayList = new ArrayList();
                    for (Surface outputConfiguration : asList) {
                        arrayList.add(new OutputConfiguration(outputConfiguration));
                    }
                    this.mCameraDevice.createCustomCaptureSession(null, arrayList, 32888, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                } else if (DataRepository.dataItemFeature().gQ()) {
                    ArrayList arrayList2 = new ArrayList();
                    for (Surface outputConfiguration2 : asList) {
                        arrayList2.add(new OutputConfiguration(outputConfiguration2));
                    }
                    CompatibilityUtils.createCaptureSessionWithSessionConfiguration(this.mCameraDevice, 1, null, arrayList2, this.mPreviewRequestBuilder.build(), new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                } else {
                    this.mCameraDevice.createConstrainedHighSpeedCaptureSession(asList, new HighSpeedCaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                }
            } catch (Exception e) {
                notifyOnError(-1);
                Log.e(TAG, "Failed to start high speed record session", e);
            }
        }
    }

    public void startHighSpeedRecording() {
        if (checkCaptureSession("startHighSpeedRecording")) {
            Log.d(TAG, "startHighSpeedRecording");
            MiCameraCompat.applyIsHfrPreview(this.mPreviewRequestBuilder, false);
            if (DataRepository.dataItemFeature().gW()) {
                Log.d(TAG, "startHighSpeedRecording: CAF is disabled");
                this.mPreviewRequestBuilder.set(CaptureRequest.CONTROL_AF_MODE, Integer.valueOf(1));
            }
            resumePreview();
        }
    }

    public void startObjectTrack(RectF rectF) {
    }

    public void startPreviewCallback(@NonNull PreviewCallback previewCallback) {
        if (checkCaptureSession("startPreviewCallback")) {
            Log.v(TAG, "startPreviewCallback");
            if (this.mIsPreviewCallbackEnabled) {
                setPreviewCallback(previewCallback);
                if (!this.mIsPreviewCallbackStarted) {
                    this.mIsPreviewCallbackStarted = true;
                    this.mPreviewRequestBuilder.addTarget(this.mPreviewImageReader.getSurface());
                }
            }
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:51:0x0244 A[Catch:{ CameraAccessException -> 0x00ad, IllegalStateException -> 0x00aa, IllegalArgumentException -> 0x00a7 }] */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x028d A[Catch:{ CameraAccessException -> 0x00ad, IllegalStateException -> 0x00aa, IllegalArgumentException -> 0x00a7 }] */
    /* JADX WARNING: Removed duplicated region for block: B:59:0x02cb A[ADDED_TO_REGION, Catch:{ CameraAccessException -> 0x00ad, IllegalStateException -> 0x00aa, IllegalArgumentException -> 0x00a7 }] */
    /* JADX WARNING: Removed duplicated region for block: B:63:0x02f4 A[Catch:{ CameraAccessException -> 0x00ad, IllegalStateException -> 0x00aa, IllegalArgumentException -> 0x00a7 }] */
    public void startPreviewSession(Surface surface, boolean z, boolean z2, boolean z3, int i, boolean z4, CameraPreviewCallback cameraPreviewCallback) {
        InputConfiguration inputConfiguration;
        OutputConfiguration outputConfiguration;
        boolean z5 = z;
        boolean z6 = z2;
        boolean z7 = z3;
        boolean z8 = z4;
        if (checkCameraDevice("startPreviewSession")) {
            int i2 = 1;
            int i3 = 2;
            Log.d(TAG, String.format(Locale.ENGLISH, "startPreviewSession: opMode=0x%x previewCallback=%b rawCallback=%b", new Object[]{Integer.valueOf(i), Boolean.valueOf(z), Boolean.valueOf(z2)}));
            synchronized (this.mSessionLock) {
                this.mEnableParallelSession = z8;
                this.mPreviewSurface = surface;
                this.mIsPreviewCallbackEnabled = z5;
                this.mSessionId = genSessionId();
                this.mDeferOutputConfigurations.clear();
                ArrayList arrayList = new ArrayList();
                if (!z8) {
                    try {
                        preparePhotoImageReader();
                        arrayList.add(new OutputConfiguration(this.mPhotoImageReader.getSurface()));
                        if (this.mConfigs.getShotType() == 2 || this.mConfigs.getShotType() == -3) {
                            prepareDepthImageReader(this.mConfigs.getPhotoSize());
                            arrayList.add(new OutputConfiguration(this.mDepthReader.getSurface()));
                            preparePortraitRawImageReader(this.mConfigs.getPhotoSize());
                            arrayList.add(new OutputConfiguration(this.mPortraitRawImageReader.getSurface()));
                        }
                    } catch (CameraAccessException e) {
                        Log.e(TAG, "Failed to start preview session", e);
                        notifyOnError(e.getReason());
                    } catch (IllegalStateException e2) {
                        Log.e(TAG, "Failed to start preview session, IllegalState", e2);
                        notifyOnError(256);
                    } catch (IllegalArgumentException e3) {
                        Log.e(TAG, "Failed to start preview session, IllegalArgument", e3);
                        notifyOnError(256);
                    }
                } else {
                    ArrayList arrayList2 = new ArrayList();
                    this.mParallelCaptureSurfaceList = prepareRemoteImageReader(arrayList2);
                    boolean isLocalParallelServiceReady = isLocalParallelServiceReady();
                    boolean isMTKPlatform = b.isMTKPlatform();
                    int size = this.mParallelCaptureSurfaceList.size();
                    int i4 = 0;
                    while (i4 < size) {
                        OutputConfiguration outputConfiguration2 = new OutputConfiguration((Surface) this.mParallelCaptureSurfaceList.get(i4));
                        if (isMTKPlatform && VERSION.SDK_INT >= 28 && this.mConfigs.getShotType() == 6 && this.mCapabilities.getFacing() == i2 && i4 < i3) {
                            int i5 = ((IImageReaderParameterSets) arrayList2.get(i4)).targetCamera;
                            if (i5 == 0) {
                                int mainBackCameraId = Camera2DataContainer.getInstance().getMainBackCameraId();
                                CompatibilityUtils.setPhysicalCameraId(outputConfiguration2, String.valueOf(mainBackCameraId));
                                String str = TAG;
                                StringBuilder sb = new StringBuilder();
                                sb.append("Binds main output stream to camera ");
                                sb.append(mainBackCameraId);
                                Log.d(str, sb.toString());
                            } else if (i5 == 1) {
                                CompatibilityUtils.setPhysicalCameraId(outputConfiguration2, String.valueOf(2));
                                String str2 = TAG;
                                StringBuilder sb2 = new StringBuilder();
                                sb2.append("Binds sub output stream to camera ");
                                i3 = 2;
                                sb2.append(2);
                                Log.d(str2, sb2.toString());
                            }
                            i3 = 2;
                        }
                        if (!isLocalParallelServiceReady) {
                            outputConfiguration2.enableSurfaceSharing();
                            String str3 = TAG;
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("add surface to deferredOutputConfig: ");
                            sb3.append(outputConfiguration2.getSurface());
                            Log.d(str3, sb3.toString());
                            this.mDeferOutputConfigurations.add(outputConfiguration2);
                        }
                        arrayList.add(outputConfiguration2);
                        i4++;
                        i2 = 1;
                    }
                }
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(1);
                this.mCaptureSession = null;
                if (z5) {
                    preparePreviewImageReader(this.mConfigs.getAlgorithmPreviewSize(), this.mConfigs.getAlgorithmPreviewFormat(), this.mConfigs.getPreviewMaxImages());
                    arrayList.add(new OutputConfiguration(this.mPreviewImageReader.getSurface()));
                }
                if (z6) {
                    prepareRawImageReader(this.mConfigs.getSensorRawImageSize(), z7);
                    arrayList.add(new OutputConfiguration(this.mRawImageReader.getSurface()));
                    String str4 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("startPreviewSession: needsRawStream = ");
                    sb4.append(z6);
                    sb4.append(", size = ");
                    sb4.append(this.mRawImageReader.getWidth());
                    sb4.append("x");
                    sb4.append(this.mRawImageReader.getHeight());
                    Log.d(str4, sb4.toString());
                    if (z7) {
                        int i6 = this.mConfigs.getSensorRawImageSize().width;
                        int i7 = this.mConfigs.getSensorRawImageSize().height;
                        inputConfiguration = new InputConfiguration(i6, i7, 32);
                        String str5 = TAG;
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("startPreviewSession: setup input configuration: w = ");
                        sb5.append(i6);
                        sb5.append(", h = ");
                        sb5.append(i7);
                        sb5.append(", fmt = ");
                        sb5.append(32);
                        Log.d(str5, sb5.toString());
                        this.mCaptureSessionStateCallback = new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback);
                        if (this.mPreviewSurface != null) {
                            CameraSize previewSize = getPreviewSize();
                            this.mFakeOutputTexture = new SurfaceTexture(false);
                            if (this.mSetRepeatingEarly) {
                                this.mFakeOutputTexture.setDefaultBufferSize(previewSize.width, previewSize.height);
                                Surface surface2 = new Surface(this.mFakeOutputTexture);
                                outputConfiguration = new OutputConfiguration(surface2);
                                outputConfiguration.enableSurfaceSharing();
                                this.mPreviewRequestBuilder.addTarget(surface2);
                            } else {
                                outputConfiguration = new OutputConfiguration(new Size(previewSize.width, previewSize.height), SurfaceHolder.class);
                            }
                            this.mDeferOutputConfigurations.add(0, outputConfiguration);
                            arrayList.add(0, outputConfiguration);
                        } else {
                            String str6 = TAG;
                            StringBuilder sb6 = new StringBuilder();
                            sb6.append("startPreviewSession: add preview surface to HAL: ");
                            sb6.append(this.mPreviewSurface);
                            sb6.append("->");
                            sb6.append(SurfaceUtils.getSurfaceSize(this.mPreviewSurface));
                            Log.d(str6, sb6.toString());
                            arrayList.add(0, new OutputConfiguration(this.mPreviewSurface));
                            this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                        }
                        if (!b.isMTKPlatform()) {
                            if (!z6 && !z7) {
                                VendorTagHelper.setValueQuietly(this.mPreviewRequestBuilder, CaptureRequestVendorTags.ZSL_CAPTURE_MODE, Integer.valueOf(1));
                            }
                            CompatibilityUtils.createCaptureSessionWithSessionConfiguration(this.mCameraDevice, i, inputConfiguration, arrayList, this.mPreviewRequestBuilder.build(), this.mCaptureSessionStateCallback, this.mCameraHandler);
                        } else {
                            this.mCameraDevice.createCustomCaptureSession(inputConfiguration, arrayList, i, this.mCaptureSessionStateCallback, this.mCameraHandler);
                        }
                    }
                }
                inputConfiguration = null;
                this.mCaptureSessionStateCallback = new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback);
                if (this.mPreviewSurface != null) {
                }
                if (!b.isMTKPlatform()) {
                }
            }
        }
    }

    public void startRecordPreview() {
        if (checkCameraDevice("startRecordPreview")) {
            Log.d(TAG, "startRecordPreview");
            synchronized (this.mVideoRecordStateLock) {
                this.mVideoRecordStateCallback = null;
            }
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    VendorTagHelper.setValue(this.mPreviewRequestBuilder, CaptureRequestVendorTags.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start record preview", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start record preview, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void startRecordSession(@NonNull Surface surface, @NonNull Surface surface2, boolean z, int i, CameraPreviewCallback cameraPreviewCallback) {
        List<Surface> list;
        if (checkCameraDevice("startRecordSession")) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("startRecordSession: previewSurface=");
            sb.append(surface);
            sb.append(" recordSurface=");
            sb.append(surface2);
            Log.d(str, sb.toString());
            this.mPreviewSurface = surface;
            this.mRecordSurface = surface2;
            this.mSessionId = genSessionId();
            this.mVideoSessionId = this.mSessionId;
            try {
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                if (this.mConfigs.isEISEnabled()) {
                    VendorTagHelper.setValue(this.mPreviewRequestBuilder, CaptureRequestVendorTags.VIDEO_RECORD_CONTROL, Integer.valueOf(0));
                }
                synchronized (this.mSessionLock) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("startRecordSession: reset session ");
                    sb2.append(this.mCaptureSession);
                    Log.d(str2, sb2.toString());
                    this.mCaptureSession = null;
                }
                if (z) {
                    prepareVideoSnapshotImageReader(this.mConfigs.getVideoSnapshotSize());
                    list = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface, this.mVideoSnapshotImageReader.getSurface()});
                } else {
                    list = Arrays.asList(new Surface[]{this.mPreviewSurface, this.mRecordSurface});
                }
                ArrayList arrayList = new ArrayList(list.size());
                for (Surface outputConfiguration : list) {
                    arrayList.add(new OutputConfiguration(outputConfiguration));
                }
                String str3 = TAG;
                StringBuilder sb3 = new StringBuilder();
                sb3.append("startRecordSession: operatingMode is ");
                sb3.append(Integer.toHexString(i));
                Log.d(str3, sb3.toString());
                if (!b.isMTKPlatform() || i != 32828) {
                    this.mCameraDevice.createCustomCaptureSession(null, arrayList, i, new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                } else {
                    VendorTagHelper.setValueQuietly(this.mPreviewRequestBuilder, CaptureRequestVendorTags.HFPSVR_MODE, Integer.valueOf(1));
                    Log.d(TAG, "startRecordSession: turns hpfsmode on");
                    CompatibilityUtils.createCaptureSessionWithSessionConfiguration(this.mCameraDevice, i, null, arrayList, this.mPreviewRequest, new CaptureSessionStateCallback(this.mSessionId, cameraPreviewCallback), this.mCameraHandler);
                }
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start recording session", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start recording session, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void startRecording() {
        if (checkCaptureSession("startRecording")) {
            try {
                Log.d(TAG, "E: startRecording");
                if (this.mConfigs.isEISEnabled()) {
                    setVideoRecordControl(1);
                }
                this.mPreviewRequestBuilder = this.mCameraDevice.createCaptureRequest(3);
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                this.mPreviewRequestBuilder.addTarget(this.mRecordSurface);
                applySettingsForVideo(this.mPreviewRequestBuilder);
                resumePreview();
                Log.d(TAG, "X: startRecording");
            } catch (CameraAccessException e) {
                Log.e(TAG, "Failed to start recording", e);
                notifyOnError(e.getReason());
            } catch (IllegalStateException e2) {
                Log.e(TAG, "Failed to start recording, IllegalState", e2);
                notifyOnError(256);
            }
        }
    }

    public void stopFaceDetection() {
        Log.v(TAG, "stopFaceDetection");
        this.mConfigs.setFaceDetectionEnabled(false);
        CaptureRequestBuilder.applyFaceDetection(this.mPreviewRequestBuilder, this.mConfigs);
    }

    public void stopObjectTrack() {
    }

    public void stopPreviewCallback(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("stopPreviewCallback(): isRelease = ");
        sb.append(z);
        Log.v(str, sb.toString());
        if (this.mIsPreviewCallbackEnabled && this.mIsPreviewCallbackStarted && this.mPreviewImageReader != null) {
            this.mIsPreviewCallbackStarted = false;
            setPreviewCallback(null);
            Surface surface = this.mPreviewImageReader.getSurface();
            this.mPreviewRequestBuilder.removeTarget(surface);
            surface.release();
            if (!z && checkCaptureSession("stopPreviewCallback")) {
                resumePreview();
            }
        }
    }

    public void stopRecording(VideoRecordStateCallback videoRecordStateCallback) {
        if (checkCaptureSession("stopRecording")) {
            Log.d(TAG, "stopRecording");
            if (this.mConfigs.isEISEnabled()) {
                synchronized (this.mVideoRecordStateLock) {
                    this.mVideoRecordStateCallback = videoRecordStateCallback;
                }
                try {
                    setVideoRecordControl(2);
                } catch (CameraAccessException e) {
                    e.printStackTrace();
                    Log.e(TAG, "Failed to stop recording");
                    notifyOnError(e.getReason());
                } catch (IllegalStateException e2) {
                    Log.e(TAG, "Failed to stop recording, IllegalState", e2);
                    notifyOnError(256);
                }
            }
        }
    }

    public void takePicture(@NonNull PictureCallback pictureCallback, @NonNull ParallelCallback parallelCallback) {
        Log.v(TAG, "takePicture");
        setPictureCallback(pictureCallback);
        setParallelCallback(parallelCallback);
        triggerCapture();
    }

    public void unRegisterCaptureCallback() {
        this.mFrontQuickCaptureCallback = null;
        Log.d(TAG, "unRegisterCaptureCallback");
    }

    public void unlockExposure() {
        if (checkCaptureSession("unlockExposure")) {
            this.mCaptureCallback.setState(1);
            setAELock(false);
            CaptureRequestBuilder.applyAELock(this.mPreviewRequestBuilder, false);
            resumePreview();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:47:0x00e5, code lost:
        return false;
     */
    public boolean updateDeferPreviewSession(Surface surface) {
        synchronized (this.mSessionLock) {
            if (this.mPreviewSurface == null) {
                this.mPreviewSurface = surface;
                this.mDeferPreviewSurface = surface;
            }
            if (this.mDeferOutputConfigurations.isEmpty()) {
                return true;
            }
            if (!(this.mCaptureSession == null || this.mPreviewSurface == null)) {
                if (!isLocalParallelServiceReady()) {
                    Log.d(TAG, "updateDeferPreviewSession: ParallelService is not ready");
                    this.mHelperHandler.removeMessages(2);
                    this.mHelperHandler.sendEmptyMessageDelayed(2, 10);
                    return false;
                }
                this.mPreviewRequestBuilder.addTarget(this.mPreviewSurface);
                try {
                    ArrayList arrayList = new ArrayList();
                    if (this.mFakeOutputTexture != null) {
                        OutputConfiguration outputConfiguration = (OutputConfiguration) this.mDeferOutputConfigurations.get(0);
                        this.mDeferOutputConfigurations.remove(0);
                        if (this.mSetRepeatingEarly) {
                            this.mPreviewRequestBuilder.removeTarget(outputConfiguration.getSurface());
                        }
                        outputConfiguration.addSurface(this.mPreviewSurface);
                        arrayList.add(outputConfiguration);
                    }
                    if (this.mEnableParallelSession && !this.mRemoteImageReaderList.isEmpty()) {
                        this.mParallelCaptureSurfaceList = prepareRemoteImageReader(null);
                        if (this.mParallelCaptureSurfaceList != null) {
                            for (int i = 0; i < this.mDeferOutputConfigurations.size(); i++) {
                                OutputConfiguration outputConfiguration2 = (OutputConfiguration) this.mDeferOutputConfigurations.get(i);
                                outputConfiguration2.addSurface((Surface) this.mParallelCaptureSurfaceList.get(i));
                                arrayList.add(outputConfiguration2);
                            }
                        }
                    }
                    this.mCaptureSession.finalizeOutputConfigurations(arrayList);
                    Log.d(TAG, "updateDeferPreviewSession: finalizeOutputConfigurations success");
                } catch (Exception e) {
                    Log.e(TAG, "updateDeferPreviewSession: finalizeOutputConfigurations failed", e);
                }
                for (ImageReader close : this.mRemoteImageReaderList) {
                    close.close();
                }
                this.mRemoteImageReaderList.clear();
                this.mDeferOutputConfigurations.clear();
                if (this.mCaptureSessionStateCallback != null) {
                    this.mCaptureSessionStateCallback.onPreviewSessionSuccess();
                }
            }
        }
    }

    public void updateFrameNumber(long j) {
        this.mCurrentFrameNum = j;
    }

    /* access modifiers changed from: protected */
    public boolean useLegacyFlashStrategy() {
        return false;
    }
}
