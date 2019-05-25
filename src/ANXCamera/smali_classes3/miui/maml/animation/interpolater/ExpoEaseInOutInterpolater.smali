.class public Lmiui/maml/animation/interpolater/ExpoEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "ExpoEaseInOutInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 7
    .param p1, "t"    # F

    .line 8
    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-nez v1, :cond_6

    .line 9
    return v0

    .line 10
    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    if-nez v1, :cond_d

    .line 11
    return v0

    .line 12
    :cond_d
    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v1, p1

    move p1, v1

    cmpg-float v1, v1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    if-gez v1, :cond_26

    .line 13
    const/high16 v1, 0x41200000    # 10.0f

    sub-float v0, p1, v0

    mul-float/2addr v1, v0

    float-to-double v0, v1

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    double-to-float v0, v0

    mul-float/2addr v2, v0

    return v2

    .line 14
    :cond_26
    const/high16 v1, -0x3ee00000    # -10.0f

    sub-float v0, p1, v0

    move p1, v0

    mul-float/2addr v1, v0

    float-to-double v0, v1

    invoke-static {v3, v4, v0, v1}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v0

    neg-double v0, v0

    add-double/2addr v0, v3

    double-to-float v0, v0

    mul-float/2addr v2, v0

    return v2
.end method
