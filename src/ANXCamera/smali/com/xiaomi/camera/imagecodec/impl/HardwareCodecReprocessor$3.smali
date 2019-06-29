.class Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;
.super Ljava/lang/Object;
.source "HardwareCodecReprocessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->initJpegImageReader(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 8

    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$800(Landroid/media/Image;)[B

    move-result-object v0

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onImageAvailable: received reprocessed image: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    if-nez v0, :cond_0

    move v4, v3

    goto :goto_0

    :cond_0
    array-length v4, v0

    :goto_0
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$500(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v2}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v2

    invoke-virtual {v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;->onJpegAvailable([BLjava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "jpeg return for %s. cost=%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v4}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v6}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$900(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$602(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$3;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {p1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$700(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
