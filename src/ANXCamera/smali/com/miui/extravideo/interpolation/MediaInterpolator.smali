.class Lcom/miui/extravideo/interpolation/MediaInterpolator;
.super Ljava/lang/Object;
.source "MediaInterpolator.java"


# instance fields
.field private mBuffers:[[Ljava/nio/ByteBuffer;

.field private mCurrentInterpolationTimes:I

.field private final mHeight:I

.field private mInterpolationSize:I

.field private mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

.field private final mResultImageIndex:[I

.field private mSrc:[B

.field private final mWidth:I


# direct methods
.method public constructor <init>(III)V
    .locals 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    const/4 v1, 0x3

    filled-new-array {v1, v0}, [I

    move-result-object v1

    const-class v2, Ljava/nio/ByteBuffer;

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[Ljava/nio/ByteBuffer;

    iput-object v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mResultImageIndex:[I

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolationSize:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    iput p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mWidth:I

    iput p2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mHeight:I

    new-instance p1, Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-direct {p1}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;-><init>()V

    iput-object p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    iget-object v2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    iget v3, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mWidth:I

    iget v4, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mHeight:I

    iget v5, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mWidth:I

    iget v6, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mHeight:I

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->initialize(IIIII)I

    iget-object p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-virtual {p1}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->start()I

    move p1, v1

    :goto_0
    iget-object p2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    array-length p2, p2

    if-ge p1, p2, :cond_0

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    aget-object p2, p2, p1

    iget-object p3, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-virtual {p3, p1, v1}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->getImageBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object p3

    aput-object p3, p2, v1

    iget-object p2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    aget-object p2, p2, p1

    iget-object p3, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-virtual {p3, p1, v0}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->getImageBuffer(II)Ljava/nio/ByteBuffer;

    move-result-object p3

    aput-object p3, p2, v0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public configInterpolationSize(I[B)V
    .locals 0

    iput p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolationSize:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    iput-object p2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mSrc:[B

    return-void
.end method

.method public hasNext()Z
    .locals 2

    iget v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    iget v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolationSize:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public nextByteBuffer([B)V
    .locals 5

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    iget v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mSrc:[B

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iget v2, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    iget v3, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolationSize:I

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->process([BIIZ)I

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mResultImageIndex:[I

    invoke-virtual {v0, v1}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->getImageIndex([I)I

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mResultImageIndex:[I

    const/4 v2, 0x1

    aget v1, v1, v2

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mResultImageIndex:[I

    aget v1, v1, v2

    aget-object v0, v0, v1

    aget-object v0, v0, v2

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mCurrentInterpolationTimes:I

    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mSrc:[B

    check-cast v0, [[Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mBuffers:[[Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/miui/extravideo/interpolation/MediaInterpolator;->mInterpolatorJNI:Lcom/miui/extravideo/interpolation/InterpolatorJNI;

    invoke-virtual {v0}, Lcom/miui/extravideo/interpolation/InterpolatorJNI;->finish()V

    return-void
.end method
