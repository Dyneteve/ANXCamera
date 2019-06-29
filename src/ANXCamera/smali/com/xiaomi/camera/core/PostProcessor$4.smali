.class Lcom/xiaomi/camera/core/PostProcessor$4;
.super Ljava/lang/Object;
.source "PostProcessor.java"

# interfaces
.implements Lcom/xiaomi/camera/core/ImageProcessor$ImageProcessorStatusCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/PostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/PostProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/PostProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getParallelTaskData(J)Lcom/xiaomi/camera/core/ParallelTaskData;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/camera/core/ParallelTaskData;

    return-object p1
.end method

.method public onImageProcessFailed(Landroid/media/Image;Ljava/lang/String;)V
    .locals 3

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onImageProcessFailed: image="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p1, :cond_0

    const-string p1, "null"

    :cond_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " reason="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onImageProcessStart(J)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$800(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onImageProcessStart: get parallelTaskData: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/camera/core/ParallelTaskData;

    iget-object p2, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {p2}, Lcom/xiaomi/camera/core/PostProcessor;->access$800(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/xiaomi/camera/core/PostProcessor$PostProcessStatusCallback;->onImagePostProcessStart(Lcom/xiaomi/camera/core/ParallelTaskData;)V

    :cond_0
    return-void
.end method

.method public onImageProcessed(Landroid/media/Image;IZ)V
    .locals 12

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[2] onImageProcessed: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, " | "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v3, 0x0

    const/4 v4, 0x2

    if-ne p2, v4, :cond_0

    invoke-static {p2, v3}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackJpegReprocess(II)V

    invoke-static {p1}, Lcom/xiaomi/camera/base/ImageUtil;->getFirstPlane(Landroid/media/Image;)[B

    move-result-object p1

    iget-object p2, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {p2}, Lcom/xiaomi/camera/core/PostProcessor;->access$700(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object p2

    invoke-interface {p2, p1, v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;->onJpegAvailable([BLjava/lang/String;)V

    goto/16 :goto_0

    :cond_0
    iget-object v4, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v4}, Lcom/xiaomi/camera/core/PostProcessor;->access$100(Lcom/xiaomi/camera/core/PostProcessor;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/xiaomi/camera/core/ParallelTaskData;

    if-eqz v4, :cond_1

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->getCaptureResult()Lcom/xiaomi/protocol/ICustomCaptureResult;

    move-result-object v7

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[2] onImageProcessed: captureResult = "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getResults()Landroid/os/Parcelable;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/ParallelTaskData;->getDataParameter()Lcom/xiaomi/camera/core/ParallelTaskDataParameter;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/camera/imagecodec/ReprocessData;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->isFrontCamera()Z

    move-result v8

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/Size;->getWidth()I

    move-result v9

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getOutputSize()Landroid/util/Size;

    move-result-object v4

    invoke-virtual {v4}, Landroid/util/Size;->getHeight()I

    move-result v10

    iget-object v4, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v4}, Lcom/xiaomi/camera/core/PostProcessor;->access$700(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object v11

    move-object v4, v1

    move-object v5, p1

    move-object v6, v2

    invoke-direct/range {v4 .. v11}, Lcom/xiaomi/camera/imagecodec/ReprocessData;-><init>(Landroid/media/Image;Ljava/lang/String;Lcom/xiaomi/protocol/ICustomCaptureResult;ZIILcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;)V

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ParallelTaskDataParameter;->getJpegQuality()I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->setJpegQuality(I)V

    invoke-virtual {v1, p3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->setImageFromPool(Z)V

    invoke-static {p2, v3}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackJpegReprocess(II)V

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ReprocessorFactory;->getReprocessor()Lcom/xiaomi/camera/imagecodec/Reprocessor;

    move-result-object p1

    invoke-interface {p1, v1}, Lcom/xiaomi/camera/imagecodec/Reprocessor;->submit(Lcom/xiaomi/camera/imagecodec/ReprocessData;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    iget-object p1, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {p1}, Lcom/xiaomi/camera/core/PostProcessor;->access$700(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object p1

    const-string p2, "nativeDetachImage failed for image!!!"

    invoke-interface {p1, p2, v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;->onError(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "no parallelTaskData with timestamp "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onOriginalImageClosed(Landroid/media/Image;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$4;->this$0:Lcom/xiaomi/camera/core/PostProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/PostProcessor;->access$500(Lcom/xiaomi/camera/core/PostProcessor;)Lcom/xiaomi/camera/core/CaptureDataListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/xiaomi/camera/core/CaptureDataListener;->onOriginalImageClosed(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onOriginalImageClosed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
