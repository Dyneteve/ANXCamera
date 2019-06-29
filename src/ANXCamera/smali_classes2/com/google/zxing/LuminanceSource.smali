.class public abstract Lcom/google/zxing/LuminanceSource;
.super Ljava/lang/Object;
.source "LuminanceSource.java"


# instance fields
.field private final height:I

.field private final width:I


# direct methods
.method protected constructor <init>(II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/LuminanceSource;->width:I

    iput p2, p0, Lcom/google/zxing/LuminanceSource;->height:I

    return-void
.end method


# virtual methods
.method public crop(IIII)Lcom/google/zxing/LuminanceSource;
    .registers 7

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support cropping."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getHeight()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/LuminanceSource;->height:I

    return v0
.end method

.method public abstract getMatrix()[B
.end method

.method public abstract getRow(I[B)[B
.end method

.method public final getWidth()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/LuminanceSource;->width:I

    return v0
.end method

.method public invert()Lcom/google/zxing/LuminanceSource;
    .registers 2

    new-instance v0, Lcom/google/zxing/InvertedLuminanceSource;

    invoke-direct {v0, p0}, Lcom/google/zxing/InvertedLuminanceSource;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public isCropSupported()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public isRotateSupported()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public rotateCounterClockwise()Lcom/google/zxing/LuminanceSource;
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support rotation by 90 degrees."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public rotateCounterClockwise45()Lcom/google/zxing/LuminanceSource;
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "This luminance source does not support rotation by 45 degrees."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 7

    iget v0, p0, Lcom/google/zxing/LuminanceSource;->width:I

    new-array v0, v0, [B

    new-instance v1, Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/google/zxing/LuminanceSource;->height:I

    iget v3, p0, Lcom/google/zxing/LuminanceSource;->width:I

    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v2, v3

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_11
    iget v3, p0, Lcom/google/zxing/LuminanceSource;->height:I

    if-lt v2, v3, :cond_1a

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_1a
    invoke-virtual {p0, v2, v0}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v0

    const/4 v3, 0x0

    :goto_1f
    iget v4, p0, Lcom/google/zxing/LuminanceSource;->width:I

    if-lt v3, v4, :cond_2b

    const/16 v3, 0xa

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    :cond_2b
    aget-byte v4, v0, v3

    and-int/lit16 v4, v4, 0xff

    const/16 v5, 0x40

    if-ge v4, v5, :cond_36

    const/16 v5, 0x23

    goto :goto_46

    :cond_36
    const/16 v5, 0x80

    if-ge v4, v5, :cond_3d

    const/16 v5, 0x2b

    goto :goto_46

    :cond_3d
    const/16 v5, 0xc0

    if-ge v4, v5, :cond_44

    const/16 v5, 0x2e

    goto :goto_46

    :cond_44
    const/16 v5, 0x20

    :goto_46
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1f
.end method
