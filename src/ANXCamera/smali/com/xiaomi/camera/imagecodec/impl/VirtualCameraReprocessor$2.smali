.class Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "VirtualCameraReprocessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->reprocessImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 1

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureBufferLost: frameNo="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p4, " target="

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureCompleted: frameNo="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, " taskSize="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p3}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$200(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Ljava/util/LinkedList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/LinkedList;->size()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureFailure;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureFailed: frameNo="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getFrameNumber()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " reason="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " imageCaptured="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->wasImageCaptured()Z

    move-result v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$300(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p2}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$400(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p2}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$400(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object p2

    invoke-virtual {p2}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object p2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$400(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, p3, v0}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;->onError(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    const/4 p3, 0x0

    invoke-static {p2, p3}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$402(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    :cond_0
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;->access$500(Lcom/xiaomi/camera/imagecodec/impl/VirtualCameraReprocessor;)V

    return-void

    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method
