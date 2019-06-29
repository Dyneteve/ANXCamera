.class public abstract Landroid/support/v4/media/MediaPlaylistAgent$PlaylistEventCallback;
.super Ljava/lang/Object;
.source "MediaPlaylistAgent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/MediaPlaylistAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PlaylistEventCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPlaylistChanged(Landroid/support/v4/media/MediaPlaylistAgent;Ljava/util/List;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaPlaylistAgent;
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
            "Landroid/support/v4/media/MediaPlaylistAgent;",
            "Ljava/util/List<",
            "Landroid/support/v4/media/MediaItem2;",
            ">;",
            "Landroid/support/v4/media/MediaMetadata2;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public onPlaylistMetadataChanged(Landroid/support/v4/media/MediaPlaylistAgent;Landroid/support/v4/media/MediaMetadata2;)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaPlaylistAgent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/media/MediaMetadata2;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public onRepeatModeChanged(Landroid/support/v4/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaPlaylistAgent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method

.method public onShuffleModeChanged(Landroid/support/v4/media/MediaPlaylistAgent;I)V
    .locals 0
    .param p1    # Landroid/support/v4/media/MediaPlaylistAgent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    return-void
.end method
