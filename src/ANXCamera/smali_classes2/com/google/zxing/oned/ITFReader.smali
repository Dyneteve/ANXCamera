.class public final Lcom/google/zxing/oned/ITFReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "ITFReader.java"


# static fields
.field private static final DEFAULT_ALLOWED_LENGTHS:[I

.field private static final END_PATTERN_REVERSED:[I

.field private static final MAX_AVG_VARIANCE:F = 0.38f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.78f

.field private static final N:I = 0x1

.field static final PATTERNS:[[I

.field private static final START_PATTERN:[I

.field private static final W:I = 0x3


# instance fields
.field private narrowLineWidth:I


# direct methods
.method static constructor <clinit>()V
    .registers 6

    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_6e

    sput-object v1, Lcom/google/zxing/oned/ITFReader;->DEFAULT_ALLOWED_LENGTHS:[I

    const/4 v1, 0x4

    new-array v2, v1, [I

    fill-array-data v2, :array_7c

    sput-object v2, Lcom/google/zxing/oned/ITFReader;->START_PATTERN:[I

    const/4 v2, 0x3

    new-array v3, v2, [I

    fill-array-data v3, :array_88

    sput-object v3, Lcom/google/zxing/oned/ITFReader;->END_PATTERN_REVERSED:[I

    const/16 v3, 0xa

    new-array v3, v3, [[I

    new-array v4, v0, [I

    fill-array-data v4, :array_92

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v4, v0, [I

    fill-array-data v4, :array_a0

    const/4 v5, 0x1

    aput-object v4, v3, v5

    new-array v4, v0, [I

    fill-array-data v4, :array_ae

    const/4 v5, 0x2

    aput-object v4, v3, v5

    new-array v4, v0, [I

    fill-array-data v4, :array_bc

    aput-object v4, v3, v2

    new-array v2, v0, [I

    fill-array-data v2, :array_ca

    aput-object v2, v3, v1

    new-array v1, v0, [I

    fill-array-data v1, :array_d8

    aput-object v1, v3, v0

    new-array v1, v0, [I

    fill-array-data v1, :array_e6

    const/4 v2, 0x6

    aput-object v1, v3, v2

    new-array v1, v0, [I

    fill-array-data v1, :array_f4

    const/4 v2, 0x7

    aput-object v1, v3, v2

    new-array v1, v0, [I

    fill-array-data v1, :array_102

    const/16 v2, 0x8

    aput-object v1, v3, v2

    new-array v0, v0, [I

    fill-array-data v0, :array_110

    const/16 v1, 0x9

    aput-object v0, v3, v1

    sput-object v3, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    return-void

    :array_6e
    .array-data 4
        0x6
        0x8
        0xa
        0xc
        0xe
    .end array-data

    :array_7c
    .array-data 4
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_88
    .array-data 4
        0x1
        0x1
        0x3
    .end array-data

    :array_92
    .array-data 4
        0x1
        0x1
        0x3
        0x3
        0x1
    .end array-data

    :array_a0
    .array-data 4
        0x3
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_ae
    .array-data 4
        0x1
        0x3
        0x1
        0x1
        0x3
    .end array-data

    :array_bc
    .array-data 4
        0x3
        0x3
        0x1
        0x1
        0x1
    .end array-data

    :array_ca
    .array-data 4
        0x1
        0x1
        0x3
        0x1
        0x3
    .end array-data

    :array_d8
    .array-data 4
        0x3
        0x1
        0x3
        0x1
        0x1
    .end array-data

    :array_e6
    .array-data 4
        0x1
        0x3
        0x3
        0x1
        0x1
    .end array-data

    :array_f4
    .array-data 4
        0x1
        0x1
        0x1
        0x3
        0x3
    .end array-data

    :array_102
    .array-data 4
        0x3
        0x1
        0x1
        0x3
        0x1
    .end array-data

    :array_110
    .array-data 4
        0x1
        0x3
        0x1
        0x3
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    return-void
.end method

.method private static decodeDigit([I)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const v0, 0x3ec28f5c    # 0.38f

    const/4 v1, -0x1

    sget-object v2, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    array-length v2, v2

    const/4 v3, 0x0

    :goto_8
    if-lt v3, v2, :cond_12

    if-ltz v1, :cond_d

    return v1

    :cond_d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    :cond_12
    sget-object v4, Lcom/google/zxing/oned/ITFReader;->PATTERNS:[[I

    aget-object v4, v4, v3

    const v5, 0x3f47ae14    # 0.78f

    invoke-static {p0, v4, v5}, Lcom/google/zxing/oned/ITFReader;->patternMatchVariance([I[IF)F

    move-result v5

    cmpg-float v6, v5, v0

    if-gez v6, :cond_23

    move v0, v5

    move v1, v3

    :cond_23
    add-int/lit8 v3, v3, 0x1

    goto :goto_8
.end method

.method private static decodeMiddle(Lcom/google/zxing/common/BitArray;IILjava/lang/StringBuilder;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/16 v0, 0xa

    new-array v0, v0, [I

    const/4 v1, 0x5

    new-array v2, v1, [I

    new-array v3, v1, [I

    :goto_9
    if-lt p1, p2, :cond_c

    return-void

    :cond_c
    invoke-static {p0, p1, v0}, Lcom/google/zxing/oned/ITFReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    const/4 v4, 0x0

    :goto_10
    if-lt v4, v1, :cond_32

    invoke-static {v2}, Lcom/google/zxing/oned/ITFReader;->decodeDigit([I)I

    move-result v4

    const/16 v5, 0x30

    add-int v6, v5, v4

    int-to-char v6, v6

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-static {v3}, Lcom/google/zxing/oned/ITFReader;->decodeDigit([I)I

    move-result v6

    add-int/2addr v5, v6

    int-to-char v4, v5

    invoke-virtual {p3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v5, v0

    const/4 v4, 0x0

    :goto_29
    if-lt v4, v5, :cond_2c

    goto :goto_9

    :cond_2c
    aget v7, v0, v4

    add-int/2addr p1, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    :cond_32
    const/4 v5, 0x2

    mul-int/2addr v5, v4

    aget v6, v0, v5

    aput v6, v2, v4

    add-int/lit8 v6, v5, 0x1

    aget v6, v0, v6

    aput v6, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_10
.end method

.method private static findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    array-length v0, p2

    new-array v1, v0, [I

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, p1

    move v6, p1

    :goto_b
    if-ge v6, v2, :cond_58

    invoke-virtual {p0, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    xor-int/2addr v7, v3

    const/4 v8, 0x1

    if-eqz v7, :cond_1b

    aget v7, v1, v4

    add-int/2addr v7, v8

    aput v7, v1, v4

    goto :goto_55

    :cond_1b
    add-int/lit8 v7, v0, -0x1

    const/4 v9, 0x0

    if-ne v4, v7, :cond_4c

    const v7, 0x3f47ae14    # 0.78f

    invoke-static {v1, p2, v7}, Lcom/google/zxing/oned/ITFReader;->patternMatchVariance([I[IF)F

    move-result v7

    const v10, 0x3ec28f5c    # 0.38f

    cmpg-float v7, v7, v10

    const/4 v10, 0x2

    if-gez v7, :cond_36

    new-array v7, v10, [I

    aput v5, v7, v9

    aput v6, v7, v8

    return-object v7

    :cond_36
    aget v7, v1, v9

    aget v11, v1, v8

    add-int/2addr v7, v11

    add-int/2addr v5, v7

    add-int/lit8 v7, v0, -0x2

    invoke-static {v1, v10, v1, v9, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v7, v0, -0x2

    aput v9, v1, v7

    add-int/lit8 v7, v0, -0x1

    aput v9, v1, v7

    add-int/lit8 v4, v4, -0x1

    goto :goto_4e

    :cond_4c
    add-int/lit8 v4, v4, 0x1

    :goto_4e
    aput v8, v1, v4

    if-eqz v3, :cond_54

    move v8, v9

    nop

    :cond_54
    move v3, v8

    :goto_55
    add-int/lit8 v6, v6, 0x1

    goto :goto_b

    :cond_58
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6
.end method

.method private static skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v1

    if-eq v1, v0, :cond_c

    return v1

    :cond_c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method private validateQuietZone(Lcom/google/zxing/common/BitArray;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget v0, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    mul-int/lit8 v0, v0, 0xa

    if-ge v0, p2, :cond_8

    move v1, v0

    goto :goto_9

    :cond_8
    move v1, p2

    :goto_9
    move v0, v1

    add-int/lit8 v1, p2, -0x1

    :goto_c
    if-lez v0, :cond_1d

    if-gez v1, :cond_11

    goto :goto_1d

    :cond_11
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_18

    goto :goto_1d

    :cond_18
    add-int/lit8 v0, v0, -0x1

    add-int/lit8 v1, v1, -0x1

    goto :goto_c

    :cond_1d
    :goto_1d
    if-nez v0, :cond_20

    return-void

    :cond_20
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method


# virtual methods
.method decodeEnd(Lcom/google/zxing/common/BitArray;)[I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    :try_start_3
    invoke-static {p1}, Lcom/google/zxing/oned/ITFReader;->skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I

    move-result v0

    sget-object v1, Lcom/google/zxing/oned/ITFReader;->END_PATTERN_REVERSED:[I

    invoke-static {p1, v0, v1}, Lcom/google/zxing/oned/ITFReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I

    move-result-object v1

    const/4 v2, 0x0

    aget v3, v1, v2

    invoke-direct {p0, p1, v3}, Lcom/google/zxing/oned/ITFReader;->validateQuietZone(Lcom/google/zxing/common/BitArray;I)V

    aget v3, v1, v2

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v4

    const/4 v5, 0x1

    aget v6, v1, v5

    sub-int/2addr v4, v6

    aput v4, v1, v2

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    sub-int/2addr v2, v3

    aput v2, v1, v5
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_2b

    nop

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    return-object v1

    :catchall_2b
    move-exception v0

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->reverse()V

    throw v0
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-virtual {v0, v2}, Lcom/google/zxing/oned/ITFReader;->decodeStart(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v4

    invoke-virtual {v0, v2}, Lcom/google/zxing/oned/ITFReader;->decodeEnd(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    const/16 v7, 0x14

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v7, 0x1

    aget v8, v4, v7

    const/4 v9, 0x0

    aget v10, v5, v9

    invoke-static {v2, v8, v10, v6}, Lcom/google/zxing/oned/ITFReader;->decodeMiddle(Lcom/google/zxing/common/BitArray;IILjava/lang/StringBuilder;)V

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    if-eqz v3, :cond_30

    sget-object v11, Lcom/google/zxing/DecodeHintType;->ALLOWED_LENGTHS:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v3, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    move-object v10, v11

    check-cast v10, [I

    :cond_30
    if-nez v10, :cond_34

    sget-object v10, Lcom/google/zxing/oned/ITFReader;->DEFAULT_ALLOWED_LENGTHS:[I

    :cond_34
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    array-length v14, v10

    move v15, v13

    move v13, v9

    :goto_3d
    if-lt v13, v14, :cond_40

    goto :goto_46

    :cond_40
    aget v9, v10, v13

    if-ne v11, v9, :cond_79

    const/4 v12, 0x1

    nop

    :goto_46
    if-nez v12, :cond_4b

    if-le v11, v15, :cond_4b

    const/4 v12, 0x1

    :cond_4b
    if-eqz v12, :cond_74

    new-instance v9, Lcom/google/zxing/Result;

    nop

    nop

    const/4 v14, 0x2

    new-array v14, v14, [Lcom/google/zxing/ResultPoint;

    new-instance v13, Lcom/google/zxing/ResultPoint;

    aget v0, v4, v7

    int-to-float v0, v0

    int-to-float v7, v1

    invoke-direct {v13, v0, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v0, 0x0

    aput-object v13, v14, v0

    new-instance v7, Lcom/google/zxing/ResultPoint;

    aget v0, v5, v0

    int-to-float v0, v0

    int-to-float v13, v1

    invoke-direct {v7, v0, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v7, v14, v16

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->ITF:Lcom/google/zxing/BarcodeFormat;

    const/4 v7, 0x0

    invoke-direct {v9, v8, v7, v14, v0}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v9

    :cond_74
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :cond_79
    move/from16 v16, v7

    const/4 v0, 0x0

    if-le v9, v15, :cond_80

    move v7, v9

    move v15, v7

    :cond_80
    add-int/lit8 v13, v13, 0x1

    move v9, v0

    move/from16 v7, v16

    move-object/from16 v0, p0

    goto :goto_3d
.end method

.method decodeStart(Lcom/google/zxing/common/BitArray;)[I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/zxing/oned/ITFReader;->skipWhiteSpace(Lcom/google/zxing/common/BitArray;)I

    move-result v0

    sget-object v1, Lcom/google/zxing/oned/ITFReader;->START_PATTERN:[I

    invoke-static {p1, v0, v1}, Lcom/google/zxing/oned/ITFReader;->findGuardPattern(Lcom/google/zxing/common/BitArray;I[I)[I

    move-result-object v1

    const/4 v2, 0x1

    aget v2, v1, v2

    const/4 v3, 0x0

    aget v4, v1, v3

    sub-int/2addr v2, v4

    div-int/lit8 v2, v2, 0x4

    iput v2, p0, Lcom/google/zxing/oned/ITFReader;->narrowLineWidth:I

    aget v2, v1, v3

    invoke-direct {p0, p1, v2}, Lcom/google/zxing/oned/ITFReader;->validateQuietZone(Lcom/google/zxing/common/BitArray;I)V

    return-object v1
.end method
