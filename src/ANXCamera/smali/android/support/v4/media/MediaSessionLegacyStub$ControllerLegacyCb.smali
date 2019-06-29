.class final Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;
.super Landroid/support/v4/media/MediaSession2$ControllerCb;
.source "MediaSessionLegacyStub.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaSessionLegacyStub;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ControllerLegacyCb"
.end annotation


# instance fields
.field private final mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

.field final synthetic this$0:Landroid/support/v4/media/MediaSessionLegacyStub;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/session/IMediaControllerCallback;)V
    .locals 0
    .param p2    # Landroid/support/v4/media/session/IMediaControllerCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-direct {p0}, Landroid/support/v4/media/MediaSession2$ControllerCb;-><init>()V

    iput-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    return-void
.end method


# virtual methods
.method getId()Landroid/os/IBinder;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    invoke-interface {v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method onAllowedCommandsChanged(Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {p1}, Landroid/support/v4/media/SessionCommandGroup2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_ALLOWED_COMMANDS_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onBufferingStateChanged(Landroid/support/v4/media/MediaItem2;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    const-string p4, "android.support.v4.media.argument.MEDIA_ITEM"

    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {p3, p4, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p1, "android.support.v4.media.argument.BUFFERING_STATE"

    invoke-virtual {p3, p1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object p2, p2, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p2}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p2, "android.support.v4.media.session.event.ON_BUFFERING_STATE_CHANGED"

    invoke-interface {p1, p2, p3}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onChildrenChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method

.method onCurrentMediaItemChanged(Landroid/support/v4/media/MediaItem2;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.MEDIA_ITEM"

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_CURRENT_MEDIA_ITEM_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onCustomCommand(Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.CUSTOM_COMMAND"

    invoke-virtual {p1}, Landroid/support/v4/media/SessionCommand2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p1, "android.support.v4.media.argument.ARGUMENTS"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p1, "android.support.v4.media.argument.RESULT_RECEIVER"

    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p2, "android.support.v4.media.session.event.SEND_CUSTOM_COMMAND"

    invoke-interface {p1, p2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.COMMAND_BUTTONS"

    invoke-static {p1}, Landroid/support/v4/media/MediaUtils2;->convertCommandButtonListToParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.SET_CUSTOM_LAYOUT"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onDisconnected()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    invoke-interface {v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onSessionDestroyed()V

    return-void
.end method

.method onError(ILandroid/os/Bundle;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.ERROR_CODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "android.support.v4.media.argument.EXTRAS"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p2, "android.support.v4.media.session.event.ON_ERROR"

    invoke-interface {p1, p2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onGetChildrenDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 0
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

    return-void
.end method

.method onGetItemDone(Ljava/lang/String;Landroid/support/v4/media/MediaItem2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method

.method onGetLibraryRootDone(Landroid/os/Bundle;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method

.method onGetSearchResultDone(Ljava/lang/String;IILjava/util/List;Landroid/os/Bundle;)V
    .locals 0
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

    return-void
.end method

.method onPlaybackInfoChanged(Landroid/support/v4/media/MediaController2$PlaybackInfo;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.PLAYBACK_INFO"

    invoke-virtual {p1}, Landroid/support/v4/media/MediaController2$PlaybackInfo;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_PLAYBACK_INFO_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaybackSpeedChanged(JJF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object p3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object p3, p3, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p3}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p3, "android.support.v4.media.session.event.ON_PLAYBACK_SPEED_CHANGED"

    invoke-interface {p2, p3, p1}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlayerStateChanged(JJI)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "android.support.v4.media.argument.PLAYER_STATE"

    invoke-virtual {p1, p2, p5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object p3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object p3, p3, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p3}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p3, "android.support.v4.media.session.event.ON_PLAYER_STATE_CHANGED"

    invoke-interface {p2, p3, p1}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaylistChanged(Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.PLAYLIST"

    invoke-static {p1}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    const-string p1, "android.support.v4.media.argument.PLAYLIST_METADATA"

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p2

    :goto_0
    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p2, "android.support.v4.media.session.event.ON_PLAYLIST_CHANGED"

    invoke-interface {p1, p2, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onPlaylistMetadataChanged(Landroid/support/v4/media/MediaMetadata2;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.PLAYLIST_METADATA"

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_PLAYLIST_METADATA_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onRepeatModeChanged(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.REPEAT_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_REPEAT_MODE_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onRoutesInfoChanged(Ljava/util/List;)V
    .locals 3
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

    nop

    if-eqz p1, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.ROUTE_BUNDLE"

    const/4 v2, 0x0

    new-array v2, v2, [Landroid/os/Bundle;

    invoke-interface {p1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/os/Parcelable;

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_ROUTES_INFO_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onSearchResultChanged(Ljava/lang/String;ILandroid/os/Bundle;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    return-void
.end method

.method onSeekCompleted(JJJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "android.support.v4.media.argument.SEEK_POSITION"

    invoke-virtual {p1, p2, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p2, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object p3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object p3, p3, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p3}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    iget-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string p3, "android.support.v4.media.session.event.ON_SEEK_COMPLETED"

    invoke-interface {p2, p3, p1}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method onShuffleModeChanged(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "android.support.v4.media.argument.SHUFFLE_MODE"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$ControllerLegacyCb;->mIControllerCallback:Landroid/support/v4/media/session/IMediaControllerCallback;

    const-string v1, "android.support.v4.media.session.event.ON_SHUFFLE_MODE_CHANGED"

    invoke-interface {p1, v1, v0}, Landroid/support/v4/media/session/IMediaControllerCallback;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method
