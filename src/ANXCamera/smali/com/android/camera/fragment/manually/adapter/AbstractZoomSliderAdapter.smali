.class public abstract Lcom/android/camera/fragment/manually/adapter/AbstractZoomSliderAdapter;
.super Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;
.source "AbstractZoomSliderAdapter.java"

# interfaces
.implements Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;-><init>()V

    return-void
.end method

.method protected static getRealZoomRatioTele()I
    .locals 1

    sget-boolean v0, Lcom/mi/config/b;->rB:Z

    if-eqz v0, :cond_0

    const/16 v0, 0x11

    goto :goto_0

    :cond_0
    const/16 v0, 0x14

    :goto_0
    return v0
.end method


# virtual methods
.method public abstract isEnable()Z
.end method

.method public abstract mapPositionToZoomRatio(F)F
.end method

.method public abstract mapZoomRatioToPosition(F)F
.end method

.method public abstract setEnable(Z)V
.end method
