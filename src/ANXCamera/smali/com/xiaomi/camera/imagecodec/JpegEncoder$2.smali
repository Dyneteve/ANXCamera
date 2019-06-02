.class Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;
.super Landroid/hardware/camera2/CameraDevice$StateCallback;
.source "JpegEncoder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/JpegEncoder;->openVTCamera(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraDevice$StateCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Landroid/hardware/camera2/CameraDevice;)V
    .locals 4
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClosed>>id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1002(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v1

    if-ne p1, v1, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClosed: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v3}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    :cond_0
    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1100(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1102(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    :cond_1
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "onClosed<<"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onDisconnected(Landroid/hardware/camera2/CameraDevice;)V
    .locals 4
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDisconnected>>id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1002(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v1

    if-ne p1, v1, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDisconnected: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    :cond_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "onDisconnected<<"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onError(Landroid/hardware/camera2/CameraDevice;I)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object p2

    monitor-enter p2

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onError>>id="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->close()V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1002(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    :cond_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "onError<<"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit p2

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onOpened(Landroid/hardware/camera2/CameraDevice;)V
    .locals 4
    .param p1    # Landroid/hardware/camera2/CameraDevice;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$600(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onOpened>>id="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/hardware/camera2/CameraDevice;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v1, p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$702(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraDevice;)Landroid/hardware/camera2/CameraDevice;

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onOpened: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$700(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)Landroid/hardware/camera2/CameraDevice;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, -0x1

    invoke-static {p1, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$802(Lcom/xiaomi/camera/imagecodec/JpegEncoder;I)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$902(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Landroid/hardware/camera2/CameraCaptureSession;)Landroid/hardware/camera2/CameraCaptureSession;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$1002(Lcom/xiaomi/camera/imagecodec/JpegEncoder;Z)Z

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/JpegEncoder$2;->this$0:Lcom/xiaomi/camera/imagecodec/JpegEncoder;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$500(Lcom/xiaomi/camera/imagecodec/JpegEncoder;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/JpegEncoder;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "onOpened<<"

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
