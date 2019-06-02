.class Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;
.super Ljava/lang/Object;
.source "PostProcessor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/PostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageAvailableListener"
.end annotation


# instance fields
.field private mImageFlag:I

.field private mMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;


# direct methods
.method constructor <init>(ILcom/xiaomi/camera/core/ImageMemoryManager;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mImageFlag:I

    iput-object p2, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 4

    if-nez p1, :cond_0

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[0] onImageAvailable: null imageReader!"

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-virtual {v0}, Lcom/xiaomi/camera/core/ImageMemoryManager;->waitImageCloseIfNeeded()V

    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    move-result-object p1

    invoke-static {}, Lcom/xiaomi/camera/core/PostProcessor;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[0] onImageAvailable: timestamp = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mMemoryManager:Lcom/xiaomi/camera/core/ImageMemoryManager;

    invoke-virtual {v0, p1}, Lcom/xiaomi/camera/core/ImageMemoryManager;->holdAnImage(Landroid/media/Image;)V

    invoke-static {}, Lcom/android/camera/Util;->isDumpImageEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "dump_0_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/xiaomi/camera/base/ImageUtil;->dumpYuvImage(Landroid/media/Image;Ljava/lang/String;)Z

    :cond_1
    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->getInstance()Lcom/xiaomi/camera/core/ParallelDataZipper;

    move-result-object v0

    iget v1, p0, Lcom/xiaomi/camera/core/PostProcessor$ImageAvailableListener;->mImageFlag:I

    invoke-virtual {v0, p1, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->join(Landroid/media/Image;I)V

    return-void
.end method
