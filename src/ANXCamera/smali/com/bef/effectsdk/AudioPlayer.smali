.class public Lcom/bef/effectsdk/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"


# annotations
.annotation build Landroid/support/annotation/Keep;
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private mFilename:Ljava/lang/String;

.field private mIsPrepared:Z

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field private mNativePtr:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/bef/effectsdk/AudioPlayer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    iput-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    iput-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mFilename:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/bef/effectsdk/AudioPlayer;)J
    .locals 2

    iget-wide v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mNativePtr:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/bef/effectsdk/AudioPlayer;JII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/AudioPlayer;->nativeOnInfo(JII)V

    return-void
.end method

.method static synthetic access$200(Lcom/bef/effectsdk/AudioPlayer;)Landroid/media/MediaPlayer;
    .locals 0

    iget-object p0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method static synthetic access$202(Lcom/bef/effectsdk/AudioPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .locals 0

    iput-object p1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method static synthetic access$300(Lcom/bef/effectsdk/AudioPlayer;JII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/bef/effectsdk/AudioPlayer;->nativeOnError(JII)V

    return-void
.end method

.method static synthetic access$402(Lcom/bef/effectsdk/AudioPlayer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    return p1
.end method

.method static synthetic access$500(Lcom/bef/effectsdk/AudioPlayer;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/bef/effectsdk/AudioPlayer;->nativeOnPrepared(J)V

    return-void
.end method

.method static synthetic access$600(Lcom/bef/effectsdk/AudioPlayer;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/bef/effectsdk/AudioPlayer;->nativeOnCompletion(J)V

    return-void
.end method

.method private native nativeOnCompletion(J)V
    .annotation build Landroid/support/annotation/Keep;
    .end annotation
.end method

.method private native nativeOnError(JII)V
    .annotation build Landroid/support/annotation/Keep;
    .end annotation
.end method

.method private native nativeOnInfo(JII)V
    .annotation build Landroid/support/annotation/Keep;
    .end annotation
.end method

.method private native nativeOnPrepared(J)V
    .annotation build Landroid/support/annotation/Keep;
    .end annotation
.end method


# virtual methods
.method public getCurrentPlayTime()F
    .locals 2
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer is null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getTotalPlayTime()F
    .locals 2
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer is null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public init()I
    .locals 3
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    :cond_0
    new-instance v1, Landroid/media/MediaPlayer;

    invoke-direct {v1}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/bef/effectsdk/AudioPlayer$1;

    invoke-direct {v2, p0}, Lcom/bef/effectsdk/AudioPlayer$1;-><init>(Lcom/bef/effectsdk/AudioPlayer;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/bef/effectsdk/AudioPlayer$2;

    invoke-direct {v2, p0}, Lcom/bef/effectsdk/AudioPlayer$2;-><init>(Lcom/bef/effectsdk/AudioPlayer;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/bef/effectsdk/AudioPlayer$3;

    invoke-direct {v2, p0}, Lcom/bef/effectsdk/AudioPlayer$3;-><init>(Lcom/bef/effectsdk/AudioPlayer;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object v1, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v2, Lcom/bef/effectsdk/AudioPlayer$4;

    invoke-direct {v2, p0}, Lcom/bef/effectsdk/AudioPlayer$4;-><init>(Lcom/bef/effectsdk/AudioPlayer;)V

    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    return v0
.end method

.method public isPlaying()Z
    .locals 5
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    nop

    sget-object v2, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "MediaPlayer isPlaying exception. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v1

    :goto_0
    return v0
.end method

.method public pause()Z
    .locals 3
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    const/4 v0, 0x1

    return v0
.end method

.method public release()I
    .locals 4
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MediaPlayer stop exception on release "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public resume()Z
    .locals 3
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v2, "MediaPlayer is null!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    const/4 v0, 0x1

    return v0
.end method

.method public seek(I)Z
    .locals 3
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer is null!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer is null!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->seekTo(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MediaPlayer seek exception. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public setDataSource(Ljava/lang/String;)V
    .locals 4
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/bef/effectsdk/AudioPlayer;->init()I

    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mFilename:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MediaPlayer setDataSource exception. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iput-object p1, p0, Lcom/bef/effectsdk/AudioPlayer;->mFilename:Ljava/lang/String;

    return-void
.end method

.method public setLoop(Z)Z
    .locals 3
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer is null!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_0
    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "set isLoop "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setLooping(Z)V

    const/4 p1, 0x1

    return p1
.end method

.method public setNativePtr(J)V
    .locals 0
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iput-wide p1, p0, Lcom/bef/effectsdk/AudioPlayer;->mNativePtr:J

    return-void
.end method

.method public setVolume(F)Z
    .locals 2
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer is null!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    sget-object p1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "MediaPlayer is null!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    const/4 p1, 0x1

    return p1
.end method

.method public startPlay()V
    .locals 4
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepare()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    :cond_1
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MediaPlayer setDataSource exception. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public stopPlay()V
    .locals 4
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    if-nez v0, :cond_0

    sget-object v0, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v1, "MediaPlayer is null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    iget-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    sget-object v1, Lcom/bef/effectsdk/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MediaPlayer stop exception on stop "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bef/effectsdk/AudioPlayer;->mIsPrepared:Z

    :cond_1
    return-void
.end method
