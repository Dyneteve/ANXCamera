.class public final Lcom/google/zxing/qrcode/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# instance fields
.field private final rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    sget-object v1, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v0, v1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    iput-object v0, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

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
    iget-object v3, p0, Lcom/google/zxing/qrcode/decoder/Decoder;->rsDecoder:Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

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

.method private decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/qrcode/decoder/BitMatrixParser;",
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

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->getErrorCorrectionLevel()Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;

    move-result-object v1

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readCodewords()[B

    move-result-object v2

    invoke-static {v2, v0, v1}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;

    move-result-object v3

    const/4 v4, 0x0

    array-length v5, v3

    const/4 v6, 0x0

    move v7, v4

    move v4, v6

    :goto_19
    if-lt v4, v5, :cond_4a

    new-array v8, v7, [B

    const/4 v4, 0x0

    array-length v9, v3

    move v10, v6

    :goto_20
    if-lt v10, v9, :cond_29

    move-object/from16 v11, p2

    invoke-static {v8, v0, v1, v11}, Lcom/google/zxing/qrcode/decoder/DecodedBitStreamParser;->decode([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    return-object v5

    :cond_29
    move-object/from16 v11, p2

    aget-object v12, v3, v10

    invoke-virtual {v12}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getCodewords()[B

    move-result-object v13

    invoke-virtual {v12}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v14

    move-object/from16 v15, p0

    invoke-direct {v15, v13, v14}, Lcom/google/zxing/qrcode/decoder/Decoder;->correctErrors([BI)V

    const/4 v5, 0x0

    :goto_3b
    if-lt v5, v14, :cond_40

    add-int/lit8 v10, v10, 0x1

    goto :goto_20

    :cond_40
    add-int/lit8 v6, v4, 0x1

    aget-byte v16, v13, v5

    aput-byte v16, v8, v4

    add-int/lit8 v5, v5, 0x1

    move v4, v6

    goto :goto_3b

    :cond_4a
    move-object/from16 v15, p0

    move-object/from16 v11, p2

    aget-object v8, v3, v4

    invoke-virtual {v8}, Lcom/google/zxing/qrcode/decoder/DataBlock;->getNumDataCodewords()I

    move-result v9

    add-int/2addr v7, v9

    add-int/lit8 v4, v4, 0x1

    goto :goto_19
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

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .registers 9
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

    new-instance v0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;

    invoke-direct {v0, p1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_7
    invoke-direct {p0, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v3
    :try_end_b
    .catch Lcom/google/zxing/FormatException; {:try_start_7 .. :try_end_b} :catch_f
    .catch Lcom/google/zxing/ChecksumException; {:try_start_7 .. :try_end_b} :catch_c

    return-object v3

    :catch_c
    move-exception v3

    move-object v2, v3

    goto :goto_11

    :catch_f
    move-exception v3

    move-object v1, v3

    :goto_11
    :try_start_11
    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->remask()V

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->setMirror(Z)V

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->mirror()V

    invoke-direct {p0, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/qrcode/decoder/BitMatrixParser;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v4

    new-instance v5, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    invoke-direct {v5, v3}, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;-><init>(Z)V

    invoke-virtual {v4, v5}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V
    :try_end_2d
    .catch Lcom/google/zxing/FormatException; {:try_start_11 .. :try_end_2d} :catch_36
    .catch Lcom/google/zxing/ChecksumException; {:try_start_11 .. :try_end_2d} :catch_2e

    return-object v4

    :catch_2e
    move-exception v3

    if-nez v1, :cond_35

    if-eqz v2, :cond_34

    throw v2

    :cond_34
    throw v3

    :cond_35
    throw v1

    :catch_36
    move-exception v3

    if-nez v1, :cond_3d

    if-eqz v2, :cond_3c

    throw v2

    :cond_3c
    throw v3

    :cond_3d
    throw v1
.end method

.method public decode([[Z)Lcom/google/zxing/common/DecoderResult;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v0

    return-object v0
.end method

.method public decode([[ZLjava/util/Map;)Lcom/google/zxing/common/DecoderResult;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[Z",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/DecoderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    array-length v0, p1

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    const/4 v2, 0x0

    :goto_7
    if-lt v2, v0, :cond_e

    invoke-virtual {p0, v1, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

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
