.class public final Lcom/google/zxing/maxicode/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# static fields
.field private static final ALL:I = 0x0

.field private static final EVEN:I = 0x1

.field private static final ODD:I = 0x2


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->MAXICODE_FIELD_64:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/maxicode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    return-void
.end method

.method private correctErrors([BIIII)V
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    add-int v0, p3, p4

    if-nez p5, :cond_6

    const/4 v1, 0x1

    goto :goto_7

    :cond_6
    const/4 v1, 0x2

    :goto_7
    div-int v2, v0, v1

    new-array v2, v2, [I

    const/4 v3, 0x0

    :goto_c
    if-lt v3, v0, :cond_34

    :try_start_e
    iget-object v3, p0, Lcom/google/zxing/maxicode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    div-int v4, p4, v1

    invoke-virtual {v3, v2, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_15
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_e .. :try_end_15} :catch_2e

    nop

    const/4 v3, 0x0

    :goto_17
    if-lt v3, p3, :cond_1a

    return-void

    :cond_1a
    if-eqz p5, :cond_22

    rem-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, p5, -0x1

    if-ne v4, v5, :cond_2b

    :cond_22
    add-int v4, v3, p2

    div-int v5, v3, v1

    aget v5, v2, v5

    int-to-byte v5, v5

    aput-byte v5, p1, v4

    :cond_2b
    add-int/lit8 v3, v3, 0x1

    goto :goto_17

    :catch_2e
    move-exception v3

    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    :cond_34
    if-eqz p5, :cond_3c

    rem-int/lit8 v4, v3, 0x2

    add-int/lit8 v5, p5, -0x1

    if-ne v4, v5, :cond_46

    :cond_3c
    div-int v4, v3, v1

    add-int v5, v3, p2

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    aput v5, v2, v4

    :cond_46
    add-int/lit8 v3, v3, 0x1

    goto :goto_c
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/maxicode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitMatrix;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    new-instance v0, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v0}, Lcom/google/zxing/maxicode/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v7

    const/4 v3, 0x0

    const/16 v4, 0xa

    const/16 v5, 0xa

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    const/4 v8, 0x0

    aget-byte v1, v7, v8

    and-int/lit8 v9, v1, 0xf

    packed-switch v9, :pswitch_data_5e

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_21
    const/16 v3, 0x14

    const/16 v4, 0x44

    const/16 v5, 0x38

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    const/4 v6, 0x2

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    const/16 v1, 0x4e

    new-array v1, v1, [B

    goto :goto_4b

    :pswitch_36
    const/16 v3, 0x14

    const/16 v4, 0x54

    const/16 v5, 0x28

    const/4 v6, 0x1

    move-object v1, p0

    move-object v2, v7

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    const/4 v6, 0x2

    invoke-direct/range {v1 .. v6}, Lcom/google/zxing/maxicode/decoder/Decoder;->correctErrors([BIIII)V

    const/16 v1, 0x5e

    new-array v1, v1, [B

    nop

    :goto_4b
    nop

    const/16 v2, 0xa

    invoke-static {v7, v8, v1, v8, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/16 v3, 0x14

    array-length v4, v1

    sub-int/2addr v4, v2

    invoke-static {v7, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v1, v9}, Lcom/google/zxing/maxicode/decoder/DecodedBitStreamParser;->decode([BI)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    nop

    :pswitch_data_5e
    .packed-switch 0x2
        :pswitch_36
        :pswitch_36
        :pswitch_36
        :pswitch_21
    .end packed-switch
.end method
