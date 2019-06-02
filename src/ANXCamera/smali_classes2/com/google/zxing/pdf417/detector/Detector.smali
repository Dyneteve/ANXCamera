.class public final Lcom/google/zxing/pdf417/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# static fields
.field private static final BARCODE_MIN_HEIGHT:I = 0xa

.field private static final INDEXES_START_PATTERN:[I

.field private static final INDEXES_STOP_PATTERN:[I

.field private static final MAX_AVG_VARIANCE:F = 0.42f

.field private static final MAX_INDIVIDUAL_VARIANCE:F = 0.8f

.field private static final MAX_PATTERN_DRIFT:I = 0x5

.field private static final MAX_PIXEL_DRIFT:I = 0x3

.field private static final ROW_STEP:I = 0x5

.field private static final SKIPPED_ROW_COUNT_MAX:I = 0x19

.field private static final START_PATTERN:[I

.field private static final STOP_PATTERN:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x4

    new-array v1, v0, [I

    const/4 v2, 0x1

    aput v0, v1, v2

    const/4 v3, 0x2

    aput v2, v1, v3

    const/4 v2, 0x3

    const/4 v3, 0x5

    aput v3, v1, v2

    sput-object v1, Lcom/google/zxing/pdf417/detector/Detector;->INDEXES_START_PATTERN:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_2a

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->INDEXES_STOP_PATTERN:[I

    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_36

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN:[I

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_4a

    sput-object v0, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN:[I

    return-void

    nop

    :array_2a
    .array-data 4
        0x6
        0x2
        0x7
        0x3
    .end array-data

    :array_36
    .array-data 4
        0x8
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x3
    .end array-data

    :array_4a
    .array-data 4
        0x7
        0x1
        0x1
        0x3
        0x1
        0x1
        0x1
        0x2
        0x1
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static copyToResult([Lcom/google/zxing/ResultPoint;[Lcom/google/zxing/ResultPoint;[I)V
    .registers 6

    const/4 v0, 0x0

    :goto_1
    array-length v1, p2

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    aget v1, p2, v0

    aget-object v2, p1, v0

    aput-object v2, p0, v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method public static detect(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;Z)Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;Z)",
            "Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/google/zxing/pdf417/detector/Detector;->detect(ZLcom/google/zxing/common/BitMatrix;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->clone()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->rotate180()V

    invoke-static {p2, v0}, Lcom/google/zxing/pdf417/detector/Detector;->detect(ZLcom/google/zxing/common/BitMatrix;)Ljava/util/List;

    move-result-object v1

    :cond_19
    new-instance v2, Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;

    invoke-direct {v2, v0, v1}, Lcom/google/zxing/pdf417/detector/PDF417DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;Ljava/util/List;)V

    return-object v2
.end method

.method private static detect(ZLcom/google/zxing/common/BitMatrix;)Ljava/util/List;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/google/zxing/common/BitMatrix;",
            ")",
            "Ljava/util/List<",
            "[",
            "Lcom/google/zxing/ResultPoint;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_8
    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    if-lt v1, v4, :cond_f

    goto :goto_60

    :cond_f
    invoke-static {p1, v1, v2}, Lcom/google/zxing/pdf417/detector/Detector;->findVertices(Lcom/google/zxing/common/BitMatrix;II)[Lcom/google/zxing/ResultPoint;

    move-result-object v4

    const/4 v5, 0x0

    aget-object v5, v4, v5

    if-nez v5, :cond_59

    const/4 v5, 0x3

    aget-object v6, v4, v5

    if-nez v6, :cond_59

    if-nez v3, :cond_20

    goto :goto_60

    :cond_20
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_26
    :goto_26
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_32

    add-int/lit8 v1, v1, 0x5

    nop

    move v3, v6

    move v2, v7

    goto :goto_8

    :cond_32
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/zxing/ResultPoint;

    const/4 v3, 0x1

    aget-object v9, v2, v3

    if-eqz v9, :cond_49

    int-to-float v9, v1

    aget-object v3, v2, v3

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    invoke-static {v9, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    float-to-int v1, v3

    :cond_49
    aget-object v3, v2, v5

    if-eqz v3, :cond_26

    aget-object v3, v2, v5

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_26

    :cond_59
    const/4 v3, 0x1

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-nez p0, :cond_61

    nop

    :goto_60
    return-object v0

    :cond_61
    const/4 v5, 0x2

    aget-object v6, v4, v5

    if-eqz v6, :cond_75

    aget-object v6, v4, v5

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    float-to-int v2, v6

    aget-object v5, v4, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v1, v5

    goto :goto_8

    :cond_75
    const/4 v5, 0x4

    aget-object v6, v4, v5

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    float-to-int v2, v6

    aget-object v5, v4, v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    float-to-int v1, v5

    goto :goto_8
.end method

.method private static findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I[I)[I
    .registers 25

    move-object/from16 v0, p0

    move/from16 v1, p2

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    array-length v4, v3

    const/4 v5, 0x0

    invoke-static {v3, v5, v4, v5}, Ljava/util/Arrays;->fill([IIII)V

    array-length v4, v2

    move/from16 v6, p4

    move/from16 v7, p1

    const/4 v8, 0x0

    :goto_13
    invoke-virtual {v0, v7, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v9

    if-eqz v9, :cond_26

    if-lez v7, :cond_26

    add-int/lit8 v9, v8, 0x1

    const/4 v10, 0x3

    if-lt v8, v10, :cond_22

    move v8, v9

    goto :goto_26

    :cond_22
    add-int/lit8 v7, v7, -0x1

    move v8, v9

    goto :goto_13

    :cond_26
    :goto_26
    move v9, v7

    const/4 v10, 0x0

    :goto_28
    const v11, 0x3ed70a3d    # 0.42f

    const v12, 0x3f4ccccd    # 0.8f

    const/4 v13, 0x2

    move/from16 v15, p3

    if-lt v9, v15, :cond_4b

    add-int/lit8 v14, v4, -0x1

    if-ne v10, v14, :cond_49

    invoke-static {v3, v2, v12}, Lcom/google/zxing/pdf417/detector/Detector;->patternMatchVariance([I[IF)F

    move-result v12

    cmpg-float v11, v12, v11

    if-gez v11, :cond_49

    new-array v11, v13, [I

    aput v7, v11, v5

    add-int/lit8 v5, v9, -0x1

    const/4 v12, 0x1

    aput v5, v11, v12

    return-object v11

    :cond_49
    const/4 v5, 0x0

    return-object v5

    :cond_4b
    invoke-virtual {v0, v9, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v14

    xor-int v16, v14, v6

    if-eqz v16, :cond_5c

    aget v11, v3, v10

    const/4 v12, 0x1

    add-int/2addr v11, v12

    aput v11, v3, v10

    nop

    move v11, v5

    goto :goto_96

    :cond_5c
    add-int/lit8 v5, v4, -0x1

    if-ne v10, v5, :cond_8a

    invoke-static {v3, v2, v12}, Lcom/google/zxing/pdf417/detector/Detector;->patternMatchVariance([I[IF)F

    move-result v5

    cmpg-float v5, v5, v11

    if-gez v5, :cond_71

    new-array v5, v13, [I

    const/4 v11, 0x0

    aput v7, v5, v11

    const/4 v12, 0x1

    aput v9, v5, v12

    return-object v5

    :cond_71
    const/4 v11, 0x0

    const/4 v12, 0x1

    aget v5, v3, v11

    aget v16, v3, v12

    add-int v5, v5, v16

    add-int/2addr v7, v5

    add-int/lit8 v5, v4, -0x2

    invoke-static {v3, v13, v3, v11, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v5, v4, -0x2

    aput v11, v3, v5

    add-int/lit8 v5, v4, -0x1

    aput v11, v3, v5

    add-int/lit8 v10, v10, -0x1

    goto :goto_8d

    :cond_8a
    const/4 v11, 0x0

    add-int/lit8 v10, v10, 0x1

    :goto_8d
    const/4 v12, 0x1

    aput v12, v3, v10

    if-eqz v6, :cond_94

    move v12, v11

    nop

    :cond_94
    move v5, v12

    move v6, v5

    :goto_96
    add-int/lit8 v9, v9, 0x1

    move v5, v11

    goto :goto_28
.end method

.method private static findRowsWithPattern(Lcom/google/zxing/common/BitMatrix;IIII[I)[Lcom/google/zxing/ResultPoint;
    .registers 24

    move/from16 v0, p1

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    const/4 v2, 0x0

    move-object/from16 v10, p5

    array-length v3, v10

    new-array v11, v3, [I

    move/from16 v12, p3

    :goto_d
    const/4 v13, 0x0

    const/4 v14, 0x1

    if-lt v12, v0, :cond_12

    goto :goto_54

    :cond_12
    const/4 v7, 0x0

    move-object/from16 v3, p0

    move/from16 v4, p4

    move v5, v12

    move/from16 v6, p2

    move-object v8, v10

    move-object v9, v11

    invoke-static/range {v3 .. v9}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I[I)[I

    move-result-object v3

    if-eqz v3, :cond_e5

    move-object v15, v3

    :goto_23
    if-gtz v12, :cond_26

    goto :goto_3c

    :cond_26
    add-int/lit8 v12, v12, -0x1

    const/4 v7, 0x0

    move-object/from16 v3, p0

    move/from16 v4, p4

    move v5, v12

    move/from16 v6, p2

    move-object v8, v10

    move-object v9, v11

    invoke-static/range {v3 .. v9}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I[I)[I

    move-result-object v3

    if-eqz v3, :cond_3a

    move-object v15, v3

    goto :goto_23

    :cond_3a
    add-int/2addr v12, v14

    nop

    :goto_3c
    new-instance v3, Lcom/google/zxing/ResultPoint;

    aget v4, v15, v13

    int-to-float v4, v4

    int-to-float v5, v12

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v1, v13

    new-instance v3, Lcom/google/zxing/ResultPoint;

    aget v4, v15, v14

    int-to-float v4, v4

    int-to-float v5, v12

    invoke-direct {v3, v4, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v3, v1, v14

    const/4 v2, 0x1

    nop

    :goto_54
    add-int/lit8 v3, v12, 0x1

    if-eqz v2, :cond_d3

    const/4 v4, 0x0

    const/4 v15, 0x2

    new-array v5, v15, [I

    aget-object v6, v1, v13

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    float-to-int v6, v6

    aput v6, v5, v13

    aget-object v6, v1, v14

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    float-to-int v6, v6

    aput v6, v5, v14

    move v9, v3

    move v8, v4

    move-object/from16 v16, v5

    :goto_72
    if-lt v9, v0, :cond_78

    move v15, v8

    move/from16 v17, v9

    goto :goto_af

    :cond_78
    aget v4, v16, v13

    const/4 v7, 0x0

    move-object/from16 v3, p0

    move v5, v9

    move/from16 v6, p2

    move v15, v8

    move-object v8, v10

    move/from16 v17, v9

    move-object v9, v11

    invoke-static/range {v3 .. v9}, Lcom/google/zxing/pdf417/detector/Detector;->findGuardPattern(Lcom/google/zxing/common/BitMatrix;IIIZ[I[I)[I

    move-result-object v3

    if-eqz v3, :cond_aa

    aget v4, v16, v13

    aget v5, v3, v13

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    const/4 v5, 0x5

    if-ge v4, v5, :cond_aa

    aget v4, v16, v14

    aget v6, v3, v14

    sub-int/2addr v4, v6

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-ge v4, v5, :cond_aa

    move-object v4, v3

    const/4 v5, 0x0

    nop

    move-object/from16 v16, v4

    move v8, v5

    const/4 v5, 0x2

    goto :goto_cf

    :cond_aa
    const/16 v4, 0x19

    if-le v15, v4, :cond_cc

    nop

    :goto_af
    add-int/lit8 v8, v15, 0x1

    sub-int v3, v17, v8

    new-instance v4, Lcom/google/zxing/ResultPoint;

    aget v5, v16, v13

    int-to-float v5, v5

    int-to-float v6, v3

    invoke-direct {v4, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v5, 0x2

    aput-object v4, v1, v5

    const/4 v4, 0x3

    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget v6, v16, v14

    int-to-float v6, v6

    int-to-float v7, v3

    invoke-direct {v5, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v5, v1, v4

    goto :goto_d3

    :cond_cc
    const/4 v5, 0x2

    add-int/lit8 v8, v15, 0x1

    :goto_cf
    add-int/lit8 v9, v17, 0x1

    move v15, v5

    goto :goto_72

    :cond_d3
    :goto_d3
    sub-int v4, v3, v12

    const/16 v5, 0xa

    if-ge v4, v5, :cond_e4

    const/4 v4, 0x0

    :goto_da
    array-length v5, v1

    if-lt v4, v5, :cond_de

    goto :goto_e4

    :cond_de
    const/4 v5, 0x0

    aput-object v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_da

    :cond_e4
    :goto_e4
    return-object v1

    :cond_e5
    add-int/lit8 v12, v12, 0x5

    goto/16 :goto_d
.end method

.method private static findVertices(Lcom/google/zxing/common/BitMatrix;II)[Lcom/google/zxing/ResultPoint;
    .registers 12

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v6

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v7

    const/16 v0, 0x8

    new-array v8, v0, [Lcom/google/zxing/ResultPoint;

    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->START_PATTERN:[I

    move-object v0, p0

    move v1, v6

    move v2, v7

    move v3, p1

    move v4, p2

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findRowsWithPattern(Lcom/google/zxing/common/BitMatrix;IIII[I)[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/pdf417/detector/Detector;->INDEXES_START_PATTERN:[I

    invoke-static {v8, v0, v1}, Lcom/google/zxing/pdf417/detector/Detector;->copyToResult([Lcom/google/zxing/ResultPoint;[Lcom/google/zxing/ResultPoint;[I)V

    const/4 v0, 0x4

    aget-object v1, v8, v0

    if-eqz v1, :cond_2f

    aget-object v1, v8, v0

    invoke-virtual {v1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    float-to-int p2, v1

    aget-object v0, v8, v0

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int p1, v0

    :cond_2f
    sget-object v5, Lcom/google/zxing/pdf417/detector/Detector;->STOP_PATTERN:[I

    move-object v0, p0

    move v1, v6

    move v2, v7

    move v3, p1

    move v4, p2

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/detector/Detector;->findRowsWithPattern(Lcom/google/zxing/common/BitMatrix;IIII[I)[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/pdf417/detector/Detector;->INDEXES_STOP_PATTERN:[I

    invoke-static {v8, v0, v1}, Lcom/google/zxing/pdf417/detector/Detector;->copyToResult([Lcom/google/zxing/ResultPoint;[Lcom/google/zxing/ResultPoint;[I)V

    return-object v8
.end method

.method private static patternMatchVariance([I[IF)F
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
