.class Lcom/xiaomi/camera/core/DualCameraProcessor$2;
.super Ljava/lang/Object;
.source "DualCameraProcessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/DualCameraProcessor;->configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/DualCameraProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$2;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 6

    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    const-string v2, "[     RAW]"

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    invoke-static {}, Lcom/xiaomi/camera/core/DualCameraProcessor;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onImageAvailable: rawImage received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$2;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/xiaomi/camera/core/DualCameraProcessor;->queueImageToPool(Lcom/xiaomi/camera/imagecodec/ImagePool;Landroid/media/Image;)Landroid/media/Image;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    new-instance p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;

    iget-object v1, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$2;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    invoke-direct {p1, v1, v0, v3, v3}, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;-><init>(Lcom/xiaomi/camera/core/ImageProcessor;Landroid/media/Image;IZ)V

    iget-object v0, p0, Lcom/xiaomi/camera/core/DualCameraProcessor$2;->this$0:Lcom/xiaomi/camera/core/DualCameraProcessor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/DualCameraProcessor;->dispatchFilterTask(Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;)V

    return-void
.end method
