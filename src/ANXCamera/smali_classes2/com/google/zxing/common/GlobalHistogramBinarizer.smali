.class public Lcom/google/zxing/common/GlobalHistogramBinarizer;
.super Lcom/google/zxing/Binarizer;
.source "GlobalHistogramBinarizer.java"


# static fields
.field private static final EMPTY:[B

.field private static final LUMINANCE_BITS:I = 0x5

.field private static final LUMINANCE_BUCKETS:I = 0x20

.field private static final LUMINANCE_SHIFT:I = 0x3


# instance fields
.field private final buckets:[I

.field private luminances:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->EMPTY:[B

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/zxing/Binarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    sget-object v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->EMPTY:[B

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    const/16 v0, 0x20

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    return-void
.end method

.method private static estimateBlackPoint([I)I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_5
    if-lt v4, v0, :cond_46

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_a
    if-lt v6, v0, :cond_39

    if-le v2, v4, :cond_11

    move v6, v2

    move v2, v4

    move v4, v6

    :cond_11
    sub-int v6, v4, v2

    div-int/lit8 v7, v0, 0x10

    if-le v6, v7, :cond_34

    add-int/lit8 v6, v4, -0x1

    const/4 v7, -0x1

    add-int/lit8 v8, v4, -0x1

    :goto_1c
    if-gt v8, v2, :cond_21

    shl-int/lit8 v8, v6, 0x3

    return v8

    :cond_21
    sub-int v9, v8, v2

    mul-int v10, v9, v9

    sub-int v11, v4, v8

    mul-int/2addr v10, v11

    aget v11, p0, v8

    sub-int v11, v1, v11

    mul-int/2addr v10, v11

    if-le v10, v7, :cond_31

    move v6, v8

    move v7, v10

    :cond_31
    add-int/lit8 v8, v8, -0x1

    goto :goto_1c

    :cond_34
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    :cond_39
    sub-int v7, v6, v2

    aget v8, p0, v6

    mul-int/2addr v8, v7

    mul-int/2addr v8, v7

    if-le v8, v5, :cond_43

    move v4, v6

    move v5, v8

    :cond_43
    add-int/lit8 v6, v6, 0x1

    goto :goto_a

    :cond_46
    aget v5, p0, v4

    if-le v5, v3, :cond_4d

    move v2, v4

    aget v3, p0, v4

    :cond_4d
    aget v5, p0, v4

    if-le v5, v1, :cond_53

    aget v1, p0, v4

    :cond_53
    add-int/lit8 v4, v4, 0x1

    goto :goto_5
.end method

.method private initArrays(I)V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    array-length v0, v0

    if-ge v0, p1, :cond_9

    new-array v0, p1, [B

    iput-object v0, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const/16 v1, 0x20

    if-lt v0, v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    const/4 v2, 0x0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method


# virtual methods
.method public createBinarizer(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    .registers 3

    new-instance v0, Lcom/google/zxing/common/GlobalHistogramBinarizer;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getBlackMatrix()Lcom/google/zxing/common/BitMatrix;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v2

    new-instance v3, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v3, v1, v2}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    invoke-direct {p0, v1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    iget-object v4, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    const/4 v5, 0x1

    :goto_17
    const/4 v6, 0x5

    if-lt v5, v6, :cond_3d

    invoke-static {v4}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v7

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v8

    const/4 v5, 0x0

    move v9, v5

    :goto_24
    if-lt v9, v2, :cond_27

    return-object v3

    :cond_27
    mul-int v10, v9, v1

    const/4 v5, 0x0

    :goto_2a
    if-lt v5, v1, :cond_2f

    add-int/lit8 v9, v9, 0x1

    goto :goto_24

    :cond_2f
    add-int v6, v10, v5

    aget-byte v6, v8, v6

    and-int/lit16 v6, v6, 0xff

    if-ge v6, v7, :cond_3a

    invoke-virtual {v3, v5, v9}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_3a
    add-int/lit8 v5, v5, 0x1

    goto :goto_2a

    :cond_3d
    mul-int v7, v2, v5

    div-int/2addr v7, v6

    iget-object v8, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v0, v7, v8}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v8

    mul-int/lit8 v9, v1, 0x4

    div-int/2addr v9, v6

    div-int/lit8 v6, v1, 0x5

    :goto_4b
    if-lt v6, v9, :cond_50

    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    :cond_50
    aget-byte v10, v8, v6

    and-int/lit16 v10, v10, 0xff

    shr-int/lit8 v11, v10, 0x3

    aget v12, v4, v11

    add-int/lit8 v12, v12, 0x1

    aput v12, v4, v11

    add-int/lit8 v6, v6, 0x1

    goto :goto_4b
.end method

.method public getBlackRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v1

    if-eqz p2, :cond_15

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ge v2, v1, :cond_11

    goto :goto_15

    :cond_11
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->clear()V

    goto :goto_1c

    :cond_15
    :goto_15
    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2, v1}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    move-object p2, v2

    nop

    :goto_1c
    invoke-direct {p0, v1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->initArrays(I)V

    iget-object v2, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->luminances:[B

    invoke-virtual {v0, p1, v2}, Lcom/google/zxing/LuminanceSource;->getRow(I[B)[B

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/common/GlobalHistogramBinarizer;->buckets:[I

    const/4 v4, 0x0

    :goto_28
    const/4 v5, 0x1

    if-lt v4, v1, :cond_54

    invoke-static {v3}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->estimateBlackPoint([I)I

    move-result v6

    const/4 v4, 0x0

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    aget-byte v5, v2, v5

    and-int/lit16 v5, v5, 0xff

    const/4 v7, 0x1

    :goto_39
    add-int/lit8 v8, v1, -0x1

    if-lt v7, v8, :cond_3e

    return-object p2

    :cond_3e
    add-int/lit8 v8, v7, 0x1

    aget-byte v8, v2, v8

    and-int/lit16 v8, v8, 0xff

    mul-int/lit8 v9, v5, 0x4

    sub-int/2addr v9, v4

    sub-int/2addr v9, v8

    div-int/lit8 v9, v9, 0x2

    if-ge v9, v6, :cond_4f

    invoke-virtual {p2, v7}, Lcom/google/zxing/common/BitArray;->set(I)V

    :cond_4f
    move v4, v5

    move v5, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_39

    :cond_54
    aget-byte v6, v2, v4

    and-int/lit16 v6, v6, 0xff

    shr-int/lit8 v7, v6, 0x3

    aget v8, v3, v7

    add-int/2addr v8, v5

    aput v8, v3, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_28
.end method
