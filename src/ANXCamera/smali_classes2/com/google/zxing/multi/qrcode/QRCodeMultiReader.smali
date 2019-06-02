.class public final Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;
.super Lcom/google/zxing/qrcode/QRCodeReader;
.source "QRCodeMultiReader.java"

# interfaces
.implements Lcom/google/zxing/multi/MultipleBarcodeReader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;
    }
.end annotation


# static fields
.field private static final EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

.field private static final NO_POINTS:[Lcom/google/zxing/ResultPoint;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x0

    new-array v1, v0, [Lcom/google/zxing/Result;

    sput-object v1, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

    new-array v0, v0, [Lcom/google/zxing/ResultPoint;

    sput-object v0, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/qrcode/QRCodeReader;-><init>()V

    return-void
.end method

.method private static processStructuredAppend(Ljava/util/List;)Ljava/util/List;
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/google/zxing/Result;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_d

    :goto_b
    move v2, v0

    goto :goto_21

    :cond_d
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/Result;

    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v4, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v0, 0x1

    goto :goto_b

    :goto_21
    if-nez v2, :cond_24

    return-object p0

    :cond_24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v4, v0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v5, v0

    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_34
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_11c

    new-instance v0, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;-><init>(Lcom/google/zxing/multi/qrcode/QRCodeMultiReader$SAComparator;)V

    invoke-static {v5, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const/4 v6, 0x0

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_4e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_d6

    new-array v8, v1, [B

    new-array v9, v6, [B

    const/4 v7, 0x0

    const/4 v10, 0x0

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_5e
    :goto_5e
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-nez v12, :cond_84

    new-instance v11, Lcom/google/zxing/Result;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    sget-object v13, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->NO_POINTS:[Lcom/google/zxing/ResultPoint;

    sget-object v14, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v11, v12, v8, v13, v14}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    if-lez v6, :cond_80

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v12, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    sget-object v13, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v11, v13, v12}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_80
    invoke-interface {v4, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v4

    :cond_84
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/google/zxing/Result;

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v13

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v14

    array-length v14, v14

    const/4 v15, 0x0

    invoke-static {v13, v15, v8, v7, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v13

    array-length v13, v13

    add-int/2addr v7, v13

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v13

    sget-object v14, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v13, v14}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5e

    invoke-virtual {v12}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v13

    sget-object v14, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v13, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Iterable;

    nop

    invoke-interface {v13}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_ba
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_c1

    goto :goto_5e

    :cond_c1
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v15, v16

    check-cast v15, [B

    move/from16 v17, v2

    array-length v2, v15

    const/4 v3, 0x0

    invoke-static {v15, v3, v9, v10, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v15

    add-int/2addr v10, v2

    move v15, v3

    move/from16 v2, v17

    goto :goto_ba

    :cond_d6
    move/from16 v17, v2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/Result;

    invoke-virtual {v2}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Lcom/google/zxing/Result;->getRawBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v1, v3

    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v8, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_118

    invoke-virtual {v2}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v3

    sget-object v8, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v3, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Iterable;

    nop

    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_108
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-nez v9, :cond_10f

    goto :goto_118

    :cond_10f
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [B

    array-length v10, v9

    add-int/2addr v6, v10

    goto :goto_108

    :cond_118
    :goto_118
    move/from16 v2, v17

    goto/16 :goto_4e

    :cond_11c
    move/from16 v17, v2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/Result;

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Lcom/google/zxing/Result;->getResultMetadata()Ljava/util/Map;

    move-result-object v1

    sget-object v2, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_136

    invoke-interface {v5, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_136
    move/from16 v2, v17

    goto/16 :goto_34
.end method


# virtual methods
.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;)[Lcom/google/zxing/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decodeMultiple(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)[Lcom/google/zxing/Result;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/BinaryBitmap;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)[",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    invoke-virtual {v1, p2}, Lcom/google/zxing/multi/qrcode/detector/MultiDetector;->detectMulti(Ljava/util/Map;)[Lcom/google/zxing/common/DetectorResult;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_14
    if-lt v3, v2, :cond_30

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1f

    sget-object v2, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->EMPTY_RESULT_ARRAY:[Lcom/google/zxing/Result;

    return-object v2

    :cond_1f
    invoke-static {v0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->processStructuredAppend(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/google/zxing/Result;

    invoke-interface {v0, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lcom/google/zxing/Result;

    return-object v2

    :cond_30
    aget-object v4, v1, v3

    :try_start_32
    invoke-virtual {p0}, Lcom/google/zxing/multi/qrcode/QRCodeMultiReader;->getDecoder()Lcom/google/zxing/qrcode/decoder/Decoder;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/zxing/common/DetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v6

    invoke-virtual {v5, v6, p2}, Lcom/google/zxing/qrcode/decoder/Decoder;->decode(Lcom/google/zxing/common/BitMatrix;Ljava/util/Map;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/zxing/common/DetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v7

    instance-of v7, v7, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    if-eqz v7, :cond_53

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getOther()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;

    invoke-virtual {v7, v6}, Lcom/google/zxing/qrcode/decoder/QRCodeDecoderMetaData;->applyMirroredCorrection([Lcom/google/zxing/ResultPoint;)V

    :cond_53
    new-instance v7, Lcom/google/zxing/Result;

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v9

    sget-object v10, Lcom/google/zxing/BarcodeFormat;->QR_CODE:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v7, v8, v9, v6, v10}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v8

    if-eqz v8, :cond_6d

    sget-object v9, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v7, v9, v8}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_6d
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_78

    sget-object v10, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v7, v10, v9}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_78
    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->hasStructuredAppend()Z

    move-result v10

    if-eqz v10, :cond_98

    sget-object v10, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_SEQUENCE:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendSequenceNumber()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    sget-object v10, Lcom/google/zxing/ResultMetadataType;->STRUCTURED_APPEND_PARITY:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5}, Lcom/google/zxing/common/DecoderResult;->getStructuredAppendParity()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_98
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_9b
    .catch Lcom/google/zxing/ReaderException; {:try_start_32 .. :try_end_9b} :catch_9c

    goto :goto_9d

    :catch_9c
    move-exception v5

    :goto_9d
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_14
.end method
