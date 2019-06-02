.class public Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;
.super Ljava/lang/Object;
.source "CircularMediaRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$SnapshotRequest;,
        Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;
    }
.end annotation


# static fields
.field private static final AUDIO_BIT_RATE:I = 0xfa00

.field private static final AUDIO_CHANNELS:I = 0x1

.field private static final AUDIO_FORMAT:I = 0x2

.field private static final AUDIO_MIME_TYPE:Ljava/lang/String; = "audio/mp4a-latm"

.field private static final AUDIO_SAMPLE_RATE:I = 0xac44

.field private static final BYTES_COPY_BUFFER_LENGTH:I = 0x800

.field private static final CAPTURE_DURATION_IN_MICROSECOND:J = 0x1e8480L

.field private static final DEBUG:Z = false

.field private static final MOVIE_FILE_FORMAT:I = 0x0

.field private static final PRE_CAPTURE_DURATION_IN_MICROSECOND:J = 0xf4240L

.field private static final SAVE_MICRO_VIDEO_IN_SDCARD:Z

.field private static final TAG:Ljava/lang/String;

.field private static final VIDEO_BIT_RATE:I = 0x2160ec0

.field private static final VIDEO_FRAME_RATE:I = 0x1e

.field private static final VIDEO_I_FRAME_INTERVAL:F = 0.1f


# instance fields
.field private final mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

.field private final mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

.field private mOrientationHint:I

.field private final mSnapshotRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/Util;->saveLiveShotMicroVideoInSdcard()Z

    move-result v0

    sput-boolean v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->SAVE_MICRO_VIDEO_IN_SDCARD:Z

    return-void
.end method

.method public constructor <init>(IILandroid/opengl/EGLContext;ZLjava/util/Queue;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/opengl/EGLContext;",
            "Z",
            "Ljava/util/Queue<",
            "Lcom/xiaomi/camera/liveshot/LivePhotoResult;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    new-instance v0, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-static {p1, p2}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->createVideoFormat(II)Landroid/media/MediaFormat;

    move-result-object v2

    const-wide/32 v4, 0x1e8480

    const-wide/32 v6, 0xf4240

    move-object v1, v0

    move-object v3, p3

    move-object v8, p5

    invoke-direct/range {v1 .. v8}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;-><init>(Landroid/media/MediaFormat;Landroid/opengl/EGLContext;JJLjava/util/Queue;)V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz p4, :cond_0

    new-instance v7, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    const v0, 0xac44

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->createAudioFormat(II)Landroid/media/MediaFormat;

    move-result-object v1

    const-wide/32 v2, 0x1e8480

    const-wide/32 v4, 0xf4240

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;-><init>(Landroid/media/MediaFormat;JJLjava/util/Queue;)V

    iput-object v7, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    :goto_0
    new-instance v0, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;-><init>(Ljava/util/concurrent/ExecutorService;)V

    iput-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSnapshotRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200()Z
    .locals 1

    sget-boolean v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->SAVE_MICRO_VIDEO_IN_SDCARD:Z

    return v0
.end method

.method private static createAudioFormat(II)Landroid/media/MediaFormat;
    .locals 3

    const-string v0, "audio/mp4a-latm"

    invoke-static {v0, p0, p1}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p0

    const-string v0, "aac-profile"

    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v0, "bitrate"

    const v2, 0xfa00

    invoke-virtual {p0, v0, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v0, "channel-count"

    invoke-virtual {p0, v0, p1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p1, "pcm-encoding"

    invoke-virtual {p0, p1, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    return-object p0
.end method

.method private static createVideoFormat(II)Landroid/media/MediaFormat;
    .locals 1

    invoke-static {}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->isH265EncodingPreferred()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "video/hevc"

    goto :goto_0

    :cond_0
    const-string v0, "video/avc"

    :goto_0
    invoke-static {v0, p0, p1}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p0

    const-string p1, "color-format"

    const v0, 0x7f000789

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p1, "bitrate"

    const v0, 0x2160ec0

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p1, "frame-rate"

    const/16 v0, 0x1e

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p1, "i-frame-interval"

    const v0, 0x3dcccccd    # 0.1f

    invoke-virtual {p0, p1, v0}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    return-object p0
.end method

.method private static isH265EncodingPreferred()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/CameraSettings;->getVideoEncoder()I

    move-result v0

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/liveshot/MediaCodecCapability;->isH265EncodingSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->onSurfaceTextureUpdated(Lcom/android/camera/effect/draw_mode/DrawExtTexAttribute;)V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 2

    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "release(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSnapshotRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->shutdown()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->release()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->release()V

    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "release(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setFilterId(I)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->setFilterId(I)V

    :cond_0
    return-void
.end method

.method public setFpsReduction(F)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->setFpsReduction(F)V

    :cond_0
    return-void
.end method

.method public setOrientationHint(I)V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setOrientationHint(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    return-void
.end method

.method public snapshot(ILcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;Ljava/lang/Object;I)V
    .locals 8

    new-instance v7, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$SnapshotRequest;

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v2, v1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0, p4}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->snapshot(I)Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    move-result-object v0

    move-object v2, v0

    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-nez v0, :cond_1

    move-object p4, v1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0, p4}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->snapshot(I)Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;

    move-result-object p4

    :goto_1
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    iget p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mOrientationHint:I

    :cond_2
    move v3, p1

    const/4 v6, 0x0

    move-object v0, v7

    move-object v1, v2

    move-object v2, p4

    move-object v4, p3

    move-object v5, p2

    invoke-direct/range {v0 .. v6}, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$SnapshotRequest;-><init>(Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;Lcom/xiaomi/camera/liveshot/encoder/CircularMediaEncoder$Snapshot;ILjava/lang/Object;Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$VideoClipSavingCallback;Lcom/xiaomi/camera/liveshot/CircularMediaRecorder$1;)V

    iget-object p1, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSnapshotRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {p1, v7}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->execute(Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler$CancellableTask;)V

    return-void
.end method

.method public start()V
    .locals 2

    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "start(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->start()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->start()V

    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "start(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stop()V
    .locals 2

    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mSnapshotRequestScheduler:Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/util/BackgroundTaskScheduler;->abortRemainingTasks()V

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularVideoEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularVideoEncoder;->stop()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->mCircularAudioEncoder:Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;

    invoke-virtual {v0}, Lcom/xiaomi/camera/liveshot/encoder/CircularAudioEncoder;->stop()V

    :cond_1
    sget-object v0, Lcom/xiaomi/camera/liveshot/CircularMediaRecorder;->TAG:Ljava/lang/String;

    const-string v1, "stop(): X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
