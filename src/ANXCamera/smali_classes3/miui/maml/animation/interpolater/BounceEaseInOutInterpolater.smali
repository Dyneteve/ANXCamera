.class public Lmiui/maml/animation/interpolater/BounceEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "BounceEaseInOutInterpolater.java"

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
    .registers 5
    .param p1, "t"    # F

    .line 8
    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v1, p1, v0

    const/high16 v2, 0x40000000    # 2.0f

    if-gez v1, :cond_f

    .line 9
    mul-float/2addr v2, p1

    invoke-static {v2}, Lmiui/maml/animation/interpolater/BounceEaseInInterpolater;->getInterpolationImp(F)F

    move-result v1

    mul-float/2addr v1, v0

    return v1

    .line 11
    :cond_f
    mul-float/2addr v2, p1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v2, v1

    invoke-static {v2}, Lmiui/maml/animation/interpolater/BounceEaseOutInterpolater;->getInterpolationImp(F)F

    move-result v1

    mul-float/2addr v1, v0

    add-float/2addr v1, v0

    return v1
.end method
