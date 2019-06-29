.class Lcom/android/camera2/MiCamera2ShotBurst$1;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "MiCamera2ShotBurst.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera2/MiCamera2ShotBurst;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera2/MiCamera2ShotBurst;


# direct methods
.method constructor <init>(Lcom/android/camera2/MiCamera2ShotBurst;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0
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

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p3}, Landroid/hardware/camera2/TotalCaptureResult;->getFrameNumber()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lcom/android/camera2/MiCamera2;->updateFrameNumber(J)V

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

    invoke-static {}, Lcom/android/camera2/MiCamera2ShotBurst;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onCaptureFailed: "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Landroid/hardware/camera2/CaptureFailure;->getReason()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    invoke-static {}, Lcom/android/camera2/MiCamera2ShotBurst;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCaptureSequenceAborted: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotBurst;->access$100(Lcom/android/camera2/MiCamera2ShotBurst;)I

    move-result p1

    const/4 v0, 0x0

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1, v0}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    :cond_0
    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1, v0}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    :cond_1
    return-void
.end method

.method public onCaptureSequenceCompleted(Landroid/hardware/camera2/CameraCaptureSession;IJ)V
    .locals 2
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/android/camera2/MiCamera2ShotBurst;->access$000()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onCaptureSequenceCompleted: sequenceId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " mLatestSequenceId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-static {v1}, Lcom/android/camera2/MiCamera2ShotBurst;->access$100(Lcom/android/camera2/MiCamera2ShotBurst;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " frameNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, p3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    invoke-static {p1}, Lcom/android/camera2/MiCamera2ShotBurst;->access$100(Lcom/android/camera2/MiCamera2ShotBurst;)I

    move-result p1

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->resumePreview()V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotBurst$1;->this$0:Lcom/android/camera2/MiCamera2ShotBurst;

    iget-object p1, p1, Lcom/android/camera2/MiCamera2ShotBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    :cond_0
    return-void
.end method
