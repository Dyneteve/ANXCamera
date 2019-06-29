.class Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;
.super Landroid/os/ResultReceiver;
.source "MediaController2ImplLegacy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;->onSessionReady()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;


# direct methods
.method constructor <init>(Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;

    invoke-direct {p0, p2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method protected onReceiveResult(ILandroid/os/Bundle;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;

    iget-object v0, v0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-static {v0}, Landroid/support/v4/media/MediaController2ImplLegacy;->access$300(Landroid/support/v4/media/MediaController2ImplLegacy;)Landroid/os/HandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;

    iget-object p1, p1, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/MediaController2ImplLegacy;->onConnectedNotLocked(Landroid/os/Bundle;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;

    iget-object p1, p1, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-static {p1}, Landroid/support/v4/media/MediaController2ImplLegacy;->access$400(Landroid/support/v4/media/MediaController2ImplLegacy;)Ljava/util/concurrent/Executor;

    move-result-object p1

    new-instance p2, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1$1;

    invoke-direct {p2, p0}, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1$1;-><init>(Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;)V

    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    iget-object p1, p0, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback$1;->this$1:Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;

    iget-object p1, p1, Landroid/support/v4/media/MediaController2ImplLegacy$ControllerCompatCallback;->this$0:Landroid/support/v4/media/MediaController2ImplLegacy;

    invoke-virtual {p1}, Landroid/support/v4/media/MediaController2ImplLegacy;->close()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
