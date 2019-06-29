.class Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;
.super Landroid/os/Handler;
.source "VirtualCameraReprocessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReprocessHandler"
.end annotation


# static fields
.field private static final MSG_CLOSE_VT_CAMERA:I = 0x2

.field private static final MSG_REPROCESS_IMG:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    :pswitch_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "recv MSG_CLOSE_VT_CAMERA"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$700(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "close current VtCamera: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$700(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$700(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraDevice;->close()V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$702(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$1800(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :pswitch_1
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "recv MSG_REPROCESS_IMG"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$1600(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$ReprocessHandler;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$1700(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)V

    :cond_1
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
