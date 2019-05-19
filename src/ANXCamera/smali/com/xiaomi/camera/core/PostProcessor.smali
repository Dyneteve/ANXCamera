.class public Lcom/xiaomi/camera/core/PostProcessor;
.super Ljava/lang/Object;
.source "PostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;,
        Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;,
        Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

.field private mCaptureStatusListener:Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

.field private mCurrentAlgoType:I

.field private mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

.field private mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

.field private mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

.field private mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

.field private mImageProcessorStatusCb:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

.field private mImageReaderList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/ImageReader;",
            ">;"
        }
    .end annotation
.end field

.field private mImageSaver:Lcom/android/camera/storage/ImageSaver;

.field private mJpegEncoderListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

.field private mParallelTaskHashMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/Long;",
            "Lcom/xiaomi/camera/core/ParallelTaskData;",
            ">;"
        }
    .end annotation
.end field

.field private mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

.field private mSessionStatusCb:Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;

.field private mShouldDestroyWhenTasksFinished:Z

.field private mSurfaceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation
.end field

.field private mTaskSession:Lcom/xiaomi/engine/TaskSession;

.field private mWorkerHandler:Landroid/os/Handler;

.field private mWorkerThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/PostProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    new-instance p1, Landroid/os/HandlerThread;

    const-string v0, "CallbackHandleThread"

    invoke-direct {p1, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mParallelTaskHashMap:Ljava/util/concurrent/ConcurrentHashMap;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mShouldDestroyWhenTasksFinished:Z

    iput p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCurrentAlgoType:I

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCaptureStatusListener:Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$1;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$1;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSessionStatusCb:Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$2;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$2;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$3;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$3;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$4;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$4;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessorStatusCb:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    new-instance p1, Lcom/xiaomi/camera/core/PostProcessor$5;

    invoke-direct {p1, p0}, Lcom/xiaomi/camera/core/PostProcessor$5;-><init>(Lcom/xiaomi/camera/core/PostProcessor;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mJpegEncoderListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    iget-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Landroid/os/Handler;

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/xiaomi/camera/core/PostProcessor;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PostProcessor;->init()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mParallelTaskHashMap:Ljava/util/concurrent/ConcurrentHashMap;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/android/camera/storage/ImageSaver;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/xiaomi/camera/core/PostProcessor;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/core/PostProcessor;->tryToCloseSession()V

    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageProcessor;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/core/PostProcessor;)I
    .locals 0

    iget p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCurrentAlgoType:I

    return p0
.end method

.method static synthetic access$302(Lcom/xiaomi/camera/core/PostProcessor;I)I
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCurrentAlgoType:I

    return p1
.end method

.method static synthetic access$400(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageMemoryManager;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    return-object p0
.end method

.method static synthetic access$500(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessorStatusCb:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    return-object p0
.end method

.method static synthetic access$600(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/CaptureDataListener;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCaptureDataListener:Lcom/xiaomi/camera/core/CaptureDataListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/xiaomi/camera/core/PostProcessor;Landroid/media/Image;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/PostProcessor;->releaseImage(Landroid/media/Image;)V

    return-void
.end method

.method static synthetic access$800(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mJpegEncoderListener:Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    return-object p0
.end method

.method static synthetic access$900(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/FilterProcessor;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    return-object p0
.end method

.method private releaseImage(Landroid/media/Image;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ImageMemoryManager;->releaseAnImage(Landroid/media/Image;)V

    :cond_0
    return-void
.end method

.method private tryToCloseSession()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mParallelTaskHashMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mShouldDestroyWhenTasksFinished:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    const-string v1, "tryToCloseSession: start"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PostProcessor;->finish()V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/PostProcessor;->deInit()V

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mPostProcessStatusCallback:Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    invoke-interface {v0, p0}, Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;->onPostProcessorClosed(Lcom/xiaomi/camera/core/PostProcessor;)V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    const-string v1, "tryToCloseSession: ignore"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public configCaptureSession(Lcom/xiaomi/engine/BufferFormat;)V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configCaptureSession: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getGraphDescriptor()Lcom/xiaomi/engine/GraphDescriptorBean;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/engine/GraphDescriptorBean;->getOperationModeID()I

    move-result v0

    const v1, 0x8002

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/ImageProcessor;->stopWorkWhenIdle()V

    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getGraphDescriptor()Lcom/xiaomi/engine/GraphDescriptorBean;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/engine/GraphDescriptorBean;->getStreamNumber()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    new-instance v1, Lcom/xiaomi/camera/core/DualCameraProcessor;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessorStatusCb:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-direct {v1, v2, v0}, Lcom/xiaomi/camera/core/DualCameraProcessor;-><init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;Z)V

    iput-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    goto :goto_1

    :cond_2
    new-instance v1, Lcom/xiaomi/camera/core/SingleCameraProcessor;

    iget-object v2, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessorStatusCb:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-direct {v1, v2, v0}, Lcom/xiaomi/camera/core/SingleCameraProcessor;-><init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;Z)V

    iput-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    :goto_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ImageProcessor;->startWork()V

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ImageProcessor;->configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSessionStatusCb:Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;

    invoke-static {p1, v0, v1}, Lcom/xiaomi/engine/MiCameraAlgo;->createSessionByOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;Ljava/util/List;Lcom/xiaomi/engine/TaskSession$SessionStatusCallback;)Lcom/xiaomi/engine/TaskSession;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ImageProcessor;->setTaskSession(Lcom/xiaomi/engine/TaskSession;)V

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/FilterProcessor;->deInit()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    :cond_3
    new-instance v0, Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-direct {v0}, Lcom/xiaomi/camera/core/FilterProcessor;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    new-instance v1, Landroid/util/Size;

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result p1

    invoke-direct {v1, v2, p1}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/FilterProcessor;->init(Landroid/util/Size;)V

    return-void
.end method

.method public configHALOutputSurface(Ljava/util/List;)Ljava/util/List;
    .locals 6
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/protocol/IImageReaderParameterSets;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "configHALOutputSurface: paramsNum="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_1
    const/4 v0, 0x0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;

    invoke-virtual {v1}, Lcom/xiaomi/protocol/IImageReaderParameterSets;->isShouldHoldImages()Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    add-int/2addr v0, v2

    :cond_2
    iget v2, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->width:I

    iget v3, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->height:I

    iget v4, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->format:I

    iget v5, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->maxImages:I

    invoke-static {v2, v3, v4, v5}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object v2

    new-instance v3, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;

    iget v1, v1, Lcom/xiaomi/protocol/IImageReaderParameterSets;->targetCamera:I

    invoke-direct {v3, p0, v1}, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;-><init>(Lcom/xiaomi/camera/core/PostProcessor;I)V

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerHandler:Landroid/os/Handler;

    invoke-virtual {v2, v3, v1}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    new-instance p1, Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-direct {p1, v0}, Lcom/xiaomi/camera/core/ImageMemoryManager;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    iget-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    return-object p1
.end method

.method public deInit()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/FilterProcessor;->deInit()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageReaderList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_3
    return-void
.end method

.method public destroyWhenTasksFinished()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mShouldDestroyWhenTasksFinished:Z

    invoke-direct {p0}, Lcom/xiaomi/camera/core/PostProcessor;->tryToCloseSession()V

    return-void
.end method

.method public finish()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageProcessor:Lcom/xiaomi/camera/core/ImageProcessor;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ImageProcessor;->stopWork()V

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerThread:Landroid/os/HandlerThread;

    iput-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mWorkerHandler:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    sget-object v1, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    const-string v2, "finish: failed!"

    invoke-static {v1, v2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public getCaptureStatusListener()Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mCaptureStatusListener:Lcom/xiaomi/camera/core/PostProcessor$CaptureStatusListener;

    return-object v0
.end method

.method public getSurfaceList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/Surface;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mSurfaceList:Ljava/util/List;

    return-object v0
.end method

.method public init()V
    .locals 2

    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    invoke-virtual {v0, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->setDataListener(Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;)V

    return-void
.end method

.method public isIdle()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mParallelTaskHashMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public needWaitImageClose()Z
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ImageMemoryManager;->needWaitImageClose()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/xiaomi/camera/core/PostProcessor;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "needWaitImageClose: return "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->c(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method public setImageSaver(Lcom/android/camera/storage/ImageSaver;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor;->mImageSaver:Lcom/android/camera/storage/ImageSaver;

    return-void
.end method
