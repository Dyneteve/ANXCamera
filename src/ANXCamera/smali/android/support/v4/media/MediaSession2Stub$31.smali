.class Landroid/support/v4/media/MediaSession2Stub$31;
.super Ljava/lang/Object;
.source "MediaSession2Stub.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2Stub$SessionRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2Stub;->setShuffleMode(Landroid/support/v4/media/IMediaController2;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v4/media/MediaSession2Stub;

.field final synthetic val$shuffleMode:I


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2Stub;I)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$31;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iput p2, p0, Landroid/support/v4/media/MediaSession2Stub$31;->val$shuffleMode:I

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

    iget-object p1, p0, Landroid/support/v4/media/MediaSession2Stub$31;->this$0:Landroid/support/v4/media/MediaSession2Stub;

    iget-object p1, p1, Landroid/support/v4/media/MediaSession2Stub;->mSession:Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;

    invoke-interface {p1}, Landroid/support/v4/media/MediaSession2$SupportLibraryImpl;->getInstance()Landroid/support/v4/media/MediaSession2;

    move-result-object p1

    iget v0, p0, Landroid/support/v4/media/MediaSession2Stub$31;->val$shuffleMode:I

    invoke-virtual {p1, v0}, Landroid/support/v4/media/MediaSession2;->setShuffleMode(I)V

    return-void
.end method
