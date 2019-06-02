.class final Lcom/google/zxing/qrcode/decoder/BitMatrixParser;
.super Ljava/lang/Object;
.source "BitMatrixParser.java"


# instance fields
.field private final bitMatrix:Lcom/google/zxing/common/BitMatrix;

.field private mirror:Z

.field private parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

.field private parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    const/16 v1, 0x15

    if-lt v0, v1, :cond_13

    and-int/lit8 v1, v0, 0x3

    const/4 v2, 0x1

    if-ne v1, v2, :cond_13

    iput-object p1, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    return-void

    :cond_13
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method private copyBit(III)I
    .registers 6

    iget-boolean v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->mirror:Z

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    goto :goto_11

    :cond_b
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p1, p2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    :goto_11
    if-eqz v0, :cond_18

    shl-int/lit8 v1, p3, 0x1

    or-int/lit8 v1, v1, 0x1

    goto :goto_1a

    :cond_18
    shl-int/lit8 v1, p3, 0x1

    :goto_1a
    return v1
.end method


# virtual methods
.method mirror()V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    if-lt v0, v1, :cond_a

    return-void

    :cond_a
    add-int/lit8 v1, v0, 0x1

    :goto_c
    iget-object v2, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    if-lt v1, v2, :cond_17

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    iget-object v2, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v0, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, v1, v0}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eq v2, v3, :cond_2f

    iget-object v2, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v1, v0}, Lcom/google/zxing/common/BitMatrix;->flip(II)V

    iget-object v2, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2, v0, v1}, Lcom/google/zxing/common/BitMatrix;->flip(II)V

    :cond_2f
    add-int/lit8 v1, v1, 0x1

    goto :goto_c
.end method

.method readCodewords()[B
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->readVersion()Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v2

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->getDataMask()B

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/decoder/DataMask;->forReference(I)Lcom/google/zxing/qrcode/decoder/DataMask;

    move-result-object v3

    iget-object v4, v0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    iget-object v5, v0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3, v5, v4}, Lcom/google/zxing/qrcode/decoder/DataMask;->unmaskBitMatrix(Lcom/google/zxing/common/BitMatrix;I)V

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version;->buildFunctionPattern()Lcom/google/zxing/common/BitMatrix;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v7

    new-array v7, v7, [B

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    add-int/lit8 v11, v4, -0x1

    :goto_2d
    if-gtz v11, :cond_3b

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v11

    if-ne v8, v11, :cond_36

    return-object v7

    :cond_36
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v11

    throw v11

    :cond_3b
    const/4 v12, 0x6

    if-ne v11, v12, :cond_40

    add-int/lit8 v11, v11, -0x1

    :cond_40
    const/4 v12, 0x0

    :goto_41
    if-lt v12, v4, :cond_48

    xor-int/lit8 v6, v6, 0x1

    add-int/lit8 v11, v11, -0x2

    goto :goto_2d

    :cond_48
    if-eqz v6, :cond_4e

    add-int/lit8 v13, v4, -0x1

    sub-int/2addr v13, v12

    goto :goto_4f

    :cond_4e
    move v13, v12

    :goto_4f
    const/4 v14, 0x0

    :goto_50
    const/4 v15, 0x2

    if-lt v14, v15, :cond_56

    add-int/lit8 v12, v12, 0x1

    goto :goto_41

    :cond_56
    sub-int v15, v11, v14

    invoke-virtual {v5, v15, v13}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v15

    if-nez v15, :cond_7b

    add-int/lit8 v10, v10, 0x1

    shl-int/lit8 v9, v9, 0x1

    iget-object v15, v0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    sub-int v0, v11, v14

    invoke-virtual {v15, v0, v13}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    if-eqz v0, :cond_6e

    or-int/lit8 v9, v9, 0x1

    :cond_6e
    const/16 v0, 0x8

    if-ne v10, v0, :cond_7b

    add-int/lit8 v0, v8, 0x1

    int-to-byte v15, v9

    aput-byte v15, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v10, v8

    move v8, v0

    :cond_7b
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    goto :goto_50
.end method

.method readFormatInformation()Lcom/google/zxing/qrcode/decoder/FormatInformation;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    return-object v0

    :cond_7
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_9
    const/4 v2, 0x6

    const/16 v3, 0x8

    if-lt v1, v2, :cond_56

    const/4 v1, 0x7

    invoke-direct {p0, v1, v3, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v0

    invoke-direct {p0, v3, v3, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v0

    invoke-direct {p0, v3, v1, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v0

    const/4 v1, 0x5

    :goto_1c
    if-gez v1, :cond_4f

    iget-object v1, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v2

    const/4 v1, 0x0

    add-int/lit8 v4, v2, -0x7

    add-int/lit8 v5, v2, -0x1

    :goto_29
    if-ge v5, v4, :cond_48

    add-int/lit8 v5, v2, -0x8

    :goto_2d
    if-lt v5, v2, :cond_41

    invoke-static {v0, v1}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->decodeFormatInformation(II)Lcom/google/zxing/qrcode/decoder/FormatInformation;

    move-result-object v3

    iput-object v3, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    iget-object v3, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    if-eqz v3, :cond_3c

    iget-object v3, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    return-object v3

    :cond_3c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v3

    throw v3

    :cond_41
    invoke-direct {p0, v5, v3, v1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v1

    add-int/lit8 v5, v5, 0x1

    goto :goto_2d

    :cond_48
    invoke-direct {p0, v3, v5, v1}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v1

    add-int/lit8 v5, v5, -0x1

    goto :goto_29

    :cond_4f
    invoke-direct {p0, v3, v1, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v0

    add-int/lit8 v1, v1, -0x1

    goto :goto_1c

    :cond_56
    invoke-direct {p0, v1, v3, v0}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method readVersion()Lcom/google/zxing/qrcode/decoder/Version;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;

    return-object v0

    :cond_7
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    add-int/lit8 v1, v0, -0x11

    div-int/lit8 v1, v1, 0x4

    const/4 v2, 0x6

    if-gt v1, v2, :cond_19

    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v2

    return-object v2

    :cond_19
    const/4 v2, 0x0

    add-int/lit8 v3, v0, -0xb

    const/4 v4, 0x5

    :goto_1d
    if-gez v4, :cond_55

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/Version;->decodeVersionInformation(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v5

    if-eqz v5, :cond_2e

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v4

    if-ne v4, v0, :cond_2e

    iput-object v5, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;

    return-object v5

    :cond_2e
    const/4 v2, 0x0

    const/4 v4, 0x5

    move v6, v4

    :goto_31
    if-gez v6, :cond_47

    invoke-static {v2}, Lcom/google/zxing/qrcode/decoder/Version;->decodeVersionInformation(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v4

    if-eqz v4, :cond_42

    invoke-virtual {v4}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v5

    if-ne v5, v0, :cond_42

    iput-object v4, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;

    return-object v4

    :cond_42
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    :cond_47
    add-int/lit8 v4, v0, -0x9

    :goto_49
    if-ge v4, v3, :cond_4e

    add-int/lit8 v6, v6, -0x1

    goto :goto_31

    :cond_4e
    invoke-direct {p0, v6, v4, v2}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v2

    add-int/lit8 v4, v4, -0x1

    goto :goto_49

    :cond_55
    add-int/lit8 v5, v0, -0x9

    :goto_57
    if-ge v5, v3, :cond_5c

    add-int/lit8 v4, v4, -0x1

    goto :goto_1d

    :cond_5c
    invoke-direct {p0, v5, v4, v2}, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->copyBit(III)I

    move-result v2

    add-int/lit8 v5, v5, -0x1

    goto :goto_57
.end method

.method remask()V
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->getDataMask()B

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/DataMask;->forReference(I)Lcom/google/zxing/qrcode/decoder/DataMask;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->bitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, v2, v1}, Lcom/google/zxing/qrcode/decoder/DataMask;->unmaskBitMatrix(Lcom/google/zxing/common/BitMatrix;I)V

    return-void
.end method

.method setMirror(Z)V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedVersion:Lcom/google/zxing/qrcode/decoder/Version;

    iput-object v0, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->parsedFormatInfo:Lcom/google/zxing/qrcode/decoder/FormatInformation;

    iput-boolean p1, p0, Lcom/google/zxing/qrcode/decoder/BitMatrixParser;->mirror:Z

    return-void
.end method
