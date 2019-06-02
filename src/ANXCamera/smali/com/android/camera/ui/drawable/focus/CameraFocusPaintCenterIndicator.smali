.class public Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;
.super Lcom/android/camera/ui/drawable/CameraPaintBase;
.source "CameraFocusPaintCenterIndicator.java"


# instance fields
.field public indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

.field private mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

.field private mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

.field private mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

.field private mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

.field private mLockMatrix:Landroid/graphics/Matrix;

.field private mMinusMoonPaint:Landroid/graphics/Paint;

.field private mSunPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private drawCenterCaptureBitmap(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :cond_1
    return-void
.end method

.method private drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V
    .locals 0
    .param p5    # Landroid/graphics/Paint;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawCenterLock(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    if-nez v0, :cond_1

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mAEAFHeadPosition:F

    add-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    neg-int v2, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mLockMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method private drawCenterMoon(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    int-to-float v5, v0

    iget-object v6, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    neg-int v0, v0

    int-to-float v3, v0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleCenter:I

    neg-int v0, v0

    int-to-float v4, v0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v5, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentMinusCircleRadius:F

    iget-object v6, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawCenterSun(Landroid/graphics/Canvas;)V
    .locals 9

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentAngle:F

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    if-lez v0, :cond_0

    const/high16 v2, 0x42340000    # 45.0f

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->rotate(F)V

    :cond_0
    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v2, v2

    div-int/2addr v2, v1

    int-to-float v4, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    sub-int/2addr v2, v3

    int-to-float v5, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/2addr v2, v1

    int-to-float v6, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v2, v2

    int-to-float v7, v2

    iget-object v8, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v2, v2

    div-int/2addr v2, v1

    int-to-float v4, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    int-to-float v5, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/2addr v2, v1

    int-to-float v6, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    add-int/2addr v2, v3

    int-to-float v7, v2

    iget-object v8, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    sub-int/2addr v2, v3

    int-to-float v4, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v2, v2

    div-int/2addr v2, v1

    int-to-float v5, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    neg-int v2, v2

    int-to-float v6, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/2addr v2, v1

    int-to-float v7, v2

    iget-object v8, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    int-to-float v4, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    neg-int v2, v2

    div-int/2addr v2, v1

    int-to-float v5, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayBottom:I

    iget-object v3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v3, v3, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayHeight:I

    add-int/2addr v2, v3

    int-to-float v6, v2

    iget-object v2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v2, v2, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRayWidth:I

    div-int/2addr v2, v1

    int-to-float v7, v2

    iget-object v8, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    move-object v3, p1

    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCurrentRadius:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method protected draw(Landroid/graphics/Canvas;)V
    .locals 8

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMiddleY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mBaseRadius:F

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentWidthPercent:F

    mul-float v6, v0, v1

    iget-object v7, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v2 .. v7}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCircle(Landroid/graphics/Canvas;FFFLandroid/graphics/Paint;)V

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterLock(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterMoon(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterSun(Landroid/graphics/Canvas;)V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->drawCenterCaptureBitmap(Landroid/graphics/Canvas;)V

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected initPaint(Landroid/content/Context;)V
    .locals 3

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mSunPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mMinusMoonPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    return-void
.end method

.method public setAEAFIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockHeadBitmap:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mAEAFLockBodyBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public setCenterFlag(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iput p1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    return-void
.end method

.method public setIndicatorData(Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iput-object p2, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->mCaptureIndicatorBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public updateValue(F)V
    .locals 2
    .param p1    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->updateValue(F)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    iget v0, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mCenterFlag:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_0

    nop

    iget-object v0, p0, Lcom/android/camera/ui/drawable/focus/CameraFocusPaintCenterIndicator;->indicatorState:Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;

    const/high16 v1, 0x40a00000    # 5.0f

    mul-float/2addr v1, p1

    iput v1, v0, Lcom/android/camera/ui/drawable/focus/CameraIndicatorState;->mAEAFHeadPosition:F

    :cond_0
    return-void
.end method
