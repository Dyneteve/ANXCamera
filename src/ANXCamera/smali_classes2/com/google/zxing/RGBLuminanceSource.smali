.class public final Lcom/google/zxing/RGBLuminanceSource;
.super Lcom/google/zxing/LuminanceSource;
.source "RGBLuminanceSource.java"


# instance fields
.field private final dataHeight:I

.field private final dataWidth:I

.field private final left:I

.field private final luminances:[B

.field private final top:I


# direct methods
.method public constructor <init>(II[I)V
    .registers 14

    invoke-direct {p0, p1, p2}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    iput p1, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    iput p2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataHeight:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/RGBLuminanceSource;->left:I

    iput v0, p0, Lcom/google/zxing/RGBLuminanceSource;->top:I

    mul-int v0, p1, p2

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    const/4 v0, 0x0

    :goto_13
    if-lt v0, p2, :cond_16

    return-void

    :cond_16
    mul-int v1, v0, p1

    const/4 v2, 0x0

    :goto_19
    if-lt v2, p1, :cond_1e

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    :cond_1e
    add-int v3, v1, v2

    aget v3, p3, v3

    shr-int/lit8 v4, v3, 0x10

    and-int/lit16 v4, v4, 0xff

    shr-int/lit8 v5, v3, 0x8

    and-int/lit16 v5, v5, 0xff

    and-int/lit16 v6, v3, 0xff

    if-ne v4, v5, :cond_38

    if-ne v5, v6, :cond_38

    iget-object v7, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    add-int v8, v1, v2

    int-to-byte v9, v4

    aput-byte v9, v7, v8

    goto :goto_45

    :cond_38
    iget-object v7, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    add-int v8, v1, v2

    const/4 v9, 0x2

    mul-int/2addr v9, v5

    add-int/2addr v9, v4

    add-int/2addr v9, v6

    div-int/lit8 v9, v9, 0x4

    int-to-byte v9, v9

    aput-byte v9, v7, v8

    :goto_45
    add-int/lit8 v2, v2, 0x1

    goto :goto_19
.end method

.method private constructor <init>([BIIIIII)V
    .registers 10

    invoke-direct {p0, p6, p7}, Lcom/google/zxing/LuminanceSource;-><init>(II)V

    add-int v0, p4, p6

    if-gt v0, p2, :cond_16

    add-int v0, p5, p7

    if-gt v0, p3, :cond_16

    iput-object p1, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    iput p2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    iput p3, p0, Lcom/google/zxing/RGBLuminanceSource;->dataHeight:I

    iput p4, p0, Lcom/google/zxing/RGBLuminanceSource;->left:I

    iput p5, p0, Lcom/google/zxing/RGBLuminanceSource;->top:I

    return-void

    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Crop rectangle does not fit within image data."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .registers 14

    new-instance v8, Lcom/google/zxing/RGBLuminanceSource;

    iget-object v1, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    iget v2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    iget v3, p0, Lcom/google/zxing/RGBLuminanceSource;->dataHeight:I

    iget v0, p0, Lcom/google/zxing/RGBLuminanceSource;->left:I

    add-int v4, v0, p1

    iget v0, p0, Lcom/google/zxing/RGBLuminanceSource;->top:I

    add-int v5, v0, p2

    nop

    nop

    move-object v0, v8

    move v6, p3

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/google/zxing/RGBLuminanceSource;-><init>([BIIIIII)V

    return-object v8
.end method

.method public getMatrix()[B
    .registers 10

    invoke-virtual {p0}, Lcom/google/zxing/RGBLuminanceSource;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/RGBLuminanceSource;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    if-ne v0, v2, :cond_13

    iget v2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataHeight:I

    if-ne v1, v2, :cond_13

    iget-object v2, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    return-object v2

    :cond_13
    mul-int v2, v0, v1

    new-array v3, v2, [B

    iget v4, p0, Lcom/google/zxing/RGBLuminanceSource;->top:I

    iget v5, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    mul-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/RGBLuminanceSource;->left:I

    add-int/2addr v4, v5

    iget v5, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    if-ne v0, v5, :cond_2a

    iget-object v5, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    const/4 v6, 0x0

    invoke-static {v5, v4, v3, v6, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v3

    :cond_2a
    iget-object v5, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

    const/4 v6, 0x0

    :goto_2d
    if-lt v6, v1, :cond_30

    return-object v3

    :cond_30
    mul-int v7, v6, v0

    invoke-static {v5, v4, v3, v7, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v8, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    add-int/2addr v4, v8

    add-int/lit8 v6, v6, 0x1

    goto :goto_2d
.end method

.method public getRow(I[B)[B
    .registers 7

    if-ltz p1, :cond_23

    invoke-virtual {p0}, Lcom/google/zxing/RGBLuminanceSource;->getHeight()I

    move-result v0

    if-ge p1, v0, :cond_23

    invoke-virtual {p0}, Lcom/google/zxing/RGBLuminanceSource;->getWidth()I

    move-result v0

    if-eqz p2, :cond_11

    array-length v1, p2

    if-ge v1, v0, :cond_13

    :cond_11
    new-array p2, v0, [B

    :cond_13
    iget v1, p0, Lcom/google/zxing/RGBLuminanceSource;->top:I

    add-int/2addr v1, p1

    iget v2, p0, Lcom/google/zxing/RGBLuminanceSource;->dataWidth:I

    mul-int/2addr v1, v2

    iget v2, p0, Lcom/google/zxing/RGBLuminanceSource;->left:I

    add-int/2addr v1, v2

    iget-object v2, p0, Lcom/google/zxing/RGBLuminanceSource;->luminances:[B

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

.method public isCropSupported()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
