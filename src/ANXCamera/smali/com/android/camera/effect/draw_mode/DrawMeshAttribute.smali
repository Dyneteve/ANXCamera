.class public Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;
.super Lcom/android/camera/effect/draw_mode/DrawAttribute;
.source "DrawMeshAttribute.java"


# instance fields
.field public mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

.field public mHeight:F

.field public mIndexBuffer:I

.field public mIndexCount:I

.field public mUVBuffer:I

.field public mWidth:F

.field public mX:F

.field public mXYBuffer:I

.field public mY:F


# direct methods
.method public constructor <init>(Lcom/android/gallery3d/ui/BasicTexture;FFIIII)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/effect/draw_mode/DrawAttribute;-><init>()V

    iput p2, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mX:F

    iput p3, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mY:F

    iput p4, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mXYBuffer:I

    iput p5, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mUVBuffer:I

    iput p6, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexBuffer:I

    iput-object p1, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mBasicTexture:Lcom/android/gallery3d/ui/BasicTexture;

    iput p7, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mIndexCount:I

    const/4 p1, 0x2

    iput p1, p0, Lcom/android/camera/effect/draw_mode/DrawMeshAttribute;->mTarget:I

    return-void
.end method
