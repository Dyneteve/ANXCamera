.class Landroid/support/v4/media/MediaSessionService2ImplBase;
.super Ljava/lang/Object;
.source "MediaSessionService2ImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaSessionService2$SupportLibraryImpl;


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "MSS2ImplBase"


# instance fields
.field private final mLock:Ljava/lang/Object;

.field private mSession:Landroid/support/v4/media/MediaSession2;
    .annotation build Landroid/support/annotation/GuardedBy;
        value = "mLock"
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mLock:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public getSession()Landroid/support/v4/media/MediaSession2;
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getSessionType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 2

    const-string v0, "android.media.MediaSessionService2"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2;->getSessionBinder()Landroid/os/IBinder;

    move-result-object v0

    monitor-exit p1

    return-object v0

    :cond_0
    const-string v0, "MSS2ImplBase"

    const-string v1, "Session hasn\'t created"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate(Landroid/support/v4/media/MediaSessionService2;)V
    .locals 4

    new-instance v0, Landroid/support/v4/media/SessionToken2;

    new-instance v1, Landroid/content/ComponentName;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-direct {v0, p1, v1}, Landroid/support/v4/media/SessionToken2;-><init>(Landroid/content/Context;Landroid/content/ComponentName;)V

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getType()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaSessionService2ImplBase;->getSessionType()I

    move-result v2

    if-ne v1, v2, :cond_1

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/support/v4/media/MediaSessionService2;->onCreateSession(Ljava/lang/String;)Landroid/support/v4/media/MediaSession2;

    move-result-object p1

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iput-object p1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    if-eqz p1, :cond_0

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2;->getToken()Landroid/support/v4/media/SessionToken2;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaSession2;->getToken()Landroid/support/v4/media/SessionToken2;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/media/SessionToken2;->getType()I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaSessionService2ImplBase;->getSessionType()I

    move-result v2

    if-ne p1, v2, :cond_0

    monitor-exit v1

    return-void

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected session with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " and type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getType()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", but got "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionService2ImplBase;->mSession:Landroid/support/v4/media/MediaSession2;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected session type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/support/v4/media/MediaSessionService2ImplBase;->getSessionType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " but was "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/support/v4/media/SessionToken2;->getType()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onUpdateNotification()Landroid/support/v4/media/MediaSessionService2$MediaNotification;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
