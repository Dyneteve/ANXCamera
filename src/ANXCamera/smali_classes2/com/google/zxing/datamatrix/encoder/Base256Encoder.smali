.class final Lcom/google/zxing/datamatrix/encoder/Base256Encoder;
.super Ljava/lang/Object;
.source "Base256Encoder.java"

# interfaces
.implements Lcom/google/zxing/datamatrix/encoder/Encoder;


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static randomize255State(CI)C
    .registers 5

    const/16 v0, 0x95

    mul-int/2addr v0, p1

    const/16 v1, 0xff

    rem-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    add-int v2, p0, v0

    if-gt v2, v1, :cond_e

    int-to-char v1, v2

    return v1

    :cond_e
    add-int/lit16 v1, v2, -0x100

    int-to-char v1, v1

    return v1
.end method


# virtual methods
.method public encode(Lcom/google/zxing/datamatrix/encoder/EncoderContext;)V
    .registers 12

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_9
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->hasMoreCharacters()Z

    move-result v2

    const/4 v3, 0x1

    if-nez v2, :cond_11

    goto :goto_35

    :cond_11
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCurrentChar()C

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget v4, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    add-int/2addr v4, v3

    iput v4, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getMessage()Ljava/lang/String;

    move-result-object v4

    iget v5, p1, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->pos:I

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/Base256Encoder;->getEncodingMode()I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/google/zxing/datamatrix/encoder/HighLevelEncoder;->lookAheadTest(Ljava/lang/CharSequence;II)I

    move-result v4

    invoke-virtual {p0}, Lcom/google/zxing/datamatrix/encoder/Base256Encoder;->getEncodingMode()I

    move-result v5

    if-eq v4, v5, :cond_9

    invoke-virtual {p1, v4}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->signalEncoderChange(I)V

    nop

    :goto_35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    sub-int/2addr v2, v3

    const/4 v4, 0x1

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v5

    add-int/2addr v5, v2

    add-int/2addr v5, v4

    invoke-virtual {p1, v5}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->updateSymbolInfo(I)V

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getSymbolInfo()Lcom/google/zxing/datamatrix/encoder/SymbolInfo;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v6

    sub-int/2addr v6, v5

    if-lez v6, :cond_51

    move v6, v3

    goto :goto_52

    :cond_51
    move v6, v1

    :goto_52
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->hasMoreCharacters()Z

    move-result v7

    if-nez v7, :cond_5a

    if-eqz v6, :cond_77

    :cond_5a
    const/16 v7, 0xf9

    if-gt v2, v7, :cond_63

    int-to-char v7, v2

    invoke-virtual {v0, v1, v7}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    goto :goto_77

    :cond_63
    if-le v2, v7, :cond_93

    const/16 v8, 0x613

    if-gt v2, v8, :cond_93

    div-int/lit16 v8, v2, 0xfa

    add-int/2addr v8, v7

    int-to-char v7, v8

    invoke-virtual {v0, v1, v7}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    rem-int/lit16 v1, v2, 0xfa

    int-to-char v1, v1

    invoke-virtual {v0, v3, v1}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    nop

    :cond_77
    :goto_77
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v7

    :goto_7c
    if-lt v1, v7, :cond_7f

    return-void

    :cond_7f
    nop

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->getCodewordCount()I

    move-result v9

    add-int/2addr v9, v3

    invoke-static {v8, v9}, Lcom/google/zxing/datamatrix/encoder/Base256Encoder;->randomize255State(CI)C

    move-result v8

    invoke-virtual {p1, v8}, Lcom/google/zxing/datamatrix/encoder/EncoderContext;->writeCodeword(C)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7c

    :cond_93
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v7, "Message length not in valid ranges: "

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getEncodingMode()I
    .registers 2

    const/4 v0, 0x5

    return v0
.end method
