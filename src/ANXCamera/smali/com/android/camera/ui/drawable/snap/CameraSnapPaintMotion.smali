.class public Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraSnapPaintMotion.java"


# instance fields
.field private mIsOutstandingRound:Z

.field private mLastAngle:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 14

    iget v0, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentWidthPercent:F

    mul-float/2addr v0, v1

    nop

    nop

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    xor-int/lit8 v1, v1, 0x1

    iput-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    :cond_0
    const/4 v1, 0x0

    :goto_0
    const/16 v3, 0x28

    if-ge v1, v3, :cond_7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    mul-int/lit8 v3, v1, 0x9

    int-to-float v3, v3

    iget v4, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v3, v4, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    const/16 v4, 0xc

    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    iget-boolean v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    const/16 v7, 0x13

    const/high16 v8, 0x42b40000    # 90.0f

    if-eqz v6, :cond_5

    cmpl-float v6, v3, v2

    if-nez v6, :cond_1

    iget-boolean v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->needZero:Z

    if-eqz v6, :cond_1

    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3

    :cond_1
    iget v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    cmpg-float v6, v3, v6

    if-gez v6, :cond_3

    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    if-eqz v9, :cond_2

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    goto :goto_1

    :cond_2
    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    :goto_1
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_3

    :cond_3
    iget-object v6, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    iget-boolean v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mIsOutstandingRound:Z

    if-eqz v9, :cond_4

    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_HINT:I

    goto :goto_2

    :cond_4
    sget v9, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    :goto_2
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    :goto_3
    rem-float/2addr v3, v8

    cmpl-float v3, v3, v2

    if-nez v3, :cond_6

    goto :goto_4

    :cond_5
    rem-float/2addr v3, v8

    cmpl-float v3, v3, v2

    if-nez v3, :cond_6

    goto :goto_4

    :cond_6
    move v7, v4

    :goto_4
    iget v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v10, v3, v0

    iget v11, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v3, v0

    int-to-float v4, v7

    add-float v12, v3, v4

    iget-object v13, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_7
    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iput v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mLastAngle:F

    iget-boolean v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->isRecording:Z

    if-eqz v1, :cond_8

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->timeAngle:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    invoke-virtual {p1, v1, v2, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget v1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mCurrentAlpha:I

    iget-object v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget v3, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->ALPHA_OUTSTANDING:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    iget v5, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float v6, v2, v0

    iget v7, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleX:F

    iget v2, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mMiddleY:F

    sub-float/2addr v2, v0

    const/high16 v0, 0x41980000    # 19.0f

    add-float v8, v2, v0

    iget-object v9, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    :cond_8
    return-void
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 1

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/snap/CameraSnapPaintMotion;->mPaint:Landroid/graphics/Paint;

    const/high16 v0, 0x40400000    # 3.0f

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method
