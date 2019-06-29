.class public Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;
.super Ljava/lang/Object;
.source "ElasticEaseInInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private mAmplitude:F

.field private mPriod:F


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mPriod:F

    const/4 v0, 0x0

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mAmplitude:F

    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mPriod:F

    iput p2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mAmplitude:F

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 13

    iget v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mAmplitude:F

    const/4 v1, 0x0

    cmpl-float v2, p1, v1

    if-nez v2, :cond_8

    return v1

    :cond_8
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    if-nez v2, :cond_f

    return v1

    :cond_f
    cmpg-float v2, v0, v1

    const-wide v3, 0x401921fb54442d18L    # 6.283185307179586

    if-gez v2, :cond_20

    const/high16 v0, 0x3f800000    # 1.0f

    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mPriod:F

    const/high16 v5, 0x40800000    # 4.0f

    div-float/2addr v2, v5

    goto :goto_2d

    :cond_20
    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mPriod:F

    float-to-double v5, v2

    div-double/2addr v5, v3

    div-float v2, v1, v0

    float-to-double v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->asin(D)D

    move-result-wide v7

    mul-double/2addr v5, v7

    double-to-float v2, v5

    :goto_2d
    float-to-double v5, v0

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    const/high16 v9, 0x41200000    # 10.0f

    sub-float v1, p1, v1

    move p1, v1

    mul-float/2addr v9, v1

    float-to-double v9, v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    mul-double/2addr v5, v7

    sub-float v1, p1, v2

    float-to-double v7, v1

    mul-double/2addr v7, v3

    iget v1, p0, Lmiui/maml/animation/interpolater/ElasticEaseInInterpolater;->mPriod:F

    float-to-double v3, v1

    div-double/2addr v7, v3

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v3

    mul-double/2addr v5, v3

    double-to-float v1, v5

    neg-float v1, v1

    return v1
.end method
