.class public Lmiui/maml/animation/interpolater/BounceEaseInInterpolater;
.super Ljava/lang/Object;
.source "BounceEaseInInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInterpolationImp(F)F
    .registers 3

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float v1, v0, p0

    invoke-static {v1}, Lmiui/maml/animation/interpolater/BounceEaseOutInterpolater;->getInterpolationImp(F)F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 3

    invoke-static {p1}, Lmiui/maml/animation/interpolater/BounceEaseInInterpolater;->getInterpolationImp(F)F

    move-result v0

    return v0
.end method
