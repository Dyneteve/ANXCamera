.class public Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;
.super Ljava/lang/Object;
.source "HardwareCodecReprocessor.java"

# interfaces
.implements Lcom/xiaomi/camera/imagecodec/Reprocessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$ReprocessHandler;
    }
.end annotation


# static fields
.field private static final MAX_IMAGE_BUFFER_SIZE:I = 0x2

.field private static final TAG:Ljava/lang/String;

.field public static final sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton<",
            "Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mCodecLock:Ljava/lang/Object;

.field private mCodecOperationHandler:Landroid/os/Handler;

.field private mCodecOperationThread:Landroid/os/HandlerThread;

.field private mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

.field private final mDataLock:Ljava/lang/Object;

.field private mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

.field private mInitialized:Z

.field private mJpegImageReader:Landroid/media/ImageReader;

.field private mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

.field private mReprocessImageWriter:Landroid/media/ImageWriter;

.field private mReprocessStartTime:J

.field private mRequestDispatchHandler:Landroid/os/Handler;

.field private mRequestDispatchThread:Landroid/os/HandlerThread;

.field private mTaskDataList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/xiaomi/camera/imagecodec/ReprocessData;",
            ">;"
        }
    .end annotation
.end field

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;

    invoke-direct {v0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;-><init>()V

    sput-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->sInstance:Lcom/xiaomi/camera/imagecodec/Reprocessor$Singleton;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mTaskDataList:Ljava/util/LinkedList;

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;-><init>()V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Z
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->checkConditionIsReady()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->reprocessImage()V

    return-void
.end method

.method static synthetic access$1200(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->releaseWakeLock()V

    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/media/imagecodec/ImageCodec;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    return-object p0
.end method

.method static synthetic access$302(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Lcom/xiaomi/media/imagecodec/ImageCodec;)Lcom/xiaomi/media/imagecodec/ImageCodec;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    return-object p1
.end method

.method static synthetic access$400(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Landroid/media/ImageWriter;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mReprocessImageWriter:Landroid/media/ImageWriter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p0
.end method

.method static synthetic access$602(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    return-object p1
.end method

.method static synthetic access$700(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->sendReprocessRequest()V

    return-void
.end method

.method static synthetic access$800(Landroid/media/Image;)[B
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->getJpegData(Landroid/media/Image;)[B

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mReprocessStartTime:J

    return-wide v0
.end method

.method private acquireWakeLock()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "acquireWakeLock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    :cond_0
    return-void
.end method

.method private checkConditionIsReady()Z
    .locals 4
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v3, "checkConditionIsReady: processor is busy!"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return v2

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "checkConditionIsReady: ignore null request!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    invoke-direct {p0, v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->createImageCodecIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private createImageCodecIfNeed(Lcom/xiaomi/camera/imagecodec/ReprocessData;)Z
    .locals 5
    .param p1    # Lcom/xiaomi/camera/imagecodec/ReprocessData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v0

    new-instance v1, Landroid/hardware/camera2/params/InputConfiguration;

    invoke-virtual {v0}, Landroid/media/Image;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/media/Image;->getHeight()I

    move-result v3

    invoke-virtual {v0}, Landroid/media/Image;->getFormat()I

    move-result v0

    invoke-direct {v1, v2, v3, v0}, Landroid/hardware/camera2/params/InputConfiguration;-><init>(III)V

    new-instance v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputWidth()I

    move-result v2

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputHeight()I

    move-result v3

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputFormat()I

    move-result p1

    invoke-direct {v0, v2, v3, p1}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;-><init>(III)V

    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " YUV  INPUT: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " YUV OUTPUT: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecLock:Ljava/lang/Object;

    monitor-enter p1

    const/16 v2, 0x100

    :try_start_0
    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getFormat()I

    move-result v3

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-eqz v2, :cond_1

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;->getHeight()I

    move-result v0

    invoke-direct {p0, v2, v0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->initJpegImageReader(II)V

    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getWidth()I

    move-result v0

    invoke-virtual {v1}, Landroid/hardware/camera2/params/InputConfiguration;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->initImageCodec(IILandroid/view/Surface;)V

    :cond_1
    monitor-exit p1

    return v4

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static getJpegData(Landroid/media/Image;)[B
    .locals 1

    invoke-virtual {p0}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p0

    array-length v0, p0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    aget-object p0, p0, v0

    invoke-virtual {p0}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private initImageCodec(IILandroid/view/Surface;)V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "initImageCodec: E"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {v0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {v0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    :cond_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "closing obsolete image codec"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {v0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    if-nez v0, :cond_2

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "initImageCodec: create new one"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x23

    const/4 v1, 0x2

    invoke-static {p1, p2, v0, v1}, Lcom/xiaomi/media/imagecodec/ImageCodec;->create(IIII)Lcom/xiaomi/media/imagecodec/ImageCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {p1, p3}, Lcom/xiaomi/media/imagecodec/ImageCodec;->setOutputSurface(Landroid/view/Surface;)V

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {p1}, Lcom/xiaomi/media/imagecodec/ImageCodec;->getInputSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-static {p1, v1}, Landroid/media/ImageWriter;->newInstance(Landroid/view/Surface;I)Landroid/media/ImageWriter;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mReprocessImageWriter:Landroid/media/ImageWriter;

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string p2, "initImageCodec: reuse old one"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string p2, "initImageCodec: X"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private initJpegImageReader(II)V
    .locals 2
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "initJpegImageReader: E"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    :cond_0
    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "closing obsolete reprocess reader"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    if-nez v0, :cond_2

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "initJpegImageReader: create new one"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v0, 0x100

    const/4 v1, 0x2

    invoke-static {p1, p2, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    new-instance p2, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;

    invoke-direct {p2, p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;-><init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2, v0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    goto :goto_0

    :cond_2
    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string p2, "initJpegImageReader: reuse old one"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string p2, "initJpegImageReader: X"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private releaseWakeLock()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "releaseWakeLock"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    :cond_0
    return-void
.end method

.method private reprocessImage()V
    .locals 6
    .annotation build Landroid/support/annotation/WorkerThread;
    .end annotation

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage: E"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getTotalCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v2, "reprocessImage<<null metadata!"

    invoke-static {v1, v2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_0
    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reprocessImage: tag="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getJpegQuality()I

    move-result v1

    int-to-byte v1, v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getOutputFormat()I

    move-result v2

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v3

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mReprocessStartTime:J

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationHandler:Landroid/os/Handler;

    new-instance v4, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;

    invoke-direct {v4, p0, v3, v2, v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;-><init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Landroid/media/Image;IB)V

    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "reprocessImage: X"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private sendReprocessRequest()V
    .locals 5

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "============================================================="

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    if-nez v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: NOT initialized!"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_1

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v3, "sendReprocessRequest: idle. Try to close device 30s later."

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    const-wide/16 v3, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    monitor-exit v0

    return-void

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    :cond_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "sendReprocessRequest: BUSY"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v2, "sendReprocessRequest: send MSG_REPROCESS_IMAGE"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_0
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method


# virtual methods
.method public deInit()V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "deInit: E"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    if-nez v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCurrentProcessingData:Lcom/xiaomi/camera/imagecodec/ReprocessData;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_1
    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegImageReader:Landroid/media/ImageReader;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mReprocessImageWriter:Landroid/media/ImageWriter;

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    invoke-virtual {v0}, Lcom/xiaomi/media/imagecodec/ImageCodec;->release()V

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mHardwareImageEncoder:Lcom/xiaomi/media/imagecodec/ImageCodec;

    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    :try_start_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationHandler:Landroid/os/Handler;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quitSafely()Z

    :try_start_3
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->join()V

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    iput-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_3
    :goto_1
    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "deInit: X"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v0

    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v1
.end method

.method public init(Landroid/content/Context;)V
    .locals 3

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "init: E"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    if-nez v1, :cond_0

    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/PowerManager;

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "ImageCodecThread"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mCodecOperationHandler:Landroid/os/Handler;

    new-instance p1, Landroid/os/HandlerThread;

    const-string v1, "RequestDispatcher"

    invoke-direct {p1, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    invoke-virtual {p1}, Landroid/os/HandlerThread;->start()V

    new-instance p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$ReprocessHandler;

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, p0, v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$ReprocessHandler;-><init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mRequestDispatchHandler:Landroid/os/Handler;

    iput-boolean v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v0, "init: X"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public setJpegOutputSize(II)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    if-nez v0, :cond_0

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setJpegOutputSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    const/16 v1, 0x100

    invoke-direct {v0, p1, p2, v1}, Lcom/xiaomi/camera/imagecodec/OutputConfiguration;-><init>(III)V

    iput-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mJpegOutputConfiguration:Lcom/xiaomi/camera/imagecodec/OutputConfiguration;

    :cond_0
    return-void
.end method

.method public setVirtualCameraIds(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v1, "setVTCameraIds: backId=%s frontId=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object p2, v2, p1

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public submit(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    .locals 6

    sget-object v0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "submit: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object p1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v0, "submit: drop this request due to no callback was provided!"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mInitialized:Z

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->acquireWakeLock()V

    nop

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->isImageFromPool()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getYuvImage()Landroid/media/Image;

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->toImageQueueKey(Landroid/media/Image;)Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    move-result-object v1

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v1, v3}, Lcom/xiaomi/camera/imagecodec/ImagePool;->isImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;I)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v2, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v4, "submit: wait image pool>>"

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v2

    const/4 v4, 0x0

    invoke-virtual {v2, v1, v3, v4}, Lcom/xiaomi/camera/imagecodec/ImagePool;->waitIfImageQueueFull(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;II)V

    sget-object v1, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    const-string v2, "submit: wait image pool<<"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    invoke-virtual {v0}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v0

    sget-object v3, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "submit: image: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " | "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v0}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->setYuvImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    :cond_2
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mDataLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->mTaskDataList:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->sendReprocessRequest()V

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "NOT initialized. Call init() first!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
