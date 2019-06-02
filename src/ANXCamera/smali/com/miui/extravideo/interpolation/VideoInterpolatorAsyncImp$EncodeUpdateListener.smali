.class Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;
.super Ljava/lang/Object;
.source "VideoInterpolatorAsyncImp.java"

# interfaces
.implements Lcom/miui/extravideo/common/MediaEncoderAsync$EncodeUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EncodeUpdateListener"
.end annotation


# instance fields
.field private mEncodeIndex:I

.field private mIsEnd:Z

.field final synthetic this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;


# direct methods
.method private constructor <init>(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mIsEnd:Z

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;-><init>(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    return-void
.end method

.method private configFrame(Lcom/miui/extravideo/interpolation/EncodeBufferHolder;Lcom/miui/extravideo/interpolation/EncodeBufferHolder;)V
    .locals 2

    iget-object v0, p2, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->data:[B

    iput-object v0, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->data:[B

    iget v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$500(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaEncoderAsync;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/extravideo/common/MediaEncoderAsync;->getFrameRate()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/extravideo/common/MediaUtils;->computePresentationTime(II)J

    move-result-wide v0

    iput-wide v0, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->presentationTimeUs:J

    iget p2, p2, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput p2, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    return-void
.end method

.method private notifyDecodeStop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$400(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaDecoderAsync;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->stop()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$900(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    return-void
.end method

.method private release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$500(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaEncoderAsync;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/common/MediaEncoderAsync;->release()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1400(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$MediaCodecHandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$MediaCodecHandlerThread;->quitSafely()Z

    return-void
.end method


# virtual methods
.method public onEncodeEnd(Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->release()V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1200(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1300(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    :goto_0
    return-void
.end method

.method public onError()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->release()V

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->notifyDecodeStop()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1300(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$200(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    return-void
.end method

.method public onInputBufferAvailable(Lcom/miui/extravideo/interpolation/EncodeBufferHolder;)V
    .locals 7

    nop

    iget-boolean v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mIsEnd:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1000(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/interpolation/EncodeBufferHolder;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    const/4 v2, 0x0

    if-eqz v0, :cond_4

    iget v3, v0, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    const/4 v4, 0x4

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    iget v0, v0, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput v0, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput-boolean v5, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mIsEnd:Z

    goto :goto_1

    :cond_1
    iget v3, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    const/16 v6, 0x12c

    if-lt v3, v6, :cond_2

    iput v4, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput-boolean v5, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mIsEnd:Z

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->notifyDecodeStop()V

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v3}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$1100(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)[I

    move-result-object v3

    iget v4, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    aget v3, v3, v4

    iget v4, v0, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->representativeIndex:I

    if-ne v3, v4, :cond_3

    invoke-direct {p0, p1, v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->configFrame(Lcom/miui/extravideo/interpolation/EncodeBufferHolder;Lcom/miui/extravideo/interpolation/EncodeBufferHolder;)V

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    add-int/2addr p1, v5

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$EncodeUpdateListener;->mEncodeIndex:I

    goto :goto_1

    :cond_3
    iput v2, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput-object v1, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->data:[B

    goto :goto_1

    :cond_4
    iput v2, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->flag:I

    iput-object v1, p1, Lcom/miui/extravideo/interpolation/EncodeBufferHolder;->data:[B

    :goto_1
    return-void
.end method
