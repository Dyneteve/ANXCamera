package com.android.camera;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.ServiceConnection;
import android.database.ContentObserver;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IPowerManager;
import android.os.IPowerManager.Stub;
import android.os.Looper;
import android.os.Message;
import android.os.ServiceManager;
import android.os.SystemClock;
import android.os.SystemProperties;
import android.provider.MiuiSettings.ScreenEffect;
import android.support.annotation.MainThread;
import android.support.v4.app.ActivityCompat.OnRequestPermissionsResultCallback;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.provider.DocumentFile;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.Window;
import android.view.WindowManager.LayoutParams;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.android.camera.LocalParallelService.LocalBinder;
import com.android.camera.constant.GlobalConstant;
import com.android.camera.data.DataRepository;
import com.android.camera.data.data.global.DataItemGlobal;
import com.android.camera.effect.EffectController;
import com.android.camera.fragment.BaseFragmentDelegate;
import com.android.camera.fragment.FragmentUtils;
import com.android.camera.fragment.dialog.AiSceneNewbieDialogFragment;
import com.android.camera.fragment.dialog.FrontRotateNewbieDialogFragment;
import com.android.camera.fragment.dialog.HibernationFragment;
import com.android.camera.fragment.dialog.LensDirtyDetectDialogFragment;
import com.android.camera.fragment.dialog.PortraitNewbieDialogFragment;
import com.android.camera.fragment.dialog.UltraWideNewbieDialogFragment;
import com.android.camera.fragment.lifeCircle.BaseLifecycleListener;
import com.android.camera.fragment.music.FragmentLiveMusic;
import com.android.camera.fragment.top.FragmentTopAlert;
import com.android.camera.fragment.top.FragmentTopConfig;
import com.android.camera.lib.compatibility.util.CompatibilityUtils;
import com.android.camera.log.Log;
import com.android.camera.module.BaseModule;
import com.android.camera.module.Module;
import com.android.camera.module.ModuleManager;
import com.android.camera.module.impl.ImplFactory;
import com.android.camera.module.loader.FunctionCameraLegacySetup;
import com.android.camera.module.loader.FunctionCameraPrepare;
import com.android.camera.module.loader.FunctionDataSetup;
import com.android.camera.module.loader.FunctionModuleSetup;
import com.android.camera.module.loader.FunctionResumeModule;
import com.android.camera.module.loader.FunctionUISetup;
import com.android.camera.module.loader.NullHolder;
import com.android.camera.module.loader.StartControl;
import com.android.camera.module.loader.camera2.Camera2OpenManager;
import com.android.camera.module.loader.camera2.Camera2OpenOnSubScribe;
import com.android.camera.module.loader.camera2.Camera2Result;
import com.android.camera.module.loader.camera2.CompletablePreFixCamera2Setup;
import com.android.camera.parallel.AlgoConnector;
import com.android.camera.permission.PermissionManager;
import com.android.camera.protocol.ModeCoordinatorImpl;
import com.android.camera.protocol.ModeProtocol.ActionProcessing;
import com.android.camera.protocol.ModeProtocol.BaseProtocol;
import com.android.camera.protocol.ModeProtocol.MainContentProtocol;
import com.android.camera.protocol.ModeProtocol.TopAlert;
import com.android.camera.statistic.CameraStat;
import com.android.camera.statistic.CameraStatUtil;
import com.android.camera.statistic.ScenarioTrackUtil;
import com.android.camera.storage.ImageSaver;
import com.android.camera.storage.PriorityStorageBroadcastReceiver;
import com.android.camera.storage.Storage;
import com.android.camera.ui.CameraRootView;
import com.android.camera.ui.V6CameraGLSurfaceView;
import com.android.camera.ui.V6GestureRecognizer;
import com.android.camera.ui.V9EdgeShutterView;
import com.android.camera2.Camera2Proxy;
import com.android.lens.LensAgent;
import com.mi.config.b;
import com.ss.android.ugc.effectmanager.effect.model.ComposerHelper;
import io.reactivex.Completable;
import io.reactivex.Single;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.annotations.NonNull;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.BiFunction;
import io.reactivex.functions.Consumer;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import miui.hardware.display.DisplayFeatureManager;
import miui.os.Build;

public class Camera extends ActivityBase implements OnRequestPermissionsResultCallback, BaseLifecycleListener, BaseProtocol {
    private static final int PERMISSION_REQUEST_CODE = 1;
    private static final int PERMISSION_RESULT_CODE = 2308;
    /* access modifiers changed from: private */
    public static final String TAG = Camera.class.getSimpleName();
    /* access modifiers changed from: private */
    public BaseFragmentDelegate mBaseFragmentDelegate;
    private Camera2OpenOnSubScribe mCamera2OpenOnSubScribe;
    private BiFunction mCameraOpenResult = new BiFunction<NullHolder<BaseModule>, Camera2Result, NullHolder<BaseModule>>() {
        public NullHolder<BaseModule> apply(@NonNull NullHolder<BaseModule> nullHolder, @NonNull Camera2Result camera2Result) throws Exception {
            int result = camera2Result.getResult();
            String access$500 = Camera.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("mCameraOpenResult apply : result = ");
            sb.append(result);
            Log.d(access$500, sb.toString());
            switch (result) {
                case 3:
                    if (nullHolder.isPresent()) {
                        ((BaseModule) nullHolder.get()).setDeparted();
                    }
                    Camera.this.showCameraError(camera2Result.getCameraError());
                    break;
            }
            return nullHolder;
        }
    };
    private Disposable mCameraPendingSetupDisposable;
    private final Object mCameraPendingSetupDisposableGuard = new Object();
    private Consumer<NullHolder<BaseModule>> mCameraSetupConsumer = new Consumer<NullHolder<BaseModule>>() {
        public void accept(@NonNull NullHolder<BaseModule> nullHolder) throws Exception {
            if (!nullHolder.isPresent()) {
                Camera.this.showCameraError(nullHolder.getException());
                Camera.this.mCurrentModule = null;
            } else {
                V6GestureRecognizer.getInstance(Camera.this).setCurrentModule((Module) nullHolder.get());
            }
            Camera.this.getCameraScreenNail().resetFrameAvailableFlag();
            Camera.this.setSwitchingModule(false);
            synchronized (Camera.this.mCameraSetupDisposableGuard) {
                Camera.this.mCameraSetupDisposable = null;
            }
            DataRepository.dataCloudMgr().fillCloudValues();
            AutoLockManager.getInstance(Camera.this).hibernateDelayed();
            Camera.this.showFirstUseHintIfNeeded();
            Log.d(Camera.TAG, "cameraSetupConsumer#accept switch module done.");
        }
    };
    /* access modifiers changed from: private */
    public Disposable mCameraSetupDisposable;
    /* access modifiers changed from: private */
    public final Object mCameraSetupDisposableGuard = new Object();
    private LogThread mDebugThread;
    private boolean mDidRegister;
    private DisplayFeatureManager mDisplayFeatureManager;
    /* access modifiers changed from: private */
    public boolean mFirstOrientationArrived;
    /* access modifiers changed from: private */
    public boolean mHasFocus;
    private boolean mHasbeenSetupOnFocusChanged = false;
    private ImageSaver mImageSaver;
    private ImplFactory mImplFactory;
    private boolean mIsGalleryServiceBound = false;
    private boolean mIsModeSwitched;
    private boolean mIsScreenSlideOff;
    private int mLastIgnoreKey = -1;
    private long mLastKeyDownEventTime = 0;
    private long mLastKeyUpEventTime = 0;
    private MyOrientationEventListener mOrientationListener;
    private int mPendingScreenSlideKeyCode;
    private IPowerManager mPowerManager;
    private ProximitySensorLock mProximitySensorLock;
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (!Camera.this.mCurrentModule.isDeparted()) {
                Camera.this.mCurrentModule.onBroadcastReceived(context, intent);
            }
        }
    };
    private BroadcastReceiver mSDReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            if (!Camera.this.mCurrentModule.isDeparted()) {
                Camera.this.mCurrentModule.onBroadcastReceived(context, intent);
            }
        }
    };
    private ContentObserver mScreenSlideStatusObserver = new ContentObserver(this.mHandler) {
        public boolean deliverSelfNotifications() {
            return true;
        }

        public void onChange(boolean z) {
            super.onChange(z);
            if (!Camera.this.mHasFocus && !Camera.this.mActivityPaused) {
                int i = Util.isScreenSlideOff(Camera.this) ? Util.KEYCODE_SLIDE_OFF : Util.KEYCODE_SLIDE_ON;
                String access$500 = Camera.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("focus lost, try key code: ");
                sb.append(i);
                Log.d(access$500, sb.toString());
                Camera.this.onKeyDown(i, new KeyEvent(0, i));
            }
        }
    };
    private SensorStateManager mSensorStateManager;
    private ServiceConnection mServiceConnection = new ServiceConnection() {
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        }

        public void onServiceDisconnected(ComponentName componentName) {
        }
    };
    private StartControl mStartControl;
    /* access modifiers changed from: private */
    public volatile int mTick;
    private Thread mWatchDog;
    private String newbieDialogFragmentTag = null;
    /* access modifiers changed from: private */
    public final Runnable tickerRunnable = new Runnable() {
        public void run() {
            Camera.this.mTick = (Camera.this.mTick + 1) % 10;
        }
    };

    class LogThread extends Thread {
        private volatile boolean mRunFlag = true;

        LogThread() {
        }

        public void run() {
            while (this.mRunFlag) {
                try {
                    Thread.sleep(10);
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.mHandler.obtainMessage(0, Util.getDebugInfo()).sendToTarget();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    return;
                }
            }
        }

        public void setRunFlag(boolean z) {
            this.mRunFlag = z;
        }
    }

    private class MyOrientationEventListener extends OrientationEventListener {
        public MyOrientationEventListener(Context context) {
            super(context);
        }

        public void onOrientationChanged(int i) {
            if (i != -1) {
                Camera.this.mOrientation = Util.roundOrientation(i, Camera.this.mOrientation);
                if (!Camera.this.mFirstOrientationArrived) {
                    Camera.this.mFirstOrientationArrived = true;
                    String access$500 = Camera.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onOrientationChanged: first orientation is arrived... , orientation = ");
                    sb.append(i);
                    sb.append(", mOrientation = ");
                    sb.append(Camera.this.mOrientation);
                    Log.d(access$500, sb.toString());
                }
                int displayRotation = Util.getDisplayRotation(Camera.this);
                if (displayRotation != Camera.this.mDisplayRotation) {
                    Camera.this.mDisplayRotation = displayRotation;
                    Camera.this.onDisplayRotationChanged();
                }
                Camera.this.mOrientationCompensation = (Camera.this.mOrientation + Camera.this.mDisplayRotation) % ScreenEffect.SCREEN_PAPER_MODE_TWILIGHT_START_DEAULT;
                if (Camera.this.mCurrentModule != null) {
                    Camera.this.mCurrentModule.onOrientationChanged(Camera.this.mOrientation, Camera.this.mOrientationCompensation, i);
                }
                Camera.this.mBaseFragmentDelegate.getAnimationComposite().disposeRotation(Camera.this.mOrientationCompensation);
            }
        }
    }

    private class WatchDogThread extends Thread {
        private static final String TAG = "WatchDogThread";
        private static final int TIMEOUT_INTERVAL = 5000;

        private WatchDogThread() {
        }

        public void run() {
            setName("ANR-WatchDog");
            while (!isInterrupted()) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("watch dog run ");
                sb.append(Thread.currentThread().getId());
                Log.v(str, sb.toString());
                int access$000 = Camera.this.mTick;
                Camera.this.mHandler.post(Camera.this.tickerRunnable);
                try {
                    Thread.sleep(5000);
                    if (Camera.this.mTick == access$000) {
                        if (b.hQ()) {
                            CameraSettings.setEdgeMode(Camera.this, false);
                        }
                        Camera.this.setBrightnessRampRate(-1);
                        Camera.this.setScreenEffect(false);
                        if (Util.sIsKillCameraService && DataRepository.dataItemFeature().gk() && SystemClock.elapsedRealtime() - CameraSettings.getBroadcastKillServiceTime() > 60000) {
                            Util.broadcastKillService(Camera.this);
                        }
                        return;
                    }
                } catch (InterruptedException e) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("watch dog InterruptedException ");
                    sb2.append(Thread.currentThread().getId());
                    Log.e(str2, sb2.toString());
                    return;
                }
            }
        }
    }

    private void bindServices() {
        try {
            Intent intent = new Intent(Util.ACTION_BIND_GALLERY_SERVICE);
            intent.setPackage(Util.REVIEW_ACTIVITY_PACKAGE);
            bindService(intent, this.mServiceConnection, 5);
            this.mIsGalleryServiceBound = true;
        } catch (Exception e) {
            Log.w(TAG, "bindServices error.", e);
        }
    }

    private void boostParallelServiceAdj() {
        LocalBinder localBinder = AlgoConnector.getInstance().getLocalBinder();
        Camera2Proxy currentCamera2Device = Camera2OpenManager.getInstance().getCurrentCamera2Device();
        boolean z = ((CameraSettings.isCameraParallelProcessEnable() && localBinder != null && !localBinder.isIdle()) || ((currentCamera2Device != null && currentCamera2Device.isCaptureBusy(true)) || (this.mImageSaver != null && this.mImageSaver.isPendingSave()))) && !this.mCameraIntentManager.isImageCaptureIntent();
        if (z) {
            try {
                Log.d(TAG, "boostParallelServiceAdj");
                Class.forName("miui.process.ProcessManager").getDeclaredMethod("adjBoost", new Class[]{String.class, Integer.TYPE, Long.TYPE, Integer.TYPE}).invoke(null, new Object[]{"com.android.camera", Integer.valueOf(0), Long.valueOf(60000), Integer.valueOf(((Integer) Class.forName("android.os.UserHandle").getMethod("myUserId", new Class[0]).invoke(null, new Object[0])).intValue())});
            } catch (ClassNotFoundException | IllegalAccessException | NoSuchMethodException | InvocationTargetException e) {
                Log.e(TAG, e.getMessage(), e);
            }
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0033, code lost:
        return false;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean closeCameraSetup() {
        synchronized (this.mCameraPendingSetupDisposableGuard) {
            if (this.mCameraPendingSetupDisposable != null && !this.mCameraPendingSetupDisposable.isDisposed()) {
                this.mCameraPendingSetupDisposable.dispose();
                this.mCameraPendingSetupDisposable = null;
            }
        }
        synchronized (this.mCameraSetupDisposableGuard) {
            if (this.mCameraSetupDisposable != null && !this.mCameraSetupDisposable.isDisposed()) {
                this.mCameraSetupDisposable.dispose();
                this.mCameraSetupDisposable = null;
                return true;
            }
        }
    }

    private Module createNewModule(int i) {
        Module moduleByIndex = ModuleManager.getModuleByIndex(i);
        if (moduleByIndex != null) {
            moduleByIndex.setActivity(this);
            moduleByIndex.preTransferOrientation(this.mOrientation, this.mOrientationCompensation);
            return moduleByIndex;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("invalid module index ");
        sb.append(i);
        throw new RuntimeException(sb.toString());
    }

    private boolean currentIsMainThread() {
        return Looper.getMainLooper() == Looper.myLooper();
    }

    private void hideHibernationFragment() {
        Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(HibernationFragment.TAG);
        if (findFragmentByTag != null && (findFragmentByTag instanceof DialogFragment)) {
            ((DialogFragment) findFragmentByTag).dismissAllowingStateLoss();
        }
    }

    private boolean isFromKeyguard() {
        Intent intent = getIntent();
        boolean z = false;
        if (intent == null) {
            return false;
        }
        if (TextUtils.equals(intent.getAction(), "android.media.action.STILL_IMAGE_CAMERA") && getKeyguardFlag()) {
            z = true;
        }
        return z;
    }

    public static /* synthetic */ void lambda$releaseAll$0(Camera camera, boolean z, boolean z2) {
        int hashCode = camera.hashCode();
        if (camera.isCurrentModuleAlive()) {
            Module module = camera.mCurrentModule;
            DataRepository.getInstance().backUp().backupRunning(DataRepository.dataItemRunning(), DataRepository.dataItemGlobal().getDataBackUpKey(camera.getCurrentModuleIndex()), DataRepository.dataItemGlobal().getCurrentCameraId(), false);
            if (ModeCoordinatorImpl.isAlive(hashCode)) {
                module.unRegisterProtocol();
                module.unRegisterModulePersistProtocol();
            }
            module.onPause();
            module.onStop();
            module.onDestroy();
        }
        if (z) {
            boolean containsResumedCameraInStack = camera.mApplication.containsResumedCameraInStack();
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("start releaseCameraDevice: ");
            sb.append(!containsResumedCameraInStack);
            Log.d(str, sb.toString());
            if (!containsResumedCameraInStack) {
                Camera2OpenManager.getInstance().release(z2);
                camera.releaseCameraScreenNail();
            } else {
                Log.d(TAG, "Camera2OpenManager release ignored.");
            }
        }
        DataRepository.dataItemGlobal().resetTimeOut();
    }

    /* access modifiers changed from: private */
    public void onDisplayRotationChanged() {
        if (b.im()) {
            FrontRotateNewbieDialogFragment frontRotateNewbieDialogFragment = (FrontRotateNewbieDialogFragment) getSupportFragmentManager().findFragmentByTag(FrontRotateNewbieDialogFragment.TAG);
            if (frontRotateNewbieDialogFragment != null) {
                frontRotateNewbieDialogFragment.animateOut(0);
            }
        }
    }

    private void prefixCamera2Setup() {
        CompletablePreFixCamera2Setup completablePreFixCamera2Setup = new CompletablePreFixCamera2Setup(null, null, null, getIntent(), startFromSecureKeyguard(), this.mCameraIntentManager.checkCallerLegality());
        Completable.create(completablePreFixCamera2Setup).subscribeOn(GlobalConstant.sCameraSetupScheduler).subscribe();
    }

    private final void registerReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction(CameraIntentManager.ACTION_VOICE_CONTROL);
        registerReceiver(this.mReceiver, intentFilter);
        this.mDidRegister = true;
    }

    private void registerSDReceiver() {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.MEDIA_EJECT");
        intentFilter.addAction("android.intent.action.MEDIA_MOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_UNMOUNTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_STARTED");
        intentFilter.addAction("android.intent.action.MEDIA_SCANNER_FINISHED");
        intentFilter.addDataScheme(ComposerHelper.COMPOSER_PATH);
        registerReceiver(this.mSDReceiver, intentFilter);
    }

    private void resumeCamera() {
        int i;
        Log.d(TAG, "resumeCamera: E");
        if (!isSwitchingModule()) {
            if (!ModeCoordinatorImpl.isAlive(hashCode())) {
                Log.d(TAG, "resumeCamera: module is obsolete");
                unRegisterProtocol();
                registerProtocol();
            } else {
                DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
                boolean checkCallerLegality = this.mCameraIntentManager.checkCallerLegality();
                int i2 = 1;
                boolean z = false;
                if (this.mJumpedToGallery) {
                    Log.d(TAG, "resumeCamera: jumpedToGallery");
                    this.mJumpedToGallery = false;
                } else {
                    int intentType = dataItemGlobal.getIntentType();
                    dataItemGlobal.parseIntent(getIntent(), Boolean.valueOf(checkCallerLegality), startFromSecureKeyguard(), false, true);
                    int intentType2 = dataItemGlobal.getIntentType();
                    if (intentType != 0) {
                        if (this.mCurrentModule != null && this.mCurrentModule.isSelectingCapturedResult()) {
                            z = true;
                        }
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("resumeCamera: lastType=");
                        sb.append(intentType);
                        sb.append(" curType=");
                        sb.append(intentType2);
                        sb.append(" captureFinish=");
                        sb.append(z);
                        Log.d(str, sb.toString());
                        if (intentType == intentType2 && z) {
                            resumeCurrentMode(dataItemGlobal.getCurrentMode());
                            return;
                        } else if (z) {
                            this.mBaseFragmentDelegate.delegateEvent(6);
                        }
                    } else {
                        String str2 = TAG;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("resumeCamera: lastType=");
                        sb2.append(intentType);
                        Log.d(str2, sb2.toString());
                        if (this.mReleaseByModule) {
                            this.mReleaseByModule = false;
                            return;
                        }
                    }
                    if (dataItemGlobal.isTimeOut()) {
                        FragmentUtils.removeFragmentByTag(getSupportFragmentManager(), FragmentLiveMusic.TAG);
                        i = 3;
                        if (checkCallerLegality && i != 3) {
                            i2 = 2;
                        }
                        onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(i).setViewConfigType(i2));
                    }
                }
                i = 2;
                i2 = 2;
                onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(i).setViewConfigType(i2));
            }
            Log.d(TAG, "resumeCamera: X");
        }
    }

    /* access modifiers changed from: private */
    public void setBrightnessRampRate(int i) {
        CompatibilityUtils.setBrightnessRampRate(this.mPowerManager, i);
    }

    /* access modifiers changed from: private */
    public void setScreenEffect(boolean z) {
        if (this.mDisplayFeatureManager != null) {
            this.mDisplayFeatureManager.setScreenEffect(14, z ? 1 : 0);
        }
    }

    private void setTranslucentNavigation(boolean z) {
        if (Util.checkDeviceHasNavigationBar(this)) {
            Window window = getWindow();
            window.getDecorView().setSystemUiVisibility(768);
            window.addFlags(Integer.MIN_VALUE);
        }
    }

    private void setupCamera(StartControl startControl) {
        if (isActivityPaused()) {
            Log.w(TAG, "setupCamera: activity is paused!");
            setSwitchingModule(false);
        } else if (!PermissionManager.checkCameraLaunchPermissions()) {
            Log.w(TAG, "setupCamera: waiting for permissions to be granted");
            setSwitchingModule(false);
        } else {
            Log.d(TAG, "setupCamera");
            closeCameraSetup();
            FunctionCameraPrepare functionCameraPrepare = new FunctionCameraPrepare(startControl.mTargetMode, startControl.mResetType, startControl.mNeedReConfigureData, (BaseModule) this.mCurrentModule);
            FunctionModuleSetup functionModuleSetup = new FunctionModuleSetup(startControl.mTargetMode);
            FunctionDataSetup functionDataSetup = new FunctionDataSetup(startControl.mTargetMode);
            FunctionUISetup functionUISetup = new FunctionUISetup(startControl.mTargetMode, startControl.needNotifyUI());
            Single map = Single.just(NullHolder.ofNullable(this)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraPrepare);
            Single observeOn = Single.create(this.mCamera2OpenOnSubScribe).subscribeOn(GlobalConstant.sCameraSetupScheduler).observeOn(GlobalConstant.sCameraSetupScheduler);
            synchronized (this.mCameraSetupDisposableGuard) {
                this.mCameraSetupDisposable = map.zipWith(observeOn, this.mCameraOpenResult).map(functionModuleSetup).map(functionDataSetup).observeOn(functionUISetup.getWorkThread()).map(functionUISetup).subscribe(this.mCameraSetupConsumer);
            }
        }
    }

    private boolean shouldReleaseLater() {
        return isCurrentModuleAlive() && this.mCurrentModule.shouldReleaseLater();
    }

    /* access modifiers changed from: private */
    public void showCameraError(int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        CameraStatUtil.trackCameraError(sb.toString());
        Message obtain = Message.obtain();
        obtain.what = 10;
        obtain.arg1 = i;
        this.mHandler.sendMessage(obtain);
        CompatibilityUtils.takebackMotor();
    }

    private void showDebug() {
        if (Util.isShowDebugInfo()) {
            if (this.mDebugInfoView != null) {
                this.mDebugInfoView.setVisibility(0);
            }
            this.mDebugThread = new LogThread();
            this.mDebugThread.start();
        }
        if (this.mDebugInfoView != null && Util.isShowPreviewDebugInfo()) {
            this.mDebugInfoView.setVisibility(0);
        }
    }

    /* access modifiers changed from: private */
    public void showFirstUseHintIfNeeded() {
        if (DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_HINT_SHOWN, true)) {
            if (this.mCameraRootView != null) {
                this.mCameraRootView.disableTouchEvent();
            }
            this.mHandler.postDelayed(new Runnable() {
                public void run() {
                    if (!Camera.this.isActivityPaused()) {
                        Camera.this.getScreenHint().showFirstUseHint();
                        if (Camera.this.mCameraRootView != null) {
                            Camera.this.mCameraRootView.enableTouchEvent();
                        }
                    }
                }
            }, 1000);
        }
    }

    private void showFirstUsePermissionActivity() {
        if (DataRepository.dataItemGlobal().getBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_PERMISSION_SHOWN, true)) {
            boolean z = Build.IS_INTERNATIONAL_BUILD;
            String str = SystemProperties.get("ro.miui.region");
            if (z && "KR".equals(str)) {
                Intent intent = new Intent("miui.intent.action.APP_PERMISSION_USE");
                ArrayList arrayList = new ArrayList(6);
                arrayList.add(getResources().getString(R.string.permission_contacts));
                arrayList.add(getResources().getString(R.string.permission_location));
                arrayList.add(getResources().getString(R.string.permission_camera));
                arrayList.add(getResources().getString(R.string.permission_phone_state));
                arrayList.add(getResources().getString(R.string.permission_storage));
                arrayList.add(getResources().getString(R.string.permission_microphone));
                intent.putStringArrayListExtra("extra_main_permission_groups", arrayList);
                intent.putExtra("extra_pkgname", "com.android.camera");
                try {
                    startActivityForResult(intent, 1);
                } catch (Exception e) {
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("KR Exception:");
                    sb.append(e);
                    Log.i(str2, sb.toString());
                }
            }
        }
    }

    private void showHibernationFragment() {
        HibernationFragment hibernationFragment = new HibernationFragment();
        hibernationFragment.setStyle(2, R.style.DialogFragmentFullScreen);
        getSupportFragmentManager().beginTransaction().add((Fragment) hibernationFragment, HibernationFragment.TAG).commitAllowingStateLoss();
    }

    private void switchEdgeFingerMode(boolean z) {
        if (b.hQ()) {
            CameraSettings.setEdgeMode(this, z);
        }
    }

    private void triggerWatchDog(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("triggerWatchDog: ");
        sb.append(z);
        Log.d(str, sb.toString());
        if (b.rO && DataRepository.dataItemFeature().gk()) {
            if (z) {
                this.mWatchDog = new WatchDogThread();
                this.mWatchDog.start();
            } else if (this.mWatchDog != null) {
                this.mWatchDog.interrupt();
                this.mWatchDog = null;
            }
        }
    }

    private void unbindServices() {
        if (this.mIsGalleryServiceBound) {
            unbindService(this.mServiceConnection);
            this.mIsGalleryServiceBound = false;
        }
    }

    private void unregisterSDReceiver() {
        try {
            unregisterReceiver(this.mSDReceiver);
        } catch (Exception e) {
            Log.e(TAG, e.getMessage());
        }
    }

    public void changeRequestOrientation() {
        if (b.im()) {
            if (CameraSettings.isFrontCamera()) {
                setRequestedOrientation(7);
            } else {
                setRequestedOrientation(1);
            }
        }
    }

    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (this.mProximitySensorLock == null || !this.mProximitySensorLock.intercept(keyEvent)) {
            return super.dispatchKeyEvent(keyEvent);
        }
        return true;
    }

    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        int actionMasked = motionEvent.getActionMasked();
        boolean z = false;
        if (actionMasked == 3 || actionMasked == 1) {
            HybridZoomingSystem.setZoomingSourceIdentity(0);
        }
        if (this.mActivityPaused) {
            return true;
        }
        if (this.mProximitySensorLock != null && this.mProximitySensorLock.active()) {
            return true;
        }
        if (this.mCurrentModule == null || this.mCurrentModule.isIgnoreTouchEvent()) {
            return super.dispatchTouchEvent(motionEvent);
        }
        if (super.dispatchTouchEvent(motionEvent) || V6GestureRecognizer.getInstance(this).onTouchEvent(motionEvent)) {
            z = true;
        }
        return z;
    }

    public int getCapturePosture() {
        return this.mSensorStateManager.getCapturePosture();
    }

    public int getCurrentBrightness() {
        return this.mCameraBrightness.getCurrentBrightness();
    }

    public int getCurrentModuleIndex() {
        if (isCurrentModuleAlive()) {
            return this.mCurrentModule.getModuleIndex();
        }
        return 160;
    }

    public ImageSaver getImageSaver() {
        return this.mImageSaver;
    }

    public ImplFactory getImplFactory() {
        return this.mImplFactory;
    }

    public SensorStateManager getSensorStateManager() {
        return this.mSensorStateManager;
    }

    public boolean handleScreenSlideKeyEvent(int i, KeyEvent keyEvent) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("handleScreenSlideKeyEvent ");
        sb.append(i);
        Log.d(str, sb.toString());
        if (i == 701 && getCameraIntentManager().isFromScreenSlide().booleanValue() && !isModeSwitched()) {
            finish();
            overridePendingTransition(R.anim.anim_screen_slide_fade_in, R.anim.anim_screen_slide_fade_out);
            return true;
        } else if (isPostProcessing()) {
            return true;
        } else {
            DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
            int currentCameraId = dataItemGlobal.getCurrentCameraId();
            boolean z = false;
            int i2 = i == 700 ? 1 : 0;
            int currentMode = dataItemGlobal.getCurrentMode();
            if ((currentMode == 171 && !DataRepository.dataItemFeature().gE()) || currentMode == 166 || currentMode == 167 || currentMode == 173 || currentMode == 175) {
                currentMode = 163;
            } else if (currentMode == 168 || currentMode == 169 || currentMode == 170 || currentMode == 172) {
                currentMode = 162;
            } else if (currentMode == 162 && i2 == 0 && DataRepository.getInstance().backUp().isLastVideoFastMotion()) {
                currentMode = 169;
            }
            if (currentCameraId != i2) {
                TopAlert topAlert = (TopAlert) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                ActionProcessing actionProcessing = (ActionProcessing) ModeCoordinatorImpl.getInstance().getAttachProtocol(162);
                if (topAlert != null) {
                    topAlert.removeExtraMenu(4);
                }
                if (actionProcessing != null) {
                    actionProcessing.hideExtra();
                }
                dataItemGlobal.setCurrentMode(currentMode);
                dataItemGlobal.setCameraId(i2);
                boolean z2 = currentCameraId == 1;
                if (i2 == 1) {
                    z = true;
                }
                ScenarioTrackUtil.trackSwitchCameraStart(z2, z, dataItemGlobal.getCurrentMode());
                onModeSelected(StartControl.create(currentMode).setFromScreenSlide(true).setNeedBlurAnimation(true).setViewConfigType(2));
            } else if (i == 700 && isCurrentModuleAlive()) {
                ((BaseModule) this.mCurrentModule).updateScreenSlide(true);
                MainContentProtocol mainContentProtocol = (MainContentProtocol) ModeCoordinatorImpl.getInstance().getAttachProtocol(166);
                if (Util.isAccessible() && mainContentProtocol != null) {
                    mainContentProtocol.updateContentDescription();
                }
            }
            return true;
        }
    }

    public void hideLensDirtyDetectedHint() {
        if (!DataRepository.dataItemFeature().fU()) {
            Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(LensDirtyDetectDialogFragment.TAG);
            if (findFragmentByTag != null && (findFragmentByTag instanceof DialogFragment)) {
                ((DialogFragment) findFragmentByTag).dismissAllowingStateLoss();
            }
        }
    }

    public boolean isCurrentModuleAlive() {
        return this.mCurrentModule != null && this.mCurrentModule.isCreated();
    }

    public boolean isModeSwitched() {
        return this.mIsModeSwitched;
    }

    public boolean isNewBieAlive(int i) {
        String str;
        switch (i) {
            case 1:
                str = PortraitNewbieDialogFragment.TAG;
                break;
            case 2:
                str = FrontRotateNewbieDialogFragment.TAG;
                break;
            case 3:
                str = AiSceneNewbieDialogFragment.TAG;
                break;
            case 4:
                str = UltraWideNewbieDialogFragment.TAG;
                break;
            default:
                str = null;
                break;
        }
        boolean z = false;
        if (str == null) {
            return false;
        }
        if (getSupportFragmentManager().findFragmentByTag(str) != null) {
            z = true;
        }
        return z;
    }

    public boolean isRecording() {
        return isCurrentModuleAlive() && this.mCurrentModule.isRecording();
    }

    public boolean isScreenSlideOff() {
        return this.mIsScreenSlideOff;
    }

    public boolean isSelectingCapturedResult() {
        return isCurrentModuleAlive() && this.mCurrentModule.isSelectingCapturedResult();
    }

    public boolean isStable() {
        return this.mSensorStateManager.isStable();
    }

    public void notifyOnFirstFrameArrived(int i) {
        if (this.mCurrentModule != null && !this.mCurrentModule.isDeparted() && !isSwitchingModule()) {
            this.mHandler.sendEmptyMessageDelayed(2, FragmentTopAlert.HINT_DELAY_TIME);
            getCameraScreenNail().clearAnimation();
            this.mBaseFragmentDelegate.getAnimationComposite().notifyAfterFirstFrameArrived(i);
            this.mCurrentModule.enableCameraControls(true);
            this.mCurrentModule.setFrameAvailable(true);
            if ((getCurrentModuleIndex() == 165 || getCurrentModuleIndex() == 163) && b.im() && CameraSettings.isFrontCamera() && this.mDisplayRotation == 0 && DataRepository.dataItemGlobal().getBoolean("pref_front_camera_first_use_hint_shown_key", true)) {
                DataRepository.dataItemGlobal().editor().putBoolean("pref_front_camera_first_use_hint_shown_key", false).apply();
                showNewBie(2);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i != 1) {
            if (i == 161) {
                if (FileCompat.handleActivityResult(this, i, i2, intent)) {
                    DocumentFile fromTreeUri = DocumentFile.fromTreeUri(this, intent.getData());
                    if (fromTreeUri.findFile("Camera") == null) {
                        fromTreeUri.createDirectory("Camera");
                        return;
                    }
                    return;
                }
                Log.w(TAG, "onActivityResult documents permission not granted");
                PriorityStorageBroadcastReceiver.setPriorityStorage(false);
            }
        } else if (i2 == PERMISSION_RESULT_CODE) {
            DataRepository.dataItemGlobal().putBoolean(CameraSettings.KEY_CAMERA_FIRST_USE_PERMISSION_SHOWN, false);
        }
    }

    public void onAwaken() {
        Log.d(TAG, "onAwaken");
        getCameraScreenNail().requestAwaken();
        onModeSelected(this.mStartControl);
    }

    public void onBackPressed() {
        Log.d(TAG, "onBackPressed");
        if (!isCurrentModuleAlive() || !this.mCurrentModule.onBackPressed()) {
            super.onBackPressed();
        }
    }

    public void onCreate(Bundle bundle) {
        Log.d(TAG, "onCreate start");
        this.mApplication = (CameraAppImpl) getApplication();
        trackAppLunchTimeStart(this.mApplication.isApplicationFirstLaunched());
        this.mAppStartTime = System.currentTimeMillis();
        this.mCameraIntentManager = CameraIntentManager.getInstance(getIntent());
        this.mCameraIntentManager.setReferer(this);
        if (CompatibilityUtils.isInMultiWindowMode(this)) {
            super.onCreate(null);
            ToastUtils.showToast((Context) this, (int) R.string.multi_window_mode_not_supported);
            Log.d(TAG, "isInMultiWindowMode call finish");
            finish();
        } else if (!CameraIntentManager.ACTION_VOICE_CONTROL.equals(getIntent().getAction()) || this.mCameraIntentManager.checkCallerLegality()) {
            if (this.mCameraIntentManager.checkCallerLegality()) {
                CameraStatUtil.trackVoiceControl(getIntent());
            }
            super.onCreate(bundle);
            showFirstUsePermissionActivity();
            if (!getKeyguardFlag()) {
                PermissionManager.requestCameraRuntimePermissions(this);
            }
            if (PermissionManager.checkCameraLaunchPermissions()) {
                prefixCamera2Setup();
            }
            if (ProximitySensorLock.enabled() && isFromKeyguard()) {
                if (!Util.isNonUIEnabled() || !this.mCameraIntentManager.isFromVolumeKey().booleanValue()) {
                    if (ProximitySensorLock.supported()) {
                        this.mProximitySensorLock = new ProximitySensorLock(this);
                        this.mProximitySensorLock.startWatching();
                    }
                } else if (Util.isNonUI()) {
                    CameraStatUtil.track(CameraStat.CATEGORY_COUNTER, CameraStat.KEY_POCKET_MODE_ENTER, CameraStat.PARAM_COMMON_MODE, CameraStat.POCKET_MODE_NONUI_ENTER_VOLUME);
                    Log.d(TAG, "Finish from NonUI mode.");
                    finish();
                    return;
                }
            }
            EffectController.releaseInstance();
            setContentView(R.layout.v9_main);
            getWindow().setBackgroundDrawable(null);
            this.mGLView = (V6CameraGLSurfaceView) findViewById(R.id.v6_gl_surface_view);
            this.mGLCoverView = (ImageView) findViewById(R.id.gl_root_cover);
            this.mDebugInfoView = (TextView) findViewById(R.id.camera_debug_content);
            this.mEdgeShutterView = (V9EdgeShutterView) findViewById(R.id.v9_edge_shutter_view);
            this.mCameraRootView = (CameraRootView) findViewById(R.id.camera_app_root);
            this.mSensorStateManager = new SensorStateManager(this, getMainLooper());
            this.mOrientationListener = new MyOrientationEventListener(this);
            createCameraScreenNail(false, false);
            this.mCamera2OpenOnSubScribe = new Camera2OpenOnSubScribe(this);
            registerProtocol();
            Util.updateCountryIso(this);
            this.mPowerManager = Stub.asInterface(ServiceManager.getService("power"));
            if (b.iv()) {
                try {
                    this.mDisplayFeatureManager = DisplayFeatureManager.getInstance();
                } catch (Exception e) {
                    Log.w(TAG, "DisplayFeatureManager init failed", e);
                }
            }
            setTranslucentNavigation(true);
            EffectChangedListenerController.setHoldKey(hashCode());
            if (b.fZ()) {
                FrameLayout frameLayout = (FrameLayout) getLayoutInflater().inflate(R.layout.layout_google_lens, null);
                this.mCameraRootView.addView(frameLayout);
                LensAgent.getInstance().init(this, this.mGLView, frameLayout);
            }
            showDebug();
            Log.d(TAG, "onCreate end");
        } else {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("An illegal caller:");
            sb.append(this.mCameraIntentManager.getCaller());
            sb.append(" use VOICE_CONTROL_INTENT!");
            Log.e(str, sb.toString());
            super.onCreate(null);
            finish();
        }
    }

    public void onDestroy() {
        Log.d(TAG, "onDestroy start");
        super.onDestroy();
        AutoLockManager.removeInstance(this);
        unRegisterProtocol();
        ThermalDetector.getInstance().onDestroy();
        if (this.mImageSaver != null) {
            this.mImageSaver.onHostDestroy();
        }
        if (this.mSensorStateManager != null) {
            this.mSensorStateManager.onDestroy();
        }
        this.mPowerManager = null;
        this.mDisplayFeatureManager = null;
        V6GestureRecognizer.onDestroy(this);
        EffectChangedListenerController.removeEffectChangedListenerMap(hashCode());
        if (this.mDebugThread != null) {
            this.mDebugThread.setRunFlag(false);
        }
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.destroy();
        }
        if (this.mCameraIntentManager != null) {
            this.mCameraIntentManager.destroy();
            this.mCameraIntentManager = null;
        }
        if (getScreenHint() != null) {
            getScreenHint().dismissSystemChoiceDialog();
        }
        CameraIntentManager.removeAllInstance();
        if (b.fZ()) {
            LensAgent.getInstance().release();
        }
        Log.d(TAG, "onDestroy end");
    }

    public boolean onEdgeTouchEvent(MotionEvent motionEvent) {
        if (b.hQ()) {
            return V6GestureRecognizer.getInstance(this).onEdgeTouchEvent(motionEvent);
        }
        return true;
    }

    public void onHibernate() {
        Log.d(TAG, "onHibernate");
        if (isDestroyed()) {
            AutoLockManager.getInstance(this).removeMessage();
            return;
        }
        showHibernationFragment();
        getCameraScreenNail().requestHibernate();
        GlobalConstant.sCameraSetupScheduler.scheduleDirect(new Runnable() {
            public void run() {
                if (Camera.this.isCurrentModuleAlive()) {
                    Camera.this.mCurrentModule.setDeparted();
                    Camera.this.mCurrentModule.closeCamera();
                }
                Camera2OpenManager.getInstance().release(true);
            }
        });
    }

    public boolean onKeyDown(int i, KeyEvent keyEvent) {
        if (this.mActivityPaused) {
            return super.onKeyDown(i, keyEvent);
        }
        if (keyEvent.getRepeatCount() == 0 && (i == 66 || i == 27 || i == 88 || i == 87 || i == 24 || i == 25)) {
            if (this.mLastKeyDownEventTime == 0 || keyEvent.getEventTime() >= this.mLastKeyDownEventTime) {
                this.mLastKeyDownEventTime = keyEvent.getEventTime();
                if (Util.isTimeout(keyEvent.getEventTime(), this.mLastKeyUpEventTime, 150)) {
                    this.mLastIgnoreKey = -1;
                } else {
                    this.mLastIgnoreKey = i;
                    return true;
                }
            } else {
                this.mLastIgnoreKey = i;
                this.mLastKeyDownEventTime = 0;
                return true;
            }
        } else if (keyEvent.getRepeatCount() > 0 && i == this.mLastIgnoreKey) {
            this.mLastIgnoreKey = -1;
        }
        boolean z = false;
        if (i == 700) {
            this.mIsScreenSlideOff = false;
        } else if (i == 701) {
            this.mIsScreenSlideOff = true;
        }
        if (!isCurrentModuleAlive() || !this.mCurrentModule.isFrameAvailable()) {
            switch (i) {
                case 24:
                case 25:
                case 27:
                case 66:
                case 80:
                case 87:
                case 88:
                    return true;
                case Util.KEYCODE_SLIDE_ON /*700*/:
                case Util.KEYCODE_SLIDE_OFF /*701*/:
                    return handleScreenSlideKeyEvent(i, keyEvent);
                default:
                    return super.onKeyDown(i, keyEvent);
            }
        } else {
            switch (i) {
                case 24:
                case 25:
                case 87:
                case 88:
                    HybridZoomingSystem.setZoomingSourceIdentity(this.mCurrentModule.hashCode());
                    break;
            }
            if (this.mCurrentModule.onKeyDown(i, keyEvent) || super.onKeyDown(i, keyEvent)) {
                z = true;
            }
            return z;
        }
    }

    public boolean onKeyUp(int i, KeyEvent keyEvent) {
        boolean z = false;
        switch (i) {
            case 24:
            case 25:
            case 87:
            case 88:
                HybridZoomingSystem.setZoomingSourceIdentity(0);
                break;
        }
        if (this.mActivityPaused) {
            return super.onKeyUp(i, keyEvent);
        }
        if (i == this.mLastIgnoreKey) {
            this.mLastKeyUpEventTime = 0;
            this.mLastIgnoreKey = -1;
            return true;
        }
        this.mLastKeyUpEventTime = keyEvent.getEventTime();
        if (!isCurrentModuleAlive()) {
            return super.onKeyUp(i, keyEvent);
        }
        if (this.mCurrentModule.onKeyUp(i, keyEvent) || super.onKeyUp(i, keyEvent)) {
            z = true;
        }
        return z;
    }

    public void onLifeAlive() {
        Log.d(TAG, String.format(Locale.ENGLISH, "onLifeAlive module 0x%x, need anim %d, need blur %b need reconfig %b reset type %d", new Object[]{Integer.valueOf(this.mStartControl.mTargetMode), Integer.valueOf(this.mStartControl.mViewConfigType), Boolean.valueOf(this.mStartControl.mNeedBlurAnimation), Boolean.valueOf(this.mStartControl.mNeedReConfigureCamera), Integer.valueOf(this.mStartControl.mResetType)}));
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onLifeAlive: isFromKeyguard:");
        sb.append(isFromKeyguard());
        sb.append(" mHasbeenSetupOnFocusChanged:");
        sb.append(this.mHasbeenSetupOnFocusChanged);
        Log.d(str, sb.toString());
        if (!isFromKeyguard() || this.mHasbeenSetupOnFocusChanged) {
            setupCamera(this.mStartControl);
        }
    }

    public void onLifeDestroy(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onLifeDestroy ");
        sb.append(str);
        Log.d(str2, sb.toString());
    }

    public void onLifeStart(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onLifeStart ");
        sb.append(str);
        Log.d(str2, sb.toString());
    }

    public void onLifeStop(String str) {
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onLifeStop ");
        sb.append(str);
        Log.d(str2, sb.toString());
    }

    @MainThread
    public void onModeSelected(StartControl startControl) {
        int currentModuleIndex = getCurrentModuleIndex();
        this.mIsModeSwitched = this.mStartControl != null;
        this.mIsScreenSlideOff = Util.isScreenSlideOff(this);
        Log.d(TAG, String.format(Locale.ENGLISH, "onModeSelected from 0x%x to 0x%x, ScreenSlideOff = %b", new Object[]{Integer.valueOf(currentModuleIndex), Integer.valueOf(startControl.mTargetMode), Boolean.valueOf(this.mIsScreenSlideOff)}));
        if (currentModuleIndex != 160 && !CameraStatUtil.modeIdToName(currentModuleIndex).equals(CameraStatUtil.modeIdToName(startControl.mTargetMode))) {
            this.mHandler.removeMessages(2);
            ScenarioTrackUtil.trackSwitchModeStart(currentModuleIndex, startControl.mTargetMode, CameraSettings.isFrontCamera());
        }
        closeCameraSetup();
        this.mStartControl = startControl;
        ModuleManager.setActiveModuleIndex(startControl.mTargetMode);
        Completable completable = null;
        if (!startControl.mNeedReConfigureCamera) {
            this.mBaseFragmentDelegate.delegateMode(null, startControl, null);
            return;
        }
        if (this.mBaseFragmentDelegate != null) {
            this.mBaseFragmentDelegate.getAnimationComposite().setClickEnable(false);
        }
        setSwitchingModule(true);
        if (!isCurrentModuleAlive()) {
            startControl.mNeedBlurAnimation = false;
            getWindow().clearFlags(128);
        }
        V6GestureRecognizer.getInstance(this).setCurrentModule(null);
        BaseModule baseModule = (BaseModule) this.mCurrentModule;
        if (baseModule != null) {
            baseModule.setDeparted();
        }
        this.mCurrentModule = createNewModule(startControl.mTargetMode);
        if (this.mBaseFragmentDelegate == null) {
            this.mBaseFragmentDelegate = new BaseFragmentDelegate(this);
            this.mBaseFragmentDelegate.init(getSupportFragmentManager(), startControl.mTargetMode, this);
        } else {
            boolean checkCallerLegality = this.mCameraIntentManager.checkCallerLegality();
            if (PermissionManager.checkCameraLaunchPermissions()) {
                CompletablePreFixCamera2Setup completablePreFixCamera2Setup = new CompletablePreFixCamera2Setup(baseModule, startControl, getCameraScreenNail(), null, startFromSecureKeyguard(), checkCallerLegality);
                completable = Completable.create(completablePreFixCamera2Setup).subscribeOn(GlobalConstant.sCameraSetupScheduler);
            }
            synchronized (this.mCameraPendingSetupDisposableGuard) {
                this.mCameraPendingSetupDisposable = this.mBaseFragmentDelegate.delegateMode(completable, startControl, this);
            }
        }
        if (DataRepository.dataItemGlobal().getCurrentCameraId() == 1 || startControl.mTargetMode == 174 || startControl.mTargetMode == 177) {
            this.mBaseFragmentDelegate.initTargetFragment(4086);
        }
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        Log.d(TAG, "onNewIntent start");
        setIntent(intent);
        super.onNewIntent(intent);
        this.mCameraIntentManager.destroy();
        this.mCameraIntentManager = CameraIntentManager.getInstance(intent);
        this.mCameraIntentManager.setReferer(this);
        this.mJumpedToGallery = false;
        Log.d(TAG, "onNewIntent end");
    }

    public void onPause() {
        Log.d(TAG, "onPause start");
        HybridZoomingSystem.clearZoomRatioHistory();
        this.mAppStartTime = 0;
        this.mActivityPaused = true;
        this.mPendingScreenSlideKeyCode = 0;
        getContentResolver().unregisterContentObserver(this.mScreenSlideStatusObserver);
        switchEdgeFingerMode(false);
        this.mOrientationListener.disable();
        AutoLockManager.getInstance(this).onPause();
        hideHibernationFragment();
        setBrightnessRampRate(-1);
        setScreenEffect(false);
        getWindow().clearFlags(128);
        if (this.mDidRegister) {
            unregisterReceiver(this.mReceiver);
            this.mDidRegister = false;
        }
        unregisterSDReceiver();
        super.onPause();
        if (b.fZ()) {
            LensAgent.getInstance().onPause();
        }
        if (getScreenHint() != null) {
            getScreenHint().cancelHint();
        }
        if (this.mCameraRootView != null) {
            this.mCameraRootView.enableTouchEvent();
        }
        if (this.mImageSaver != null) {
            this.mImageSaver.onHostPause();
        }
        CameraStat.recordPageEnd();
        this.mReleaseByModule = false;
        if (shouldReleaseLater()) {
            this.mReleaseByModule = true;
            this.mCurrentModule.onHostStopAndNotifyActionStop();
        }
        removeNewBie();
        ThermalDetector.getInstance().unregisterReceiver();
        triggerWatchDog(false);
        Log.d(TAG, "onPause end");
    }

    public void onRequestPermissionsResult(int i, String[] strArr, int[] iArr) {
        if (i == PermissionManager.getCameraRuntimePermissionRequestCode()) {
            if (!PermissionManager.isCameraLaunchPermissionsResultReady(strArr, iArr)) {
                Log.w(TAG, "onRequestPermissionsResult: no permission");
                finish();
                return;
            }
            prefixCamera2Setup();
            if (!isActivityPaused() && PermissionManager.isCameraLocationPermissionsResultReady(strArr, iArr)) {
                LocationManager.instance().recordLocation(CameraSettings.isRecordLocation());
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onRestart() {
        super.onRestart();
        trackAppLunchTimeStart(false);
        this.mAppStartTime = System.currentTimeMillis();
    }

    public void onResume() {
        Log.d(TAG, "onResume start");
        if (getKeyguardFlag() && !PermissionManager.checkCameraLaunchPermissions()) {
            finish();
        }
        if (!(Util.sIsnotchScreenHidden == Util.isNotchScreenHidden(this) && Util.sIsFullScreenNavBarHidden == Util.isFullScreenNavBarHidden(this))) {
            Util.initialize(this);
            if (Util.isNotchDevice) {
                CompatibilityUtils.setCutoutModeShortEdges(getWindow());
            }
        }
        AutoLockManager.getInstance(this).onResume();
        if (this.mProximitySensorLock != null) {
            this.mProximitySensorLock.onResume();
        }
        boolean z = false;
        getContentResolver().registerContentObserver(Util.SCREEN_SLIDE_STATUS_SETTING_URI, false, this.mScreenSlideStatusObserver);
        CameraStat.recordPageStart(this, "CameraActivity");
        Util.checkLockedOrientation(this);
        this.mActivityPaused = false;
        switchEdgeFingerMode(true);
        this.mFirstOrientationArrived = false;
        this.mOrientationListener.enable();
        super.onResume();
        if (b.fZ()) {
            LensAgent.getInstance().onResume();
        }
        Storage.initStorage(this);
        if (Storage.isUseDocumentMode() && !FileCompat.hasStoragePermission(Storage.DIRECTORY)) {
            if (!getKeyguardFlag()) {
                Log.w(TAG, "start request documents permission");
                FileCompat.getStorageAccessForLOLLIPOP(this, Storage.DIRECTORY);
                return;
            }
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("documents permission not granted, getKeyguardFlag = ");
            sb.append(getKeyguardFlag());
            Log.w(str, sb.toString());
            PriorityStorageBroadcastReceiver.setPriorityStorage(false);
        }
        if (getScreenHint() != null) {
            getScreenHint().updateHint();
        }
        registerReceiver();
        registerSDReceiver();
        resumeCamera();
        this.mIsModeSwitched = false;
        ThermalDetector.getInstance().registerReceiver();
        if (this.mCameraIntentManager.isImageCaptureIntent() || this.mCameraIntentManager.isVideoCaptureIntent()) {
            z = true;
        }
        if (this.mImageSaver == null) {
            this.mImageSaver = new ImageSaver(this, this.mHandler, z);
        }
        this.mImageSaver.onHostResume(z);
        bindServices();
        triggerWatchDog(true);
        Util.updateAccessibility(this);
        Log.d(TAG, "onResume end");
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle bundle) {
        Log.d(TAG, "onSaveInstanceState");
    }

    public void onStop() {
        Log.d(TAG, "onStop start");
        super.onStop();
        closeCameraSetup();
        setSwitchingModule(false);
        if (!this.mReleaseByModule) {
            releaseAll(true, true);
        }
        unbindServices();
        boostParallelServiceAdj();
        Log.d(TAG, "onStop end");
    }

    public void onUserInteraction() {
        super.onUserInteraction();
        Log.d(TAG, "onUserInteraction");
        AutoLockManager.getInstance(this).onUserInteraction();
        if (isCurrentModuleAlive()) {
            this.mCurrentModule.onUserInteraction();
        }
    }

    public void onWindowFocusChanged(boolean z) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onWindowFocusChanged hasFocus->");
        sb.append(z);
        Log.d(str, sb.toString());
        this.mHasFocus = z;
        super.onWindowFocusChanged(z);
        if (this.mHasFocus && isFromKeyguard()) {
            Log.d(TAG, "setupCamera in onWindowFocusChanged");
            this.mHasbeenSetupOnFocusChanged = true;
            setupCamera(this.mStartControl);
        }
        if (this.mCurrentModule != null) {
            this.mCurrentModule.onWindowFocusChanged(z);
            if (this.mCameraBrightness != null) {
                this.mCameraBrightness.onWindowFocusChanged(z);
            }
            if (z) {
                Util.checkLockedOrientation(this);
                this.mCurrentModule.checkActivityOrientation();
                if (this.mSensorStateManager != null) {
                    this.mSensorStateManager.register();
                }
            } else {
                this.mHasbeenSetupOnFocusChanged = false;
                if (this.mSensorStateManager != null) {
                    this.mSensorStateManager.unregister(127);
                }
            }
        }
    }

    public void pause() {
        if (!isRecording()) {
            super.pause();
        }
    }

    public void registerProtocol() {
        ModeCoordinatorImpl.forceDestroy();
        ModeCoordinatorImpl.create(hashCode());
        EffectChangedListenerController.setHoldKey(hashCode());
        this.mImplFactory = new ImplFactory();
        this.mImplFactory.initBase(this, 171);
        DataItemGlobal dataItemGlobal = DataRepository.dataItemGlobal();
        getCameraIntentManager();
        dataItemGlobal.parseIntent(getIntent(), Boolean.valueOf(this.mCameraIntentManager.checkCallerLegality()), startFromSecureKeyguard(), false, true);
        onModeSelected(StartControl.create(dataItemGlobal.getCurrentMode()).setResetType(dataItemGlobal.isTimeOut() ? 3 : 2));
    }

    public void releaseAll(boolean z, boolean z2) {
        releaseAll(z, z2, true);
    }

    public void releaseAll(boolean z, boolean z2, boolean z3) {
        boolean isFinishing = isFinishing();
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("releaseAll: releaseDevice = ");
        sb.append(z2);
        sb.append(", isCurrentModuleAlive = ");
        sb.append(isCurrentModuleAlive());
        sb.append(", releaseImmediate = ");
        sb.append(z3);
        sb.append(", isFinishing = ");
        sb.append(isFinishing);
        Log.d(str, sb.toString());
        this.mReleaseByModule = false;
        if (this.mCurrentModule != null) {
            this.mCurrentModule.setDeparted();
        }
        GlobalConstant.sCameraSetupScheduler.scheduleDirect(new Runnable(z2, z3) {
            private final /* synthetic */ boolean f$1;
            private final /* synthetic */ boolean f$2;

            {
                this.f$1 = r2;
                this.f$2 = r3;
            }

            public final void run() {
                Camera.lambda$releaseAll$0(Camera.this, this.f$1, this.f$2);
            }
        });
    }

    public void removeNewBie() {
        getCameraScreenNail().drawBlackFrame(false);
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        if (this.newbieDialogFragmentTag != null) {
            Fragment findFragmentByTag = getSupportFragmentManager().findFragmentByTag(this.newbieDialogFragmentTag);
            if (findFragmentByTag != null) {
                beginTransaction.remove(findFragmentByTag);
            }
        }
        beginTransaction.commitAllowingStateLoss();
    }

    public void restoreWindowBrightness() {
        float f;
        if (this.mCameraBrightness != null) {
            int currentBrightness = this.mCameraBrightness.getCurrentBrightness();
            if (currentBrightness > 0) {
                f = ((float) currentBrightness) / 255.0f;
                LayoutParams attributes = getWindow().getAttributes();
                attributes.screenBrightness = f;
                getWindow().setAttributes(attributes);
                setBrightnessRampRate(-1);
                setScreenEffect(false);
            }
        }
        f = -1.0f;
        LayoutParams attributes2 = getWindow().getAttributes();
        attributes2.screenBrightness = f;
        getWindow().setAttributes(attributes2);
        setBrightnessRampRate(-1);
        setScreenEffect(false);
    }

    public void resume() {
        if (!isRecording()) {
            super.resume();
        }
    }

    public void resumeCurrentMode(int i) {
        closeCameraSetup();
        setSwitchingModule(true);
        FunctionCameraLegacySetup functionCameraLegacySetup = new FunctionCameraLegacySetup(i);
        FunctionResumeModule functionResumeModule = new FunctionResumeModule(i);
        Single map = Single.just(NullHolder.ofNullable((BaseModule) this.mCurrentModule)).observeOn(GlobalConstant.sCameraSetupScheduler).map(functionCameraLegacySetup);
        Single observeOn = Single.create(this.mCamera2OpenOnSubScribe).observeOn(GlobalConstant.sCameraSetupScheduler);
        synchronized (this.mCameraSetupDisposableGuard) {
            this.mCameraSetupDisposable = map.zipWith(observeOn, this.mCameraOpenResult).map(functionResumeModule).observeOn(AndroidSchedulers.mainThread()).subscribe(this.mCameraSetupConsumer);
        }
    }

    @Deprecated
    public void setBlockingLifeCycles(List<String> list) {
    }

    public void setWindowBrightness(int i) {
        setBrightnessRampRate(0);
        setScreenEffect(true);
        LayoutParams attributes = getWindow().getAttributes();
        attributes.screenBrightness = ((float) i) / 255.0f;
        getWindow().setAttributes(attributes);
    }

    public void showLensDirtyDetectedHint() {
        if (DataRepository.dataItemFeature().fU()) {
            this.mHandler.post(new Runnable() {
                public void run() {
                    FragmentTopConfig fragmentTopConfig = (FragmentTopConfig) ModeCoordinatorImpl.getInstance().getAttachProtocol(172);
                    if (fragmentTopConfig != null) {
                        boolean z = true;
                        if (DataRepository.dataItemGlobal().getCurrentCameraId() != 1) {
                            z = false;
                        }
                        fragmentTopConfig.alertAiDetectTipHint(0, z ? R.string.lens_dirty_detected_title_front : R.string.lens_dirty_detected_title_back, 8000);
                    }
                }
            });
        } else if (getSupportFragmentManager().findFragmentByTag(LensDirtyDetectDialogFragment.TAG) == null) {
            LensDirtyDetectDialogFragment lensDirtyDetectDialogFragment = new LensDirtyDetectDialogFragment();
            lensDirtyDetectDialogFragment.setStyle(2, R.style.LensDirtyDetectDialogFragment);
            getSupportFragmentManager().beginTransaction().add((Fragment) lensDirtyDetectDialogFragment, LensDirtyDetectDialogFragment.TAG).commitAllowingStateLoss();
        }
    }

    public boolean showNewBie(int i) {
        if (!(i == 2 || getCameraScreenNail() == null)) {
            getCameraScreenNail().drawBlackFrame(true);
        }
        switch (i) {
            case 1:
                PortraitNewbieDialogFragment portraitNewbieDialogFragment = new PortraitNewbieDialogFragment();
                portraitNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add((Fragment) portraitNewbieDialogFragment, PortraitNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = PortraitNewbieDialogFragment.TAG;
                return true;
            case 2:
                FrontRotateNewbieDialogFragment frontRotateNewbieDialogFragment = new FrontRotateNewbieDialogFragment();
                frontRotateNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add((Fragment) frontRotateNewbieDialogFragment, FrontRotateNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = FrontRotateNewbieDialogFragment.TAG;
                return true;
            case 3:
                if (isActivityPaused()) {
                    return false;
                }
                AiSceneNewbieDialogFragment aiSceneNewbieDialogFragment = new AiSceneNewbieDialogFragment();
                aiSceneNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add((Fragment) aiSceneNewbieDialogFragment, AiSceneNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = AiSceneNewbieDialogFragment.TAG;
                DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_first_ai_scene_use_hint_shown_key", false).apply();
                return true;
            case 4:
                if (isActivityPaused()) {
                    return false;
                }
                UltraWideNewbieDialogFragment ultraWideNewbieDialogFragment = new UltraWideNewbieDialogFragment();
                ultraWideNewbieDialogFragment.setStyle(2, R.style.DialogFragmentFullScreen);
                getSupportFragmentManager().beginTransaction().add((Fragment) ultraWideNewbieDialogFragment, UltraWideNewbieDialogFragment.TAG).commitAllowingStateLoss();
                this.newbieDialogFragmentTag = UltraWideNewbieDialogFragment.TAG;
                DataRepository.dataItemGlobal().editor().putBoolean("pref_camera_first_ultra_wide_use_hint_shown_key", false).apply();
                return true;
            default:
                return false;
        }
    }

    public void unRegisterProtocol() {
        if (this.mImplFactory != null) {
            this.mImplFactory.detachBase();
        }
        if (this.mBaseFragmentDelegate != null) {
            this.mBaseFragmentDelegate.unRegisterProtocol();
            this.mBaseFragmentDelegate = null;
        }
    }

    public void updateSurfaceState(int i) {
        super.updateSurfaceState(i);
        if (i == 4) {
            this.mCamera2OpenOnSubScribe.onGlSurfaceCreated();
            if (!ModuleManager.isCapture()) {
                return;
            }
            if (this.mCurrentModule != null) {
                ((BaseModule) this.mCurrentModule).updatePreviewSurface();
            } else {
                Log.w(TAG, "updateSurfaceState: module has not been initialized");
            }
        }
    }
}
