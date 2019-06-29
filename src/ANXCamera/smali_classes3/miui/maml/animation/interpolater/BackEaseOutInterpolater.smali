.class public Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;
.super Ljava/lang/Object;
.source "BackEaseOutInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# instance fields
.field private final mFactor:F


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x3fd9cd60

    iput v0, p0, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;->mFactor:F

    return-void
.end method

.method public constructor <init>(F)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;->mFactor:F

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 6

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float v1, p1, v0

    move p1, v1

    mul-float/2addr v1, p1

    iget v2, p0, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;->mFactor:F

    add-float/2addr v2, v0

    mul-float/2addr v2, p1

    iget v3, p0, Lmiui/maml/animation/interpolater/BackEaseOutInterpolater;->mFactor:F

    add-float/2addr v2, v3

    mul-float/2addr v1, v2

    add-float/2addr v1, v0

    return v1
.end method
