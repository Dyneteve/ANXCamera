.class public Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;
.super Ljava/lang/Object;
.source "BackEaseInOutInterpolater.java"

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

    iput v0, p0, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;->mFactor:F

    .line 11
    return-void
.end method

.method public constructor <init>(F)V
    .registers 2
    .param p1, "factor"    # F

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput p1, p0, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;->mFactor:F

    .line 15
    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 11
    .param p1, "t"    # F

    .line 18
    iget v0, p0, Lmiui/maml/animation/interpolater/BackEaseInOutInterpolater;->mFactor:F

    .line 20
    .local v0, "s":F
    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, p1, v1

    move p1, v2

    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v2, v2, v3

    const-wide v4, 0x3ff8666666666666L    # 1.525

    const/high16 v6, 0x3f000000    # 0.5f

    if-gez v2, :cond_20

    .line 21
    mul-float v1, p1, p1

    float-to-double v7, v0

    mul-double/2addr v7, v4

    double-to-float v2, v7

    move v0, v2

    add-float/2addr v2, v3

    mul-float/2addr v2, p1

    sub-float/2addr v2, v0

    mul-float/2addr v1, v2

    mul-float/2addr v6, v1

    return v6

    .line 22
    :cond_20
    sub-float v2, p1, v1

    move p1, v2

    mul-float/2addr v2, p1

    float-to-double v7, v0

    mul-double/2addr v7, v4

    double-to-float v4, v7

    move v0, v4

    add-float/2addr v4, v3

    mul-float/2addr v4, p1

    add-float/2addr v4, v0

    mul-float/2addr v2, v4

    add-float/2addr v2, v1

    mul-float/2addr v6, v2

    return v6
.end method
