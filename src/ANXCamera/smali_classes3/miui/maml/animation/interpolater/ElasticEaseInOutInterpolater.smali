.class public Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "ElasticEaseInOutInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private mAmplitude:F

.field private mPriod:F


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x3ee66667    # 0.45000002f

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    const/4 v0, 0x0

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mAmplitude:F

    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    iput p2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mAmplitude:F

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 14

    iget v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mAmplitude:F

    const/4 v1, 0x0

    cmpl-float v2, p1, v1

    if-nez v2, :cond_8

    return v1

    :cond_8
    const/high16 v1, 0x3f000000    # 0.5f

    div-float v1, p1, v1

    move p1, v1

    const/high16 v2, 0x40000000    # 2.0f

    cmpl-float v1, v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    if-nez v1, :cond_16

    return v2

    :cond_16
    cmpg-float v1, v0, v2

    const-wide v3, 0x401921fb54442d18L    # 6.283185307179586

    if-gez v1, :cond_27

    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    const/high16 v5, 0x40800000    # 4.0f

    div-float/2addr v1, v5

    goto :goto_34

    :cond_27
    iget v1, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    float-to-double v5, v1

    div-double/2addr v5, v3

    div-float v1, v2, v0

    float-to-double v7, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->asin(D)D

    move-result-wide v7

    mul-double/2addr v5, v7

    double-to-float v1, v5

    :goto_34
    cmpg-float v5, p1, v2

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    if-gez v5, :cond_59

    const/high16 v5, -0x41000000    # -0.5f

    float-to-double v8, v0

    const/high16 v10, 0x41200000    # 10.0f

    sub-float v2, p1, v2

    move p1, v2

    mul-float/2addr v10, v2

    float-to-double v10, v10

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    mul-double/2addr v8, v6

    sub-float v2, p1, v1

    float-to-double v6, v2

    mul-double/2addr v6, v3

    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    float-to-double v2, v2

    div-double/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double/2addr v8, v2

    double-to-float v2, v8

    mul-float/2addr v5, v2

    return v5

    :cond_59
    float-to-double v8, v0

    const/high16 v5, -0x3ee00000    # -10.0f

    sub-float v2, p1, v2

    move p1, v2

    mul-float/2addr v5, v2

    float-to-double v10, v5

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v5

    mul-double/2addr v8, v5

    sub-float v2, p1, v1

    float-to-double v5, v2

    mul-double/2addr v5, v3

    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInOutInterpolater;->mPriod:F

    float-to-double v2, v2

    div-double/2addr v5, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double/2addr v8, v2

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    mul-double/2addr v8, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double/2addr v8, v2

    double-to-float v2, v8

    return v2
.end method
