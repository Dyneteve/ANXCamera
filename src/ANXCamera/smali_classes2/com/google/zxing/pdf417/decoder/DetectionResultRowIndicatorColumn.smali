.class final Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
.super Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
.source "DetectionResultRowIndicatorColumn.java"


# instance fields
.field private final isLeft:Z


# direct methods
.method constructor <init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;Z)V
    .registers 3

    invoke-direct {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    iput-boolean p2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    return-void
.end method

.method private removeIncorrectCodewords([Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)V
    .registers 10

    const/4 v0, 0x0

    :goto_1
    array-length v1, p1

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    aget-object v1, p1, v0

    aget-object v2, p1, v0

    if-nez v2, :cond_c

    goto :goto_57

    :cond_c
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v2

    rem-int/lit8 v2, v2, 0x1e

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v4

    const/4 v5, 0x0

    if-le v3, v4, :cond_20

    aput-object v5, p1, v0

    goto :goto_57

    :cond_20
    iget-boolean v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-nez v4, :cond_26

    add-int/lit8 v3, v3, 0x2

    :cond_26
    rem-int/lit8 v4, v3, 0x3

    packed-switch v4, :pswitch_data_5a

    goto :goto_57

    :pswitch_2c
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v6

    if-eq v4, v6, :cond_57

    aput-object v5, p1, v0

    goto :goto_57

    :pswitch_37
    div-int/lit8 v4, v2, 0x3

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v6

    if-ne v4, v6, :cond_47

    rem-int/lit8 v4, v2, 0x3

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCountLowerPart()I

    move-result v6

    if-eq v4, v6, :cond_57

    :cond_47
    aput-object v5, p1, v0

    goto :goto_57

    :pswitch_4a
    mul-int/lit8 v4, v2, 0x3

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCountUpperPart()I

    move-result v6

    if-eq v4, v6, :cond_57

    aput-object v5, p1, v0

    nop

    :cond_57
    :goto_57
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :pswitch_data_5a
    .packed-switch 0x0
        :pswitch_4a
        :pswitch_37
        :pswitch_2c
    .end packed-switch
.end method


# virtual methods
.method adjustCompleteIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)I
    .registers 22

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->setRowNumbers()V

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->removeIncorrectCodewords([Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)V

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    iget-boolean v4, v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-eqz v4, :cond_1b

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getTopLeft()Lcom/google/zxing/ResultPoint;

    move-result-object v4

    goto :goto_1f

    :cond_1b
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getTopRight()Lcom/google/zxing/ResultPoint;

    move-result-object v4

    :goto_1f
    iget-boolean v5, v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-eqz v5, :cond_28

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getBottomLeft()Lcom/google/zxing/ResultPoint;

    move-result-object v5

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getBottomRight()Lcom/google/zxing/ResultPoint;

    move-result-object v5

    :goto_2c
    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v0, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->imageRowToCodewordIndex(I)I

    move-result v6

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    float-to-int v7, v7

    invoke-virtual {v0, v7}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->imageRowToCodewordIndex(I)I

    move-result v7

    sub-int v8, v7, v6

    int-to-float v8, v8

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v9

    int-to-float v9, v9

    div-float/2addr v8, v9

    const/4 v9, -0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    move v12, v6

    :goto_4b
    if-lt v12, v7, :cond_53

    float-to-double v12, v8

    const-wide/high16 v14, 0x3fe0000000000000L    # 0.5

    add-double/2addr v12, v14

    double-to-int v12, v12

    return v12

    :cond_53
    aget-object v13, v1, v12

    if-nez v13, :cond_59

    goto/16 :goto_ba

    :cond_59
    aget-object v13, v1, v12

    invoke-virtual {v13}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v14

    sub-int/2addr v14, v9

    if-nez v14, :cond_65

    add-int/lit8 v11, v11, 0x1

    goto :goto_ba

    :cond_65
    const/4 v15, 0x1

    if-ne v14, v15, :cond_72

    invoke-static {v10, v11}, Ljava/lang/Math;->max(II)I

    move-result v10

    const/4 v11, 0x1

    invoke-virtual {v13}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v9

    goto :goto_ba

    :cond_72
    const/16 v16, 0x0

    if-ltz v14, :cond_b7

    invoke-virtual {v13}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v15

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v0

    if-ge v15, v0, :cond_b7

    if-le v14, v12, :cond_83

    goto :goto_b7

    :cond_83
    const/4 v0, 0x2

    if-le v10, v0, :cond_8a

    add-int/lit8 v0, v10, -0x2

    mul-int/2addr v0, v14

    goto :goto_8b

    :cond_8a
    move v0, v14

    :goto_8b
    if-lt v0, v12, :cond_90

    const/16 v17, 0x1

    goto :goto_92

    :cond_90
    const/16 v17, 0x0

    :goto_92
    const/16 v18, 0x1

    move/from16 v15, v18

    :goto_96
    if-gt v15, v0, :cond_ab

    if-eqz v17, :cond_9b

    goto :goto_ab

    :cond_9b
    sub-int v18, v12, v15

    aget-object v18, v1, v18

    if-eqz v18, :cond_a4

    const/16 v18, 0x1

    goto :goto_a6

    :cond_a4
    const/16 v18, 0x0

    :goto_a6
    move/from16 v17, v18

    add-int/lit8 v15, v15, 0x1

    goto :goto_96

    :cond_ab
    :goto_ab
    if-eqz v17, :cond_b0

    aput-object v16, v1, v12

    goto :goto_ba

    :cond_b0
    invoke-virtual {v13}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v9

    const/4 v0, 0x1

    move v11, v0

    goto :goto_ba

    :cond_b7
    :goto_b7
    aput-object v16, v1, v12

    nop

    :goto_ba
    add-int/lit8 v12, v12, 0x1

    move-object/from16 v0, p0

    goto :goto_4b
.end method

.method adjustIncompleteIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)I
    .registers 18

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v1

    iget-boolean v2, v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-eqz v2, :cond_f

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getTopLeft()Lcom/google/zxing/ResultPoint;

    move-result-object v2

    goto :goto_13

    :cond_f
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getTopRight()Lcom/google/zxing/ResultPoint;

    move-result-object v2

    :goto_13
    iget-boolean v3, v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-eqz v3, :cond_1c

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getBottomLeft()Lcom/google/zxing/ResultPoint;

    move-result-object v3

    goto :goto_20

    :cond_1c
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getBottomRight()Lcom/google/zxing/ResultPoint;

    move-result-object v3

    :goto_20
    invoke-virtual {v2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-virtual {v0, v4}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->imageRowToCodewordIndex(I)I

    move-result v4

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v0, v5}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->imageRowToCodewordIndex(I)I

    move-result v5

    sub-int v6, v5, v4

    int-to-float v6, v6

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v7

    const/4 v8, -0x1

    const/4 v9, 0x1

    const/4 v10, 0x0

    move v11, v4

    :goto_43
    if-lt v11, v5, :cond_4b

    float-to-double v11, v6

    const-wide/high16 v13, 0x3fe0000000000000L    # 0.5

    add-double/2addr v11, v13

    double-to-int v11, v11

    return v11

    :cond_4b
    aget-object v12, v7, v11

    if-nez v12, :cond_50

    goto :goto_7f

    :cond_50
    aget-object v12, v7, v11

    invoke-virtual {v12}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumberAsRowIndicatorColumn()V

    invoke-virtual {v12}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v13

    sub-int/2addr v13, v8

    if-nez v13, :cond_5f

    add-int/lit8 v10, v10, 0x1

    goto :goto_7f

    :cond_5f
    const/4 v14, 0x1

    if-ne v13, v14, :cond_6c

    invoke-static {v9, v10}, Ljava/lang/Math;->max(II)I

    move-result v9

    const/4 v10, 0x1

    invoke-virtual {v12}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v8

    goto :goto_7f

    :cond_6c
    invoke-virtual {v12}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v14

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v15

    if-lt v14, v15, :cond_7a

    const/4 v14, 0x0

    aput-object v14, v7, v11

    goto :goto_7f

    :cond_7a
    invoke-virtual {v12}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v8

    const/4 v10, 0x1

    :goto_7f
    add-int/lit8 v11, v11, 0x1

    goto :goto_43
.end method

.method getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    .registers 14

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    new-instance v1, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    new-instance v2, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    new-instance v3, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    new-instance v4, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    array-length v5, v0

    const/4 v6, 0x0

    move v7, v6

    :goto_1b
    const/4 v8, 0x1

    if-lt v7, v5, :cond_87

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-eqz v5, :cond_85

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-eqz v5, :cond_85

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-eqz v5, :cond_85

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-eqz v5, :cond_85

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    aget v5, v5, v6

    if-lt v5, v8, :cond_85

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    aget v5, v5, v6

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v7

    aget v7, v7, v6

    add-int/2addr v5, v7

    const/4 v7, 0x3

    if-lt v5, v7, :cond_85

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    aget v5, v5, v6

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v7

    aget v7, v7, v6

    add-int/2addr v5, v7

    const/16 v7, 0x5a

    if-le v5, v7, :cond_64

    goto :goto_85

    :cond_64
    new-instance v5, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v7

    aget v7, v7, v6

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v8

    aget v8, v8, v6

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v9

    aget v9, v9, v6

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v10

    aget v6, v10, v6

    invoke-direct {v5, v7, v8, v9, v6}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;-><init>(IIII)V

    invoke-direct {p0, v0, v5}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->removeIncorrectCodewords([Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)V

    return-object v5

    :cond_85
    :goto_85
    const/4 v5, 0x0

    return-object v5

    :cond_87
    aget-object v9, v0, v7

    if-nez v9, :cond_8c

    goto :goto_bd

    :cond_8c
    invoke-virtual {v9}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumberAsRowIndicatorColumn()V

    invoke-virtual {v9}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v10

    rem-int/lit8 v10, v10, 0x1e

    invoke-virtual {v9}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v11

    iget-boolean v12, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    if-nez v12, :cond_9f

    add-int/lit8 v11, v11, 0x2

    :cond_9f
    rem-int/lit8 v12, v11, 0x3

    packed-switch v12, :pswitch_data_c2

    goto :goto_bd

    :pswitch_a5
    add-int/lit8 v8, v10, 0x1

    invoke-virtual {v1, v8}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    goto :goto_bd

    :pswitch_ab
    div-int/lit8 v8, v10, 0x3

    invoke-virtual {v4, v8}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    rem-int/lit8 v8, v10, 0x3

    invoke-virtual {v3, v8}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    goto :goto_bd

    :pswitch_b6
    mul-int/lit8 v12, v10, 0x3

    add-int/2addr v12, v8

    invoke-virtual {v2, v12}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    nop

    :goto_bd
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_1b

    nop

    :pswitch_data_c2
    .packed-switch 0x0
        :pswitch_b6
        :pswitch_ab
        :pswitch_a5
    .end packed-switch
.end method

.method getRowHeights()[I
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    return-object v1

    :cond_8
    invoke-virtual {p0, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->adjustIncompleteIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)I

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v1

    new-array v1, v1, [I

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_17
    if-lt v4, v3, :cond_1a

    return-object v1

    :cond_1a
    aget-object v5, v2, v4

    if-eqz v5, :cond_31

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v6

    array-length v7, v1

    if-ge v6, v7, :cond_2c

    aget v7, v1, v6

    add-int/lit8 v7, v7, 0x1

    aput v7, v1, v6

    goto :goto_31

    :cond_2c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    :cond_31
    :goto_31
    add-int/lit8 v4, v4, 0x1

    goto :goto_17
.end method

.method isLeft()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    return v0
.end method

.method setRowNumbers()V
    .registers 5

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-lt v2, v1, :cond_9

    return-void

    :cond_9
    aget-object v3, v0, v2

    if-eqz v3, :cond_10

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumberAsRowIndicatorColumn()V

    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "IsLeft: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-super {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
