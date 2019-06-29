.class Landroid/support/v4/media/MediaController2ImplBase;
.super Ljava/lang/Object;
.source "MediaController2ImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaController2$SupportLibraryImpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;
    }
.end annotation


# static fields
.field static final DEBUG:Z

.field static final TAG:Ljava/lang/String; = "MC2ImplBase"


# instance fields
.field private mAllowedCommands:Landroid/support/v4/media/SessionCommandGroup2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mBufferedPositionMs:J
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mBufferingState:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mCallback:Landroid/support/v4/media/MediaController2$ControllerCallback;

.field private final mCallbackExecutor:Ljava/util/concurrent/Executor;

.field private final mContext:Landroid/content/Context;

.field final mControllerStub:Landroid/support/v4/media/MediaController2Stub;

.field private mCurrentMediaItem:Landroid/support/v4/media/MediaItem2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

.field private volatile mISession2:Landroid/support/v4/media/IMediaSession2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mInstance:Landroid/support/v4/media/MediaController2;

.field private mIsReleased:Z
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private mPlaybackInfo:Landroid/support/v4/media/MediaController2$PlaybackInfo;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlaybackSpeed:F
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlayerState:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPlaylist:Ljava/util/List;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation
.end field

.field private mPlaylistMetadata:Landroid/support/v4/media/MediaMetadata2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPositionEventTimeMs:J
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mPositionMs:J
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mRepeatMode:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mSessionActivity:Landroid/app/PendingIntent;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private mShuffleMode:I
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field

.field private final mToken:Landroid/support/v4/media/SessionToken2;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "MC2ImplBase"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionToken2;Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaController2$ControllerCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    iput-object p2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    if-eqz p1, :cond_4

    if-eqz p3, :cond_3

    if-eqz p5, :cond_2

    if-eqz p4, :cond_1

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    new-instance p1, Landroid/support/v4/media/MediaController2Stub;

    invoke-direct {p1, p0}, Landroid/support/v4/media/MediaController2Stub;-><init>(Landroid/support/v4/media/MediaController2ImplBase;)V

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    iput-object p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    iput-object p5, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallback:Landroid/support/v4/media/MediaController2$ControllerCallback;

    iput-object p4, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance p1, Landroid/support/v4/media/MediaController2ImplBase$1;

    invoke-direct {p1, p0}, Landroid/support/v4/media/MediaController2ImplBase$1;-><init>(Landroid/support/v4/media/MediaController2ImplBase;)V

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {p1}, Landroid/support/v4/media/SessionToken2;->getBinder()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/IBinder;

    invoke-static {p1}, Landroid/support/v4/media/IMediaSession2$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/IMediaSession2;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {p2}, Landroid/support/v4/media/SessionToken2;->getType()I

    move-result p2

    const/4 p3, 0x0

    if-nez p2, :cond_0

    iput-object p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaController2ImplBase;->connectToSession(Landroid/support/v4/media/IMediaSession2;)V

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    invoke-direct {p1, p0, p3}, Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaController2ImplBase$1;)V

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    invoke-direct {p0}, Landroid/support/v4/media/MediaController2ImplBase;->connectToService()V

    :goto_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "executor shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "callback shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string/jumbo p2, "token shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "context shouldn\'t be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/MediaController2;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    return-object p0
.end method

.method static synthetic access$200(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/MediaController2$ControllerCallback;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallback:Landroid/support/v4/media/MediaController2$ControllerCallback;

    return-object p0
.end method

.method static synthetic access$300(Landroid/support/v4/media/MediaController2ImplBase;)Landroid/support/v4/media/SessionToken2;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    return-object p0
.end method

.method static synthetic access$400(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/IMediaSession2;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaController2ImplBase;->connectToSession(Landroid/support/v4/media/IMediaSession2;)V

    return-void
.end method

.method private connectToService()V
    .locals 5

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.MediaSessionService2"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {v1}, Landroid/support/v4/media/SessionToken2;->getPackageName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {v2}, Landroid/support/v4/media/SessionToken2;->getServiceName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    iget-object v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    const/4 v4, 0x1

    invoke-virtual {v2, v0, v3, v4}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "MC2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bind to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " failed"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    sget-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_1

    const-string v0, "MC2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bind to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, " success"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private connectToSession(Landroid/support/v4/media/IMediaSession2;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Landroid/support/v4/media/IMediaSession2;->connect(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p1, "MC2ImplBase"

    const-string v0, "Failed to call connection request. Framework will retry automatically"

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method


# virtual methods
.method public addPlaylistItem(ILandroid/support/v4/media/MediaItem2;)V
    .locals 2
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/16 v0, 0xf

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p2}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->addPlaylistItem(Landroid/support/v4/media/IMediaController2;ILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public adjustVolume(II)V
    .locals 2

    nop

    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->adjustVolume(Landroid/support/v4/media/IMediaController2;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public close()V
    .locals 5

    sget-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MC2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "release from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    iget-boolean v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mIsReleased:Z

    if-eqz v2, :cond_1

    monitor-exit v0

    return-void

    :cond_1
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mIsReleased:Z

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    iget-object v4, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    invoke-virtual {v2, v4}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iput-object v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mServiceConnection:Landroid/support/v4/media/MediaController2ImplBase$SessionServiceConnection;

    :cond_2
    iput-object v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaController2Stub;->destroy()V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    :try_start_1
    invoke-interface {v1}, Landroid/support/v4/media/IMediaSession2;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v1, v0}, Landroid/support/v4/media/IMediaSession2;->release(Landroid/support/v4/media/IMediaController2;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_3
    :goto_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$2;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaController2ImplBase$2;-><init>(Landroid/support/v4/media/MediaController2ImplBase;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public fastForward()V
    .locals 3

    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->fastForward(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public getBrowserCompat()Landroid/support/v4/media/MediaBrowserCompat;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getBufferedPosition()J
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-wide/16 v1, -0x1

    monitor-exit v0

    return-wide v1

    :cond_0
    iget-wide v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mBufferedPositionMs:J

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getBufferingState()I
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x0

    monitor-exit v0

    return v1

    :cond_0
    iget v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mBufferingState:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCallback()Landroid/support/v4/media/MediaController2$ControllerCallback;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallback:Landroid/support/v4/media/MediaController2$ControllerCallback;

    return-object v0
.end method

.method public getCallbackExecutor()Ljava/util/concurrent/Executor;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public getCurrentMediaItem()Landroid/support/v4/media/MediaItem2;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCurrentMediaItem:Landroid/support/v4/media/MediaItem2;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getCurrentPosition()J
    .locals 6

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const-wide/16 v1, -0x1

    monitor-exit v0

    return-wide v1

    :cond_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    iget-object v1, v1, Landroid/support/v4/media/MediaController2;->mTimeDiff:Ljava/lang/Long;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    iget-object v1, v1, Landroid/support/v4/media/MediaController2;->mTimeDiff:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    goto :goto_0

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionEventTimeMs:J

    sub-long/2addr v1, v3

    :goto_0
    iget-wide v3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionMs:J

    iget v5, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackSpeed:F

    long-to-float v1, v1

    mul-float/2addr v5, v1

    float-to-long v1, v5

    add-long/2addr v3, v1

    const-wide/16 v1, 0x0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

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

.method public getDuration()J
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCurrentMediaItem:Landroid/support/v4/media/MediaItem2;

    invoke-virtual {v1}, Landroid/support/v4/media/MediaItem2;->getMetadata()Landroid/support/v4/media/MediaMetadata2;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "android.media.metadata.DURATION"

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaMetadata2;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "android.media.metadata.DURATION"

    invoke-virtual {v1, v2}, Landroid/support/v4/media/MediaMetadata2;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    monitor-exit v0

    return-wide v1

    :cond_0
    monitor-exit v0

    const-wide/16 v0, -0x1

    return-wide v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getInstance()Landroid/support/v4/media/MediaController2;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    return-object v0
.end method

.method public getPlaybackInfo()Landroid/support/v4/media/MediaController2$PlaybackInfo;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackInfo:Landroid/support/v4/media/MediaController2$PlaybackInfo;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaybackSpeed()F
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    const-string v2, "Session isn\'t active"

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    invoke-static {v1, v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 v1, 0x0

    monitor-exit v0

    return v1

    :cond_0
    iget v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackSpeed:F

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlayerState()I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlayerState:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylist()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getPlaylistMetadata()Landroid/support/v4/media/MediaMetadata2;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylistMetadata:Landroid/support/v4/media/MediaMetadata2;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getRepeatMode()I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mRepeatMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSessionActivity()Landroid/app/PendingIntent;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mSessionActivity:Landroid/app/PendingIntent;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mAllowedCommands:Landroid/support/v4/media/SessionCommandGroup2;

    invoke-virtual {v1, p1}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(I)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Controller isn\'t allowed to call command, commandCode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method getSessionInterfaceIfAble(Landroid/support/v4/media/SessionCommand2;)Landroid/support/v4/media/IMediaSession2;
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mAllowedCommands:Landroid/support/v4/media/SessionCommandGroup2;

    invoke-virtual {v1, p1}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(Landroid/support/v4/media/SessionCommand2;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "MC2ImplBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Controller isn\'t allowed to call command, command="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    monitor-exit v0

    return-object p1

    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getSessionToken()Landroid/support/v4/media/SessionToken2;
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mToken:Landroid/support/v4/media/SessionToken2;

    return-object v0
.end method

.method public getShuffleMode()I
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mShuffleMode:I

    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isConnected()Z
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method notifyBufferingStateChanged(Landroid/support/v4/media/MediaItem2;IJ)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mBufferingState:I

    iput-wide p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mBufferedPositionMs:J

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance p4, Landroid/support/v4/media/MediaController2ImplBase$6;

    invoke-direct {p4, p0, p1, p2}, Landroid/support/v4/media/MediaController2ImplBase$6;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaItem2;I)V

    invoke-interface {p3, p4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyCurrentMediaItemChanged(Landroid/support/v4/media/MediaItem2;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCurrentMediaItem:Landroid/support/v4/media/MediaItem2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$3;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$3;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaItem2;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyError(ILandroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$13;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v4/media/MediaController2ImplBase$13;-><init>(Landroid/support/v4/media/MediaController2ImplBase;ILandroid/os/Bundle;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method notifyPlaybackInfoChanges(Landroid/support/v4/media/MediaController2$PlaybackInfo;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackInfo:Landroid/support/v4/media/MediaController2$PlaybackInfo;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$9;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$9;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaController2$PlaybackInfo;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyPlaybackSpeedChanges(JJF)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-wide p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionEventTimeMs:J

    iput-wide p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionMs:J

    iput p5, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackSpeed:F

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance p2, Landroid/support/v4/media/MediaController2ImplBase$5;

    invoke-direct {p2, p0, p5}, Landroid/support/v4/media/MediaController2ImplBase$5;-><init>(Landroid/support/v4/media/MediaController2ImplBase;F)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyPlayerStateChanges(JJI)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-wide p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionEventTimeMs:J

    iput-wide p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionMs:J

    iput p5, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlayerState:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance p2, Landroid/support/v4/media/MediaController2ImplBase$4;

    invoke-direct {p2, p0, p5}, Landroid/support/v4/media/MediaController2ImplBase$4;-><init>(Landroid/support/v4/media/MediaController2ImplBase;I)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyPlaylistChanges(Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/support/v4/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    iput-object p2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylistMetadata:Landroid/support/v4/media/MediaMetadata2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$7;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v4/media/MediaController2ImplBase$7;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyPlaylistMetadataChanges(Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylistMetadata:Landroid/support/v4/media/MediaMetadata2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$8;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$8;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/MediaMetadata2;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyRepeatModeChanges(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mRepeatMode:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$10;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$10;-><init>(Landroid/support/v4/media/MediaController2ImplBase;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyRoutesInfoChanged(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$14;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$14;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method notifySeekCompleted(JJJ)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput-wide p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionEventTimeMs:J

    iput-wide p3, p0, Landroid/support/v4/media/MediaController2ImplBase;->mPositionMs:J

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance p2, Landroid/support/v4/media/MediaController2ImplBase$12;

    invoke-direct {p2, p0, p5, p6}, Landroid/support/v4/media/MediaController2ImplBase$12;-><init>(Landroid/support/v4/media/MediaController2ImplBase;J)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method notifyShuffleModeChanges(I)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iput p1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mShuffleMode:I

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$11;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$11;-><init>(Landroid/support/v4/media/MediaController2ImplBase;I)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method onAllowedCommandsChanged(Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$17;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$17;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/SessionCommandGroup2;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method onConnectedNotLocked(Landroid/support/v4/media/IMediaSession2;Landroid/support/v4/media/SessionCommandGroup2;ILandroid/support/v4/media/MediaItem2;JJFJLandroid/support/v4/media/MediaController2$PlaybackInfo;IILjava/util/List;Landroid/app/PendingIntent;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/IMediaSession2;",
            "Landroid/support/v4/media/SessionCommandGroup2;",
            "I",
            "Landroid/support/v4/media/MediaItem2;",
            "JJFJ",
            "Landroid/support/v4/media/MediaController2$PlaybackInfo;",
            "II",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/app/PendingIntent;",
            ")V"
        }
    .end annotation

    move-object v1, p0

    move-object v0, p1

    move-object v2, p2

    sget-boolean v3, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v3, :cond_0

    const-string v3, "MC2ImplBase"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onConnectedNotLocked sessionBinder="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", allowedCommands="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    nop

    if-eqz v0, :cond_6

    if-nez v2, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, v1, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v5, 0x1

    :try_start_1
    iget-boolean v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mIsReleased:Z

    if-eqz v6, :cond_2

    monitor-exit v4

    nop

    return-void

    :cond_2
    iget-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    if-eqz v6, :cond_3

    const-string v0, "MC2ImplBase"

    const-string v2, "Cannot be notified about the connection result many times. Probably a bug or malicious app."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    nop

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    nop

    iget-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2;->close()V

    return-void

    :catchall_0
    move-exception v0

    move v3, v5

    goto :goto_0

    :cond_3
    :try_start_3
    iput-object v2, v1, Landroid/support/v4/media/MediaController2ImplBase;->mAllowedCommands:Landroid/support/v4/media/SessionCommandGroup2;

    move v6, p3

    iput v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPlayerState:I

    move-object v6, p4

    iput-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mCurrentMediaItem:Landroid/support/v4/media/MediaItem2;

    move-wide v6, p5

    iput-wide v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPositionEventTimeMs:J

    move-wide v6, p7

    iput-wide v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPositionMs:J

    move/from16 v6, p9

    iput v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackSpeed:F

    move-wide/from16 v6, p10

    iput-wide v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mBufferedPositionMs:J

    move-object/from16 v6, p12

    iput-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPlaybackInfo:Landroid/support/v4/media/MediaController2$PlaybackInfo;

    move/from16 v6, p13

    iput v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mRepeatMode:I

    move/from16 v6, p14

    iput v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mShuffleMode:I

    move-object/from16 v6, p15

    iput-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mPlaylist:Ljava/util/List;

    move-object/from16 v6, p16

    iput-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mSessionActivity:Landroid/app/PendingIntent;

    iput-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    iget-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    invoke-interface {v0}, Landroid/support/v4/media/IMediaSession2;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    iget-object v6, v1, Landroid/support/v4/media/MediaController2ImplBase;->mDeathRecipient:Landroid/os/IBinder$DeathRecipient;

    invoke-interface {v0, v6, v3}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V
    :try_end_4
    .catch Landroid/os/RemoteException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    nop

    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    iget-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v4, Landroid/support/v4/media/MediaController2ImplBase$15;

    invoke-direct {v4, v1, v2}, Landroid/support/v4/media/MediaController2ImplBase$15;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/SessionCommandGroup2;)V

    invoke-interface {v0, v4}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    nop

    return-void

    :catch_0
    move-exception v0

    :try_start_7
    sget-boolean v2, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v2, :cond_4

    const-string v2, "MC2ImplBase"

    const-string v6, "Session died too early."

    invoke-static {v2, v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :cond_4
    nop

    :try_start_8
    monitor-exit v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    nop

    iget-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2;->close()V

    return-void

    :catchall_1
    move-exception v0

    :goto_0
    :try_start_9
    monitor-exit v4
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :try_start_a
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v0

    if-eqz v3, :cond_5

    iget-object v1, v1, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    invoke-virtual {v1}, Landroid/support/v4/media/MediaController2;->close()V

    :cond_5
    throw v0

    :cond_6
    :goto_1
    nop

    nop

    iget-object v0, v1, Landroid/support/v4/media/MediaController2ImplBase;->mInstance:Landroid/support/v4/media/MediaController2;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaController2;->close()V

    return-void
.end method

.method onCustomCommand(Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 3

    sget-boolean v0, Landroid/support/v4/media/MediaController2ImplBase;->DEBUG:Z

    if-eqz v0, :cond_0

    const-string v0, "MC2ImplBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCustomCommand cmd="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$16;

    invoke-direct {v1, p0, p1, p2, p3}, Landroid/support/v4/media/MediaController2ImplBase$16;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method onCustomLayoutChanged(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mCallbackExecutor:Ljava/util/concurrent/Executor;

    new-instance v1, Landroid/support/v4/media/MediaController2ImplBase$18;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaController2ImplBase$18;-><init>(Landroid/support/v4/media/MediaController2ImplBase;Ljava/util/List;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public pause()V
    .locals 3

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->pause(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public play()V
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->play(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public playFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/16 v0, 0x16

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->playFromMediaId(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public playFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    nop

    const/16 v0, 0x18

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->playFromSearch(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public playFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 2

    nop

    const/16 v0, 0x17

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->playFromUri(Landroid/support/v4/media/IMediaController2;Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public prepare()V
    .locals 3

    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->prepare(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public prepareFromMediaId(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/16 v0, 0x19

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->prepareFromMediaId(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public prepareFromSearch(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/16 v0, 0x1b

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->prepareFromSearch(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public prepareFromUri(Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    nop

    const/16 v0, 0x1a

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->prepareFromUri(Landroid/support/v4/media/IMediaController2;Landroid/net/Uri;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public removePlaylistItem(Landroid/support/v4/media/MediaItem2;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    nop

    const/16 v0, 0x10

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->removePlaylistItem(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "MC2ImplBase"

    const-string v1, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public replacePlaylistItem(ILandroid/support/v4/media/MediaItem2;)V
    .locals 2
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    nop

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p2}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->replacePlaylistItem(Landroid/support/v4/media/IMediaController2;ILandroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public reset()V
    .locals 3

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->reset(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public rewind()V
    .locals 3

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->rewind(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public seekTo(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_1

    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->seekTo(Landroid/support/v4/media/IMediaController2;J)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "position shouldn\'t be negative"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public selectRoute(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    nop

    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->selectRoute(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "MC2ImplBase"

    const-string v1, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public sendCustomCommand(Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/SessionCommand2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/ResultReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0, p1}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(Landroid/support/v4/media/SessionCommand2;)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p1}, Landroid/support/v4/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, v1, p1, p2, p3}, Landroid/support/v4/media/IMediaSession2;->sendCustomCommand(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string p3, "Cannot connect to the service or the session is gone"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public setPlaybackSpeed(F)V
    .locals 3

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/16 v1, 0x27

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v1, v2, p1}, Landroid/support/v4/media/IMediaSession2;->setPlaybackSpeed(Landroid/support/v4/media/IMediaController2;F)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public setPlaylist(Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/support/v4/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    const/16 v0, 0x13

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-static {p1}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToBundleList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    :goto_0
    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->setPlaylist(Landroid/support/v4/media/IMediaController2;Ljava/util/List;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    return-void
.end method

.method public setRating(Ljava/lang/String;Landroid/support/mediacompat/Rating2;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/mediacompat/Rating2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p2}, Landroid/support/mediacompat/Rating2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    invoke-interface {v1, v0, p1, p2}, Landroid/support/v4/media/IMediaSession2;->setRating(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public setRepeatMode(I)V
    .locals 2

    nop

    const/16 v0, 0xe

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->setRepeatMode(Landroid/support/v4/media/IMediaController2;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "MC2ImplBase"

    const-string v1, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public setShuffleMode(I)V
    .locals 2

    nop

    const/16 v0, 0xd

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->setShuffleMode(Landroid/support/v4/media/IMediaController2;I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "MC2ImplBase"

    const-string v1, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public setVolumeTo(II)V
    .locals 2

    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->setVolumeTo(Landroid/support/v4/media/IMediaController2;II)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string p2, "MC2ImplBase"

    const-string v0, "Cannot connect to the service or the session is gone"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public skipBackward()V
    .locals 0

    return-void
.end method

.method public skipForward()V
    .locals 0

    return-void
.end method

.method public skipToNextItem()V
    .locals 4

    nop

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v2}, Landroid/support/v4/media/IMediaSession2;->skipToNextItem(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v2, "MC2ImplBase"

    const-string v3, "Cannot connect to the service or the session is gone"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public skipToPlaylistItem(Landroid/support/v4/media/MediaItem2;)V
    .locals 3
    .param p1    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    nop

    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplBase;->mISession2:Landroid/support/v4/media/IMediaSession2;

    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, v2, p1}, Landroid/support/v4/media/IMediaSession2;->skipToPlaylistItem(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v0, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public skipToPreviousItem()V
    .locals 4

    nop

    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v2}, Landroid/support/v4/media/IMediaSession2;->skipToPreviousItem(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v2, "MC2ImplBase"

    const-string v3, "Cannot connect to the service or the session is gone"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public subscribeRoutesInfo()V
    .locals 3

    nop

    const/16 v0, 0x24

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->subscribeRoutesInfo(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public unsubscribeRoutesInfo()V
    .locals 3

    nop

    const/16 v0, 0x25

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1}, Landroid/support/v4/media/IMediaSession2;->unsubscribeRoutesInfo(Landroid/support/v4/media/IMediaController2;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "MC2ImplBase"

    const-string v2, "Cannot connect to the service or the session is gone"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_0
    :goto_0
    return-void
.end method

.method public updatePlaylistMetadata(Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .param p1    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/16 v0, 0x15

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaController2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaController2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->updatePlaylistMetadata(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    const-string v0, "MC2ImplBase"

    const-string v1, "Cannot connect to the service or the session is gone"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_1
    return-void
.end method
