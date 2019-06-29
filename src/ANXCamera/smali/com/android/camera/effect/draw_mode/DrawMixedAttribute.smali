.class public Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawMixedAttribute.java"


# instance fields
.field public mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field public mHeight:F

.field public mRatio:F

.field public mToColor:I

.field public mWidth:F

.field public mX:F

.field public mY:F


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;IFFFF)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mX:F

    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mY:F

    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mWidth:F

    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mHeight:F

    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mToColor:I

    const/4 p1, 0x3

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawMixedAttribute;->mTarget:I

    return-void
.end method
