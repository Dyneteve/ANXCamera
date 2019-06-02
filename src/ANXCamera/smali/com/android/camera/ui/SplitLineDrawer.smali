.class public Lcom/android/camera/ui/SplitLineDrawer;
.super Landroid/view/View;
.source "SplitLineDrawer.java"


# static fields
.field private static final BORDER:I = 0x1


# instance fields
.field private mBottomVisible:Z

.field private mColumnCount:I

.field private mLineColor:I

.field private mLinePaint:Landroid/graphics/Paint;

.field private mRowCount:I

.field private mTopVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    const p1, 0x33ffffff

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    return-void
.end method


# virtual methods
.method public initialize(II)V
    .locals 1

    const/4 v0, 0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLinePaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLinePaint:Landroid/graphics/Paint;

    const/high16 p2, 0x40000000    # 2.0f

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLinePaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->getWidth()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->getHeight()I

    move-result v2

    sub-int/2addr v2, v1

    move v3, v1

    :goto_0
    iget v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    if-ge v3, v4, :cond_0

    mul-int v4, v3, v0

    iget v5, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    div-int v5, v4, v5

    int-to-float v7, v5

    const/high16 v8, 0x3f800000    # 1.0f

    iget v5, p0, Lcom/android/camera/ui/SplitLineDrawer;->mColumnCount:I

    div-int/2addr v4, v5

    int-to-float v9, v4

    add-int/lit8 v4, v2, -0x1

    int-to-float v10, v4

    iget-object v11, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLinePaint:Landroid/graphics/Paint;

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iget-boolean v3, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    xor-int/2addr v1, v3

    const/4 v3, 0x0

    :goto_1
    iget v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-gt v3, v4, :cond_5

    if-eqz v3, :cond_1

    iget v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-ne v3, v4, :cond_3

    :cond_1
    if-nez v3, :cond_2

    iget-boolean v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    if-nez v4, :cond_3

    :cond_2
    iget v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    if-ne v3, v4, :cond_4

    iget-boolean v4, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    if-eqz v4, :cond_4

    :cond_3
    int-to-float v6, v1

    mul-int v4, v3, v2

    iget v5, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    div-int v5, v4, v5

    int-to-float v7, v5

    sub-int v5, v0, v1

    int-to-float v8, v5

    iget v5, p0, Lcom/android/camera/ui/SplitLineDrawer;->mRowCount:I

    div-int/2addr v4, v5

    int-to-float v9, v4

    iget-object v10, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLinePaint:Landroid/graphics/Paint;

    move-object v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public setBorderVisible(ZZ)V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    if-ne v0, p1, :cond_0

    iget-boolean v0, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    if-eq v0, p2, :cond_1

    :cond_0
    iput-boolean p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mTopVisible:Z

    iput-boolean p2, p0, Lcom/android/camera/ui/SplitLineDrawer;->mBottomVisible:Z

    invoke-virtual {p0}, Lcom/android/camera/ui/SplitLineDrawer;->invalidate()V

    :cond_1
    return-void
.end method

.method public setLineColor(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/SplitLineDrawer;->mLineColor:I

    return-void
.end method
