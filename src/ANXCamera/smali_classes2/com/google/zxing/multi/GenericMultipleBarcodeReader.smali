.class public final Lcom/google/zxing/multi/GenericMultipleBarcodeReader;
.super Ljava/lang/Object;
.source "GenericMultipleBarcodeReader.java"

# interfaces
.implements Lcom/google/zxing/multi/MultipleBarcodeReader;


# static fields
.field private static final MAX_DEPTH:I = 0x4

.field private static final MIN_DIMENSION_TO_RECUR:I = 0x64


# instance fields
.field private final delegate:Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>(Lcom/google/zxing/Reader;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;

    return-void
.end method

.method private doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V
    .registers 34
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;III)V"
        }
    .end annotation

    move-object/from16 v1, p1

    move/from16 v9, p4

    move/from16 v10, p5

    move/from16 v11, p6

    const/4 v0, 0x4

    if-le v11, v0, :cond_c

    return-void

    :cond_c
    move-object/from16 v12, p0

    :try_start_e
    iget-object v0, v12, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->delegate:Lcom/google/zxing/Reader;
    :try_end_10
    .catch Lcom/google/zxing/ReaderException; {:try_start_e .. :try_end_10} :catch_16c

    move-object/from16 v13, p2

    :try_start_12
    invoke-interface {v0, v1, v13}, Lcom/google/zxing/Reader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0
    :try_end_16
    .catch Lcom/google/zxing/ReaderException; {:try_start_12 .. :try_end_16} :catch_16a

    nop

    nop

    const/4 v2, 0x0

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_25

    :goto_23
    move v14, v2

    goto :goto_3b

    :cond_25
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/Result;

    invoke-virtual {v4}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_166

    const/4 v2, 0x1

    goto :goto_23

    :goto_3b
    if-nez v14, :cond_47

    invoke-static {v0, v9, v10}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;

    move-result-object v2

    move-object/from16 v15, p3

    invoke-interface {v15, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_49

    :cond_47
    move-object/from16 v15, p3

    :goto_49
    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    if-eqz v8, :cond_15f

    array-length v2, v8

    if-nez v2, :cond_5a

    move-object/from16 v16, v0

    move-object/from16 v24, v8

    move/from16 v17, v14

    goto/16 :goto_165

    :cond_5a
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v6

    int-to-float v2, v7

    int-to-float v3, v6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object/from16 v16, v0

    array-length v0, v8

    move/from16 v17, v14

    const/4 v14, 0x0

    move/from16 v18, v5

    move v5, v2

    move v2, v14

    move/from16 v26, v4

    move v4, v3

    move/from16 v3, v26

    :goto_75
    if-lt v2, v0, :cond_11c

    const/high16 v0, 0x42c80000    # 100.0f

    cmpl-float v2, v5, v0

    if-lez v2, :cond_9e

    float-to-int v2, v5

    invoke-virtual {v1, v14, v14, v2, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v19

    nop

    nop

    add-int/lit8 v20, v11, 0x1

    move-object v2, v12

    move/from16 v21, v3

    move-object/from16 v3, v19

    move v14, v4

    move-object v4, v13

    move/from16 v19, v5

    move-object v5, v15

    move/from16 v22, v6

    move v6, v9

    move/from16 v23, v7

    move v7, v10

    move-object/from16 v24, v8

    move/from16 v8, v20

    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_a9

    :cond_9e
    move/from16 v21, v3

    move v14, v4

    move/from16 v19, v5

    move/from16 v22, v6

    move/from16 v23, v7

    move-object/from16 v24, v8

    :goto_a9
    cmpl-float v0, v14, v0

    if-lez v0, :cond_c6

    float-to-int v0, v14

    move/from16 v8, v23

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v8, v0}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    nop

    nop

    add-int/lit8 v0, v11, 0x1

    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move v6, v9

    move v7, v10

    move/from16 v25, v14

    move v14, v8

    move v8, v0

    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_ca

    :cond_c6
    move/from16 v25, v14

    move/from16 v14, v23

    :goto_ca
    add-int/lit8 v7, v14, -0x64

    int-to-float v0, v7

    move/from16 v8, v21

    cmpg-float v0, v8, v0

    if-gez v0, :cond_f2

    float-to-int v0, v8

    float-to-int v2, v8

    sub-int v7, v14, v2

    move/from16 v6, v22

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2, v7, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    nop

    float-to-int v0, v8

    add-int/2addr v0, v9

    add-int/lit8 v20, v11, 0x1

    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move/from16 v21, v6

    move v6, v0

    move v7, v10

    move/from16 v22, v8

    move/from16 v8, v20

    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_f6

    :cond_f2
    move/from16 v21, v22

    move/from16 v22, v8

    :goto_f6
    add-int/lit8 v6, v21, -0x64

    int-to-float v0, v6

    move/from16 v8, v18

    cmpg-float v0, v8, v0

    if-gez v0, :cond_119

    float-to-int v0, v8

    float-to-int v2, v8

    sub-int v6, v21, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v0, v14, v6}, Lcom/google/zxing/BinaryBitmap;->crop(IIII)Lcom/google/zxing/BinaryBitmap;

    move-result-object v3

    nop

    float-to-int v0, v8

    add-int v7, v10, v0

    add-int/lit8 v0, v11, 0x1

    move-object v2, v12

    move-object v4, v13

    move-object v5, v15

    move v6, v9

    move/from16 v18, v8

    move v8, v0

    invoke-direct/range {v2 .. v8}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    goto :goto_11b

    :cond_119
    move/from16 v18, v8

    :goto_11b
    return-void

    :cond_11c
    move/from16 v22, v3

    move/from16 v25, v4

    move/from16 v19, v5

    move/from16 v21, v6

    move-object/from16 v24, v8

    move v3, v14

    move v14, v7

    aget-object v4, v24, v2

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    cmpg-float v7, v5, v19

    if-gez v7, :cond_138

    move v7, v5

    goto :goto_13a

    :cond_138
    move/from16 v7, v19

    :goto_13a
    cmpg-float v8, v6, v25

    if-gez v8, :cond_140

    move v8, v6

    goto :goto_142

    :cond_140
    move/from16 v8, v25

    :goto_142
    cmpl-float v19, v5, v22

    if-lez v19, :cond_14a

    move/from16 v19, v5

    move/from16 v22, v19

    :cond_14a
    cmpl-float v19, v6, v18

    if-lez v19, :cond_151

    move v4, v6

    move/from16 v18, v4

    :cond_151
    add-int/lit8 v2, v2, 0x1

    move v5, v7

    move v4, v8

    move v7, v14

    move/from16 v6, v21

    move-object/from16 v8, v24

    move v14, v3

    move/from16 v3, v22

    goto/16 :goto_75

    :cond_15f
    move-object/from16 v16, v0

    move-object/from16 v24, v8

    move/from16 v17, v14

    :goto_165
    return-void

    :cond_166
    move-object/from16 v15, p3

    goto/16 :goto_1d

    :catch_16a
    move-exception v0

    goto :goto_16f

    :catch_16c
    move-exception v0

    move-object/from16 v13, p2

    :goto_16f
    move-object/from16 v15, p3

    return-void
.end method

.method private static translateResultPoints(Lcom/google/zxing/Result;II)Lcom/google/zxing/Result;
    .registers 11

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    if-nez v0, :cond_7

    return-object p0

    :cond_7
    array-length v1, v0

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    const/4 v2, 0x0

    :goto_b
    array-length v3, v0

    if-lt v2, v3, :cond_27

    new-instance v2, Lcom/google/zxing/Result;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v4

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v5

    invoke-direct {v2, v3, v4, v1, v5}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    return-object v2

    :cond_27
    aget-object v3, v0, v2

    new-instance v4, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    int-to-float v6, p1

    add-float/2addr v5, v6

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    int-to-float v7, p2

    add-float/2addr v6, v7

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_b
.end method


# virtual methods
.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v0

    invoke-direct/range {v1 .. v7}, Lcom/google/zxing/multi/GenericMultipleBarcodeReader;->doDecodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Ljava/util/List;III)V

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lcom/google/zxing/Result;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/google/zxing/Result;

    return-object v1

    :cond_22
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method
