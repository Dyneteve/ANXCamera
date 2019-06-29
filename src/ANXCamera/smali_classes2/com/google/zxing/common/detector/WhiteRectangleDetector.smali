.class public final Lcom/google/zxing/common/detector/WhiteRectangleDetector;
.super Ljava/lang/Object;
.source "WhiteRectangleDetector.java"


# static fields
.field private static final CORR:I = 0x1

.field private static final INIT_SIZE:I = 0xa


# instance fields
.field private final downInit:I

.field private final height:I

.field private final image:Lcom/google/zxing/common/BitMatrix;

.field private final leftInit:I

.field private final rightInit:I

.field private final upInit:I

.field private final width:I


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    const/16 v2, 0xa

    invoke-direct {p0, p1, v2, v0, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;-><init>(Lcom/google/zxing/common/BitMatrix;III)V

    return-void
.end method

.method public constructor <init>(Lcom/google/zxing/common/BitMatrix;III)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    div-int/lit8 v0, p2, 0x2

    sub-int v1, p3, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    add-int v1, p3, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    sub-int v1, p4, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    add-int v1, p4, v0

    iput v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    if-ltz v1, :cond_38

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    if-ltz v1, :cond_38

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    iget v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-ge v1, v2, :cond_38

    iget v1, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    iget v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-ge v1, v2, :cond_38

    return-void

    :cond_38
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private centerEdges(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;
    .registers 22

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v2

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v3

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v4

    invoke-virtual/range {p3 .. p3}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v5

    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v6

    invoke-virtual/range {p4 .. p4}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v7

    move-object/from16 v8, p0

    iget v9, v8, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    int-to-float v9, v9

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    cmpg-float v9, v0, v9

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x4

    const/high16 v15, 0x3f800000    # 1.0f

    if-gez v9, :cond_62

    new-array v9, v14, [Lcom/google/zxing/ResultPoint;

    new-instance v14, Lcom/google/zxing/ResultPoint;

    sub-float v10, v6, v15

    add-float v11, v7, v15

    invoke-direct {v14, v10, v11}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v14, v9, v13

    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v2, v15

    add-float v13, v3, v15

    invoke-direct {v10, v11, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v12

    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v4, v15

    sub-float v12, v5, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x2

    aput-object v10, v9, v11

    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v0, v15

    sub-float v12, v1, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x3

    aput-object v10, v9, v11

    return-object v9

    :cond_62
    new-array v9, v14, [Lcom/google/zxing/ResultPoint;

    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v6, v15

    add-float v14, v7, v15

    invoke-direct {v10, v11, v14}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v13

    new-instance v10, Lcom/google/zxing/ResultPoint;

    add-float v11, v2, v15

    sub-float v13, v3, v15

    invoke-direct {v10, v11, v13}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v10, v9, v12

    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v4, v15

    add-float v12, v5, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x2

    aput-object v10, v9, v11

    new-instance v10, Lcom/google/zxing/ResultPoint;

    sub-float v11, v0, v15

    sub-float v12, v1, v15

    invoke-direct {v10, v11, v12}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v11, 0x3

    aput-object v10, v9, v11

    return-object v9
.end method

.method private containsBlackPoint(IIIZ)Z
    .registers 8

    const/4 v0, 0x1

    if-eqz p4, :cond_13

    move v1, p1

    :goto_4
    if-le v1, p2, :cond_7

    goto :goto_16

    :cond_7
    iget-object v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v1, p3}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_10

    return v0

    :cond_10
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_13
    move v1, p1

    :goto_14
    if-le v1, p2, :cond_18

    :goto_16
    const/4 v0, 0x0

    return v0

    :cond_18
    iget-object v2, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, p3, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_21

    return v0

    :cond_21
    add-int/lit8 v1, v1, 0x1

    goto :goto_14
.end method

.method private getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;
    .registers 14

    invoke-static {p1, p2, p3, p4}, Lcom/google/zxing/common/detector/MathUtils;->distance(FFFF)F

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v0

    sub-float v1, p3, p1

    int-to-float v2, v0

    div-float/2addr v1, v2

    sub-float v2, p4, p2

    int-to-float v3, v0

    div-float/2addr v2, v3

    const/4 v3, 0x0

    :goto_11
    if-lt v3, v0, :cond_15

    const/4 v3, 0x0

    return-object v3

    :cond_15
    int-to-float v4, v3

    mul-float/2addr v4, v1

    add-float/2addr v4, p1

    invoke-static {v4}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v4

    int-to-float v5, v3

    mul-float/2addr v5, v2

    add-float/2addr v5, p2

    invoke-static {v5}, Lcom/google/zxing/common/detector/MathUtils;->round(F)I

    move-result v5

    iget-object v6, p0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->image:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v6, v4, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_33

    new-instance v6, Lcom/google/zxing/ResultPoint;

    int-to-float v7, v4

    int-to-float v8, v5

    invoke-direct {v6, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    return-object v6

    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_11
.end method


# virtual methods
.method public detect()[Lcom/google/zxing/ResultPoint;
    .registers 25
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    iget v1, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->leftInit:I

    iget v2, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->rightInit:I

    iget v3, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->upInit:I

    iget v4, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->downInit:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_11
    if-nez v6, :cond_14

    goto :goto_4b

    :cond_14
    const/4 v6, 0x0

    const/4 v12, 0x1

    :goto_16
    if-nez v12, :cond_1a

    if-nez v8, :cond_1e

    :cond_1a
    iget v14, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-lt v2, v14, :cond_171

    :cond_1e
    iget v14, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->width:I

    if-lt v2, v14, :cond_24

    const/4 v5, 0x1

    goto :goto_4b

    :cond_24
    const/4 v14, 0x1

    :goto_25
    const/4 v15, 0x1

    if-nez v14, :cond_2a

    if-nez v9, :cond_2e

    :cond_2a
    iget v13, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-lt v4, v13, :cond_15b

    :cond_2e
    iget v13, v0, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->height:I

    if-lt v4, v13, :cond_34

    const/4 v5, 0x1

    goto :goto_4b

    :cond_34
    const/4 v13, 0x1

    :goto_35
    if-nez v13, :cond_39

    if-nez v10, :cond_3b

    :cond_39
    if-gez v1, :cond_144

    :cond_3b
    if-gez v1, :cond_3f

    const/4 v5, 0x1

    goto :goto_4b

    :cond_3f
    const/16 v16, 0x1

    :goto_41
    if-nez v16, :cond_45

    if-nez v11, :cond_47

    :cond_45
    if-gez v3, :cond_12e

    :cond_47
    if-gez v3, :cond_123

    const/4 v5, 0x1

    nop

    :goto_4b
    if-nez v5, :cond_112

    if-eqz v7, :cond_112

    sub-int v12, v2, v1

    const/4 v13, 0x0

    const/4 v14, 0x1

    :goto_53
    if-lt v14, v12, :cond_5c

    move/from16 v17, v5

    move/from16 v18, v6

    move/from16 v19, v7

    goto :goto_71

    :cond_5c
    int-to-float v15, v1

    move/from16 v17, v5

    sub-int v5, v4, v14

    int-to-float v5, v5

    move/from16 v18, v6

    add-int v6, v1, v14

    int-to-float v6, v6

    move/from16 v19, v7

    int-to-float v7, v4

    invoke-direct {v0, v15, v5, v6, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v13

    if-eqz v13, :cond_102

    nop

    :goto_71
    if-eqz v13, :cond_f7

    const/4 v5, 0x0

    const/4 v6, 0x1

    :goto_75
    if-lt v6, v12, :cond_7a

    move/from16 v20, v1

    goto :goto_8b

    :cond_7a
    int-to-float v7, v1

    add-int v14, v3, v6

    int-to-float v14, v14

    add-int v15, v1, v6

    int-to-float v15, v15

    move/from16 v20, v1

    int-to-float v1, v3

    invoke-direct {v0, v7, v14, v15, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v5

    if-eqz v5, :cond_ed

    nop

    :goto_8b
    if-eqz v5, :cond_e4

    const/4 v1, 0x0

    const/4 v6, 0x1

    :goto_8f
    if-lt v6, v12, :cond_92

    goto :goto_a3

    :cond_92
    int-to-float v7, v2

    add-int v14, v3, v6

    int-to-float v14, v14

    sub-int v15, v2, v6

    int-to-float v15, v15

    move-object/from16 v21, v1

    int-to-float v1, v3

    invoke-direct {v0, v7, v14, v15, v1}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v1

    if-eqz v1, :cond_dd

    nop

    :goto_a3
    if-eqz v1, :cond_d4

    const/4 v6, 0x0

    const/4 v7, 0x1

    :goto_a7
    if-lt v7, v12, :cond_ae

    move/from16 v23, v2

    move/from16 v22, v3

    goto :goto_c1

    :cond_ae
    int-to-float v14, v2

    sub-int v15, v4, v7

    int-to-float v15, v15

    move/from16 v22, v3

    sub-int v3, v2, v7

    int-to-float v3, v3

    move/from16 v23, v2

    int-to-float v2, v4

    invoke-direct {v0, v14, v15, v3, v2}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->getBlackPointOnSegment(FFFF)Lcom/google/zxing/ResultPoint;

    move-result-object v6

    if-eqz v6, :cond_cd

    nop

    :goto_c1
    if-eqz v6, :cond_c8

    invoke-direct {v0, v6, v13, v1, v5}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->centerEdges(Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)[Lcom/google/zxing/ResultPoint;

    move-result-object v2

    return-object v2

    :cond_c8
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_cd
    add-int/lit8 v7, v7, 0x1

    move/from16 v3, v22

    move/from16 v2, v23

    goto :goto_a7

    :cond_d4
    move/from16 v23, v2

    move/from16 v22, v3

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_dd
    move/from16 v23, v2

    move/from16 v22, v3

    add-int/lit8 v6, v6, 0x1

    goto :goto_8f

    :cond_e4
    move/from16 v23, v2

    move/from16 v22, v3

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_ed
    move/from16 v23, v2

    move/from16 v22, v3

    add-int/lit8 v6, v6, 0x1

    move/from16 v1, v20

    goto/16 :goto_75

    :cond_f7
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_102
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    add-int/lit8 v14, v14, 0x1

    move/from16 v5, v17

    move/from16 v6, v18

    move/from16 v7, v19

    goto/16 :goto_53

    :cond_112
    move/from16 v20, v1

    move/from16 v23, v2

    move/from16 v22, v3

    move/from16 v17, v5

    move/from16 v18, v6

    move/from16 v19, v7

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_123
    move/from16 v19, v7

    if-eqz v6, :cond_12a

    const/4 v7, 0x1

    goto/16 :goto_11

    :cond_12a
    move/from16 v7, v19

    goto/16 :goto_11

    :cond_12e
    move/from16 v19, v7

    invoke-direct {v0, v1, v2, v3, v15}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v16

    if-eqz v16, :cond_13f

    add-int/lit8 v3, v3, -0x1

    const/4 v6, 0x1

    const/4 v11, 0x1

    nop

    :cond_13b
    :goto_13b
    move/from16 v7, v19

    goto/16 :goto_41

    :cond_13f
    if-nez v11, :cond_13b

    add-int/lit8 v3, v3, -0x1

    goto :goto_13b

    :cond_144
    move/from16 v19, v7

    const/4 v7, 0x0

    invoke-direct {v0, v3, v4, v1, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v13

    if-eqz v13, :cond_156

    add-int/lit8 v1, v1, -0x1

    const/4 v6, 0x1

    const/4 v10, 0x1

    nop

    :cond_152
    :goto_152
    move/from16 v7, v19

    goto/16 :goto_35

    :cond_156
    if-nez v10, :cond_152

    add-int/lit8 v1, v1, -0x1

    goto :goto_152

    :cond_15b
    move/from16 v19, v7

    invoke-direct {v0, v1, v2, v4, v15}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v14

    if-eqz v14, :cond_16c

    add-int/lit8 v4, v4, 0x1

    const/4 v6, 0x1

    const/4 v9, 0x1

    nop

    :cond_168
    :goto_168
    move/from16 v7, v19

    goto/16 :goto_25

    :cond_16c
    if-nez v9, :cond_168

    add-int/lit8 v4, v4, 0x1

    goto :goto_168

    :cond_171
    move/from16 v19, v7

    const/4 v7, 0x0

    invoke-direct {v0, v3, v4, v2, v7}, Lcom/google/zxing/common/detector/WhiteRectangleDetector;->containsBlackPoint(IIIZ)Z

    move-result v12

    if-eqz v12, :cond_183

    add-int/lit8 v2, v2, 0x1

    const/4 v6, 0x1

    const/4 v8, 0x1

    nop

    :cond_17f
    :goto_17f
    move/from16 v7, v19

    goto/16 :goto_16

    :cond_183
    if-nez v8, :cond_17f

    add-int/lit8 v2, v2, 0x1

    goto :goto_17f
.end method
