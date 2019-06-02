.class final Lcom/google/zxing/datamatrix/decoder/DataBlock;
.super Ljava/lang/Object;
.source "DataBlock.java"


# instance fields
.field private final codewords:[B

.field private final numDataCodewords:I


# direct methods
.method private constructor <init>(I[B)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    iput-object p2, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    return-void
.end method

.method static getDataBlocks([BLcom/google/zxing/datamatrix/decoder/Version;)[Lcom/google/zxing/datamatrix/decoder/DataBlock;
    .registers 20

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getECBlocks()Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/datamatrix/decoder/Version$ECB;

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    move v6, v2

    move v2, v5

    :goto_f
    if-lt v2, v4, :cond_c5

    new-array v7, v6, [Lcom/google/zxing/datamatrix/decoder/DataBlock;

    const/4 v2, 0x0

    array-length v8, v3

    move v9, v5

    :goto_16
    if-lt v9, v8, :cond_a0

    aget-object v4, v7, v5

    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    array-length v4, v4

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v8

    sub-int v10, v4, v8

    add-int/lit8 v11, v10, -0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v12, v9

    :goto_28
    if-lt v12, v11, :cond_88

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/datamatrix/decoder/Version;->getVersionNumber()I

    move-result v9

    const/16 v12, 0x18

    if-ne v9, v12, :cond_34

    const/4 v9, 0x1

    goto :goto_35

    :cond_34
    move v9, v5

    :goto_35
    if-eqz v9, :cond_3a

    const/16 v12, 0x8

    goto :goto_3b

    :cond_3a
    move v12, v2

    :goto_3b
    move v13, v12

    const/4 v12, 0x0

    :goto_3d
    if-lt v12, v13, :cond_74

    aget-object v5, v7, v5

    iget-object v5, v5, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    array-length v14, v5

    move v5, v10

    move v15, v5

    :goto_46
    if-lt v15, v14, :cond_52

    array-length v5, v0

    if-ne v8, v5, :cond_4c

    return-object v7

    :cond_4c
    new-instance v5, Ljava/lang/IllegalArgumentException;

    invoke-direct {v5}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v5

    :cond_52
    const/4 v5, 0x0

    :goto_53
    if-lt v5, v2, :cond_58

    add-int/lit8 v15, v15, 0x1

    goto :goto_46

    :cond_58
    if-eqz v9, :cond_60

    const/4 v12, 0x7

    if-le v5, v12, :cond_60

    add-int/lit8 v12, v15, -0x1

    goto :goto_61

    :cond_60
    move v12, v15

    :goto_61
    move/from16 v16, v4

    aget-object v4, v7, v5

    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v17, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v4, v12

    add-int/lit8 v5, v5, 0x1

    move/from16 v4, v16

    move/from16 v8, v17

    goto :goto_53

    :cond_74
    move/from16 v16, v4

    aget-object v4, v7, v12

    iget-object v4, v4, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v14, v10, -0x1

    add-int/lit8 v15, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v4, v14

    add-int/lit8 v12, v12, 0x1

    move v8, v15

    move/from16 v4, v16

    goto :goto_3d

    :cond_88
    move/from16 v16, v4

    const/4 v4, 0x0

    :goto_8b
    if-lt v4, v2, :cond_92

    add-int/lit8 v12, v12, 0x1

    move/from16 v4, v16

    goto :goto_28

    :cond_92
    aget-object v9, v7, v4

    iget-object v9, v9, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    add-int/lit8 v13, v8, 0x1

    aget-byte v8, v0, v8

    aput-byte v8, v9, v12

    add-int/lit8 v4, v4, 0x1

    move v8, v13

    goto :goto_8b

    :cond_a0
    aget-object v10, v3, v9

    const/4 v4, 0x0

    :goto_a3
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v11

    if-lt v4, v11, :cond_ad

    add-int/lit8 v9, v9, 0x1

    goto/16 :goto_16

    :cond_ad
    invoke-virtual {v10}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getDataCodewords()I

    move-result v11

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/Version$ECBlocks;->getECCodewords()I

    move-result v12

    add-int/2addr v12, v11

    add-int/lit8 v13, v2, 0x1

    new-instance v14, Lcom/google/zxing/datamatrix/decoder/DataBlock;

    new-array v15, v12, [B

    invoke-direct {v14, v11, v15}, Lcom/google/zxing/datamatrix/decoder/DataBlock;-><init>(I[B)V

    aput-object v14, v7, v2

    add-int/lit8 v4, v4, 0x1

    move v2, v13

    goto :goto_a3

    :cond_c5
    aget-object v7, v3, v2

    invoke-virtual {v7}, Lcom/google/zxing/datamatrix/decoder/Version$ECB;->getCount()I

    move-result v8

    add-int/2addr v6, v8

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_f
.end method


# virtual methods
.method getCodewords()[B
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->codewords:[B

    return-object v0
.end method

.method getNumDataCodewords()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/datamatrix/decoder/DataBlock;->numDataCodewords:I

    return v0
.end method
