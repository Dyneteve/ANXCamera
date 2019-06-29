.class public final Lcom/google/zxing/pdf417/PDF417Writer;
.super Ljava/lang/Object;
.source "PDF417Writer.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# static fields
.field static final WHITE_SPACE:I = 0x1e


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bitMatrixFromEncoder(Lcom/google/zxing/pdf417/encoder/PDF417;Ljava/lang/String;III)Lcom/google/zxing/common/BitMatrix;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/google/zxing/pdf417/encoder/PDF417;->generateBarcodeLogic(Ljava/lang/String;I)V

    const/4 v1, 0x2

    const/4 v2, 0x4

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/encoder/PDF417;->getBarcodeMatrix()Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;

    move-result-object v3

    mul-int v4, v2, v1

    invoke-virtual {v3, v1, v4}, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->getScaledMatrix(II)[[B

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-le p3, p2, :cond_17

    move v7, v5

    goto :goto_18

    :cond_17
    move v7, v6

    :goto_18
    aget-object v8, v3, v6

    array-length v8, v8

    array-length v9, v3

    if-ge v8, v9, :cond_20

    move v8, v5

    goto :goto_21

    :cond_20
    move v8, v6

    :goto_21
    xor-int/2addr v7, v8

    if-eqz v7, :cond_29

    invoke-static {v3}, Lcom/google/zxing/pdf417/PDF417Writer;->rotateArray([[B)[[B

    move-result-object v3

    const/4 v4, 0x1

    :cond_29
    aget-object v6, v3, v6

    array-length v6, v6

    div-int v6, p2, v6

    array-length v7, v3

    div-int v7, p3, v7

    if-ge v6, v7, :cond_35

    move v8, v6

    goto :goto_36

    :cond_35
    move v8, v7

    :goto_36
    if-le v8, v5, :cond_51

    invoke-virtual {p0}, Lcom/google/zxing/pdf417/encoder/PDF417;->getBarcodeMatrix()Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;

    move-result-object v5

    mul-int v9, v8, v1

    mul-int v10, v8, v2

    mul-int/2addr v10, v1

    invoke-virtual {v5, v9, v10}, Lcom/google/zxing/pdf417/encoder/BarcodeMatrix;->getScaledMatrix(II)[[B

    move-result-object v5

    nop

    if-eqz v4, :cond_4c

    invoke-static {v5}, Lcom/google/zxing/pdf417/PDF417Writer;->rotateArray([[B)[[B

    move-result-object v5

    :cond_4c
    invoke-static {v5, p4}, Lcom/google/zxing/pdf417/PDF417Writer;->bitMatrixFrombitArray([[BI)Lcom/google/zxing/common/BitMatrix;

    move-result-object v9

    return-object v9

    :cond_51
    invoke-static {v3, p4}, Lcom/google/zxing/pdf417/PDF417Writer;->bitMatrixFrombitArray([[BI)Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    return-object v5
.end method

.method private static bitMatrixFrombitArray([[BI)Lcom/google/zxing/common/BitMatrix;
    .registers 9

    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    array-length v2, v2

    const/4 v3, 0x2

    mul-int v4, v3, p1

    add-int/2addr v2, v4

    array-length v4, p0

    mul-int/2addr v3, p1

    add-int/2addr v4, v3

    invoke-direct {v0, v2, v4}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->clear()V

    const/4 v2, 0x0

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    sub-int/2addr v3, p1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    :goto_1b
    array-length v5, p0

    if-lt v2, v5, :cond_1f

    return-object v0

    :cond_1f
    const/4 v5, 0x0

    :goto_20
    aget-object v6, p0, v1

    array-length v6, v6

    if-lt v5, v6, :cond_2a

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, -0x1

    goto :goto_1b

    :cond_2a
    aget-object v6, p0, v2

    aget-byte v6, v6, v5

    if-ne v6, v4, :cond_35

    add-int v6, v5, p1

    invoke-virtual {v0, v6, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_20
.end method

.method private static rotateArray([[B)[[B
    .registers 8

    const/4 v0, 0x0

    aget-object v1, p0, v0

    array-length v1, v1

    array-length v2, p0

    filled-new-array {v1, v2}, [I

    move-result-object v1

    const-class v2, B

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[B

    const/4 v2, 0x0

    :goto_12
    array-length v3, p0

    if-lt v2, v3, :cond_16

    return-object v1

    :cond_16
    array-length v3, p0

    sub-int/2addr v3, v2

    add-int/lit8 v3, v3, -0x1

    const/4 v4, 0x0

    :goto_1b
    aget-object v5, p0, v0

    array-length v5, v5

    if-lt v4, v5, :cond_23

    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    :cond_23
    aget-object v5, v1, v4

    aget-object v6, p0, v2

    aget-byte v6, v6, v4

    aput-byte v6, v5, v3

    add-int/lit8 v4, v4, 0x1

    goto :goto_1b
.end method


# virtual methods
.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/pdf417/PDF417Writer;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->PDF_417:Lcom/google/zxing/BarcodeFormat;

    if-ne p2, v0, :cond_8a

    new-instance v0, Lcom/google/zxing/pdf417/encoder/PDF417;

    invoke-direct {v0}, Lcom/google/zxing/pdf417/encoder/PDF417;-><init>()V

    const/16 v1, 0x1e

    if-eqz p5, :cond_85

    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_COMPACT:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_24

    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_COMPACT:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v0, v2}, Lcom/google/zxing/pdf417/encoder/PDF417;->setCompact(Z)V

    :cond_24
    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_COMPACTION:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_37

    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_COMPACTION:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/pdf417/encoder/Compaction;

    invoke-virtual {v0, v2}, Lcom/google/zxing/pdf417/encoder/PDF417;->setCompaction(Lcom/google/zxing/pdf417/encoder/Compaction;)V

    :cond_37
    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_DIMENSIONS:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5a

    sget-object v2, Lcom/google/zxing/EncodeHintType;->PDF417_DIMENSIONS:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/pdf417/encoder/Dimensions;

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/encoder/Dimensions;->getMaxCols()I

    move-result v3

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/encoder/Dimensions;->getMinCols()I

    move-result v4

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/encoder/Dimensions;->getMaxRows()I

    move-result v5

    invoke-virtual {v2}, Lcom/google/zxing/pdf417/encoder/Dimensions;->getMinRows()I

    move-result v6

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/google/zxing/pdf417/encoder/PDF417;->setDimensions(IIII)V

    :cond_5a
    sget-object v2, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6e

    sget-object v2, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v1

    :cond_6e
    sget-object v2, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_85

    sget-object v2, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/zxing/pdf417/encoder/PDF417;->setEncoding(Ljava/nio/charset/Charset;)V

    :cond_85
    invoke-static {v0, p1, p3, p4, v1}, Lcom/google/zxing/pdf417/PDF417Writer;->bitMatrixFromEncoder(Lcom/google/zxing/pdf417/encoder/PDF417;Ljava/lang/String;III)Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    return-object v2

    :cond_8a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Can only encode PDF_417, but got "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
