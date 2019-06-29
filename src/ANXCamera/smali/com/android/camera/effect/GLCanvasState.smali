.class public Lcom/android/camera/effect/GLCanvasState;
.super Ljava/lang/Object;
.source "GLCanvasState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;
    }
.end annotation


# instance fields
.field private mAlpha:F

.field private mBlendAlpha:F

.field private mCanvasStateStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;",
            ">;"
        }
    .end annotation
.end field

.field private final mIdentityMatrix:[F

.field private mMVPMatrix:[F

.field private mModelMatrix:[F

.field private mProjectionMatrix:[F

.field private mTexMatrix:[F

.field private mViewMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    iput-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mCanvasStateStack:Ljava/util/Stack;

    const/16 v0, 0x10

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mMVPMatrix:[F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    const/high16 v1, -0x40800000    # -1.0f

    iput v1, p0, Lcom/android/camera/effect/GLCanvasState;->mBlendAlpha:F

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mIdentityMatrix:[F

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public frustum(FFFF)V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    const/4 v1, 0x0

    const/high16 v6, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->frustumM([FIFFFFFF)V

    return-void
.end method

.method public getAlpha()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    return v0
.end method

.method public getBlendAlpha()F
    .locals 1

    iget v0, p0, Lcom/android/camera/effect/GLCanvasState;->mBlendAlpha:F

    return v0
.end method

.method public getFinalMatrix()[F
    .locals 12

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mMVPMatrix:[F

    iget-object v2, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    iget-object v4, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget-object v6, p0, Lcom/android/camera/effect/GLCanvasState;->mMVPMatrix:[F

    iget-object v8, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    iget-object v10, p0, Lcom/android/camera/effect/GLCanvasState;->mMVPMatrix:[F

    const/4 v7, 0x0

    const/4 v9, 0x0

    const/4 v11, 0x0

    invoke-static/range {v6 .. v11}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mMVPMatrix:[F

    return-object v0
.end method

.method public getIdentityMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mIdentityMatrix:[F

    return-object v0
.end method

.method public getModelMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    return-object v0
.end method

.method public getProjectionMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    return-object v0
.end method

.method public getTexMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    return-object v0
.end method

.method public getViewMatrix()[F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    return-object v0
.end method

.method public identityAllM()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public identityModelM()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public identityProjectionM()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public identityTexM()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public identityViewM()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public multiplyAlpha(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    iget v0, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    mul-float/2addr v0, p1

    iput v0, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    return-void
.end method

.method public multiplyMatrix([FI)V
    .locals 7

    const/16 v0, 0x10

    new-array v0, v0, [F

    iget-object v3, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, v0

    move-object v5, p1

    move v6, p2

    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iput-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    return-void
.end method

.method public ortho(FFFF)V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mProjectionMatrix:[F

    const/4 v1, 0x0

    const/high16 v6, -0x40800000    # -1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    return-void
.end method

.method public popState()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mCanvasStateStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mCanvasStateStack:Ljava/util/Stack;

    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->getModelMatrix()[F

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->getTexMatrix()[F

    move-result-object v1

    iput-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->getAlpha()F

    move-result v1

    iput v1, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    invoke-virtual {v0}, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;->getBlendAlpha()F

    move-result v0

    iput v0, p0, Lcom/android/camera/effect/GLCanvasState;->mBlendAlpha:F

    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public projection(FFFFFFF)V
    .locals 5

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-eqz v1, :cond_1

    invoke-static {p7}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/4 v2, 0x1

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x10

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v1, v2

    const/4 v4, 0x1

    aput v0, v1, v4

    const/4 v4, 0x2

    aput v0, v1, v4

    const/4 v4, 0x3

    aput v0, v1, v4

    const/4 v4, 0x4

    aput v0, v1, v4

    const/4 v4, 0x5

    aput v3, v1, v4

    const/4 v4, 0x6

    aput v0, v1, v4

    const/4 v4, 0x7

    aput v0, v1, v4

    const/16 v4, 0x8

    neg-float p5, p5

    div-float/2addr p5, p7

    aput p5, v1, v4

    const/16 p5, 0x9

    neg-float p6, p6

    div-float/2addr p6, p7

    aput p6, v1, p5

    const/16 p5, 0xa

    aput v0, v1, p5

    const/16 p5, 0xb

    const/high16 p6, -0x40800000    # -1.0f

    div-float/2addr p6, p7

    aput p6, v1, p5

    const/16 p5, 0xc

    aput v0, v1, p5

    const/16 p5, 0xd

    aput v0, v1, p5

    const/16 p5, 0xe

    aput v0, v1, p5

    const/16 p5, 0xf

    aput v3, v1, p5

    invoke-virtual {p0, v1, v2}, Lcom/android/camera/effect/GLCanvasState;->multiplyMatrix([FI)V

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/android/camera/effect/GLCanvasState;->rotate(FFFF)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public pushState()V
    .locals 8

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mCanvasStateStack:Ljava/util/Stack;

    new-instance v7, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;

    iget-object v3, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    iget-object v4, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    iget v5, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    iget v6, p0, Lcom/android/camera/effect/GLCanvasState;->mBlendAlpha:F

    move-object v1, v7

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/effect/GLCanvasState$CanvasStateConfig;-><init>(Lcom/android/camera/effect/GLCanvasState;[F[FFF)V

    invoke-virtual {v0, v7}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public rotate(FFFF)V
    .locals 7

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v2, 0x0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-static/range {v1 .. v6}, Landroid/opengl/Matrix;->rotateM([FIFFFF)V

    return-void
.end method

.method public scale(FFF)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2, p3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    return-void
.end method

.method public setAlpha(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    iput p1, p0, Lcom/android/camera/effect/GLCanvasState;->mAlpha:F

    return-void
.end method

.method public setBlendAlpha(F)V
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/android/gallery3d/ui/Utils;->assertTrue(Z)V

    iput p1, p0, Lcom/android/camera/effect/GLCanvasState;->mBlendAlpha:F

    return-void
.end method

.method public setIdentity()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public setLookAt(FFFFFFFFF)V
    .locals 11

    move-object v0, p0

    iget-object v0, v0, Lcom/android/camera/effect/GLCanvasState;->mViewMatrix:[F

    const/4 v1, 0x0

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-static/range {v0 .. v10}, Landroid/opengl/Matrix;->setLookAtM([FIFFFFFFFFF)V

    return-void
.end method

.method public setTexMatrix(FFFF)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    sub-float/2addr p3, p1

    aput p3, v0, v1

    iget-object p3, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    sub-float/2addr p4, p2

    const/4 v0, 0x5

    aput p4, p3, v0

    iget-object p3, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/high16 p4, 0x3f800000    # 1.0f

    const/16 v0, 0xa

    aput p4, p3, v0

    iget-object p3, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/16 v0, 0xc

    aput p1, p3, v0

    iget-object p1, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/16 p3, 0xd

    aput p2, p1, p3

    iget-object p1, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/16 p2, 0xf

    aput p4, p1, p2

    return-void
.end method

.method public setTexMatrix([F)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mTexMatrix:[F

    const/4 v1, 0x0

    const/16 v2, 0x10

    invoke-static {p1, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public translate(FF)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, p2, v2}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    return-void
.end method

.method public translate(FFF)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/effect/GLCanvasState;->mModelMatrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1, p1, p2, p3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    return-void
.end method
