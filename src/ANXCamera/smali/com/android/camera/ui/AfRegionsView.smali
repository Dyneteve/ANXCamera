.class public Lcom/android/camera/ui/AfRegionsView;
.super Landroid/view/View;
.source "AfRegionsView.java"

# interfaces
.implements Lcom/android/camera/ui/Rotatable;


# instance fields
.field private mActiveArraySize:Landroid/graphics/Rect;

.field private mCamera2TranslateMatrix:Landroid/graphics/Matrix;

.field protected mCameraDisplayOrientation:I

.field private mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

.field private mCanvasMatrix:Landroid/graphics/Matrix;

.field private mLightingOn:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMeteringRectangle:Landroid/hardware/camera2/params/MeteringRectangle;

.field protected mOrientation:I

.field private mPaint:Landroid/graphics/Paint;

.field private mRect:Landroid/graphics/RectF;

.field private mZoomValue:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCanvasMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/AfRegionsView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mCanvasMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/AfRegionsView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mCanvasMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/AfRegionsView;->initView(Landroid/content/Context;)V

    return-void
.end method

.method private initView(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    const v1, -0xff0100

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    check-cast p1, Lcom/android/camera/ActivityBase;

    invoke-virtual {p1}, Lcom/android/camera/ActivityBase;->getCameraScreenNail()Lcom/android/camera/CameraScreenNail;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    return-void
.end method

.method private prepareMatrix()V
    .locals 10

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    iget v2, p0, Lcom/android/camera/ui/AfRegionsView;->mZoomValue:F

    invoke-static {v0, v1, v2}, Lcom/android/camera/Util;->scaleCamera2Matrix(Landroid/graphics/Matrix;Landroid/graphics/Rect;F)V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraScreenNail:Lcom/android/camera/CameraScreenNail;

    invoke-virtual {v0}, Lcom/android/camera/CameraScreenNail;->getRenderHeight()I

    move-result v5

    iget v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraDisplayOrientation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraDisplayOrientation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    mul-int/2addr v0, v5

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    div-int/2addr v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    mul-int/2addr v0, v5

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    div-int/2addr v0, v1

    :goto_1
    move v4, v0

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    const/4 v2, 0x0

    iget v3, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraDisplayOrientation:I

    invoke-virtual {p0}, Lcom/android/camera/ui/AfRegionsView;->getWidth()I

    move-result v0

    div-int/lit8 v6, v0, 0x2

    invoke-virtual {p0}, Lcom/android/camera/ui/AfRegionsView;->getHeight()I

    move-result v0

    div-int/lit8 v7, v0, 0x2

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v9

    invoke-static/range {v1 .. v9}, Lcom/android/camera/Util;->prepareMatrix(Landroid/graphics/Matrix;ZIIIIIII)V

    iget-boolean v0, p0, Lcom/android/camera/ui/AfRegionsView;->mLightingOn:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/android/camera/ui/AfRegionsView;->mOrientation:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/android/camera/ui/AfRegionsView;->mOrientation:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postRotate(F)Z

    :cond_2
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMeteringRectangle:Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {p0}, Lcom/android/camera/ui/AfRegionsView;->postInvalidate()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMeteringRectangle:Landroid/hardware/camera2/params/MeteringRectangle;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-boolean v0, p0, Lcom/android/camera/ui/AfRegionsView;->mLightingOn:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/AfRegionsView;->mOrientation:I

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mMeteringRectangle:Landroid/hardware/camera2/params/MeteringRectangle;

    invoke-virtual {v0}, Landroid/hardware/camera2/params/MeteringRectangle;->getRect()Landroid/graphics/Rect;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/ui/AfRegionsView;->transToViewRect(Landroid/graphics/Rect;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/android/camera/ui/AfRegionsView;->mRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/android/camera/ui/AfRegionsView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public setAfRegionRect([Landroid/hardware/camera2/params/MeteringRectangle;Landroid/graphics/Rect;F)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iput-object p1, p0, Lcom/android/camera/ui/AfRegionsView;->mMeteringRectangle:Landroid/hardware/camera2/params/MeteringRectangle;

    iput-object p2, p0, Lcom/android/camera/ui/AfRegionsView;->mActiveArraySize:Landroid/graphics/Rect;

    iput p3, p0, Lcom/android/camera/ui/AfRegionsView;->mZoomValue:F

    invoke-direct {p0}, Lcom/android/camera/ui/AfRegionsView;->prepareMatrix()V

    invoke-virtual {p0}, Lcom/android/camera/ui/AfRegionsView;->postInvalidate()V

    :cond_0
    return-void
.end method

.method public setCameraDisplayOrientation(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/AfRegionsView;->mCameraDisplayOrientation:I

    return-void
.end method

.method public setLightingOn(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/AfRegionsView;->mLightingOn:Z

    return-void
.end method

.method public setOrientation(IZ)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/AfRegionsView;->mOrientation:I

    invoke-virtual {p0}, Lcom/android/camera/ui/AfRegionsView;->invalidate()V

    return-void
.end method

.method public transToViewRect(Landroid/graphics/Rect;Landroid/graphics/RectF;)V
    .locals 0

    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/android/camera/ui/AfRegionsView;->mCamera2TranslateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p1, p0, Lcom/android/camera/ui/AfRegionsView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    return-void
.end method
