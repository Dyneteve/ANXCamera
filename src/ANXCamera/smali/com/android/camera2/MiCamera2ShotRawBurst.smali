.class public Lcom/android/camera2/MiCamera2ShotRawBurst;
.super Lcom/android/camera2/MiCamera2Shot;
.source "MiCamera2ShotRawBurst.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera2/MiCamera2Shot<",
        "Lcom/xiaomi/camera/core/ParallelTaskData;",
        ">;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SuperNightRawBurst"

.field private static final sEvList:[I


# instance fields
.field private mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

.field private mReprocessHandler:Landroid/os/Handler;

.field private mReprocessThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/camera2/MiCamera2ShotRawBurst;->sEvList:[I

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        -0xc
        -0x18
    .end array-data
.end method

.method public constructor <init>(Lcom/android/camera2/MiCamera2;)V
    .locals 6

    invoke-direct {p0, p1}, Lcom/android/camera2/MiCamera2Shot;-><init>(Lcom/android/camera2/MiCamera2;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessThread:Landroid/os/HandlerThread;

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "SNReprocessThread"

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessThread:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    sget-object v0, Lcom/android/camera2/MiCamera2ShotRawBurst;->sEvList:[I

    array-length v2, v0

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    iget-object v5, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCameraHandler:Landroid/os/Handler;

    move-object v0, p1

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;-><init>(Landroid/os/Looper;ILcom/android/camera2/MiCamera2;Lcom/android/camera2/MiCamera2ShotRawBurst;Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera2/MiCamera2ShotRawBurst;)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 0

    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera2/MiCamera2ShotRawBurst;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    return-object p0
.end method


# virtual methods
.method protected generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    new-instance v0, Lcom/android/camera2/MiCamera2ShotRawBurst$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$1;-><init>(Lcom/android/camera2/MiCamera2ShotRawBurst;)V

    return-object v0
.end method

.method protected generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/hardware/camera2/CameraAccessException;,
            Ljava/lang/IllegalStateException;
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createCaptureRequest(I)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getRawImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    sget-object v1, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getPreviewRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v2

    sget-object v3, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_MODE:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-virtual {v2, v3}, Landroid/hardware/camera2/CaptureRequest$Builder;->get(Landroid/hardware/camera2/CaptureRequest$Key;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v0, v1, v2}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v2, 0x3

    invoke-virtual {v1, v0, v2}, Lcom/android/camera2/MiCamera2;->applySettingsForCapture(Landroid/hardware/camera2/CaptureRequest$Builder;I)V

    return-object v0
.end method

.method protected makeClobber()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera2/MiCamera2Shot;->makeClobber()V

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method protected notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V
    .locals 4

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {p1}, Lcom/android/camera2/MiCamera2;->getParallelCallback()Lcom/xiaomi/camera/core/ParallelCallback;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget v3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mPreviewThumbnailHash:I

    invoke-virtual {v2, v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setPreviewThumbnailHash(I)V

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-interface {p1, v2}, Lcom/xiaomi/camera/core/ParallelCallback;->onParallelProcessFinish(Lcom/xiaomi/camera/core/ParallelTaskData;)Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    const-string p1, "SuperNightRawBurst"

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

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotRawBurst;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    return-void
.end method

.method protected onImageReceived(Landroid/media/Image;I)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getPictureCallback()Lcom/android/camera2/Camera2Proxy$PictureCallback;

    move-result-object v0

    if-eqz v0, :cond_6

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-eqz v1, :cond_6

    iget-boolean v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mDeparted:Z

    if-eqz v1, :cond_0

    goto/16 :goto_2

    :cond_0
    if-eqz p2, :cond_2

    const/4 v0, 0x3

    if-ne p2, v0, :cond_1

    const-string p2, "SuperNightRawBurst"

    const-string v0, "onImageReceived:<RAW>"

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    const/16 v0, 0x10

    invoke-virtual {p2, v0, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown image result type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const-string v1, "SuperNightRawBurst"

    const-string v2, "onImageReceived:<JPEG>"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v1, 0x0

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->getTimestamp()J

    move-result-wide v3

    cmp-long v1, v1, v3

    if-nez v1, :cond_3

    const-string v1, "SuperNightRawBurst"

    const-string v2, "onImageReceived<JPEG>: image arrived first"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/xiaomi/camera/core/ParallelTaskData;->setTimestamp(J)V

    :cond_3
    invoke-static {p1}, Lcom/android/camera/Util;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object v1

    const-string v2, "SuperNightRawBurst"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onImageReceived:<JPEG>: size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez v1, :cond_4

    const/4 v4, 0x0

    goto :goto_0

    :cond_4
    array-length v4, v1

    :goto_0
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ", timeStamp = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1, v1, p2}, Lcom/xiaomi/camera/core/ParallelTaskData;->fillJpegData([BI)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/ParallelTaskData;->isJpegDataReady()Z

    move-result p1

    if-eqz p1, :cond_5

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/android/camera2/Camera2Proxy$PictureCallback;->onPictureTakenFinished(Z)V

    iget-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {p0, p1}, Lcom/android/camera2/MiCamera2ShotRawBurst;->notifyResultData(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    :cond_5
    :goto_1
    return-void

    :cond_6
    :goto_2
    const-string p2, "SuperNightRawBurst"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "something wrong happened when image received: callback = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " mCurrentParallelTaskData = "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    return-void
.end method

.method protected prepare()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mReprocessHandler:Landroid/os/Handler;

    const/16 v1, 0x12

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    invoke-static {}, Lcom/android/camera/module/ModuleManager;->isSuperNightScene()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->setAWBLock(Z)V

    :cond_0
    return-void
.end method

.method protected startSessionCapture()V
    .locals 9

    const-wide/16 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0, v1}, Lcom/android/camera2/MiCamera2ShotRawBurst;->generateParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    if-nez v0, :cond_0

    const-string v0, "SuperNightRawBurst"

    const-string v1, "startSessionCapture: null task data"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCurrentParallelTaskData:Lcom/xiaomi/camera/core/ParallelTaskData;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCameraConfigs()Lcom/android/camera2/CameraConfigs;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera2/CameraConfigs;->isShot2Gallery()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ParallelTaskData;->setShot2Gallery(Z)Z

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst;->generateCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst;->generateRequestBuilder()Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    sget-object v3, Lcom/android/camera2/MiCamera2ShotRawBurst;->sEvList:[I

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v5

    :goto_0
    if-ge v6, v4, :cond_1

    aget v7, v3, v6

    sget-object v8, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AE_EXPOSURE_COMPENSATION:Landroid/hardware/camera2/CaptureRequest$Key;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v8, v7}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v7

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    invoke-static {v5}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackPictureCapture(I)V

    const-string v1, "SuperNightRawBurst"

    const-string v3, "start capture burst"

    invoke-static {v1, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v1

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mCameraHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2, v0, v3}, Landroid/hardware/camera2/CameraCaptureSession;->captureBurst(Ljava/util/List;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I
    :try_end_0
    .catch Landroid/hardware/camera2/CameraAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "SuperNightRawBurst"

    const-string v2, "Failed to capture a still picture, IllegalState"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->printStackTrace()V

    const-string v1, "SuperNightRawBurst"

    const-string v2, "Cannot capture a still picture"

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst;->mMiCamera:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Landroid/hardware/camera2/CameraAccessException;->getReason()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/android/camera2/MiCamera2;->notifyOnError(I)V

    :goto_1
    nop

    :goto_2
    return-void
.end method
