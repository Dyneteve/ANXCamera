.class Lcom/xiaomi/camera/core/MultiFrameProcessor$2;
.super Ljava/lang/Object;
.source "MultiFrameProcessor.java"

# interfaces
.implements Lcom/xiaomi/camera/imagecodec/ReprocessData$OnDataAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/MultiFrameProcessor;->reprocessImage(Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

.field final synthetic val$captureDataBean:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/MultiFrameProcessor;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    iput-object p2, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->val$captureDataBean:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$300(Lcom/xiaomi/camera/core/MultiFrameProcessor;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onError>>tag="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " reason="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    sget-boolean v1, Lmiui/os/Build;->IS_DEBUGGABLE:Z

    if-nez v1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$402(Lcom/xiaomi/camera/core/MultiFrameProcessor;Z)Z

    iget-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$300(Lcom/xiaomi/camera/core/MultiFrameProcessor;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError<<cost="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {v3}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$500(Lcom/xiaomi/camera/core/MultiFrameProcessor;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "reprocessImage failed image = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " reason = "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onJpegAvailable([BLjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onYuvAvailable(Landroid/media/Image;Ljava/lang/String;)V
    .locals 5

    iget-object v0, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {v0}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$300(Lcom/xiaomi/camera/core/MultiFrameProcessor;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onYuvAvailable>>tag="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    const/4 v1, 0x0

    invoke-static {p2, v1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$402(Lcom/xiaomi/camera/core/MultiFrameProcessor;Z)Z

    iget-object p2, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->val$captureDataBean:Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-virtual {p2, p1}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setMainImage(Landroid/media/Image;)V

    iget-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {p1}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$300(Lcom/xiaomi/camera/core/MultiFrameProcessor;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onYuvAvailable<<cost="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$2;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-static {v3}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$500(Lcom/xiaomi/camera/core/MultiFrameProcessor;)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
