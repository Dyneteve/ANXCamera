.class public Lcom/android/camera/ui/HorizontalFNumberSlideView;
.super Lcom/android/camera/ui/HorizontalSlideView;
.source "HorizontalFNumberSlideView.java"


# instance fields
.field private mLineColorSelected:I

.field private mLineSelectedHalfHeight:F

.field private mLineWidth:I

.field private mPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalFNumberSlideView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/HorizontalSlideView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalFNumberSlideView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/ui/HorizontalSlideView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalFNumberSlideView;->init(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public canPositionScroll()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected init(Landroid/content/Context;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->init(Landroid/content/Context;)V

    const v0, 0x7f0b006e

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineColorSelected:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a00d4

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineSelectedHalfHeight:F

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a00d5

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineWidth:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mPaint:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineWidth:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineColorSelected:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-super {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mOriginX:F

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalFNumberSlideView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget v0, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineSelectedHalfHeight:F

    neg-float v3, v0

    iget v5, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mLineSelectedHalfHeight:F

    iget-object v6, p0, Lcom/android/camera/ui/HorizontalFNumberSlideView;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v4, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
