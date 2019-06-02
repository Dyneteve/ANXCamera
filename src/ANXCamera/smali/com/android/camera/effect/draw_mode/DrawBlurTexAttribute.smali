.class public final Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;
.source "DrawBlurTexAttribute.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>()V

    const/16 v0, 0xa

    iput v0, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>()V

    invoke-virtual {p0, p1}, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->init(Lcom/android/gallery3d/ui/BasicTexture;)Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    return-void
.end method

.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    const/16 p1, 0xa

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawBlurTexAttribute;->mTarget:I

    return-void
.end method
