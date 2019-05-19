.class public Lcom/android/camera/CaptureAnimManager;
.super Ljava/lang/Object;
.source "CaptureAnimManager.java"


# static fields
.field private static final ANIM_BOTH:I = 0x1

.field private static final ANIM_HOLD:I = 0x2

.field private static final ANIM_NONE:I = 0x0

.field private static final ANIM_SLIDE:I = 0x3

.field private static final TIME_HOLD:I = 0x14

.field private static final TIME_SLIDE:I = 0x3c


# instance fields
.field private mAnimStartTime:J

.field private mAnimType:I

.field private mDrawHeight:I

.field private mDrawWidth:I

.field private mX:F

.field private mY:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public animateHold()V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    return-void
.end method

.method public animateHoldAndSlide()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    return-void
.end method

.method public animateSlide()V
    .locals 2

    iget v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimStartTime:J

    return-void
.end method

.method public clearAnimation()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    return-void
.end method

.method public draw(Lcom/android/gallery3d/ui/GLCanvas;IIIILcom/android/gallery3d/ui/RawTexture;)V
    .locals 6

    move-object v0, p6

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/gallery3d/ui/RawTexture;->draw(Lcom/android/gallery3d/ui/GLCanvas;IIII)V

    return-void
.end method

.method public drawAnimation(Lcom/android/gallery3d/ui/GLCanvas;Lcom/android/gallery3d/ui/RawTexture;)Z
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, v0, Lcom/android/camera/CaptureAnimManager;->mAnimStartTime:J

    sub-long/2addr v2, v4

    iget v4, v0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    const/4 v5, 0x3

    const/4 v6, 0x0

    if-ne v4, v5, :cond_0

    const-wide/16 v7, 0x3c

    cmp-long v4, v2, v7

    if-lez v4, :cond_0

    return v6

    :cond_0
    iget v4, v0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    const/4 v7, 0x1

    if-ne v4, v7, :cond_1

    const-wide/16 v8, 0x50

    cmp-long v4, v2, v8

    if-lez v4, :cond_1

    return v6

    :cond_1
    iget v4, v0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    iget v8, v0, Lcom/android/camera/CaptureAnimManager;->mAnimType:I

    const/4 v9, 0x2

    if-ne v8, v7, :cond_3

    const-wide/16 v10, 0x14

    cmp-long v2, v2, v10

    if-gez v2, :cond_2

    move v4, v9

    goto :goto_0

    :cond_2
    nop

    move v4, v5

    :cond_3
    :goto_0
    if-ne v4, v9, :cond_4

    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v3, v0, Lcom/android/camera/CaptureAnimManager;->mX:F

    float-to-int v12, v3

    iget v3, v0, Lcom/android/camera/CaptureAnimManager;->mY:F

    float-to-int v13, v3

    iget v14, v0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    iget v15, v0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    move-object v10, v2

    move-object/from16 v11, p2

    invoke-direct/range {v10 .. v15}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {v1, v2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    goto :goto_1

    :cond_4
    if-ne v4, v5, :cond_5

    new-instance v2, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;

    iget v3, v0, Lcom/android/camera/CaptureAnimManager;->mX:F

    float-to-int v3, v3

    iget v4, v0, Lcom/android/camera/CaptureAnimManager;->mY:F

    float-to-int v4, v4

    iget v5, v0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    iget v8, v0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    move-object/from16 v16, v2

    move-object/from16 v17, p2

    move/from16 v18, v3

    move/from16 v19, v4

    move/from16 v20, v5

    move/from16 v21, v8

    invoke-direct/range {v16 .. v21}, Lcom/android/camera/effect/draw_mode/DrawBasicTexAttribute;-><init>(Lcom/android/gallery3d/ui/BasicTexture;IIII)V

    invoke-interface {v1, v2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    new-instance v2, Lcom/android/camera/effect/draw_mode/FillRectAttribute;

    iget v10, v0, Lcom/android/camera/CaptureAnimManager;->mX:F

    iget v11, v0, Lcom/android/camera/CaptureAnimManager;->mY:F

    iget v3, v0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    int-to-float v12, v3

    iget v0, v0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    int-to-float v13, v0

    const/16 v0, 0xb2

    invoke-static {v0, v6, v6, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v14

    move-object v9, v2

    invoke-direct/range {v9 .. v14}, Lcom/android/camera/effect/draw_mode/FillRectAttribute;-><init>(FFFFI)V

    invoke-interface {v1, v2}, Lcom/android/gallery3d/ui/GLCanvas;->draw(Lcom/android/camera/effect/draw_mode/DrawAttribute;)V

    :goto_1
    return v7

    :cond_5
    return v6
.end method

.method public startAnimation(IIII)V
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/CaptureAnimManager;->mAnimStartTime:J

    iput p3, p0, Lcom/android/camera/CaptureAnimManager;->mDrawWidth:I

    iput p4, p0, Lcom/android/camera/CaptureAnimManager;->mDrawHeight:I

    int-to-float p1, p1

    iput p1, p0, Lcom/android/camera/CaptureAnimManager;->mX:F

    int-to-float p1, p2

    iput p1, p0, Lcom/android/camera/CaptureAnimManager;->mY:F

    return-void
.end method
