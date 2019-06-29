.class Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;
.super Ljava/lang/Object;
.source "Cea608CCParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/media/subtitle/Cea608CCParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CCLineBuilder"
.end annotation


# instance fields
.field private final mDisplayChars:Ljava/lang/StringBuilder;

.field private final mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

.field private final mPACStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    new-array p1, p1, [Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    iget-object p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    new-array p1, p1, [Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    iput-object p1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mPACStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    return-void
.end method


# virtual methods
.method applyStyleSpan(Landroid/text/SpannableStringBuilder;Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;II)V
    .locals 3

    invoke-virtual {p2}, Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;->isItalics()Z

    move-result v0

    const/16 v1, 0x21

    if-eqz v0, :cond_0

    new-instance v0, Landroid/text/style/StyleSpan;

    const/4 v2, 0x2

    invoke-direct {v0, v2}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {p1, v0, p3, p4, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_0
    invoke-virtual {p2}, Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;->isUnderline()Z

    move-result p2

    if-eqz p2, :cond_1

    new-instance p2, Landroid/text/style/UnderlineSpan;

    invoke-direct {p2}, Landroid/text/style/UnderlineSpan;-><init>()V

    invoke-virtual {p1, p2, p3, p4, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_1
    return-void
.end method

.method charAt(I)C
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p1

    return p1
.end method

.method getStyledText(Landroid/view/accessibility/CaptioningManager$CaptionStyle;)Landroid/text/SpannableStringBuilder;
    .locals 10

    new-instance v0, Landroid/text/SpannableStringBuilder;

    iget-object v1, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    nop

    nop

    nop

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x0

    move-object v6, v1

    move v4, v2

    move v5, v4

    :goto_0
    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    if-ge v3, v7, :cond_a

    nop

    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aget-object v7, v7, v3

    if-eqz v7, :cond_0

    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aget-object v7, v7, v3

    goto :goto_1

    :cond_0
    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mPACStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aget-object v7, v7, v3

    if-eqz v7, :cond_2

    if-ltz v4, :cond_1

    if-gez v5, :cond_2

    :cond_1
    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mPACStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aget-object v7, v7, v3

    goto :goto_1

    :cond_2
    move-object v7, v1

    :goto_1
    if-eqz v7, :cond_4

    nop

    if-ltz v4, :cond_3

    if-ltz v5, :cond_3

    invoke-virtual {p0, v0, v7, v4, v3}, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->applyStyleSpan(Landroid/text/SpannableStringBuilder;Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;II)V

    :cond_3
    nop

    move v4, v3

    move-object v6, v7

    :cond_4
    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    const/16 v8, 0xa0

    if-eq v7, v8, :cond_5

    if-gez v5, :cond_9

    nop

    move v5, v3

    goto :goto_4

    :cond_5
    if-ltz v5, :cond_9

    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    const/16 v8, 0x20

    if-ne v7, v8, :cond_6

    goto :goto_2

    :cond_6
    add-int/lit8 v5, v5, -0x1

    :goto_2
    iget-object v7, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    add-int/lit8 v9, v3, -0x1

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v7

    if-ne v7, v8, :cond_7

    move v7, v3

    goto :goto_3

    :cond_7
    add-int/lit8 v7, v3, 0x1

    :goto_3
    new-instance v8, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;

    iget v9, p1, Landroid/view/accessibility/CaptioningManager$CaptionStyle;->backgroundColor:I

    invoke-direct {v8, v9}, Landroid/support/v4/media/subtitle/Cea608CCParser$MutableBackgroundColorSpan;-><init>(I)V

    const/16 v9, 0x21

    invoke-virtual {v0, v8, v5, v7, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    if-ltz v4, :cond_8

    invoke-virtual {p0, v0, v6, v4, v7}, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->applyStyleSpan(Landroid/text/SpannableStringBuilder;Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;II)V

    :cond_8
    nop

    move v5, v2

    :cond_9
    :goto_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_a
    return-object v0
.end method

.method length()I
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    return v0
.end method

.method setCharAt(IC)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    iget-object p2, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    const/4 v0, 0x0

    aput-object v0, p2, p1

    return-void
.end method

.method setMidRowAt(ILandroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;)V
    .locals 2

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mDisplayChars:Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-virtual {v0, p1, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mMidRowStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aput-object p2, v0, p1

    return-void
.end method

.method setPACAt(ILandroid/support/v4/media/subtitle/Cea608CCParser$PAC;)V
    .locals 1

    iget-object v0, p0, Landroid/support/v4/media/subtitle/Cea608CCParser$CCLineBuilder;->mPACStyles:[Landroid/support/v4/media/subtitle/Cea608CCParser$StyleCode;

    aput-object p2, v0, p1

    return-void
.end method
