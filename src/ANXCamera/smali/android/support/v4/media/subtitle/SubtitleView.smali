.class Landroid/support/v4/media/subtitle/SubtitleView;
.super Landroid/view/View;
.source "SubtitleView.java"


# annotations
.annotation build Landroid/support/annotation/RequiresApi;
    value = 0x1c
.end annotation


# static fields
.field private static final COLOR_BEVEL_DARK:I = -0x80000000

.field private static final COLOR_BEVEL_LIGHT:I = -0x7f000001

.field private static final INNER_PADDING_RATIO:F = 0.125f


# instance fields
.field private mAlignment:Landroid/text/Layout$Alignment;

.field private mBackgroundColor:I

.field private final mCornerRadius:F

.field private mEdgeColor:I

.field private mEdgeType:I

.field private mForegroundColor:I

.field private mHasMeasurements:Z

.field private mInnerPaddingX:I

.field private mLastMeasuredWidth:I

.field private mLayout:Landroid/text/StaticLayout;

.field private final mLineBounds:Landroid/graphics/RectF;

.field private final mOutlineWidth:F

.field private mPaint:Landroid/graphics/Paint;

.field private final mShadowOffsetX:F

.field private final mShadowOffsetY:F

.field private final mShadowRadius:F

.field private mSpacingAdd:F

.field private mSpacingMult:F

.field private final mText:Landroid/text/SpannableStringBuilder;

.field private mTextPaint:Landroid/text/TextPaint;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/media/subtitle/SubtitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/media/subtitle/SubtitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/media/subtitle/SubtitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLineBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/text/SpannableStringBuilder;

    invoke-direct {p1}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mText:Landroid/text/SpannableStringBuilder;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mSpacingMult:F

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mSpacingAdd:F

    const/4 p1, 0x0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mInnerPaddingX:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_corner_radius:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mCornerRadius:F

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_outline_width:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mOutlineWidth:F

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_shadow_radius:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowRadius:F

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_shadow_offset:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowOffsetX:F

    iget p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowOffsetX:F

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowOffsetY:F

    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setSubpixelText(Z)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    return-void
.end method

.method private computeMeasurements(I)Z
    .locals 5

    iget-boolean v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLastMeasuredWidth:I

    if-ne p1, v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingRight()I

    move-result v2

    add-int/2addr v0, v2

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mInnerPaddingX:I

    mul-int/lit8 v2, v2, 0x2

    add-int/2addr v0, v2

    sub-int/2addr p1, v0

    const/4 v0, 0x0

    if-gtz p1, :cond_1

    return v0

    :cond_1
    iput-boolean v1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLastMeasuredWidth:I

    iget-object v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mText:Landroid/text/SpannableStringBuilder;

    iget-object v3, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mText:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-static {v2, v0, v3, v4, p1}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mAlignment:Landroid/text/Layout$Alignment;

    invoke-virtual {p1, v0}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    iget v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mSpacingAdd:F

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mSpacingMult:F

    invoke-virtual {p1, v0, v2}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/text/StaticLayout$Builder;->setUseLineSpacingFromFallbacks(Z)Landroid/text/StaticLayout$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLayout:Landroid/text/StaticLayout;

    return v1
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLayout:Landroid/text/StaticLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v1

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mInnerPaddingX:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingLeft()I

    move-result v3

    add-int/2addr v3, v2

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingTop()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    iget-object v5, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mPaint:Landroid/graphics/Paint;

    iget-object v6, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLineBounds:Landroid/graphics/RectF;

    iget v7, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mBackgroundColor:I

    invoke-static {v7}, Landroid/graphics/Color;->alpha(I)I

    move-result v7

    const/4 v8, 0x0

    if-lez v7, :cond_1

    iget v7, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mCornerRadius:F

    invoke-virtual {v0, v8}, Landroid/text/StaticLayout;->getLineTop(I)I

    move-result v9

    int-to-float v9, v9

    iget v10, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mBackgroundColor:I

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v10, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    move v10, v9

    move v9, v8

    :goto_0
    if-ge v9, v3, :cond_1

    invoke-virtual {v0, v9}, Landroid/text/StaticLayout;->getLineLeft(I)F

    move-result v11

    int-to-float v12, v2

    sub-float/2addr v11, v12

    iput v11, v6, Landroid/graphics/RectF;->left:F

    invoke-virtual {v0, v9}, Landroid/text/StaticLayout;->getLineRight(I)F

    move-result v11

    add-float/2addr v11, v12

    iput v11, v6, Landroid/graphics/RectF;->right:F

    iput v10, v6, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v9}, Landroid/text/StaticLayout;->getLineBottom(I)I

    move-result v10

    int-to-float v10, v10

    iput v10, v6, Landroid/graphics/RectF;->bottom:F

    iget v10, v6, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, v6, v7, v7, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    sget-object v2, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mOutlineWidth:F

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeColor:I

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    goto :goto_3

    :cond_2
    const/4 v5, 0x2

    if-ne v2, v5, :cond_3

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowRadius:F

    iget v3, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowOffsetX:F

    iget v5, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowOffsetY:F

    iget v6, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeColor:I

    invoke-virtual {v4, v2, v3, v5, v6}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_3

    :cond_3
    const/4 v5, 0x3

    if-eq v2, v5, :cond_4

    const/4 v6, 0x4

    if-ne v2, v6, :cond_8

    :cond_4
    if-ne v2, v5, :cond_5

    goto :goto_1

    :cond_5
    move v3, v8

    :goto_1
    const/4 v2, -0x1

    if-eqz v3, :cond_6

    move v5, v2

    goto :goto_2

    :cond_6
    iget v5, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeColor:I

    :goto_2
    if-eqz v3, :cond_7

    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeColor:I

    nop

    :cond_7
    iget v3, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowRadius:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v3, v6

    iget v6, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mForegroundColor:I

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v6, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowRadius:F

    neg-float v7, v3

    invoke-virtual {v4, v6, v7, v7, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-virtual {v0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    iget v5, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mShadowRadius:F

    invoke-virtual {v4, v5, v3, v3, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    :cond_8
    :goto_3
    iget v2, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mForegroundColor:I

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v0, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    const/4 v0, 0x0

    invoke-virtual {v4, v0, v0, v0, v8}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    sub-int/2addr p4, p2

    invoke-direct {p0, p4}, Landroid/support/v4/media/subtitle/SubtitleView;->computeMeasurements(I)Z

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleView;->computeMeasurements(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mLayout:Landroid/text/StaticLayout;

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingLeft()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingRight()I

    move-result v0

    add-int/2addr p2, v0

    iget v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mInnerPaddingX:I

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr p2, v0

    invoke-virtual {p1}, Landroid/text/StaticLayout;->getWidth()I

    move-result v0

    add-int/2addr v0, p2

    invoke-virtual {p1}, Landroid/text/StaticLayout;->getHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingTop()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getPaddingBottom()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {p0, v0, p1}, Landroid/support/v4/media/subtitle/SubtitleView;->setMeasuredDimension(II)V

    goto :goto_0

    :cond_0
    const/high16 p1, 0x1000000

    invoke-virtual {p0, p1, p1}, Landroid/support/v4/media/subtitle/SubtitleView;->setMeasuredDimension(II)V

    :goto_0
    return-void
.end method

.method public setAlignment(Landroid/text/Layout$Alignment;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mAlignment:Landroid/text/Layout$Alignment;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mAlignment:Landroid/text/Layout$Alignment;

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->requestLayout()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mBackgroundColor:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    return-void
.end method

.method public setEdgeColor(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeColor:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    return-void
.end method

.method public setEdgeType(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mEdgeType:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    return-void
.end method

.method public setForegroundColor(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mForegroundColor:I

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    return-void
.end method

.method public setText(I)V
    .locals 1

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/SubtitleView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mText:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mText:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->requestLayout()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    return-void
.end method

.method public setTextSize(F)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    const/high16 v0, 0x3e000000    # 0.125f

    mul-float/2addr p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    iput p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mInnerPaddingX:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->requestLayout()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    :cond_0
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mTextPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v4/media/subtitle/SubtitleView;->mHasMeasurements:Z

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->requestLayout()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/SubtitleView;->invalidate()V

    :cond_0
    return-void
.end method
