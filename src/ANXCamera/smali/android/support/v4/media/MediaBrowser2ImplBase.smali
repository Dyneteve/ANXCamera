.class Landroid/support/v4/media/MediaBrowser2ImplBase;
.super Landroid/support/v4/media/MediaController2ImplBase;
.source "MediaBrowser2ImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaBrowser2$SupportLibraryImpl;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionToken2;Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaBrowser2$BrowserCallback;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Landroid/support/v4/media/MediaController2ImplBase;-><init>(Landroid/content/Context;Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionToken2;Ljava/util/concurrent/Executor;Landroid/support/v4/media/MediaController2$ControllerCallback;)V

    return-void
.end method


# virtual methods
.method public getCallback()Landroid/support/v4/media/MediaBrowser2$BrowserCallback;
    .locals 1

    invoke-super {p0}, Landroid/support/v4/media/MediaController2ImplBase;->getCallback()Landroid/support/v4/media/MediaController2$ControllerCallback;

    move-result-object v0

    check-cast v0, Landroid/support/v4/media/MediaBrowser2$BrowserCallback;

    return-object v0
.end method

.method public bridge synthetic getCallback()Landroid/support/v4/media/MediaController2$ControllerCallback;
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getCallback()Landroid/support/v4/media/MediaBrowser2$BrowserCallback;

    move-result-object v0

    return-object v0
.end method

.method public getChildren(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 7

    const/16 v0, 0x1d

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v1

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-interface/range {v1 .. v6}, Landroid/support/v4/media/IMediaSession2;->getChildren(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;IILandroid/os/Bundle;)V
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

.method public getItem(Ljava/lang/String;)V
    .locals 2

    const/16 v0, 0x1e

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->getItem(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;)V
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

.method public getLibraryRoot(Landroid/os/Bundle;)V
    .locals 2

    const/16 v0, 0x1f

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->getLibraryRoot(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
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

.method public getSearchResult(Ljava/lang/String;IILandroid/os/Bundle;)V
    .locals 7

    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v1

    if-eqz v1, :cond_0

    :try_start_0
    iget-object v2, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-interface/range {v1 .. v6}, Landroid/support/v4/media/IMediaSession2;->getSearchResult(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;IILandroid/os/Bundle;)V
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

.method public search(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    const/16 v0, 0x21

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->search(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
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

.method public subscribe(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 2

    const/16 v0, 0x22

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1, p2}, Landroid/support/v4/media/IMediaSession2;->subscribe(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;Landroid/os/Bundle;)V
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

.method public unsubscribe(Ljava/lang/String;)V
    .locals 2

    const/16 v0, 0x23

    invoke-virtual {p0, v0}, Landroid/support/v4/media/MediaBrowser2ImplBase;->getSessionInterfaceIfAble(I)Landroid/support/v4/media/IMediaSession2;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaBrowser2ImplBase;->mControllerStub:Landroid/support/v4/media/MediaController2Stub;

    invoke-interface {v0, v1, p1}, Landroid/support/v4/media/IMediaSession2;->unsubscribe(Landroid/support/v4/media/IMediaController2;Ljava/lang/String;)V
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
