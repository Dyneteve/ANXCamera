.class Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;
.super Ljava/lang/Object;
.source "VideoInterpolatorAsyncImp.java"

# interfaces
.implements Lcom/miui/extravideo/common/MediaDecoderAsync$DecodeUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecodeUpdateListener"
.end annotation


# instance fields
.field private mBeginInterpolator:Z

.field private mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

.field private mDecodeIndex:I

.field private mEncodeBuffer:[B

.field private final mHeight:I

.field private final mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

.field private mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

.field private mRepresentativeIndex:I

.field private final mWidth:I

.field private mYuvBuffer:[B

.field final synthetic this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;


# direct methods
.method public constructor <init>(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;Lcom/miui/extravideo/common/MediaParamsHolder;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    iput-boolean v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mBeginInterpolator:Z

    iput v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    iput-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    iget p2, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->videoWidth:I

    iput p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mWidth:I

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    iget p2, p2, Lcom/miui/extravideo/common/MediaParamsHolder;->videoHeight:I

    iput p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mHeight:I

    new-instance p2, Lcom/miui/extravideo/interpolation/MediaInterpolator;

    iget v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mWidth:I

    iget v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mHeight:I

    const/4 v2, 0x1

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/extravideo/interpolation/MediaInterpolator;-><init>(III)V

    iput-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

    invoke-static {p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$300(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/extravideo/deflicker/DeFlickerJni;

    iget p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mWidth:I

    iget v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mHeight:I

    invoke-direct {p1, p2, v0}, Lcom/miui/extravideo/deflicker/DeFlickerJni;-><init>(II)V

    iput-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

    :cond_0
    return-void
.end method

.method private initEncodeBuffer(Landroid/media/MediaCodec$BufferInfo;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    array-length v0, v0

    iget v1, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    :cond_0
    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    if-nez v0, :cond_1

    iget p1, p1, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array p1, p1, [B

    iput-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    :cond_1
    return-void
.end method

.method private initYuvBuffer()V
    .locals 2

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mWidth:I

    iget v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mHeight:I

    mul-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    :cond_0
    return-void
.end method

.method private notifyEncodeStop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$500(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaEncoderAsync;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/common/MediaEncoderAsync;->stop()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$900(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Ljava/util/concurrent/BlockingQueue;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    return-void
.end method

.method private release()V
    .locals 1

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$400(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaDecoderAsync;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/common/MediaDecoderAsync;->release()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

    invoke-virtual {v0}, Lcom/miui/extravideo/interpolation/MediaInterpolator;->release()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

    invoke-virtual {v0}, Lcom/miui/extravideo/deflicker/DeFlickerJni;->release()V

    :cond_0
    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$800(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$MediaCodecHandlerThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$MediaCodecHandlerThread;->quitSafely()Z

    return-void
.end method


# virtual methods
.method public onDecodeBuffer(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    .locals 5

    invoke-direct {p0, p2}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->initEncodeBuffer(Landroid/media/MediaCodec$BufferInfo;)V

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->initYuvBuffer()V

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    array-length p1, p1

    if-lez p1, :cond_4

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mEncodeBuffer:[B

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    invoke-static {p1, p2, v0}, Lcom/miui/extravideo/common/MediaColorConvertUtils;->convertDecodeColorToEncode([B[BLcom/miui/extravideo/common/MediaParamsHolder;)V

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDeFlickerJni:Lcom/miui/extravideo/deflicker/DeFlickerJni;

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    invoke-virtual {p1, p2}, Lcom/miui/extravideo/deflicker/DeFlickerJni;->process([B)V

    :cond_0
    iget-boolean p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mBeginInterpolator:Z

    const/4 p2, 0x4

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    invoke-virtual {p1, p2, v1}, Lcom/miui/extravideo/interpolation/MediaInterpolator;->configInterpolationSize(I[B)V

    :goto_0
    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

    invoke-virtual {p1}, Lcom/miui/extravideo/interpolation/MediaInterpolator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaInterpolator:Lcom/miui/extravideo/interpolation/MediaInterpolator;

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    invoke-virtual {p1, p2}, Lcom/miui/extravideo/interpolation/MediaInterpolator;->nextByteBuffer([B)V

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    iget v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    iget-object v2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v2}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$500(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaEncoderAsync;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/extravideo/common/MediaEncoderAsync;->getFrameRate()I

    move-result v2

    invoke-static {v1, v2}, Lcom/miui/extravideo/common/MediaUtils;->computePresentationTime(II)J

    move-result-wide v1

    iget v3, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    invoke-static {p1, p2, v1, v2, v3}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$600(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;[BJI)V

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mYuvBuffer:[B

    iget v2, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    iget-object v3, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v3}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$500(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaEncoderAsync;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/extravideo/common/MediaEncoderAsync;->getFrameRate()I

    move-result v3

    invoke-static {v2, v3}, Lcom/miui/extravideo/common/MediaUtils;->computePresentationTime(II)J

    move-result-wide v2

    iget v4, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    invoke-static {p1, v1, v2, v3, v4}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$600(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;[BJI)V

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    const/16 v1, 0x2d

    if-lt p1, v1, :cond_2

    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    goto :goto_1

    :cond_2
    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    add-int/lit8 p1, p1, 0x20

    iput p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mRepresentativeIndex:I

    :cond_3
    :goto_1
    iget p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mDecodeIndex:I

    const/16 p2, 0x2c

    if-ne p1, p2, :cond_4

    iput-boolean v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mBeginInterpolator:Z

    :cond_4
    return-void
.end method

.method public onDecodeStop(Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->release()V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$700(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    :cond_0
    return-void
.end method

.method public onError()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->release()V

    invoke-direct {p0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->notifyEncodeStop()V

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {v0}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$200(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)V

    return-void
.end method

.method public onFrameDecodeBegin(IJ)V
    .locals 0

    const/16 p2, 0x2d

    if-ne p1, p2, :cond_0

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->this$0:Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;

    invoke-static {p1}, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;->access$400(Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp;)Lcom/miui/extravideo/common/MediaDecoderAsync;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/extravideo/common/MediaDecoderAsync;->setSkipFrameTimes(I)V

    :cond_0
    return-void
.end method

.method public onOutputFormatChange(Landroid/media/MediaFormat;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/VideoInterpolatorAsyncImp$DecodeUpdateListener;->mMediaParamsHolder:Lcom/miui/extravideo/common/MediaParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/extravideo/common/MediaParamsHolder;->setFormat(Landroid/media/MediaFormat;)V

    return-void
.end method
