.class public final Lcom/google/zxing/common/DefaultGridSampler;
.super Lcom/google/zxing/common/GridSampler;
.source "DefaultGridSampler.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/common/GridSampler;-><init>()V

    return-void
.end method


# virtual methods
.method public sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    .registers 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    nop

    nop

    invoke-static/range {p4 .. p19}, Lcom/google/zxing/common/PerspectiveTransform;->quadrilateralToQuadrilateral(FFFFFFFFFFFFFFFF)Lcom/google/zxing/common/PerspectiveTransform;

    move-result-object v0

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move v4, p3

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/google/zxing/common/DefaultGridSampler;->sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    return-object v5
.end method

.method public sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    if-lez p2, :cond_4f

    if-lez p3, :cond_4f

    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v0, p2, p3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    const/4 v1, 0x2

    mul-int/2addr v1, p2

    new-array v1, v1, [F

    const/4 v2, 0x0

    :goto_e
    if-lt v2, p3, :cond_11

    return-object v0

    :cond_11
    array-length v3, v1

    int-to-float v4, v2

    const/high16 v5, 0x3f000000    # 0.5f

    add-float/2addr v4, v5

    const/4 v6, 0x0

    :goto_17
    if-lt v6, v3, :cond_42

    invoke-virtual {p4, v1}, Lcom/google/zxing/common/PerspectiveTransform;->transformPoints([F)V

    invoke-static {p1, v1}, Lcom/google/zxing/common/DefaultGridSampler;->checkAndNudgePoints(Lcom/google/zxing/common/BitMatrix;[F)V

    const/4 v5, 0x0

    :goto_20
    if-lt v5, v3, :cond_26

    nop

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_26
    :try_start_26
    aget v6, v1, v5

    float-to-int v6, v6

    add-int/lit8 v7, v5, 0x1

    aget v7, v1, v7

    float-to-int v7, v7

    invoke-virtual {p1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-eqz v6, :cond_39

    div-int/lit8 v6, v5, 0x2

    invoke-virtual {v0, v6, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V
    :try_end_39
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_26 .. :try_end_39} :catch_3c

    :cond_39
    add-int/lit8 v5, v5, 0x2

    goto :goto_20

    :catch_3c
    move-exception v5

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v6

    throw v6

    :cond_42
    div-int/lit8 v7, v6, 0x2

    int-to-float v7, v7

    add-float/2addr v7, v5

    aput v7, v1, v6

    add-int/lit8 v7, v6, 0x1

    aput v4, v1, v7

    add-int/lit8 v6, v6, 0x2

    goto :goto_17

    :cond_4f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
