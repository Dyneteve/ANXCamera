.class public Lmiui/view/animation/ElasticEaseInInterpolator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private final Qh:F

.field private final Qi:F


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lmiui/view/animation/ElasticEaseInInterpolator;-><init>(FF)V

    return-void
.end method

.method public constructor <init>(FF)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmiui/view/animation/ElasticEaseInInterpolator;->Qh:F

    iput p2, p0, Lmiui/view/animation/ElasticEaseInInterpolator;->Qi:F

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 14

    iget v0, p0, Lmiui/view/animation/ElasticEaseInInterpolator;->Qi:F

    iget v1, p0, Lmiui/view/animation/ElasticEaseInInterpolator;->Qh:F

    const/4 v2, 0x0

    cmpl-float v3, p1, v2

    if-nez v3, :cond_a

    return v2

    :cond_a
    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v4, p1, v3

    if-nez v4, :cond_11

    return v3

    :cond_11
    cmpl-float v4, v0, v2

    if-nez v4, :cond_18

    const v0, 0x3e99999a    # 0.3f

    :cond_18
    cmpl-float v2, v1, v2

    const-wide v4, 0x401921fb54442d18L    # 6.283185307179586

    if-eqz v2, :cond_32

    cmpg-float v2, v1, v3

    if-gez v2, :cond_26

    goto :goto_32

    :cond_26
    float-to-double v6, v0

    div-double/2addr v6, v4

    div-float v2, v3, v1

    float-to-double v8, v2

    invoke-static {v8, v9}, Ljava/lang/Math;->asin(D)D

    move-result-wide v8

    mul-double/2addr v6, v8

    double-to-float v2, v6

    goto :goto_38

    :cond_32
    :goto_32
    nop

    const/high16 v1, 0x40800000    # 4.0f

    div-float v2, v0, v1

    move v1, v3

    :goto_38
    sub-float/2addr p1, v3

    float-to-double v6, v1

    const-wide/high16 v8, 0x4000000000000000L    # 2.0

    const/high16 v1, 0x41200000    # 10.0f

    mul-float/2addr v1, p1

    float-to-double v10, v1

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v8

    mul-double/2addr v6, v8

    sub-float/2addr p1, v2

    float-to-double v1, p1

    mul-double/2addr v1, v4

    float-to-double v3, v0

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    mul-double/2addr v6, v0

    double-to-float p1, v6

    neg-float p1, p1

    return p1
.end method
