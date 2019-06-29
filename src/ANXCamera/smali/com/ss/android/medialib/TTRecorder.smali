.class public Lcom/ss/android/medialib/TTRecorder;
.super Ljava/lang/Object;
.source "TTRecorder.java"

# interfaces
.implements Lcom/bef/effectsdk/message/MessageCenter$Listener;
.implements Lcom/ss/android/medialib/AVCEncoderInterface;
.implements Lorg/a/a/c;


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;,
        Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;
    }
.end annotation


# static fields
.field private static final STATE_IDLE:I = 0x0

.field private static final STATE_INTED:I = 0x1

.field private static final STATE_RECORDING:I = 0x3

.field private static final STATE_RUNNING:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field private static final VERSION:Ljava/lang/String; = "20190323_52b67a"

.field private static sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

.field private static sSlamDetectListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

.field private handle:J

.field private mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

.field private mAudioInited:Z

.field private mAudioLoop:Z

.field private mAudioRecorder:Lorg/a/a/d;

.field private mContext:Landroid/content/Context;

.field private mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

.field private mHandleLock:Ljava/lang/Object;

.field private mIsMusicChanged:Z

.field private mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mLastTimeStamp:D

.field private mMusicPath:Ljava/lang/String;

.field private mMusicStart:J

.field private mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

.field private mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

.field private sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

.field private textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    invoke-static {}, Lcom/ss/android/medialib/NativePort/NativeLibsLoader;->loadLibrary()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/ss/android/medialib/TTRecorder;->sSlamDetectListeners:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    new-instance v0, Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-direct {v0}, Lcom/ss/android/medialib/camera/TextureHolder;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    const-wide/high16 v1, -0x4010000000000000L    # -1.0

    iput-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->mLastTimeStamp:D

    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    new-instance v0, Lcom/ss/android/medialib/TTRecorder$2;

    invoke-direct {v0, p0}, Lcom/ss/android/medialib/TTRecorder$2;-><init>(Lcom/ss/android/medialib/TTRecorder;)V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    sget-object p1, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    const-string v0, "20190323_52b67a"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "context can not be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/ss/android/medialib/TTRecorder;)J
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/ss/android/medialib/TTRecorder;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/ss/android/medialib/TTRecorder;->nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/listener/GLCallback;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    return-object p0
.end method

.method static synthetic access$400(Lcom/ss/android/medialib/TTRecorder;)Lcom/ss/android/medialib/camera/TextureHolder;
    .locals 0

    iget-object p0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    return-object p0
.end method

.method static synthetic access$500(Lcom/ss/android/medialib/TTRecorder;JI[F)I
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeOnFrameAvailable(JI[F)I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/ss/android/medialib/TTRecorder;J)D
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->getDrawFrameTime(J)D

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$700(Lcom/ss/android/medialib/TTRecorder;JD)I
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->onDrawFrameTime(JD)I

    move-result p0

    return p0
.end method

.method public static declared-synchronized addSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    .locals 2

    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    monitor-enter v0

    if-eqz p0, :cond_0

    :try_start_0
    sget-object v1, Lcom/ss/android/medialib/TTRecorder;->sSlamDetectListeners:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0

    :cond_0
    :goto_0
    monitor-exit v0

    return-void
.end method

.method public static declared-synchronized clearSlamDetectListener()V
    .locals 2

    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/ss/android/medialib/TTRecorder;->sSlamDetectListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private destroyMessageCenter()V
    .locals 1

    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->destroy()V

    const/4 v0, 0x0

    sput-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    return-void
.end method

.method private getDrawFrameTime(J)D
    .locals 10

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    sub-long v2, v0, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v4, v5, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v4

    sub-long/2addr v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->abs(J)J

    move-result-wide v4

    goto :goto_0

    :cond_0
    const-wide v4, 0x7fffffffffffffffL

    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v6

    const-wide/32 v8, 0xf4240

    mul-long/2addr v6, v8

    sub-long/2addr v6, p1

    invoke-static {v6, v7}, Ljava/lang/Math;->abs(J)J

    move-result-wide p1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    sub-long/2addr v0, p1

    long-to-double p1, v0

    iput-wide p1, p0, Lcom/ss/android/medialib/TTRecorder;->mLastTimeStamp:D

    iget-wide p1, p0, Lcom/ss/android/medialib/TTRecorder;->mLastTimeStamp:D

    const-wide v0, 0x412e848000000000L    # 1000000.0

    div-double/2addr p1, v0

    return-wide p1
.end method

.method private getTextureDeltaTime(Z)J
    .locals 6

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {p1}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    div-long/2addr v2, v4

    sub-long/2addr v0, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method private handleAudioRecord(D)V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v1, p1, p2}, Lorg/a/a/d;->d(D)V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private initAudioIfNeed()V
    .locals 12

    iget-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsMusicChanged:Z

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v0}, Lorg/a/a/d;->unInit()V

    :cond_1
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    new-instance v0, Lorg/a/a/d;

    invoke-direct {v0, p0}, Lorg/a/a/d;-><init>(Lorg/a/a/c;)V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    const/4 v3, 0x5

    invoke-virtual {v0, v3}, Lorg/a/a/d;->init(I)V

    iget-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v3, v4, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/ss/android/medialib/utils/Utils;->getSystemAudioInfo(Landroid/content/Context;)Landroid/util/Pair;

    move-result-object v0

    iget-wide v4, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    iget-object v6, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    const-wide/16 v9, 0x0

    iget-boolean v11, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    move-object v3, p0

    invoke-direct/range {v3 .. v11}, Lcom/ss/android/medialib/TTRecorder;->nativeInitAudioPlayer(JLjava/lang/String;IIJZ)I

    iget-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v3, v4, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    :goto_0
    iput-boolean v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    iput-boolean v2, p0, Lcom/ss/android/medialib/TTRecorder;->mIsMusicChanged:Z

    :cond_3
    return-void
.end method

.method private initMessageCenter()V
    .locals 0

    invoke-static {}, Lcom/bef/effectsdk/message/MessageCenter;->init()V

    invoke-static {p0}, Lcom/bef/effectsdk/message/MessageCenter;->setListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V

    return-void
.end method

.method private native nativeAddPCMData(J[BI)I
.end method

.method private native nativeClearFragFile(J)I
.end method

.method private native nativeCloseWavFile(J)I
.end method

.method private native nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDeleteLastFrag(J)I
.end method

.method private native nativeDestroy(J)I
.end method

.method private native nativeGetEndFrameTime(J)J
.end method

.method private native nativeGetSegments(J)Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/ArrayList<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation
.end method

.method private native nativeInit(JIILjava/lang/String;IILjava/lang/String;)I
.end method

.method private native nativeInitAudioPlayer(JLjava/lang/String;IIJZ)I
.end method

.method private native nativeInitWavFile(JIID)I
.end method

.method private native nativeOnFrameAvailable(JI[F)I
.end method

.method private native nativePauseEffectAudio(J)I
.end method

.method private native nativeResumeEffectAudio(J)I
.end method

.method private native nativeSave(J)I
.end method

.method private native nativeSetBeautyFace(JILjava/lang/String;)I
.end method

.method private native nativeSetBeautyFaceIntensity(JFF)I
.end method

.method private native nativeSetCameraInfo(JIZ)I
.end method

.method private native nativeSetCodecConfig(JLjava/nio/ByteBuffer;I)I
.end method

.method private native nativeSetColorFormat(JI)I
.end method

.method private native nativeSetDeviceRotation(J[F)I
.end method

.method private native nativeSetFaceReshape(JLjava/lang/String;FF)I
.end method

.method private native nativeSetFilter(JLjava/lang/String;F)I
.end method

.method private native nativeSetHardEncoderStatus(JZ)I
.end method

.method private native nativeSetMusicTime(JJJ)I
.end method

.method private native nativeSetPreviewSizeRatio(JF)V
.end method

.method private native nativeSetStickerPath(JLjava/lang/String;)I
.end method

.method private native nativeSetUseMusic(JI)I
.end method

.method private native nativeStartPreview(JLandroid/view/Surface;IZLjava/lang/String;)I
.end method

.method private native nativeStartRecord(JDZIII)I
.end method

.method private native nativeStopPreview(J)I
.end method

.method private native nativeStopRecord(J)I
.end method

.method private native nativeSwitchFilter(JLjava/lang/String;Ljava/lang/String;F)I
.end method

.method private native nativeTryRestore(J)I
.end method

.method private native nativeWriteFile(JLjava/nio/ByteBuffer;III)I
.end method

.method private native nativeWriteFile2(JLjava/nio/ByteBuffer;IJJI)I
.end method

.method private native onDrawFrameTime(JD)I
.end method

.method public static declared-synchronized onNativeCallback_onSlamDetect(Z)V
    .locals 3

    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/ss/android/medialib/TTRecorder;->sSlamDetectListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;

    if-eqz v2, :cond_0

    invoke-interface {v2, p0}, Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;->onSlam(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized removeSlamDetectListener(Lcom/ss/android/medialib/TTRecorder$SlamDetectListener;)V
    .locals 2

    const-class v0, Lcom/ss/android/medialib/TTRecorder;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/ss/android/medialib/TTRecorder;->sSlamDetectListeners:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static setEffectMessageListener(Lcom/bef/effectsdk/message/MessageCenter$Listener;)V
    .locals 0

    sput-object p0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    return-void
.end method


# virtual methods
.method public addPCMData([BI)I
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeAddPCMData(J[BI)I

    move-result p1

    return p1
.end method

.method public chooseSlamFace(I)V
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeChooseSlamFace(JI)V

    return-void
.end method

.method public clearEnv()V
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeClearFragFile(J)I

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public closeWavFile()I
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 v0, -0x64

    return v0

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeCloseWavFile(J)I

    move-result v0

    return v0
.end method

.method public concat(Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/ss/android/medialib/TTRecorder$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder$1;-><init>(Lcom/ss/android/medialib/TTRecorder;Ljava/lang/String;Ljava/lang/String;Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;)V

    const-string p1, "ConcatThread"

    invoke-direct {v0, v1, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_1

    const/16 p1, -0x64

    invoke-interface {p3, p1}, Lcom/ss/android/medialib/TTRecorder$OnConcatFinishListener;->onConcatFinish(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public declared-synchronized concatSyn(Ljava/lang/String;Ljava/lang/String;)I
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-string v6, ""

    const-string v7, ""

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v7}, Lcom/ss/android/medialib/TTRecorder;->nativeConcat(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :cond_0
    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public deleteLastFrag()V
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeDeleteLastFrag(J)I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public declared-synchronized destroy()V
    .locals 5

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mContext:Landroid/content/Context;

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    invoke-static {}, Lcom/ss/android/medialib/TTRecorder;->clearSlamDetectListener()V

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_2
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeDestroy(J)I

    iput-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v0}, Lorg/a/a/d;->unInit()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public enableTTFaceDetect(Z)I
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/16 p1, -0x64

    monitor-exit v0

    return p1

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v1, v2, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeEnableTTFaceDetect(JZ)I

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getEndFrameTime()J
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    monitor-exit v0

    return-wide v3

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeGetEndFrameTime(J)J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getProfile()I
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->getProfile()I

    move-result v0

    return v0
.end method

.method public getSegmentInfo()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/ss/android/medialib/model/TimeSpeedModel;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    monitor-exit v0

    return-object v1

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeGetSegments(J)Ljava/util/ArrayList;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSlamFaceCount()I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 v0, -0x64

    return v0

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeGetSlamFaceCount(J)I

    move-result v0

    return v0
.end method

.method public getSurfaceTexture()Landroid/graphics/SurfaceTexture;
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->textureHolder:Lcom/ss/android/medialib/camera/TextureHolder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/camera/TextureHolder;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized init(IILjava/lang/String;IILjava/lang/String;)I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    :try_start_2
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Lcom/ss/android/medialib/TTRecorder;->nativeInit(JIILjava/lang/String;IILjava/lang/String;)I

    move-result p1

    if-nez p1, :cond_2

    iget-object p2, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public initWavFile(IID)I
    .locals 7

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/16 p1, -0x64

    return p1

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move-wide v5, p3

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->nativeInitWavFile(JIID)I

    move-result p1

    return p1
.end method

.method public native nativeChooseSlamFace(JI)V
.end method

.method public native nativeEnableTTFaceDetect(JZ)I
.end method

.method public native nativeGetSlamFaceCount(J)I
.end method

.method public native nativeProcessTouchEvent(JFF)I
.end method

.method public native nativeSetSlamFace(JLandroid/graphics/Bitmap;)I
.end method

.method public native nativeSlamDeviceConfig(JZIZZZZLjava/lang/String;)I
.end method

.method public native nativeSlamProcessIngestAcc(JDDDD)I
.end method

.method public native nativeSlamProcessIngestGra(JDDDD)I
.end method

.method public native nativeSlamProcessIngestGyr(JDDDD)I
.end method

.method public native nativeSlamProcessIngestOri(J[DD)I
.end method

.method public native nativeSlamProcessPanEvent(JFFFFF)I
.end method

.method public native nativeSlamProcessRotationEvent(JFF)I
.end method

.method public native nativeSlamProcessScaleEvent(JFF)I
.end method

.method public native nativeSlamProcessTouchEvent(JFF)I
.end method

.method public native nativeSlamProcessTouchEventByType(JIFFI)I
.end method

.method public native nativeUpdateRotation(JFFF)I
.end method

.method public native nativeUseLargeMattingModel(JZ)I
.end method

.method public onEncodeData(IIZ)I
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lcom/ss/android/medialib/TTRecorder;->onEncoderData(IIIZ)I

    move-result p1

    return p1
.end method

.method public onEncoderData(IIIZ)I
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/ss/android/medialib/AVCEncoder;->encode(IIIZ)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onEncoderData(Ljava/nio/ByteBuffer;IZ)V
    .locals 0

    return-void
.end method

.method public onEncoderData([BIZ)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p1, p2, p3}, Lcom/ss/android/medialib/AVCEncoder;->encode([BIZ)I

    :cond_0
    return-void
.end method

.method public onInitHardEncoder(IIIIIIZ)Landroid/view/Surface;
    .locals 10

    move-object v0, p0

    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-nez v1, :cond_0

    new-instance v1, Lcom/ss/android/medialib/AVCEncoder;

    invoke-direct {v1}, Lcom/ss/android/medialib/AVCEncoder;-><init>()V

    iput-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    :cond_0
    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v1, v0}, Lcom/ss/android/medialib/AVCEncoder;->setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V

    iget-object v2, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-virtual/range {v2 .. v9}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object v1

    if-nez v1, :cond_1

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    iget-wide v2, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    return-object v1

    :cond_1
    iget-wide v2, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 v4, 0x1

    invoke-direct {v0, v2, v3, v4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    return-object v1
.end method

.method public onInitHardEncoder(IIIIZ)Landroid/view/Surface;
    .locals 7

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-nez v0, :cond_0

    new-instance v0, Lcom/ss/android/medialib/AVCEncoder;

    invoke-direct {v0}, Lcom/ss/android/medialib/AVCEncoder;-><init>()V

    iput-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0, p0}, Lcom/ss/android/medialib/AVCEncoder;->setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/ss/android/medialib/AVCEncoder;->initAVCEncoder(IIIIZ)Landroid/view/Surface;

    move-result-object p1

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    iget-wide p2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p4, 0x0

    invoke-direct {p0, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    return-object p1

    :cond_1
    iget-wide p2, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const/4 p4, 0x1

    invoke-direct {p0, p2, p3, p4}, Lcom/ss/android/medialib/TTRecorder;->nativeSetHardEncoderStatus(JZ)I

    return-object p1
.end method

.method public onMessageReceived(IIILjava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->sMessageListener:Lcom/bef/effectsdk/message/MessageCenter$Listener;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/bef/effectsdk/message/MessageCenter$Listener;->onMessageReceived(IIILjava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onNativeCallback_GetHardEncoderProfile()I
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->getProfile()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onNativeCallback_Init(I)V
    .locals 3

    if-gez p1, :cond_0

    const-string v0, "TTRecorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNativeCallback_Init error = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v0, "TTRecorder"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onNativeCallback_Init success = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    invoke-interface {v0, p1}, Lcom/ss/android/medialib/listener/NativeInitListener;->onNativeInitCallBack(I)V

    :cond_1
    return-void
.end method

.method public onNativeCallback_InitHardEncoder(IIIIIIZ)Landroid/view/Surface;
    .locals 0

    invoke-virtual/range {p0 .. p7}, Lcom/ss/android/medialib/TTRecorder;->onInitHardEncoder(IIIIIIZ)Landroid/view/Surface;

    move-result-object p1

    return-object p1
.end method

.method public onNativeCallback_InitHardEncoderRet(II)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/medialib/listener/NativeInitListener;->onNativeInitHardEncoderRetCallback(II)V

    :cond_0
    return-void
.end method

.method public onNativeCallback_UninitHardEncoder()V
    .locals 0

    invoke-virtual {p0}, Lcom/ss/android/medialib/TTRecorder;->onUninitHardEncoder()V

    return-void
.end method

.method public onNativeCallback_encodeTexture(IIZ)I
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/android/medialib/TTRecorder;->onEncodeData(IIZ)I

    const/4 p1, 0x0

    return p1
.end method

.method public onNativeCallback_onFaceDetect(II)V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    invoke-interface {v0, p1, p2}, Lcom/ss/android/medialib/listener/FaceDetectListener;->onResult(II)V

    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLCreate()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {v0}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLCreate()V

    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {v0}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLDestroy()V

    :cond_0
    return-void
.end method

.method public onNativeCallback_onOpenGLRunning(D)I
    .locals 0

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->glCallback:Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;

    invoke-interface {p1}, Lcom/ss/android/medialib/common/Common$IOnOpenGLCallback;->onOpenGLRunning()I

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onSetCodecConfig(Ljava/nio/ByteBuffer;)V
    .locals 4

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetCodecConfig(JLjava/nio/ByteBuffer;I)I

    :cond_0
    return-void
.end method

.method public onSwapGlBuffers()V
    .locals 0

    return-void
.end method

.method public onUninitHardEncoder()V
    .locals 2

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    invoke-virtual {v0}, Lcom/ss/android/medialib/AVCEncoder;->uninitAVCEncoder()V

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/ss/android/medialib/AVCEncoder;->setEncoderCaller(Lcom/ss/android/medialib/AVCEncoderInterface;)V

    iput-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAVCEncoder:Lcom/ss/android/medialib/AVCEncoder;

    :cond_0
    return-void
.end method

.method public onWriteFile(Ljava/nio/ByteBuffer;III)V
    .locals 7

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long p3, v0, v2

    if-eqz p3, :cond_0

    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    move-object v0, p0

    move-object v3, p1

    move v5, p2

    move v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->nativeWriteFile(JLjava/nio/ByteBuffer;III)I

    :cond_0
    return-void
.end method

.method public onWriteFile(Ljava/nio/ByteBuffer;JJII)V
    .locals 10

    move-object v0, p0

    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    move-object v3, p1

    move-wide v5, p2

    move-wide v7, p4

    move/from16 v9, p7

    invoke-direct/range {v0 .. v9}, Lcom/ss/android/medialib/TTRecorder;->nativeWriteFile2(JLjava/nio/ByteBuffer;IJJI)I

    :cond_0
    return-void
.end method

.method public pauseEffectAudio()I
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/16 v1, -0x64

    monitor-exit v0

    return v1

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativePauseEffectAudio(J)I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public processTouchEvent(FF)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeProcessTouchEvent(JFF)I

    move-result p1

    return p1
.end method

.method public resumeEffectAudio()I
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/16 v1, -0x64

    monitor-exit v0

    return v1

    :cond_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeResumeEffectAudio(J)I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public setAudioLoop(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioLoop:Z

    return-void
.end method

.method public setBeautyFace(ILjava/lang/String;)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetBeautyFace(JILjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setBeautyFaceIntensity(FF)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetBeautyFaceIntensity(JFF)I

    move-result p1

    return p1
.end method

.method public setColorFormat(I)V
    .locals 2

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetColorFormat(JI)I

    return-void
.end method

.method public setDeviceRotation([F)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetDeviceRotation(J[F)I

    move-result p1

    return p1
.end method

.method public setFaceDetectListener(Lcom/ss/android/medialib/listener/FaceDetectListener;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->sFaceDetectListener:Lcom/ss/android/medialib/listener/FaceDetectListener;

    return-void
.end method

.method public setFaceReshape(Ljava/lang/String;FF)I
    .locals 6

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeSetFaceReshape(JLjava/lang/String;FF)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;F)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetFilter(JLjava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setFilter(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 6

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeSwitchFilter(JLjava/lang/String;Ljava/lang/String;F)I

    move-result p1

    return p1
.end method

.method public setGLCallback(Lcom/ss/android/medialib/listener/GLCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mGLCallback:Lcom/ss/android/medialib/listener/GLCallback;

    return-void
.end method

.method public declared-synchronized setMusicPath(Ljava/lang/String;)V
    .locals 5

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    if-nez p1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iput-boolean v1, p0, Lcom/ss/android/medialib/TTRecorder;->mIsMusicChanged:Z

    :cond_2
    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    iget-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/2addr p1, v1

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_3

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetUseMusic(JI)I

    move-result p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    sget-object v0, Lcom/ss/android/medialib/TTRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setMusicPath result with:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setMusicStart(J)I
    .locals 9

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_0

    const/16 p1, -0x64

    monitor-exit v0

    return p1

    :cond_0
    iput-wide p1, p0, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    invoke-virtual {p0}, Lcom/ss/android/medialib/TTRecorder;->getSegmentInfo()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/ss/android/medialib/model/TimeSpeedModel;->calculateRealTime(Ljava/util/List;)I

    move-result v1

    iget-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    int-to-long v7, v1

    move-object v2, p0

    move-wide v5, p1

    invoke-direct/range {v2 .. v8}, Lcom/ss/android/medialib/TTRecorder;->nativeSetMusicTime(JJJ)I

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setNativeInitListener(Lcom/ss/android/medialib/listener/NativeInitListener;)V
    .locals 0

    iput-object p1, p0, Lcom/ss/android/medialib/TTRecorder;->mNativeInitListener:Lcom/ss/android/medialib/listener/NativeInitListener;

    return-void
.end method

.method public setPreviewSizeRatio(F)V
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetPreviewSizeRatio(JF)V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setSlamFace(Landroid/graphics/Bitmap;)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetSlamFace(JLandroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method

.method public setSticker(Ljava/lang/String;)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeSetStickerPath(JLjava/lang/String;)I

    move-result p1

    return p1
.end method

.method public setUseLargeMattingModel(Z)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1}, Lcom/ss/android/medialib/TTRecorder;->nativeUseLargeMattingModel(JZ)I

    move-result p1

    return p1
.end method

.method public slamDeviceConfig(ZIZZZZLjava/lang/String;)I
    .locals 10

    move-object v0, p0

    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/16 v0, -0x64

    return v0

    :cond_1
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    invoke-virtual/range {v0 .. v9}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamDeviceConfig(JZIZZZZLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestAcc(DDDD)I
    .locals 11

    move-object v0, p0

    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/16 v0, -0x64

    return v0

    :cond_1
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-wide v3, p1

    move-wide v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    invoke-virtual/range {v0 .. v10}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessIngestAcc(JDDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestGra(DDDD)I
    .locals 11

    move-object v0, p0

    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/16 v0, -0x64

    return v0

    :cond_1
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-wide v3, p1

    move-wide v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    invoke-virtual/range {v0 .. v10}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessIngestGra(JDDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestGyr(DDDD)I
    .locals 11

    move-object v0, p0

    iget-object v1, v0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/16 v0, -0x64

    return v0

    :cond_1
    iget-wide v1, v0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-wide v3, p1

    move-wide v5, p3

    move-wide/from16 v7, p5

    move-wide/from16 v9, p7

    invoke-virtual/range {v0 .. v10}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessIngestGyr(JDDDD)I

    move-result v0

    return v0
.end method

.method public slamProcessIngestOri([DD)I
    .locals 6

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-virtual/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessIngestOri(J[DD)I

    move-result p1

    return p1
.end method

.method public slamProcessPanEvent(FFFFF)I
    .locals 8

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v0 .. v7}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessPanEvent(JFFFFF)I

    move-result p1

    return p1
.end method

.method public slamProcessRotationEvent(FF)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessRotationEvent(JFF)I

    move-result p1

    return p1
.end method

.method public slamProcessScaleEvent(FF)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessScaleEvent(JFF)I

    move-result p1

    return p1
.end method

.method public slamProcessTouchEvent(FF)I
    .locals 4

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessTouchEvent(JFF)I

    move-result p1

    return p1
.end method

.method public slamProcessTouchEventByType(IFFI)I
    .locals 7

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/ss/android/medialib/TTRecorder;->nativeSlamProcessTouchEventByType(JIFFI)I

    move-result p1

    return p1
.end method

.method public declared-synchronized startPreview(Landroid/view/Surface;IZ)I
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/16 p1, -0x67

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    monitor-exit p0

    return p1

    :cond_1
    const/4 v0, 0x0

    :try_start_2
    iput-boolean v0, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioInited:Z

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->initMessageCenter()V

    iget-wide v3, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    sget-object v8, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    move-object v2, p0

    move-object v5, p1

    move v6, p2

    move v7, p3

    invoke-direct/range {v2 .. v8}, Lcom/ss/android/medialib/TTRecorder;->nativeStartPreview(JLandroid/view/Surface;IZLjava/lang/String;)I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized startRecord(DZFII)I
    .locals 11

    move-object v10, p0

    monitor-enter p0

    :try_start_0
    iget-object v0, v10, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/16 v0, -0x67

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-wide v0, v10, Lcom/ss/android/medialib/TTRecorder;->handle:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :cond_1
    :try_start_2
    iget-object v0, v10, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-wide v0, v10, Lcom/ss/android/medialib/TTRecorder;->mMusicStart:J

    invoke-virtual {v10, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->setMusicStart(J)I

    invoke-direct {v10}, Lcom/ss/android/medialib/TTRecorder;->initAudioIfNeed()V

    const v0, 0x3d0900

    int-to-float v0, v0

    mul-float/2addr v0, p4

    float-to-int v0, v0

    const v1, 0xb71b00

    if-le v0, v1, :cond_2

    move v7, v1

    goto :goto_0

    :cond_2
    move v7, v0

    :goto_0
    iget-wide v2, v10, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v1, v10

    move-wide v4, p1

    move v6, p3

    move/from16 v8, p5

    move/from16 v9, p6

    invoke-direct/range {v1 .. v9}, Lcom/ss/android/medialib/TTRecorder;->nativeStartRecord(JDZIII)I

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {v10, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->handleAudioRecord(D)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopPreview()I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/16 v0, -0x67

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :cond_1
    :try_start_2
    invoke-direct {p0}, Lcom/ss/android/medialib/TTRecorder;->destroyMessageCenter()V

    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeStopPreview(J)I

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized stopRecord()I
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/16 v0, -0x67

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 v0, -0x64

    monitor-exit p0

    return v0

    :cond_1
    :try_start_2
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v0, v1}, Lcom/ss/android/medialib/TTRecorder;->nativeStopRecord(J)I

    move-result v0

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mAudioRecorder:Lorg/a/a/d;

    invoke-virtual {v1}, Lorg/a/a/d;->stopRecording()Z

    :cond_2
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeSave(J)I

    iget-object v1, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public tryRestore()I
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mStatus:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, -0x67

    return v0

    :cond_0
    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    const/16 v1, -0x64

    monitor-exit v0

    return v1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2}, Lcom/ss/android/medialib/TTRecorder;->nativeTryRestore(J)I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public updateCameraInfo(IZ)V
    .locals 5

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mHandleLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    invoke-direct {p0, v1, v2, p1, p2}, Lcom/ss/android/medialib/TTRecorder;->nativeSetCameraInfo(JIZ)I

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public updateRotation(FFF)I
    .locals 6

    iget-object v0, p0, Lcom/ss/android/medialib/TTRecorder;->mIsPreviewStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p1, -0x67

    return p1

    :cond_0
    iget-wide v0, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    const/16 p1, -0x64

    return p1

    :cond_1
    iget-wide v1, p0, Lcom/ss/android/medialib/TTRecorder;->handle:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/ss/android/medialib/TTRecorder;->nativeUpdateRotation(JFFF)I

    move-result p1

    return p1
.end method
