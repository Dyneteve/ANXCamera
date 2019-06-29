.class Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;
.super Landroid/support/v4/media/BaseMediaPlayer$PlayerEventCallback;
.source "MediaSession2ImplBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSession2ImplBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MyPlayerEventCallback"
.end annotation


# instance fields
.field private final mSession:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v4/media/MediaSession2ImplBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/media/BaseMediaPlayer$PlayerEventCallback;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/MediaSession2ImplBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;-><init>(Landroid/support/v4/media/MediaSession2ImplBase;)V

    return-void
.end method

.method static synthetic access$300(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getMediaItem(Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;

    move-result-object p0

    return-object p0
.end method

.method private getMediaItem(Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;
    .locals 3

    invoke-virtual {p1}, Landroid/support/v4/media/MediaSession2ImplBase;->getPlaylistAgent()Landroid/support/v4/media/MediaPlaylistAgent;

    move-result-object p1

    if-nez p1, :cond_1

    sget-boolean p1, Landroid/support/v4/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz p1, :cond_0

    const-string p1, "MS2ImplBase"

    const-string p2, "Session is closed"

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {p1, p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    const/4 p1, 0x0

    return-object p1

    :cond_1
    invoke-virtual {p1, p2}, Landroid/support/v4/media/MediaPlaylistAgent;->getMediaItem(Landroid/support/v4/media/DataSourceDesc;)Landroid/support/v4/media/MediaItem2;

    move-result-object p1

    if-nez p1, :cond_2

    sget-boolean v0, Landroid/support/v4/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_2

    const-string v0, "MS2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not find matching item for dsd="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    invoke-static {v0, p2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    return-object p1
.end method

.method private getSession()Landroid/support/v4/media/MediaSession2ImplBase;
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->mSession:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/MediaSession2ImplBase;

    if-nez v0, :cond_0

    sget-boolean v1, Landroid/support/v4/media/MediaSession2ImplBase;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MS2ImplBase"

    const-string v2, "Session is closed"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    return-object v0
.end method


# virtual methods
.method public onBufferingStateChanged(Landroid/support/v4/media/BaseMediaPlayer;Landroid/support/v4/media/DataSourceDesc;I)V
    .locals 8

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v2

    if-eqz v2, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    new-instance v7, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$4;

    move-object v0, v7

    move-object v1, p0

    move-object v3, p2

    move-object v4, p1

    move v5, p3

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$4;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/BaseMediaPlayer;I)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onCurrentDataSourceChanged(Landroid/support/v4/media/BaseMediaPlayer;Landroid/support/v4/media/DataSourceDesc;)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;

    invoke-direct {v2, p0, p2, v0, p1}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$1;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onMediaPrepared(Landroid/support/v4/media/BaseMediaPlayer;Landroid/support/v4/media/DataSourceDesc;)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v0

    if-eqz v0, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$2;

    invoke-direct {v2, p0, v0, p2, p1}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$2;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/DataSourceDesc;Landroid/support/v4/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onPlaybackSpeedChanged(Landroid/support/v4/media/BaseMediaPlayer;F)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$5;

    invoke-direct {v2, p0, v0, p1, p2}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$5;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/BaseMediaPlayer;F)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onPlayerStateChanged(Landroid/support/v4/media/BaseMediaPlayer;I)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$3;

    invoke-direct {v2, p0, v0, p2, p1}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$3;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;ILandroid/support/v4/media/BaseMediaPlayer;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSeekCompleted(Landroid/support/v4/media/BaseMediaPlayer;J)V
    .locals 8

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;->getSession()Landroid/support/v4/media/MediaSession2ImplBase;

    move-result-object v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2ImplBase;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v6

    new-instance v7, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;

    move-object v0, v7

    move-object v1, p0

    move-object v3, p1

    move-wide v4, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;-><init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback;Landroid/support/v4/media/MediaSession2ImplBase;Landroid/support/v4/media/BaseMediaPlayer;J)V

    invoke-interface {v6, v7}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
