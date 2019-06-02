.class public Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Lcom/android/camera/CameraScreenNail$ExternalFrameProcessor;
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;
.implements Lcom/android/camera2/Camera2Proxy$PreviewCallback;


# static fields
.field private static final HANDLER_RECORDING_CURRENT_FILE_SIZE:I = 0x3

.field private static final HANDLER_RECORDING_CURRENT_TIME:I = 0x1

.field private static final HANDLER_RECORDING_MAX_DURATION_REACHED:I = 0x2

.field private static final HANDLER_RECORDING_MAX_FILE_SIZE_REACHED:I = 0x4

.field private static final HANDLER_RESOURCE_ERROR_BROKEN:I = 0x0

.field private static final START_OFFSET_MS:J = 0x1c2L

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mActivityBase:Lcom/android/camera/ActivityBase;

.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private final mAvatarLock:Ljava/lang/Object;

.field private mAvatarTemplatePath:Ljava/lang/String;

.field private mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

.field private mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

.field private mContentValues:Landroid/content/ContentValues;

.field private mContext:Landroid/content/Context;

.field private mCountDownTimer:Landroid/os/CountDownTimer;

.field private mCurrentScreenOrientation:I

.field private mDeviceRotation:I

.field private mDrawSize:Landroid/util/Size;

.field private mFaceDectectResult:I

.field private mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private mHandler:Landroid/os/Handler;

.field private mIsFaceDetectSuccess:Z

.field private mIsFrontCamera:Z

.field private mIsRecordStopping:Z

.field private volatile mIsRecording:Z

.field private mIsShutterButtonClick:Z

.field private mIsStopRender:Z

.field private mLastNeedBeauty:Z

.field private mLoadHandler:Landroid/os/Handler;

.field private mLoadResourceHandler:Landroid/os/Handler;

.field private mLoadResourceThread:Landroid/os/HandlerThread;

.field private mLoadThread:Landroid/os/HandlerThread;

.field private mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

.field private mMaxVideoDurationInMs:I

.field private mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

.field private mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

.field private mNeedCapture:Z

.field private mNeedShowNoFaceTips:Z

.field private mOrientation:I

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mRecordModule:Lcom/arcsoft/avatar/RecordModule;

.field private mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

.field private mSaveVideoPath:Ljava/lang/String;

.field private mShowAvatar:Z

.field private mTextureId:[I

.field private mUiHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3a98

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMaxVideoDurationInMs:I

    const/16 v0, 0x5a

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    const-string v1, ""

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    iput v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "LoadConfig"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    new-instance v2, Landroid/os/HandlerThread;

    const-string v3, "LoadResource"

    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa6

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/recoder/RecordingListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    return p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/ActivityBase;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return p1
.end method

.method static synthetic access$1702(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    return p1
.end method

.method static synthetic access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/ContentValues;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/util/Size;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    return p0
.end method

.method static synthetic access$2200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    return p0
.end method

.method static synthetic access$2300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    return p0
.end method

.method static synthetic access$2400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onProfileFinish()V

    return-void
.end method

.method static synthetic access$2500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/module/impl/component/MimojiStatusManager;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    return-object p0
.end method

.method static synthetic access$602(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$802(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    return p1
.end method

.method static synthetic access$900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    return-object p0
.end method

.method private animateCapture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setAvatarInited(Z)V

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private createAvatar([BII)V
    .locals 14

    move-object v0, p0

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    if-eq v1, v2, :cond_0

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    :cond_0
    new-instance v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;

    invoke-direct {v1}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;-><init>()V

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v4, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    mul-int/lit8 v7, p2, 0x4

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x0

    sget-object v13, Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;->INSTANCE:Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;

    move/from16 v5, p2

    move/from16 v6, p3

    move-object v8, p1

    move-object v11, v1

    invoke-virtual/range {v3 .. v13}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProfile(Ljava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I

    move-result v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "avatarProfile res: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", status:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", gender: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->gender:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v4, 0xfe

    if-eq v2, v4, :cond_a

    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v4, 0xf6

    if-ne v2, v4, :cond_1

    goto/16 :goto_1

    :cond_1
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_2

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034d

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_2
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x2

    if-nez v2, :cond_3

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034e

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_3
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x4

    if-nez v2, :cond_4

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f09034f

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_4
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x8

    if-nez v2, :cond_5

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090350

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_5
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x10

    if-nez v2, :cond_6

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090351

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_6
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x20

    if-nez v2, :cond_7

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090352

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_7
    iget v2, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v2, v2, 0x40

    if-nez v2, :cond_8

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090353

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_8
    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_9

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090354

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_9
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f090355

    invoke-static {v1, v2, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    :goto_0
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, v4}, Lcom/android/camera/module/LiveModule;->onMimojiCreateCompleted(Z)V

    return-void

    :cond_a
    :goto_1
    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "result = "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private getMimojiPara()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iget-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    if-eqz v1, :cond_5

    const-string v1, ""

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v1, "custom"

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PigTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v1, "pig"

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->BearTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v1, "bear"

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RoyanTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v1, "royan"

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    sget-object v3, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->RabbitTemplatePath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v1, "rabbit"

    :cond_4
    :goto_0
    const-string v2, "\u840c\u62cd\u5206\u7c7b"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_5
    const-string v1, "\u840c\u62cd\u5206\u7c7b"

    const-string v2, "null"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_1
    return-object v0
.end method

.method private initMimojiResource(Landroid/content/Context;)V
    .locals 3

    sget-object p1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->hasDir(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/module/impl/component/FileUtils;->delDir(Ljava/lang/String;)Z

    :cond_0
    const p1, 0x8000

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const-string v1, "mimoji/data.zip"

    sget-object v2, Lcom/android/camera/fragment/mimoji/MimojiHelper;->MIMOJI_DIR:Ljava/lang/String;

    invoke-static {v0, v1, v2, p1}, Lcom/android/camera/Util;->verifyAssetZip(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "verify asset zip failed..."

    invoke-static {v0, v1, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->fR()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/CameraSettings;->getMimojiModleVersion()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setIsLoading(Z)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadResourceHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$createAvatar$0(I)V
    .locals 0

    return-void
.end method

.method private onProfileFinish()V
    .locals 3

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "onProfileFinish"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->onPostSavingFinish()V

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMimojiFaceDetect(ZI)V

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->releaseRender()V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiEnd()V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->startMimojiEdit()V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/module/LiveModule;->onMimojiCreateCompleted(Z)V

    const-string v0, "\u840c\u62cd\u53d6\u666f\u9875\u70b9\u51fb\u62cd\u7167"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiClick(Ljava/lang/String;)V

    return-void
.end method

.method private release()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "avatar release"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setAvatarInited(Z)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    return-void
.end method

.method private resetConfig()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getMode()I

    move-result v0

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    if-eq v0, v1, :cond_2

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    if-eq v0, v1, :cond_1

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    if-ne v0, v1, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->resetConfig()V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3
    :goto_1
    return-void
.end method

.method private updateBeauty()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/BaseModule;

    instance-of v1, v0, Lcom/android/camera/module/LiveModule;

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningShine()Lcom/android/camera/data/data/runing/ComponentRunningShine;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportBeautyLevel()Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x3

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningShine;->supportSmoothLevel()Z

    move-result v1

    if-eqz v1, :cond_2

    const/16 v1, 0x28

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautySmoothLevel(I)V

    :cond_2
    :goto_0
    const/4 v1, 0x1

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/16 v3, 0xd

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/android/camera/module/BaseModule;->updatePreferenceInWorkThread([I)V

    return-void
.end method

.method private updateVideoOrientation(I)V
    .locals 3

    const/16 v0, 0x13b

    if-le p1, v0, :cond_0

    const/16 v1, 0x168

    if-le p1, v1, :cond_1

    :cond_0
    const/16 v1, 0x2d

    if-ltz p1, :cond_2

    if-gt p1, v1, :cond_2

    :cond_1
    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_2
    const/16 v2, 0x87

    if-le p1, v1, :cond_3

    if-gt p1, v2, :cond_3

    const/16 p1, 0x5a

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_3
    const/16 v1, 0xe1

    if-le p1, v2, :cond_4

    if-gt p1, v1, :cond_4

    const/16 p1, 0xb4

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    goto :goto_0

    :cond_4
    if-le p1, v1, :cond_5

    if-gt p1, v0, :cond_5

    const/16 p1, 0x10e

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    :cond_5
    :goto_0
    return-void
.end method


# virtual methods
.method public backToPreview(ZZ)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v0, v0, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->isPrefabModel(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object v1, v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mAvatarTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object v1, v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    iget-object v1, v1, Lcom/android/camera/fragment/mimoji/MimojiInfo;->mConfigPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    const/4 v1, 0x1

    if-nez v0, :cond_3

    if-eqz p1, :cond_4

    :cond_3
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    :cond_4
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xac

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xaf

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    if-eqz p2, :cond_5

    invoke-static {}, Lcom/android/camera/CameraSettings;->getMimojiPannelState()Z

    move-result p2

    if-nez p2, :cond_5

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showMimoji()V

    :cond_5
    const/4 p2, -0x1

    invoke-interface {v0, p1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->alertMimojiFaceDetect(ZI)V

    const/4 p2, 0x2

    new-array p2, p2, [I

    fill-array-data p2, :array_0

    invoke-interface {v0, v1, p2}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->enableMenuItem(Z[I)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p2, v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    :cond_6
    invoke-virtual {p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->setDisableSingleTapUp(Z)V

    return-void

    :array_0
    .array-data 4
        0xe1
        0xc1
    .end array-data
.end method

.method public initAvatarEngine(IIIIZ)V
    .locals 9

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "initAvatarEngine with parameters : displayOrientation = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", width = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", height = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", isFrontCamera = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    iput p4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    iput-boolean p5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iput p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-direct {p0, p2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->initMimojiResource(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p2}, Lcom/android/camera/ActivityBase;->startFromKeyguard()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {p2, v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->reset()V

    :cond_0
    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "avatar start init"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsAvatarInited()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "avatar need really init"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->init(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->createOutlineEngine(Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0, v2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setAvatarInited(Z)V

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->resetConfig()V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-nez v0, :cond_2

    new-instance v0, Lcom/arcsoft/avatar/RecordModule;

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    invoke-direct {v0, v1, v2}, Lcom/arcsoft/avatar/RecordModule;-><init>(Landroid/content/Context;Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget-object v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    move v4, p1

    move v5, p3

    move v6, p4

    move v8, p5

    invoke-virtual/range {v3 .. v8}, Lcom/arcsoft/avatar/RecordModule;->init(IIILcom/arcsoft/avatar/AvatarEngine;Z)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/RecordModule;->setmImageOrientation(I)V

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {p1, p5}, Lcom/arcsoft/avatar/RecordModule;->setMirror(Z)V

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {p1, p3, p4}, Lcom/arcsoft/avatar/RecordModule;->setPreviewSize(II)V

    :goto_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/android/camera/Util;->getPreviewRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    sget p4, Lcom/android/camera/Util;->sWindowHeight:I

    iget p5, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p4, p5

    iget p5, p1, Landroid/graphics/Rect;->right:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p3, v1, p4, p5, v0}, Lcom/arcsoft/avatar/RecordModule;->setDrawScope(IIII)V

    new-instance p3, Landroid/util/Size;

    iget p4, p1, Landroid/graphics/Rect;->right:I

    iget p5, p1, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p5, p1

    invoke-direct {p3, p4, p5}, Landroid/util/Size;-><init>(II)V

    iput-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isOnCreateMimoji()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    return v0
.end method

.method public isRecordStopping()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    return v0
.end method

.method public isRecording()Z
    .locals 3

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recording = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return v0
.end method

.method public onCaptureImage()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v1}, Lcom/android/camera/ActivityBase;->getCurrentModuleIndex()I

    move-result v1

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->getFlashMode(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getMimojiPara()Ljava/util/Map;

    move-result-object v2

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v2, v1, v0, v3}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiCaptureOrRecord(Ljava/util/Map;Ljava/lang/String;ZZ)V

    return-void
.end method

.method public onCreateCapture()Z
    .locals 5

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "onCreateCapture"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    instance-of v2, v0, Lcom/android/camera/module/LiveModule;

    const/4 v3, 0x1

    if-eqz v2, :cond_1

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-static {v1}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    new-array v2, v3, [I

    const/16 v4, 0xd

    aput v4, v2, v1

    invoke-virtual {v0, v2}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    invoke-interface {v0, v3}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideMimojiProgress(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_2

    const/16 v1, 0x13

    const v2, 0x7f09034c

    const/4 v4, 0x2

    invoke-interface {v0, v1, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    :cond_2
    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->animateCapture()V

    return v3

    :cond_3
    :goto_0
    return v1
.end method

.method public onDeviceRotationChange(I)V
    .locals 1

    iput p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    invoke-direct {p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateVideoOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->onDeviceRotationChange(I)V

    :cond_0
    return-void
.end method

.method public onDrawFrame(Landroid/graphics/Rect;IIZ)V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    if-nez v0, :cond_2

    nop

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    invoke-static {v0, v0, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    goto :goto_0

    :cond_0
    sget p2, Lcom/android/camera/Util;->sWindowHeight:I

    iget p3, p1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p2, p3

    iget p3, p1, Landroid/graphics/Rect;->right:I

    iget p4, p1, Landroid/graphics/Rect;->bottom:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p4, p1

    invoke-static {v0, p2, p3, p4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {p1}, Lcom/arcsoft/avatar/RecordModule;->capture()V

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedCapture:Z

    :cond_1
    :goto_0
    const/high16 p1, 0x3f800000    # 1.0f

    const/4 p2, 0x0

    invoke-static {p2, p2, p2, p1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0x4000

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/16 v1, 0x5a

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    const/4 v7, 0x0

    iget-boolean v8, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual/range {v0 .. v8}, Lcom/arcsoft/avatar/RecordModule;->startRender(IZIIZ[I[BZ)V

    :cond_2
    return-void
.end method

.method public onMimojiCreate()V
    .locals 4

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "start create mimoji"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_CREATE:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiStart()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$RecordState;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$RecordState;->prepareCreateMimoji()V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    const/16 v1, 0x13

    const v2, 0x7f090344

    const/4 v3, 0x2

    invoke-interface {v0, v1, v2, v3}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    :cond_0
    return-void
.end method

.method public onMimojiDeleted()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiStatusManager;->mCurrentMimojiInfo:Lcom/android/camera/fragment/mimoji/MimojiInfo;

    return-void
.end method

.method public onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onPreviewFrame(Landroid/media/Image;Lcom/android/camera2/Camera2Proxy;I)V
    .locals 10

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsAvatarInited()Z

    move-result p2

    if-eqz p2, :cond_c

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez p2, :cond_0

    goto/16 :goto_6

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-static {p1}, Lcom/arcsoft/avatar/util/AsvloffscreenUtil;->buildNV21SingleBuffer(Landroid/media/Image;)Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;

    move-result-object v7

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "buildNV21SingleBuffer spend time  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/4 v8, 0x0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v2, v3, v4}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v2

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual {v1, v7, v2, v3}, Lcom/arcsoft/avatar/RecordModule;->startProcess(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ)Z

    move-result v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_2

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    if-eqz v3, :cond_2

    move v3, v2

    goto :goto_0

    :cond_2
    move v3, v8

    :goto_0
    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mNeedShowNoFaceTips:Z

    if-eq v0, v3, :cond_3

    goto :goto_1

    :cond_3
    move v2, v8

    :goto_1
    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mUiHandler:Landroid/os/Handler;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;

    invoke-direct {v2, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_4
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    if-eq v0, v1, :cond_5

    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLastNeedBeauty:Z

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateBeauty()V

    :cond_5
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->requestRender()V

    goto :goto_3

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_6
    :goto_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-nez v0, :cond_7

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    :cond_7
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_8

    new-instance v5, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;

    invoke-direct {v5}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;-><init>()V

    iget-object v9, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_2
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v2, 0x5a

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    const/4 v6, 0x1

    move-object v1, v7

    invoke-virtual/range {v0 .. v6}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProcessWithInfoEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;Z)I

    monitor-exit v9
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "avatar edit process time = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->requestRender()V

    goto :goto_3

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_8
    :goto_3
    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "process frame spend time  = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {p2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result p2

    if-eqz p2, :cond_9

    iput-boolean v8, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_4
    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v0, v1, v2}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v0

    invoke-virtual {p3, v7, v0}, Lcom/arcsoft/avatar/AvatarEngine;->outlineProcessEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;I)I

    move-result p3

    iput p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    monitor-exit p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz p2, :cond_9

    iget-object p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    invoke-interface {p2, p3}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiFaceDetect(I)V

    goto :goto_4

    :catchall_2
    move-exception p1

    :try_start_5
    monitor-exit p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1

    :cond_9
    :goto_4
    iget-boolean p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    if-eqz p2, :cond_b

    iput-boolean v8, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p2

    aget-object p2, p2, v8

    invoke-virtual {p2}, Landroid/media/Image$Plane;->getRowStride()I

    move-result p2

    invoke-virtual {v7}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getYData()[B

    move-result-object p3

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result p1

    invoke-static {p3, v0, p1, p2}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rawByteArray2RGBABitmap([BIII)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-boolean p2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    if-eqz p2, :cond_a

    const/16 p2, -0x5a

    goto :goto_5

    :cond_a
    const/16 p2, 0x5a

    :goto_5
    invoke-static {p1, p2}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/2addr v0, v1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->createAvatar([BII)V

    :cond_b
    return-void

    :cond_c
    :goto_6
    sget-object p1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onPreviewFrame Error mAvatar = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onRecordStart(Landroid/content/ContentValues;)V
    .locals 4

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "start record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModuleIndex()I

    move-result v0

    invoke-static {v0}, Lcom/android/camera/CameraSettings;->getFlashMode(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->getMimojiPara()Ljava/util/Map;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    const/4 v3, 0x0

    invoke-static {v1, v0, v3, v2}, Lcom/android/camera/statistic/CameraStatUtil;->trackMimojiCaptureOrRecord(Ljava/util/Map;Ljava/lang/String;ZZ)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    iput-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    const-string v0, "_data"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateRecordingTime()V

    return-void
.end method

.method public onRecordStop(Z)V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "stop record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecordStopping:Z

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mGetThumCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->cancel()V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "reset"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/RecordModule;->reset()V

    :cond_0
    return-void
.end method

.method public registerProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->attachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    return-void
.end method

.method public releaseRender()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInPreviewSurface()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->releaseRender()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setDetectSuccess(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    return-void
.end method

.method public setDisableSingleTapUp(Z)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/LiveModule;->setDisableSingleTapUp(Z)V

    return-void
.end method

.method public unRegisterProtocol()V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xd9

    invoke-virtual {v0, v1, p0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->detachProtocol(ILcom/android/camera/protocol/ModeProtocol$BaseProtocol;)V

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->release()V

    return-void
.end method

.method protected updateRecordingTime()V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    :cond_0
    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$7;

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMaxVideoDurationInMs:I

    int-to-long v1, v1

    const-wide/16 v3, 0x1c2

    add-long/2addr v3, v1

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$7;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method
