.class public final Lcom/google/zxing/aztec/AztecReader;
.super Ljava/lang/Object;
.source "AztecReader.java"

# interfaces
.implements Lcom/google/zxing/Reader;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public decode(Lcom/google/zxing/BinaryBitmap;)Lcom/google/zxing/Result;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/aztec/AztecReader;->decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;

    move-result-object v0

    return-object v0
.end method

.method public decode(Lcom/google/zxing/BinaryBitmap;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 12
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
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    new-instance v2, Lcom/google/zxing/aztec/detector/Detector;

    invoke-virtual {p1}, Lcom/google/zxing/BinaryBitmap;->getBlackMatrix()Lcom/google/zxing/common/BitMatrix;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/google/zxing/aztec/detector/Detector;-><init>(Lcom/google/zxing/common/BitMatrix;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :try_start_e
    invoke-virtual {v2, v5}, Lcom/google/zxing/aztec/detector/Detector;->detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/aztec/AztecDetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v7

    move-object v3, v7

    new-instance v7, Lcom/google/zxing/aztec/decoder/Decoder;

    invoke-direct {v7}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    invoke-virtual {v7, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v7
    :try_end_20
    .catch Lcom/google/zxing/NotFoundException; {:try_start_e .. :try_end_20} :catch_25
    .catch Lcom/google/zxing/FormatException; {:try_start_e .. :try_end_20} :catch_22

    move-object v4, v7

    goto :goto_27

    :catch_22
    move-exception v6

    move-object v1, v6

    goto :goto_27

    :catch_25
    move-exception v6

    move-object v0, v6

    :goto_27
    if-nez v4, :cond_4f

    const/4 v6, 0x1

    :try_start_2a
    invoke-virtual {v2, v6}, Lcom/google/zxing/aztec/detector/Detector;->detect(Z)Lcom/google/zxing/aztec/AztecDetectorResult;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/aztec/AztecDetectorResult;->getPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v7

    move-object v3, v7

    new-instance v7, Lcom/google/zxing/aztec/decoder/Decoder;

    invoke-direct {v7}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    invoke-virtual {v7, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v7
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_3c} :catch_3e

    move-object v4, v7

    goto :goto_4f

    :catch_3e
    move-exception v6

    if-nez v0, :cond_42

    goto :goto_47

    :cond_42
    :try_start_42
    throw v0
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_43} :catch_43

    :catch_43
    move-exception v7

    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    :goto_47
    if-eqz v1, :cond_4a

    throw v1

    :cond_4a
    :try_start_4a
    throw v6
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4b} :catch_4b

    :catch_4b
    move-exception v7

    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    :cond_4f
    :goto_4f
    if-eqz p2, :cond_67

    sget-object v6, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/google/zxing/ResultPointCallback;

    if-eqz v6, :cond_67

    array-length v7, v3

    :goto_5c
    if-lt v5, v7, :cond_5f

    goto :goto_67

    :cond_5f
    aget-object v8, v3, v5

    invoke-interface {v6, v8}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_5c

    :cond_67
    :goto_67
    new-instance v5, Lcom/google/zxing/Result;

    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getText()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getRawBytes()[B

    move-result-object v7

    sget-object v8, Lcom/google/zxing/BarcodeFormat;->AZTEC:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v5, v6, v7, v3, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getByteSegments()Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_81

    sget-object v7, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5, v7, v6}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_81
    invoke-virtual {v4}, Lcom/google/zxing/common/DecoderResult;->getECLevel()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_8c

    sget-object v8, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    invoke-virtual {v5, v8, v7}, Lcom/google/zxing/Result;->putMetadata(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    :cond_8c
    return-object v5
.end method

.method public reset()V
    .registers 1

    return-void
.end method
