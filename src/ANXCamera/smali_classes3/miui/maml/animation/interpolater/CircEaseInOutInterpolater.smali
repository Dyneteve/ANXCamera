.class public Lmiui/maml/animation/interpolater/CircEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "CircEaseInOutInterpolater.java"

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
    .registers 9
    .param p1, "t"    # F

    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, p1, v0

    move p1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    if-gez v1, :cond_1b

    .line 9
    const/high16 v0, -0x41000000    # -0.5f

    mul-float v1, p1, p1

    sub-float/2addr v2, v1

    float-to-double v1, v2

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    sub-double/2addr v1, v3

    double-to-float v1, v1

    mul-float/2addr v0, v1

    return v0

    .line 11
    :cond_1b
    const/high16 v1, 0x3f000000    # 0.5f

    sub-float v0, p1, v0

    move p1, v0

    mul-float/2addr v0, p1

    sub-float/2addr v2, v0

    float-to-double v5, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    add-double/2addr v5, v3

    double-to-float v0, v5

    mul-float/2addr v1, v0

    return v1
.end method
