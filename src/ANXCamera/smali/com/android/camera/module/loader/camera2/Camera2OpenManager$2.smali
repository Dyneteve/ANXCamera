.class Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "Camera2OpenManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/module/loader/camera2/Camera2OpenManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;


# direct methods
.method constructor <init>(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CameraOpenCallback: closed "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gF()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$700(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/android/camera/lib/compatibility/util/CompatibilityUtils;->takebackMotor()Z

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CameraOpenCallback: onDisconnected "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object p1

    const/4 v1, 0x5

    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$100(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Lcom/android/camera2/Camera2Proxy;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$700(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p1

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object p1

    iput v0, p1, Landroid/os/Message;->what:I

    const/4 v0, 0x1

    iput v0, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {v0}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    :cond_0
    return-void
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError: cameraId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " error="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CameraOpenCallback: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p2}, Lcom/android/camera/constant/ExceptionConstant;->transFromCamera2Error(I)I

    move-result p2

    invoke-static {v0, p2, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$600(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V

    return-void
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 11
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getCapabilities(I)Lcom/android/camera2/CameraCapabilities;

    move-result-object v4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CameraOpenCallback: camera "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " was opened successfully"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    if-eqz v4, :cond_1

    iget-object v9, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    new-instance v10, Lcom/android/camera2/MiCamera2;

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraHandler()Landroid/os/Handler;

    move-result-object v5

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraPreviewHandler()Landroid/os/Handler;

    move-result-object v6

    iget-object v1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->getCameraMainThreadHandler()Landroid/os/Handler;

    move-result-object v7

    move-object v1, v10

    move-object v2, p1

    move v3, v0

    invoke-direct/range {v1 .. v7}, Lcom/android/camera2/MiCamera2;-><init>(Landroid/hardware/camera2/CameraDevice;ILcom/android/camera2/CameraCapabilities;Landroid/os/Handler;Landroid/os/Handler;Landroid/os/Handler;)V

    invoke-static {v9, v10}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$102(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;Lcom/android/camera2/Camera2Proxy;)Lcom/android/camera2/Camera2Proxy;

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->setCurrentOpenedCameraId(I)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/mi/config/a;->gF()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$200(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v2

    sub-long/2addr v0, v2

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ", current delay = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ", should delay = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$400()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$400()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gtz p1, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string v2, "onOpened: sleep start..."

    invoke-static {p1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$400()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onOpened: sleep end..."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object p1, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    invoke-static {p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$500(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;)Landroid/os/Handler;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", but corresponding CameraCapabilities is null"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$300()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera/module/loader/camera2/Camera2OpenManager$2;->this$0:Lcom/android/camera/module/loader/camera2/Camera2OpenManager;

    const/16 v1, 0xe7

    invoke-static {v0, v1, p1}, Lcom/android/camera/module/loader/camera2/Camera2OpenManager;->access$600(Lcom/android/camera/module/loader/camera2/Camera2OpenManager;ILjava/lang/String;)V

    :goto_1
    return-void
.end method
