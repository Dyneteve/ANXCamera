.class Lcom/xiaomi/camera/core/ParallelDataZipper$1;
.super Ljava/lang/Object;
.source "ParallelDataZipper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/ParallelDataZipper;->startTask(Lcom/xiaomi/camera/core/CaptureData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

.field final synthetic val$captureData:Lcom/xiaomi/camera/core/CaptureData;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/camera/core/CaptureData;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    iput-object p2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureData:Lcom/xiaomi/camera/core/CaptureData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startTask: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureData:Lcom/xiaomi/camera/core/CaptureData;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v0}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$200(Lcom/xiaomi/camera/core/ParallelDataZipper;)Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureData:Lcom/xiaomi/camera/core/CaptureData;

    invoke-virtual {v1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureTimestamp()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$1;->val$captureData:Lcom/xiaomi/camera/core/CaptureData;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
