.class Landroid/support/v4/view/animation/PathInterpolatorDonut;
.super Ljava/lang/Object;
.source "PathInterpolatorDonut.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# static fields
.field private static final PRECISION:F = 0.002f


# instance fields
.field private final mX:[F

.field private final mY:[F


# direct methods
.method public constructor <init>(FF)V
    .registers 4

    invoke-static {p1, p2}, Landroid/support/v4/view/animation/PathInterpolatorDonut;->createQuad(FF)Landroid/graphics/Path;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/view/animation/PathInterpolatorDonut;-><init>(Landroid/graphics/Path;)V

    return-void
.end method

.method public constructor <init>(FFFF)V
    .registers 6

    invoke-static {p1, p2, p3, p4}, Landroid/support/v4/view/animation/PathInterpolatorDonut;->createCubic(FFFF)Landroid/graphics/Path;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v4/view/animation/PathInterpolatorDonut;-><init>(Landroid/graphics/Path;)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Path;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/PathMeasure;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    invoke-virtual {v0}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v2

    const v3, 0x3b03126f    # 0.002f

    div-float v3, v2, v3

    float-to-int v3, v3

    const/4 v4, 0x1

    add-int/2addr v3, v4

    new-array v5, v3, [F

    iput-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    new-array v5, v3, [F

    iput-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    const/4 v5, 0x2

    new-array v5, v5, [F

    move v6, v1

    :goto_21
    if-ge v6, v3, :cond_3c

    int-to-float v7, v6

    mul-float/2addr v7, v2

    add-int/lit8 v8, v3, -0x1

    int-to-float v8, v8

    div-float/2addr v7, v8

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v5, v8}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    iget-object v8, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v9, v5, v1

    aput v9, v8, v6

    iget-object v8, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v9, v5, v4

    aput v9, v8, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    :cond_3c
    return-void
.end method

.method private static createCubic(FFFF)Landroid/graphics/Path;
    .registers 12

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move-object v1, v0

    move v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    return-object v0
.end method

.method private static createQuad(FF)Landroid/graphics/Path;
    .registers 4

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, p0, p1, v1, v1}, Landroid/graphics/Path;->quadTo(FFFF)V

    return-object v0
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 10

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gtz v1, :cond_6

    return v0

    :cond_6
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    if-ltz v2, :cond_d

    return v1

    :cond_d
    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    array-length v2, v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    :goto_13
    sub-int v4, v2, v1

    if-le v4, v3, :cond_27

    add-int v4, v1, v2

    div-int/lit8 v4, v4, 0x2

    iget-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v5, v5, v4

    cmpg-float v5, p1, v5

    if-gez v5, :cond_25

    move v2, v4

    goto :goto_26

    :cond_25
    move v1, v4

    :goto_26
    goto :goto_13

    :cond_27
    iget-object v3, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v3, v3, v2

    iget-object v4, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v4, v4, v1

    sub-float/2addr v3, v4

    cmpl-float v0, v3, v0

    if-nez v0, :cond_39

    iget-object v0, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v0, v0, v1

    return v0

    :cond_39
    iget-object v0, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mX:[F

    aget v0, v0, v1

    sub-float v0, p1, v0

    div-float v4, v0, v3

    iget-object v5, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v5, v5, v1

    iget-object v6, p0, Landroid/support/v4/view/animation/PathInterpolatorDonut;->mY:[F

    aget v6, v6, v2

    sub-float v7, v6, v5

    mul-float/2addr v7, v4

    add-float/2addr v7, v5

    return v7
.end method
