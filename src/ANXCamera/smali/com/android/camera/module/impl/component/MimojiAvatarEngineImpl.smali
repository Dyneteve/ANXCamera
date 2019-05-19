.class public Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
.super Ljava/lang/Object;
.source "MimojiAvatarEngineImpl.java"

# interfaces
.implements Lcom/android/camera/protocol/ModeProtocol$MimojiAvatarEngine;


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

.field private mHandler:Landroid/os/Handler;

.field private mIsFaceDetectSuccess:Z

.field private mIsFrontCamera:Z

.field private mIsRecording:Z

.field private mIsShutterButtonClick:Z

.field private mIsStopRender:Z

.field private mLoadHandler:Landroid/os/Handler;

.field private mLoadThread:Landroid/os/HandlerThread;

.field private mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

.field private mMaxVideoDurationInMs:I

.field private mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

.field private mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

.field private mOrientation:I

.field private mPreviewHeight:I

.field private mPreviewWidth:I

.field private mRecordModule:Lcom/arcsoft/avatar/RecordModule;

.field private mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

.field private mSaveVideoPath:Ljava/lang/String;

.field private mShowAvatar:Z

.field private mTextureId:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera/ActivityBase;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x3a98

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMaxVideoDurationInMs:I

    const/16 v0, 0x5a

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iput v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    iput-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    const/4 v1, 0x1

    iput v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    iput-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    new-instance v0, Landroid/os/HandlerThread;

    const-string v2, "LoadConfig"

    invoke-direct {v0, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    new-array v0, v1, [I

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$9;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$14;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$15;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getGLView()Lcom/android/camera/ui/V6CameraGLSurfaceView;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraAppImpl()Lcom/android/camera/CameraAppImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/CameraAppImpl;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa6

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/extra/DataItemLive;->getMimojiStatusManager()Lcom/android/camera/module/impl/component/MimojiStatusManager;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

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

.method static synthetic access$1000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/content/ContentValues;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContentValues:Landroid/content/ContentValues;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mSaveVideoPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/recoder/RecordingListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordingListener:Lcom/arcsoft/avatar/recoder/RecordingListener;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCurrentScreenOrientation:I

    return p0
.end method

.method static synthetic access$1400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    return p0
.end method

.method static synthetic access$1500(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    return p0
.end method

.method static synthetic access$1600(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/ActivityBase;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/util/Size;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    return p0
.end method

.method static synthetic access$1900(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->onProfileFinish()V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/android/camera/module/impl/component/MimojiStatusManager;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    return-object p0
.end method

.method static synthetic access$400(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/AvatarEngine;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    return-object p0
.end method

.method static synthetic access$502(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    return p1
.end method

.method static synthetic access$602(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Lcom/arcsoft/avatar/RecordModule;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$802(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarTemplatePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$902(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return p1
.end method

.method private animateCapture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    invoke-virtual {v0, v1}, Lcom/android/camera/CameraScreenNail;->animateCapture(I)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    return-void
.end method

.method public static create(Lcom/android/camera/ActivityBase;)Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;
    .locals 1

    new-instance v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;

    invoke-direct {v0, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;-><init>(Lcom/android/camera/ActivityBase;)V

    return-object v0
.end method

.method private createAvatar([BII)V
    .locals 14

    move-object v0, p0

    new-instance v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;

    invoke-direct {v12}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;-><init>()V

    iget-object v13, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v13

    :try_start_0
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    mul-int/lit8 v5, p2, 0x4

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v10, 0x0

    sget-object v11, Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;->INSTANCE:Lcom/android/camera/module/impl/component/-$$Lambda$MimojiAvatarEngineImpl$RJYDigwssyCC_737Br9t7yY1-rs;

    move/from16 v3, p2

    move/from16 v4, p3

    move-object v6, p1

    move-object v9, v12

    invoke-virtual/range {v1 .. v11}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProfile(Ljava/lang/String;III[BIZLcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileInfo;Lcom/arcsoft/avatar/AvatarConfig$UpdateProgressCallback;)I

    move-result v1

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "avatarProfile res: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", status:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", gender: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v4, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->gender:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/arcsoft/avatar/util/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v2, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v3, 0xfe

    if-eq v2, v3, :cond_9

    iget v2, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/16 v3, 0xf6

    if-ne v2, v3, :cond_0

    goto/16 :goto_1

    :cond_0
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902b9

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_1
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902ba

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto/16 :goto_0

    :cond_2
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_3

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902bb

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_3
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_4

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902bc

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_4
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x10

    if-nez v1, :cond_5

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902bd

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_5
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x20

    if-nez v1, :cond_6

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902be

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_6
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit8 v1, v1, 0x40

    if-nez v1, :cond_7

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902bf

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_7
    iget v1, v12, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProfileResult;->status:I

    and-int/lit16 v1, v1, 0x80

    if-nez v1, :cond_8

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902c0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_8
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    const v2, 0x7f0902c1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    :goto_0
    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$13;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :cond_9
    :goto_1
    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "result = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;

    invoke-direct {v2, v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$12;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v1, v2}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private initResource()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$1;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method static synthetic lambda$createAvatar$0(I)V
    .locals 0

    return-void
.end method

.method private onProfileFinish()V
    .locals 2

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

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyHideTips()V

    :cond_1
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
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$11;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private release()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$4;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    return-void
.end method

.method private resetConfig()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->getMode()I

    move-result v0

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$2;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    const-wide/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    :cond_0
    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    if-eq v0, v1, :cond_2

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EIDT:I

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_NONE:I

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    goto :goto_2

    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget v2, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_EDIT_MID:I

    if-ne v0, v2, :cond_3

    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempOriginalConfigPath:Ljava/lang/String;

    goto :goto_1

    :cond_3
    sget-object v0, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TempEditConfigPath:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xe0

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->resetConfig()V

    :cond_4
    nop

    :cond_5
    :goto_2
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
.method public backToPreview(Z)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    sget v1, Lcom/android/camera/module/impl/component/MimojiStatusManager;->MIMOJI_PREVIEW:I

    invoke-virtual {v0, v1}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setMode(I)V

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xac

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$TopAlert;

    invoke-interface {v0, p1}, Lcom/android/camera/protocol/ModeProtocol$TopAlert;->showOrHideMimojiCreateTitle(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/4 v1, 0x1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v0}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v0

    check-cast v0, Lcom/android/camera/module/LiveModule;

    invoke-virtual {v0, p1}, Lcom/android/camera/module/LiveModule;->setDisableSingleTapUp(Z)V

    return-void
.end method

.method public initAvatarEngine(IIIIZ)V
    .locals 11

    move-object v0, p0

    move v3, p3

    move v4, p4

    move/from16 v6, p5

    sget-object v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "initAvatarEngine with parameters : displayOrientation = "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v5, p1

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", width = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", height = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ", isFrontCamera = "

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v7, 0x0

    iput-boolean v7, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iput v3, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewWidth:I

    iput v4, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mPreviewHeight:I

    iput-boolean v6, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    move v1, p2

    iput v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    if-nez v1, :cond_0

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Landroid/os/Handler;

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    :cond_0
    iget-object v8, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v8

    :try_start_0
    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->queryAvatar()Lcom/arcsoft/avatar/AvatarEngine;

    move-result-object v1

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    sget-object v9, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    sget-object v10, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2, v9, v10}, Lcom/arcsoft/avatar/AvatarEngine;->init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v9, 0x1

    invoke-virtual {v1, v9, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setRenderScene(ZF)V

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->createOutlineEngine(Ljava/lang/String;)I

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    new-instance v1, Lcom/arcsoft/avatar/RecordModule;

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    iget-object v10, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCaptureCallback:Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;

    invoke-direct {v1, v2, v10}, Lcom/arcsoft/avatar/RecordModule;-><init>(Landroid/content/Context;Lcom/arcsoft/avatar/RecordModule$MediaResultCallback;)V

    iput-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget-object v10, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    move v2, v5

    move-object v5, v10

    invoke-virtual/range {v1 .. v6}, Lcom/arcsoft/avatar/RecordModule;->init(IIILcom/arcsoft/avatar/AvatarEngine;Z)V

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v1

    iget-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    sget v3, Lcom/android/camera/Util;->sWindowHeight:I

    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v4

    iget v4, v1, Landroid/graphics/Rect;->right:I

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    iget v6, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v6

    invoke-virtual {v2, v7, v3, v4, v5}, Lcom/arcsoft/avatar/RecordModule;->setDrawScope(IIII)V

    new-instance v2, Landroid/util/Size;

    iget v3, v1, Landroid/graphics/Rect;->right:I

    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v1

    invoke-direct {v2, v3, v4}, Landroid/util/Size;-><init>(II)V

    iput-object v2, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDrawSize:Landroid/util/Size;

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->resetConfig()V

    iget-object v1, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->init(Landroid/content/Context;)V

    invoke-direct {v0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->initResource()V

    iget-object v0, v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0, v9}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->setAvatarInited(Z)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isOnCreateMimoji()Z
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    return v0
.end method

.method public isRecording()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsRecording:Z

    return v0
.end method

.method public onCaptureImage()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/RecordModule;->capture()V

    return-void
.end method

.method public onCreateCapture()Z
    .locals 5

    iget v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa2

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$ActionProcessing;->showOrHideMimojiProgress(Z)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v2, 0xaf

    invoke-virtual {v0, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_1

    const/16 v2, 0x13

    const v3, 0x7f0902b8

    const/4 v4, 0x2

    invoke-interface {v0, v2, v3, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->showTips(III)V

    :cond_1
    iput-boolean v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-direct {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->animateCapture()V

    return v1

    :cond_2
    :goto_0
    const/4 v0, 0x0

    return v0
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

.method public onDrawFrame()V
    .locals 10

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsStopRender:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;)Landroid/graphics/Rect;

    move-result-object v0

    const/4 v1, 0x0

    sget v2, Lcom/android/camera/Util;->sWindowHeight:I

    iget v3, v0, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v2, v3

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    iget v0, v0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v4, v0

    invoke-static {v1, v2, v3, v4}, Landroid/opengl/GLES20;->glViewport(IIII)V

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {v1, v1, v1, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 v0, 0x4000

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/16 v2, 0x5a

    iget-boolean v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mTextureId:[I

    const/4 v8, 0x0

    iget-boolean v9, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual/range {v1 .. v9}, Lcom/arcsoft/avatar/RecordModule;->startRender(IZIIZ[I[BZ)V

    :cond_0
    return-void
.end method

.method public onMimojiCreate()V
    .locals 2

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

    return-void
.end method

.method public onMimojiSelect(Lcom/android/camera/fragment/mimoji/MimojiInfo;)V
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mLoadHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$5;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Lcom/android/camera/fragment/mimoji/MimojiInfo;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onPreviewFrame(Landroid/media/Image;)V
    .locals 12

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsAvatarInited()Z

    move-result v0

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    goto/16 :goto_4

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p1}, Lcom/arcsoft/avatar/util/AsvloffscreenUtil;->buildNV21SingleBuffer(Landroid/media/Image;)Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;

    move-result-object v8

    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "buildNV21SingleBuffer spend time  = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    const/4 v9, 0x0

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v2}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEdit()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mRecordModule:Lcom/arcsoft/avatar/RecordModule;

    iget v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v6, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v4, v5, v6}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v4

    iget-boolean v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    invoke-virtual {v3, v8, v4, v5}, Lcom/arcsoft/avatar/RecordModule;->startProcess(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZ)Z

    move-result v3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    invoke-virtual {v2}, Lcom/android/camera/ActivityBase;->getCurrentModule()Lcom/android/camera/module/Module;

    move-result-object v2

    instance-of v4, v2, Lcom/android/camera/module/LiveModule;

    if-eqz v4, :cond_3

    check-cast v2, Lcom/android/camera/module/LiveModule;

    if-eqz v3, :cond_2

    const/4 v3, 0x3

    goto :goto_0

    :cond_2
    move v3, v9

    :goto_0
    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setFaceBeautyLevel(I)V

    const/4 v3, 0x1

    new-array v3, v3, [I

    const/16 v4, 0xd

    aput v4, v3, v9

    invoke-virtual {v2, v3}, Lcom/android/camera/module/LiveModule;->updatePreferenceInWorkThread([I)V

    :cond_3
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    invoke-virtual {v2}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->requestRender()V

    goto :goto_2

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_4
    :goto_1
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-nez v2, :cond_5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v2

    const/16 v3, 0xe0

    invoke-virtual {v2, v3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v2

    check-cast v2, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    iput-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    :cond_5
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    if-eqz v2, :cond_7

    new-instance v10, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;

    invoke-direct {v10}, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;-><init>()V

    iget-object v11, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v11

    :try_start_2
    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/16 v4, 0x5a

    iget-boolean v5, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    iget v6, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    move-object v3, v8

    move-object v7, v10

    invoke-virtual/range {v2 .. v7}, Lcom/arcsoft/avatar/AvatarEngine;->avatarProcessWithInfoEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;IZILcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v2, v10}, Lcom/arcsoft/avatar/AvatarEngine;->checkOutlineInfo(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarProcessInfo;)I

    move-result v2

    monitor-exit v11
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v3}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiEditMid()Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mActivityBase:Lcom/android/camera/ActivityBase;

    new-instance v4, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;

    invoke-direct {v4, p0, v2}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$10;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;I)V

    invoke-virtual {v3, v4}, Lcom/android/camera/ActivityBase;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_6
    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "avatar edit process time = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiEditor:Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;

    invoke-interface {v2}, Lcom/android/camera/protocol/ModeProtocol$MimojiEditor;->requestRender()V

    goto :goto_2

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    :cond_7
    :goto_2
    sget-object v2, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "process frame spend time  = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMimojiStatusManager:Lcom/android/camera/module/impl/component/MimojiStatusManager;

    invoke-virtual {v0}, Lcom/android/camera/module/impl/component/MimojiStatusManager;->IsInMimojiCreate()Z

    move-result v0

    if-eqz v0, :cond_8

    iput-boolean v9, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mShowAvatar:Z

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatarLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_4
    iget-object v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mOrientation:I

    iget v3, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mDeviceRotation:I

    iget-boolean v4, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFrontCamera:Z

    invoke-static {v2, v3, v4}, Lcom/android/camera/fragment/mimoji/MimojiHelper;->getOutlineOrientation(IIZ)I

    move-result v2

    invoke-virtual {v1, v8, v2}, Lcom/arcsoft/avatar/AvatarEngine;->outlineProcessEx(Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;I)I

    move-result v1

    iput v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mimoji check result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mMainProtocol:Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;

    iget v1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mFaceDectectResult:I

    invoke-interface {v0, v1}, Lcom/android/camera/protocol/ModeProtocol$MainContentProtocol;->mimojiFaceDetect(I)V

    goto :goto_3

    :catchall_2
    move-exception p1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw p1

    :cond_8
    :goto_3
    iget-boolean v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    if-eqz v0, :cond_9

    iput-boolean v9, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsShutterButtonClick:Z

    invoke-virtual {v8}, Lcom/arcsoft/avatar/util/ASVLOFFSCREEN;->getYData()[B

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rawByteArray2RGBABitmap([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    const/16 v0, -0x5a

    invoke-static {p1, v0}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->rotateBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/BitmapUtils;->horizMirrorBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-direct {p0, p1, v0, v1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->createAvatar([BII)V

    :cond_9
    return-void

    :cond_a
    :goto_4
    return-void
.end method

.method public onRecordStart(Landroid/content/ContentValues;)V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "start record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;

    invoke-direct {v1, p0, p1}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$6;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;Landroid/content/ContentValues;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    invoke-virtual {p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->updateRecordingTime()V

    return-void
.end method

.method public onRecordStop()V
    .locals 2

    sget-object v0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->TAG:Ljava/lang/String;

    const-string v1, "stop record..."

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$8;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onResume()V
    .locals 0

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

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCameraView:Lcom/android/camera/ui/V6CameraGLSurfaceView;

    new-instance v1, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;

    invoke-direct {v1, p0}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$3;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;)V

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/V6CameraGLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setDetectSuccess(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mIsFaceDetectSuccess:Z

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

    int-to-long v3, v1

    const-wide/16 v5, 0x3e8

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl$7;-><init>(Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;JJ)V

    iput-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    iget-object v0, p0, Lcom/android/camera/module/impl/component/MimojiAvatarEngineImpl;->mCountDownTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    return-void
.end method
