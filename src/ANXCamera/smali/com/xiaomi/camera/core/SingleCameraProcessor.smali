.class public Lcom/xiaomi/camera/core/SingleCameraProcessor;
.super Lcom/xiaomi/camera/core/ImageProcessor;
.source "SingleCameraProcessor.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/camera/core/ImageProcessor;-><init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;Z)V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;)V
    .locals 9

    sget-object v0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processCaptureResult: processFrame image -- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/engine/FrameData;

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v4

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v5

    invoke-virtual {p1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v7

    const/4 v3, 0x0

    move-object v2, v0

    move-object v8, p2

    invoke-direct/range {v2 .. v8}, Lcom/xiaomi/engine/FrameData;-><init>(IIJLandroid/os/Parcelable;Landroid/media/Image;)V

    new-instance p1, Lcom/xiaomi/camera/core/SingleCameraProcessor$5;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$5;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {v0, p1}, Lcom/xiaomi/engine/FrameData;->setFrameCallback(Lcom/xiaomi/engine/FrameData$FrameStatusCallback;)V

    iget-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    new-instance p2, Lcom/xiaomi/camera/core/SingleCameraProcessor$6;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$6;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p1, v0, p2}, Lcom/xiaomi/engine/TaskSession;->processFrame(Lcom/xiaomi/engine/FrameData;Lcom/xiaomi/engine/TaskSession$FrameCallback;)V

    return-void
.end method


# virtual methods
.method public configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/engine/BufferFormat;",
            ")",
            "Ljava/util/List<",
            "Landroid/hardware/camera2/params/OutputConfiguration;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result v3

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getImageBufferQueueSize()I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    new-instance v2, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;

    invoke-direct {v2, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-boolean v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsBokehMode:Z

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result v3

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getImageBufferQueueSize()I

    move-result v4

    invoke-static {v1, v2, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    new-instance v2, Lcom/xiaomi/camera/core/SingleCameraProcessor$2;

    invoke-direct {v2, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$2;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    new-instance v1, Landroid/hardware/camera2/params/OutputConfiguration;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v3}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    const/4 v2, 0x2

    div-int/2addr v1, v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result p1

    div-int/2addr p1, v2

    const v3, 0x20363159

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getImageBufferQueueSize()I

    move-result v4

    invoke-static {v1, p1, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    iget-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    new-instance v1, Lcom/xiaomi/camera/core/SingleCameraProcessor$3;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$3;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {p1, v1, v3}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    new-instance p1, Landroid/hardware/camera2/params/OutputConfiguration;

    iget-object v1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v1

    invoke-direct {p1, v2, v1}, Landroid/hardware/camera2/params/OutputConfiguration;-><init>(ILandroid/view/Surface;)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public configOutputSurfaces(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/engine/BufferFormat;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferFormat()I

    move-result p1

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getImageBufferQueueSize()I

    move-result v3

    invoke-static {v1, v2, p1, v3}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    iget-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    new-instance v1, Lcom/xiaomi/camera/core/SingleCameraProcessor$4;

    invoke-direct {v1, p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor$4;-><init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->getHandler()Landroid/os/Handler;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    iget-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {p1}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method isIdle()Z
    .locals 3

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsBokehMode:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessRawImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessDepthImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    nop

    :goto_0
    return v1

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_2

    move v1, v2

    nop

    :cond_2
    return v1
.end method

.method processImage(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mIsBokehMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessRawImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor;->mNeedProcessDepthImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object p1

    const-string v1, "[ORIGINAL]"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->processCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Landroid/media/Image;)V

    return-void
.end method
