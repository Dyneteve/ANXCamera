.class final Lcom/google/zxing/pdf417/decoder/DetectionResult;
.super Ljava/lang/Object;
.source "DetectionResult.java"


# static fields
.field private static final ADJUST_ROW_NUMBER_SKIP:I = 0x2


# instance fields
.field private final barcodeColumnCount:I

.field private final barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

.field private boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

.field private final detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;


# direct methods
.method constructor <init>(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getColumnCount()I

    move-result v0

    iput v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    iput-object p2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iput-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    return-void
.end method

.method private adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V
    .registers 4

    if-eqz p1, :cond_a

    move-object v0, p1

    check-cast v0, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0, v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultRowIndicatorColumn;->adjustCompleteIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;)I

    :cond_a
    return-void
.end method

.method private static adjustRowNumber(Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/Codeword;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getBucket()I

    move-result v1

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->getBucket()I

    move-result v2

    if-ne v1, v2, :cond_1d

    invoke-virtual {p1}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    const/4 v0, 0x1

    return v0

    :cond_1d
    return v0
.end method

.method private static adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I
    .registers 4

    if-nez p2, :cond_3

    return p1

    :cond_3
    invoke-virtual {p2}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v0

    if-nez v0, :cond_16

    invoke-virtual {p2, p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->isValidRowNumber(I)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-virtual {p2, p0}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    const/4 p1, 0x0

    goto :goto_16

    :cond_14
    add-int/lit8 p1, p1, 0x1

    :cond_16
    :goto_16
    return p1
.end method

.method private adjustRowNumbers()I
    .registers 6

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersByRow()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    return v1

    :cond_8
    const/4 v1, 0x1

    :goto_9
    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    if-lt v1, v2, :cond_10

    return v0

    :cond_10
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v2

    const/4 v3, 0x0

    :goto_19
    array-length v4, v2

    if-lt v3, v4, :cond_1f

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_1f
    aget-object v4, v2, v3

    if-nez v4, :cond_24

    goto :goto_2f

    :cond_24
    aget-object v4, v2, v3

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v4

    if-nez v4, :cond_2f

    invoke-direct {p0, v1, v3, v2}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbers(II[Lcom/google/zxing/pdf417/decoder/Codeword;)V

    :cond_2f
    :goto_2f
    add-int/lit8 v3, v3, 0x1

    goto :goto_19
.end method

.method private adjustRowNumbers(II[Lcom/google/zxing/pdf417/decoder/Codeword;)V
    .registers 13

    aget-object v0, p3, p2

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v2, p1, -0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    move-object v2, v1

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v4, p1, 0x1

    aget-object v3, v3, v4

    if-eqz v3, :cond_1f

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    add-int/lit8 v4, p1, 0x1

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v2

    :cond_1f
    const/16 v3, 0xe

    new-array v3, v3, [Lcom/google/zxing/pdf417/decoder/Codeword;

    aget-object v4, v1, p2

    const/4 v5, 0x2

    aput-object v4, v3, v5

    const/4 v4, 0x3

    aget-object v6, v2, p2

    aput-object v6, v3, v4

    const/4 v4, 0x0

    if-lez p2, :cond_44

    add-int/lit8 v6, p2, -0x1

    aget-object v6, p3, v6

    aput-object v6, v3, v4

    const/4 v6, 0x4

    add-int/lit8 v7, p2, -0x1

    aget-object v7, v1, v7

    aput-object v7, v3, v6

    const/4 v6, 0x5

    add-int/lit8 v7, p2, -0x1

    aget-object v7, v2, v7

    aput-object v7, v3, v6

    :cond_44
    const/4 v6, 0x1

    if-le p2, v6, :cond_5f

    const/16 v7, 0x8

    add-int/lit8 v8, p2, -0x2

    aget-object v8, p3, v8

    aput-object v8, v3, v7

    const/16 v7, 0xa

    add-int/lit8 v8, p2, -0x2

    aget-object v8, v1, v8

    aput-object v8, v3, v7

    const/16 v7, 0xb

    add-int/lit8 v8, p2, -0x2

    aget-object v8, v2, v8

    aput-object v8, v3, v7

    :cond_5f
    array-length v7, p3

    sub-int/2addr v7, v6

    if-ge p2, v7, :cond_77

    add-int/lit8 v7, p2, 0x1

    aget-object v7, p3, v7

    aput-object v7, v3, v6

    const/4 v6, 0x6

    add-int/lit8 v7, p2, 0x1

    aget-object v7, v1, v7

    aput-object v7, v3, v6

    const/4 v6, 0x7

    add-int/lit8 v7, p2, 0x1

    aget-object v7, v2, v7

    aput-object v7, v3, v6

    :cond_77
    array-length v6, p3

    sub-int/2addr v6, v5

    if-ge p2, v6, :cond_93

    const/16 v5, 0x9

    add-int/lit8 v6, p2, 0x2

    aget-object v6, p3, v6

    aput-object v6, v3, v5

    const/16 v5, 0xc

    add-int/lit8 v6, p2, 0x2

    aget-object v6, v1, v6

    aput-object v6, v3, v5

    const/16 v5, 0xd

    add-int/lit8 v6, p2, 0x2

    aget-object v6, v2, v6

    aput-object v6, v3, v5

    :cond_93
    array-length v5, v3

    :goto_94
    if-lt v4, v5, :cond_97

    return-void

    :cond_97
    aget-object v6, v3, v4

    invoke-static {v0, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumber(Lcom/google/zxing/pdf417/decoder/Codeword;Lcom/google/zxing/pdf417/decoder/Codeword;)Z

    move-result v7

    if-eqz v7, :cond_a0

    return-void

    :cond_a0
    add-int/lit8 v4, v4, 0x1

    goto :goto_94
.end method

.method private adjustRowNumbersByRow()I
    .registers 3

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromBothRI()V

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromLRI()I

    move-result v0

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbersFromRRI()I

    move-result v1

    add-int/2addr v1, v0

    return v1
.end method

.method private adjustRowNumbersFromBothRI()V
    .registers 8

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-eqz v0, :cond_74

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v0, v0, v2

    if-nez v0, :cond_12

    goto :goto_74

    :cond_12
    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    const/4 v2, 0x0

    :goto_27
    array-length v3, v0

    if-lt v2, v3, :cond_2b

    return-void

    :cond_2b
    aget-object v3, v0, v2

    if-eqz v3, :cond_71

    aget-object v3, v1, v2

    if-eqz v3, :cond_71

    aget-object v3, v0, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    aget-object v4, v1, v2

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v4

    if-ne v3, v4, :cond_71

    const/4 v3, 0x1

    :goto_42
    iget v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    if-le v3, v4, :cond_47

    goto :goto_71

    :cond_47
    iget-object v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v4

    aget-object v4, v4, v2

    if-nez v4, :cond_54

    goto :goto_6e

    :cond_54
    aget-object v5, v0, v2

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/google/zxing/pdf417/decoder/Codeword;->setRowNumber(I)V

    invoke-virtual {v4}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v5

    if-nez v5, :cond_6e

    iget-object v5, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v5, v5, v3

    invoke-virtual {v5}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v6, v5, v2

    :cond_6e
    :goto_6e
    add-int/lit8 v3, v3, 0x1

    goto :goto_42

    :cond_71
    :goto_71
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    :cond_74
    :goto_74
    return-void
.end method

.method private adjustRowNumbersFromLRI()I
    .registers 9

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-nez v0, :cond_8

    return v1

    :cond_8
    const/4 v0, 0x0

    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v1, v2, v1

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    const/4 v2, 0x0

    :goto_12
    array-length v3, v1

    if-lt v2, v3, :cond_16

    return v0

    :cond_16
    aget-object v3, v1, v2

    if-nez v3, :cond_1b

    goto :goto_48

    :cond_1b
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_23
    iget v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v6, v6, 0x1

    if-ge v5, v6, :cond_48

    const/4 v6, 0x2

    if-lt v4, v6, :cond_2d

    goto :goto_48

    :cond_2d
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v2

    if-eqz v6, :cond_45

    invoke-static {v3, v4, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I

    move-result v4

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v7

    if-nez v7, :cond_45

    add-int/lit8 v0, v0, 0x1

    :cond_45
    add-int/lit8 v5, v5, 0x1

    goto :goto_23

    :cond_48
    :goto_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method private adjustRowNumbersFromRRI()I
    .registers 9

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    if-nez v0, :cond_c

    const/4 v0, 0x0

    return v0

    :cond_c
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v1

    const/4 v2, 0x0

    :goto_1a
    array-length v3, v1

    if-lt v2, v3, :cond_1e

    return v0

    :cond_1e
    aget-object v3, v1, v2

    if-nez v3, :cond_23

    goto :goto_4f

    :cond_23
    aget-object v3, v1, v2

    invoke-virtual {v3}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v3

    const/4 v4, 0x0

    iget v5, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v5, v5, 0x1

    :goto_2e
    if-lez v5, :cond_4f

    const/4 v6, 0x2

    if-lt v4, v6, :cond_34

    goto :goto_4f

    :cond_34
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v2

    if-eqz v6, :cond_4c

    invoke-static {v3, v4, v6}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumberIfValid(IILcom/google/zxing/pdf417/decoder/Codeword;)I

    move-result v4

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->hasValidRowNumber()Z

    move-result v7

    if-nez v7, :cond_4c

    add-int/lit8 v0, v0, 0x1

    :cond_4c
    add-int/lit8 v5, v5, -0x1

    goto :goto_2e

    :cond_4f
    :goto_4f
    add-int/lit8 v2, v2, 0x1

    goto :goto_1a
.end method


# virtual methods
.method getBarcodeColumnCount()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    return v0
.end method

.method getBarcodeECLevel()I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getErrorCorrectionLevel()I

    move-result v0

    return v0
.end method

.method getBarcodeRowCount()I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeMetadata:Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;

    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/BarcodeMetadata;->getRowCount()I

    move-result v0

    return v0
.end method

.method getBoundingBox()Lcom/google/zxing/pdf417/decoder/BoundingBox;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    return-object v0
.end method

.method getDetectionResultColumn(I)Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .registers 3

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v0, v0, p1

    return-object v0
.end method

.method getDetectionResultColumns()[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustIndicatorColumnRowNumbers(Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V

    const/16 v0, 0x3a0

    :cond_15
    move v1, v0

    invoke-direct {p0}, Lcom/google/zxing/pdf417/decoder/DetectionResult;->adjustRowNumbers()I

    move-result v0

    if-lez v0, :cond_1e

    if-lt v0, v1, :cond_15

    :cond_1e
    iget-object v2, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    return-object v2
.end method

.method public setBoundingBox(Lcom/google/zxing/pdf417/decoder/BoundingBox;)V
    .registers 2

    iput-object p1, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->boundingBox:Lcom/google/zxing/pdf417/decoder/BoundingBox;

    return-void
.end method

.method setDetectionResultColumn(ILcom/google/zxing/pdf417/decoder/DetectionResultColumn;)V
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aput-object p2, v0, p1

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 11

    iget-object v0, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/4 v2, 0x1

    if-nez v0, :cond_f

    iget-object v3, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    iget v4, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    add-int/2addr v4, v2

    aget-object v0, v3, v4

    :cond_f
    new-instance v3, Ljava/util/Formatter;

    invoke-direct {v3}, Ljava/util/Formatter;-><init>()V

    const/4 v4, 0x0

    :goto_15
    invoke-virtual {v0}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v5

    array-length v5, v5

    if-lt v4, v5, :cond_24

    invoke-virtual {v3}, Ljava/util/Formatter;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3}, Ljava/util/Formatter;->close()V

    return-object v1

    :cond_24
    const-string v5, "CW %3d:"

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {v3, v5, v6}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    const/4 v5, 0x0

    :goto_32
    iget v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->barcodeColumnCount:I

    const/4 v7, 0x2

    add-int/2addr v6, v7

    if-lt v5, v6, :cond_42

    const-string v5, "%n"

    new-array v6, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v5, v6}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_42
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    if-nez v6, :cond_50

    const-string v6, "    |   "

    new-array v7, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v6, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    goto :goto_7f

    :cond_50
    iget-object v6, p0, Lcom/google/zxing/pdf417/decoder/DetectionResult;->detectionResultColumns:[Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;

    aget-object v6, v6, v5

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/DetectionResultColumn;->getCodewords()[Lcom/google/zxing/pdf417/decoder/Codeword;

    move-result-object v6

    aget-object v6, v6, v4

    if-nez v6, :cond_64

    const-string v7, "    |   "

    new-array v8, v1, [Ljava/lang/Object;

    invoke-virtual {v3, v7, v8}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    goto :goto_7f

    :cond_64
    const-string v8, " %3d|%3d"

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getRowNumber()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v1

    invoke-virtual {v6}, Lcom/google/zxing/pdf417/decoder/Codeword;->getValue()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v2

    invoke-virtual {v3, v8, v7}, Ljava/util/Formatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/util/Formatter;

    :goto_7f
    add-int/lit8 v5, v5, 0x1

    goto :goto_32
.end method
