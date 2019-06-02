.class public Lcom/android/camera/ui/autoselectview/AlphaView;
.super Landroid/view/View;
.source "AlphaView.java"


# instance fields
.field private mAlpha:F

.field private mFmi:Landroid/graphics/Paint$FontMetricsInt;

.field private mIconDrawRect:Landroid/graphics/Rect;

.field private mText:Ljava/lang/String;

.field private mTextBound:Landroid/graphics/Rect;

.field private mTextColorNormal:I

.field private mTextColorSelected:I

.field private mTextPaint:Landroid/graphics/Paint;

.field private mTextSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/ui/autoselectview/AlphaView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/autoselectview/AlphaView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p3, -0x666667

    iput p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorNormal:I

    const p3, -0xb93fe5

    iput p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorSelected:I

    const/16 p3, 0xc

    iput p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mIconDrawRect:Landroid/graphics/Rect;

    iget p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    int-to-float p3, p3

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1, p3, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    sget-object p3, Lcom/android/camera/R$styleable;->AlphaView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    const/4 p3, 0x1

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorNormal:I

    invoke-virtual {p1, v1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorNormal:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorSelected:I

    const/4 p3, 0x3

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorSelected:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->initText()V

    return-void
.end method

.method private availableToDrawRect(Landroid/graphics/Rect;Landroid/graphics/Bitmap;)Landroid/graphics/Rect;
    .locals 6

    nop

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float/2addr v0, v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v2, v1

    cmpl-float v1, v0, v2

    const/high16 v3, 0x40000000    # 2.0f

    const/4 v4, 0x0

    if-lez v1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr v2, p2

    sub-float/2addr v0, v2

    div-float p2, v0, v3

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr v0, p2

    sub-float/2addr v1, v0

    div-float p2, v1, v3

    move v5, v4

    move v4, p2

    move p2, v5

    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    add-float/2addr v0, p2

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    iget v2, p1, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    add-float/2addr v2, v4

    add-float/2addr v2, v1

    float-to-int v2, v2

    iget v3, p1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float/2addr v3, p2

    add-float/2addr v3, v1

    float-to-int p2, v3

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    sub-float/2addr p1, v4

    add-float/2addr p1, v1

    float-to-int p1, p1

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mIconDrawRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v0, v2, p2, p1}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mIconDrawRect:Landroid/graphics/Rect;

    return-object p1
.end method

.method private initText()V
    .locals 5

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mFmi:Landroid/graphics/Paint$FontMetricsInt;

    :cond_0
    return-void
.end method

.method private invalidateView()V
    .locals 2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->invalidate()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->postInvalidate()V

    :goto_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mAlpha:F

    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorNormal:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    rsub-int v2, v0, 0xff

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v4, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mFmi:Landroid/graphics/Paint$FontMetricsInt;

    iget v4, v4, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    div-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    int-to-float v3, v3

    iget-object v4, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextColorSelected:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    iget-object v3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mFmi:Landroid/graphics/Paint$FontMetricsInt;

    iget v3, v3, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getPaddingLeft()I

    move-result p1

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getPaddingTop()I

    move-result p2

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getPaddingRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getPaddingBottom()I

    move-result v1

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->getMeasuredHeight()I

    move-result v3

    sub-int/2addr v2, p1

    sub-int/2addr v2, v0

    sub-int/2addr v3, p2

    sub-int/2addr v3, v1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    add-int/2addr p1, v2

    add-int/2addr p2, v3

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    sub-int/2addr p2, v0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    add-int/2addr v1, p1

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mTextBound:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    add-int/2addr v2, p2

    invoke-virtual {v0, p1, p2, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "\u5fc5\u987b\u8bbe\u7f6e tabText \u6216\u8005 tabIconSelected\u3001tabIconNormal \u4e24\u4e2a\uff0c\u6216\u8005\u5168\u90e8\u8bbe\u7f6e"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mText:Ljava/lang/String;

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->invalidateView()V

    return-void
.end method

.method public setViewAlpha(F)V
    .locals 1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-gtz v0, :cond_0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AlphaView;->mAlpha:F

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AlphaView;->invalidateView()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u900f\u660e\u5ea6\u5fc5\u987b\u662f 0.0 - 1.0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
