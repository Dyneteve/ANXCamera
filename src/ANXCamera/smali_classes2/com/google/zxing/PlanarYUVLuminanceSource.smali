.class public final Lcom/google/zxing/PlanarYUVLuminanceSource;
.super Lcom/google/zxing/LuminanceSource;
.source "PlanarYUVLuminanceSource.java"


# static fields
.field private static final THUMBNAIL_SCALE_FACTOR:I = 0x2


# instance fields
.field private final dataHeight:I

.field private final dataWidth:I

.field private final left:I

.field private final top:I

.field private final yuvData:[B


# direct methods
.method public constructor <init>([BIIIIIIZ)V
    .registers 11

    invoke-direct {p0, p6, p7}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    add-int v0, p4, p6

    if-gt v0, p2, :cond_1b

    add-int v0, p5, p7

    if-gt v0, p3, :cond_1b

    iput-object p1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    iput p2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    iput p3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    iput p4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    iput p5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    if-eqz p8, :cond_1a

    invoke-direct {p0, p6, p7}, Lcom/google/zxing/PlanarYUVLuminanceSource;->reverseHorizontal(II)V

    :cond_1a
    return-void

    :cond_1b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Crop rectangle does not fit within image data."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private reverseHorizontal(II)V
    .registers 11

    iget-object v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v1, 0x0

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v2, v3

    :goto_b
    if-lt v1, p2, :cond_e

    return-void

    :cond_e
    div-int/lit8 v3, p1, 0x2

    add-int/2addr v3, v2

    move v4, v2

    add-int v5, v2, p1

    add-int/lit8 v5, v5, -0x1

    :goto_16
    if-lt v4, v3, :cond_1e

    add-int/lit8 v1, v1, 0x1

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    add-int/2addr v2, v3

    goto :goto_b

    :cond_1e
    aget-byte v6, v0, v4

    aget-byte v7, v0, v5

    aput-byte v7, v0, v4

    aput-byte v6, v0, v5

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v5, v5, -0x1

    goto :goto_16
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .registers 15

    new-instance v9, Lcom/google/zxing/PlanarYUVLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    iget v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    iget v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int v4, v0, p1

    iget v0, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    add-int v5, v0, p2

    nop

    nop

    nop

    const/4 v8, 0x0

    move-object v0, v9

    move v6, p3

    move v7, p4

    invoke-direct/range {v0 .. v8}, Lcom/google/zxing/PlanarYUVLuminanceSource;-><init>([BIIIIIIZ)V

    return-object v9
.end method

.method public getMatrix()[B
    .registers 10

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    if-ne v0, v2, :cond_13

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataHeight:I

    if-ne v1, v2, :cond_13

    iget-object v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    return-object v2

    :cond_13
    mul-int v2, v0, v1

    new-array v3, v2, [B

    iget v4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    if-ne v0, v5, :cond_2a

    iget-object v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v6, 0x0

    invoke-static {v5, v4, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v3

    :cond_2a
    iget-object v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v6, 0x0

    :goto_2d
    if-lt v6, v1, :cond_30

    return-object v3

    :cond_30
    mul-int v7, v6, v0

    invoke-static {v5, v4, v3, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v8, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    add-int/2addr v4, v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_2d
.end method

.method public getRow(I[B)[B
    .registers 7

    if-ltz p1, :cond_23

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v0

    if-ge p1, v0, :cond_23

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    if-eqz p2, :cond_11

    array-length v1, p2

    if-ge v1, v0, :cond_13

    :cond_11
    new-array p2, v0, [B

    :cond_13
    iget v1, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    add-int/2addr v1, p1

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    const/4 v3, 0x0

    invoke-static {v2, v1, p2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p2

    :cond_23
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Requested row is outside the image: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getThumbnailHeight()I
    .registers 2

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getThumbnailWidth()I
    .registers 2

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public isCropSupported()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public renderThumbnail()[I
    .registers 13

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0}, Lcom/google/zxing/PlanarYUVLuminanceSource;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    mul-int v2, v0, v1

    new-array v2, v2, [I

    iget-object v3, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->yuvData:[B

    iget v4, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->top:I

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->left:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_1b
    if-lt v5, v1, :cond_1e

    return-object v2

    :cond_1e
    mul-int v6, v5, v0

    const/4 v7, 0x0

    :goto_21
    if-lt v7, v0, :cond_2b

    iget v7, p0, Lcom/google/zxing/PlanarYUVLuminanceSource;->dataWidth:I

    mul-int/lit8 v7, v7, 0x2

    add-int/2addr v4, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_1b

    :cond_2b
    mul-int/lit8 v8, v7, 0x2

    add-int/2addr v8, v4

    aget-byte v8, v3, v8

    and-int/lit16 v8, v8, 0xff

    add-int v9, v6, v7

    const/high16 v10, -0x1000000

    const v11, 0x10101

    mul-int/2addr v11, v8

    or-int/2addr v10, v11

    aput v10, v2, v9

    add-int/lit8 v7, v7, 0x1

    goto :goto_21
.end method
