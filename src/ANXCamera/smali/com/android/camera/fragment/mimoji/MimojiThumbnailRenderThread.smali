.class public final Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;
.super Ljava/lang/Thread;
.source "MimojiThumbnailRenderThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;
    }
.end annotation


# static fields
.field private static BACKGROUND_COLOR:[F = null

.field private static final MSG_AVATAR_INIT:I = 0x20

.field public static final MSG_DRAW_REQUESTED:I = 0x10

.field private static final MSG_QUIT_REQUESTED:I = 0x40

.field private static final MSG_RESET_DATA:I = 0x60

.field private static final MSG_SET_CONFIG:I = 0x50

.field private static final MSG_UPDATE_THUMB:I = 0x30

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

.field private mConfigInfoThumUtils:Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;

.field private mContext:Landroid/content/Context;

.field private mCurrentConfigPath:Ljava/lang/String;

.field private mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

.field private volatile mEglContextPrepared:Z

.field private mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

.field private final mHeight:I

.field private volatile mIsRendering:Z

.field private final mLock:Ljava/lang/Object;

.field private volatile mReady:Z

.field private volatile mRequestDraw:I

.field private volatile mRequestRelease:Z

.field private volatile mRestStopRenderThumbnail:Z

.field private volatile mStopRenderThumbnail:Z

.field private mUpdateHandler:Landroid/os/Handler;

.field private final mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->BACKGROUND_COLOR:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x3de0ded3    # 0.1098f
        0x3df0d845    # 0.1176f
        0x3e0068dc    # 0.1254f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;IILandroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mReady:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestRelease:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRestStopRenderThumbnail:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEglContextPrepared:Z

    iput p2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mWidth:I

    iput p3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHeight:I

    iput-object p4, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doDraw(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doInit(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doUpdate()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doSetConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doReset()V

    return-void
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->doQuit()V

    return-void
.end method

.method private doDraw(Z)V
    .locals 4

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestRelease:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEglContextPrepared:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestDraw:I

    const/4 v2, 0x1

    if-lez v1, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_3

    iget v3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestDraw:I

    sub-int/2addr v3, v2

    iput v3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestDraw:I

    :cond_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_4

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->drawThumbnail(Z)V

    :cond_4
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private doInit(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    const-string v1, "init avatar"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    new-instance v0, Lcom/arcsoft/avatar/AvatarEngine;

    invoke-direct {v0}, Lcom/arcsoft/avatar/AvatarEngine;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->TRACK_DATA:Ljava/lang/String;

    sget-object v2, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->FACE_MODEL:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/arcsoft/avatar/AvatarEngine;->init(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    sget-object v1, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->PersonTemplatePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setTemplatePath(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mCurrentConfigPath:Ljava/lang/String;

    new-instance p1, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;

    invoke-direct {p1}, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mConfigInfoThumUtils:Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;

    return-void
.end method

.method private doQuit()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestRelease:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestRelease:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->release()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method private doReset()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->draw(Z)V

    return-void
.end method

.method private doSetConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0, p1}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    return-void
.end method

.method private doUpdate()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->draw(Z)V

    return-void
.end method

.method private prepare()V
    .locals 3

    new-instance v0, Lcom/android/camera/fragment/mimoji/EGLWrapper;

    iget v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mWidth:I

    iget v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHeight:I

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/mimoji/EGLWrapper;-><init>(II)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->makeCurrent()Z

    return-void
.end method

.method private release()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarEngine;->releaseRender()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarEngine;->unInit()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v0}, Lcom/arcsoft/avatar/AvatarEngine;->destroy()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/EGLWrapper;->release()V

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEGLWrapper:Lcom/android/camera/fragment/mimoji/EGLWrapper;

    :cond_1
    return-void
.end method

.method private resetConfig(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mConfigInfoThumUtils:Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->reset(Lcom/arcsoft/avatar/AvatarEngine;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v1, v1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arcsoft/avatar/util/AvatarConfigUtils;->getCurrentConfigIdWithType(ILcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget v3, v2, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    if-ne v3, v0, :cond_1

    nop

    nop

    move-object v1, v2

    goto :goto_2

    :cond_1
    goto :goto_1

    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {p1, v1}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    :cond_3
    return-void
.end method


# virtual methods
.method public draw(Z)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestRelease:Z

    if-eqz v1, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEglContextPrepared:Z

    if-nez v1, :cond_2

    monitor-exit v0

    return-void

    :cond_2
    iget v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestDraw:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRequestDraw:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x10

    iput v1, v0, Landroid/os/Message;->what:I

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public drawThumbnail(Z)V
    .locals 11

    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fmoji  drawThumbnail reset :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mCurrentConfigPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/arcsoft/avatar/AvatarEngine;->loadConfig(Ljava/lang/String;)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->resetData()V

    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSelectType()I

    move-result v0

    sget-object v1, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u9009\u4e2d\u7684Type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    iget-object v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2, v0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getSubConfigList(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object v1

    sget-object v2, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u6570\u636e:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_7

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "\u6570\u636e:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v6, v6, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->configTypeName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/camera/log/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;

    iget-object v4, v4, Lcom/android/camera/fragment/mimoji/MimojiLevelBean;->thumnails:Ljava/util/ArrayList;

    if-nez v4, :cond_2

    goto/16 :goto_2

    :cond_2
    move v5, v2

    :goto_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_6

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    iget-object v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-virtual {v7, v6}, Lcom/arcsoft/avatar/AvatarEngine;->setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)I

    iget-object v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mConfigInfoThumUtils:Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;

    iget-object v8, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mAvatar:Lcom/arcsoft/avatar/AvatarEngine;

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getASAvatarConfigValue()Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;

    move-result-object v9

    iget v9, v9, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigValue;->gender:I

    sget-object v10, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->BACKGROUND_COLOR:[F

    invoke-virtual {v7, v8, v6, v9, v10}, Lcom/android/camera/fragment/mimoji/ConfigInfoThumUtils;->renderThumb(Lcom/arcsoft/avatar/AvatarEngine;Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I[F)V

    iget-object v6, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v6}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    iget-boolean v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRestStopRenderThumbnail:Z

    if-eqz v7, :cond_3

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRestStopRenderThumbnail:Z

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->resetData()V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    invoke-virtual {v1, v0, v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setTypeNeedUpdate(IZ)V

    invoke-direct {p0, v4}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->resetConfig(Ljava/util/ArrayList;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->draw(Z)V

    return-void

    :cond_3
    iget-boolean v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    if-eqz v7, :cond_4

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    invoke-direct {p0, v4}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->resetConfig(Ljava/util/ArrayList;)V

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setTypeNeedUpdate(IZ)V

    const/4 p1, 0x6

    iput p1, v6, Landroid/os/Message;->what:I

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {p1, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void

    :cond_4
    const/4 v7, 0x5

    iput v7, v6, Landroid/os/Message;->what:I

    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    const-string v8, "OUTER"

    invoke-virtual {v7, v8, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v8, "INNER"

    invoke-virtual {v7, v8, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v8, "TYPE"

    invoke-virtual {v7, v8, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iput-object v7, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mUpdateHandler:Landroid/os/Handler;

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mUpdateHandler:Landroid/os/Handler;

    invoke-virtual {v7, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1

    :cond_6
    invoke-direct {p0, v4}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->resetConfig(Ljava/util/ArrayList;)V

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_7
    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setTypeNeedUpdate(IZ)V

    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    return-void
.end method

.method public getHandler()Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mReady:Z

    if-eqz v1, :cond_0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    return-object v0

    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "render thread is not ready yet"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public getIsRendering()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    return v0
.end method

.method public initAvatar(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x20

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public quit()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method

.method public reset()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->setStopRender(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x60

    iput v1, v0, Landroid/os/Message;->what:I

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {v1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public run()V
    .locals 6

    invoke-static {}, Landroid/os/Looper;->prepare()V

    new-instance v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;-><init>(Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$1;)V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    const-string v2, "prepare render thread: E"

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    const/4 v2, 0x0

    :try_start_0
    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEglContextPrepared:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->prepare()V

    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mEglContextPrepared:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v3

    sget-object v4, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    const-string v5, "FATAL: failed to prepare render thread"

    invoke-static {v4, v5, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    invoke-direct {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->release()V

    :goto_0
    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_1
    iput-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mReady:Z

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {}, Landroid/os/Looper;->loop()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_2
    iput-boolean v2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mReady:Z

    iput-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    sget-object v0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    const-string v1, "prepare render thread: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0
.end method

.method public setConfig(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/16 v1, 0x50

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mHandler:Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread$RenderHandler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public setResetStopRender(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    if-eqz v0, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mRestStopRenderThumbnail:Z

    :cond_0
    return-void
.end method

.method public setStopRender(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mIsRendering:Z

    if-eqz v0, :cond_0

    iput-boolean p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mStopRenderThumbnail:Z

    :cond_0
    return-void
.end method

.method public setUpdateHandler(Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mUpdateHandler:Landroid/os/Handler;

    return-void
.end method

.method public waitUntilReady()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mReady:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    :try_start_1
    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    :try_start_2
    sget-object v2, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRenderThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "waitUntilReady() interrupted: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method
