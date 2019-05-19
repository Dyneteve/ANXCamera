.class public Lcom/xiaomi/camera/core/ParallelDataZipper;
.super Ljava/lang/Object;
.source "ParallelDataZipper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;,
        Lcom/xiaomi/camera/core/ParallelDataZipper$InstanceHolder;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mCaptureDataArray:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lcom/xiaomi/camera/core/CaptureData;",
            ">;"
        }
    .end annotation
.end field

.field private mCaptureDataBeanArray:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;",
            ">;"
        }
    .end annotation
.end field

.field private mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

.field private mHandler:Landroid/os/Handler;

.field private final mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

.field private mWorkThread:Landroid/os/HandlerThread;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataBeanArray:Landroid/util/LongSparseArray;

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-direct {v0, v1}, Landroid/util/SparseLongArray;-><init>(I)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ParallelDataZipperThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method synthetic constructor <init>(Lcom/xiaomi/camera/core/ParallelDataZipper$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/camera/core/ParallelDataZipper;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/SparseLongArray;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataBeanArray:Landroid/util/LongSparseArray;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/camera/core/ParallelDataZipper;J)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getStreamNumberByTimestamp(J)I

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/xiaomi/camera/core/ParallelDataZipper;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getStreamNumberBySequenceId(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$500()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$600(Lcom/xiaomi/camera/core/ParallelDataZipper;)Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    return-object p0
.end method

.method static synthetic access$700(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->tryToCallback(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    return-void
.end method

.method public static getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;
    .locals 1

    sget-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper$InstanceHolder;->INSTANCE:Lcom/xiaomi/camera/core/ParallelDataZipper;

    return-object v0
.end method

.method private getStreamNumberBySequenceId(I)I
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v2, v0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getStreamNumberByTimestamp(J)I

    move-result p1

    return p1
.end method

.method private getStreamNumberByTimestamp(J)I
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/camera/core/CaptureData;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getStreamNum()I

    move-result p1

    return p1
.end method

.method private tryToCallback(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 7

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v1

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/camera/core/CaptureData;

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v3

    iget-object v5, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    invoke-virtual {v5, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/xiaomi/camera/core/CaptureData;

    if-nez v5, :cond_1

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no task found with sequenceId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " timestamp: "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "|"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    invoke-static {v1, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    invoke-interface {v0, p1}, Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;->onParallelDataUnmatched(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->close()V

    :goto_0
    return-void

    :cond_1
    nop

    move-wide v1, v3

    move-object v3, v5

    :cond_2
    invoke-virtual {v3, p1}, Lcom/xiaomi/camera/core/CaptureData;->putCaptureDataBean(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/CaptureData;->isDataReady()Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    invoke-interface {p1, v3}, Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;->onParallelDataAvailable(Lcom/xiaomi/camera/core/CaptureData;)V

    goto :goto_2

    :cond_3
    sget-object p1, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tryToCallback: no callback. sequenceId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " timestamp: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    if-eqz v3, :cond_4

    invoke-virtual {v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->close()V

    :cond_4
    goto :goto_1

    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v1, v2}, Landroid/util/LongSparseArray;->remove(J)V

    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mSequenceIdToTimestampMap:Landroid/util/SparseLongArray;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/util/SparseLongArray;->delete(I)V

    :cond_6
    return-void
.end method


# virtual methods
.method public declared-synchronized join(Landroid/media/Image;I)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/camera/core/ParallelDataZipper$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper$2;-><init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Landroid/media/Image;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Thread already die!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized join(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 2
    .param p1    # Lcom/xiaomi/protocol/ICustomCaptureResult;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mWorkThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/xiaomi/camera/core/ParallelDataZipper$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/xiaomi/camera/core/ParallelDataZipper$1;-><init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Thread already die!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setDataListener(Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mDataListener:Lcom/xiaomi/camera/core/ParallelDataZipper$DataListener;

    return-void
.end method

.method public declared-synchronized startTask(IIIJ)V
    .locals 8

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/xiaomi/camera/core/ParallelDataZipper;->TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v2, "startTask: algo=%d streamNum=%d burstNum=%d timestamp=%d"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x3

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/camera/core/CaptureData;

    move-object v2, v0

    move v3, p1

    move v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-direct/range {v2 .. v7}, Lcom/xiaomi/camera/core/CaptureData;-><init>(IIIJ)V

    iget-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper;->mCaptureDataArray:Landroid/util/LongSparseArray;

    invoke-virtual {p1, p4, p5, v0}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
