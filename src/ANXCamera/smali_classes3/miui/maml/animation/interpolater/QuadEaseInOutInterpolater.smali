.class public Lmiui/maml/animation/interpolater/QuadEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "QuadEaseInOutInterpolater.java"

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
    .registers 6
    .param p1, "t"    # F

    .line 8
    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, p1, v0

    move p1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_10

    .line 9
    const/high16 v0, 0x3f000000    # 0.5f

    mul-float/2addr v0, p1

    mul-float/2addr v0, p1

    return v0

    .line 10
    :cond_10
    const/high16 v1, -0x41000000    # -0.5f

    sub-float v3, p1, v2

    move p1, v3

    sub-float v0, p1, v0

    mul-float/2addr v3, v0

    sub-float/2addr v3, v2

    mul-float/2addr v1, v3

    return v1
.end method
