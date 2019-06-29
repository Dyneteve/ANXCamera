.class final Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;
.super Landroid/support/v4/media/MediaSession2$ControllerCb;
.source "MediaSession2Stub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSession2Stub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Controller2Cb"
.end annotation


# instance fields
.field private final mIControllerCallback:Landroid/support/v4/media/IMediaController2;


# direct methods
.method constructor <init>(Landroid/support/v4/media/IMediaController2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/IMediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2$ControllerCb;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    return-void
.end method


# virtual methods
.method getId()Landroid/os/IBinder;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0}, Landroid/support/v4/media/IMediaController2;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method onAllowedCommandsChanged(Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-virtual {p1}, Landroid/support/v4/media/SessionCommandGroup2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onAllowedCommandsChanged(Landroid/os/Bundle;)V

    return-void
.end method

.method onBufferingStateChanged(Landroid/support/v4/media/MediaItem2;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    invoke-interface {v0, p1, p2, p3, p4}, Landroid/support/v4/media/IMediaController2;->onBufferingStateChanged(Landroid/os/Bundle;IJ)V

    return-void
.end method

.method onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/IMediaController2;->onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return-void
.end method

.method onCurrentMediaItemChanged(Landroid/support/v4/media/MediaItem2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onCurrentMediaItemChanged(Landroid/os/Bundle;)V

    return-void
.end method

.method onCustomCommand(Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-virtual {p1}, Landroid/support/v4/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/IMediaController2;->onCustomCommand(Landroid/os/Bundle;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V

    return-void
.end method

.method onCustomLayoutChanged(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-static {p1}, Landroid/support/v4/media/MediaUtils2;->convertCommandButtonListToBundleList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onCustomLayoutChanged(Ljava/util/List;)V

    return-void
.end method

.method onDisconnected()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0}, Landroid/support/v4/media/IMediaController2;->onDisconnected()V

    return-void
.end method

.method onError(ILandroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/IMediaController2;->onError(ILandroid/os/Bundle;)V

    return-void
.end method

.method onGetChildrenDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p4}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToBundleList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2;->onGetChildrenDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method onGetItemDone(Ljava/lang/String;Landroid/support/v4/media/MediaItem2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    :goto_0
    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/IMediaController2;->onGetItemDone(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onGetLibraryRootDone(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/IMediaController2;->onGetLibraryRootDone(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onGetSearchResultDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {p4}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToBundleList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2;->onGetSearchResultDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaybackInfoChanged(Landroid/support/v4/media/MediaController2$PlaybackInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaController2$PlaybackInfo;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onPlaybackInfoChanged(Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaybackSpeedChanged(JJF)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2;->onPlaybackSpeedChanged(JJF)V

    return-void
.end method

.method onPlayerStateChanged(JJI)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    move-wide v1, p1

    move-wide v3, p3

    move v5, p5

    invoke-interface/range {v0 .. v5}, Landroid/support/v4/media/IMediaController2;->onPlayerStateChanged(JJI)V

    return-void
.end method

.method onPlaylistChanged(Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 1
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-static {p1}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToBundleList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    :goto_0
    invoke-interface {v0, p1, p2}, Landroid/support/v4/media/IMediaController2;->onPlaylistChanged(Ljava/util/List;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaylistMetadataChanged(Landroid/support/v4/media/MediaMetadata2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onPlaylistMetadataChanged(Landroid/os/Bundle;)V

    return-void
.end method

.method onRepeatModeChanged(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onRepeatModeChanged(I)V

    return-void
.end method

.method onRoutesInfoChanged(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onRoutesInfoChanged(Ljava/util/List;)V

    return-void
.end method

.method onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1, p2, p3}, Landroid/support/v4/media/IMediaController2;->onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V

    return-void
.end method

.method onSeekCompleted(JJJ)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    move-wide v1, p1

    move-wide v3, p3

    move-wide v5, p5

    invoke-interface/range {v0 .. v6}, Landroid/support/v4/media/IMediaController2;->onSeekCompleted(JJJ)V

    return-void
.end method

.method onShuffleModeChanged(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$Controller2Cb;->mIControllerCallback:Landroid/support/v4/media/IMediaController2;

    invoke-interface {v0, p1}, Landroid/support/v4/media/IMediaController2;->onShuffleModeChanged(I)V

    return-void
.end method
