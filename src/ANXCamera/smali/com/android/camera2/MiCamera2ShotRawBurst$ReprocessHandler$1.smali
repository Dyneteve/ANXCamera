.class Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotRawBurst.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->generateReprocessCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/Surface;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super/range {p0 .. p5}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureBufferLost(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/view/Surface;J)V

    const-string p1, "SuperNightRawBurst"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "onCaptureBufferLost:<JPEG>: frameNumber = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p3}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$300(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2ShotRawBurst;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(ZLcom/android/camera2/MiCamera2Shot;)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setCaptureEnable(Z)V

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

    const-string p1, "SuperNightRawBurst"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureCompleted:<JPEG>: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p2}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$300(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2ShotRawBurst;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p1, p3, p2}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(ZLcom/android/camera2/MiCamera2Shot;)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/android/camera2/MiCamera2;->setCaptureEnable(Z)V

    return-void
.end method

.method public onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V
    .locals 1
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

    invoke-super {p0, p1, p2, p3}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureFailed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureFailure;)V

    const-string p1, "SuperNightRawBurst"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureFailed:<JPEG>: reason = "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    iget-object p3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p3}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$300(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2ShotRawBurst;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(ZLcom/android/camera2/MiCamera2Shot;)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;->this$0:Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setCaptureEnable(Z)V

    return-void
.end method

.method public onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V
    .locals 3
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string v0, "SuperNightRawBurst"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCaptureStarted:<JPEG>: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5, p6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-super/range {p0 .. p6}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureStarted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;JJ)V

    return-void
.end method
