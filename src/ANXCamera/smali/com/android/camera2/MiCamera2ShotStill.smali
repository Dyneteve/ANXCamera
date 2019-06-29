.class public Lcom/android/camera2/MiCamera2ShotStill;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotStill.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "Lcom/xiaomi/camera/core/ParallelTaskData;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mHasDepth:Z

.field private mIsIntent:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera2/MiCamera2ShotStill;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotStill;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    new-instance v0, Lcom/android/camera2/MiCamera2ShotStill$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotStill$1;-><init>(Lcom/android/camera2/MiCamera2ShotStill;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    sget-object v2, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "size="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getWidth()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v4, "x"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getHeight()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotStill;->isInQcfaMode()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getInstance()Lcom/android/camera/module/loader/camera2/Camera2DataContainer;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/module/loader/camera2/Camera2DataContainer;->getBokehFrontCameraId()I

    move-result v1

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getId()I

    move-result v2

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    :cond_1
    iget-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mHasDepth:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getDepthImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPortraitRawImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    :cond_2
    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->useLegacyFlashStrategy()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->pausePreview()V

    :cond_3
    return-object v0
.end method

.method protected getTimeStamp()J
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method protected notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 4

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget v3, p0, Lcom/android/camera2/MiCamera2ShotStill;->mPreviewThumbnailHash:I

    invoke-virtual {v2, v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setPreviewThumbnailHash(I)V

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-interface {p1, v2}, Lcom/xiaomi/camera/core/ParallelCallback;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    sget-object p1, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mJpegCallbackFinishTime = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected bridge synthetic notifyResultData(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotStill;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v1, :cond_0

    goto/16 :goto_2

    :cond_0
    const-wide/16 v1, 0x0

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    sget-object v1, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    const-string v2, "onImageReceived: image arrived first"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setTimestamp(J)V

    :cond_1
    sget-object v1, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onImageReceived mCurrentParallelTaskData timestamp:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " image timestamp:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object v1

    sget-object v2, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onImageReceived: dataLen="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v1, :cond_2

    const-string v4, "null"

    goto :goto_0

    :cond_2
    array-length v4, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, " timeStamp="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " holder="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1, v1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isJpegDataReady()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mIsIntent:Z

    const/4 p2, 0x1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotStill;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    invoke-interface {v0, p2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    goto :goto_1

    :cond_3
    invoke-interface {v0, p2}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotStill;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    :cond_4
    :goto_1
    return-void

    :cond_5
    :goto_2
    sget-object p2, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onImageReceived: something wrong happened when image received: callback = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " mCurrentParallelTaskData = "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    return-void
.end method

.method protected prepare()V
    .locals 3

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera2/CameraConfigs;->getShotType()I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mIsIntent:Z

    goto :goto_0

    :pswitch_1
    iput-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mHasDepth:Z

    iput-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mIsIntent:Z

    goto :goto_0

    :cond_1
    iput-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mHasDepth:Z

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected startSessionCapture()V
    .locals 4

    const-wide/16 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/MiCamera2ShotStill;->generateParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v0, :cond_0

    sget-object v0, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    const-string v1, "startSessionCapture: null task data"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isShot2Gallery()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->setShot2Gallery(Z)Z

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotStill;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotStill;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v2

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotStill;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    const-string v2, "Failed to capture a still picture, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    sget-object v1, Lcom/android/camera2/MiCamera2ShotStill;->TAG:Ljava/lang/String;

    const-string v2, "Cannot capture a still picture"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotStill;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    :goto_0
    nop

    :goto_1
    return-void
.end method
