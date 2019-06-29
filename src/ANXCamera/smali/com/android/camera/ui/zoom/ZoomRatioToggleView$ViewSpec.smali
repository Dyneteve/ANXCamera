.class public Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;
.super Ljava/lang/Object;
.source "ZoomRatioToggleView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/zoom/ZoomRatioToggleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewSpec"
.end annotation


# instance fields
.field public final immersive:Z

.field public final suppress:Z

.field public final useSlider:Z

.field public final visibility:I


# direct methods
.method public constructor <init>(IZZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->visibility:I

    iput-boolean p2, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->suppress:Z

    iput-boolean p3, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->immersive:Z

    iput-boolean p4, p0, Lcom/android/camera/ui/zoom/ZoomRatioToggleView$ViewSpec;->useSlider:Z

    return-void
.end method
