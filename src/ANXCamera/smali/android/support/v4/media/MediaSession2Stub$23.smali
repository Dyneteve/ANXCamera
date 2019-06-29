.class Landroid/support/v4/media/MediaSession2Stub$23;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2Stub$SessionRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2Stub;->updatePlaylistMetadata(Landroid/support/v4/media/IMediaController2;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2Stub;

.field final synthetic val$metadata:Landroid/os/Bundle;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2Stub;Landroid/os/Bundle;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$23;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iput-object p2, p0, Landroid/support/v4/media/MediaSession2Stub$23;->val$metadata:Landroid/os/Bundle;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$23;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2Stub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2Stub$23;->val$metadata:Landroid/os/Bundle;

    invoke-static {v0}, Landroid/support/v4/media/MediaMetadata2;->fromBundle(Landroid/os/Bundle;)Landroid/support/v4/media/MediaMetadata2;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/support/v4/media/MediaSession2;->updatePlaylistMetadata(Landroid/support/v4/media/MediaMetadata2;)V

    return-void
.end method
