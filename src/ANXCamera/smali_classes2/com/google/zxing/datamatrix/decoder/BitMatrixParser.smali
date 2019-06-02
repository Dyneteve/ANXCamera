.class final Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;
.super Ljava/lang/Object;
.source "BitMatrixParser.java"


# instance fields
.field private final mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

.field private final readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

.field private final version:Lcom/google/zxing/datamatrix/decoder/Version;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/BitMatrix;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    const/16 v1, 0x8

    if-lt v0, v1, :cond_33

    const/16 v1, 0x90

    if-gt v0, v1, :cond_33

    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_33

    invoke-static {p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readVersion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {p0, p1}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->extractDataRegion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v1

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    iget-object v2, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v2}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v3}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    invoke-direct {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    iput-object v1, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    return-void

    :cond_33
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1
.end method

.method private static readVersion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/datamatrix/decoder/Version;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v1

    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/Version;->getVersionForDimensions(II)Lcom/google/zxing/datamatrix/decoder/Version;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method extractDataRegion(Lcom/google/zxing/common/BitMatrix;)Lcom/google/zxing/common/BitMatrix;
    .registers 23

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version;->getSymbolSizeRows()I

    move-result v1

    iget-object v2, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v2}, Lcom/google/zxing/datamatrix/decoder/Version;->getSymbolSizeColumns()I

    move-result v2

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v3

    if-ne v3, v1, :cond_7a

    iget-object v3, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v3}, Lcom/google/zxing/datamatrix/decoder/Version;->getDataRegionSizeRows()I

    move-result v3

    iget-object v4, v0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/Version;->getDataRegionSizeColumns()I

    move-result v4

    div-int v5, v1, v3

    div-int v6, v2, v4

    mul-int v7, v5, v3

    mul-int v8, v6, v4

    new-instance v9, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v9, v8, v7}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    const/4 v10, 0x0

    :goto_2e
    if-lt v10, v5, :cond_31

    return-object v9

    :cond_31
    mul-int v11, v10, v3

    const/4 v12, 0x0

    :goto_34
    if-lt v12, v6, :cond_39

    add-int/lit8 v10, v10, 0x1

    goto :goto_2e

    :cond_39
    mul-int v13, v12, v4

    const/4 v14, 0x0

    :goto_3c
    if-lt v14, v3, :cond_41

    add-int/lit8 v12, v12, 0x1

    goto :goto_34

    :cond_41
    add-int/lit8 v15, v3, 0x2

    mul-int/2addr v15, v10

    add-int/lit8 v15, v15, 0x1

    add-int/2addr v15, v14

    add-int v0, v11, v14

    const/16 v16, 0x0

    move/from16 v17, v1

    move/from16 v1, v16

    :goto_4f
    if-lt v1, v4, :cond_58

    add-int/lit8 v14, v14, 0x1

    move/from16 v1, v17

    move-object/from16 v0, p0

    goto :goto_3c

    :cond_58
    add-int/lit8 v16, v4, 0x2

    mul-int v16, v16, v12

    add-int/lit8 v16, v16, 0x1

    move/from16 v18, v2

    add-int v2, v16, v1

    move/from16 v19, v3

    move-object/from16 v3, p1

    invoke-virtual {v3, v2, v15}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v16

    if-eqz v16, :cond_73

    move/from16 v20, v2

    add-int v2, v13, v1

    invoke-virtual {v9, v2, v0}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_73
    add-int/lit8 v1, v1, 0x1

    move/from16 v2, v18

    move/from16 v3, v19

    goto :goto_4f

    :cond_7a
    move-object/from16 v3, p1

    move/from16 v17, v1

    move/from16 v18, v2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dimension of bitMarix must match the version size"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method getVersion()Lcom/google/zxing/datamatrix/decoder/Version;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    return-object v0
.end method

.method readCodewords()[B
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v0}, Lcom/google/zxing/datamatrix/decoder/Version;->getTotalCodewords()I

    move-result v0

    new-array v0, v0, [B

    const/4 v1, 0x0

    const/4 v2, 0x4

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v4}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v5}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :cond_1b
    if-ne v2, v4, :cond_34

    if-nez v3, :cond_34

    if-nez v6, :cond_34

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner1(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    add-int/lit8 v2, v2, -0x2

    add-int/lit8 v3, v3, 0x2

    const/4 v1, 0x1

    nop

    move v6, v1

    :goto_31
    move v1, v10

    goto/16 :goto_d1

    :cond_34
    add-int/lit8 v10, v4, -0x2

    if-ne v2, v10, :cond_51

    if-nez v3, :cond_51

    and-int/lit8 v10, v5, 0x3

    if-eqz v10, :cond_51

    if-nez v7, :cond_51

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner2(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    add-int/lit8 v2, v2, -0x2

    add-int/lit8 v3, v3, 0x2

    const/4 v1, 0x1

    nop

    move v7, v1

    goto :goto_31

    :cond_51
    add-int/lit8 v10, v4, 0x4

    if-ne v2, v10, :cond_6f

    const/4 v10, 0x2

    if-ne v3, v10, :cond_6f

    and-int/lit8 v10, v5, 0x7

    if-nez v10, :cond_6f

    if-nez v8, :cond_6f

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner3(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    add-int/lit8 v2, v2, -0x2

    add-int/lit8 v3, v3, 0x2

    const/4 v1, 0x1

    nop

    move v8, v1

    goto :goto_31

    :cond_6f
    add-int/lit8 v10, v4, -0x2

    if-ne v2, v10, :cond_8d

    if-nez v3, :cond_8d

    and-int/lit8 v10, v5, 0x7

    const/4 v11, 0x4

    if-ne v10, v11, :cond_8d

    if-nez v9, :cond_8d

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readCorner4(II)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    add-int/lit8 v2, v2, -0x2

    add-int/lit8 v3, v3, 0x2

    const/4 v1, 0x1

    nop

    move v9, v1

    goto :goto_31

    :cond_8d
    if-ge v2, v4, :cond_a3

    if-ltz v3, :cond_a3

    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10, v3, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-nez v10, :cond_a3

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readUtah(IIII)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    move v1, v10

    :cond_a3
    add-int/lit8 v2, v2, -0x2

    add-int/lit8 v3, v3, 0x2

    if-ltz v2, :cond_ab

    if-lt v3, v5, :cond_8d

    :cond_ab
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x3

    :cond_af
    if-ltz v2, :cond_c5

    if-ge v3, v5, :cond_c5

    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v10, v3, v2}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    if-nez v10, :cond_c5

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {p0, v2, v3, v4, v5}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readUtah(IIII)I

    move-result v11

    int-to-byte v11, v11

    aput-byte v11, v0, v1

    move v1, v10

    :cond_c5
    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, v3, -0x2

    if-ge v2, v4, :cond_cd

    if-gez v3, :cond_af

    :cond_cd
    add-int/lit8 v2, v2, 0x3

    add-int/lit8 v3, v3, 0x1

    :goto_d1
    if-lt v2, v4, :cond_1b

    if-lt v3, v5, :cond_1b

    iget-object v10, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->version:Lcom/google/zxing/datamatrix/decoder/Version;

    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version;->getTotalCodewords()I

    move-result v10

    if-ne v1, v10, :cond_de

    return-object v0

    :cond_de
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v10

    throw v10
.end method

.method readCorner1(II)I
    .registers 8

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    or-int/lit8 v0, v0, 0x1

    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v1, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    or-int/lit8 v0, v0, 0x1

    :cond_18
    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x2

    invoke-virtual {p0, v3, v4, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_24

    or-int/lit8 v0, v0, 0x1

    :cond_24
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2f

    or-int/lit8 v0, v0, 0x1

    :cond_2f
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_3a

    or-int/lit8 v0, v0, 0x1

    :cond_3a
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_45

    or-int/lit8 v0, v0, 0x1

    :cond_45
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v4, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_50

    or-int/lit8 v0, v0, 0x1

    :cond_50
    shl-int/2addr v0, v1

    const/4 v1, 0x3

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    or-int/lit8 v0, v0, 0x1

    :cond_5c
    return v0
.end method

.method readCorner2(II)I
    .registers 7

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    or-int/lit8 v0, v0, 0x1

    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    or-int/lit8 v0, v0, 0x1

    :cond_18
    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_23

    or-int/lit8 v0, v0, 0x1

    :cond_23
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x4

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2e

    or-int/lit8 v0, v0, 0x1

    :cond_2e
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x3

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_39

    or-int/lit8 v0, v0, 0x1

    :cond_39
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_44

    or-int/lit8 v0, v0, 0x1

    :cond_44
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_4f

    or-int/lit8 v0, v0, 0x1

    :cond_4f
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5a

    or-int/lit8 v0, v0, 0x1

    :cond_5a
    return v0
.end method

.method readCorner3(II)I
    .registers 8

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    or-int/lit8 v0, v0, 0x1

    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x1

    add-int/lit8 v4, p2, -0x1

    invoke-virtual {p0, v3, v4, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_1a

    or-int/lit8 v0, v0, 0x1

    :cond_1a
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x3

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_25

    or-int/lit8 v0, v0, 0x1

    :cond_25
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_30

    or-int/lit8 v0, v0, 0x1

    :cond_30
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_3b

    or-int/lit8 v0, v0, 0x1

    :cond_3b
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x3

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_46

    or-int/lit8 v0, v0, 0x1

    :cond_46
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_51

    or-int/lit8 v0, v0, 0x1

    :cond_51
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    or-int/lit8 v0, v0, 0x1

    :cond_5c
    return v0
.end method

.method readCorner4(II)I
    .registers 7

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x3

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_c

    or-int/lit8 v0, v0, 0x1

    :cond_c
    const/4 v1, 0x1

    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_18

    or-int/lit8 v0, v0, 0x1

    :cond_18
    shl-int/2addr v0, v1

    add-int/lit8 v3, p1, -0x1

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_23

    or-int/lit8 v0, v0, 0x1

    :cond_23
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x2

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v3

    if-eqz v3, :cond_2e

    or-int/lit8 v0, v0, 0x1

    :cond_2e
    shl-int/2addr v0, v1

    add-int/lit8 v3, p2, -0x1

    invoke-virtual {p0, v2, v3, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_39

    or-int/lit8 v0, v0, 0x1

    :cond_39
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_44

    or-int/lit8 v0, v0, 0x1

    :cond_44
    shl-int/2addr v0, v1

    add-int/lit8 v2, p2, -0x1

    const/4 v3, 0x2

    invoke-virtual {p0, v3, v2, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v2

    if-eqz v2, :cond_50

    or-int/lit8 v0, v0, 0x1

    :cond_50
    shl-int/2addr v0, v1

    add-int/lit8 v1, p2, -0x1

    const/4 v2, 0x3

    invoke-virtual {p0, v2, v1, p1, p2}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5c

    or-int/lit8 v0, v0, 0x1

    :cond_5c
    return v0
.end method

.method readModule(IIII)Z
    .registers 6

    if-gez p1, :cond_a

    add-int/2addr p1, p3

    add-int/lit8 v0, p3, 0x4

    and-int/lit8 v0, v0, 0x7

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p2, v0

    :cond_a
    if-gez p2, :cond_14

    add-int/2addr p2, p4

    add-int/lit8 v0, p4, 0x4

    and-int/lit8 v0, v0, 0x7

    rsub-int/lit8 v0, v0, 0x4

    add-int/2addr p1, v0

    :cond_14
    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readMappingMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p2, p1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->mappingBitMatrix:Lcom/google/zxing/common/BitMatrix;

    invoke-virtual {v0, p2, p1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v0

    return v0
.end method

.method readUtah(IIII)I
    .registers 8

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x2

    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_d

    or-int/lit8 v0, v0, 0x1

    :cond_d
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p1, -0x2

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_1b

    or-int/lit8 v0, v0, 0x1

    :cond_1b
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p1, -0x1

    add-int/lit8 v2, p2, -0x2

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_29

    or-int/lit8 v0, v0, 0x1

    :cond_29
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p1, -0x1

    add-int/lit8 v2, p2, -0x1

    invoke-virtual {p0, v1, v2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_37

    or-int/lit8 v0, v0, 0x1

    :cond_37
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p1, -0x1

    invoke-virtual {p0, v1, p2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_43

    or-int/lit8 v0, v0, 0x1

    :cond_43
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p2, -0x2

    invoke-virtual {p0, p1, v1, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_4f

    or-int/lit8 v0, v0, 0x1

    :cond_4f
    shl-int/lit8 v0, v0, 0x1

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {p0, p1, v1, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_5b

    or-int/lit8 v0, v0, 0x1

    :cond_5b
    shl-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/zxing/datamatrix/decoder/BitMatrixParser;->readModule(IIII)Z

    move-result v1

    if-eqz v1, :cond_65

    or-int/lit8 v0, v0, 0x1

    :cond_65
    return v0
.end method
