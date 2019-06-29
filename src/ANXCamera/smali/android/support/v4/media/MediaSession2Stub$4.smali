.class Landroid/support/v4/media/MediaSession2Stub$4;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2Stub$SessionRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2Stub;->setVolumeTo(Landroid/support/v4/media/IMediaController2;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2Stub;

.field final synthetic val$flags:I

.field final synthetic val$value:I


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2Stub;II)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$4;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iput p2, p0, Landroid/support/v4/media/MediaSession2Stub$4;->val$value:I

    iput p3, p0, Landroid/support/v4/media/MediaSession2Stub$4;->val$flags:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerInfo;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    iget-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$4;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2Stub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getVolumeProvider()Landroid/support/v4/media/VolumeProviderCompat;

    move-result-object p1

    if-nez p1, :cond_1

    iget-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$4;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2Stub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getSessionCompat()Landroid/support/v4/media/session/MediaSessionCompat;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/support/v4/media/session/MediaSessionCompat;->getController()Landroid/support/v4/media/session/MediaControllerCompat;

    move-result-object p1

    iget v0, p0, Landroid/support/v4/media/MediaSession2Stub$4;->val$value:I

    iget v1, p0, Landroid/support/v4/media/MediaSession2Stub$4;->val$flags:I

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/media/session/MediaControllerCompat;->setVolumeTo(II)V

    :cond_0
    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/support/v4/media/MediaSession2Stub$4;->val$value:I

    invoke-virtual {p1, v0}, Landroid/support/v4/media/VolumeProviderCompat;->onSetVolumeTo(I)V

    :goto_0
    return-void
.end method
