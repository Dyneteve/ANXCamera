.class public abstract Lcom/google/zxing/oned/OneDReader;
.super Ljava/lang/Object;
.source "OneDReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private doDecode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p2

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getWidth()I

    move-result v1

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v2

    new-instance v3, Lcom/google/zxing/common/BitArray;

    invoke-direct {v3, v1}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    shr-int/lit8 v4, v2, 0x1

    const/4 v6, 0x1

    if-eqz v0, :cond_1e

    sget-object v7, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v0, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1e

    move v7, v6

    goto :goto_1f

    :cond_1e
    const/4 v7, 0x0

    :goto_1f
    if-eqz v7, :cond_24

    const/16 v8, 0x8

    goto :goto_25

    :cond_24
    const/4 v8, 0x5

    :goto_25
    shr-int v8, v2, v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v8

    if-eqz v7, :cond_2f

    move v9, v2

    goto :goto_31

    :cond_2f
    const/16 v9, 0xf

    :goto_31
    const/4 v10, 0x0

    move-object v11, v3

    move-object v3, v0

    :goto_34
    if-ge v10, v9, :cond_146

    add-int/lit8 v0, v10, 0x1

    const/4 v12, 0x2

    div-int/lit8 v13, v0, 0x2

    and-int/lit8 v0, v10, 0x1

    if-nez v0, :cond_41

    move v0, v6

    goto :goto_42

    :cond_41
    const/4 v0, 0x0

    :goto_42
    move v14, v0

    if-eqz v14, :cond_47

    move v0, v13

    goto :goto_48

    :cond_47
    neg-int v0, v13

    :goto_48
    mul-int/2addr v0, v8

    add-int v15, v4, v0

    if-ltz v15, :cond_146

    if-ge v15, v2, :cond_13d

    move-object/from16 v5, p1

    :try_start_51
    invoke-virtual {v5, v15, v11}, Lcom/google/zxing/BinaryBitmap;->getBlackRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;

    move-result-object v0
    :try_end_55
    .catch Lcom/google/zxing/NotFoundException; {:try_start_51 .. :try_end_55} :catch_126

    move-object v11, v0

    nop

    const/4 v0, 0x0

    move-object/from16 v21, v3

    move v3, v0

    move-object/from16 v0, v21

    :goto_5d
    if-lt v3, v12, :cond_6c

    move-object/from16 v12, p0

    move-object v3, v0

    move/from16 v20, v1

    move/from16 v17, v2

    move/from16 v18, v4

    const/16 v16, 0x0

    goto/16 :goto_133

    :cond_6c
    if-ne v3, v6, :cond_8d

    invoke-virtual {v11}, Lcom/google/zxing/common/BitArray;->reverse()V

    if-eqz v0, :cond_8d

    sget-object v12, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v0, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8d

    new-instance v12, Ljava/util/EnumMap;

    const-class v6, Lcom/google/zxing/DecodeHintType;

    invoke-direct {v12, v6}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    move-object v6, v12

    invoke-interface {v6, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    sget-object v12, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v6, v12}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v0, v6

    goto :goto_8e

    :cond_8d
    move-object v6, v0

    :goto_8e
    move-object/from16 v12, p0

    :try_start_90
    invoke-virtual {v12, v15, v11, v6}, Lcom/google/zxing/oned/OneDReader;->decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0
    :try_end_94
    .catch Lcom/google/zxing/ReaderException; {:try_start_90 .. :try_end_94} :catch_10b

    move/from16 v17, v2

    const/4 v2, 0x1

    if-ne v3, v2, :cond_104

    :try_start_99
    sget-object v2, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;
    :try_end_9b
    .catch Lcom/google/zxing/ReaderException; {:try_start_99 .. :try_end_9b} :catch_f9

    move/from16 v18, v4

    const/16 v4, 0xb4

    :try_start_9f
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    if-eqz v2, :cond_eb

    new-instance v4, Lcom/google/zxing/ResultPoint;
    :try_end_ae
    .catch Lcom/google/zxing/ReaderException; {:try_start_9f .. :try_end_ae} :catch_f0

    int-to-float v5, v1

    move-object/from16 v19, v6

    const/16 v16, 0x0

    :try_start_b3
    aget-object v6, v2, v16

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float/2addr v5, v6

    const/high16 v6, 0x3f800000    # 1.0f

    sub-float/2addr v5, v6

    aget-object v6, v2, v16

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v2, v16

    new-instance v4, Lcom/google/zxing/ResultPoint;
    :try_end_ca
    .catch Lcom/google/zxing/ReaderException; {:try_start_b3 .. :try_end_ca} :catch_e6

    int-to-float v5, v1

    move/from16 v20, v1

    const/4 v6, 0x1

    :try_start_ce
    aget-object v1, v2, v6

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    sub-float/2addr v5, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v5, v1

    aget-object v1, v2, v6

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-direct {v4, v5, v1}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v4, v2, v6
    :try_end_e3
    .catch Lcom/google/zxing/ReaderException; {:try_start_ce .. :try_end_e3} :catch_e4

    goto :goto_10a

    :catch_e4
    move-exception v0

    goto :goto_117

    :catch_e6
    move-exception v0

    move/from16 v20, v1

    const/4 v6, 0x1

    goto :goto_117

    :cond_eb
    move/from16 v20, v1

    move-object/from16 v19, v6

    goto :goto_10a

    :catch_f0
    move-exception v0

    move/from16 v20, v1

    move-object/from16 v19, v6

    const/4 v6, 0x1

    const/16 v16, 0x0

    goto :goto_117

    :catch_f9
    move-exception v0

    move/from16 v20, v1

    move/from16 v18, v4

    move-object/from16 v19, v6

    const/4 v6, 0x1

    const/16 v16, 0x0

    goto :goto_117

    :cond_104
    move/from16 v20, v1

    move/from16 v18, v4

    move-object/from16 v19, v6

    :goto_10a
    return-object v0

    :catch_10b
    move-exception v0

    move/from16 v20, v1

    move/from16 v17, v2

    move/from16 v18, v4

    move-object/from16 v19, v6

    const/4 v6, 0x1

    const/16 v16, 0x0

    :goto_117
    add-int/lit8 v3, v3, 0x1

    move/from16 v2, v17

    move/from16 v4, v18

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-object/from16 v5, p1

    const/4 v12, 0x2

    goto/16 :goto_5d

    :catch_126
    move-exception v0

    move-object/from16 v12, p0

    move/from16 v20, v1

    move/from16 v17, v2

    move/from16 v18, v4

    const/16 v16, 0x0

    move-object v1, v0

    nop

    :goto_133
    add-int/lit8 v10, v10, 0x1

    move/from16 v2, v17

    move/from16 v4, v18

    move/from16 v1, v20

    goto/16 :goto_34

    :cond_13d
    move-object/from16 v12, p0

    move/from16 v20, v1

    move/from16 v17, v2

    move/from16 v18, v4

    goto :goto_14e

    :cond_146
    move-object/from16 v12, p0

    move/from16 v20, v1

    move/from16 v17, v2

    move/from16 v18, v4

    :goto_14e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method protected static patternMatchVariance([I[IF)F
    .registers 14

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_4
    if-lt v3, v0, :cond_33

    const/high16 v4, 0x7f800000    # Float.POSITIVE_INFINITY

    if-ge v1, v2, :cond_b

    return v4

    :cond_b
    int-to-float v3, v1

    int-to-float v5, v2

    div-float v5, v3, v5

    mul-float v6, p2, v5

    const/4 p2, 0x0

    const/4 v3, 0x0

    :goto_13
    if-lt v3, v0, :cond_19

    int-to-float v3, v1

    div-float v3, p2, v3

    return v3

    :cond_19
    aget v7, p0, v3

    aget v8, p1, v3

    int-to-float v8, v8

    mul-float/2addr v8, v5

    int-to-float v9, v7

    cmpl-float v9, v9, v8

    if-lez v9, :cond_27

    int-to-float v9, v7

    sub-float/2addr v9, v8

    goto :goto_2a

    :cond_27
    int-to-float v9, v7

    sub-float v9, v8, v9

    :goto_2a
    cmpl-float v10, v9, v6

    if-lez v10, :cond_2f

    return v4

    :cond_2f
    add-float/2addr p2, v9

    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_33
    aget v4, p0, v3

    add-int/2addr v1, v4

    aget v4, p1, v3

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method

.method protected static recordPattern(Lcom/google/zxing/common/BitArray;I[I)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    array-length v0, p2

    const/4 v1, 0x0

    invoke-static {p2, v1, v0, v1}, Ljava/util/Arrays;->fill([IIII)V

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ge p1, v2, :cond_42

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    const/4 v4, 0x1

    xor-int/2addr v3, v4

    const/4 v5, 0x0

    move v6, p1

    :goto_13
    if-lt v6, v2, :cond_16

    goto :goto_28

    :cond_16
    invoke-virtual {p0, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    xor-int/2addr v7, v3

    if-eqz v7, :cond_23

    aget v7, p2, v5

    add-int/2addr v7, v4

    aput v7, p2, v5

    goto :goto_3f

    :cond_23
    add-int/lit8 v5, v5, 0x1

    if-ne v5, v0, :cond_37

    nop

    :goto_28
    if-eq v5, v0, :cond_36

    add-int/lit8 v1, v0, -0x1

    if-ne v5, v1, :cond_31

    if-ne v6, v2, :cond_31

    goto :goto_36

    :cond_31
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_36
    :goto_36
    return-void

    :cond_37
    aput v4, p2, v5

    if-eqz v3, :cond_3d

    move v7, v1

    goto :goto_3e

    :cond_3d
    move v7, v4

    :goto_3e
    move v3, v7

    :goto_3f
    add-int/lit8 v6, v6, 0x1

    goto :goto_13

    :cond_42
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method protected static recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    array-length v0, p2

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v1

    :cond_5
    :goto_5
    if-lez p1, :cond_1b

    if-gez v0, :cond_a

    goto :goto_1b

    :cond_a
    add-int/lit8 p1, p1, -0x1

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eq v2, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    if-eqz v1, :cond_18

    const/4 v2, 0x0

    goto :goto_19

    :cond_18
    const/4 v2, 0x1

    :goto_19
    move v1, v2

    goto :goto_5

    :cond_1b
    :goto_1b
    if-gez v0, :cond_23

    add-int/lit8 v2, p1, 0x1

    invoke-static {p0, v2, p2}, Lcom/google/zxing/oned/OneDReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    return-void

    :cond_23
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/oned/OneDReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/oned/OneDReader;->doDecode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0
    :try_end_4
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_4} :catch_5

    return-object v0

    :catch_5
    move-exception v0

    if-eqz p2, :cond_12

    sget-object v1, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_12

    const/4 v1, 0x1

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    if-eqz v1, :cond_78

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->isRotateSupported()Z

    move-result v2

    if-eqz v2, :cond_78

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->rotateCounterClockwise()Lcom/google/zxing/BinaryBitmap;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/google/zxing/oned/OneDReader;->doDecode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v4

    const/16 v5, 0x10e

    if-eqz v4, :cond_44

    sget-object v6, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_44

    nop

    sget-object v6, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v6, v5

    nop

    rem-int/lit16 v5, v6, 0x168

    :cond_44
    sget-object v6, Lcom/google/zxing/ResultMetadataType;->ORIENTATION:Lcom/google/zxing/ResultMetadataType;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    invoke-virtual {v3}, Lcom/google/zxing/Result;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    if-eqz v6, :cond_77

    invoke-virtual {v2}, Lcom/google/zxing/BinaryBitmap;->getHeight()I

    move-result v7

    const/4 v8, 0x0

    :goto_58
    array-length v9, v6

    if-lt v8, v9, :cond_5c

    goto :goto_77

    :cond_5c
    new-instance v9, Lcom/google/zxing/ResultPoint;

    int-to-float v10, v7

    aget-object v11, v6, v8

    invoke-virtual {v11}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v11

    sub-float/2addr v10, v11

    const/high16 v11, 0x3f800000    # 1.0f

    sub-float/2addr v10, v11

    aget-object v11, v6, v8

    invoke-virtual {v11}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v9, v6, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_58

    :cond_77
    :goto_77
    return-object v3

    :cond_78
    throw v0
.end method

.method public abstract decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
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
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation
.end method

.method public reset()V
    .registers 1

    return-void
.end method
