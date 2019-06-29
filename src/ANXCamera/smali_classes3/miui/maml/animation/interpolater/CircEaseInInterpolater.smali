.class public Lmiui/maml/animation/interpolater/CircEaseInInterpolater;
.super Ljava/lang/Object;
.source "CircEaseInInterpolater.java"

# interfaces
.implements Landroid/view/animation/Interpolator;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getInterpolation(F)F
    .registers 6

    mul-float v0, p1, p1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v0, v2

    double-to-float v0, v0

    neg-float v0, v0

    return v0
.end method
