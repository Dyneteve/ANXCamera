.class Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;
.super Landroid/widget/RelativeLayout;
.source "Cea708CaptionRenderer.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CCWindowLayout"
.end annotation


# static fields
.field private static final ANCHOR_HORIZONTAL_16_9_MAX:I = 0xd1

.field private static final ANCHOR_HORIZONTAL_MODE_CENTER:I = 0x1

.field private static final ANCHOR_HORIZONTAL_MODE_LEFT:I = 0x0

.field private static final ANCHOR_HORIZONTAL_MODE_RIGHT:I = 0x2

.field private static final ANCHOR_MODE_DIVIDER:I = 0x3

.field private static final ANCHOR_RELATIVE_POSITIONING_MAX:I = 0x63

.field private static final ANCHOR_VERTICAL_MAX:I = 0x4a

.field private static final ANCHOR_VERTICAL_MODE_BOTTOM:I = 0x2

.field private static final ANCHOR_VERTICAL_MODE_CENTER:I = 0x1

.field private static final ANCHOR_VERTICAL_MODE_TOP:I = 0x0

.field private static final MAX_COLUMN_COUNT_16_9:I = 0x2a

.field private static final PROPORTION_PEN_SIZE_LARGE:F = 1.25f

.field private static final PROPORTION_PEN_SIZE_SMALL:F = 0.75f

.field private static final TAG:Ljava/lang/String; = "CCWindowLayout"


# instance fields
.field private final mBuilder:Landroid/text/SpannableStringBuilder;

.field private mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

.field private mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

.field private mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

.field private mCaptionWindowId:I

.field private final mCharacterStyles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/text/style/CharacterStyle;",
            ">;"
        }
    .end annotation
.end field

.field private mFontScale:F

.field private mLastCaptionLayoutHeight:I

.field private mLastCaptionLayoutWidth:I

.field private mRow:I

.field private mRowLimit:I

.field private mTextSize:F

.field private mWidestChar:Ljava/lang/String;

.field final synthetic this$1:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;


# direct methods
.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method constructor <init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->this$1:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p3, 0x0

    iput p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRowLimit:I

    new-instance p3, Landroid/text/SpannableStringBuilder;

    invoke-direct {p3}, Landroid/text/SpannableStringBuilder;-><init>()V

    iput-object p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    const/4 p3, -0x1

    iput p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRow:I

    new-instance p3, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    invoke-direct {p3, p1, p2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget;Landroid/content/Context;)V

    iput-object p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 p3, -0x2

    invoke-direct {p1, p3, p3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object p3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    invoke-virtual {p0, p3, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const-string p1, "captioning"

    invoke-virtual {p2, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/CaptioningManager;

    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->getFontScale()F

    move-result p2

    iput p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mFontScale:F

    invoke-virtual {p1}, Landroid/view/accessibility/CaptioningManager;->getUserStyle()Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setCaptionStyle(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)V

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    const-string p2, ""

    invoke-virtual {p1, p2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateWidestChar()V

    return-void
.end method

.method private getScreenColumnCount()I
    .locals 1

    const/16 v0, 0x2a

    return v0
.end method

.method private updateText(Ljava/lang/String;Z)V
    .locals 4

    if-nez p2, :cond_0

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->clear()V

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    if-lez p2, :cond_1

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/style/CharacterStyle;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    const/16 v3, 0x21

    invoke-virtual {v1, v0, p2, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "\n"

    invoke-static {p1, p2}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const-string p2, "\n"

    array-length v0, p1

    iget v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRowLimit:I

    add-int/lit8 v1, v1, 0x1

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    array-length v2, p1

    invoke-static {p1, v0, v2}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr v0, p1

    invoke-virtual {p2, v1, v0}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    nop

    move p2, v1

    :goto_1
    const/16 v0, 0x20

    if-gt p2, p1, :cond_2

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v2, p2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v2

    if-gt v2, v0, :cond_2

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_2
    move v2, p1

    :goto_2
    if-lt v2, p2, :cond_3

    iget-object v3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->charAt(I)C

    move-result v3

    if-gt v3, v0, :cond_3

    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    :cond_3
    if-nez p2, :cond_4

    if-ne v2, p1, :cond_4

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {p1, p2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    :cond_4
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    iget-object v3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    if-ge v2, p1, :cond_5

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, v2, p1}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_5
    if-lez p2, :cond_6

    invoke-virtual {v0, v1, p2}, Landroid/text/SpannableStringBuilder;->delete(II)Landroid/text/SpannableStringBuilder;

    :cond_6
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    invoke-virtual {p1, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setText(Ljava/lang/CharSequence;)V

    :goto_3
    return-void
.end method

.method private updateTextSize()V
    .locals 8

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->getScreenColumnCount()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    iget-object v3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mWidestChar:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    invoke-virtual {v2}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const/4 v2, 0x0

    const/high16 v3, 0x437f0000    # 255.0f

    :goto_1
    cmpg-float v4, v2, v3

    if-gez v4, :cond_3

    add-float v4, v2, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    iget-object v6, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v6}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->getWidth()I

    move-result v6

    int-to-float v6, v6

    const v7, 0x3f4ccccd    # 0.8f

    mul-float/2addr v6, v7

    cmpl-float v5, v6, v5

    const v6, 0x3c23d70a    # 0.01f

    if-lez v5, :cond_2

    add-float/2addr v4, v6

    move v2, v4

    goto :goto_2

    :cond_2
    sub-float/2addr v4, v6

    move v3, v4

    :goto_2
    goto :goto_1

    :cond_3
    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mFontScale:F

    mul-float/2addr v3, v0

    iput v3, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mTextSize:F

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    iget v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setTextSize(F)V

    return-void
.end method

.method private updateWidestChar()V
    .locals 8

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    invoke-virtual {v1}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    const-string v1, "ISO-8859-1"

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    nop

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v3

    move v3, v2

    :goto_0
    const/16 v5, 0x100

    if-ge v3, v5, :cond_1

    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [B

    int-to-byte v7, v3

    aput-byte v7, v6, v2

    invoke-direct {v5, v6, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v0, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v6

    cmpg-float v7, v4, v6

    if-gez v7, :cond_0

    nop

    iput-object v5, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mWidestChar:Ljava/lang/String;

    move v4, v6

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateTextSize()V

    return-void
.end method


# virtual methods
.method public appendText(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateText(Ljava/lang/String;Z)V

    return-void
.end method

.method public clear()V
    .locals 0

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->clearText()V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->hide()V

    return-void
.end method

.method public clearText()V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mBuilder:Landroid/text/SpannableStringBuilder;

    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->clear()V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    const-string v1, ""

    invoke-virtual {v0, v1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public getCaptionWindowId()I
    .locals 1

    iget v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionWindowId:I

    return v0
.end method

.method public hide()V
    .locals 1

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->requestLayout()V

    return-void
.end method

.method public initWindow(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;)V
    .locals 13

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    if-eq v0, p1, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v0, p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :cond_0
    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {p1, p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateWidestChar()V

    :cond_1
    iget p1, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->anchorVertical:I

    int-to-float p1, p1

    iget-boolean v0, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->relativePositioning:Z

    const/16 v1, 0x63

    if-eqz v0, :cond_2

    move v0, v1

    goto :goto_0

    :cond_2
    const/16 v0, 0x4a

    :goto_0
    int-to-float v0, v0

    div-float/2addr p1, v0

    iget v0, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->anchorHorizontal:I

    int-to-float v0, v0

    iget-boolean v2, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->relativePositioning:Z

    if-eqz v2, :cond_3

    goto :goto_1

    :cond_3
    const/16 v1, 0xd1

    :goto_1
    int-to-float v1, v1

    div-float/2addr v0, v1

    const/4 v1, 0x0

    cmpg-float v2, p1, v1

    const/high16 v3, 0x3f800000    # 1.0f

    if-ltz v2, :cond_4

    cmpl-float v2, p1, v3

    if-lez v2, :cond_5

    :cond_4
    const-string v2, "CCWindowLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The vertical position of the anchor point should be at the range of 0 and 1 but "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1, v3}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_5
    cmpg-float v2, v0, v1

    if-ltz v2, :cond_6

    cmpl-float v2, v0, v3

    if-lez v2, :cond_7

    :cond_6
    const-string v2, "CCWindowLayout"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The horizontal position of the anchor point should be at the range of 0 and 1 but "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_7
    const/16 v2, 0x11

    iget v4, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->anchorId:I

    const/4 v5, 0x3

    rem-int/2addr v4, v5

    iget v6, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->anchorId:I

    div-int/2addr v6, v5

    nop

    nop

    nop

    nop

    const/4 v7, 0x1

    packed-switch v4, :pswitch_data_0

    move v11, v1

    move v12, v3

    goto/16 :goto_5

    :pswitch_0
    const/4 v2, 0x5

    nop

    move v12, v0

    move v11, v1

    goto/16 :goto_5

    :pswitch_1
    sub-float v2, v3, v0

    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget v4, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->columnCount:I

    add-int/2addr v4, v7

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->getScreenColumnCount()I

    move-result v8

    invoke-static {v8, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v9, 0x0

    :goto_2
    if-ge v9, v4, :cond_8

    iget-object v10, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mWidestChar:Ljava/lang/String;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_8
    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    iget-object v9, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    invoke-virtual {v9}, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v9

    invoke-virtual {v4, v9}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget v9, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mTextSize:F

    invoke-virtual {v4, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    iget-object v8, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v8}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->getWidth()I

    move-result v8

    if-lez v8, :cond_9

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v4, v8

    iget-object v8, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v8}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->getWidth()I

    move-result v8

    int-to-float v8, v8

    const v9, 0x3f4ccccd    # 0.8f

    mul-float/2addr v8, v9

    div-float/2addr v4, v8

    goto :goto_3

    :cond_9
    move v4, v1

    :goto_3
    cmpl-float v8, v4, v1

    if-lez v8, :cond_a

    cmpg-float v8, v4, v0

    if-gez v8, :cond_a

    nop

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    invoke-virtual {v2, v7}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setAlignment(Landroid/text/Layout$Alignment;)V

    sub-float/2addr v0, v4

    goto :goto_4

    :cond_a
    nop

    iget-object v4, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    invoke-virtual {v4, v5}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setAlignment(Landroid/text/Layout$Alignment;)V

    sub-float v4, v0, v2

    add-float/2addr v0, v2

    nop

    move v12, v0

    move v11, v4

    move v2, v7

    goto :goto_5

    :pswitch_2
    nop

    iget-object v2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    sget-object v4, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    invoke-virtual {v2, v4}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setAlignment(Landroid/text/Layout$Alignment;)V

    nop

    nop

    :goto_4
    move v11, v0

    move v12, v3

    move v2, v5

    :goto_5
    packed-switch v6, :pswitch_data_1

    :goto_6
    move v9, v1

    :goto_7
    move v10, v3

    goto :goto_8

    :pswitch_3
    or-int/lit8 v2, v2, 0x50

    nop

    move v10, p1

    move v9, v1

    goto :goto_8

    :pswitch_4
    or-int/lit8 v2, v2, 0x10

    sub-float/2addr v3, p1

    invoke-static {v3, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    sub-float v1, p1, v0

    add-float v3, p1, v0

    goto :goto_6

    :pswitch_5
    or-int/lit8 v2, v2, 0x30

    nop

    nop

    move v9, p1

    goto :goto_7

    :goto_8
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    new-instance v0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout$ScaledLayoutParams;

    iget-object v8, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout$ScaledLayoutParams;-><init>(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout;FFFF)V

    invoke-virtual {p1, p0, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->addOrUpdateViewToSafeTitleArea(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$ScaledLayout$ScaledLayoutParams;)V

    iget p1, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->id:I

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setCaptionWindowId(I)V

    iget p1, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->rowCount:I

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setRowLimit(I)V

    invoke-virtual {p0, v2}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setGravity(I)V

    iget-boolean p1, p2, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindow;->visible:Z

    if-eqz p1, :cond_b

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->show()V

    goto :goto_9

    :cond_b
    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->hide()V

    :goto_9
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mLastCaptionLayoutWidth:I

    if-ne p4, p1, :cond_0

    iget p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mLastCaptionLayoutHeight:I

    if-eq p5, p1, :cond_1

    :cond_0
    iput p4, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mLastCaptionLayoutWidth:I

    iput p5, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mLastCaptionLayoutHeight:I

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateTextSize()V

    :cond_1
    return-void
.end method

.method public removeFromCaptionView()V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v0, p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->removeViewFromSafeTitleArea(Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    invoke-virtual {v0, p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCLayout:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCLayout;

    :cond_0
    return-void
.end method

.method public sendBuffer(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->appendText(Ljava/lang/String;)V

    return-void
.end method

.method public sendControl(C)V
    .locals 0

    return-void
.end method

.method public setCaptionStyle(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)V
    .locals 1

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionStyle:Landroid/view/accessibility/CaptioningManager$CaptionStyle;

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCCView:Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;

    invoke-virtual {v0, p1}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCView;->setCaptionStyle(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)V

    return-void
.end method

.method public setCaptionWindowId(I)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCaptionWindowId:I

    return-void
.end method

.method public setFontScale(F)V
    .locals 0

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mFontScale:F

    invoke-direct {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateTextSize()V

    return-void
.end method

.method public setPenAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;)V
    .locals 4

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-boolean v0, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;->italic:Z

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-boolean v0, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;->underline:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v2, Landroid/text/style/UnderlineSpan;

    invoke-direct {v2}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    iget v0, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;->penSize:I

    if-eqz v0, :cond_3

    if-eq v0, v1, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const/high16 v3, 0x3fa00000    # 1.25f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v2, Landroid/text/style/RelativeSizeSpan;

    const/high16 v3, 0x3f400000    # 0.75f

    invoke-direct {v2, v3}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    :goto_0
    iget p1, p1, Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenAttr;->penOffset:I

    if-eqz p1, :cond_5

    if-eq p1, v1, :cond_4

    goto :goto_1

    :cond_4
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v0, Landroid/text/style/SuperscriptSpan;

    invoke-direct {v0}, Landroid/text/style/SuperscriptSpan;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mCharacterStyles:Ljava/util/List;

    new-instance v0, Landroid/text/style/SubscriptSpan;

    invoke-direct {v0}, Landroid/text/style/SubscriptSpan;-><init>()V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    nop

    :goto_1
    return-void
.end method

.method public setPenColor(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionPenColor;)V
    .locals 0

    return-void
.end method

.method public setPenLocation(II)V
    .locals 1

    iget p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRow:I

    if-ltz p2, :cond_0

    iget p2, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRow:I

    :goto_0
    if-ge p2, p1, :cond_0

    const-string v0, "\n"

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->appendText(Ljava/lang/String;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRow:I

    return-void
.end method

.method public setRowLimit(I)V
    .locals 1

    if-ltz p1, :cond_0

    iput p1, p0, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->mRowLimit:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "A rowLimit should have a positive number"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->updateText(Ljava/lang/String;Z)V

    return-void
.end method

.method public setWindowAttr(Landroid/support/v4/media/subtitle/Cea708CCParser$CaptionWindowAttr;)V
    .locals 0

    return-void
.end method

.method public show()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/support/v4/media/subtitle/Cea708CaptionRenderer$Cea708CCWidget$CCWindowLayout;->requestLayout()V

    return-void
.end method
