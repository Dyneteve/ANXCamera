.class Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;
.super Ljava/lang/Object;
.source "HardwareCodecReprocessor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->reprocessImage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

.field final synthetic val$imageFormat:I

.field final synthetic val$jpegQuality:B

.field final synthetic val$yuvImage:Landroid/media/Image;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Landroid/media/Image;IB)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    iput-object p2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    iput p3, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$imageFormat:I

    iput-byte p4, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$jpegQuality:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reprocessImage: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    invoke-virtual {v2}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$imageFormat:I

    const/16 v1, 0x100

    if-ne v1, v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$200(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$300(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/media/imagecodec/ImageCodec;

    move-result-object v1

    iget-byte v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$jpegQuality:B

    invoke-virtual {v1, v2}, Lcom/xiaomi/media/imagecodec/ImageCodec;->setQuality(I)V

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$400(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Landroid/media/ImageWriter;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    invoke-virtual {v1, v2}, Landroid/media/ImageWriter;->queueInputImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    invoke-virtual {v1, v2}, Lcom/xiaomi/camera/imagecodec/ImagePool;->releaseImage(Landroid/media/Image;)V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$500(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_1
    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v1}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getResultListener()Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->val$yuvImage:Landroid/media/Image;

    iget-object v3, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v3}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$600(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    move-result-object v3

    invoke-virtual {v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData;->getImageTag()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;->onYuvAvailable(Landroid/media/Image;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$602(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;Lcom/xiaomi/camera/imagecodec/ReprocessData;)Lcom/xiaomi/camera/imagecodec/ReprocessData;

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_0
    iget-object v0, p0, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor$2;->this$0:Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;

    invoke-static {v0}, Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;->access$700(Lcom/xiaomi/camera/imagecodec/impl/HardwareCodecReprocessor;)V

    return-void

    :catchall_1
    move-exception v1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v1
.end method
