.class public Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;
.super Ljava/lang/Object;
.source "ElasticEaseOutInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private mAmplitude:F

.field private mPriod:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const v0, 0x3e99999a    # 0.3f

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mPriod:F

    .line 12
    const/4 v0, 0x0

    iput v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mAmplitude:F

    .line 13
    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3
    .param p1, "priod"    # F
    .param p2, "amplitude"    # F

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput p1, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mPriod:F

    .line 17
    iput p2, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mAmplitude:F

    .line 18
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 13
    .param p1, "t"    # F

    .line 21
    iget v0, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mAmplitude:F

    .line 24
    .local v0, "a":F
    const/4 v1, 0x0

    cmpl-float v2, p1, v1

    if-nez v2, :cond_8

    .line 25
    return v1

    .line 26
    :cond_8
    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v2, p1, v1

    if-nez v2, :cond_f

    .line 27
    return v1

    .line 28
    :cond_f
    cmpg-float v2, v0, v1

    const-wide v3, 0x401921fb54442d18L    # 6.283185307179586

    if-gez v2, :cond_20

    .line 29
    const/high16 v0, 0x3f800000    # 1.0f

    .line 30
    iget v1, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mPriod:F

    const/high16 v2, 0x40800000    # 4.0f

    div-float/2addr v1, v2

    .local v1, "s":F
    goto :goto_2c

    .line 32
    .end local v1    # "s":F
    :cond_20
    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mPriod:F

    float-to-double v5, v2

    div-double/2addr v5, v3

    div-float/2addr v1, v0

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->asin(D)D

    move-result-wide v1

    mul-double/2addr v5, v1

    double-to-float v1, v5

    .line 34
    .restart local v1    # "s":F
    :goto_2c
    float-to-double v5, v0

    const-wide/high16 v7, 0x4000000000000000L    # 2.0

    const/high16 v2, -0x3ee00000    # -10.0f

    mul-float/2addr v2, p1

    float-to-double v9, v2

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v7

    mul-double/2addr v5, v7

    sub-float v2, p1, v1

    float-to-double v7, v2

    mul-double/2addr v7, v3

    iget v2, p0, Lmiui/maml/animation/interpolater/ElasticEaseOutInterpolater;->mPriod:F

    float-to-double v2, v2

    div-double/2addr v7, v2

    invoke-static {v7, v8}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double/2addr v5, v2

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    add-double/2addr v5, v2

    double-to-float v2, v5

    return v2
.end method
