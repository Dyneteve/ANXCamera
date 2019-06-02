.class public final Lcom/google/zxing/common/detector/MonochromeRectangleDetector;
.super Ljava/lang/Object;
.source "MonochromeRectangleDetector.java"


# static fields
.field private static final MAX_MODULES:I = 0x20


# instance fields
.field private final image:Lcom/google/zxing/common/BitMatrix;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    return-void
.end method

.method private blackWhiteRange(IIIIZ)[I
    .registers 13

    add-int v0, p3, p4

    const/4 v1, 0x2

    div-int/2addr v0, v1

    move v2, v0

    :goto_5
    if-ge v2, p3, :cond_8

    goto :goto_41

    :cond_8
    if-eqz p5, :cond_13

    iget-object v3, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, v2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_1e

    goto :goto_1b

    :cond_13
    iget-object v3, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, p1, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_1e

    :goto_1b
    add-int/lit8 v2, v2, -0x1

    goto :goto_5

    :cond_1e
    move v3, v2

    :cond_1f
    add-int/lit8 v3, v3, -0x1

    if-lt v3, p3, :cond_36

    if-eqz p5, :cond_2e

    iget-object v4, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4, v3, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_1f

    goto :goto_36

    :cond_2e
    iget-object v4, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4, p1, v3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v4

    if-eqz v4, :cond_1f

    :cond_36
    :goto_36
    sub-int v4, v2, v3

    if-lt v3, p3, :cond_3f

    if-le v4, p2, :cond_3d

    goto :goto_3f

    :cond_3d
    move v2, v3

    goto :goto_5

    :cond_3f
    :goto_3f
    move v3, v2

    nop

    :goto_41
    const/4 v3, 0x1

    add-int/2addr v2, v3

    move v4, v0

    :goto_44
    if-lt v4, p4, :cond_47

    goto :goto_7f

    :cond_47
    if-eqz p5, :cond_52

    iget-object v5, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5, v4, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_5d

    goto :goto_5a

    :cond_52
    iget-object v5, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5, p1, v4}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eqz v5, :cond_5d

    :goto_5a
    add-int/lit8 v4, v4, 0x1

    goto :goto_44

    :cond_5d
    move v5, v4

    :cond_5e
    add-int/2addr v5, v3

    if-ge v5, p4, :cond_74

    if-eqz p5, :cond_6c

    iget-object v6, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, v5, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_5e

    goto :goto_74

    :cond_6c
    iget-object v6, p0, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, p1, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_5e

    :cond_74
    :goto_74
    sub-int v6, v5, v4

    if-ge v5, p4, :cond_7d

    if-le v6, p2, :cond_7b

    goto :goto_7d

    :cond_7b
    move v4, v5

    goto :goto_44

    :cond_7d
    :goto_7d
    move v5, v4

    nop

    :goto_7f
    add-int/lit8 v4, v4, -0x1

    if-le v4, v2, :cond_8b

    new-array v1, v1, [I

    const/4 v5, 0x0

    aput v2, v1, v5

    aput v4, v1, v3

    goto :goto_8c

    :cond_8b
    const/4 v1, 0x0

    :goto_8c
    return-object v1
.end method

.method private findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;
    .registers 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move/from16 v0, p1

    move/from16 v1, p5

    const/4 v2, 0x0

    move v3, v1

    move v4, v0

    move-object v11, v2

    move v2, v4

    :goto_9
    move/from16 v12, p8

    if-ge v3, v12, :cond_a2

    move/from16 v13, p7

    if-lt v3, v13, :cond_a4

    move/from16 v4, p4

    if-ge v2, v4, :cond_a4

    move/from16 v10, p3

    if-lt v2, v10, :cond_a4

    if-nez p2, :cond_28

    const/4 v14, 0x1

    move-object v5, p0

    move v6, v3

    move/from16 v7, p9

    move v8, v10

    move v9, v4

    move v10, v14

    invoke-direct/range {v5 .. v10}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v5

    goto :goto_33

    :cond_28
    const/4 v9, 0x0

    move-object v4, p0

    move v5, v2

    move/from16 v6, p9

    move v7, v13

    move v8, v12

    invoke-direct/range {v4 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->blackWhiteRange(IIIIZ)[I

    move-result-object v5

    :goto_33
    move-object v4, v5

    if-nez v4, :cond_9b

    if-eqz v11, :cond_96

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-nez p2, :cond_69

    sub-int v7, v3, p6

    aget v8, v11, v6

    if-ge v8, v0, :cond_5f

    aget v8, v11, v5

    if-le v8, v0, :cond_55

    new-instance v8, Lcom/google/zxing/ResultPoint;

    if-lez p6, :cond_4d

    aget v5, v11, v6

    goto :goto_4f

    :cond_4d
    aget v5, v11, v5

    :goto_4f
    int-to-float v5, v5

    int-to-float v6, v7

    invoke-direct {v8, v5, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v8

    :cond_55
    new-instance v5, Lcom/google/zxing/ResultPoint;

    aget v6, v11, v6

    int-to-float v6, v6

    int-to-float v8, v7

    invoke-direct {v5, v6, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v5

    :cond_5f
    new-instance v6, Lcom/google/zxing/ResultPoint;

    aget v5, v11, v5

    int-to-float v5, v5

    int-to-float v8, v7

    invoke-direct {v6, v5, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    :cond_69
    sub-int v7, v2, p2

    aget v8, v11, v6

    if-ge v8, v1, :cond_8c

    aget v8, v11, v5

    if-le v8, v1, :cond_82

    new-instance v8, Lcom/google/zxing/ResultPoint;

    int-to-float v9, v7

    if-gez p2, :cond_7b

    aget v5, v11, v6

    goto :goto_7d

    :cond_7b
    aget v5, v11, v5

    :goto_7d
    int-to-float v5, v5

    invoke-direct {v8, v9, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v8

    :cond_82
    new-instance v5, Lcom/google/zxing/ResultPoint;

    int-to-float v8, v7

    aget v6, v11, v6

    int-to-float v6, v6

    invoke-direct {v5, v8, v6}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v5

    :cond_8c
    new-instance v6, Lcom/google/zxing/ResultPoint;

    int-to-float v8, v7

    aget v5, v11, v5

    int-to-float v5, v5

    invoke-direct {v6, v8, v5}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    :cond_96
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_9b
    move-object v11, v4

    add-int v3, v3, p6

    add-int v2, v2, p2

    goto/16 :goto_9

    :cond_a2
    move/from16 v13, p7

    :cond_a4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method


# virtual methods
.method public detect()[Lcom/google/zxing/ResultPoint;
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v15, p0

    iget-object v0, v15, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v14

    iget-object v0, v15, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v13

    div-int/lit8 v19, v14, 0x2

    div-int/lit8 v20, v13, 0x2

    div-int/lit16 v0, v14, 0x100

    const/4 v12, 0x1

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v11

    div-int/lit16 v0, v13, 0x100

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v10

    const/16 v16, 0x0

    move v8, v14

    const/16 v21, 0x0

    move v4, v13

    nop

    neg-int v6, v11

    div-int/lit8 v9, v20, 0x2

    const/4 v2, 0x0

    move-object v0, v15

    move/from16 v1, v20

    move/from16 v3, v21

    move/from16 v5, v19

    move/from16 v7, v16

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v22, v0, -0x1

    neg-int v0, v10

    div-int/lit8 v18, v19, 0x2

    const/4 v1, 0x0

    move-object v9, v15

    move/from16 v23, v10

    move/from16 v10, v20

    move v6, v11

    move v11, v0

    move/from16 v24, v12

    move/from16 v12, v21

    move/from16 v25, v13

    move/from16 v26, v14

    move/from16 v14, v19

    move v15, v1

    move/from16 v16, v22

    move/from16 v17, v8

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v21, v0, -0x1

    nop

    div-int/lit8 v18, v19, 0x2

    const/4 v15, 0x0

    move-object/from16 v9, p0

    move/from16 v11, v23

    move/from16 v12, v21

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v27, v0, 0x1

    nop

    div-int/lit8 v18, v20, 0x2

    const/4 v11, 0x0

    move/from16 v13, v27

    move v15, v6

    invoke-direct/range {v9 .. v18}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v0

    float-to-int v0, v0

    add-int/lit8 v11, v0, 0x1

    nop

    neg-int v8, v6

    div-int/lit8 v9, v20, 0x4

    move-object/from16 v0, p0

    move/from16 v1, v20

    move-object v12, v3

    move/from16 v3, v21

    move/from16 v4, v27

    move-object v13, v5

    move/from16 v5, v19

    move v14, v6

    move v6, v8

    move-object v15, v7

    move/from16 v7, v22

    move v8, v11

    invoke-direct/range {v0 .. v9}, Lcom/google/zxing/common/detector/MonochromeRectangleDetector;->findCornerFromCenter(IIIIIIIII)Lcom/google/zxing/ResultPoint;

    move-result-object v0

    const/4 v1, 0x4

    new-array v1, v1, [Lcom/google/zxing/ResultPoint;

    aput-object v0, v1, v2

    aput-object v13, v1, v24

    const/4 v2, 0x2

    aput-object v12, v1, v2

    const/4 v2, 0x3

    aput-object v10, v1, v2

    return-object v1
.end method
