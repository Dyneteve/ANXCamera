.class public final Lcom/google/zxing/common/HybridBinarizer;
.super Lcom/google/zxing/common/GlobalHistogramBinarizer;
.source "HybridBinarizer.java"


# static fields
.field private static final BLOCK_SIZE:I = 0x8

.field private static final BLOCK_SIZE_MASK:I = 0x7

.field private static final BLOCK_SIZE_POWER:I = 0x3

.field private static final MINIMUM_DIMENSION:I = 0x28

.field private static final MIN_DYNAMIC_RANGE:I = 0x18


# instance fields
.field private matrix:Lcom/google/zxing/common/BitMatrix;


# direct methods
.method public constructor <init>(Lcom/google/zxing/LuminanceSource;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/zxing/common/GlobalHistogramBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-void
.end method

.method private static calculateBlackPoints([BIIII)[[I
    .registers 22

    move/from16 v0, p1

    move/from16 v1, p2

    filled-new-array {v1, v0}, [I

    move-result-object v2

    const-class v3, I

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    const/4 v3, 0x0

    :goto_11
    if-lt v3, v1, :cond_14

    return-object v2

    :cond_14
    shl-int/lit8 v4, v3, 0x3

    add-int/lit8 v5, p4, -0x8

    if-le v4, v5, :cond_1b

    move v4, v5

    :cond_1b
    const/4 v6, 0x0

    :goto_1c
    if-lt v6, v0, :cond_21

    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    :cond_21
    shl-int/lit8 v7, v6, 0x3

    add-int/lit8 v8, p3, -0x8

    if-le v7, v8, :cond_28

    move v7, v8

    :cond_28
    const/4 v9, 0x0

    const/16 v10, 0xff

    const/4 v11, 0x0

    const/4 v12, 0x0

    mul-int v13, v4, p3

    add-int/2addr v13, v7

    :goto_30
    const/16 v0, 0x8

    if-lt v12, v0, :cond_6c

    shr-int/lit8 v0, v9, 0x6

    sub-int v12, v11, v10

    move v15, v0

    const/16 v0, 0x18

    if-gt v12, v0, :cond_62

    div-int/lit8 v0, v10, 0x2

    if-lez v3, :cond_63

    if-lez v6, :cond_63

    add-int/lit8 v12, v3, -0x1

    aget-object v12, v2, v12

    aget v12, v12, v6

    aget-object v13, v2, v3

    add-int/lit8 v14, v6, -0x1

    aget v13, v13, v14

    const/4 v14, 0x2

    mul-int/2addr v14, v13

    add-int/2addr v12, v14

    add-int/lit8 v13, v3, -0x1

    aget-object v13, v2, v13

    add-int/lit8 v14, v6, -0x1

    aget v13, v13, v14

    add-int/2addr v12, v13

    div-int/lit8 v12, v12, 0x4

    nop

    if-ge v10, v12, :cond_63

    move v0, v12

    goto :goto_63

    :cond_62
    move v0, v15

    :cond_63
    :goto_63
    aget-object v12, v2, v3

    aput v0, v12, v6

    add-int/lit8 v6, v6, 0x1

    move/from16 v0, p1

    goto :goto_1c

    :cond_6c
    const/4 v15, 0x0

    move/from16 v16, v15

    move v15, v9

    move/from16 v9, v16

    :goto_72
    if-lt v9, v0, :cond_a8

    sub-int v9, v11, v10

    const/16 v0, 0x18

    if-le v9, v0, :cond_9d

    add-int/lit8 v12, v12, 0x1

    add-int v13, v13, p3

    move v0, v12

    move v9, v13

    :goto_80
    const/16 v12, 0x8

    if-lt v0, v12, :cond_86

    move v12, v0

    goto :goto_9e

    :cond_86
    const/4 v13, 0x0

    move v1, v13

    :goto_88
    if-lt v1, v12, :cond_91

    add-int/lit8 v0, v0, 0x1

    add-int v9, v9, p3

    move/from16 v1, p2

    goto :goto_80

    :cond_91
    add-int v13, v9, v1

    aget-byte v12, p0, v13

    and-int/lit16 v12, v12, 0xff

    add-int/2addr v15, v12

    add-int/lit8 v1, v1, 0x1

    const/16 v12, 0x8

    goto :goto_88

    :cond_9d
    move v9, v13

    :goto_9e
    add-int/lit8 v12, v12, 0x1

    add-int v13, v9, p3

    move v9, v15

    move/from16 v0, p1

    move/from16 v1, p2

    goto :goto_30

    :cond_a8
    move v1, v0

    const/16 v0, 0x18

    add-int v14, v13, v9

    aget-byte v0, p0, v14

    and-int/lit16 v0, v0, 0xff

    add-int/2addr v15, v0

    if-ge v0, v10, :cond_b5

    move v10, v0

    :cond_b5
    if-le v0, v11, :cond_b8

    move v11, v0

    :cond_b8
    add-int/lit8 v9, v9, 0x1

    move v0, v1

    move/from16 v1, p2

    goto :goto_72
.end method

.method private static calculateThresholdForBlock([BIIII[[ILcom/google/zxing/common/BitMatrix;)V
    .registers 25

    move/from16 v0, p1

    move/from16 v1, p2

    const/4 v2, 0x0

    :goto_5
    if-lt v2, v1, :cond_8

    return-void

    :cond_8
    shl-int/lit8 v3, v2, 0x3

    add-int/lit8 v4, p4, -0x8

    if-le v3, v4, :cond_f

    move v3, v4

    :cond_f
    const/4 v5, 0x0

    move v11, v5

    :goto_11
    if-lt v11, v0, :cond_16

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_16
    shl-int/lit8 v5, v11, 0x3

    add-int/lit8 v12, p3, -0x8

    if-le v5, v12, :cond_1d

    move v5, v12

    :cond_1d
    move v13, v5

    add-int/lit8 v5, v0, -0x3

    const/4 v6, 0x2

    invoke-static {v11, v6, v5}, Lcom/google/zxing/common/HybridBinarizer;->cap(III)I

    move-result v14

    add-int/lit8 v5, v1, -0x3

    invoke-static {v2, v6, v5}, Lcom/google/zxing/common/HybridBinarizer;->cap(III)I

    move-result v15

    const/4 v5, 0x0

    const/4 v7, -0x2

    move/from16 v16, v5

    :goto_2f
    if-le v7, v6, :cond_43

    div-int/lit8 v17, v16, 0x19

    move-object/from16 v5, p0

    move v6, v13

    move v7, v3

    move/from16 v8, v17

    move/from16 v9, p3

    move-object/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/common/HybridBinarizer;->thresholdBlock([BIIIILcom/google/zxing/common/BitMatrix;)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_11

    :cond_43
    add-int v5, v15, v7

    aget-object v5, p5, v5

    add-int/lit8 v9, v14, -0x2

    aget v9, v5, v9

    add-int/lit8 v10, v14, -0x1

    aget v10, v5, v10

    add-int/2addr v9, v10

    aget v10, v5, v14

    add-int/2addr v9, v10

    add-int/lit8 v10, v14, 0x1

    aget v10, v5, v10

    add-int/2addr v9, v10

    add-int/lit8 v10, v14, 0x2

    aget v10, v5, v10

    add-int/2addr v9, v10

    add-int v16, v16, v9

    add-int/lit8 v7, v7, 0x1

    goto :goto_2f
.end method

.method private static cap(III)I
    .registers 4

    if-ge p0, p1, :cond_4

    move v0, p1

    goto :goto_9

    :cond_4
    if-le p0, p2, :cond_8

    move v0, p2

    goto :goto_9

    :cond_8
    move v0, p0

    :goto_9
    return v0
.end method

.method private static thresholdBlock([BIIIILcom/google/zxing/common/BitMatrix;)V
    .registers 12

    const/4 v0, 0x0

    mul-int v1, p2, p4

    add-int/2addr v1, p1

    :goto_4
    const/16 v2, 0x8

    if-lt v0, v2, :cond_9

    return-void

    :cond_9
    const/4 v3, 0x0

    :goto_a
    if-lt v3, v2, :cond_10

    add-int/lit8 v0, v0, 0x1

    add-int/2addr v1, p4

    goto :goto_4

    :cond_10
    add-int v4, v1, v3

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    if-gt v4, p3, :cond_1f

    add-int v4, p1, v3

    add-int v5, p2, v0

    invoke-virtual {p5, v4, v5}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_1f
    add-int/lit8 v3, v3, 0x1

    goto :goto_a
.end method


# virtual methods
.method public createBinarizer(Lcom/google/zxing/LuminanceSource;)Lcom/google/zxing/Binarizer;
    .registers 3

    new-instance v0, Lcom/google/zxing/common/HybridBinarizer;

    invoke-direct {v0, p1}, Lcom/google/zxing/common/HybridBinarizer;-><init>(Lcom/google/zxing/LuminanceSource;)V

    return-object v0
.end method

.method public getBlackMatrix()Lcom/google/zxing/common/BitMatrix;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    return-object v0

    :cond_7
    invoke-virtual {p0}, Lcom/google/zxing/common/HybridBinarizer;->getLuminanceSource()Lcom/google/zxing/LuminanceSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getWidth()I

    move-result v8

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getHeight()I

    move-result v9

    const/16 v1, 0x28

    if-lt v8, v1, :cond_46

    if-lt v9, v1, :cond_46

    invoke-virtual {v0}, Lcom/google/zxing/LuminanceSource;->getMatrix()[B

    move-result-object v10

    shr-int/lit8 v1, v8, 0x3

    and-int/lit8 v2, v8, 0x7

    if-eqz v2, :cond_25

    add-int/lit8 v1, v1, 0x1

    :cond_25
    move v11, v1

    shr-int/lit8 v1, v9, 0x3

    and-int/lit8 v2, v9, 0x7

    if-eqz v2, :cond_2e

    add-int/lit8 v1, v1, 0x1

    :cond_2e
    move v12, v1

    invoke-static {v10, v11, v12, v8, v9}, Lcom/google/zxing/common/HybridBinarizer;->calculateBlackPoints([BIIII)[[I

    move-result-object v13

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v8, v9}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    move-object v14, v1

    move-object v1, v10

    move v2, v11

    move v3, v12

    move v4, v8

    move v5, v9

    move-object v6, v13

    move-object v7, v14

    invoke-static/range {v1 .. v7}, Lcom/google/zxing/common/HybridBinarizer;->calculateThresholdForBlock([BIIII[[ILcom/google/zxing/common/BitMatrix;)V

    iput-object v14, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    goto :goto_4c

    :cond_46
    invoke-super {p0}, Lcom/google/zxing/common/GlobalHistogramBinarizer;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    :goto_4c
    iget-object v1, p0, Lcom/google/zxing/common/HybridBinarizer;->matrix:Lcom/google/zxing/common/BitMatrix;

    return-object v1
.end method
