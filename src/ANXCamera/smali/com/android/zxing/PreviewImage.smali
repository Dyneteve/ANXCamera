.class public Lcom/android/zxing/PreviewImage;
.super Ljava/lang/Object;
.source "PreviewImage.java"


# static fields
.field public static final PREVIEW_STATUS_NORMAL:I = 0x2

.field public static final PREVIEW_STATUS_START:I = 0x1

.field public static final PREVIEW_STATUS_STOP:I = 0x3

.field public static final PREVIEW_STATUS_UNKNOWN:I = 0x0

.field private static final TAG:Ljava/lang/String; = "PreviewImage"


# instance fields
.field private mCameraId:I

.field private mData:[B

.field private mFormat:I

.field private mHeight:I

.field private mOrientation:I

.field private mPreviewStatus:I

.field private mTimestamp:J

.field private mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/zxing/PreviewImage;->mPreviewStatus:I

    iput p1, p0, Lcom/android/zxing/PreviewImage;->mPreviewStatus:I

    iput p2, p0, Lcom/android/zxing/PreviewImage;->mCameraId:I

    return-void
.end method

.method public constructor <init>(Landroid/media/Image;I)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/zxing/PreviewImage;->mPreviewStatus:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, p1}, Lcom/android/zxing/PreviewImage;->convertYUV420ToNV21(Landroid/media/Image;)V

    iput p2, p0, Lcom/android/zxing/PreviewImage;->mOrientation:I

    const/4 p1, 0x2

    iput p1, p0, Lcom/android/zxing/PreviewImage;->mPreviewStatus:I

    const-string p1, "PreviewImage"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PreviewDecodeManager convertYUV420ToNV21: cost = "

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-virtual {p2, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private convertYUV420ToNV21(Landroid/media/Image;)V
    .locals 10

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v0

    const/16 v1, 0x23

    if-eq v0, v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/media/Image;->getTimestamp()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    invoke-virtual {p1}, Landroid/media/Image;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-virtual {p1}, Landroid/media/Image;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    invoke-virtual {p1}, Landroid/media/Image;->getFormat()I

    move-result v0

    iput v0, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v0

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x2

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v2

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v4

    aget-object v4, v4, v1

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {p1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object p1

    aget-object p1, p1, v3

    invoke-virtual {p1}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v6

    const-string v7, "PreviewImage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "convertYUV420888ToNV21: size = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo v9, "x"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", yStride = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", uvStride = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/camera/log/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    add-int v7, v5, v6

    new-array v7, v7, [B

    iput-object v7, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    iget-object v7, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    invoke-virtual {v4, v7, v1, v5}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    invoke-virtual {p1, v4, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    array-length p1, p1

    int-to-double v4, p1

    iget p1, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    iget v6, p0, Lcom/android/zxing/PreviewImage;->mHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    mul-int/2addr p1, v6

    int-to-double v6, p1

    const-wide/high16 v8, 0x3ff8000000000000L    # 1.5

    mul-double/2addr v6, v8

    cmpg-double p1, v4, v6

    if-gtz p1, :cond_2

    return-void

    :cond_2
    nop

    iget p1, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    iget v4, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    mul-int/2addr p1, v4

    int-to-double v4, p1

    mul-double/2addr v4, v8

    double-to-int p1, v4

    nop

    nop

    new-array p1, p1, [B

    move v4, v1

    move v5, v4

    move v6, v5

    :goto_0
    iget v7, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    if-ge v4, v7, :cond_4

    iget-object v7, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    iget v8, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-static {v7, v5, p1, v6, v8}, Ljava/lang/System;->arraycopy([BI[BII)V

    iget v7, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    add-int/lit8 v7, v7, -0x1

    if-ne v4, v7, :cond_3

    iget v7, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    add-int/2addr v5, v7

    goto :goto_1

    :cond_3
    add-int/2addr v5, v0

    :goto_1
    iget v7, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    add-int/2addr v6, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    iget v0, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    div-int/2addr v0, v3

    if-ge v1, v0, :cond_6

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    div-int/2addr v0, v3

    add-int/lit8 v0, v0, -0x1

    if-ne v1, v0, :cond_5

    iget-object v0, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    iget v4, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    add-int/lit8 v4, v4, -0x1

    invoke-static {v0, v5, p1, v6, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    goto :goto_3

    :cond_5
    iget-object v0, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    iget v4, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-static {v0, v5, p1, v6, v4}, Ljava/lang/System;->arraycopy([BI[BII)V

    :goto_3
    add-int/2addr v5, v2

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    add-int/2addr v6, v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    iput-object p1, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    return-void

    :catch_0
    move-exception p1

    return-void
.end method


# virtual methods
.method public getCameraId()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mCameraId:I

    return v0
.end method

.method public getData()[B
    .locals 1

    iget-object v0, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    return-object v0
.end method

.method public getFormat()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    return v0
.end method

.method public getOrientation()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mOrientation:I

    return v0
.end method

.method public getPreviewStatus()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mPreviewStatus:I

    return v0
.end method

.method public getTimestamp()J
    .locals 2

    iget-wide v0, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    return-wide v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "PreviewImage{mData="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/zxing/PreviewImage;->mData:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mTimestamp="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/android/zxing/PreviewImage;->mTimestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mWidth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mWidth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mHeight="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mHeight:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mFormat="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/android/zxing/PreviewImage;->mFormat:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
