.class public abstract Lcom/android/camera/ui/drawable/CameraPaintBase;
.super Ljava/lang/Object;
.source "CameraPaintBase.java"


# static fields
.field public static ALPHA_HINT:I

.field public static ALPHA_OPAQUE:I

.field public static ALPHA_OUTSTANDING:I


# instance fields
.field public isClockwise:Z

.field public isRecording:Z

.field public mBaseRadius:F

.field public mCurrentAlpha:I

.field public mCurrentColor:I
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation
.end field

.field public mCurrentStrokeWidth:F

.field public mCurrentWidthPercent:F

.field private mDstAlpha:I

.field private mDstBaseRadius:F

.field private mDstColor:I

.field private mDstMiddleX:F

.field private mDstMiddleY:F

.field private mDstStrokeWidth:F

.field private mDstWidthPercent:F

.field public mMiddleX:F

.field public mMiddleY:F

.field public mPaint:Landroid/graphics/Paint;

.field public mSrcAlpha:I

.field private mSrcBaseRadius:F

.field public mSrcColor:I

.field private mSrcMiddleX:F

.field private mSrcMiddleY:F

.field public mSrcStrokeWidth:F

.field public mSrcWidthPercent:F

.field public needZero:Z

.field public timeAngle:F

.field public visible:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x66

    sput v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    const/16 v0, 0xff

    sput v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    sput v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OPAQUE:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->needZero:Z

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->initPaint(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected abstract draw(Landroid/graphics/Canvas;)V
.end method

.method public drawCanvas(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->isHide()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getVisible()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    return v0
.end method

.method protected abstract initPaint(Landroid/content/Context;)V
.end method

.method protected isHide()Z
    .locals 2

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public resetRecordingState()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->timeAngle:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isRecording:Z

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->needZero:Z

    return-void
.end method

.method public reverseClock()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->isClockwise:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_HINT:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/android/camera/ui/drawable/CameraPaintBase;->ALPHA_OUTSTANDING:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    :goto_0
    return-void
.end method

.method public setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-object p0
.end method

.method public setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-object p0
.end method

.method public setCurrentStrokeWidth(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-object p0
.end method

.method public setCurrentValues(FIIF)V
    .locals 0
    .param p2    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput p4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iget-object p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method public setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    return-object p0
.end method

.method public setMiddle(FFF)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleX:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleX:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleY:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleY:F

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcBaseRadius:F

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstBaseRadius:F

    return-void
.end method

.method public setResult()V
    .locals 2

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleX:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleY:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstBaseRadius:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleY:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcBaseRadius:F

    return-void
.end method

.method public setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    return-object p0
.end method

.method public setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    return-object p0
.end method

.method public setTargetMiddle(FFF)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleX:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleY:F

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstBaseRadius:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleX:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleY:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcBaseRadius:F

    return-void
.end method

.method public setTargetStrokeWidth(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    return-object p0
.end method

.method public setTargetValues(FIIF)V
    .locals 0
    .param p2    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iput p2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    iput p3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iput p4, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    return-void
.end method

.method public setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iget p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    return-object p0
.end method

.method public setVisible(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->visible:I

    return-void
.end method

.method public updateValue(F)V
    .locals 4
    .param p1    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleX:F

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleX:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstMiddleY:F

    iget v2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleY:F

    sub-float/2addr v1, v2

    iget v2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstBaseRadius:F

    iget v3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcBaseRadius:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleX:F

    mul-float/2addr v0, p1

    add-float/2addr v3, v0

    iput v3, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleX:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcMiddleY:F

    mul-float/2addr v1, p1

    add-float/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mMiddleY:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcBaseRadius:F

    mul-float/2addr v2, p1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mBaseRadius:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstWidthPercent:F

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcWidthPercent:F

    mul-float/2addr v0, p1

    add-float/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentWidthPercent:F

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstStrokeWidth:F

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    sub-float/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcStrokeWidth:F

    mul-float/2addr v0, p1

    add-float/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentStrokeWidth:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    if-eq v0, v1, :cond_0

    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcColor:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstColor:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, p1, v1, v2}, Landroid/animation/ArgbEvaluator;->evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mDstAlpha:I

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mSrcAlpha:I

    int-to-float v1, v1

    mul-float/2addr v0, p1

    add-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    iget-object v0, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/drawable/CameraPaintBase;->mCurrentAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-nez p1, :cond_2

    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setResult()V

    :cond_2
    return-void
.end method
