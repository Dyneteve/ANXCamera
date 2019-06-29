.class Landroid/support/v4/media/MediaSessionLegacyStub$7;
.super Ljava/lang/Object;
.source "MediaSessionLegacyStub.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSessionLegacyStub;->connect(Landroid/os/Bundle;Landroid/os/ResultReceiver;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

.field final synthetic val$cb:Landroid/os/ResultReceiver;

.field final synthetic val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSessionLegacyStub;Landroid/support/v4/media/MediaSession2$ControllerInfo;Landroid/os/ResultReceiver;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iput-object p2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    iput-object p3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$cb:Landroid/os/ResultReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v0}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$400(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v1}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$500(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCallback()Landroid/support/v4/media/MediaSession2$SessionCallback;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v1, v1, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/media/MediaSession2$SessionCallback;->onConnect(Landroid/support/v4/media/MediaSession2;Landroid/support/v4/media/MediaSession2$ControllerInfo;)Landroid/support/v4/media/SessionCommandGroup2;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->isTrusted()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    move v2, v1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v2, 0x1

    :goto_1
    const/4 v3, 0x0

    if-eqz v2, :cond_b

    invoke-static {}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$300()Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "MediaSessionLegacyStub"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Accepting connection, controllerInfo="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " allowedCommands="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    if-nez v0, :cond_4

    new-instance v0, Landroid/support/v4/media/SessionCommandGroup2;

    invoke-direct {v0}, Landroid/support/v4/media/SessionCommandGroup2;-><init>()V

    :cond_4
    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v2}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$400(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_1
    iget-object v4, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v4}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$500(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/util/Set;

    move-result-object v4

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v5}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v4, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v4}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$600(Landroid/support/v4/media/MediaSessionLegacyStub;)Landroid/support/v4/util/ArrayMap;

    move-result-object v4

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v5}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v5

    iget-object v6, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v4, v5, v6}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v4}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$700(Landroid/support/v4/media/MediaSessionLegacyStub;)Landroid/support/v4/util/ArrayMap;

    move-result-object v4

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v4, v5, v0}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v4, "android.support.v4.media.argument.ALLOWED_COMMANDS"

    invoke-virtual {v0}, Landroid/support/v4/media/SessionCommandGroup2;->toBundle()Landroid/os/Bundle;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v4, "android.support.v4.media.argument.PLAYER_STATE"

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v5, v5, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v5}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlayerState()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "android.support.v4.media.argument.BUFFERING_STATE"

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v5, v5, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v5}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getBufferingState()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "android.support.v4.media.argument.PLAYBACK_STATE_COMPAT"

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v5, v5, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v5}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackStateCompat()Landroid/support/v4/media/session/PlaybackStateCompat;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v4, "android.support.v4.media.argument.REPEAT_MODE"

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v5, v5, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v5}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getRepeatMode()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "android.support.v4.media.argument.SHUFFLE_MODE"

    iget-object v5, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v5, v5, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v5}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getShuffleMode()I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/16 v4, 0x12

    invoke-virtual {v0, v4}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(I)Z

    move-result v4

    if-eqz v4, :cond_5

    iget-object v4, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v4, v4, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v4}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaylist()Ljava/util/List;

    move-result-object v4

    goto :goto_2

    :cond_5
    move-object v4, v3

    :goto_2
    if-eqz v4, :cond_6

    const-string v5, "android.support.v4.media.argument.PLAYLIST"

    invoke-static {v4}, Landroid/support/v4/media/MediaUtils2;->convertMediaItem2ListToParcelableArray(Ljava/util/List;)[Landroid/os/Parcelable;

    move-result-object v4

    invoke-virtual {v2, v5, v4}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    :cond_6
    const/16 v4, 0x14

    invoke-virtual {v0, v4}, Landroid/support/v4/media/SessionCommandGroup2;->hasCommand(I)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getCurrentMediaItem()Landroid/support/v4/media/MediaItem2;

    move-result-object v3

    nop

    :cond_7
    if-eqz v3, :cond_8

    const-string v0, "android.support.v4.media.argument.MEDIA_ITEM"

    invoke-virtual {v3}, Landroid/support/v4/media/MediaItem2;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_8
    const-string v0, "android.support.v4.media.argument.PLAYBACK_INFO"

    iget-object v3, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v3, v3, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v3}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaybackInfo()Landroid/support/v4/media/MediaController2$PlaybackInfo;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v4/media/MediaController2$PlaybackInfo;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getPlaylistMetadata()Landroid/support/v4/media/MediaMetadata2;

    move-result-object v0

    if-eqz v0, :cond_9

    const-string v3, "android.support.v4.media.argument.PLAYLIST_METADATA"

    invoke-virtual {v0}, Landroid/support/v4/media/MediaMetadata2;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_9
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    iget-object v0, v0, Landroid/support/v4/media/MediaSessionLegacyStub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {v0}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_a

    return-void

    :cond_a
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$cb:Landroid/os/ResultReceiver;

    invoke-virtual {v0, v1, v2}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto :goto_3

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_b
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v0}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$400(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_3
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->this$0:Landroid/support/v4/media/MediaSessionLegacyStub;

    invoke-static {v0}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$500(Landroid/support/v4/media/MediaSessionLegacyStub;)Ljava/util/Set;

    move-result-object v0

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v2}, Landroid/support/v4/media/MediaSession2$ControllerInfo;->getId()Landroid/os/IBinder;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    invoke-static {}, Landroid/support/v4/media/MediaSessionLegacyStub;->access$300()Z

    move-result v0

    if-eqz v0, :cond_c

    const-string v0, "MediaSessionLegacyStub"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Rejecting connection, controllerInfo="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$controllerInfo:Landroid/support/v4/media/MediaSession2$ControllerInfo;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_c
    iget-object v0, p0, Landroid/support/v4/media/MediaSessionLegacyStub$7;->val$cb:Landroid/os/ResultReceiver;

    const/4 v1, -0x1

    invoke-virtual {v0, v1, v3}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    :goto_3
    return-void

    :catchall_1
    move-exception v0

    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v0

    :catchall_2
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1
.end method
