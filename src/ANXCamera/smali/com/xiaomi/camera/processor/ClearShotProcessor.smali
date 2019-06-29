.class public Lcom/xiaomi/camera/processor/ClearShotProcessor;
.super Ljava/lang/Object;
.source "ClearShotProcessor.java"

# interfaces
.implements Lcom/xiaomi/camera/processor/AlgoProcessor;


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/processor/ClearShotProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/processor/ClearShotProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private onImageAvailable(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Lcom/xiaomi/camera/processor/ProcessResultListener;)V
    .locals 0

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/CaptureData;->setMultiFrameProcessResult(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    const/4 p2, 0x1

    invoke-interface {p3, p1, p2}, Lcom/xiaomi/camera/processor/ProcessResultListener;->onProcessFinished(Lcom/xiaomi/camera/core/CaptureData;Z)V

    return-void
.end method


# virtual methods
.method public doProcess(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/processor/ProcessResultListener;)V
    .locals 14
    .param p1    # Lcom/xiaomi/camera/core/CaptureData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget-object v0, Lcom/xiaomi/camera/processor/ClearShotProcessor;->TAG:Ljava/lang/String;

    const-string v1, "doProcess: start process capture data"

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_9

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_9

    new-instance v1, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getStreamNum()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;-><init>(I)V

    sget-object v2, Lcom/xiaomi/camera/processor/ClearShotProcessor;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doProcess: dataNum = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v2, "[CLEARSHOT]"

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    new-instance v13, Lcom/xiaomi/engine/FrameData;

    const/4 v7, 0x0

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v8

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v9

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v11

    invoke-virtual {v5}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v12

    move-object v6, v13

    invoke-direct/range {v6 .. v12}, Lcom/xiaomi/engine/FrameData;-><init>(IIJLandroid/os/Parcelable;Landroid/media/Image;)V

    invoke-interface {v2, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v4

    new-instance v5, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    invoke-virtual {v4}, Landroid/media/Image;->getWidth()I

    move-result v6

    invoke-virtual {v4}, Landroid/media/Image;->getHeight()I

    move-result v7

    invoke-virtual {v4}, Landroid/media/Image;->getFormat()I

    move-result v4

    invoke-direct {v5, v6, v7, v4}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;-><init>(III)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v4

    invoke-virtual {v4, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getAnEmptyImage(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/Image;

    move-result-object v4

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getStreamNum()I

    move-result v5

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-ne v5, v6, :cond_1

    move v5, v7

    goto :goto_1

    :cond_1
    nop

    move v5, v3

    :goto_1
    invoke-static {}, Lcom/xiaomi/engine/MiaNodeJNI;->getInstance()Lcom/xiaomi/engine/MiaNodeJNI;

    move-result-object v8

    invoke-virtual {v8, v2, v4, v6, v5}, Lcom/xiaomi/engine/MiaNodeJNI;->process(Ljava/util/List;Landroid/media/Image;IZ)I

    move-result v5

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gt v5, v2, :cond_2

    if-gez v5, :cond_3

    :cond_2
    sget-object v2, Lcom/xiaomi/camera/processor/ClearShotProcessor;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "doProcess: returned a error baseIndex: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    nop

    move v5, v3

    :cond_3
    const-string v2, "[CLEARSHOT]"

    invoke-static {v2, v7}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    sget-object v2, Lcom/xiaomi/camera/processor/ClearShotProcessor;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "doProcess: clearShot done. baseIndex: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v5

    invoke-virtual {v5}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v8

    invoke-virtual {v4, v8, v9}, Landroid/media/Image;->setTimestamp(J)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v6

    invoke-virtual {v6, v4}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v4

    invoke-virtual {v4, v8, v9}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v4

    invoke-virtual {v1, v4, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setImage(Landroid/media/Image;I)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataListener()Lcom/xiaomi/camera/core/CaptureDataListener;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    if-eq v6, v2, :cond_4

    invoke-virtual {v6}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v10

    invoke-virtual {v10}, Landroid/media/Image;->close()V

    invoke-interface {v3, v10}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    invoke-virtual {v6}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getSubImage()Landroid/media/Image;

    move-result-object v6

    if-eqz v6, :cond_4

    invoke-virtual {v6}, Landroid/media/Image;->close()V

    invoke-interface {v3, v6}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    :cond_4
    goto :goto_2

    :cond_5
    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v0

    invoke-virtual {v2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getSubImage()Landroid/media/Image;

    move-result-object v2

    invoke-virtual {v0}, Landroid/media/Image;->close()V

    invoke-interface {v3, v0}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    invoke-virtual {v1, v5, v7}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    if-eqz v2, :cond_7

    invoke-virtual {v2}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v4

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v0

    invoke-virtual {v1, v0, v7}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setImage(Landroid/media/Image;I)V

    invoke-interface {v3, v2}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    cmp-long v2, v4, v8

    if-eqz v2, :cond_6

    invoke-virtual {v0, v8, v9}, Landroid/media/Image;->setTimestamp(J)V

    :cond_6
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    :cond_7
    invoke-virtual {v1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->isDataReady()Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, p0

    move-object v2, p1

    move-object/from16 v3, p2

    invoke-direct {v0, v2, v1, v3}, Lcom/xiaomi/camera/processor/ClearShotProcessor;->onImageAvailable(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Lcom/xiaomi/camera/processor/ProcessResultListener;)V

    :cond_8
    return-void

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "taskBeanList is not allow to be empty!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
