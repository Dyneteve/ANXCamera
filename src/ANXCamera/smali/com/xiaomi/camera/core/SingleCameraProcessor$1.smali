.class Lcom/xiaomi/camera/core/SingleCameraProcessor$1;
.super Ljava/lang/Object;
.source "SingleCameraProcessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/SingleCameraProcessor;->configOutputConfigurations(Lcom/xiaomi/engine/BufferFormat;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/SingleCameraProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/SingleCameraProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;->this$0:Lcom/xiaomi/camera/core/SingleCameraProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 6

    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    const-string v0, "[  EFFECT]"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/xiaomi/camera/base/PerformanceTracker;->trackAlgorithmProcess(Ljava/lang/String;I)V

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-static {}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onImageAvailable: effectImage received: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;->this$0:Lcom/xiaomi/camera/core/SingleCameraProcessor;

    invoke-static {}, Lcom/xiaomi/camera/imagecodec/ImagePool;->getInstance()Lcom/xiaomi/camera/imagecodec/ImagePool;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->queueImageToPool(Lcom/xiaomi/camera/imagecodec/ImagePool;Landroid/media/Image;)Landroid/media/Image;

    move-result-object v0

    invoke-virtual {p1}, Landroid/media/Image;->close()V

    new-instance p1, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;

    iget-object v2, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;->this$0:Lcom/xiaomi/camera/core/SingleCameraProcessor;

    const/4 v3, 0x0

    invoke-direct {p1, v2, v0, v3, v1}, Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;-><init>(Lcom/xiaomi/camera/core/ImageProcessor;Landroid/media/Image;IZ)V

    iget-object v0, p0, Lcom/xiaomi/camera/core/SingleCameraProcessor$1;->this$0:Lcom/xiaomi/camera/core/SingleCameraProcessor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/SingleCameraProcessor;->dispatchFilterTask(Lcom/xiaomi/camera/core/ImageProcessor$FilterTaskData;)V

    return-void
.end method
