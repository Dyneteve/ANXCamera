package com.android.camera.module.loader.camera2;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraDevice;
import android.hardware.camera2.CameraDevice.StateCallback;
import android.hardware.camera2.CameraManager;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import com.android.camera.CameraAppImpl;
import com.android.camera.CameraSettings;
import com.android.camera.constant.ExceptionConstant;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.log.Log;
import com.android.camera.module.ModuleManager;
import com.android.camera2.Camera2Proxy;
import com.android.camera2.Camera2Proxy.CaptureBusyCallback;
import com.android.camera2.CameraCapabilities;
import com.android.camera2.MiCamera2;
import io.reactivex.Observable;
import io.reactivex.ObservableEmitter;
import io.reactivex.ObservableOnSubscribe;
import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.functions.Function;
import io.reactivex.observables.ConnectableObservable;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

@SuppressLint({"MissingPermission"})
@TargetApi(21)
public class Camera2OpenManager {
    private static final long CAMERA_OPEN_OR_CLOSE_TIMEOUT = 5000;
    private static final int MANAGER_MSG_CLOSE_CAMERA_AFTER_CAPTURE = 5;
    private static final int MANAGER_MSG_CLOSE_FINISH = 3;
    private static final int MANAGER_MSG_FORCE_CLOSE_CAMERA = 2;
    private static final int MANAGER_MSG_OPEN_FINISH = 4;
    private static final int MANAGER_MSG_REQUEST_CAMERA = 1;
    private static final int MANAGER_STATE_IDLE = 1;
    private static final int MANAGER_STATE_WAITING_CLOSE = 2;
    private static final int MANAGER_STATE_WAITING_OPEN = 3;
    /* access modifiers changed from: private */
    public static final String TAG = Camera2OpenManager.class.getSimpleName();
    private static Camera2OpenManager sInstance;
    /* access modifiers changed from: private */
    public Camera2Proxy mCamera2Device;
    /* access modifiers changed from: private */
    public Handler mCameraHandler;
    private Handler mCameraMainThreadHandler;
    private CameraManager mCameraManager;
    private final StateCallback mCameraOpenCallback = new StateCallback() {
        public void onClosed(@NonNull CameraDevice cameraDevice) {
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("CameraOpenCallback: closed ");
            sb.append(cameraDevice.getId());
            Log.d(access$200, sb.toString());
            Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(3);
        }

        public void onDisconnected(@NonNull CameraDevice cameraDevice) {
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("CameraOpenCallback: onDisconnected ");
            sb.append(cameraDevice.getId());
            Log.d(access$200, sb.toString());
            if (Camera2OpenManager.this.mCamera2Device != null) {
                Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(2);
            }
        }

        public void onError(@NonNull CameraDevice cameraDevice, int i) {
            StringBuilder sb = new StringBuilder();
            sb.append("onError: cameraId=");
            sb.append(cameraDevice.getId());
            sb.append(" error=");
            sb.append(i);
            String sb2 = sb.toString();
            String access$200 = Camera2OpenManager.TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("CameraOpenCallback: ");
            sb3.append(sb2);
            Log.e(access$200, sb3.toString());
            Camera2OpenManager.this.onCameraOpenFailed(ExceptionConstant.transFromCamera2Error(i), sb2);
        }

        public void onOpened(@NonNull CameraDevice cameraDevice) {
            int parseInt = Integer.parseInt(cameraDevice.getId());
            CameraCapabilities capabilities = Camera2DataContainer.getInstance().getCapabilities(parseInt);
            StringBuilder sb = new StringBuilder();
            sb.append("CameraOpenCallback: camera ");
            sb.append(parseInt);
            sb.append(" was opened successfully");
            String sb2 = sb.toString();
            if (capabilities != null) {
                Camera2OpenManager camera2OpenManager = Camera2OpenManager.this;
                MiCamera2 miCamera2 = new MiCamera2(cameraDevice, parseInt, capabilities, Camera2OpenManager.this.getCameraHandler(), Camera2OpenManager.this.getCameraMainThreadHandler());
                camera2OpenManager.mCamera2Device = miCamera2;
                Camera2DataContainer.getInstance().setCurrentOpenedCameraId(parseInt);
                Log.d(Camera2OpenManager.TAG, sb2);
                Camera2OpenManager.this.mCameraHandler.sendEmptyMessage(4);
                return;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append(sb2);
            sb3.append(", but corresponding CameraCapabilities is null");
            String sb4 = sb3.toString();
            Log.e(Camera2OpenManager.TAG, sb4);
            Camera2OpenManager.this.onCameraOpenFailed(231, sb4);
        }
    };
    /* access modifiers changed from: private */
    public ObservableEmitter<Camera2Result> mCameraResultEmitter;
    private ConnectableObservable<Camera2Result> mCameraResultObservable;
    private AtomicInteger mCurrentModule = new AtomicInteger(160);
    private int mCurrentState = 1;
    private final Object mEmitterLock = new Object();
    private AtomicInteger mPendingCameraId = new AtomicInteger(-1);

    @interface ManagerState {
    }

    private Camera2OpenManager() {
        initData();
    }

    private void abandonOpenObservableIfExists() {
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null && !this.mCameraResultEmitter.isDisposed()) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(225));
                this.mCameraResultEmitter.onComplete();
                this.mCameraResultEmitter = null;
            }
        }
    }

    private boolean attachInObservable(Observer<Camera2Result> observer) {
        boolean z;
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                if (!this.mCameraResultEmitter.isDisposed()) {
                    this.mCameraResultObservable.subscribe(observer);
                    z = true;
                }
            }
            this.mCameraResultObservable = Observable.create(new ObservableOnSubscribe<Camera2Result>() {
                public void subscribe(ObservableEmitter<Camera2Result> observableEmitter) {
                    Camera2OpenManager.this.mCameraResultEmitter = observableEmitter;
                }
            }).timeout(getCameraOpTimeout(), TimeUnit.MILLISECONDS).onErrorResumeNext((Function<? super Throwable, ? extends ObservableSource<? extends T>>) new Function<Throwable, ObservableSource<Camera2Result>>() {
                public ObservableSource<Camera2Result> apply(Throwable th) {
                    String access$200 = Camera2OpenManager.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("Exception occurs in camera open or close: ");
                    sb.append(th);
                    Log.d(access$200, sb.toString());
                    if (!Camera2OpenManager.this.mCameraHandler.getLooper().getQueue().isPolling()) {
                        Log.d(Camera2OpenManager.TAG, "CameraHandlerThread is being stuck...");
                    }
                    return Observable.just(Camera2Result.create(3).setCameraError(236));
                }
            }).observeOn(GlobalConstant.sCameraSetupScheduler).publish();
            this.mCameraResultObservable.subscribe(observer);
            this.mCameraResultObservable.connect();
            z = false;
        }
        return z;
    }

    private long getCameraOpTimeout() {
        return (this.mCamera2Device == null || !ModuleManager.isManualModule()) ? CAMERA_OPEN_OR_CLOSE_TIMEOUT : CAMERA_OPEN_OR_CLOSE_TIMEOUT + (CameraSettings.getExposureTime() / 1000000);
    }

    public static synchronized Camera2OpenManager getInstance() {
        Camera2OpenManager camera2OpenManager;
        synchronized (Camera2OpenManager.class) {
            if (sInstance == null) {
                sInstance = new Camera2OpenManager();
            }
            camera2OpenManager = sInstance;
        }
        return camera2OpenManager;
    }

    @ManagerState
    private int getManagerState() {
        return this.mCurrentState;
    }

    private void initData() {
        HandlerThread handlerThread = new HandlerThread("Camera Handler Thread");
        handlerThread.start();
        this.mCameraHandler = new Handler(handlerThread.getLooper()) {
            public void handleMessage(Message message) {
                Camera2OpenManager.this.onMessage(message);
            }
        };
        this.mCameraMainThreadHandler = new Handler(Looper.getMainLooper());
        this.mCameraManager = (CameraManager) CameraAppImpl.getAndroidContext().getSystemService("camera");
        Camera2DataContainer.getInstance(this.mCameraManager);
    }

    public static /* synthetic */ void lambda$release$0(Camera2OpenManager camera2OpenManager, boolean z, boolean z2) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("release onCaptureCompleted: success:");
        sb.append(z2);
        sb.append(" immediate:");
        sb.append(z);
        Log.d(str, sb.toString());
        if (z) {
            camera2OpenManager.mCameraHandler.sendMessage(camera2OpenManager.mCameraHandler.obtainMessage(5));
        }
    }

    /* access modifiers changed from: private */
    public void onCameraOpenFailed(int i, String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onCameraOpenFailed: ");
        sb.append(i);
        sb.append(" msg:");
        sb.append(str);
        Log.e(str2, sb.toString());
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(3).setCameraError(i));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }

    private void onCameraOpenSuccess() {
        setManagerState(1);
        synchronized (this.mEmitterLock) {
            if (this.mCameraResultEmitter != null) {
                this.mCameraResultEmitter.onNext(Camera2Result.create(2));
                this.mCameraResultEmitter.onComplete();
            }
        }
    }

    /* access modifiers changed from: private */
    public void onMessage(Message message) {
        switch (message.what) {
            case 1:
                if (this.mCamera2Device != null) {
                    this.mCamera2Device.setCaptureBusyCallback(null);
                }
                if (this.mPendingCameraId.get() < 0) {
                    if (this.mCamera2Device != null) {
                        setManagerState(2);
                        Log.e(TAG, "close start");
                        this.mCamera2Device.close();
                        this.mCamera2Device = null;
                        return;
                    }
                    return;
                } else if (this.mCamera2Device != null && this.mCamera2Device.getId() == this.mPendingCameraId.get()) {
                    this.mCameraHandler.removeMessages(5);
                    StringBuilder sb = new StringBuilder();
                    sb.append("Camera ");
                    sb.append(this.mCamera2Device.getId());
                    sb.append(" was opened successfully");
                    String sb2 = sb.toString();
                    if (this.mCamera2Device.getCapabilities() == null) {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(sb2);
                        sb3.append(", but corresponding CameraCapabilities is null");
                        String sb4 = sb3.toString();
                        Log.d(TAG, sb4);
                        onCameraOpenFailed(231, sb4);
                        return;
                    }
                    Log.d(TAG, sb2);
                    if (!DataRepository.dataItemFeature().gh()) {
                        this.mCamera2Device.cancelSession();
                    }
                    onCameraOpenSuccess();
                    return;
                } else if (this.mCamera2Device != null) {
                    setManagerState(2);
                    Log.d(TAG, "close start");
                    this.mCamera2Device.close();
                    this.mCamera2Device = null;
                    return;
                } else if (getManagerState() == 1) {
                    try {
                        setManagerState(3);
                        Log.d(TAG, "open start");
                        this.mCameraManager.openCamera(String.valueOf(this.mPendingCameraId), this.mCameraOpenCallback, this.mCameraHandler);
                        return;
                    } catch (CameraAccessException | IllegalArgumentException | SecurityException e) {
                        e.printStackTrace();
                        onCameraOpenFailed(230, e.getClass().getSimpleName());
                        String str = TAG;
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append("openCamera: failed to open camera ");
                        sb5.append(this.mPendingCameraId.get());
                        Log.e(str, sb5.toString(), e);
                        return;
                    }
                } else {
                    return;
                }
            case 2:
            case 5:
                if (this.mCamera2Device == null) {
                    this.mCameraHandler.sendEmptyMessage(1);
                    return;
                } else if (getManagerState() == 1) {
                    setManagerState(2);
                    Log.e(TAG, "force close start");
                    this.mCamera2Device.releasePreview();
                    this.mCamera2Device.resetConfigs();
                    this.mCamera2Device.close();
                    this.mCamera2Device = null;
                    return;
                } else {
                    return;
                }
            case 3:
                Log.e(TAG, "close finish");
                setManagerState(1);
                this.mCameraHandler.sendEmptyMessage(1);
                return;
            case 4:
                Log.e(TAG, "open finish");
                setManagerState(1);
                this.mCameraHandler.sendEmptyMessage(1);
                return;
            default:
                return;
        }
    }

    public static void preload() {
        Log.i(TAG, "preload");
    }

    private void setManagerState(@ManagerState int i) {
        this.mCurrentState = i;
    }

    public Handler getCameraHandler() {
        return this.mCameraHandler;
    }

    public Handler getCameraMainThreadHandler() {
        return this.mCameraMainThreadHandler;
    }

    public Camera2Proxy getCurrentCamera2Device() {
        return this.mCamera2Device;
    }

    public int getPendingCameraId() {
        return this.mPendingCameraId.get();
    }

    public void openCamera(int i, int i2, Observer<Camera2Result> observer, boolean z) {
        int actualOpenCameraId = Camera2DataContainer.getInstance().getActualOpenCameraId(i, i2);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("openCamera: pendingOpenId = ");
        sb.append(actualOpenCameraId);
        sb.append(", mPendingCameraId = ");
        sb.append(this.mPendingCameraId.get());
        sb.append(", currentMode = ");
        sb.append(i2);
        sb.append(", mCurrentModule = ");
        sb.append(this.mCurrentModule.get());
        sb.append(", forceClose = ");
        sb.append(z);
        Log.d(str, sb.toString());
        if (!(this.mPendingCameraId.get() == actualOpenCameraId && this.mCurrentModule.get() == i2)) {
            this.mCameraHandler.removeCallbacksAndMessages(null);
            this.mPendingCameraId.set(actualOpenCameraId);
            this.mCurrentModule.set(i2);
            abandonOpenObservableIfExists();
        }
        attachInObservable(observer);
        if (z) {
            this.mCameraHandler.sendEmptyMessage(2);
        } else {
            this.mCameraHandler.sendEmptyMessage(1);
        }
    }

    public void release(boolean z) {
        abandonOpenObservableIfExists();
        this.mPendingCameraId.set(-1);
        this.mCameraHandler.removeCallbacksAndMessages(null);
        this.mCurrentModule.set(160);
        setManagerState(1);
        this.mCamera2Device.setCaptureBusyCallback(new CaptureBusyCallback(z) {
            private final /* synthetic */ boolean f$1;

            {
                this.f$1 = r2;
            }

            public final void onCaptureCompleted(boolean z) {
                Camera2OpenManager.lambda$release$0(Camera2OpenManager.this, this.f$1, z);
            }
        });
    }
}
