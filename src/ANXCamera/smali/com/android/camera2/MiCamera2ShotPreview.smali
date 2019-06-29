.class public Lcom/android/camera2/MiCamera2ShotPreview;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotPreview.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "[B>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera2/MiCamera2ShotPreview;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2ShotPreview;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera2/MiCamera2;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    return-void
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [B

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotPreview;->notifyResultData([B)V

    return-void
.end method

.method protected notifyResultData([B)V
    .locals 0

    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 0

    return-void
.end method

.method protected prepare()V
    .locals 0

    return-void
.end method

.method protected startSessionCapture()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotPreview;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onCaptureShutter(Z)V

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotPreview;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0, v1, p0}, Lcom/android/camera2/MiCamera2;->onCapturePictureFinished(ZLcom/android/camera2/MiCamera2Shot;)V

    return-void
.end method
