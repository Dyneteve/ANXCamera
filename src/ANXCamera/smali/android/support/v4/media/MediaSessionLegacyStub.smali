.class Landroid/support/v4/media/MediaSessionLegacyStub;
.super Landroid/support/v4/media/session/MediaSessionCompat$Callback;
.source "MediaSessionLegacyStub.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x13
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;,
        Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;
    }
.end annotation


# static fields
.field private static final DEBUG:Z

.field private static final TAG:Ljava/lang/String; = "MediaSessionLegacyStub"

.field private static final sCommandsForOnCommandRequest:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/support/v4/media/SessionCommand2;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Landroid/support/v4/media/MediaSession2$ControllerInfo;",
            "Landroid/support/v4/media/SessionCommandGroup2;",
            ">;"
        }
    .end annotation
.end field

.field private final mConnectingControllers:Ljava/util/Set;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroid/os/IBinder;",
            ">;"
        }
    .end annotation
.end field

.field final mContext:Landroid/content/Context;

.field private final mControllers:Landroid/support/v4/util/ArrayMap;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Landroid/os/IBinder;",
            "Landroid/support/v4/media/MediaSession2$ControllerInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field final mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "MediaSessionLegacyStub"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Landroid/support/v4/media/MediaSessionLegacyStub;->DEBUG:Z

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Landroid/support/v4/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    new-instance v0, Landroid/support/v4/media/SessionCommandGroup2;

    invoke-direct {v0}, Landroid/support/v4/media/SessionCommandGroup2;-><init>()V

    invoke-virtual {v0}, Landroid/support/v4/media/SessionCommandGroup2;->addAllPlaybackCommands()V

    invoke-virtual {v0}, Landroid/support/v4/media/SessionCommandGroup2;->addAllPlaylistCommands()V

    invoke-virtual {v0}, Landroid/support/v4/media/SessionCommandGroup2;->addAllVolumeCommands()V

    invoke-virtual {v0}, Landroid/support/v4/media/SessionCommandGroup2;->getCommands()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/media/SessionCommand2;

    sget-object v2, Landroid/support/v4/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/support/v4/media/SessionCommand2;->getCommandCode()I

    move-result v3

    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/media/session/MediaSessionCompat$Callback;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mConnectingControllers:Ljava/util/Set;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommand2;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/MediaSessionLegacyStub;->isAllowedCommand(Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommand2;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$100()Landroid/util/SparseArray;
    .locals 1

    sget-object v0, Landroid/support/v4/media/MediaSessionLegacyStub;->sCommandsForOnCommandRequest:Landroid/util/SparseArray;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;I)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/support/v4/media/MediaSessionLegacyStub;->isAllowedCommand(Landroid/support/v4/media/MediaSession2$ControllerInfo;I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300()Z
    .locals 1

    sget-boolean v0, Landroid/support/v4/media/MediaSessionLegacyStub;->DEBUG:Z

    return v0
.end method

.method static synthetic access$400(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$500(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mConnectingControllers:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$600(Landroid/support/v4/media/MediaSessionLegacyStub;)Landroid/support/v4/util/ArrayMap;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    return-object p0
.end method

.method static synthetic access$700(Landroid/support/v4/media/MediaSessionLegacyStub;)Landroid/support/v4/util/ArrayMap;
    .locals 0

    iget-object p0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;

    return-object p0
.end method

.method private connect(Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaSessionLegacyStub;->createControllerInfo(Landroid/os/Bundle;)Landroid/support/v4/media/MediaSession2$ControllerInfo;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$7;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v4/media/MediaSessionLegacyStub$7;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/os/ResultReceiver;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private createControllerInfo(Landroid/os/Bundle;)Landroid/support/v4/media/MediaSession2$ControllerInfo;
    .locals 5

    const-string v0, "android.support.v4.media.argument.ICONTROLLER_CALLBACK"

    invoke-static {p1, v0}, Landroid/support/v4/app/BundleCompat;->getBinder(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/media/session/IMediaControllerCallback$Stub;->asInterface(Landroid/os/IBinder;)Landroid/support/v4/media/session/IMediaControllerCallback;

    move-result-object v0

    const-string v1, "android.support.v4.media.argument.PACKAGE_NAME"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.support.v4.media.argument.UID"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v3, "android.support.v4.media.argument.PID"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    new-instance v3, Landroid/support/v4/media/MediaSession2$ControllerInfo;

    new-instance v4, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;

    invoke-direct {v4, p0, v0}, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/session/IMediaControllerCallback;)V

    invoke-direct {v3, v1, p1, v2, v4}, Landroid/support/v4/media/MediaSession2$ControllerInfo;-><init>(Ljava/lang/String;IILandroid/support/v4/media/MediaSession2$ControllerCb;)V

    return-object v3
.end method

.method private disconnect(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/support/v4/media/MediaSessionLegacyStub;->createControllerInfo(Landroid/os/Bundle;)Landroid/support/v4/media/MediaSession2$ControllerInfo;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$8;

    invoke-direct {v1, p0, p1}, Landroid/support/v4/media/MediaSessionLegacyStub$8;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private isAllowedCommand(Landroid/support/v4/media/MediaSession2$ControllerInfo;I)Z
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/SessionCommandGroup2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private isAllowedCommand(Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommand2;)Z
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/SessionCommandGroup2;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(Landroid/support/v4/media/SessionCommand2;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private onCommand2(Landroid/os/IBinder;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 1
    .param p1    # Landroid/os/IBinder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Landroid/support/v4/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroid/support/v4/media/SessionCommand2;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V

    return-void
.end method

.method private onCommand2(Landroid/os/IBinder;Landroid/support/v4/media/SessionCommand2;Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 1
    .param p1    # Landroid/os/IBinder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/SessionCommand2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/support/v4/media/MediaSessionLegacyStub;->onCommand2Internal(Landroid/os/IBinder;Landroid/support/v4/media/SessionCommand2;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V

    return-void
.end method

.method private onCommand2Internal(Landroid/os/IBinder;Landroid/support/v4/media/SessionCommand2;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V
    .locals 7
    .param p1    # Landroid/os/IBinder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/SessionCommand2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    move-object v4, p1

    check-cast v4, Landroid/support/v4/media/MediaSession2$ControllerInfo;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    if-eqz p1, :cond_1

    if-nez v4, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance v0, Landroid/support/v4/media/MediaSessionLegacyStub$6;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Landroid/support/v4/media/MediaSessionLegacyStub$6;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/SessionCommand2;Landroid/support/v4/media/MediaSession2$ControllerInfo;ILandroid/support/v4/media/MediaSessionLegacyStub$Session2Runnable;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method getConnectedControllers()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaSession2$ControllerInfo;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v1

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    iget-object v3, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v3}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v3, v2}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    monitor-exit v1

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$3;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaSessionLegacyStub$3;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onPlay()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$2;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaSessionLegacyStub$2;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onPrepare()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$1;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaSessionLegacyStub$1;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onSeekTo(J)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$5;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v4/media/MediaSessionLegacyStub$5;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;J)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onStop()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallbackExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Landroid/support/v4/media/MediaSessionLegacyStub$4;

    invoke-direct {v1, p0}, Landroid/support/v4/media/MediaSessionLegacyStub$4;-><init>(Landroid/support/v4/media/MediaSessionLegacyStub;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method removeControllerInfo(Landroid/support/v4/media/MediaSession2$ControllerInfo;)V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mControllers:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v4/media/MediaSession2$ControllerInfo;

    sget-boolean v1, Landroid/support/v4/media/MediaSessionLegacyStub;->DEBUG:Z

    if-eqz v1, :cond_0

    const-string v1, "MediaSessionLegacyStub"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "releasing "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

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

.method setAllowedCommands(Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub;->mAllowedCommandGroupMap:Landroid/support/v4/util/ArrayMap;

    invoke-virtual {v1, p1, p2}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
