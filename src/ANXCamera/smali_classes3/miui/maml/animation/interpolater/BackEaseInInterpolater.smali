.class public Lmiui/maml/animation/interpolater/BackEaseInInterpolater;
.super Ljava/lang/Object;
.source "BackEaseInInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private final mFactor:F


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const v0, 0x3fd9cd60

    iput v0, p0, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;->mFactor:F

    .line 11
    return-void
.end method

.method public constructor <init>(F)V
    .registers 2
    .param p1, "factor"    # F

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;->mFactor:F

    .line 15
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 5
    .param p1, "t"    # F

    .line 18
    mul-float v0, p1, p1

    iget v1, p0, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;->mFactor:F

    const/high16 v2, 0x3f800000    # 1.0f

    add-float/2addr v1, v2

    mul-float/2addr v1, p1

    iget v2, p0, Lmiui/maml/animation/interpolater/BackEaseInInterpolater;->mFactor:F

    sub-float/2addr v1, v2

    mul-float/2addr v0, v1

    return v0
.end method
