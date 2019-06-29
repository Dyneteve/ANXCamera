.class public Lcom/google/zxing/qrcode/QRCodeReader;
.super Ljava/lang/Object;
.source "QRCodeReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# static fields
.field private static final NO_POINTS:[Lcom/google/zxing/ResultPoint;


# instance fields
.field private final decoder:Lcom/google/zxing/qrcode/decoder/Decoder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    sput-object v0, Lcom/google/zxing/qrcode/QRCodeReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/google/zxing/qrcode/decoder/Decoder;

    invoke-direct {v0}, Lcom/google/zxing/qrcode/decoder/Decoder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/qrcode/QRCodeReader;->decoder:Lcom/google/zxing/qrcode/decoder/Decoder;

    return-void
.end method

.method private static extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/common/BitMatrix;->getTopLeftOnBit()[I

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/common/BitMatrix;->getBottomRightOnBit()[I

    move-result-object v2

    if-eqz v1, :cond_ba

    if-eqz v2, :cond_ba

    invoke-static {v1, v0}, Lcom/google/zxing/qrcode/QRCodeReader;->moduleSize([ILcom/google/zxing/common/BitMatrix;)F

    move-result v3

    const/4 v4, 0x1

    aget v5, v1, v4

    aget v6, v2, v4

    const/4 v7, 0x0

    aget v8, v1, v7

    aget v7, v2, v7

    if-ge v8, v7, :cond_b1

    if-ge v5, v6, :cond_b1

    sub-int v9, v6, v5

    sub-int v10, v7, v8

    if-eq v9, v10, :cond_2a

    sub-int v9, v6, v5

    add-int v7, v8, v9

    :cond_2a
    sub-int v9, v7, v8

    add-int/2addr v9, v4

    int-to-float v9, v9

    div-float/2addr v9, v3

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    sub-int v10, v6, v5

    add-int/2addr v10, v4

    int-to-float v4, v10

    div-float/2addr v4, v3

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-lez v9, :cond_a8

    if-lez v4, :cond_a8

    if-ne v4, v9, :cond_9f

    const/high16 v10, 0x40000000    # 2.0f

    div-float v10, v3, v10

    float-to-int v10, v10

    add-int/2addr v5, v10

    add-int/2addr v8, v10

    add-int/lit8 v11, v9, -0x1

    int-to-float v11, v11

    mul-float/2addr v11, v3

    float-to-int v11, v11

    add-int/2addr v11, v8

    sub-int/2addr v11, v7

    if-lez v11, :cond_5b

    if-gt v11, v10, :cond_56

    sub-int/2addr v8, v11

    goto :goto_5b

    :cond_56
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v12

    throw v12

    :cond_5b
    :goto_5b
    move v12, v8

    add-int/lit8 v8, v4, -0x1

    int-to-float v8, v8

    mul-float/2addr v8, v3

    float-to-int v8, v8

    add-int/2addr v8, v5

    sub-int v13, v8, v6

    if-lez v13, :cond_6f

    if-gt v13, v10, :cond_6a

    sub-int/2addr v5, v13

    goto :goto_6f

    :cond_6a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v8

    throw v8

    :cond_6f
    :goto_6f
    move v14, v5

    new-instance v5, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v5, v9, v4}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    move-object v15, v5

    const/4 v5, 0x0

    :goto_77
    if-lt v5, v4, :cond_7a

    return-object v15

    :cond_7a
    int-to-float v8, v5

    mul-float/2addr v8, v3

    float-to-int v8, v8

    add-int/2addr v8, v14

    const/16 v16, 0x0

    move-object/from16 v17, v1

    move/from16 v1, v16

    :goto_84
    if-lt v1, v9, :cond_8b

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v1, v17

    goto :goto_77

    :cond_8b
    move-object/from16 v18, v2

    int-to-float v2, v1

    mul-float/2addr v2, v3

    float-to-int v2, v2

    add-int/2addr v2, v12

    invoke-virtual {v0, v2, v8}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    if-eqz v2, :cond_9a

    invoke-virtual {v15, v1, v5}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_9a
    add-int/lit8 v1, v1, 0x1

    move-object/from16 v2, v18

    goto :goto_84

    :cond_9f
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_a8
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_b1
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_ba
    move-object/from16 v17, v1

    move-object/from16 v18, v2

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private static moduleSize([ILcom/google/zxing/common/BitMatrix;)F
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    const/4 v2, 0x0

    aget v3, p0, v2

    const/4 v4, 0x1

    aget v5, p0, v4

    const/4 v6, 0x1

    const/4 v7, 0x0

    :goto_10
    if-ge v3, v1, :cond_2c

    if-lt v5, v0, :cond_15

    goto :goto_2c

    :cond_15
    invoke-virtual {p1, v3, v5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v8

    if-eq v6, v8, :cond_27

    add-int/lit8 v7, v7, 0x1

    const/4 v8, 0x5

    if-ne v7, v8, :cond_21

    goto :goto_2c

    :cond_21
    if-eqz v6, :cond_25

    move v8, v2

    goto :goto_26

    :cond_25
    move v8, v4

    :goto_26
    move v6, v8

    :cond_27
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_10

    :cond_2c
    :goto_2c
    if-eq v3, v1, :cond_39

    if-eq v5, v0, :cond_39

    aget v2, p0, v2

    sub-int v2, v3, v2

    int-to-float v2, v2

    const/high16 v4, 0x40e00000    # 7.0f

    div-float/2addr v2, v4

    return v2

    :cond_39
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/qrcode/QRCodeReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public final decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    if-eqz p2, :cond_1b

    sget-object v0, Lcom/google/zxing/DecodeHintType;->PURE_BARCODE:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/qrcode/QRCodeReader;->extractPureBits(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/qrcode/QRCodeReader;->decoder:Lcom/google/zxing/qrcode/decoder/Decoder;

    invoke-virtual {v1, v0, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1

    sget-object v0, Lcom/google/zxing/qrcode/QRCodeReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    goto :goto_36

    :cond_1b
    new-instance v0, Lcom/google/zxing/qrcode/detector/Detector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/qrcode/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v0, p2}, Lcom/google/zxing/qrcode/detector/Detector;->detect(Ljava/util/Map;)Lcom/google/zxing/common/DetectorResult;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/qrcode/QRCodeReader;->decoder:Lcom/google/zxing/qrcode/decoder/Decoder;

    invoke-virtual {v0}, Lcom/google/zxing/common/DetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    invoke-virtual {v1, v2, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/zxing/common/DetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v0

    :goto_36
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    if-eqz v2, :cond_47

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    invoke-virtual {v2, v0}, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->applyMirroredCorrection([Lcom/google/zxing/ResultPoint;)V

    :cond_47
    new-instance v2, Lcom/google/zxing/Result;

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v4

    sget-object v5, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v2, v3, v4, v0, v5}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_61

    sget-object v4, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v2, v4, v3}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_61
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_6c

    sget-object v5, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v2, v5, v4}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_6c
    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->hasStructuredAppend()Z

    move-result v5

    if-eqz v5, :cond_8c

    sget-object v5, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendSequenceNumber()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    sget-object v5, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_PARITY:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v1}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendParity()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_8c
    return-object v2
.end method

.method protected final getDecoder()Lcom/google/zxing/qrcode/decoder/Decoder;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/QRCodeReader;->decoder:Lcom/google/zxing/qrcode/decoder/Decoder;

    return-object v0
.end method

.method public reset()V
    .registers 1

    return-void
.end method
