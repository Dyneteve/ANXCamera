.class public final Lcom/google/zxing/aztec/detector/Detector;
.super Ljava/lang/Object;
.source "Detector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/aztec/detector/Detector$Point;
    }
.end annotation


# static fields
.field private static final EXPECTED_CORNER_BITS:[I


# instance fields
.field private compact:Z

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private nbCenterLayers:I

.field private nbDataBlocks:I

.field private nbLayers:I

.field private shift:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_e

    nop

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/aztec/detector/Detector;->EXPECTED_CORNER_BITS:[I

    return-void

    nop

    :array_e
    .array-data 4
        0xee0
        0x1dc
        0x83b
        0x707
    .end array-data
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    return-void
.end method

.method private static distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F
    .registers 6

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    return v0
.end method

.method private static distance(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)F
    .registers 6

    invoke-virtual {p0}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v1

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    invoke-static {v0, v1, v2, v3}, Lcom/google/zxing/common/detector/MathUtils;->distance(IIII)F

    move-result v0

    return v0
.end method

.method private static expandSquare([Lcom/google/zxing/ResultPoint;FF)[Lcom/google/zxing/ResultPoint;
    .registers 18

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, v0, p1

    div-float v1, p2, v1

    const/4 v2, 0x0

    aget-object v3, p0, v2

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    const/4 v4, 0x2

    aget-object v5, p0, v4

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    sub-float/2addr v3, v5

    aget-object v5, p0, v2

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v4

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    sub-float/2addr v5, v6

    aget-object v6, p0, v2

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    aget-object v7, p0, v4

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v7

    add-float/2addr v6, v7

    div-float/2addr v6, v0

    aget-object v7, p0, v2

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    aget-object v8, p0, v4

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v8

    add-float/2addr v7, v8

    div-float/2addr v7, v0

    new-instance v8, Lcom/google/zxing/ResultPoint;

    mul-float v9, v1, v3

    add-float/2addr v9, v6

    mul-float v10, v1, v5

    add-float/2addr v10, v7

    invoke-direct {v8, v9, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    new-instance v9, Lcom/google/zxing/ResultPoint;

    mul-float v10, v1, v3

    sub-float v10, v6, v10

    mul-float v11, v1, v5

    sub-float v11, v7, v11

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v10, 0x1

    aget-object v11, p0, v10

    invoke-virtual {v11}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v11

    const/4 v12, 0x3

    aget-object v4, p0, v12

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    sub-float/2addr v11, v4

    aget-object v3, p0, v10

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    aget-object v4, p0, v12

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    sub-float/2addr v3, v4

    aget-object v4, p0, v10

    invoke-virtual {v4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    aget-object v5, p0, v12

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    add-float/2addr v4, v5

    div-float/2addr v4, v0

    aget-object v5, p0, v10

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    aget-object v6, p0, v12

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    add-float/2addr v5, v6

    div-float/2addr v5, v0

    new-instance v0, Lcom/google/zxing/ResultPoint;

    mul-float v6, v1, v11

    add-float/2addr v6, v4

    mul-float v7, v1, v3

    add-float/2addr v7, v5

    invoke-direct {v0, v6, v7}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    new-instance v6, Lcom/google/zxing/ResultPoint;

    mul-float v7, v1, v11

    sub-float v7, v4, v7

    mul-float v13, v1, v3

    sub-float v12, v5, v13

    invoke-direct {v6, v7, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v7, 0x4

    new-array v7, v7, [Lcom/google/zxing/ResultPoint;

    aput-object v8, v7, v2

    aput-object v0, v7, v10

    const/4 v2, 0x2

    aput-object v9, v7, v2

    const/4 v2, 0x3

    aput-object v6, v7, v2

    return-object v7
.end method

.method private extractParameters([Lcom/google/zxing/ResultPoint;)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    aget-object v1, p1, v0

    invoke-direct {p0, v1}, Lcom/google/zxing/aztec/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v1

    if-eqz v1, :cond_a2

    const/4 v1, 0x1

    aget-object v2, p1, v1

    invoke-direct {p0, v2}, Lcom/google/zxing/aztec/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v2

    if-eqz v2, :cond_a2

    const/4 v2, 0x2

    aget-object v3, p1, v2

    invoke-direct {p0, v3}, Lcom/google/zxing/aztec/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v3

    if-eqz v3, :cond_a2

    const/4 v3, 0x3

    aget-object v4, p1, v3

    invoke-direct {p0, v4}, Lcom/google/zxing/aztec/detector/Detector;->isValid(Lcom/google/zxing/ResultPoint;)Z

    move-result v4

    if-eqz v4, :cond_a2

    iget v4, p0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    mul-int/2addr v4, v2

    const/4 v5, 0x4

    new-array v6, v5, [I

    aget-object v7, p1, v0

    aget-object v8, p1, v1

    invoke-direct {p0, v7, v8, v4}, Lcom/google/zxing/aztec/detector/Detector;->sampleLine(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)I

    move-result v7

    aput v7, v6, v0

    aget-object v7, p1, v1

    aget-object v8, p1, v2

    invoke-direct {p0, v7, v8, v4}, Lcom/google/zxing/aztec/detector/Detector;->sampleLine(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)I

    move-result v7

    aput v7, v6, v1

    aget-object v7, p1, v2

    aget-object v8, p1, v3

    invoke-direct {p0, v7, v8, v4}, Lcom/google/zxing/aztec/detector/Detector;->sampleLine(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)I

    move-result v7

    aput v7, v6, v2

    aget-object v2, p1, v3

    aget-object v0, p1, v0

    invoke-direct {p0, v2, v0, v4}, Lcom/google/zxing/aztec/detector/Detector;->sampleLine(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)I

    move-result v0

    aput v0, v6, v3

    move-object v0, v6

    invoke-static {v0, v4}, Lcom/google/zxing/aztec/detector/Detector;->getRotation([II)I

    move-result v2

    iput v2, p0, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    const-wide/16 v2, 0x0

    const/4 v6, 0x0

    :goto_5c
    if-lt v6, v5, :cond_7e

    iget-boolean v5, p0, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    invoke-static {v2, v3, v5}, Lcom/google/zxing/aztec/detector/Detector;->getCorrectedParameterData(JZ)I

    move-result v5

    iget-boolean v6, p0, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    if-eqz v6, :cond_73

    shr-int/lit8 v6, v5, 0x6

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    and-int/lit8 v6, v5, 0x3f

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/zxing/aztec/detector/Detector;->nbDataBlocks:I

    goto :goto_7d

    :cond_73
    shr-int/lit8 v6, v5, 0xb

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    and-int/lit16 v6, v5, 0x7ff

    add-int/2addr v6, v1

    iput v6, p0, Lcom/google/zxing/aztec/detector/Detector;->nbDataBlocks:I

    :goto_7d
    return-void

    :cond_7e
    iget v7, p0, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    add-int/2addr v7, v6

    rem-int/2addr v7, v5

    aget v7, v0, v7

    iget-boolean v8, p0, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    if-eqz v8, :cond_91

    const/4 v8, 0x7

    shl-long/2addr v2, v8

    shr-int/lit8 v8, v7, 0x1

    and-int/lit8 v8, v8, 0x7f

    int-to-long v8, v8

    add-long/2addr v2, v8

    goto :goto_9f

    :cond_91
    const/16 v8, 0xa

    shl-long/2addr v2, v8

    shr-int/lit8 v8, v7, 0x2

    and-int/lit16 v8, v8, 0x3e0

    shr-int/lit8 v9, v7, 0x1

    and-int/lit8 v9, v9, 0x1f

    add-int/2addr v8, v9

    int-to-long v8, v8

    add-long/2addr v2, v8

    :goto_9f
    add-int/lit8 v6, v6, 0x1

    goto :goto_5c

    :cond_a2
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private getBullsEyeCorners(Lcom/google/zxing/aztec/detector/Detector$Point;)[Lcom/google/zxing/ResultPoint;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p1

    move-object/from16 v3, p1

    move-object/from16 v4, p1

    const/4 v5, 0x1

    const/4 v6, 0x1

    iput v6, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    :goto_e
    iget v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    const/16 v8, 0x9

    const/4 v9, 0x0

    const/4 v10, 0x2

    if-lt v7, v8, :cond_17

    goto :goto_53

    :cond_17
    const/4 v7, -0x1

    invoke-direct {v0, v1, v5, v6, v7}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v8

    invoke-direct {v0, v2, v5, v6, v6}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v11

    invoke-direct {v0, v3, v5, v7, v6}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v12

    invoke-direct {v0, v4, v5, v7, v7}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v7

    iget v13, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    if-le v13, v10, :cond_cd

    invoke-static {v7, v8}, Lcom/google/zxing/aztec/detector/Detector;->distance(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)F

    move-result v13

    iget v14, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    int-to-float v14, v14

    mul-float/2addr v13, v14

    invoke-static {v4, v1}, Lcom/google/zxing/aztec/detector/Detector;->distance(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)F

    move-result v14

    iget v15, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    add-int/2addr v15, v10

    int-to-float v15, v15

    mul-float/2addr v14, v15

    div-float/2addr v13, v14

    float-to-double v14, v13

    const-wide/high16 v16, 0x3fe8000000000000L    # 0.75

    cmpg-double v14, v14, v16

    if-ltz v14, :cond_53

    float-to-double v14, v13

    const-wide/high16 v16, 0x3ff4000000000000L    # 1.25

    cmpl-double v14, v14, v16

    if-gtz v14, :cond_53

    invoke-direct {v0, v8, v11, v12, v7}, Lcom/google/zxing/aztec/detector/Detector;->isWhiteOrBlackRectangle(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)Z

    move-result v14

    if-nez v14, :cond_cd

    nop

    :cond_53
    :goto_53
    iget v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    const/4 v8, 0x5

    if-eq v7, v8, :cond_63

    iget v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    const/4 v11, 0x7

    if-ne v7, v11, :cond_5e

    goto :goto_63

    :cond_5e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    :cond_63
    :goto_63
    iget v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    if-ne v7, v8, :cond_69

    move v7, v6

    goto :goto_6a

    :cond_69
    move v7, v9

    :goto_6a
    iput-boolean v7, v0, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    new-instance v7, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v8

    int-to-float v8, v8

    const/high16 v11, 0x3f000000    # 0.5f

    add-float/2addr v8, v11

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v12

    int-to-float v12, v12

    sub-float/2addr v12, v11

    invoke-direct {v7, v8, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    new-instance v8, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v12

    int-to-float v12, v12

    add-float/2addr v12, v11

    invoke-virtual {v2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v13

    int-to-float v13, v13

    add-float/2addr v13, v11

    invoke-direct {v8, v12, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    new-instance v12, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v3}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v13

    int-to-float v13, v13

    sub-float/2addr v13, v11

    invoke-virtual {v3}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v14

    int-to-float v14, v14

    add-float/2addr v14, v11

    invoke-direct {v12, v13, v14}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    new-instance v13, Lcom/google/zxing/ResultPoint;

    invoke-virtual {v4}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v14

    int-to-float v14, v14

    sub-float/2addr v14, v11

    invoke-virtual {v4}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v15

    int-to-float v15, v15

    sub-float/2addr v15, v11

    invoke-direct {v13, v14, v15}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    move-object v11, v13

    const/4 v13, 0x4

    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    aput-object v7, v13, v9

    aput-object v8, v13, v6

    aput-object v12, v13, v10

    const/4 v6, 0x3

    aput-object v11, v13, v6

    iget v9, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    mul-int/2addr v9, v10

    sub-int/2addr v9, v6

    int-to-float v6, v9

    iget v9, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    mul-int/2addr v10, v9

    int-to-float v9, v10

    invoke-static {v13, v6, v9}, Lcom/google/zxing/aztec/detector/Detector;->expandSquare([Lcom/google/zxing/ResultPoint;FF)[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    return-object v6

    :cond_cd
    move-object v1, v8

    move-object v2, v11

    move-object v3, v12

    move-object v4, v7

    if-eqz v5, :cond_d4

    goto :goto_d5

    :cond_d4
    move v9, v6

    :goto_d5
    move v5, v9

    iget v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    add-int/2addr v7, v6

    iput v7, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    goto/16 :goto_e
.end method

.method private getColor(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)I
    .registers 14

    invoke-static {p1, p2}, Lcom/google/zxing/aztec/detector/Detector;->distance(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)F

    move-result v0

    invoke-virtual {p2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v1

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v2

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    sub-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v2, v0

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v7

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v8

    invoke-virtual {v6, v7, v8}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    const/4 v7, 0x0

    :goto_34
    int-to-float v8, v7

    cmpg-float v8, v8, v0

    if-ltz v8, :cond_57

    int-to-float v7, v3

    div-float/2addr v7, v0

    const v8, 0x3dcccccd    # 0.1f

    cmpl-float v9, v7, v8

    const/4 v10, 0x0

    if-lez v9, :cond_4b

    const v9, 0x3f666666    # 0.9f

    cmpg-float v9, v7, v9

    if-gez v9, :cond_4b

    return v10

    :cond_4b
    cmpg-float v8, v7, v8

    const/4 v9, 0x1

    if-gtz v8, :cond_52

    move v10, v9

    nop

    :cond_52
    if-ne v10, v6, :cond_55

    goto :goto_56

    :cond_55
    const/4 v9, -0x1

    :goto_56
    return v9

    :cond_57
    add-float/2addr v4, v1

    add-float/2addr v5, v2

    iget-object v8, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-static {v4}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v9

    invoke-static {v5}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v10

    invoke-virtual {v8, v9, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eq v8, v6, :cond_6b

    add-int/lit8 v3, v3, 0x1

    :cond_6b
    add-int/lit8 v7, v7, 0x1

    goto :goto_34
.end method

.method private static getCorrectedParameterData(JZ)I
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x4

    if-eqz p2, :cond_6

    const/4 v1, 0x7

    const/4 v2, 0x2

    goto :goto_9

    :cond_6
    const/16 v1, 0xa

    move v2, v0

    :goto_9
    sub-int v3, v1, v2

    new-array v4, v1, [I

    add-int/lit8 v5, v1, -0x1

    :goto_f
    if-gez v5, :cond_30

    :try_start_11
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v5, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_PARAM:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v5}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    invoke-virtual {v0, v4, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_1b
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_11 .. :try_end_1b} :catch_2a

    nop

    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_1e
    if-lt v5, v2, :cond_21

    return v0

    :cond_21
    shl-int/lit8 v6, v0, 0x4

    aget v7, v4, v5

    add-int v0, v6, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    :catch_2a
    move-exception v0

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_30
    long-to-int v6, p0

    and-int/lit8 v6, v6, 0xf

    aput v6, v4, v5

    shr-long/2addr p0, v0

    add-int/lit8 v5, v5, -0x1

    goto :goto_f
.end method

.method private getDimension()I
    .registers 5

    iget-boolean v0, p0, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    const/4 v1, 0x4

    if-eqz v0, :cond_b

    iget v0, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    mul-int/2addr v1, v0

    add-int/lit8 v1, v1, 0xb

    return v1

    :cond_b
    iget v0, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    if-gt v0, v1, :cond_15

    iget v0, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    mul-int/2addr v1, v0

    add-int/lit8 v1, v1, 0xf

    return v1

    :cond_15
    iget v0, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    mul-int/2addr v0, v1

    const/4 v2, 0x2

    iget v3, p0, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    sub-int/2addr v3, v1

    div-int/lit8 v3, v3, 0x8

    add-int/lit8 v3, v3, 0x1

    mul-int/2addr v2, v3

    add-int/2addr v0, v2

    add-int/lit8 v0, v0, 0xf

    return v0
.end method

.method private getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;
    .registers 8

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v0

    add-int/2addr v0, p3

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v1

    add-int/2addr v1, p4

    :goto_a
    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/detector/Detector;->isValid(II)Z

    move-result v2

    if-eqz v2, :cond_1c

    iget-object v2, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v0, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eq v2, p2, :cond_19

    goto :goto_1c

    :cond_19
    add-int/2addr v0, p3

    add-int/2addr v1, p4

    goto :goto_a

    :cond_1c
    :goto_1c
    sub-int/2addr v0, p3

    sub-int/2addr v1, p4

    :goto_1e
    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/detector/Detector;->isValid(II)Z

    move-result v2

    if-eqz v2, :cond_2f

    iget-object v2, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v0, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eq v2, p2, :cond_2d

    goto :goto_2f

    :cond_2d
    add-int/2addr v0, p3

    goto :goto_1e

    :cond_2f
    :goto_2f
    sub-int/2addr v0, p3

    :goto_30
    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/detector/Detector;->isValid(II)Z

    move-result v2

    if-eqz v2, :cond_41

    iget-object v2, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v0, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eq v2, p2, :cond_3f

    goto :goto_41

    :cond_3f
    add-int/2addr v1, p4

    goto :goto_30

    :cond_41
    :goto_41
    sub-int/2addr v1, p4

    new-instance v2, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-direct {v2, v0, v1}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    return-object v2
.end method

.method private getMatrixCenter()Lcom/google/zxing/aztec/detector/Detector$Point;
    .registers 16

    const/4 v0, 0x3

    const/4 v1, 0x2

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    :try_start_5
    new-instance v5, Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    iget-object v6, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v5, v6}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v5}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->detect()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    aget-object v6, v5, v4

    aget-object v7, v5, v3

    aget-object v8, v5, v1

    aget-object v9, v5, v0
    :try_end_18
    .catch Lcom/google/zxing/NotFoundException; {:try_start_5 .. :try_end_18} :catch_1a

    move-object v5, v9

    goto :goto_70

    :catch_1a
    move-exception v5

    iget-object v6, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v6

    div-int/2addr v6, v1

    iget-object v7, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v7}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v7

    div-int/2addr v7, v1

    new-instance v8, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v9, v6, 0x7

    add-int/lit8 v10, v7, -0x7

    invoke-direct {v8, v9, v10}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v8, v4, v3, v2}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v8

    new-instance v9, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v10, v6, 0x7

    add-int/lit8 v11, v7, 0x7

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v9, v4, v3, v3}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v9

    invoke-virtual {v9}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v9

    new-instance v10, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v11, v6, -0x7

    add-int/lit8 v12, v7, 0x7

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v10, v4, v2, v3}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v10

    new-instance v11, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v12, v6, -0x7

    add-int/lit8 v13, v7, -0x7

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v11, v4, v2, v2}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v11

    invoke-virtual {v11}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v5

    move-object v6, v8

    move-object v7, v9

    move-object v8, v10

    :goto_70
    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v9

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    add-float/2addr v9, v10

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    add-float/2addr v9, v10

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v10

    add-float/2addr v9, v10

    const/high16 v10, 0x40800000    # 4.0f

    div-float/2addr v9, v10

    invoke-static {v9}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v9

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v11

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    add-float/2addr v11, v12

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    add-float/2addr v11, v12

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v12

    add-float/2addr v11, v12

    div-float/2addr v11, v10

    invoke-static {v11}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v11

    :try_start_a2
    new-instance v12, Lcom/google/zxing/common/detector/WhiteRectangleDetector;

    iget-object v13, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    const/16 v14, 0xf

    invoke-direct {v12, v13, v14, v9, v11}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;III)V

    invoke-virtual {v12}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->detect()[Lcom/google/zxing/ResultPoint;

    move-result-object v12

    aget-object v13, v12, v4

    move-object v6, v13

    aget-object v13, v12, v3

    move-object v7, v13

    aget-object v1, v12, v1

    move-object v8, v1

    aget-object v0, v12, v0
    :try_end_ba
    .catch Lcom/google/zxing/NotFoundException; {:try_start_a2 .. :try_end_ba} :catch_bb

    goto :goto_100

    :catch_bb
    move-exception v0

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v12, v9, 0x7

    add-int/lit8 v13, v11, -0x7

    invoke-direct {v1, v12, v13}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v1, v4, v3, v2}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v6

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v12, v9, 0x7

    add-int/lit8 v13, v11, 0x7

    invoke-direct {v1, v12, v13}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v1, v4, v3, v3}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v7

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v12, v9, -0x7

    add-int/lit8 v13, v11, 0x7

    invoke-direct {v1, v12, v13}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v1, v4, v2, v3}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v8

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    add-int/lit8 v3, v9, -0x7

    add-int/lit8 v12, v11, -0x7

    invoke-direct {v1, v3, v12}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    invoke-direct {p0, v1, v4, v2, v2}, Lcom/google/zxing/aztec/detector/Detector;->getFirstDifferent(Lcom/google/zxing/aztec/detector/Detector$Point;ZII)Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/aztec/detector/Detector$Point;->toResultPoint()Lcom/google/zxing/ResultPoint;

    move-result-object v0

    :goto_100
    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v1

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    add-float/2addr v1, v2

    div-float/2addr v1, v10

    invoke-static {v1}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v1

    invoke-virtual {v6}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v2

    invoke-virtual {v0}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    add-float/2addr v2, v3

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    add-float/2addr v2, v3

    invoke-virtual {v8}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    add-float/2addr v2, v3

    div-float/2addr v2, v10

    invoke-static {v2}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v2

    new-instance v3, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-direct {v3, v1, v2}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    return-object v3
.end method

.method private getMatrixCornerPoints([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .registers 4

    iget v0, p0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    const/4 v1, 0x2

    mul-int/2addr v1, v0

    int-to-float v0, v1

    invoke-direct {p0}, Lcom/google/zxing/aztec/detector/Detector;->getDimension()I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1, v0, v1}, Lcom/google/zxing/aztec/detector/Detector;->expandSquare([Lcom/google/zxing/ResultPoint;FF)[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    return-object v0
.end method

.method private static getRotation([II)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    array-length v1, p0

    const/4 v2, 0x0

    :goto_3
    if-lt v2, v1, :cond_25

    and-int/lit8 v1, v0, 0x1

    shl-int/lit8 v1, v1, 0xb

    shr-int/lit8 v2, v0, 0x1

    add-int/2addr v1, v2

    const/4 v0, 0x0

    :goto_d
    const/4 v2, 0x4

    if-ge v0, v2, :cond_20

    sget-object v2, Lcom/google/zxing/aztec/detector/Detector;->EXPECTED_CORNER_BITS:[I

    aget v2, v2, v0

    xor-int/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Integer;->bitCount(I)I

    move-result v2

    const/4 v3, 0x2

    if-gt v2, v3, :cond_1d

    return v0

    :cond_1d
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_20
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_25
    aget v3, p0, v2

    add-int/lit8 v4, p1, -0x2

    shr-int v4, v3, v4

    shl-int/lit8 v4, v4, 0x1

    and-int/lit8 v5, v3, 0x1

    add-int/2addr v4, v5

    shl-int/lit8 v5, v0, 0x3

    add-int v0, v5, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method private isValid(II)Z
    .registers 4

    if-ltz p1, :cond_16

    iget-object v0, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    if-ge p1, v0, :cond_16

    if-lez p2, :cond_16

    iget-object v0, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    if-ge p2, v0, :cond_16

    const/4 v0, 0x1

    return v0

    :cond_16
    const/4 v0, 0x0

    return v0
.end method

.method private isValid(Lcom/google/zxing/ResultPoint;)Z
    .registers 5

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/google/zxing/aztec/detector/Detector;->isValid(II)Z

    move-result v2

    return v2
.end method

.method private isWhiteOrBlackRectangle(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)Z
    .registers 9

    const/4 v0, 0x3

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {p1}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    add-int/2addr v3, v0

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    move-object p1, v1

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-virtual {p2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-virtual {p2}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    move-object p2, v1

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-virtual {p3}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p3}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    sub-int/2addr v3, v0

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    move-object p3, v1

    new-instance v1, Lcom/google/zxing/aztec/detector/Detector$Point;

    invoke-virtual {p4}, Lcom/google/zxing/aztec/detector/Detector$Point;->getX()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p4}, Lcom/google/zxing/aztec/detector/Detector$Point;->getY()I

    move-result v3

    add-int/2addr v3, v0

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/aztec/detector/Detector$Point;-><init>(II)V

    move-object p4, v1

    invoke-direct {p0, p4, p1}, Lcom/google/zxing/aztec/detector/Detector;->getColor(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_49

    return v2

    :cond_49
    invoke-direct {p0, p1, p2}, Lcom/google/zxing/aztec/detector/Detector;->getColor(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)I

    move-result v3

    if-eq v3, v1, :cond_50

    return v2

    :cond_50
    invoke-direct {p0, p2, p3}, Lcom/google/zxing/aztec/detector/Detector;->getColor(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)I

    move-result v3

    if-eq v3, v1, :cond_57

    return v2

    :cond_57
    invoke-direct {p0, p3, p4}, Lcom/google/zxing/aztec/detector/Detector;->getColor(Lcom/google/zxing/aztec/detector/Detector$Point;Lcom/google/zxing/aztec/detector/Detector$Point;)I

    move-result v3

    if-ne v3, v1, :cond_5e

    const/4 v2, 0x1

    :cond_5e
    return v2
.end method

.method private sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/common/BitMatrix;
    .registers 32
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-static {}, Lcom/google/zxing/common/GridSampler;->getInstance()Lcom/google/zxing/common/GridSampler;

    move-result-object v21

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/aztec/detector/Detector;->getDimension()I

    move-result v15

    int-to-float v1, v15

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v3, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    int-to-float v3, v3

    sub-float v22, v1, v3

    int-to-float v1, v15

    div-float/2addr v1, v2

    iget v2, v0, Lcom/google/zxing/aztec/detector/Detector;->nbCenterLayers:I

    int-to-float v2, v2

    add-float v23, v1, v2

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v13

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v14

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v16

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v17

    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v18

    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v19

    invoke-virtual/range {p5 .. p5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v20

    invoke-virtual/range {p5 .. p5}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v24

    move-object/from16 v1, v21

    move-object/from16 v2, p1

    move v3, v15

    move v4, v15

    move/from16 v5, v22

    move/from16 v6, v22

    move/from16 v7, v23

    move/from16 v8, v22

    move/from16 v9, v23

    move/from16 v10, v23

    move/from16 v11, v22

    move/from16 v12, v23

    move/from16 v25, v15

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    move/from16 v18, v19

    move/from16 v19, v20

    move/from16 v20, v24

    invoke-virtual/range {v1 .. v20}, Lcom/google/zxing/common/GridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    return-object v1
.end method

.method private sampleLine(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;I)I
    .registers 15

    const/4 v0, 0x0

    invoke-static {p1, p2}, Lcom/google/zxing/aztec/detector/Detector;->distance(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)F

    move-result v1

    int-to-float v2, p3

    div-float v2, v1, v2

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v3

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v4

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v5

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    sub-float/2addr v5, v6

    mul-float/2addr v5, v2

    div-float/2addr v5, v1

    invoke-virtual {p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v6

    invoke-virtual {p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    sub-float/2addr v6, v7

    mul-float/2addr v6, v2

    div-float/2addr v6, v1

    const/4 v7, 0x0

    :goto_27
    if-lt v7, p3, :cond_2a

    return v0

    :cond_2a
    iget-object v8, p0, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    int-to-float v9, v7

    mul-float/2addr v9, v5

    add-float/2addr v9, v3

    invoke-static {v9}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v9

    int-to-float v10, v7

    mul-float/2addr v10, v6

    add-float/2addr v10, v4

    invoke-static {v10}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v10

    invoke-virtual {v8, v9, v10}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eqz v8, :cond_47

    sub-int v8, p3, v7

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    shl-int v8, v9, v8

    or-int/2addr v0, v8

    :cond_47
    add-int/lit8 v7, v7, 0x1

    goto :goto_27
.end method


# virtual methods
.method public detect()Lcom/google/zxing/aztec/AztecDetectorResult;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/zxing/aztec/detector/Detector;->detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v0

    return-object v0
.end method

.method public detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;
    .registers 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object v6, p0

    invoke-direct {v6}, Lcom/google/zxing/aztec/detector/Detector;->getMatrixCenter()Lcom/google/zxing/aztec/detector/Detector$Point;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/google/zxing/aztec/detector/Detector;->getBullsEyeCorners(Lcom/google/zxing/aztec/detector/Detector$Point;)[Lcom/google/zxing/ResultPoint;

    move-result-object v8

    const/4 v0, 0x2

    if-eqz p1, :cond_15

    const/4 v1, 0x0

    aget-object v2, v8, v1

    aget-object v3, v8, v0

    aput-object v3, v8, v1

    aput-object v2, v8, v0

    :cond_15
    invoke-direct {v6, v8}, Lcom/google/zxing/aztec/detector/Detector;->extractParameters([Lcom/google/zxing/ResultPoint;)V

    iget-object v1, v6, Lcom/google/zxing/aztec/detector/Detector;->image:Lcom/google/zxing/common/BitMatrix;

    iget v2, v6, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    rem-int/lit8 v2, v2, 0x4

    aget-object v2, v8, v2

    iget v3, v6, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    add-int/lit8 v3, v3, 0x1

    rem-int/lit8 v3, v3, 0x4

    aget-object v3, v8, v3

    iget v4, v6, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    add-int/2addr v4, v0

    rem-int/lit8 v4, v4, 0x4

    aget-object v4, v8, v4

    iget v0, v6, Lcom/google/zxing/aztec/detector/Detector;->shift:I

    add-int/lit8 v0, v0, 0x3

    rem-int/lit8 v0, v0, 0x4

    aget-object v5, v8, v0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/aztec/detector/Detector;->sampleGrid(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-direct {v6, v8}, Lcom/google/zxing/aztec/detector/Detector;->getMatrixCornerPoints([Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v1

    new-instance v2, Lcom/google/zxing/aztec/AztecDetectorResult;

    iget-boolean v12, v6, Lcom/google/zxing/aztec/detector/Detector;->compact:Z

    iget v13, v6, Lcom/google/zxing/aztec/detector/Detector;->nbDataBlocks:I

    iget v14, v6, Lcom/google/zxing/aztec/detector/Detector;->nbLayers:I

    move-object v9, v2

    move-object v10, v0

    move-object v11, v1

    invoke-direct/range {v9 .. v14}, Lcom/google/zxing/aztec/AztecDetectorResult;-><init>(Lcom/google/zxing/common/BitMatrix;[Lcom/google/zxing/ResultPoint;ZII)V

    return-object v2
.end method
