.class public Lcom/xiaomi/camera/processor/GroupShotProcessor;
.super Ljava/lang/Object;
.source "GroupShotProcessor.java"

# interfaces
.implements Lcom/xiaomi/camera/processor/AlgoProcessor;


# static fields
.field private static final GROUP_SHOT_MAX_FACE_NUM:I = 0xa

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mGroupShot:Lcom/android/camera/groupshot/GroupShot;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/xiaomi/camera/processor/GroupShotProcessor;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v0}, Lcom/android/camera/groupshot/GroupShot;->isUsed()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Lcom/android/camera/groupshot/GroupShot;

    invoke-direct {v0}, Lcom/android/camera/groupshot/GroupShot;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    :cond_1
    return-void
.end method

.method private onImageAvailable(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Lcom/xiaomi/camera/processor/ProcessResultListener;)V
    .locals 3

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/media/Image;->setTimestamp(J)V

    invoke-virtual {p1, p2}, Lcom/xiaomi/camera/core/CaptureData;->setMultiFrameProcessResult(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    const/4 p2, 0x0

    invoke-interface {p3, p1, p2}, Lcom/xiaomi/camera/processor/ProcessResultListener;->onProcessFinished(Lcom/xiaomi/camera/core/CaptureData;Z)V

    return-void
.end method

.method private prepareGroupShot(III)V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/16 v2, 0xa

    move v1, p1

    move v3, p2

    move v4, p3

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/android/camera/groupshot/GroupShot;->initialize(IIIIII)I

    iget-object p1, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/android/camera/groupshot/GroupShot;->attach_start(I)I

    return-void
.end method


# virtual methods
.method public doProcess(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/processor/ProcessResultListener;)V
    .locals 13
    .param p1    # Lcom/xiaomi/camera/core/CaptureData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doProcess>>dataNum="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    nop

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v5

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-virtual {v5}, Landroid/media/Image;->getWidth()I

    move-result v7

    invoke-virtual {v5}, Landroid/media/Image;->getHeight()I

    move-result v8

    invoke-direct {p0, v6, v7, v8}, Lcom/xiaomi/camera/processor/GroupShotProcessor;->prepareGroupShot(III)V

    move v6, v3

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-ge v6, v7, :cond_0

    iget-object v7, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v8}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/camera/groupshot/GroupShot;->attach(Landroid/media/Image;)I

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_0
    iget-object v6, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v6}, Lcom/android/camera/groupshot/GroupShot;->attach_end()I

    move-result v6

    sget-object v7, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    const-string v8, "doProcess: attachEnd=0x%x"

    const/4 v9, 0x1

    new-array v10, v9, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v10, v3

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v6, v3}, Lcom/android/camera/groupshot/GroupShot;->setBaseImage(I)I

    move-result v6

    sget-object v7, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    const-string v8, "doProcess: setBaseImage=0x%x"

    new-array v10, v9, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v10, v3

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v6, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v6}, Lcom/android/camera/groupshot/GroupShot;->setBestFace()I

    move-result v6

    sget-object v7, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    const-string v8, "doProcess: setBaseFace=0x%x"

    new-array v10, v9, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v10, v3

    invoke-static {v8, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v6, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getStreamNum()I

    move-result v7

    invoke-direct {v6, v7}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v9

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v7}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v7

    invoke-virtual {v6, v7, v9}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    invoke-virtual {v7}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v8

    new-instance v10, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;

    invoke-virtual {v5}, Landroid/media/Image;->getWidth()I

    move-result v11

    invoke-virtual {v5}, Landroid/media/Image;->getHeight()I

    move-result v12

    invoke-virtual {v5}, Landroid/media/Image;->getFormat()I

    move-result v5

    invoke-direct {v10, v11, v12, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;-><init>(III)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v5

    invoke-virtual {v5, v10}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getAnEmptyImage(Lcom/xiaomi/camera/imagecodec/ImagePool$ImageFormat;)Landroid/media/Image;

    move-result-object v5

    invoke-virtual {v5, v8, v9}, Landroid/media/Image;->setTimestamp(J)V

    iget-object v10, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {v10, v5}, Lcom/android/camera/groupshot/GroupShot;->getYuvImage(Landroid/media/Image;)I

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v10

    invoke-virtual {v10, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v5

    invoke-virtual {v5, v8, v9}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v5

    invoke-virtual {v6, v5, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setImage(Landroid/media/Image;I)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataListener()Lcom/xiaomi/camera/core/CaptureDataListener;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {v8}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v9

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->isSaveInputImage()Z

    move-result v10

    if-eqz v10, :cond_1

    if-eq v8, v4, :cond_2

    :cond_1
    invoke-virtual {v9}, Landroid/media/Image;->close()V

    invoke-interface {v3, v9}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    :cond_2
    goto :goto_1

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->isSaveInputImage()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getMainImage()Landroid/media/Image;

    move-result-object v5

    invoke-interface {v3, v5}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    invoke-virtual {v5}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v8

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/xiaomi/camera/imagecodec/ImagePool;->queueImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getImage(J)Landroid/media/Image;

    move-result-object v3

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v5

    invoke-virtual {v5, v3}, Lcom/xiaomi/camera/imagecodec/ImagePool;->holdImage(Landroid/media/Image;)V

    invoke-virtual {v4, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setMainImage(Landroid/media/Image;)V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v0

    int-to-long v8, v0

    invoke-virtual {v7}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v10

    add-long/2addr v8, v10

    long-to-int v0, v8

    invoke-virtual {v7, v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setSequenceId(I)V

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getFrameNumber()J

    move-result-wide v7

    add-long/2addr v3, v7

    long-to-int v3, v3

    invoke-virtual {v0, v3}, Lcom/xiaomi/protocol/ICustomCaptureResult;->setSequenceId(I)V

    :cond_4
    invoke-direct {p0, p1, v6, p2}, Lcom/xiaomi/camera/processor/GroupShotProcessor;->onImageAvailable(Lcom/xiaomi/camera/core/CaptureData;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Lcom/xiaomi/camera/processor/ProcessResultListener;)V

    iget-object p1, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {p1}, Lcom/android/camera/groupshot/GroupShot;->clearImages()I

    iget-object p1, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    invoke-virtual {p1}, Lcom/android/camera/groupshot/GroupShot;->finish()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/xiaomi/camera/processor/GroupShotProcessor;->mGroupShot:Lcom/android/camera/groupshot/GroupShot;

    sget-object p1, Lcom/xiaomi/camera/processor/GroupShotProcessor;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "doProcess<<cost="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    invoke-virtual {p2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "taskBeanList is not allow to be empty!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
