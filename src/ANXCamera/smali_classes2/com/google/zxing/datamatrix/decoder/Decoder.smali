.class public final Lcom/google/zxing/datamatrix/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->DATA_MATRIX_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    return-void
.end method

.method private correctErrors([BI)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    array-length v0, p1

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_4
    if-lt v2, v0, :cond_20

    array-length v2, p1

    sub-int/2addr v2, p2

    :try_start_8
    iget-object v3, p0, Lcom/google/zxing/datamatrix/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-virtual {v3, v1, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_d
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_8 .. :try_end_d} :catch_1a

    nop

    const/4 v3, 0x0

    :goto_f
    if-lt v3, p2, :cond_12

    return-void

    :cond_12
    aget v4, v1, v3

    int-to-byte v4, v4

    aput-byte v4, p1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_f

    :catch_1a
    move-exception v3

    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v4

    throw v4

    :cond_20
    aget-byte v3, p1, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method


# virtual methods
.method public decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    new-instance v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->getVersion()Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    invoke-static {v2, v1}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    array-length v6, v3

    const/4 v7, 0x0

    :goto_15
    if-lt v7, v6, :cond_3f

    new-array v8, v5, [B

    const/4 v6, 0x0

    move v9, v6

    :goto_1b
    if-lt v9, v4, :cond_22

    invoke-static {v8}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decode([B)Lcom/google/zxing/common/DecoderResult;

    move-result-object v6

    return-object v6

    :cond_22
    aget-object v10, v3, v9

    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getCodewords()[B

    move-result-object v11

    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v12

    invoke-direct {p0, v11, v12}, Lcom/google/zxing/datamatrix/decoder/Decoder;->correctErrors([BI)V

    const/4 v6, 0x0

    :goto_30
    if-lt v6, v12, :cond_35

    add-int/lit8 v9, v9, 0x1

    goto :goto_1b

    :cond_35
    mul-int v7, v6, v4

    add-int/2addr v7, v9

    aget-byte v13, v11, v6

    aput-byte v13, v8, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_30

    :cond_3f
    aget-object v8, v3, v7

    invoke-virtual {v8}, Lcom/google/zxing/datamatrix/decoder/DataBlock;->getNumDataCodewords()I

    move-result v9

    add-int/2addr v5, v9

    add-int/lit8 v7, v7, 0x1

    goto :goto_15
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    array-length v0, p1

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    const/4 v2, 0x0

    :goto_7
    if-lt v2, v0, :cond_e

    invoke-virtual {p0, v1}, Lcom/google/zxing/datamatrix/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    :cond_e
    const/4 v3, 0x0

    :goto_f
    if-lt v3, v0, :cond_14

    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_14
    aget-object v4, p1, v2

    aget-boolean v4, v4, v3

    if-eqz v4, :cond_1d

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_f
.end method
