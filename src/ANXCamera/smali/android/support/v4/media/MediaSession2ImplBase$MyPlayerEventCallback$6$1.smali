.class Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;
.super Ljava/lang/Object;
.source "MediaSession2ImplBase.java"

# interfaces
.implements Landroid/support/v4/media/MediaSession2ImplBase$NotifyRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;->this$1:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/support/v4/media/MediaSession2$ControllerCb;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;->this$1:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;

    iget-object v0, v0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$session:Landroid/support/v4/media/MediaSession2ImplBase;

    invoke-virtual {v0}, Landroid/support/v4/media/MediaSession2ImplBase;->getCurrentPosition()J

    move-result-wide v3

    iget-object v0, p0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6$1;->this$1:Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;

    iget-wide v5, v0, Landroid/support/v4/media/MediaSession2ImplBase$MyPlayerEventCallback$6;->val$position:J

    move-object v0, p1

    invoke-virtual/range {v0 .. v6}, Landroid/support/v4/media/MediaSession2$ControllerCb;->onSeekCompleted(JJJ)V

    return-void
.end method
