.class final Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;
.super Lcom/google/zxing/qrcode/detector/FinderPatternFinder;
.source "MultiFinderPatternFinder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;
    }
.end annotation


# static fields
.field private static final DIFF_MODSIZE_CUTOFF:F = 0.5f

.field private static final DIFF_MODSIZE_CUTOFF_PERCENT:F = 0.05f

.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

.field private static final MAX_MODULE_COUNT_PER_EDGE:F = 180.0f

.field private static final MIN_MODULE_COUNT_PER_EDGE:F = 9.0f


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    sput-object v0, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    return-void
.end method

.method constructor <init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    return-void
.end method

.method private selectMutipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getPossibleCenters()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x3

    if-lt v1, v2, :cond_19e

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v1, v2, :cond_2f

    new-array v6, v5, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    new-array v2, v2, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v7, v2, v4

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v7, v2, v5

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/qrcode/detector/FinderPattern;

    aput-object v5, v2, v3

    aput-object v2, v6, v4

    return-object v6

    :cond_2f
    new-instance v6, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;-><init>(Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder$ModuleSizeComparator;)V

    invoke-static {v0, v6}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    :goto_3e
    add-int/lit8 v8, v1, -0x2

    if-lt v7, v8, :cond_5a

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_55

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    invoke-interface {v6, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[Lcom/google/zxing/qrcode/detector/FinderPattern;

    return-object v2

    :cond_55
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_5a
    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/qrcode/detector/FinderPattern;

    if-nez v8, :cond_63

    goto :goto_a5

    :cond_63
    add-int/lit8 v9, v7, 0x1

    :goto_65
    add-int/lit8 v10, v1, -0x1

    if-lt v9, v10, :cond_6a

    goto :goto_a5

    :cond_6a
    invoke-interface {v0, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/google/zxing/qrcode/detector/FinderPattern;

    if-nez v10, :cond_74

    goto/16 :goto_f2

    :cond_74
    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v11

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v13

    invoke-static {v12, v13}, Ljava/lang/Math;->min(FF)F

    move-result v12

    div-float/2addr v11, v12

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v12

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v13

    sub-float/2addr v12, v13

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    const/high16 v13, 0x3f000000    # 0.5f

    cmpl-float v14, v12, v13

    const v15, 0x3d4ccccd    # 0.05f

    if-lez v14, :cond_a8

    cmpl-float v14, v11, v15

    if-ltz v14, :cond_a8

    nop

    :goto_a5
    add-int/lit8 v7, v7, 0x1

    goto :goto_3e

    :cond_a8
    add-int/lit8 v14, v9, 0x1

    :goto_aa
    if-lt v14, v1, :cond_ad

    goto :goto_f2

    :cond_ad
    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, Lcom/google/zxing/qrcode/detector/FinderPattern;

    if-nez v3, :cond_c4

    nop

    move-object/from16 v21, v0

    move/from16 v22, v1

    move/from16 v18, v4

    move/from16 v19, v5

    const/16 v17, 0x2

    goto/16 :goto_18a

    :cond_c4
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v16

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v18

    sub-float v16, v16, v18

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    invoke-static {v5, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    div-float v16, v16, v4

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v4

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v5, v4, v13

    if-lez v5, :cond_f9

    cmpl-float v5, v16, v15

    if-ltz v5, :cond_f9

    nop

    :goto_f2
    add-int/lit8 v9, v9, 0x1

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    goto/16 :goto_65

    :cond_f9
    new-array v5, v2, [Lcom/google/zxing/qrcode/detector/FinderPattern;

    const/16 v18, 0x0

    aput-object v8, v5, v18

    const/16 v19, 0x1

    aput-object v10, v5, v19

    const/16 v17, 0x2

    aput-object v3, v5, v17

    invoke-static {v5}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    new-instance v2, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v2, v5}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v13

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    invoke-static {v13, v15}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v13

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    move-object/from16 v21, v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v0

    invoke-static {v15, v0}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v15

    move/from16 v22, v1

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v1

    invoke-static {v15, v1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    add-float v15, v13, v1

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getEstimatedModuleSize()F

    move-result v20

    const/high16 v23, 0x40000000    # 2.0f

    mul-float v20, v20, v23

    div-float v15, v15, v20

    const/high16 v20, 0x43340000    # 180.0f

    cmpl-float v20, v15, v20

    if-gtz v20, :cond_18a

    const/high16 v20, 0x41100000    # 9.0f

    cmpg-float v20, v15, v20

    if-gez v20, :cond_150

    goto :goto_18a

    :cond_150
    sub-float v20, v13, v1

    invoke-static {v13, v1}, Ljava/lang/Math;->min(FF)F

    move-result v23

    move-object/from16 v24, v2

    div-float v2, v20, v23

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    const v20, 0x3dcccccd    # 0.1f

    cmpl-float v23, v2, v20

    if-ltz v23, :cond_166

    goto :goto_18a

    :cond_166
    mul-float v23, v13, v13

    mul-float v25, v1, v1

    move/from16 v26, v1

    add-float v1, v23, v25

    move/from16 v27, v2

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-float v1, v1

    sub-float v2, v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v23

    div-float v2, v2, v23

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v20, v2, v20

    if-ltz v20, :cond_187

    goto :goto_18a

    :cond_187
    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_18a
    :goto_18a
    add-int/lit8 v14, v14, 0x1

    move/from16 v3, v17

    move/from16 v4, v18

    move/from16 v5, v19

    move-object/from16 v0, v21

    move/from16 v1, v22

    const/4 v2, 0x3

    const/high16 v13, 0x3f000000    # 0.5f

    const v15, 0x3d4ccccd    # 0.05f

    goto/16 :goto_aa

    :cond_19e
    move-object/from16 v21, v0

    move/from16 v22, v1

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method public findMulti(Ljava/util/Map;)[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/qrcode/detector/FinderPatternInfo;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_12

    sget-object v4, Lcom/google/zxing/DecodeHintType;->TRY_HARDER:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_12

    move v4, v3

    goto :goto_13

    :cond_12
    move v4, v2

    :goto_13
    if-eqz v1, :cond_1f

    sget-object v5, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v1, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1f

    move v5, v3

    goto :goto_20

    :cond_1f
    move v5, v2

    :goto_20
    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->getImage()Lcom/google/zxing/common/BitMatrix;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v8

    int-to-float v9, v7

    const/high16 v10, 0x43640000    # 228.0f

    div-float/2addr v9, v10

    const/high16 v10, 0x40400000    # 3.0f

    mul-float/2addr v9, v10

    float-to-int v9, v9

    const/4 v10, 0x3

    if-lt v9, v10, :cond_39

    if-eqz v4, :cond_3a

    :cond_39
    const/4 v9, 0x3

    :cond_3a
    const/4 v11, 0x5

    new-array v11, v11, [I

    add-int/lit8 v12, v9, -0x1

    :goto_3f
    if-lt v12, v7, :cond_74

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->selectMutipleBestPatterns()[[Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v13

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v14, v3

    array-length v15, v13

    :goto_4c
    if-lt v2, v15, :cond_64

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_57

    sget-object v2, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v2

    :cond_57
    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-interface {v14, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    return-object v2

    :cond_64
    aget-object v3, v13, v2

    invoke-static {v3}, Lcom/google/zxing/ResultPoint;->orderBestPatterns([Lcom/google/zxing/ResultPoint;)V

    new-instance v10, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    invoke-direct {v10, v3}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;-><init>([Lcom/google/zxing/qrcode/detector/FinderPattern;)V

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_4c

    :cond_74
    aput v2, v11, v2

    aput v2, v11, v3

    const/4 v13, 0x2

    aput v2, v11, v13

    aput v2, v11, v10

    const/4 v14, 0x4

    aput v2, v11, v14

    const/4 v15, 0x0

    const/16 v16, 0x0

    move v10, v15

    move/from16 v15, v16

    :goto_86
    if-lt v15, v8, :cond_94

    invoke-static {v11}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v13

    if-eqz v13, :cond_91

    invoke-virtual {v0, v11, v12, v8, v5}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    :cond_91
    add-int/2addr v12, v9

    const/4 v10, 0x3

    goto :goto_3f

    :cond_94
    invoke-virtual {v6, v15, v12}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    if-eqz v16, :cond_aa

    and-int/lit8 v13, v10, 0x1

    if-ne v13, v3, :cond_a0

    add-int/lit8 v10, v10, 0x1

    :cond_a0
    aget v13, v11, v10

    add-int/2addr v13, v3

    aput v13, v11, v10

    nop

    const/4 v13, 0x2

    const/16 v16, 0x3

    goto :goto_f5

    :cond_aa
    and-int/lit8 v13, v10, 0x1

    if-nez v13, :cond_ec

    if-ne v10, v14, :cond_e0

    invoke-static {v11}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->foundPatternCross([I)Z

    move-result v13

    if-eqz v13, :cond_cb

    invoke-virtual {v0, v11, v12, v15, v5}, Lcom/google/zxing/multi/qrcode/detector/MultiFinderPatternFinder;->handlePossibleCenter([IIIZ)Z

    move-result v13

    if-eqz v13, :cond_cb

    const/4 v10, 0x0

    aput v2, v11, v2

    aput v2, v11, v3

    const/4 v13, 0x2

    aput v2, v11, v13

    const/16 v16, 0x3

    aput v2, v11, v16

    aput v2, v11, v14

    goto :goto_f5

    :cond_cb
    const/4 v13, 0x2

    const/16 v16, 0x3

    aget v17, v11, v13

    aput v17, v11, v2

    aget v17, v11, v16

    aput v17, v11, v3

    aget v17, v11, v14

    aput v17, v11, v13

    aput v3, v11, v16

    aput v2, v11, v14

    const/4 v10, 0x3

    goto :goto_f5

    :cond_e0
    const/4 v13, 0x2

    const/16 v16, 0x3

    add-int/lit8 v10, v10, 0x1

    aget v17, v11, v10

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v10

    goto :goto_f5

    :cond_ec
    const/4 v13, 0x2

    const/16 v16, 0x3

    aget v17, v11, v10

    add-int/lit8 v17, v17, 0x1

    aput v17, v11, v10

    :goto_f5
    add-int/lit8 v15, v15, 0x1

    goto :goto_86
.end method
