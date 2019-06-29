.class abstract Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;
.super Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;
.source "AI01decoder.java"


# static fields
.field protected static final GTIN_SIZE:I = 0x28


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitArray;)V
    .registers 2

    invoke-direct {p0, p1}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;-><init>(Lcom/google/zxing/common/BitArray;)V

    return-void
.end method

.method private static appendCheckDigit(Ljava/lang/StringBuilder;I)V
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    const/16 v2, 0xd

    if-lt v1, v2, :cond_13

    rem-int/lit8 v1, v0, 0xa

    const/16 v2, 0xa

    rsub-int/lit8 v0, v1, 0xa

    if-ne v0, v2, :cond_f

    const/4 v0, 0x0

    :cond_f
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    return-void

    :cond_13
    add-int v2, v1, p1

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    and-int/lit8 v3, v1, 0x1

    if-nez v3, :cond_22

    const/4 v3, 0x3

    mul-int/2addr v3, v2

    goto :goto_23

    :cond_22
    move v3, v2

    :goto_23
    add-int/2addr v0, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method


# virtual methods
.method protected final encodeCompressedGtin(Ljava/lang/StringBuilder;I)V
    .registers 5

    const-string v0, "(01)"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    const/16 v1, 0x39

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1, p2, v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->encodeCompressedGtinWithoutAI(Ljava/lang/StringBuilder;II)V

    return-void
.end method

.method protected final encodeCompressedGtinWithoutAI(Ljava/lang/StringBuilder;II)V
    .registers 8

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x4

    if-lt v0, v1, :cond_8

    invoke-static {p1, p3}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->appendCheckDigit(Ljava/lang/StringBuilder;I)V

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/decoders/AI01decoder;->getGeneralDecoder()Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;

    move-result-object v1

    const/16 v2, 0xa

    mul-int v3, v2, v0

    add-int/2addr v3, p2

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/oned/rss/expanded/decoders/GeneralAppIdDecoder;->extractNumericValueFromBitArray(II)I

    move-result v1

    div-int/lit8 v2, v1, 0x64

    const/16 v3, 0x30

    if-nez v2, :cond_1e

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1e
    div-int/lit8 v2, v1, 0xa

    if-nez v2, :cond_25

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_25
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
