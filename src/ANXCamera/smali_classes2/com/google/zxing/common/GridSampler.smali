.class public abstract Lcom/google/zxing/common/GridSampler;
.super Ljava/lang/Object;
.source "GridSampler.java"


# static fields
.field private static gridSampler:Lcom/google/zxing/common/GridSampler;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/zxing/common/DefaultGridSampler;

    invoke-direct {v0}, Lcom/google/zxing/common/DefaultGridSampler;-><init>()V

    sput-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static checkAndNudgePoints(Lcom/google/zxing/common/BitMatrix;[F)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    :goto_a
    array-length v4, p1

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-ge v3, v4, :cond_4b

    if-nez v2, :cond_12

    goto :goto_4b

    :cond_12
    aget v4, p1, v3

    float-to-int v4, v4

    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    if-lt v4, v6, :cond_46

    if-gt v4, v0, :cond_46

    if-lt v7, v6, :cond_46

    if-gt v7, v1, :cond_46

    const/4 v2, 0x0

    if-ne v4, v6, :cond_29

    aput v5, p1, v3

    const/4 v2, 0x1

    goto :goto_31

    :cond_29
    if-ne v4, v0, :cond_31

    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    const/4 v2, 0x1

    :cond_31
    :goto_31
    if-ne v7, v6, :cond_39

    add-int/lit8 v6, v3, 0x1

    aput v5, p1, v6

    const/4 v2, 0x1

    goto :goto_43

    :cond_39
    if-ne v7, v1, :cond_43

    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v6, v1, -0x1

    int-to-float v6, v6

    aput v6, p1, v5

    const/4 v2, 0x1

    :cond_43
    :goto_43
    add-int/lit8 v3, v3, 0x2

    goto :goto_a

    :cond_46
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_4b
    :goto_4b
    const/4 v2, 0x1

    array-length v3, p1

    add-int/lit8 v3, v3, -0x2

    :goto_4f
    if-ltz v3, :cond_8d

    if-nez v2, :cond_54

    goto :goto_8d

    :cond_54
    aget v4, p1, v3

    float-to-int v4, v4

    add-int/lit8 v7, v3, 0x1

    aget v7, p1, v7

    float-to-int v7, v7

    if-lt v4, v6, :cond_88

    if-gt v4, v0, :cond_88

    if-lt v7, v6, :cond_88

    if-gt v7, v1, :cond_88

    const/4 v2, 0x0

    if-ne v4, v6, :cond_6b

    aput v5, p1, v3

    const/4 v2, 0x1

    goto :goto_73

    :cond_6b
    if-ne v4, v0, :cond_73

    add-int/lit8 v8, v0, -0x1

    int-to-float v8, v8

    aput v8, p1, v3

    const/4 v2, 0x1

    :cond_73
    :goto_73
    if-ne v7, v6, :cond_7b

    add-int/lit8 v8, v3, 0x1

    aput v5, p1, v8

    const/4 v2, 0x1

    goto :goto_85

    :cond_7b
    if-ne v7, v1, :cond_85

    add-int/lit8 v8, v3, 0x1

    add-int/lit8 v9, v1, -0x1

    int-to-float v9, v9

    aput v9, p1, v8

    const/4 v2, 0x1

    :cond_85
    :goto_85
    add-int/lit8 v3, v3, -0x2

    goto :goto_4f

    :cond_88
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_8d
    :goto_8d
    return-void
.end method

.method public static getInstance()Lcom/google/zxing/common/GridSampler;
    .registers 1

    sget-object v0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-object v0
.end method

.method public static setGridSampler(Lcom/google/zxing/common/GridSampler;)V
    .registers 1

    sput-object p0, Lcom/google/zxing/common/GridSampler;->gridSampler:Lcom/google/zxing/common/GridSampler;

    return-void
.end method


# virtual methods
.method public abstract sampleGrid(Lcom/google/zxing/common/BitMatrix;IIFFFFFFFFFFFFFFFF)Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public abstract sampleGrid(Lcom/google/zxing/common/BitMatrix;IILcom/google/zxing/common/PerspectiveTransform;)Lcom/google/zxing/common/BitMatrix;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method
