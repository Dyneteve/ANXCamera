.class Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;
.super Landroid/widget/TextView;
.source "ClosedCaptionRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CCLineBox"
.end annotation


# static fields
.field private static final EDGE_OUTLINE_RATIO:F = 0.1f

.field private static final EDGE_SHADOW_RATIO:F = 0.05f

.field private static final FONT_PADDING_RATIO:F = 0.75f


# instance fields
.field private mBgColor:I

.field private mEdgeColor:I

.field private mEdgeType:I

.field private mOutlineWidth:F

.field private mShadowOffset:F

.field private mShadowRadius:F

.field private mTextColor:I

.field final synthetic this$1:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->this$1:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    invoke-direct {p0, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    iput p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mTextColor:I

    const/high16 p2, -0x1000000

    iput p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mBgColor:I

    const/4 p2, 0x0

    iput p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    iput p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setGravity(I)V

    invoke-virtual {p0, p2}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setBackgroundColor(I)V

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTextColor(I)V

    sget-object p1, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTypeface(Landroid/graphics/Typeface;)V

    const/4 p1, 0x4

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_outline_width:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mOutlineWidth:F

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_shadow_radius:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    sget p2, Landroid/support/mediacompat/R$dimen;->subtitle_shadow_offset:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowOffset:F

    return-void
.end method

.method private drawEdgeOutline(Landroid/graphics/Canvas;)V
    .locals 5

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v1

    invoke-virtual {v0}, Landroid/text/TextPaint;->getStrokeJoin()Landroid/graphics/Paint$Join;

    move-result-object v2

    invoke-virtual {v0}, Landroid/text/TextPaint;->getStrokeWidth()F

    move-result v3

    iget v4, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    invoke-virtual {p0, v4}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTextColor(I)V

    sget-object v4, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v4}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    sget-object v4, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v4}, Landroid/text/TextPaint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget v4, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mOutlineWidth:F

    invoke-virtual {v0, v4}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    iget v4, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mTextColor:I

    invoke-virtual {p0, v4}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTextColor(I)V

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    invoke-virtual {v0, v3}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setBackgroundSpans(I)V

    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    iget p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mBgColor:I

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setBackgroundSpans(I)V

    return-void
.end method

.method private drawEdgeRaisedOrDepressed(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object v1

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    const/4 v3, 0x0

    const/4 v4, 0x3

    if-ne v2, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    move v2, v3

    :goto_0
    const/4 v4, -0x1

    if-eqz v2, :cond_1

    move v5, v4

    goto :goto_1

    :cond_1
    iget v5, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    :goto_1
    if-eqz v2, :cond_2

    iget v4, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    nop

    :cond_2
    iget v2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v2, v6

    iget v6, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    neg-float v7, v2

    invoke-virtual {p0, v6, v7, v7, v5}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setShadowLayer(FFFI)V

    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, v3}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setBackgroundSpans(I)V

    iget v3, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    invoke-virtual {p0, v3, v2, v2, v4}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setShadowLayer(FFFI)V

    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mBgColor:I

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setBackgroundSpans(I)V

    return-void
.end method

.method private setBackgroundSpans(I)V
    .locals 4

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    instance-of v1, v0, Landroid/text/Spannable;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/text/Spannable;

    nop

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v1

    const-class v2, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;

    const/4 v3, 0x0

    invoke-interface {v0, v3, v1, v2}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;

    :goto_0
    array-length v1, v0

    if-ge v3, v1, :cond_0

    aget-object v1, v0, v3

    invoke-virtual {v1, p1}, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;->setBackgroundColor(I)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->drawEdgeOutline(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->drawEdgeRaisedOrDepressed(Landroid/graphics/Canvas;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    invoke-super {p0, p1}, Landroid/widget/TextView;->onDraw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f400000    # 0.75f

    mul-float/2addr v0, v1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTextSize(IF)V

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v2, v0

    const/high16 v3, 0x3f800000    # 1.0f

    add-float/2addr v2, v3

    iput v2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mOutlineWidth:F

    const v2, 0x3d4ccccd    # 0.05f

    mul-float/2addr v2, v0

    add-float/2addr v2, v3

    iput v2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    iput v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowOffset:F

    invoke-virtual {p0, v3}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setScaleX(F)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    const-string v2, "1234567890123456789012345678901234"

    const-string v3, "1234567890123456789012345678901234"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->this$1:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    invoke-static {v4}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;->access$000(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;)Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->this$1:Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;

    invoke-static {v0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;->access$000(Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p0, v1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setScaleX(F)V

    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->onMeasure(II)V

    return-void
.end method

.method setCaptionStyle(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)V
    .locals 3

    iget v0, p1, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->foregroundColor:I

    iput v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mTextColor:I

    iget v0, p1, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->backgroundColor:I

    iput v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mBgColor:I

    iget v0, p1, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->edgeType:I

    iput v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    iget p1, p1, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->edgeColor:I

    iput p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    iget p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mTextColor:I

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setTextColor(I)V

    iget p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeType:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget p1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowRadius:F

    iget v0, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowOffset:F

    iget v1, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mShadowOffset:F

    iget v2, p0, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->mEdgeColor:I

    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setShadowLayer(FFFI)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, v0, p1}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->setShadowLayer(FFFI)V

    :goto_0
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/ClosedCaptionRenderer$Cea608CCWidget$CCLineBox;->invalidate()V

    return-void
.end method
