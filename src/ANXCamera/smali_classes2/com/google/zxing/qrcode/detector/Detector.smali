.class public Lcom/google/zxing/qrcode/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private resultPointCallback:Lcom/google/zxing/ResultPointCallback;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    return-void
.end method

.method private calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 8

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRunBothWays(IIII)F

    move-result v0

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    float-to-int v4, v4

    invoke-direct {p0, v1, v2, v3, v4}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRunBothWays(IIII)F

    move-result v1

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    const/high16 v3, 0x40e00000    # 7.0f

    if-eqz v2, :cond_3b

    div-float v2, v1, v3

    return v2

    :cond_3b
    invoke-static {v1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v2

    if-eqz v2, :cond_44

    div-float v2, v0, v3

    return v2

    :cond_44
    add-float v2, v0, v1

    const/high16 v3, 0x41600000    # 14.0f

    div-float/2addr v2, v3

    return v2
.end method

.method private static computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-static {p0, p1}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    div-float/2addr v0, p3

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v0

    invoke-static {p0, p2}, Lcom/google/zxing/ResultPoint;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    div-float/2addr v1, p3

    invoke-static {v1}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v1

    add-int v2, v0, v1

    div-int/lit8 v2, v2, 0x2

    add-int/lit8 v2, v2, 0x7

    and-int/lit8 v3, v2, 0x3

    if-eqz v3, :cond_28

    packed-switch v3, :pswitch_data_2c

    goto :goto_2b

    :pswitch_20
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    :pswitch_25
    add-int/lit8 v2, v2, -0x1

    goto :goto_2b

    :cond_28
    add-int/lit8 v2, v2, 0x1

    nop

    :goto_2b
    return v2

    :pswitch_data_2c
    .packed-switch 0x2
        :pswitch_25
        :pswitch_20
    .end packed-switch
.end method

.method private static createTransform(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/PerspectiveTransform;
    .registers 27

    move/from16 v0, p4

    int-to-float v1, v0

    const/high16 v2, 0x40600000    # 3.5f

    sub-float/2addr v1, v2

    if-eqz p3, :cond_1e

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    const/high16 v5, 0x40400000    # 3.0f

    sub-float v5, v1, v5

    move v6, v5

    nop

    move/from16 v20, v3

    move/from16 v21, v4

    move/from16 v19, v5

    move v8, v6

    goto :goto_42

    :cond_1e
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    sub-float/2addr v3, v4

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    add-float/2addr v3, v4

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    sub-float/2addr v4, v5

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    add-float/2addr v4, v5

    move v5, v1

    move v8, v1

    move/from16 v20, v3

    move/from16 v21, v4

    move/from16 v19, v5

    :goto_42
    const/high16 v3, 0x40600000    # 3.5f

    const/high16 v4, 0x40600000    # 3.5f

    nop

    const/high16 v6, 0x40600000    # 3.5f

    nop

    nop

    const/high16 v9, 0x40600000    # 3.5f

    nop

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v13

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v14

    nop

    nop

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v17

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v18

    move v5, v1

    move/from16 v7, v19

    move v10, v1

    move/from16 v15, v20

    move/from16 v16, v21

    invoke-static/range {v3 .. v18}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v3

    return-object v3
.end method

.method private static sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/common/PerspectiveTransform;I)Lcom/google/zxing/common/BitMatrix;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v0

    invoke-virtual {v0, p0, p2, p2, p1}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    return-object v1
.end method

.method private sizeOfBlackWhiteBlackRun(IIII)F
    .registers 27

    sub-int v2, p4, p2

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    sub-int v5, p3, p1

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    const/4 v7, 0x1

    if-le v2, v5, :cond_11

    move v2, v7

    goto :goto_12

    :cond_11
    const/4 v2, 0x0

    :goto_12
    if-eqz v2, :cond_1f

    move/from16 v5, p1

    move/from16 v3, p2

    move v0, v5

    move/from16 v5, p3

    move/from16 v4, p4

    move v1, v5

    goto :goto_27

    :cond_1f
    move/from16 v3, p1

    move/from16 v0, p2

    move/from16 v4, p3

    move/from16 v1, p4

    :goto_27
    sub-int v5, v4, v3

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    sub-int v8, v1, v0

    invoke-static {v8}, Ljava/lang/Math;->abs(I)I

    move-result v8

    neg-int v9, v5

    const/4 v10, 0x2

    div-int/2addr v9, v10

    const/4 v11, -0x1

    if-ge v3, v4, :cond_3b

    move v12, v7

    goto :goto_3c

    :cond_3b
    move v12, v11

    :goto_3c
    if-ge v0, v1, :cond_40

    move v11, v7

    nop

    :cond_40
    const/4 v13, 0x0

    add-int v14, v4, v12

    move v15, v3

    move/from16 v16, v0

    move/from16 v21, v16

    move/from16 v16, v9

    move/from16 v9, v21

    :goto_4c
    if-ne v15, v14, :cond_51

    move/from16 v20, v2

    goto :goto_89

    :cond_51
    if-eqz v2, :cond_56

    move/from16 v17, v9

    goto :goto_58

    :cond_56
    move/from16 v17, v15

    :goto_58
    move/from16 v18, v17

    if-eqz v2, :cond_5f

    move/from16 v17, v15

    goto :goto_61

    :cond_5f
    move/from16 v17, v9

    :goto_61
    move/from16 v19, v17

    if-ne v13, v7, :cond_67

    move v6, v7

    goto :goto_68

    :cond_67
    const/4 v6, 0x0

    :goto_68
    move-object/from16 v7, p0

    iget-object v10, v7, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    move/from16 v20, v2

    move/from16 v2, v18

    move/from16 v7, v19

    invoke-virtual {v10, v2, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-ne v6, v10, :cond_82

    const/4 v6, 0x2

    if-ne v13, v6, :cond_80

    invoke-static {v15, v9, v3, v0}, Lcom/google/zxing/common/detector/MathUtils;->distance(IIII)F

    move-result v6

    return v6

    :cond_80
    add-int/lit8 v13, v13, 0x1

    :cond_82
    add-int v16, v16, v8

    if-lez v16, :cond_9b

    if-ne v9, v1, :cond_96

    nop

    :goto_89
    const/4 v6, 0x2

    if-ne v13, v6, :cond_93

    add-int v2, v4, v12

    invoke-static {v2, v1, v3, v0}, Lcom/google/zxing/common/detector/MathUtils;->distance(IIII)F

    move-result v2

    return v2

    :cond_93
    const/high16 v2, 0x7fc00000    # Float.NaN

    return v2

    :cond_96
    const/4 v6, 0x2

    add-int/2addr v9, v11

    sub-int v16, v16, v5

    goto :goto_9c

    :cond_9b
    const/4 v6, 0x2

    :goto_9c
    add-int/2addr v15, v12

    move v10, v6

    move/from16 v2, v20

    const/4 v7, 0x1

    goto :goto_4c
.end method

.method private sizeOfBlackWhiteBlackRunBothWays(IIII)F
    .registers 11

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRun(IIII)F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-int v2, p3, p1

    sub-int v2, p1, v2

    if-gez v2, :cond_14

    int-to-float v3, p1

    sub-int v4, p1, v2

    int-to-float v4, v4

    div-float v1, v3, v4

    const/4 v2, 0x0

    goto :goto_33

    :cond_14
    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    if-lt v2, v3, :cond_33

    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    sub-int/2addr v3, p1

    int-to-float v3, v3

    sub-int v4, v2, p1

    int-to-float v4, v4

    div-float v1, v3, v4

    iget-object v3, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    :cond_33
    :goto_33
    int-to-float v3, p2

    sub-int v4, p4, p2

    int-to-float v4, v4

    mul-float/2addr v4, v1

    sub-float/2addr v3, v4

    float-to-int v3, v3

    const/high16 v1, 0x3f800000    # 1.0f

    if-gez v3, :cond_46

    int-to-float v4, p2

    sub-int v5, p2, v3

    int-to-float v5, v5

    div-float v1, v4, v5

    const/4 v3, 0x0

    goto :goto_65

    :cond_46
    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    if-lt v3, v4, :cond_65

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    sub-int/2addr v4, p2

    int-to-float v4, v4

    sub-int v5, v3, p2

    int-to-float v5, v5

    div-float v1, v4, v5

    iget-object v4, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    :cond_65
    :goto_65
    int-to-float v4, p1

    sub-int v5, v2, p1

    int-to-float v5, v5

    mul-float/2addr v5, v1

    add-float/2addr v4, v5

    float-to-int v2, v4

    invoke-direct {p0, p1, p2, v2, v3}, Lcom/google/zxing/qrcode/detector/Detector;->sizeOfBlackWhiteBlackRun(IIII)F

    move-result v4

    add-float/2addr v0, v4

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v4, v0, v4

    return v4
.end method


# virtual methods
.method protected final calculateModuleSize(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 6

    invoke-direct {p0, p1, p2}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v0

    invoke-direct {p0, p1, p3}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSizeOneWay(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    add-float/2addr v0, v1

    nop

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public detect()Lcom/google/zxing/common/DetectorResult;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/zxing/qrcode/detector/Detector;->detect(Ljava/util/Map;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v0

    return-object v0
.end method

.method public final detect(Ljava/util/Map;)Lcom/google/zxing/common/DetectorResult;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DetectorResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    if-nez p1, :cond_4

    const/4 v0, 0x0

    goto :goto_c

    :cond_4
    sget-object v0, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/ResultPointCallback;

    :goto_c
    iput-object v0, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    new-instance v0, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;

    iget-object v1, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    iget-object v2, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPointCallback;)V

    invoke-virtual {v0, p1}, Lcom/google/zxing/qrcode/detector/FinderPatternFinder;->find(Ljava/util/Map;)Lcom/google/zxing/qrcode/detector/FinderPatternInfo;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/zxing/qrcode/detector/Detector;->processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v2

    return-object v2
.end method

.method protected final findAlignmentInRegion(FIIF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object v0, p0

    mul-float v1, p4, p1

    float-to-int v9, v1

    sub-int v1, p2, v9

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v10

    iget-object v1, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int v3, p2, v9

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v11

    sub-int v1, v11, v10

    int-to-float v1, v1

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v4, p1, v3

    cmpg-float v1, v1, v4

    if-ltz v1, :cond_61

    sub-int v1, p3, v9

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    iget-object v1, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    add-int v2, p3, v9

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v13

    sub-int v1, v13, v12

    int-to-float v1, v1

    mul-float v2, p1, v3

    cmpg-float v1, v1, v2

    if-ltz v1, :cond_5c

    new-instance v14, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;

    iget-object v2, v0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    nop

    nop

    sub-int v5, v11, v10

    sub-int v6, v13, v12

    nop

    iget-object v8, v0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    move-object v1, v14

    move v3, v10

    move v4, v12

    move/from16 v7, p1

    invoke-direct/range {v1 .. v8}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;-><init>(Lcom/google/zxing/common/BitMatrix;IIIIFLcom/google/zxing/ResultPointCallback;)V

    nop

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/detector/AlignmentPatternFinder;->find()Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v2

    return-object v2

    :cond_5c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_61
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method protected final getImage()Lcom/google/zxing/common/BitMatrix;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    return-object v0
.end method

.method protected final getResultPointCallback()Lcom/google/zxing/ResultPointCallback;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/detector/Detector;->resultPointCallback:Lcom/google/zxing/ResultPointCallback;

    return-object v0
.end method

.method protected final processFinderPatternInfo(Lcom/google/zxing/qrcode/detector/FinderPatternInfo;)Lcom/google/zxing/common/DetectorResult;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v1, p0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getTopRight()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/detector/FinderPatternInfo;->getBottomLeft()Lcom/google/zxing/qrcode/detector/FinderPattern;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Lcom/google/zxing/qrcode/detector/Detector;->calculateModuleSize(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v5

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v6, v5, v0

    if-ltz v6, :cond_ae

    invoke-static {v2, v3, v4, v5}, Lcom/google/zxing/qrcode/detector/Detector;->computeDimension(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;F)I

    move-result v6

    invoke-static {v6}, Lcom/google/zxing/qrcode/decoder/Version;->getProvisionalVersionForDimension(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v8

    add-int/lit8 v8, v8, -0x7

    const/4 v9, 0x0

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/decoder/Version;->getAlignmentPatternCenters()[I

    move-result-object v10

    array-length v10, v10

    if-lez v10, :cond_7f

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v10

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v11

    sub-float/2addr v10, v11

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v11

    add-float/2addr v10, v11

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v11

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v12

    sub-float/2addr v11, v12

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v12

    add-float/2addr v11, v12

    const/high16 v12, 0x40400000    # 3.0f

    int-to-float v13, v8

    div-float/2addr v12, v13

    sub-float v12, v0, v12

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getX()F

    move-result v13

    sub-float v13, v10, v13

    mul-float/2addr v13, v12

    add-float/2addr v0, v13

    float-to-int v13, v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v0

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/detector/FinderPattern;->getY()F

    move-result v14

    sub-float v14, v11, v14

    mul-float/2addr v14, v12

    add-float/2addr v0, v14

    float-to-int v14, v0

    const/4 v0, 0x4

    move v15, v0

    :goto_6c
    const/16 v0, 0x10

    if-le v15, v0, :cond_71

    goto :goto_7f

    :cond_71
    nop

    nop

    nop

    int-to-float v0, v15

    :try_start_75
    invoke-virtual {v1, v5, v13, v14, v0}, Lcom/google/zxing/qrcode/detector/Detector;->findAlignmentInRegion(FIIF)Lcom/google/zxing/qrcode/detector/AlignmentPattern;

    move-result-object v0
    :try_end_79
    .catch Lcom/google/zxing/NotFoundException; {:try_start_75 .. :try_end_79} :catch_7b

    move-object v9, v0

    goto :goto_7f

    :catch_7b
    move-exception v0

    shl-int/lit8 v15, v15, 0x1

    goto :goto_6c

    :cond_7f
    :goto_7f
    invoke-static {v2, v3, v4, v9, v6}, Lcom/google/zxing/qrcode/detector/Detector;->createTransform(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    nop

    iget-object v10, v1, Lcom/google/zxing/qrcode/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-static {v10, v0, v6}, Lcom/google/zxing/qrcode/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/common/PerspectiveTransform;I)Lcom/google/zxing/common/BitMatrix;

    move-result-object v10

    const/4 v11, 0x2

    const/4 v12, 0x0

    const/4 v13, 0x3

    const/4 v14, 0x1

    if-nez v9, :cond_9c

    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    aput-object v4, v13, v12

    aput-object v2, v13, v14

    aput-object v3, v13, v11

    move-object v11, v13

    nop

    move-object v15, v11

    goto :goto_a7

    :cond_9c
    const/4 v15, 0x4

    new-array v15, v15, [Lcom/google/zxing/ResultPoint;

    aput-object v4, v15, v12

    aput-object v2, v15, v14

    aput-object v3, v15, v11

    aput-object v9, v15, v13

    :goto_a7
    move-object v11, v15

    new-instance v12, Lcom/google/zxing/common/DetectorResult;

    invoke-direct {v12, v10, v11}, Lcom/google/zxing/common/DetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;)V

    return-object v12

    :cond_ae
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
