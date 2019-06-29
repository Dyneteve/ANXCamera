.class Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;
.super Landroid/os/Handler;
.source "MiCamera2ShotRawBurst.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera2/MiCamera2ShotRawBurst;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReprocessHandler"
.end annotation


# static fields
.field public static final MSG_DATA:I = 0x10

.field public static final MSG_EXIT:I = 0x13

.field public static final MSG_INIT:I = 0x12

.field public static final MSG_META:I = 0x11


# instance fields
.field private final mCamera2ShotRawBurst:Lcom/android/camera2/MiCamera2ShotRawBurst;

.field private final mCameraDevice:Lcom/android/camera2/MiCamera2;

.field private final mMaxInputImageCount:I

.field private final mReprocessCallbackHandler:Landroid/os/Handler;

.field private final mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

.field private final mUnprocessedData:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/media/Image;",
            ">;"
        }
    .end annotation
.end field

.field private final mUnprocessedMeta:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/hardware/camera2/TotalCaptureResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;ILcom/android/camera2/MiCamera2;Lcom/android/camera2/MiCamera2ShotRawBurst;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    iput p2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mMaxInputImageCount:I

    iput-object p3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    iput-object p4, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCamera2ShotRawBurst:Lcom/android/camera2/MiCamera2ShotRawBurst;

    iput-object p5, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mReprocessCallbackHandler:Landroid/os/Handler;

    new-instance p1, Lcom/arcsoft/supernight/SuperNightProcess;

    invoke-direct {p1}, Lcom/arcsoft/supernight/SuperNightProcess;-><init>()V

    iput-object p1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2;
    .locals 0

    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)Lcom/android/camera2/MiCamera2ShotRawBurst;
    .locals 0

    iget-object p0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCamera2ShotRawBurst:Lcom/android/camera2/MiCamera2ShotRawBurst;

    return-object p0
.end method

.method private generateReprocessCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
    .locals 1

    new-instance v0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;

    invoke-direct {v0, p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler$1;-><init>(Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;)V

    return-object v0
.end method

.method private releaseCachedDataAndMeta()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/Image;

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private sendReprocessRequest()V
    .locals 6

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mMaxInputImageCount:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mMaxInputImageCount:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

    if-eqz v0, :cond_0

    const-string v0, "SuperNightRawBurst"

    const-string v1, "sendReprocessRequest:<SNP>: E"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

    const/16 v1, 0x701

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/Image;

    invoke-virtual {v2}, Landroid/media/Image;->getWidth()I

    move-result v2

    iget-object v4, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/media/Image;

    invoke-virtual {v4}, Landroid/media/Image;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/media/Image;

    invoke-virtual {v5}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v5

    aget-object v5, v5, v3

    invoke-virtual {v5}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v5

    invoke-virtual {v0, v1, v2, v4, v5}, Lcom/arcsoft/supernight/SuperNightProcess;->init(IIII)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    const/16 v4, 0xd14

    invoke-virtual {v0, v1, v2, v4}, Lcom/arcsoft/supernight/SuperNightProcess;->addAllInputInfo(Ljava/util/ArrayList;Ljava/util/ArrayList;I)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mSuperNightProcess:Lcom/arcsoft/supernight/SuperNightProcess;

    invoke-virtual {v0}, Lcom/arcsoft/supernight/SuperNightProcess;->unInit()I

    const-string v0, "SuperNightRawBurst"

    const-string v1, "sendReprocessRequest:<SNP>: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/Image;

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/hardware/camera2/TotalCaptureResult;

    :try_start_0
    const-string v2, "SuperNightRawBurst"

    const-string v3, "sendReprocessRequest:<CAM>: E"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v2}, Lcom/android/camera2/MiCamera2;->getRawImageWriter()Landroid/media/ImageWriter;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V

    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v0}, Lcom/android/camera2/MiCamera2;->getCameraDevice()Landroid/hardware/camera2/CameraDevice;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CameraDevice;->createReprocessCaptureRequest(Landroid/hardware/camera2/TotalCaptureResult;)Landroid/hardware/camera2/CaptureRequest$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getPhotoImageReader()Landroid/media/ImageReader;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/hardware/camera2/CaptureRequest$Builder;->addTarget(Landroid/view/Surface;)V

    iget-object v1, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mCameraDevice:Lcom/android/camera2/MiCamera2;

    invoke-virtual {v1}, Lcom/android/camera2/MiCamera2;->getCaptureSession()Landroid/hardware/camera2/CameraCaptureSession;

    move-result-object v1

    invoke-virtual {v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->build()Landroid/hardware/camera2/CaptureRequest;

    move-result-object v0

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->generateReprocessCaptureCallback()Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mReprocessCallbackHandler:Landroid/os/Handler;

    invoke-virtual {v1, v0, v2, v3}, Landroid/hardware/camera2/CameraCaptureSession;->capture(Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;Landroid/os/Handler;)I

    const-string v0, "SuperNightRawBurst"

    const-string v1, "sendReprocessRequest:<CAM>: X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "SuperNightRawBurst"

    const-string v2, "sendReprocessRequest:<CAM>"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->releaseCachedDataAndMeta()V

    goto :goto_2

    :goto_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->releaseCachedDataAndMeta()V

    throw v0

    :cond_0
    :goto_2
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->releaseCachedDataAndMeta()V

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Looper;->quitSafely()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->releaseCachedDataAndMeta()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedMeta:Ljava/util/ArrayList;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/hardware/camera2/TotalCaptureResult;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->sendReprocessRequest()V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->mUnprocessedData:Ljava/util/ArrayList;

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/media/Image;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/android/camera2/MiCamera2ShotRawBurst$ReprocessHandler;->sendReprocessRequest()V

    nop

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
