.class Lcom/xiaomi/camera/core/ParallelDataZipper$2;
.super Ljava/lang/Object;
.source "ParallelDataZipper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/camera/core/ParallelDataZipper;->join(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

.field final synthetic val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

.field final synthetic val$isFirst:Z


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    iput-object p2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iput-boolean p3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$isFirst:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    invoke-virtual {v0}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getTimeStamp()J

    move-result-wide v0

    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    invoke-virtual {v2}, Lcom/xiaomi/protocol/ICustomCaptureResult;->getSequenceId()I

    move-result v2

    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v3, v0, v1}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$300(Lcom/xiaomi/camera/core/ParallelDataZipper;J)I

    move-result v3

    iget-object v4, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v4}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$400(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v4

    invoke-virtual {v4, v0, v1}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    if-nez v4, :cond_0

    new-instance v4, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    invoke-direct {v4, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;-><init>(I)V

    iget-object v5, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v5}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$400(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v5

    invoke-virtual {v5, v0, v1, v4}, Landroid/util/LongSparseArray;->append(JLjava/lang/Object;)V

    :cond_0
    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getStreamNum()I

    move-result v5

    if-eq v5, v3, :cond_1

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setResult: update stream number with :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4, v3}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setStreamNum(I)V

    :cond_1
    iget-object v3, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$captureResult:Lcom/xiaomi/protocol/ICustomCaptureResult;

    iget-boolean v5, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$isFirst:Z

    invoke-virtual {v4, v3, v5}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->setCaptureResult(Lcom/xiaomi/protocol/ICustomCaptureResult;Z)V

    invoke-static {}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$100()Ljava/lang/String;

    move-result-object v3

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setResult: timestamp="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v6, " sequenceId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " streamNum="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->getStreamNum()I

    move-result v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " isFirst="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->val$isFirst:Z

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->isDataReady()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v2}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$400(Lcom/xiaomi/camera/core/ParallelDataZipper;)Landroid/util/LongSparseArray;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    iget-object v0, p0, Lcom/xiaomi/camera/core/ParallelDataZipper$2;->this$0:Lcom/xiaomi/camera/core/ParallelDataZipper;

    invoke-static {v0, v4}, Lcom/xiaomi/camera/core/ParallelDataZipper;->access$500(Lcom/xiaomi/camera/core/ParallelDataZipper;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;)V

    :cond_2
    return-void
.end method
