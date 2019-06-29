.class public Lcom/android/camera/Camera;
.super Lcom/android/camera/ActivityBase;
.source "Camera.java"

# interfaces
.implements Landroid/support/v4/app/ActivityCompat$OnRequestPermissionsResultCallback;
.implements Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;
.implements Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/Camera$LogThread;,
        Lcom/android/camera/Camera$WatchDogThread;,
        Lcom/android/camera/Camera$MyOrientationEventListener;
    }
.end annotation


# static fields
.field private static final PERMISSION_REQUEST_CODE:I = 0x1

.field private static final PERMISSION_RESULT_CODE:I = 0x904

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

.field private mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

.field private mCameraOpenResult:Lio/reactivex/functions/BiFunction;

.field private mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private final mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

.field private mCameraSetupConsumer:Lio/reactivex/functions/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Consumer<",
            "Lcom/android/camera/module/loader/NullHolder<",
            "Lcom/android/camera/module/BaseModule;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

.field private final mCameraSetupDisposableGuard:Ljava/lang/Object;

.field private mDebugThread:Lcom/android/camera/Camera$LogThread;

.field private mDidRegister:Z

.field private mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

.field private mFirstOrientationArrived:Z

.field private mHasFocus:Z

.field private mHasbeenSetupOnFocusChanged:Z

.field private mImageSaver:Lcom/android/camera/storage/ImageSaver;

.field private mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

.field private mIsGalleryServiceBound:Z

.field private mIsModeSwitched:Z

.field private mIsScreenSlideOff:Z

.field private mLastIgnoreKey:I

.field private mLastKeyDownEventTime:J

.field private mLastKeyUpEventTime:J

.field private mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

.field private mPendingScreenSlideKeyCode:I

.field private mPowerManager:Landroid/os/IPowerManager;

.field private mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mSDReceiver:Landroid/content/BroadcastReceiver;

.field private mScreenSlideStatusObserver:Landroid/database/ContentObserver;

.field private mSensorStateManager:Lcom/android/camera/SensorStateManager;

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mStartControl:Lcom/android/camera/module/loader/StartControl;

.field private volatile mTick:I

.field private mWatchDog:Ljava/lang/Thread;

.field private newbieDialogFragmentTag:Ljava/lang/String;

.field private final tickerRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/Camera;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/android/camera/ActivityBase;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mLastKeyUpEventTime:J

    iput-wide v0, p0, Lcom/android/camera/Camera;->mLastKeyDownEventTime:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    new-instance v0, Lcom/android/camera/Camera$1;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$1;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    new-instance v0, Lcom/android/camera/Camera$2;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$2;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    new-instance v0, Lcom/android/camera/Camera$3;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$3;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    new-instance v0, Lcom/android/camera/Camera$4;

    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v1}, Lcom/android/camera/Camera$4;-><init>(Lcom/android/camera/Camera;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    new-instance v0, Lcom/android/camera/Camera$5;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$5;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    new-instance v0, Lcom/android/camera/Camera$7;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$7;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/android/camera/Camera$8;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$8;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/Camera;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/Camera;->mTick:I

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/Camera;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/Camera;->mTick:I

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/Camera;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->showCameraError(I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/android/camera/Camera;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/Camera;->tickerRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/Camera;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    return-void
.end method

.method static synthetic access$1300(Lcom/android/camera/Camera;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/Camera;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$302(Lcom/android/camera/Camera;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    return-object p1
.end method

.method static synthetic access$400(Lcom/android/camera/Camera;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/Camera;->showFirstUseHintIfNeeded()V

    return-void
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/camera/Camera;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/Camera;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p0
.end method

.method static synthetic access$702(Lcom/android/camera/Camera;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    return p1
.end method

.method static synthetic access$800(Lcom/android/camera/Camera;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/Camera;->onDisplayRotationChanged()V

    return-void
.end method

.method static synthetic access$900(Lcom/android/camera/Camera;)Lcom/android/camera/fragment/BaseFragmentDelegate;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    return-object p0
.end method

.method private bindServices()V
    .locals 3

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.BIND_SERVICE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.miui.gallery"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v2, 0x5

    invoke-virtual {p0, v0, v1, v2}, Lcom/android/camera/Camera;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v2, "bindServices error."

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private boostParallelServiceAdj()V
    .locals 9

    invoke-static {}, Lcom/android/camera/parallel/AlgoConnector;->getInstance()Lcom/android/camera/parallel/AlgoConnector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/parallel/AlgoConnector;->getLocalBinder()Lcom/android/camera/LocalParallelService$LocalBinder;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCurrentCamera2Device()Lcom/android/camera2/Camera2Proxy;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isCameraParallelProcessEnable()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/camera/LocalParallelService$LocalBinder;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1, v3}, Lcom/android/camera2/Camera2Proxy;->isCaptureBusy(Z)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->isPendingSave()Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v3

    goto :goto_0

    :cond_3
    nop

    move v0, v4

    :goto_0
    if-nez v0, :cond_4

    return-void

    :cond_4
    :try_start_0
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "boostParallelServiceAdj"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "miui.process.ProcessManager"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "adjBoost"

    const/4 v2, 0x4

    new-array v5, v2, [Ljava/lang/Class;

    const-class v6, Ljava/lang/String;

    aput-object v6, v5, v4

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v3

    sget-object v6, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x2

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v8, 0x3

    aput-object v6, v5, v8

    invoke-virtual {v0, v1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-string v1, "android.os.UserHandle"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v5, "myUserId"

    new-array v6, v4, [Ljava/lang/Class;

    invoke-virtual {v1, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    new-array v2, v2, [Ljava/lang/Object;

    const-string v5, "com.android.camera"

    aput-object v5, v2, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const-wide/32 v3, 0xea60

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v8

    invoke-virtual {v0, v6, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/ReflectiveOperationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method private closeCameraSetup()Z
    .locals 3

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v1}, Lio/reactivex/disposables/Disposable;->dispose()V

    iput-object v2, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    iput-object v2, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    const/4 v0, 0x1

    monitor-exit v1

    return v0

    :cond_1
    monitor-exit v1

    const/4 v0, 0x0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method

.method private createNewModule(I)Lcom/android/camera/module/Module;
    .locals 3

    invoke-static {p1}, Lcom/android/camera/module/ModuleManager;->getModuleByIndex(I)Lcom/android/camera/module/Module;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p0}, Lcom/android/camera/module/Module;->setActivity(Lcom/android/camera/Camera;)V

    iget p1, p0, Lcom/android/camera/Camera;->mOrientation:I

    iget v1, p0, Lcom/android/camera/Camera;->mOrientationCompensation:I

    invoke-interface {v0, p1, v1}, Lcom/android/camera/module/Module;->preTransferOrientation(II)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid module index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private currentIsMainThread()Z
    .locals 2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private hideHibernationFragment()V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "Hibernation"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    :cond_0
    return-void
.end method

.method private isFromKeyguard()Z
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v2, "android.media.action.STILL_IMAGE_CAMERA"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "android.media.action.STILL_IMAGE_CAMERA_SECURE"

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v1, 0x1

    nop

    :cond_2
    return v1
.end method

.method public static synthetic lambda$releaseAll$0(Lcom/android/camera/Camera;ZZ)V
    .locals 7

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getDataBackUpKey(I)I

    move-result v4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v5

    invoke-virtual {v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v5

    const/4 v6, 0x0

    invoke-interface {v2, v3, v4, v5, v6}, Lcom/android/camera/data/backup/DataBackUp;->backupRunning(Lcom/android/camera/data/data/runing/DataItemRunning;IIZ)V

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Lcom/android/camera/module/Module;->unRegisterProtocol()V

    invoke-interface {v1}, Lcom/android/camera/module/Module;->unRegisterModulePersistProtocol()V

    :cond_0
    invoke-interface {v1}, Lcom/android/camera/module/Module;->onPause()V

    invoke-interface {v1}, Lcom/android/camera/module/Module;->onStop()V

    invoke-interface {v1}, Lcom/android/camera/module/Module;->onDestroy()V

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->containsResumedCameraInStack()Z

    move-result p1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start releaseCameraDevice: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    xor-int/lit8 v2, p1, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-nez p1, :cond_2

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->release(Z)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->releaseCameraScreenNail()V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string p2, "Camera2OpenManager release ignored."

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    return-void
.end method

.method private onDisplayRotationChanged()V
    .locals 2

    invoke-static {}, Lcom/mi/config/b;->ja()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    nop

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "RotateHint"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;->animateOut(I)V

    :cond_1
    return-void
.end method

.method private prefixCamera2Setup()V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v7

    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v6

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Completable;->subscribe()Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private final registerReceiver()V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.media.action.VOICE_COMMAND"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    return-void
.end method

.method private registerSDReceiver()V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_SCANNER_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/android/camera/Camera;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private releaseAll(ZZZ)V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isFinishing()Z

    move-result p1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "releaseAll: releaseDevice = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isCurrentModuleAlive = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", releaseImmediate = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, ", isFinishing = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->setDeparted()V

    :cond_0
    sget-object p1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v0, Lcom/android/camera/-$$Lambda$Camera$3v7UuTeegtVIZLE5BJDVL7OwcoA;

    invoke-direct {v0, p0, p2, p3}, Lcom/android/camera/-$$Lambda$Camera$3v7UuTeegtVIZLE5BJDVL7OwcoA;-><init>(Lcom/android/camera/Camera;ZZ)V

    invoke-virtual {p1, v0}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private resumeCamera()V
    .locals 13

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "resumeCamera: E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->isAlive(I)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "resumeCamera: module is obsolete"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    goto/16 :goto_4

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v1

    nop

    iget-boolean v2, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    const/4 v8, 0x3

    const/4 v9, 0x2

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eqz v2, :cond_2

    sget-object v2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "resumeCamera: from gallery, mReleaseByModule = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v4, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v11, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    iget-boolean v2, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v2}, Lcom/android/camera/module/Module;->isShot2Gallery()Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, v10}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    iput-boolean v11, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    return-void

    :cond_2
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v12

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v2, v0

    invoke-virtual/range {v2 .. v7}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getIntentType()I

    move-result v2

    if-eqz v12, :cond_6

    iget-object v3, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v3}, Lcom/android/camera/module/Module;->isSelectingCapturedResult()Z

    move-result v3

    if-eqz v3, :cond_3

    move v11, v10

    goto :goto_0

    :cond_3
    nop

    :goto_0
    sget-object v3, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "resumeCamera: lastType="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " curType="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " captureFinish="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ne v12, v2, :cond_4

    if-eqz v11, :cond_4

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->resumeCurrentMode(I)V

    return-void

    :cond_4
    if-eqz v11, :cond_5

    iget-object v2, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateEvent(I)V

    :cond_5
    goto :goto_1

    :cond_6
    sget-object v2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "resumeCamera: lastType="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v2, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    if-eqz v2, :cond_7

    iput-boolean v11, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    return-void

    :cond_7
    :goto_1
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v2

    if-eqz v2, :cond_8

    nop

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    sget-object v3, Lcom/android/camera/fragment/music/FragmentLiveMusic;->TAG:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/android/camera/fragment/FragmentUtils;->removeFragmentByTag(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)Z

    move v2, v8

    goto :goto_2

    :cond_8
    move v2, v9

    :goto_2
    if-eqz v1, :cond_9

    if-eq v2, v8, :cond_9

    goto :goto_3

    :cond_9
    move v9, v10

    :goto_3
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v9}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    :goto_4
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "resumeCamera: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private setBrightnessRampRate(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    invoke-static {v0, p1}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setBrightnessRampRate(Landroid/os/IPowerManager;I)V

    return-void
.end method

.method private setScreenEffect(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    const/16 v1, 0xe

    invoke-virtual {v0, v1, p1}, Lmiui/hardware/display/DisplayFeatureManager;->setScreenEffect(II)V

    :cond_0
    return-void
.end method

.method private setTranslucentNavigation(Z)V
    .locals 2

    invoke-static {p0}, Lcom/android/camera/Util;->checkDeviceHasNavigationBar(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x300

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    const/high16 v0, -0x80000000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    return-void
.end method

.method private setupCamera(Lcom/android/camera/module/loader/StartControl;)V
    .locals 6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "setupCamera: activity is paused!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "setupCamera: waiting for permissions to be granted"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    return-void

    :cond_1
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "setupCamera"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraPrepare;

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    iget-boolean v3, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureData:Z

    iget-object v4, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast v4, Lcom/android/camera/module/BaseModule;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/camera/module/loader/FunctionCameraPrepare;-><init>(IIZLcom/android/camera/module/BaseModule;)V

    new-instance v1, Lcom/android/camera/module/loader/FunctionModuleSetup;

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v1, v2}, Lcom/android/camera/module/loader/FunctionModuleSetup;-><init>(I)V

    new-instance v2, Lcom/android/camera/module/loader/FunctionDataSetup;

    iget v3, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {v2, v3}, Lcom/android/camera/module/loader/FunctionDataSetup;-><init>(I)V

    new-instance v3, Lcom/android/camera/module/loader/FunctionUISetup;

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {p1}, Lcom/android/camera/module/loader/StartControl;->needNotifyUI()Z

    move-result p1

    invoke-direct {v3, v4, p1}, Lcom/android/camera/module/loader/FunctionUISetup;-><init>(IZ)V

    nop

    invoke-static {p0}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {p1, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v4}, Lio/reactivex/Single;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v4, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v4}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    iget-object v4, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    iget-object v5, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v5}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v2}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {v3}, Lcom/android/camera/module/loader/FunctionUISetup;->getWorkThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v3}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    monitor-exit v4

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private shouldReleaseLater()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->shouldReleaseLater()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private showCameraError(I)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackCameraError(Ljava/lang/String;)V

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0xa

    iput v1, v0, Landroid/os/Message;->what:I

    iput p1, v0, Landroid/os/Message;->arg1:I

    iget-object p1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    invoke-static {}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->takebackMotor()Z

    return-void
.end method

.method private showDebug()V
    .locals 2

    invoke-static {}, Lcom/android/camera/Util;->isShowDebugInfo()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_0
    new-instance v0, Lcom/android/camera/Camera$LogThread;

    invoke-direct {v0, p0}, Lcom/android/camera/Camera$LogThread;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    invoke-virtual {v0}, Lcom/android/camera/Camera$LogThread;->start()V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/Util;->isShowPreviewDebugInfo()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method private showFirstUseHintIfNeeded()V
    .locals 4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_first_use_hint_shown_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0}, Lcom/android/camera/ui/CameraRootView;->disableTouchEvent()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$6;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$6;-><init>(Lcom/android/camera/Camera;)V

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    return-void
.end method

.method private showFirstUsePermissionActivity()V
    .locals 5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    const-string v1, "pref_camera_first_use_permission_shown_key"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-boolean v0, Lmiui/os/Build;->IS_INTERNATIONAL_BUILD:Z

    sget-object v1, Lcom/android/camera/Util;->sRegion:Ljava/lang/String;

    if-eqz v0, :cond_1

    const-string v0, "KR"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.APP_PERMISSION_USE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    const/4 v3, 0x6

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028b

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028d

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f09028f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v3, "extra_main_permission_groups"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    const-string v1, "extra_pkgname"

    const-string v3, "com.android.camera"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v0, v2}, Lcom/android/camera/Camera;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "KR Exception:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method private showHibernationFragment()V
    .locals 3

    new-instance v0, Lcom/android/camera/fragment/dialog/HibernationFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/HibernationFragment;-><init>()V

    const/4 v1, 0x2

    const v2, 0x7f0d0021

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "Hibernation"

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method private switchEdgeFingerMode(Z)V
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->iE()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0, p1}, Lcom/android/camera/CameraSettings;->setEdgeMode(Landroid/content/Context;Z)V

    return-void
.end method

.method private triggerWatchDog(Z)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "triggerWatchDog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v0, Lcom/mi/config/b;->sP:Z

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gP()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    new-instance p1, Lcom/android/camera/Camera$WatchDogThread;

    invoke-direct {p1, p0, v0}, Lcom/android/camera/Camera$WatchDogThread;-><init>(Lcom/android/camera/Camera;Lcom/android/camera/Camera$1;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->interrupt()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mWatchDog:Ljava/lang/Thread;

    :cond_2
    :goto_0
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method private unbindServices()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mIsGalleryServiceBound:Z

    :cond_0
    return-void
.end method

.method private unregisterSDReceiver()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mSDReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method


# virtual methods
.method public changeRequestOrientation()V
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->ja()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setRequestedOrientation(I)V

    :goto_0
    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0, p1}, Lcom/android/camera/ProximitySensorLock;->intercept(Landroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x3

    if-eq v0, v3, :cond_0

    if-ne v0, v2, :cond_1

    :cond_0
    invoke-static {v1}, Lcom/android/camera/HybridZoomingSystem;->setZoomingSourceIdentity(I)V

    :cond_1
    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_2

    return v2

    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->active()Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    :cond_3
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isIgnoreTouchEvent()Z

    move-result v0

    if-eqz v0, :cond_4

    goto :goto_2

    :cond_4
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    goto :goto_1

    :cond_6
    :goto_0
    move v1, v2

    :goto_1
    return v1

    :cond_7
    :goto_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getCapturePosture()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->getCapturePosture()I

    move-result v0

    return v0
.end method

.method public getCurrentBrightness()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    return v0
.end method

.method public getCurrentModuleIndex()I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->getModuleIndex()I

    move-result v0

    goto :goto_0

    :cond_0
    const/16 v0, 0xa0

    :goto_0
    return v0
.end method

.method public getImageSaver()Lcom/android/camera/storage/ImageSaver;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object v0
.end method

.method public getImplFactory()Lcom/android/camera/module/impl/ImplFactory;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    return-object v0
.end method

.method public getSensorStateManager()Lcom/android/camera/SensorStateManager;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    return-object v0
.end method

.method public handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z
    .locals 12

    sget-object p2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleScreenSlideKeyEvent "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x1

    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->isFromScreenSlide()Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isModeSwitched()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    const p1, 0x7f050002

    const v0, 0x7f050003

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/Camera;->overridePendingTransition(II)V

    return p2

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isPostProcessing()Z

    move-result v0

    if-eqz v0, :cond_1

    return p2

    :cond_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v1

    const/16 v2, 0x2bc

    const/4 v3, 0x0

    if-ne p1, v2, :cond_2

    nop

    move v4, p2

    goto :goto_0

    :cond_2
    nop

    move v4, v3

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v5

    const/16 v6, 0xab

    const/16 v7, 0xac

    const/16 v8, 0xa9

    const/16 v9, 0xa6

    const/16 v10, 0xa3

    const/16 v11, 0xa2

    if-ne v5, v6, :cond_3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mi/config/a;->hj()Z

    move-result v6

    if-eqz v6, :cond_7

    :cond_3
    if-eq v5, v9, :cond_7

    const/16 v6, 0xa7

    if-eq v5, v6, :cond_7

    const/16 v6, 0xad

    if-eq v5, v6, :cond_7

    const/16 v6, 0xaf

    if-ne v5, v6, :cond_4

    goto :goto_2

    :cond_4
    const/16 v6, 0xa8

    if-eq v5, v6, :cond_6

    if-eq v5, v8, :cond_6

    const/16 v6, 0xaa

    if-eq v5, v6, :cond_6

    if-ne v5, v7, :cond_5

    goto :goto_1

    :cond_5
    if-ne v5, v11, :cond_8

    if-nez v4, :cond_8

    invoke-static {}, Lcom/android/camera/data/DataRepository;->getInstance()Lcom/android/camera/data/DataRepository;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/camera/data/DataRepository;->backUp()Lcom/android/camera/data/backup/DataBackUp;

    move-result-object v6

    invoke-interface {v6}, Lcom/android/camera/data/backup/DataBackUp;->isLastVideoFastMotion()Z

    move-result v6

    if-eqz v6, :cond_8

    nop

    move v5, v8

    goto :goto_3

    :cond_6
    :goto_1
    nop

    move v5, v11

    goto :goto_3

    :cond_7
    :goto_2
    nop

    move v5, v10

    :cond_8
    :goto_3
    if-eq v5, v10, :cond_9

    const/16 v6, 0xa5

    if-ne v5, v6, :cond_a

    :cond_9
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v5

    invoke-interface {v5, v4}, Lcom/android/camera/data/provider/DataProvider;->dataConfig(I)Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v5

    check-cast v5, Lcom/android/camera/data/data/config/DataItemConfig;

    invoke-virtual {v5}, Lcom/android/camera/data/data/config/DataItemConfig;->getComponentConfigRatio()Lcom/android/camera/data/data/config/ComponentConfigRatio;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/android/camera/data/data/config/ComponentConfigRatio;->getMappingModeByRatio(I)I

    move-result v5

    :cond_a
    if-eq v1, v4, :cond_f

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v7}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    invoke-virtual {v2, v11}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    if-eqz p1, :cond_b

    const/4 v6, 0x4

    invoke-interface {p1, v6}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->removeExtraMenu(I)V

    :cond_b
    if-eqz v2, :cond_c

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->hideExtra()V

    :cond_c
    invoke-virtual {v0, v5}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCurrentMode(I)V

    invoke-virtual {v0, v4}, Lcom/android/camera/data/data/global/DataItemGlobal;->setCameraId(I)V

    if-ne v1, p2, :cond_d

    move p1, p2

    goto :goto_4

    :cond_d
    move p1, v3

    :goto_4
    if-ne v4, p2, :cond_e

    move v3, p2

    goto :goto_5

    :cond_e
    nop

    :goto_5
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {p1, v3, v0}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchCameraStart(ZZI)V

    invoke-static {v5}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setFromScreenSlide(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera/module/loader/StartControl;->setNeedBlurAnimation(Z)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/StartControl;->setViewConfigType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    goto :goto_6

    :cond_f
    if-ne p1, v2, :cond_10

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result p1

    if-eqz p1, :cond_10

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p1, p2}, Lcom/android/camera/module/BaseModule;->updateScreenSlide(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    invoke-virtual {p1, v9}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v0

    if-eqz v0, :cond_10

    if-eqz p1, :cond_10

    invoke-interface {p1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->updateContentDescription()V

    :cond_10
    :goto_6
    return p2
.end method

.method public hideLensDirtyDetectedHint()V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gz()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Landroid/support/v4/app/DialogFragment;

    if-eqz v1, :cond_1

    check-cast v0, Landroid/support/v4/app/DialogFragment;

    invoke-virtual {v0}, Landroid/support/v4/app/DialogFragment;->dismissAllowingStateLoss()V

    :cond_1
    return-void
.end method

.method public isCurrentModuleAlive()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isCreated()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isModeSwitched()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    return v0
.end method

.method public isNewBieAlive(I)Z
    .locals 2

    nop

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    goto :goto_0

    :pswitch_0
    const-string p1, "UltraWideHint"

    goto :goto_0

    :pswitch_1
    const-string p1, "AiSceneHint"

    goto :goto_0

    :pswitch_2
    const-string p1, "RotateHint"

    goto :goto_0

    :pswitch_3
    const-string p1, "PortraitHint"

    nop

    :goto_0
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    nop

    :cond_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isRecording()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isRecording()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isScreenSlideOff()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    return v0
.end method

.method public isSelectingCapturedResult()Z
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isSelectingCapturedResult()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStable()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->isStable()Z

    move-result v0

    return v0
.end method

.method public notifyOnFirstFrameArrived(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isDeparted()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isSwitchingModule()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x7d0

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->clearAnimation()V

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/animation/AnimationComposite;->notifyAfterFirstFrameArrived(I)V

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->enableCameraControls(Z)V

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1, v0}, Lcom/android/camera/module/Module;->setFrameAvailable(Z)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa5

    if-eq p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result p1

    const/16 v1, 0xa3

    if-eq p1, v1, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/mi/config/b;->ja()Z

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    :cond_3
    iget p1, p0, Lcom/android/camera/Camera;->mDisplayRotation:I

    if-eqz p1, :cond_4

    return-void

    :cond_4
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const-string v1, "pref_front_camera_first_use_hint_shown_key"

    invoke-virtual {p1, v1, v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    const-string v0, "pref_front_camera_first_use_hint_shown_key"

    const/4 v1, 0x0

    invoke-interface {p1, v0, v1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    invoke-virtual {p0, v3}, Lcom/android/camera/Camera;->showNewBie(I)Z

    :cond_5
    return-void

    :cond_6
    :goto_0
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/ActivityBase;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eq p1, v0, :cond_3

    const/16 v0, 0xa1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/android/camera/FileCompat;->handleActivityResult(Landroid/app/Activity;IILandroid/content/Intent;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p1

    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->findFile(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p2

    if-nez p2, :cond_1

    const-string p2, "Camera"

    invoke-virtual {p1, p2}, Landroid/support/v4/provider/DocumentFile;->createDirectory(Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    :cond_1
    goto :goto_0

    :cond_2
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string p2, "onActivityResult documents permission not granted"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v1}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    goto :goto_0

    :cond_3
    const/16 p1, 0x904

    if-ne p2, p1, :cond_4

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    const-string p2, "pref_camera_first_use_permission_shown_key"

    invoke-virtual {p1, p2, v1}, Lcom/android/camera/data/data/global/DataItemGlobal;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    :cond_4
    :goto_0
    return-void
.end method

.method public onAwaken()V
    .locals 2

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onAwaken"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestAwaken()V

    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 2

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onBackPressed"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onBackPressed()V

    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onCreate start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/android/camera/CameraAppImpl;

    iput-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    iget-object v0, p0, Lcom/android/camera/Camera;->mApplication:Lcom/android/camera/CameraAppImpl;

    invoke-virtual {v0}, Lcom/android/camera/CameraAppImpl;->isApplicationFirstLaunched()Z

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    invoke-static {p0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->isInMultiWindowMode(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0901f1

    invoke-static {p0, p1}, Lcom/android/camera/ToastUtils;->showToast(Landroid/content/Context;I)V

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "isInMultiWindowMode call finish"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    return-void

    :cond_0
    const-string v0, "android.media.action.VOICE_COMMAND"

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "An illegal caller:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v2}, Lcom/android/camera/CameraIntentManager;->getCaller()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " use VOICE_CONTROL_INTENT!"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0, v1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackVoiceControl(Landroid/content/Intent;)V

    :cond_2
    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/android/camera/Camera;->showFirstUsePermissionActivity()V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {p0}, Lcom/android/camera/permission/PermissionManager;->requestCameraRuntimePermissions(Landroid/app/Activity;)Z

    :cond_3
    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-direct {p0}, Lcom/android/camera/Camera;->prefixCamera2Setup()V

    :cond_4
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->enabled()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-static {}, Lcom/android/camera/Util;->isNonUIEnabled()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1}, Lcom/android/camera/CameraIntentManager;->isFromVolumeKey()Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {}, Lcom/android/camera/Util;->isNonUI()Z

    move-result p1

    if-eqz p1, :cond_6

    const-string p1, "counter"

    const-string v0, "pocket_mode_enter"

    const-string/jumbo v1, "\u65b9\u5f0f"

    const-string v2, "NonUI\u97f3\u91cf\u952e"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/android/camera/statistic/CameraStatUtil;->track(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)V

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "Finish from NonUI mode."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    return-void

    :cond_5
    invoke-static {}, Lcom/android/camera/ProximitySensorLock;->supported()Z

    move-result p1

    if-eqz p1, :cond_6

    new-instance p1, Lcom/android/camera/ProximitySensorLock;

    invoke-direct {p1, p0}, Lcom/android/camera/ProximitySensorLock;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    iget-object p1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {p1}, Lcom/android/camera/ProximitySensorLock;->startWatching()V

    :cond_6
    invoke-static {}, Lcom/android/camera/effect/EffectController;->releaseInstance()V

    const p1, 0x7f04005d

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setContentView(I)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const p1, 0x7f0e0111

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V6CameraGLSurfaceView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    const p1, 0x7f0e0112

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mGLCoverView:Landroid/widget/ImageView;

    const p1, 0x7f0e0125

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mDebugInfoView:Landroid/widget/TextView;

    const p1, 0x7f0e0132

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/V9EdgeShutterView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mEdgeShutterView:Lcom/android/camera/ui/V9EdgeShutterView;

    const p1, 0x7f0e0124

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/CameraRootView;

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    new-instance p1, Lcom/android/camera/SensorStateManager;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/android/camera/SensorStateManager;-><init>(Landroid/content/Context;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    new-instance p1, Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-direct {p1, p0, p0}, Lcom/android/camera/Camera$MyOrientationEventListener;-><init>(Lcom/android/camera/Camera;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Lcom/android/camera/Camera;->createCameraScreenNail(ZZ)V

    new-instance p1, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-direct {p1, p0}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;-><init>(Lcom/android/camera/module/loader/SurfaceStateListener;)V

    iput-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->registerProtocol()V

    invoke-static {p0}, Lcom/android/camera/Util;->updateDeviceConfig(Landroid/content/Context;)V

    const-string p1, "power"

    invoke-static {p1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p1

    invoke-static {p1}, Landroid/os/IPowerManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/os/IPowerManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    invoke-static {}, Lcom/mi/config/b;->ji()Z

    move-result p1

    if-eqz p1, :cond_7

    :try_start_0
    invoke-static {}, Lmiui/hardware/display/DisplayFeatureManager;->getInstance()Lmiui/hardware/display/DisplayFeatureManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v2, "DisplayFeatureManager init failed"

    invoke-static {v0, v2, p1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_7
    :goto_0
    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setTranslucentNavigation(Z)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    invoke-static {}, Lcom/mi/config/b;->gE()Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f040045

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/CameraRootView;->addView(Landroid/view/View;)V

    invoke-static {}, Lcom/android/lens/LensAgent;->getInstance()Lcom/android/lens/LensAgent;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/Camera;->mGLView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0, p0, v1, p1}, Lcom/android/lens/LensAgent;->init(Landroid/app/Activity;Landroid/view/View;Landroid/view/ViewGroup;)V

    :cond_8
    invoke-direct {p0}, Lcom/android/camera/Camera;->showDebug()V

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onCreate end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onDestroy()V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onDestroy()V

    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->removeInstance(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->unRegisterProtocol()V

    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->onDestroy()V

    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v0}, Lcom/android/camera/storage/ImageSaver;->onHostDestroy()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {v0}, Lcom/android/camera/SensorStateManager;->onDestroy()V

    :cond_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mPowerManager:Landroid/os/IPowerManager;

    iput-object v0, p0, Lcom/android/camera/Camera;->mDisplayFeatureManager:Lmiui/hardware/display/DisplayFeatureManager;

    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->onDestroy(Lcom/android/camera/ActivityBase;)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/EffectChangedListenerController;->removeEffectChangedListenerMap(I)V

    iget-object v1, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera/Camera;->mDebugThread:Lcom/android/camera/Camera$LogThread;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/camera/Camera$LogThread;->setRunFlag(Z)V

    :cond_2
    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v1}, Lcom/android/camera/ProximitySensorLock;->destroy()V

    :cond_3
    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->destroy()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    :cond_4
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/ScreenHint;->dismissSystemChoiceDialog()V

    :cond_5
    invoke-static {}, Lcom/android/camera/CameraIntentManager;->removeAllInstance()V

    invoke-static {}, Lcom/mi/config/b;->gE()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/android/lens/LensAgent;->getInstance()Lcom/android/lens/LensAgent;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/lens/LensAgent;->release()V

    :cond_6
    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onDestroy end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onEdgeTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    invoke-static {}, Lcom/mi/config/b;->iE()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/V6GestureRecognizer;->onEdgeTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onHibernate()V
    .locals 2

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onHibernate"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->removeMessage()V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->showHibernationFragment()V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->requestHibernate()V

    sget-object v0, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    new-instance v1, Lcom/android/camera/Camera$9;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$9;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Scheduler;->scheduleDirect(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 11

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-nez v0, :cond_4

    const/16 v0, 0x42

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_1

    const/16 v0, 0x58

    if-eq p1, v0, :cond_1

    const/16 v0, 0x57

    if-eq p1, v0, :cond_1

    const/16 v0, 0x18

    if-eq p1, v0, :cond_1

    const/16 v0, 0x19

    if-ne p1, v0, :cond_4

    :cond_1
    iget-wide v3, p0, Lcom/android/camera/Camera;->mLastKeyDownEventTime:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iget-wide v7, p0, Lcom/android/camera/Camera;->mLastKeyDownEventTime:J

    cmp-long v0, v3, v7

    if-gez v0, :cond_2

    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    iput-wide v5, p0, Lcom/android/camera/Camera;->mLastKeyDownEventTime:J

    return v2

    :cond_2
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/camera/Camera;->mLastKeyDownEventTime:J

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v5

    iget-wide v7, p0, Lcom/android/camera/Camera;->mLastKeyUpEventTime:J

    const-wide/16 v9, 0x96

    invoke-static/range {v5 .. v10}, Lcom/android/camera/Util;->isTimeout(JJJ)Z

    move-result v0

    if-eqz v0, :cond_3

    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    goto :goto_0

    :cond_3
    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    return v2

    :cond_4
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-lez v0, :cond_5

    iget v0, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    if-ne p1, v0, :cond_5

    iput v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    :cond_5
    :goto_0
    const/16 v0, 0x2bc

    const/4 v1, 0x0

    if-ne p1, v0, :cond_6

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    goto :goto_1

    :cond_6
    const/16 v0, 0x2bd

    if-ne p1, v0, :cond_7

    iput-boolean v2, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    :cond_7
    :goto_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->isFrameAvailable()Z

    move-result v0

    if-nez v0, :cond_8

    goto :goto_5

    :cond_8
    sparse-switch p1, :sswitch_data_0

    goto :goto_2

    :sswitch_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->setZoomingSourceIdentity(I)V

    :goto_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1, p2}, Lcom/android/camera/module/Module;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-nez v0, :cond_a

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_9

    goto :goto_3

    :cond_9
    goto :goto_4

    :cond_a
    :goto_3
    move v1, v2

    :goto_4
    return v1

    :cond_b
    :goto_5
    sparse-switch p1, :sswitch_data_1

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :sswitch_1
    invoke-virtual {p0, p1, p2}, Lcom/android/camera/Camera;->handleScreenSlideKeyEvent(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :sswitch_2
    return v2

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x18 -> :sswitch_2
        0x19 -> :sswitch_2
        0x1b -> :sswitch_2
        0x42 -> :sswitch_2
        0x50 -> :sswitch_2
        0x57 -> :sswitch_2
        0x58 -> :sswitch_2
        0x2bc -> :sswitch_1
        0x2bd -> :sswitch_1
    .end sparse-switch
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 5

    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    invoke-static {v0}, Lcom/android/camera/HybridZoomingSystem;->setZoomingSourceIdentity(I)V

    :goto_0
    iget-boolean v1, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    if-eqz v1, :cond_0

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget v1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    const/4 v2, 0x1

    if-ne p1, v1, :cond_1

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/android/camera/Camera;->mLastKeyUpEventTime:J

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/Camera;->mLastIgnoreKey:I

    return v2

    :cond_1
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getEventTime()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/camera/Camera;->mLastKeyUpEventTime:J

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_2
    iget-object v1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v1, p1, p2}, Lcom/android/camera/module/Module;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-super {p0, p1, p2}, Lcom/android/camera/ActivityBase;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    goto :goto_2

    :cond_4
    :goto_1
    move v0, v2

    :goto_2
    return v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x18 -> :sswitch_0
        0x19 -> :sswitch_0
        0x57 -> :sswitch_0
        0x58 -> :sswitch_0
    .end sparse-switch
.end method

.method public onLifeAlive()V
    .locals 6

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "onLifeAlive module 0x%x, need anim %d, need blur %b need reconfig %b reset type %d"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mViewConfigType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x2

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget-boolean v4, v4, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    const/4 v5, 0x3

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v4, v4, Lcom/android/camera/module/loader/StartControl;->mResetType:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x4

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeAlive: isFromKeyguard:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " mHasbeenSetupOnFocusChanged:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    :cond_1
    return-void
.end method

.method public onLifeDestroy(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeDestroy "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onLifeStart(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStart "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onLifeStop(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onLifeStop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onModeSelected(Lcom/android/camera/module/loader/StartControl;)V
    .locals 11
    .annotation build Landroid/support/annotation/MainThread;
    .end annotation

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCurrentModuleIndex()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isScreenSlideOff(Landroid/content/Context;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v5, "onModeSelected from 0x%x to 0x%x, ScreenSlideOff = %b"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    iget v7, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    iget-boolean v7, p0, Lcom/android/camera/Camera;->mIsScreenSlideOff:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    const/4 v8, 0x2

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0xa0

    if-eq v0, v1, :cond_1

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v1

    iget v4, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v4}, Lcom/android/camera/statistic/CameraStatUtil;->modeIdToName(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v8}, Landroid/os/Handler;->removeMessages(I)V

    iget v1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {}, Lcom/android/camera/CameraSettings;->isFrontCamera()Z

    move-result v4

    invoke-static {v0, v1, v4}, Lcom/android/camera/statistic/ScenarioTrackUtil;->trackSwitchModeStart(IIZ)V

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    iput-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-static {v0}, Lcom/android/camera/module/ModuleManager;->setActiveModuleIndex(I)V

    iget-boolean v0, p1, Lcom/android/camera/module/loader/StartControl;->mNeedReConfigureCamera:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0, v1, p1, v1}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    return-void

    :cond_2
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->getAnimationComposite()Lcom/android/camera/animation/AnimationComposite;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/animation/AnimationComposite;->setClickEnable(Z)V

    :cond_3
    invoke-virtual {p0, v3}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_4

    iput-boolean v2, p1, Lcom/android/camera/module/loader/StartControl;->mNeedBlurAnimation:Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x80

    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    :cond_4
    invoke-static {p0}, Lcom/android/camera/ui/V6GestureRecognizer;->getInstance(Lcom/android/camera/ActivityBase;)Lcom/android/camera/ui/V6GestureRecognizer;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6GestureRecognizer;->setCurrentModule(Lcom/android/camera/module/Module;)V

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    move-object v5, v0

    check-cast v5, Lcom/android/camera/module/BaseModule;

    if-eqz v5, :cond_5

    invoke-virtual {v5}, Lcom/android/camera/module/BaseModule;->setDeparted()V

    :cond_5
    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->createNewModule(I)Lcom/android/camera/module/Module;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-nez v0, :cond_6

    new-instance v0, Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;-><init>(Lcom/android/camera/Camera;)V

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget v2, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    invoke-virtual {v0, v1, v2, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->init(Landroid/support/v4/app/FragmentManager;ILcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)V

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v10

    nop

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v9

    move-object v4, v0

    move-object v6, p1

    invoke-direct/range {v4 .. v10}, Lcom/android/camera/module/loader/camera2/CompletablePreFixCamera2Setup;-><init>(Lcom/android/camera/module/Module;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/CameraScreenNail;Landroid/content/Intent;ZZ)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    sget-object v1, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Completable;

    move-result-object v1

    :cond_7
    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v2, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v2, v1, p1, p0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->delegateMode(Lio/reactivex/Completable;Lcom/android/camera/module/loader/StartControl;Lcom/android/camera/fragment/lifeCircle/BaseLifecycleListener;)Lio/reactivex/disposables/Disposable;

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/Camera;->mCameraPendingSetupDisposable:Lio/reactivex/disposables/Disposable;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    if-eq v0, v3, :cond_8

    iget v0, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    const/16 v1, 0xae

    if-eq v0, v1, :cond_8

    iget p1, p1, Lcom/android/camera/module/loader/StartControl;->mTargetMode:I

    const/16 v0, 0xb1

    if-ne p1, v0, :cond_9

    :cond_8
    iget-object p1, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    const/16 v0, 0xff6

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->initTargetFragment(I)V

    :cond_9
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 2

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onNewIntent start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, p1}, Lcom/android/camera/Camera;->setIntent(Landroid/content/Intent;)V

    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onNewIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v0}, Lcom/android/camera/CameraIntentManager;->destroy()V

    invoke-static {p1}, Lcom/android/camera/CameraIntentManager;->getInstance(Landroid/content/Intent;)Lcom/android/camera/CameraIntentManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    iget-object p1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {p1, p0}, Lcom/android/camera/CameraIntentManager;->setReferer(Landroid/app/Activity;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mJumpedToGallery:Z

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onNewIntent end"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onPause()V
    .locals 4

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/HybridZoomingSystem;->clearZoomRatioHistory()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/camera/Camera;->mPendingScreenSlideKeyCode:I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    invoke-virtual {v2, v3}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    iget-object v2, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v2}, Lcom/android/camera/Camera$MyOrientationEventListener;->disable()V

    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/AutoLockManager;->onPause()V

    invoke-direct {p0}, Lcom/android/camera/Camera;->hideHibernationFragment()V

    const/4 v2, -0x1

    invoke-direct {p0, v2}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    iget-boolean v2, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/android/camera/Camera;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v2}, Lcom/android/camera/Camera;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mDidRegister:Z

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->unregisterSDReceiver()V

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onPause()V

    invoke-static {}, Lcom/mi/config/b;->gE()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/android/lens/LensAgent;->getInstance()Lcom/android/lens/LensAgent;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/lens/LensAgent;->onPause()V

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/ScreenHint;->cancelHint()V

    :cond_2
    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraRootView:Lcom/android/camera/ui/CameraRootView;

    invoke-virtual {v2}, Lcom/android/camera/ui/CameraRootView;->enableTouchEvent()V

    :cond_3
    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v2}, Lcom/android/camera/storage/ImageSaver;->onHostPause()V

    :cond_4
    invoke-static {}, Lcom/android/camera/statistic/CameraStat;->recordPageEnd()V

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    invoke-direct {p0}, Lcom/android/camera/Camera;->shouldReleaseLater()Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v2, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v3, "release by module"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->resetTimeOut()V

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onHostStopAndNotifyActionStop()V

    :cond_5
    invoke-virtual {p0}, Lcom/android/camera/Camera;->removeNewBie()V

    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ThermalDetector;->unregisterReceiver()V

    invoke-direct {p0, v1}, Lcom/android/camera/Camera;->triggerWatchDog(Z)V

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onPause end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->getCameraRuntimePermissionRequestCode()I

    move-result v0

    if-ne p1, v0, :cond_1

    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLaunchPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string p2, "onRequestPermissionsResult: no permission"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->prefixCamera2Setup()V

    iget-object p1, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, p1}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {p2, p3}, Lcom/android/camera/permission/PermissionManager;->isCameraLocationPermissionsResultReady([Ljava/lang/String;[I)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isRecordLocation()Z

    move-result p1

    invoke-static {}, Lcom/android/camera/LocationManager;->instance()Lcom/android/camera/LocationManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/android/camera/LocationManager;->recordLocation(Z)V

    :cond_1
    return-void
.end method

.method protected onRestart()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onRestart()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->trackAppLunchTimeStart(Z)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/Camera;->mAppStartTime:J

    return-void
.end method

.method public onResume()V
    .locals 5

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/android/camera/permission/PermissionManager;->checkCameraLaunchPermissions()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->finish()V

    :cond_0
    sget-boolean v0, Lcom/android/camera/Util;->sIsnotchScreenHidden:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isNotchScreenHidden(Landroid/content/Context;)Z

    move-result v1

    if-ne v0, v1, :cond_1

    sget-boolean v0, Lcom/android/camera/Util;->sIsFullScreenNavBarHidden:Z

    invoke-static {p0}, Lcom/android/camera/Util;->isFullScreenNavBarHidden(Landroid/content/Context;)Z

    move-result v1

    if-eq v0, v1, :cond_2

    :cond_1
    invoke-static {p0}, Lcom/android/camera/Util;->initialize(Landroid/content/Context;)V

    sget-boolean v0, Lcom/android/camera/Util;->isNotchDevice:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->setCutoutModeShortEdges(Landroid/view/Window;)V

    :cond_2
    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onResume()V

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/Camera;->mProximitySensorLock:Lcom/android/camera/ProximitySensorLock;

    invoke-virtual {v0}, Lcom/android/camera/ProximitySensorLock;->onResume()V

    :cond_3
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/camera/Util;->SCREEN_SLIDE_STATUS_SETTING_URI:Landroid/net/Uri;

    iget-object v2, p0, Lcom/android/camera/Camera;->mScreenSlideStatusObserver:Landroid/database/ContentObserver;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    const-string v0, "CameraActivity"

    invoke-static {p0, v0}, Lcom/android/camera/statistic/CameraStat;->recordPageStart(Landroid/content/Context;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityPaused:Z

    iput-boolean v3, p0, Lcom/android/camera/Camera;->mActivityStopped:Z

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->switchEdgeFingerMode(Z)V

    iput-boolean v3, p0, Lcom/android/camera/Camera;->mFirstOrientationArrived:Z

    iget-object v1, p0, Lcom/android/camera/Camera;->mOrientationListener:Lcom/android/camera/Camera$MyOrientationEventListener;

    invoke-virtual {v1}, Lcom/android/camera/Camera$MyOrientationEventListener;->enable()V

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onResume()V

    invoke-static {}, Lcom/mi/config/b;->gE()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-static {}, Lcom/android/lens/LensAgent;->getInstance()Lcom/android/lens/LensAgent;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/lens/LensAgent;->onResume()V

    :cond_4
    invoke-static {p0}, Lcom/android/camera/storage/Storage;->initStorage(Landroid/content/Context;)V

    invoke-static {}, Lcom/android/camera/storage/Storage;->isUseDocumentMode()Z

    move-result v1

    if-eqz v1, :cond_6

    sget-object v1, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {v1}, Lcom/android/camera/FileCompat;->hasStoragePermission(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "start request documents permission"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/android/camera/storage/Storage;->DIRECTORY:Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/android/camera/FileCompat;->getStorageAccessForLOLLIPOP(Landroid/app/Activity;Ljava/lang/String;)Z

    return-void

    :cond_5
    sget-object v1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "documents permission not granted, getKeyguardFlag = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getKeyguardFlag()Z

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v3}, Lcom/android/camera/storage/PriorityStorageBroadcastReceiver;->setPriorityStorage(Z)V

    :cond_6
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getScreenHint()Lcom/android/camera/ui/ScreenHint;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/ScreenHint;->updateHint()V

    :cond_7
    invoke-direct {p0}, Lcom/android/camera/Camera;->registerReceiver()V

    invoke-direct {p0}, Lcom/android/camera/Camera;->registerSDReceiver()V

    invoke-direct {p0}, Lcom/android/camera/Camera;->resumeCamera()V

    iput-boolean v3, p0, Lcom/android/camera/Camera;->mIsModeSwitched:Z

    invoke-static {}, Lcom/android/camera/ThermalDetector;->getInstance()Lcom/android/camera/ThermalDetector;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ThermalDetector;->registerReceiver()V

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isImageCaptureIntent()Z

    move-result v1

    if-nez v1, :cond_9

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->isVideoCaptureIntent()Z

    move-result v1

    if-eqz v1, :cond_8

    goto :goto_0

    :cond_8
    goto :goto_1

    :cond_9
    :goto_0
    move v3, v0

    :goto_1
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    if-nez v1, :cond_a

    new-instance v1, Lcom/android/camera/storage/ImageSaver;

    iget-object v2, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v3}, Lcom/android/camera/storage/ImageSaver;-><init>(Lcom/android/camera/storage/ImageSaver$ImageSaverCallback;Landroid/os/Handler;Z)V

    iput-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    :cond_a
    iget-object v1, p0, Lcom/android/camera/Camera;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    invoke-virtual {v1, v3}, Lcom/android/camera/storage/ImageSaver;->onHostResume(Z)V

    invoke-direct {p0}, Lcom/android/camera/Camera;->bindServices()V

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->triggerWatchDog(Z)V

    invoke-static {p0}, Lcom/android/camera/Util;->updateAccessibility(Landroid/content/Context;)V

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onResume end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v0, "onSaveInstanceState"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStop()V
    .locals 2

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onStop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mActivityStopped:Z

    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    iput-boolean v1, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    iget-boolean v1, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    if-nez v1, :cond_0

    invoke-virtual {p0, v0, v0}, Lcom/android/camera/Camera;->releaseAll(ZZ)V

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/Camera;->unbindServices()V

    invoke-direct {p0}, Lcom/android/camera/Camera;->boostParallelServiceAdj()V

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onStop end"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onUserInteraction()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->onUserInteraction()V

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "onUserInteraction"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0}, Lcom/android/camera/AutoLockManager;->getInstance(Landroid/content/Context;)Lcom/android/camera/AutoLockManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/AutoLockManager;->onUserInteraction()V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0}, Lcom/android/camera/module/Module;->onUserInteraction()V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onWindowFocusChanged hasFocus->"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->onWindowFocusChanged(Z)V

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mHasFocus:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/Camera;->isFromKeyguard()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string v1, "setupCamera in onWindowFocusChanged"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/Camera;->mHasbeenSetupOnFocusChanged:Z

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isCurrentModuleAlive()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mStartControl:Lcom/android/camera/module/loader/StartControl;

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setupCamera(Lcom/android/camera/module/loader/StartControl;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {v0, p1}, Lcom/android/camera/module/Module;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0, p1}, Lcom/android/camera/CameraBrightness;->onWindowFocusChanged(Z)V

    :cond_2
    if-eqz p1, :cond_3

    invoke-static {p0}, Lcom/android/camera/Util;->checkLockedOrientation(Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    invoke-interface {p1}, Lcom/android/camera/module/Module;->checkActivityOrientation()V

    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    invoke-virtual {p1}, Lcom/android/camera/SensorStateManager;->register()V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/android/camera/Camera;->mSensorStateManager:Lcom/android/camera/SensorStateManager;

    const/16 v0, 0x7f

    invoke-virtual {p1, v0}, Lcom/android/camera/SensorStateManager;->unregister(I)V

    :cond_4
    :goto_0
    return-void
.end method

.method public pause()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isRecording()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->pause()V

    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 10

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->forceDestroy()V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->create(I)V

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/EffectChangedListenerController;->setHoldKey(I)V

    new-instance v0, Lcom/android/camera/module/impl/ImplFactory;

    invoke-direct {v0}, Lcom/android/camera/module/impl/ImplFactory;-><init>()V

    iput-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/16 v3, 0xab

    aput v3, v1, v2

    invoke-virtual {v0, p0, v1}, Lcom/android/camera/module/impl/ImplFactory;->initBase(Lcom/android/camera/ActivityBase;[I)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraIntentManager()Lcom/android/camera/CameraIntentManager;

    iget-object v1, p0, Lcom/android/camera/Camera;->mCameraIntentManager:Lcom/android/camera/CameraIntentManager;

    invoke-virtual {v1}, Lcom/android/camera/CameraIntentManager;->checkCallerLegality()Z

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {p0}, Lcom/android/camera/Camera;->startFromSecureKeyguard()Z

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x1

    move-object v4, v0

    invoke-virtual/range {v4 .. v9}, Lcom/android/camera/data/data/global/DataItemGlobal;->parseIntent(Landroid/content/Intent;Ljava/lang/Boolean;ZZZ)Landroid/support/v4/util/Pair;

    nop

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->isTimeOut()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_0

    :cond_0
    const/4 v1, 0x2

    :goto_0
    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/module/loader/StartControl;->create(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/loader/StartControl;->setResetType(I)Lcom/android/camera/module/loader/StartControl;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->onModeSelected(Lcom/android/camera/module/loader/StartControl;)V

    return-void
.end method

.method public releaseAll(ZZ)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityStopped()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/Camera;->mReleaseByModule:Z

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/Camera;->releaseAll(ZZZ)V

    return-void
.end method

.method public removeNewBie()V
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->drawBlackFrame(Z)V

    nop

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentTransaction;->remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method public restoreWindowBrightness()V
    .locals 2

    nop

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraBrightness:Lcom/android/camera/CameraBrightness;

    invoke-virtual {v0}, Lcom/android/camera/CameraBrightness;->getCurrentBrightness()I

    move-result v0

    if-lez v0, :cond_0

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/high16 v0, -0x40800000    # -1.0f

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    return-void
.end method

.method public resume()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/Camera;->isRecording()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/android/camera/ActivityBase;->resume()V

    :cond_0
    return-void
.end method

.method public resumeCurrentMode(I)V
    .locals 4

    invoke-direct {p0}, Lcom/android/camera/Camera;->closeCameraSetup()Z

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/Camera;->setSwitchingModule(Z)V

    new-instance v0, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;

    invoke-direct {v0, p1}, Lcom/android/camera/module/loader/FunctionCameraLegacySetup;-><init>(I)V

    new-instance v1, Lcom/android/camera/module/loader/FunctionResumeModule;

    invoke-direct {v1, p1}, Lcom/android/camera/module/loader/FunctionResumeModule;-><init>(I)V

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    invoke-static {p1}, Lcom/android/camera/module/loader/NullHolder;->ofNullable(Ljava/lang/Object;)Lcom/android/camera/module/loader/NullHolder;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Single;->just(Ljava/lang/Object;)Lio/reactivex/Single;

    move-result-object p1

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {p1, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-static {v0}, Lio/reactivex/Single;->create(Lio/reactivex/SingleOnSubscribe;)Lio/reactivex/Single;

    move-result-object v0

    sget-object v2, Lcom/android/camera/constant/GlobalConstant;->sCameraSetupScheduler:Lio/reactivex/Scheduler;

    invoke-virtual {v0, v2}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/Camera;->mCameraSetupDisposableGuard:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/Camera;->mCameraOpenResult:Lio/reactivex/functions/BiFunction;

    invoke-virtual {p1, v0, v3}, Lio/reactivex/Single;->zipWith(Lio/reactivex/SingleSource;Lio/reactivex/functions/BiFunction;)Lio/reactivex/Single;

    move-result-object p1

    invoke-virtual {p1, v1}, Lio/reactivex/Single;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Single;

    move-result-object p1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Single;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/Camera;->mCameraSetupConsumer:Lio/reactivex/functions/Consumer;

    invoke-virtual {p1, v0}, Lio/reactivex/Single;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/Camera;->mCameraSetupDisposable:Lio/reactivex/disposables/Disposable;

    monitor-exit v2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setBlockingLifeCycles(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setWindowBrightness(I)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setBrightnessRampRate(I)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/android/camera/Camera;->setScreenEffect(Z)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    int-to-float p1, p1

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr p1, v1

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public showLensDirtyDetectedHint()V
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gz()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/Camera$10;

    invoke-direct {v1, p0}, Lcom/android/camera/Camera$10;-><init>(Lcom/android/camera/Camera;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    const-string v1, "LensDirtyDetectDialog"

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;

    invoke-direct {v0}, Lcom/android/camera/fragment/dialog/LensDirtyDetectDialogFragment;-><init>()V

    const/4 v1, 0x2

    const v2, 0x7f0d0003

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "LensDirtyDetectDialog"

    invoke-virtual {v1, v0, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    :cond_1
    :goto_0
    return-void
.end method

.method public showNewBie(I)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-eq p1, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/android/camera/CameraScreenNail;->drawBlackFrame(Z)V

    :cond_0
    const v2, 0x7f0d0021

    const/4 v3, 0x0

    packed-switch p1, :pswitch_data_0

    return v3

    :pswitch_0
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-eqz p1, :cond_1

    return v3

    :cond_1
    new-instance p1, Lcom/android/camera/fragment/dialog/UltraWideNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/UltraWideNewbieDialogFragment;-><init>()V

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "UltraWideHint"

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    const-string p1, "UltraWideHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    const-string v1, "pref_camera_first_ultra_wide_use_hint_shown_key"

    invoke-interface {p1, v1, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return v0

    :pswitch_1
    invoke-virtual {p0}, Lcom/android/camera/Camera;->isActivityPaused()Z

    move-result p1

    if-eqz p1, :cond_2

    return v3

    :cond_2
    new-instance p1, Lcom/android/camera/fragment/dialog/AiSceneNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/AiSceneNewbieDialogFragment;-><init>()V

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "AiSceneHint"

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    const-string p1, "AiSceneHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemGlobal()Lcom/android/camera/data/data/global/DataItemGlobal;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/DataItemGlobal;->editor()Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    const-string v1, "pref_camera_first_ai_scene_use_hint_shown_key"

    invoke-interface {p1, v1, v3}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->putBoolean(Ljava/lang/String;Z)Lcom/android/camera/data/provider/DataProvider$ProviderEditor;

    move-result-object p1

    invoke-interface {p1}, Lcom/android/camera/data/provider/DataProvider$ProviderEditor;->apply()V

    return v0

    :pswitch_2
    new-instance p1, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/FrontRotateNewbieDialogFragment;-><init>()V

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "RotateHint"

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    const-string p1, "RotateHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    return v0

    :pswitch_3
    new-instance p1, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;

    invoke-direct {p1}, Lcom/android/camera/fragment/dialog/PortraitNewbieDialogFragment;-><init>()V

    invoke-virtual {p1, v1, v2}, Landroid/support/v4/app/DialogFragment;->setStyle(II)V

    invoke-virtual {p0}, Lcom/android/camera/Camera;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v1

    const-string v2, "PortraitHint"

    invoke-virtual {v1, p1, v2}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/app/FragmentTransaction;->commitAllowingStateLoss()I

    const-string p1, "PortraitHint"

    iput-object p1, p0, Lcom/android/camera/Camera;->newbieDialogFragmentTag:Ljava/lang/String;

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public unRegisterProtocol()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/Camera;->mImplFactory:Lcom/android/camera/module/impl/ImplFactory;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/ImplFactory;->detachBase()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    invoke-virtual {v0}, Lcom/android/camera/fragment/BaseFragmentDelegate;->unRegisterProtocol()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/Camera;->mBaseFragmentDelegate:Lcom/android/camera/fragment/BaseFragmentDelegate;

    :cond_1
    return-void
.end method

.method public updateSurfaceState(I)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/ActivityBase;->updateSurfaceState(I)V

    const/4 v0, 0x4

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/Camera;->mCamera2OpenOnSubScribe:Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;

    invoke-virtual {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenOnSubScribe;->onGlSurfaceCreated()V

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isCapture()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/Camera;->mCurrentModule:Lcom/android/camera/module/Module;

    check-cast p1, Lcom/android/camera/module/BaseModule;

    invoke-virtual {p1}, Lcom/android/camera/module/BaseModule;->updatePreviewSurface()V

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/android/camera/Camera;->TAG:Ljava/lang/String;

    const-string/jumbo v0, "updateSurfaceState: module has not been initialized"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method
