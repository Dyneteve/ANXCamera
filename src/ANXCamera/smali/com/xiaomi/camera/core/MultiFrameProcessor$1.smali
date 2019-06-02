.class Lcom/xiaomi/camera/core/MultiFrameProcessor$1;
.super Ljava/lang/Object;
.source "MultiFrameProcessor.java"

# interfaces
.implements Lcom/xiaomi/camera/processor/ProcessResultListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/camera/core/MultiFrameProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;


# direct methods
.method constructor <init>(Lcom/xiaomi/camera/core/MultiFrameProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$1;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProcessFinished(Lcom/xiaomi/camera/core/CaptureData;Z)V
    .locals 3

    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onProcessFinished: doReprocess = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataListener()Lcom/xiaomi/camera/core/CaptureDataListener;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object p2

    const-string v0, "onProcessFinished: null CaptureDataListener!"

    invoke-static {p2, v0}, Lcom/android/camera/log/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getMultiFrameProcessResult()Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->close()V

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getCaptureDataBeanList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;->close()V

    :cond_1
    goto :goto_0

    :cond_2
    return-void

    :cond_3
    if-eqz p2, :cond_4

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->getMultiFrameProcessResult()Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;

    move-result-object p2

    iget-object v1, p0, Lcom/xiaomi/camera/core/MultiFrameProcessor$1;->this$0:Lcom/xiaomi/camera/core/MultiFrameProcessor;

    invoke-virtual {p1}, Lcom/xiaomi/camera/core/CaptureData;->isCapturedByFrontCamera()Z

    move-result v2

    invoke-static {v1, p2, v2}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$200(Lcom/xiaomi/camera/core/MultiFrameProcessor;Lcom/xiaomi/camera/core/CaptureData$CaptureDataBean;Z)V

    :cond_4
    invoke-static {}, Lcom/xiaomi/camera/core/MultiFrameProcessor;->access$100()Ljava/lang/String;

    move-result-object p2

    const-string v1, "onProcessFinished: dispatch image to algorithm engine"

    invoke-static {p2, v1}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v0, p1}, Lcom/xiaomi/camera/core/CaptureDataListener;->onCaptureDataAvailable(Lcom/xiaomi/camera/core/CaptureData;)V

    return-void
.end method
