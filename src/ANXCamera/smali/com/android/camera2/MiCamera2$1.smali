.class Lcom/android/camera2/MiCamera2$1;
.super Landroid/os/Handler;
.source "MiCamera2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2;->initHelperHandler(Landroid/os/Looper;)Landroid/os/Handler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 7

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    const/4 v1, 0x1

    const/4 v2, 0x3

    const-wide/16 v3, 0x1388

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$300(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/MiCamera2Preview;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2Preview;->needForManually()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$400(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/CameraConfigs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    const-wide/32 v5, 0xf4240

    div-long/2addr v0, v5

    cmp-long v0, v0, v3

    if-ltz v0, :cond_0

    invoke-virtual {p0, v2}, Lcom/android/camera2/MiCamera2$1;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$400(Lcom/android/camera2/MiCamera2;)Lcom/android/camera2/CameraConfigs;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera2/CameraConfigs;->getExposureTime()J

    move-result-wide v0

    div-long/2addr v0, v5

    add-long/2addr v3, v0

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/camera2/MiCamera2$1;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$500(Lcom/android/camera2/MiCamera2;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0, v2, v3, v4}, Lcom/android/camera2/MiCamera2$1;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    const/16 v0, 0xed

    invoke-virtual {p1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {v0}, Lcom/android/camera2/MiCamera2;->access$200(Lcom/android/camera2/MiCamera2;)Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/android/camera2/MiCamera2;->updateDeferPreviewSession(Landroid/view/Surface;)Z

    move-result p1

    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleMessage: MSG_WAITING_LOCAL_PARALLER_SERVICE_READY updateDeferPreviewSession result = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_2
    invoke-static {}, Lcom/android/camera2/MiCamera2;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "waiting af lock timeOut"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera2/MiCamera2$1;->this$0:Lcom/android/camera2/MiCamera2;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2;->access$100(Lcom/android/camera2/MiCamera2;)V

    nop

    :cond_2
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
