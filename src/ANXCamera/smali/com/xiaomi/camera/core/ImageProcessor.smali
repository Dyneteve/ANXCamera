.class public abstract Lcom/xiaomi/camera/core/ImageProcessor;
.super Ljava/lang/Object;
.source "ImageProcessor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;,
        Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;
    }
.end annotation


# static fields
.field private static final DEFAULT_IMAGE_BUFFER_QUEUE_SIZE:I = 0x4

.field private static final MSG_IMAGE_DOFILTER:I = 0x2

.field private static final MSG_IMAGE_RECEIVED:I = 0x1

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mBlockVariable:Landroid/os/ConditionVariable;

.field mDepthImageReaderHolder:Landroid/media/ImageReader;

.field mEffectImageReaderHolder:Landroid/media/ImageReader;

.field protected mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

.field private mImageBufferQueueSize:I

.field mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

.field private mImageReaderHandler:Landroid/os/Handler;

.field private mImageReaderThread:Landroid/os/HandlerThread;

.field mIsBokehMode:Z

.field private mIsNeedStopWork:Z

.field mNeedProcessDepthImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field mNeedProcessRawImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

.field mRawImageReaderHolder:Landroid/media/ImageReader;

.field mTaskSession:Lcom/xiaomi/engine/TaskSession;

.field private mWorkHandler:Landroid/os/Handler;

.field private mWorkThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/ImageProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;ZLcom/xiaomi/engine/BufferFormat;)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessRawImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessDepthImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v0, 0x4

    iput v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageBufferQueueSize:I

    new-instance v2, Landroid/os/ConditionVariable;

    invoke-direct {v2}, Landroid/os/ConditionVariable;-><init>()V

    iput-object v2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mBlockVariable:Landroid/os/ConditionVariable;

    iput-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    iput-boolean p2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mIsBokehMode:Z

    sget-object p1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string p2, "_%s_%dx%d_%d"

    new-array v0, v0, [Ljava/lang/Object;

    iget-boolean v2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mIsBokehMode:Z

    if-eqz v2, :cond_0

    const-string v2, "D"

    goto :goto_0

    :cond_0
    const-string v2, "S"

    :goto_0
    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p3}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    invoke-virtual {p3}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p1, p2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Landroid/os/HandlerThread;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "WorkerThread"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    new-instance p2, Landroid/os/HandlerThread;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ReaderThread"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderThread:Landroid/os/HandlerThread;

    new-instance p1, Lcom/xiaomi/camera/core/FilterProcessor;

    iget-object p2, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mBlockVariable:Landroid/os/ConditionVariable;

    invoke-direct {p1, p2}, Lcom/xiaomi/camera/core/FilterProcessor;-><init>(Landroid/os/ConditionVariable;)V

    iput-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    new-instance p2, Landroid/util/Size;

    invoke-virtual {p3}, Lcom/xiaomi/engine/BufferFormat;->getBufferWidth()I

    move-result v0

    invoke-virtual {p3}, Lcom/xiaomi/engine/BufferFormat;->getBufferHeight()I

    move-result p3

    invoke-direct {p2, v0, p3}, Landroid/util/Size;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/FilterProcessor;->init(Landroid/util/Size;)V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private isAlive()Z
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public abstract configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
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
.end method

.method protected dispatchFilterTask(Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;)V
    .locals 2
    .param p1    # Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    nop

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Thread already die!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public dispatchTask(Ljava/util/List;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    nop

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Thread already die!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected doFilter(Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;)V
    .locals 8
    .param p1    # Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;->image:Landroid/media/Image;

    invoke-virtual {v0}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    iget v3, p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;->target:I

    iget-object v4, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    invoke-interface {v4, v1, v2}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->getParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;

    move-result-object v4

    if-eqz v4, :cond_1

    if-eqz v3, :cond_0

    const/4 v5, 0x1

    if-ne v5, v3, :cond_1

    :cond_0
    sget-object v5, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "doFilter: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v5, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mBlockVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->close()V

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    invoke-virtual {v1, v4, v0, v3}, Lcom/xiaomi/camera/core/FilterProcessor;->doFilterSync(Lcom/xiaomi/camera/core/ParallelTaskData;Landroid/media/Image;I)Landroid/media/Image;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mBlockVariable:Landroid/os/ConditionVariable;

    invoke-virtual {v1}, Landroid/os/ConditionVariable;->block()V

    goto :goto_0

    :cond_1
    if-nez v4, :cond_2

    sget-object v4, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "doFilter: no task data found for image "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v4, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    iget-boolean p1, p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;->isPoolImage:Z

    invoke-interface {v1, v0, v3, p1}, Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;->onImageProcessed(Landroid/media/Image;IZ)V

    goto :goto_1

    :cond_3
    iget-boolean p1, p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;->isPoolImage:Z

    if-eqz p1, :cond_4

    sget-object p1, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "doFilter: release pool image "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->releaseImage(Landroid/media/Image;)V

    :cond_4
    :goto_1
    packed-switch v3, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessDepthImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    goto :goto_2

    :pswitch_1
    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessRawImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    goto :goto_3

    :pswitch_2
    iget-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndDecrement()I

    goto :goto_3

    :goto_2
    sget-object p1, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid target: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->tryToStopWork()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getImageBufferQueueSize()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageBufferQueueSize:I

    return v0
.end method

.method protected getImageReaderHandler()Landroid/os/Handler;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public getProcessingRequestNumber()I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mNeedProcessNormalImageSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method abstract isIdle()Z
.end method

.method abstract processImage(Ljava/util/List;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;)V"
        }
    .end annotation
.end method

.method protected queueImageToPool(Lcom/xiaomi/camera/imagecodec/ImagePool;Landroid/media/Image;)Landroid/media/Image;
    .locals 4

    nop

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->toImageQueueKey(Landroid/media/Image;)Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->isImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)Z

    move-result v2

    if-eqz v2, :cond_0

    sget-object v2, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    const-string v3, "queueImageToPool: wait E"

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->waitIfImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;II)V

    sget-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    const-string v1, "queueImageToPool: wait X"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-virtual {p2}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    return-object p2
.end method

.method public releaseResource()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageProcessorStatusCallback:Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mEffectImageReaderHolder:Landroid/media/ImageReader;

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mRawImageReaderHolder:Landroid/media/ImageReader;

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    invoke-virtual {v1}, Landroid/media/ImageReader;->close()V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mDepthImageReaderHolder:Landroid/media/ImageReader;

    :cond_2
    return-void
.end method

.method public setImageBufferQueueSize(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageBufferQueueSize:I

    return-void
.end method

.method public setTaskSession(Lcom/xiaomi/engine/TaskSession;)V
    .locals 0
    .param p1    # Lcom/xiaomi/engine/TaskSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    return-void
.end method

.method public startWork()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/xiaomi/camera/core/ImageProcessor$1;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/camera/core/ImageProcessor$1;-><init>(Lcom/xiaomi/camera/core/ImageProcessor;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderHandler:Landroid/os/Handler;

    sget-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "startWork: %s started"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stopWork()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    sget-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "stopWork: %s stopped"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v4}, Landroid/os/HandlerThread;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mWorkHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mImageReaderHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mFilterProcessor:Lcom/xiaomi/camera/core/FilterProcessor;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mTaskSession:Lcom/xiaomi/engine/TaskSession;

    invoke-virtual {v0}, Lcom/xiaomi/engine/TaskSession;->close()V

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->releaseResource()V

    return-void
.end method

.method public declared-synchronized stopWorkWhenIdle()V
    .locals 2

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/xiaomi/camera/core/ImageProcessor;->TAG:Ljava/lang/String;

    const-string v1, "stopWorkWhenIdle"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mIsNeedStopWork:Z

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->tryToStopWork()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized tryToStopWork()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/core/ImageProcessor;->mIsNeedStopWork:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->isIdle()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/xiaomi/camera/core/ImageProcessor;->stopWork()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
