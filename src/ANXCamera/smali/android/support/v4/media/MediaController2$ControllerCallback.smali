.class public abstract Landroid/support/v4/media/MediaController2$ControllerCallback;
.super Ljava/lang/Object;
.source "MediaController2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaController2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ControllerCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllowedCommandsChanged(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/SessionCommandGroup2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onBufferingStateChanged(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/MediaItem2;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onConnected(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionCommandGroup2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/SessionCommandGroup2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onCurrentMediaItemChanged(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/MediaItem2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaItem2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onCustomCommand(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/SessionCommand2;Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/SessionCommand2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Landroid/os/ResultReceiver;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onCustomLayoutChanged(Landroid/support/v4/media/MediaController2;Ljava/util/List;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaController2;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaSession2$CommandButton;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onDisconnected(Landroid/support/v4/media/MediaController2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onError(Landroid/support/v4/media/MediaController2;ILandroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onPlaybackInfoChanged(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/MediaController2$PlaybackInfo;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaController2$PlaybackInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onPlaybackSpeedChanged(Landroid/support/v4/media/MediaController2;F)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onPlayerStateChanged(Landroid/support/v4/media/MediaController2;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onPlaylistChanged(Landroid/support/v4/media/MediaController2;Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaController2;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/support/v4/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public onPlaylistMetadataChanged(Landroid/support/v4/media/MediaController2;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onRepeatModeChanged(Landroid/support/v4/media/MediaController2;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onRoutesInfoChanged(Landroid/support/v4/media/MediaController2;Ljava/util/List;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/media/MediaController2;",
            "Ljava/util/List<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onSeekCompleted(Landroid/support/v4/media/MediaController2;J)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onShuffleModeChanged(Landroid/support/v4/media/MediaController2;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaController2;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
