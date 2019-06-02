.class final Lcom/google/zxing/qrcode/decoder/DataBlock;
.super Ljava/lang/Object;
.source "DataBlock.java"


# instance fields
.field private final codewords:[B

.field private final numDataCodewords:I


# direct methods
.method private constructor <init>(I[B)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)[Lcom/google/zxing/qrcode/decoder/DataBlock;
    .registers 19

    move-object/from16 v0, p0

    array-length v1, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v2

    if-ne v1, v2, :cond_ba

    invoke-virtual/range {p1 .. p2}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v2

    move v2, v5

    :goto_16
    if-lt v2, v4, :cond_af

    new-array v7, v6, [Lcom/google/zxing/qrcode/decoder/DataBlock;

    const/4 v2, 0x0

    array-length v8, v3

    move v9, v5

    :goto_1d
    if-lt v9, v8, :cond_8b

    aget-object v4, v7, v5

    iget-object v4, v4, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v4, v4

    array-length v8, v7

    add-int/lit8 v8, v8, -0x1

    :goto_27
    if-gez v8, :cond_2a

    goto :goto_32

    :cond_2a
    aget-object v9, v7, v8

    iget-object v9, v9, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v9, v9

    if-ne v9, v4, :cond_88

    nop

    :goto_32
    add-int/lit8 v10, v8, 0x1

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v8

    sub-int v11, v4, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v12, v9

    :goto_3d
    if-lt v12, v11, :cond_74

    move v9, v10

    :goto_40
    if-lt v9, v2, :cond_66

    aget-object v5, v7, v5

    iget-object v5, v5, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    array-length v12, v5

    move v5, v11

    move v13, v5

    :goto_49
    if-lt v13, v12, :cond_4c

    return-object v7

    :cond_4c
    const/4 v5, 0x0

    :goto_4d
    if-lt v5, v2, :cond_52

    add-int/lit8 v13, v13, 0x1

    goto :goto_49

    :cond_52
    if-ge v5, v10, :cond_56

    move v9, v13

    goto :goto_58

    :cond_56
    add-int/lit8 v9, v13, 0x1

    :goto_58
    aget-object v14, v7, v5

    iget-object v14, v14, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v15, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v14, v9

    add-int/lit8 v5, v5, 0x1

    move v8, v15

    goto :goto_4d

    :cond_66
    aget-object v12, v7, v9

    iget-object v12, v12, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v13, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v12, v11

    add-int/lit8 v9, v9, 0x1

    move v8, v13

    goto :goto_40

    :cond_74
    const/4 v9, 0x0

    :goto_75
    if-lt v9, v2, :cond_7a

    add-int/lit8 v12, v12, 0x1

    goto :goto_3d

    :cond_7a
    aget-object v13, v7, v9

    iget-object v13, v13, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    add-int/lit8 v14, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v13, v12

    add-int/lit8 v9, v9, 0x1

    move v8, v14

    goto :goto_75

    :cond_88
    add-int/lit8 v8, v8, -0x1

    goto :goto_27

    :cond_8b
    aget-object v10, v3, v9

    const/4 v4, 0x0

    :goto_8e
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v11

    if-lt v4, v11, :cond_97

    add-int/lit8 v9, v9, 0x1

    goto :goto_1d

    :cond_97
    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v11

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v12

    add-int/2addr v12, v11

    add-int/lit8 v13, v2, 0x1

    new-instance v14, Lcom/google/zxing/qrcode/decoder/DataBlock;

    new-array v15, v12, [B

    invoke-direct {v14, v11, v15}, Lcom/google/zxing/qrcode/decoder/DataBlock;-><init>(I[B)V

    aput-object v14, v7, v2

    add-int/lit8 v4, v4, 0x1

    move v2, v13

    goto :goto_8e

    :cond_af
    aget-object v7, v3, v2

    invoke-virtual {v7}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v8

    add-int/2addr v6, v8

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_16

    :cond_ba
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v1
.end method


# virtual methods
.method getCodewords()[B
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
