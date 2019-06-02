.class Landroid/support/v4/view/ScaleGestureDetectorCompatKitKat;
.super Ljava/lang/Object;
.source "ScaleGestureDetectorCompatKitKat.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isQuickScaleEnabled(Ljava/lang/Object;)Z
    .registers 2

    move-object v0, p0

    check-cast v0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isQuickScaleEnabled()Z

    move-result v0

    return v0
.end method

.method public static setQuickScaleEnabled(Ljava/lang/Object;Z)V
    .registers 3

    move-object v0, p0

    check-cast v0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    return-void
.end method
