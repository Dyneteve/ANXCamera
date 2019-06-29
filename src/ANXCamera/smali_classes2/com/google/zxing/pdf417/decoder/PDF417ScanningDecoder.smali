.class public final Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;
.super Ljava/lang/Object;
.source "PDF417ScanningDecoder.java"


# static fields
.field private static final CODEWORD_SKEW_SIZE:I = 0x2

.field private static final MAX_EC_CODEWORDS:I = 0x200

.field private static final MAX_ERRORS:I = 0x3

.field private static final errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    invoke-direct {v0}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;-><init>()V

    sput-object v0, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getRowHeights()[I

    move-result-object v1

    if-nez v1, :cond_b

    return-object v0

    :cond_b
    invoke-static {v1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getMax([I)I

    move-result v0

    const/4 v2, 0x0

    array-length v3, v1

    const/4 v4, 0x0

    :goto_12
    if-lt v4, v3, :cond_15

    goto :goto_1d

    :cond_15
    aget v5, v1, v4

    sub-int v6, v0, v5

    add-int/2addr v2, v6

    if-lez v5, :cond_5f

    nop

    :goto_1d
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    const/4 v3, 0x0

    move v6, v2

    :goto_23
    if-lez v6, :cond_2f

    aget-object v2, v5, v3

    if-eqz v2, :cond_2a

    goto :goto_2f

    :cond_2a
    add-int/lit8 v6, v6, -0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    :cond_2f
    :goto_2f
    const/4 v2, 0x0

    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    :goto_33
    if-gez v3, :cond_36

    goto :goto_40

    :cond_36
    aget v4, v1, v3

    sub-int v4, v0, v4

    add-int/2addr v2, v4

    aget v4, v1, v3

    if-lez v4, :cond_5c

    nop

    :goto_40
    array-length v3, v5

    add-int/lit8 v3, v3, -0x1

    :goto_43
    if-lez v2, :cond_4f

    aget-object v4, v5, v3

    if-eqz v4, :cond_4a

    goto :goto_4f

    :cond_4a
    add-int/lit8 v2, v2, -0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_43

    :cond_4f
    :goto_4f
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->isLeft()Z

    move-result v4

    invoke-virtual {v3, v6, v2, v4}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->addMissingRows(IIZ)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    return-object v3

    :cond_5c
    add-int/lit8 v3, v3, -0x1

    goto :goto_33

    :cond_5f
    add-int/lit8 v4, v4, 0x1

    goto :goto_12
.end method

.method private static adjustCodewordCount(Lcom/google/zxing/pdf417/decoder/DetectionResult;[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    aget-object v1, p1, v0

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v3

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v4

    mul-int/2addr v3, v4

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeECLevel()I

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getNumberOfECCodeWords(I)I

    move-result v4

    sub-int/2addr v3, v4

    array-length v4, v1

    if-nez v4, :cond_32

    if-lt v3, v2, :cond_2d

    const/16 v4, 0x3a0

    if-gt v3, v4, :cond_2d

    aget-object v0, p1, v0

    aget-object v0, v0, v2

    invoke-virtual {v0, v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    goto :goto_3d

    :cond_2d
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_32
    aget v4, v1, v0

    if-eq v4, v3, :cond_3d

    aget-object v0, p1, v0

    aget-object v0, v0, v2

    invoke-virtual {v0, v3}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    :cond_3d
    :goto_3d
    return-void
.end method

.method private static adjustCodewordStartColumn(Lcom/google/zxing/common/BitMatrix;IIZII)I
    .registers 12

    move v0, p4

    const/4 v1, 0x1

    if-eqz p3, :cond_6

    const/4 v2, -0x1

    goto :goto_7

    :cond_6
    move v2, v1

    :goto_7
    const/4 v3, 0x0

    :goto_8
    const/4 v4, 0x2

    if-lt v3, v4, :cond_c

    return v0

    :cond_c
    :goto_c
    if-eqz p3, :cond_10

    if-ge v0, p1, :cond_14

    :cond_10
    if-nez p3, :cond_26

    if-ge v0, p2, :cond_26

    :cond_14
    invoke-virtual {p0, v0, p5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v5

    if-eq p3, v5, :cond_1b

    goto :goto_26

    :cond_1b
    sub-int v5, p4, v0

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    if-le v5, v4, :cond_24

    return p4

    :cond_24
    add-int/2addr v0, v2

    goto :goto_c

    :cond_26
    :goto_26
    neg-int v2, v2

    if-eqz p3, :cond_2b

    const/4 v4, 0x0

    goto :goto_2c

    :cond_2b
    move v4, v1

    :goto_2c
    move p3, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_8
.end method

.method private static checkCodewordSkew(III)Z
    .registers 4

    add-int/lit8 v0, p1, -0x2

    if-gt v0, p0, :cond_a

    add-int/lit8 v0, p2, 0x2

    if-gt p0, v0, :cond_a

    const/4 v0, 0x1

    return v0

    :cond_a
    const/4 v0, 0x0

    return v0
.end method

.method private static correctErrors([I[II)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    if-eqz p1, :cond_9

    array-length v0, p1

    div-int/lit8 v1, p2, 0x2

    add-int/lit8 v1, v1, 0x3

    if-gt v0, v1, :cond_16

    :cond_9
    if-ltz p2, :cond_16

    const/16 v0, 0x200

    if-gt p2, v0, :cond_16

    sget-object v0, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->errorCorrection:Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;

    invoke-virtual {v0, p0, p2, p1}, Lcom/google/zxing/pdf417/decoder/ec/ErrorCorrection;->decode([II[I)I

    move-result v0

    return v0

    :cond_16
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v0

    throw v0
.end method

.method private static createBarcodeMatrix(Lcom/google/zxing/pdf417/decoder/DetectionResult;)[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v1

    add-int/lit8 v1, v1, 0x2

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v1, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    nop

    const/4 v1, 0x0

    :goto_18
    array-length v2, v0

    if-lt v1, v2, :cond_5a

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumns()[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v1

    move v1, v4

    :goto_24
    if-lt v1, v3, :cond_27

    return-object v0

    :cond_27
    aget-object v6, v2, v1

    if-eqz v6, :cond_55

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v7

    array-length v8, v7

    move v9, v4

    :goto_31
    if-lt v9, v8, :cond_34

    goto :goto_55

    :cond_34
    aget-object v10, v7, v9

    if-eqz v10, :cond_52

    invoke-virtual {v10}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v11

    if-ltz v11, :cond_52

    array-length v12, v0

    if-ge v11, v12, :cond_4d

    aget-object v12, v0, v11

    aget-object v12, v12, v5

    invoke-virtual {v10}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->setValue(I)V

    goto :goto_52

    :cond_4d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :cond_52
    :goto_52
    add-int/lit8 v9, v9, 0x1

    goto :goto_31

    :cond_55
    :goto_55
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_24

    :cond_5a
    const/4 v2, 0x0

    :goto_5b
    aget-object v3, v0, v1

    array-length v3, v3

    if-lt v2, v3, :cond_63

    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_63
    aget-object v3, v0, v1

    new-instance v4, Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    invoke-direct {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;-><init>()V

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_5b
.end method

.method private static createDecoderResult(Lcom/google/zxing/pdf417/decoder/DetectionResult;)Lcom/google/zxing/common/DecoderResult;
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createBarcodeMatrix(Lcom/google/zxing/pdf417/decoder/DetectionResult;)[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustCodewordCount(Lcom/google/zxing/pdf417/decoder/DetectionResult;[[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v3

    mul-int/2addr v2, v3

    new-array v2, v2, [I

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    :goto_22
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeRowCount()I

    move-result v6

    if-lt v5, v6, :cond_4e

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    new-array v6, v5, [[I

    const/4 v5, 0x0

    :goto_2f
    array-length v7, v6

    if-lt v5, v7, :cond_43

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeECLevel()I

    move-result v5

    invoke-static {v1}, Lcom/google/zxing/pdf417/PDF417Common;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v7

    invoke-static {v4}, Lcom/google/zxing/pdf417/PDF417Common;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v8

    invoke-static {v5, v2, v7, v8, v6}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createDecoderResultFromAmbiguousValues(I[I[I[I[[I)Lcom/google/zxing/common/DecoderResult;

    move-result-object v5

    return-object v5

    :cond_43
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [I

    aput-object v7, v6, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_2f

    :cond_4e
    const/4 v6, 0x0

    :goto_4f
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v7

    if-lt v6, v7, :cond_58

    add-int/lit8 v5, v5, 0x1

    goto :goto_22

    :cond_58
    aget-object v7, v0, v5

    add-int/lit8 v8, v6, 0x1

    aget-object v7, v7, v8

    invoke-virtual {v7}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v7

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v8

    mul-int/2addr v8, v5

    add-int/2addr v8, v6

    array-length v9, v7

    if-nez v9, :cond_73

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v1, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_87

    :cond_73
    array-length v9, v7

    const/4 v10, 0x1

    if-ne v9, v10, :cond_7d

    const/4 v9, 0x0

    aget v9, v7, v9

    aput v9, v2, v8

    goto :goto_87

    :cond_7d
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_87
    add-int/lit8 v6, v6, 0x1

    goto :goto_4f
.end method

.method private static createDecoderResultFromAmbiguousValues(I[I[I[I[[I)Lcom/google/zxing/common/DecoderResult;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    array-length v0, p3

    new-array v0, v0, [I

    const/16 v1, 0x64

    :goto_5
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_4f

    const/4 v1, 0x0

    :goto_a
    array-length v3, v0

    if-lt v1, v3, :cond_42

    :try_start_d
    invoke-static {p1, p0, p2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->decodeCodewords([II[I)Lcom/google/zxing/common/DecoderResult;

    move-result-object v1
    :try_end_11
    .catch Lcom/google/zxing/ChecksumException; {:try_start_d .. :try_end_11} :catch_12

    return-object v1

    :catch_12
    move-exception v1

    array-length v1, v0

    if-eqz v1, :cond_3d

    const/4 v1, 0x0

    :goto_17
    array-length v3, v0

    if-lt v1, v3, :cond_1b

    goto :goto_2b

    :cond_1b
    aget v3, v0, v1

    aget-object v4, p4, v1

    array-length v4, v4

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_2d

    aget v3, v0, v1

    add-int/lit8 v3, v3, 0x1

    aput v3, v0, v1

    nop

    :goto_2b
    move v1, v2

    goto :goto_5

    :cond_2d
    const/4 v3, 0x0

    aput v3, v0, v1

    array-length v3, v0

    add-int/lit8 v3, v3, -0x1

    if-eq v1, v3, :cond_38

    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    :cond_38
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v3

    throw v3

    :cond_3d
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v1

    throw v1

    :cond_42
    aget v3, p3, v1

    aget-object v4, p4, v1

    aget v5, v0, v1

    aget v4, v4, v5

    aput v4, p1, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_4f
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v1

    throw v1
.end method

.method public static decode(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;II)Lcom/google/zxing/common/DecoderResult;
    .registers 29
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    new-instance v6, Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-object v0, v6

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;-><init>(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;Lcom/google/zxing/ResultPoint;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_14
    const/4 v5, 0x2

    if-lt v4, v5, :cond_1b

    :goto_17
    move-object v6, v1

    move-object v7, v2

    move-object v5, v3

    goto :goto_73

    :cond_1b
    if-eqz p1, :cond_2c

    const/4 v8, 0x1

    nop

    move-object/from16 v5, p0

    move-object v6, v0

    move-object/from16 v7, p1

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    move-result-object v1

    :cond_2c
    if-eqz p3, :cond_3d

    const/4 v8, 0x0

    nop

    move-object/from16 v5, p0

    move-object v6, v0

    move-object/from16 v7, p3

    move/from16 v9, p5

    move/from16 v10, p6

    invoke-static/range {v5 .. v10}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    move-result-object v2

    :cond_3d
    invoke-static {v1, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->merge(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/DetectionResult;

    move-result-object v3

    if-eqz v3, :cond_12f

    if-nez v4, :cond_6f

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    if-eqz v5, :cond_6f

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v6

    if-lt v5, v6, :cond_67

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v5

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v6

    if-le v5, v6, :cond_6f

    :cond_67
    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    nop

    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    :cond_6f
    invoke-virtual {v3, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setBoundingBox(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    goto :goto_17

    :goto_73
    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v1

    const/4 v8, 0x1

    add-int/lit8 v9, v1, 0x1

    const/4 v10, 0x0

    invoke-virtual {v5, v10, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    invoke-virtual {v5, v9, v7}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    if-eqz v6, :cond_85

    move v1, v8

    goto :goto_86

    :cond_85
    move v1, v10

    :goto_86
    const/4 v2, 0x1

    move/from16 v3, p5

    move/from16 v4, p6

    :goto_8b
    if-le v2, v9, :cond_92

    invoke-static {v5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->createDecoderResult(Lcom/google/zxing/pdf417/decoder/DetectionResult;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    return-object v2

    :cond_92
    if-eqz v1, :cond_96

    move v11, v2

    goto :goto_98

    :cond_96
    sub-int v11, v9, v2

    :goto_98
    move v13, v11

    invoke-virtual {v5, v13}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v11

    if-eqz v11, :cond_a0

    goto :goto_d0

    :cond_a0
    if-eqz v13, :cond_ab

    if-ne v13, v9, :cond_a5

    goto :goto_ab

    :cond_a5
    new-instance v11, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    invoke-direct {v11, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    goto :goto_b6

    :cond_ab
    :goto_ab
    new-instance v11, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    if-nez v13, :cond_b1

    move v12, v8

    goto :goto_b2

    :cond_b1
    move v12, v10

    :goto_b2
    invoke-direct {v11, v0, v12}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;Z)V

    nop

    :goto_b6
    move-object v12, v11

    invoke-virtual {v5, v13, v12}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    const/4 v11, -0x1

    move v14, v11

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v15

    move/from16 v19, v3

    move/from16 v20, v4

    move v4, v14

    move v3, v15

    :goto_c6
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v8

    if-le v3, v8, :cond_d4

    move/from16 v3, v19

    move/from16 v4, v20

    :goto_d0
    add-int/lit8 v2, v2, 0x1

    const/4 v8, 0x1

    goto :goto_8b

    :cond_d4
    invoke-static {v5, v13, v3, v1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getStartColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;IIZ)I

    move-result v8

    if-ltz v8, :cond_e0

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v11

    if-le v8, v11, :cond_ea

    :cond_e0
    const/4 v11, -0x1

    if-ne v4, v11, :cond_e9

    nop

    move v11, v8

    move-object v10, v12

    move/from16 v21, v13

    goto :goto_127

    :cond_e9
    move v8, v4

    :cond_ea
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinX()I

    move-result v14

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v15

    nop

    move-object/from16 v11, p0

    move-object v10, v12

    move v12, v14

    move/from16 v21, v13

    move v13, v15

    move v14, v1

    move v15, v8

    move/from16 v16, v3

    move/from16 v17, v19

    move/from16 v18, v20

    invoke-static/range {v11 .. v18}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v11

    if-eqz v11, :cond_122

    invoke-virtual {v10, v3, v11}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->setCodeword(ILcom/google/zxing/pdf417/decoder/Codeword;)V

    move v4, v8

    invoke-virtual {v11}, Lcom/google/zxing/pdf417/decoder/Codeword;->getWidth()I

    move-result v12

    move/from16 v13, v19

    invoke-static {v13, v12}, Ljava/lang/Math;->min(II)I

    move-result v19

    invoke-virtual {v11}, Lcom/google/zxing/pdf417/decoder/Codeword;->getWidth()I

    move-result v12

    move/from16 v13, v20

    invoke-static {v13, v12}, Ljava/lang/Math;->max(II)I

    move-result v20

    move v11, v8

    goto :goto_127

    :cond_122
    move/from16 v13, v19

    move/from16 v11, v20

    move v11, v8

    :goto_127
    add-int/lit8 v3, v3, 0x1

    move-object v12, v10

    move/from16 v13, v21

    const/4 v8, 0x1

    const/4 v10, 0x0

    goto :goto_c6

    :cond_12f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private static decodeCodewords([II[I)Lcom/google/zxing/common/DecoderResult;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;,
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    array-length v0, p0

    if-eqz v0, :cond_27

    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    shl-int v0, v1, v0

    invoke-static {p0, p2, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->correctErrors([I[II)I

    move-result v1

    invoke-static {p0, v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->verifyCodewordCount([II)V

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/common/DecoderResult;->setErrorsCorrected(Ljava/lang/Integer;)V

    array-length v3, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/google/zxing/common/DecoderResult;->setErasures(Ljava/lang/Integer;)V

    return-object v2

    :cond_27
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;
    .registers 15

    invoke-static/range {p0 .. p5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustCodewordStartColumn(Lcom/google/zxing/common/BitMatrix;IIZII)I

    move-result p4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getModuleBitCount(Lcom/google/zxing/common/BitMatrix;IIZII)[I

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_12

    return-object v1

    :cond_12
    invoke-static {v0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v2

    if-eqz p3, :cond_1b

    add-int v3, p4, v2

    goto :goto_24

    :cond_1b
    const/4 v3, 0x0

    :goto_1c
    array-length v4, v0

    div-int/lit8 v4, v4, 0x2

    if-lt v3, v4, :cond_41

    move v3, p4

    sub-int p4, v3, v2

    :goto_24
    invoke-static {v2, p6, p7}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->checkCodewordSkew(III)Z

    move-result v4

    if-nez v4, :cond_2b

    return-object v1

    :cond_2b
    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getDecodedValue([I)I

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/pdf417/PDF417Common;->getCodeword(I)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_37

    return-object v1

    :cond_37
    new-instance v1, Lcom/google/zxing/pdf417/decoder/Codeword;

    invoke-static {v4}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getCodewordBucketNumber(I)I

    move-result v6

    invoke-direct {v1, p4, v3, v6, v5}, Lcom/google/zxing/pdf417/decoder/Codeword;-><init>(IIII)V

    return-object v1

    :cond_41
    aget v4, v0, v3

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v3

    aget v5, v0, v5

    aput v5, v0, v3

    array-length v5, v0

    add-int/lit8 v5, v5, -0x1

    sub-int/2addr v5, v3

    aput v4, v0, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_1c
.end method

.method private static getBarcodeMetadata(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;
    .registers 7

    const/4 v0, 0x0

    if-eqz p0, :cond_38

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    move-object v2, v1

    if-nez v1, :cond_b

    goto :goto_38

    :cond_b
    nop

    if-eqz p1, :cond_37

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    move-object v3, v1

    if-nez v1, :cond_16

    goto :goto_37

    :cond_16
    nop

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v4

    if-eq v1, v4, :cond_36

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v4

    if-eq v1, v4, :cond_36

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v1

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v4

    if-eq v1, v4, :cond_36

    return-object v0

    :cond_36
    return-object v2

    :cond_37
    :goto_37
    return-object v2

    :cond_38
    :goto_38
    if-nez p1, :cond_3b

    goto :goto_3f

    :cond_3b
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->getBarcodeMetadata()Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v0

    :goto_3f
    return-object v0
.end method

.method private static getBitCountForCodeword(I)[I
    .registers 5

    const/16 v0, 0x8

    new-array v0, v0, [I

    const/4 v1, 0x0

    array-length v2, v0

    add-int/lit8 v2, v2, -0x1

    :goto_8
    and-int/lit8 v3, p0, 0x1

    if-eq v3, v1, :cond_14

    and-int/lit8 v1, p0, 0x1

    add-int/lit8 v2, v2, -0x1

    if-gez v2, :cond_14

    nop

    return-object v0

    :cond_14
    aget v3, v0, v2

    add-int/lit8 v3, v3, 0x1

    aput v3, v0, v2

    shr-int/lit8 p0, p0, 0x1

    goto :goto_8
.end method

.method private static getCodewordBucketNumber(I)I
    .registers 2

    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getBitCountForCodeword(I)[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getCodewordBucketNumber([I)I

    move-result v0

    return v0
.end method

.method private static getCodewordBucketNumber([I)I
    .registers 3

    const/4 v0, 0x0

    aget v0, p0, v0

    const/4 v1, 0x2

    aget v1, p0, v1

    sub-int/2addr v0, v1

    const/4 v1, 0x4

    aget v1, p0, v1

    add-int/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p0, v1

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x9

    rem-int/lit8 v0, v0, 0x9

    return v0
.end method

.method private static getMax([I)I
    .registers 5

    const/4 v0, -0x1

    array-length v1, p0

    const/4 v2, 0x0

    :goto_3
    if-lt v2, v1, :cond_6

    return v0

    :cond_6
    aget v3, p0, v2

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method private static getModuleBitCount(Lcom/google/zxing/common/BitMatrix;IIZII)[I
    .registers 13

    move v0, p4

    const/16 v1, 0x8

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p3, :cond_b

    move v4, v3

    goto :goto_c

    :cond_b
    const/4 v4, -0x1

    :goto_c
    move v5, p3

    :goto_d
    if-eqz p3, :cond_11

    if-lt v0, p2, :cond_15

    :cond_11
    if-nez p3, :cond_2f

    if-lt v0, p1, :cond_2f

    :cond_15
    array-length v6, v1

    if-lt v2, v6, :cond_19

    goto :goto_2f

    :cond_19
    invoke-virtual {p0, v0, p5}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v6

    if-ne v6, v5, :cond_26

    aget v6, v1, v2

    add-int/2addr v6, v3

    aput v6, v1, v2

    add-int/2addr v0, v4

    goto :goto_d

    :cond_26
    add-int/lit8 v2, v2, 0x1

    if-eqz v5, :cond_2c

    const/4 v6, 0x0

    goto :goto_2d

    :cond_2c
    move v6, v3

    :goto_2d
    move v5, v6

    goto :goto_d

    :cond_2f
    :goto_2f
    array-length v6, v1

    if-eq v2, v6, :cond_41

    if-eqz p3, :cond_36

    if-eq v0, p2, :cond_3a

    :cond_36
    if-nez p3, :cond_3f

    if-ne v0, p1, :cond_3f

    :cond_3a
    array-length v6, v1

    sub-int/2addr v6, v3

    if-ne v2, v6, :cond_3f

    goto :goto_41

    :cond_3f
    const/4 v3, 0x0

    return-object v3

    :cond_41
    :goto_41
    return-object v1
.end method

.method private static getNumberOfECCodeWords(I)I
    .registers 2

    const/4 v0, 0x2

    shl-int/2addr v0, p0

    return v0
.end method

.method private static getRowIndicatorColumn(Lcom/google/zxing/common/BitMatrix;Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/ResultPoint;ZII)Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;
    .registers 21

    move/from16 v8, p3

    new-instance v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    nop

    move-object/from16 v9, p1

    invoke-direct {v0, v9, v8}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;-><init>(Lcom/google/zxing/pdf417/decoder/BoundingBox;Z)V

    move-object v10, v0

    const/4 v0, 0x0

    move v11, v0

    :goto_d
    const/4 v0, 0x2

    if-lt v11, v0, :cond_11

    return-object v10

    :cond_11
    if-nez v11, :cond_15

    const/4 v0, 0x1

    goto :goto_16

    :cond_15
    const/4 v0, -0x1

    :goto_16
    move v12, v0

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getX()F

    move-result v0

    float-to-int v0, v0

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/ResultPoint;->getY()F

    move-result v1

    float-to-int v1, v1

    move v14, v0

    move v13, v1

    :goto_23
    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxY()I

    move-result v0

    if-gt v13, v0, :cond_54

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinY()I

    move-result v0

    if-ge v13, v0, :cond_30

    goto :goto_54

    :cond_30
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    nop

    move-object v0, p0

    move v3, v8

    move v4, v14

    move v5, v13

    move/from16 v6, p4

    move/from16 v7, p5

    invoke-static/range {v0 .. v7}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->detectCodeword(Lcom/google/zxing/common/BitMatrix;IIZIIII)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    if-eqz v0, :cond_52

    invoke-virtual {v10, v13, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->setCodeword(ILcom/google/zxing/pdf417/decoder/Codeword;)V

    if-eqz v8, :cond_4e

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v14

    goto :goto_52

    :cond_4e
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v14

    :cond_52
    :goto_52
    add-int/2addr v13, v12

    goto :goto_23

    :cond_54
    :goto_54
    add-int/lit8 v11, v11, 0x1

    goto :goto_d
.end method

.method private static getStartColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;IIZ)I
    .registers 12

    if-eqz p3, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, -0x1

    :goto_5
    const/4 v1, 0x0

    sub-int v2, p1, v0

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v2

    if-eqz v2, :cond_18

    sub-int v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodeword(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    :cond_18
    if-eqz v1, :cond_26

    if-eqz p3, :cond_21

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    goto :goto_25

    :cond_21
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    :goto_25
    return v2

    :cond_26
    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewordNearby(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    if-eqz v1, :cond_3c

    if-eqz p3, :cond_37

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    goto :goto_3b

    :cond_37
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    :goto_3b
    return v2

    :cond_3c
    sub-int v2, p1, v0

    invoke-static {p0, v2}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v2

    if-eqz v2, :cond_4e

    sub-int v2, p1, v0

    invoke-virtual {p0, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v2

    invoke-virtual {v2, p2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewordNearby(I)Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    :cond_4e
    if-eqz v1, :cond_5c

    if-eqz p3, :cond_57

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v2

    goto :goto_5b

    :cond_57
    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v2

    :goto_5b
    return v2

    :cond_5c
    const/4 v2, 0x0

    :goto_5d
    sub-int v3, p1, v0

    invoke-static {p0, v3}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z

    move-result v3

    if-nez v3, :cond_79

    if-eqz p3, :cond_70

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMinX()I

    move-result v3

    goto :goto_78

    :cond_70
    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->getMaxX()I

    move-result v3

    :goto_78
    return v3

    :cond_79
    sub-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_84
    if-lt v5, v4, :cond_89

    add-int/lit8 v2, v2, 0x1

    goto :goto_5d

    :cond_89
    aget-object v6, v3, v5

    if-eqz v6, :cond_a8

    if-eqz p3, :cond_94

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v3

    goto :goto_98

    :cond_94
    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v3

    :goto_98
    nop

    nop

    mul-int v4, v0, v2

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getEndX()I

    move-result v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getStartX()I

    move-result v7

    sub-int/2addr v5, v7

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    return v3

    :cond_a8
    add-int/lit8 v5, v5, 0x1

    goto :goto_84
.end method

.method private static isValidBarcodeColumn(Lcom/google/zxing/pdf417/decoder/DetectionResult;I)Z
    .registers 4

    if-ltz p1, :cond_b

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->getBarcodeColumnCount()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    if-gt p1, v0, :cond_b

    return v1

    :cond_b
    const/4 v0, 0x0

    return v0
.end method

.method private static merge(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/DetectionResult;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_6

    if-nez p1, :cond_6

    return-object v0

    :cond_6
    invoke-static {p0, p1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->getBarcodeMetadata(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    move-result-object v1

    if-nez v1, :cond_d

    return-object v0

    :cond_d
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    invoke-static {p1}, Lcom/google/zxing/pdf417/decoder/PDF417ScanningDecoder;->adjustBoundingBox(Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/zxing/pdf417/decoder/BoundingBox;->merge(Lcom/google/zxing/pdf417/decoder/BoundingBox;Lcom/google/zxing/pdf417/decoder/BoundingBox;)Lcom/google/zxing/pdf417/decoder/BoundingBox;

    move-result-object v0

    new-instance v2, Lcom/google/zxing/pdf417/decoder/DetectionResult;

    invoke-direct {v2, v1, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;-><init>(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;Lcom/google/zxing/pdf417/decoder/BoundingBox;)V

    return-object v2
.end method

.method public static toString([[Lcom/google/zxing/pdf417/decoder/BarcodeValue;)Ljava/lang/String;
    .registers 10

    new-instance v0, Ljava/util/Formatter;

    invoke-direct {v0}, Ljava/util/Formatter;-><init>()V

    const/4 v1, 0x0

    :goto_6
    array-length v2, p0

    if-lt v1, v2, :cond_11

    invoke-virtual {v0}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Ljava/util/Formatter;->close()V

    return-object v1

    :cond_11
    const-string v2, "Row %2d: "

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-virtual {v0, v2, v4}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/4 v2, 0x0

    :goto_21
    aget-object v4, p0, v1

    array-length v4, v4

    if-lt v2, v4, :cond_30

    const-string v2, "%n"

    new-array v3, v6, [Ljava/lang/Object;

    invoke-virtual {v0, v2, v3}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_30
    aget-object v4, p0, v1

    aget-object v4, v4, v2

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v5

    array-length v5, v5

    if-nez v5, :cond_42

    const-string v5, "        "

    const/4 v7, 0x0

    invoke-virtual {v0, v5, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    goto :goto_62

    :cond_42
    const-string v5, "%4d(%2d)"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v8

    aget v8, v8, v6

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v6

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getValue()[I

    move-result-object v8

    aget v8, v8, v6

    invoke-virtual {v4, v8}, Lcom/google/zxing/pdf417/decoder/BarcodeValue;->getConfidence(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {v0, v5, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    :goto_62
    add-int/lit8 v2, v2, 0x1

    goto :goto_21
.end method

.method private static verifyCodewordCount([II)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    array-length v0, p0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_1f

    const/4 v0, 0x0

    aget v1, p0, v0

    array-length v2, p0

    if-gt v1, v2, :cond_1a

    if-nez v1, :cond_19

    array-length v2, p0

    if-ge p1, v2, :cond_14

    array-length v2, p0

    sub-int/2addr v2, p1

    aput v2, p0, v0

    goto :goto_19

    :cond_14
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :cond_19
    :goto_19
    return-void

    :cond_1a
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :cond_1f
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method
