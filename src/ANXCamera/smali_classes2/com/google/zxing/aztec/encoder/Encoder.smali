.class public final Lcom/google/zxing/aztec/encoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field public static final DEFAULT_AZTEC_LAYERS:I = 0x0

.field public static final DEFAULT_EC_PERCENT:I = 0x21

.field private static final MAX_NB_BITS:I = 0x20

.field private static final MAX_NB_BITS_COMPACT:I = 0x4

.field private static final WORD_SIZE:[I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x21

    new-array v0, v0, [I

    fill-array-data v0, :array_c

    nop

    nop

    sput-object v0, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    return-void

    :array_c
    .array-data 4
        0x4
        0x6
        0x6
        0x8
        0x8
        0x8
        0x8
        0x8
        0x8
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xa
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
        0xc
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static bitsToWords(Lcom/google/zxing/common/BitArray;II)[I
    .registers 10

    new-array v0, p2, [I

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    div-int/2addr v2, p1

    :goto_8
    if-lt v1, v2, :cond_b

    return-object v0

    :cond_b
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_d
    if-lt v4, p1, :cond_14

    aput v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_14
    mul-int v5, v1, p1

    add-int/2addr v5, v4

    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_24

    sub-int v5, p1, v4

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    shl-int v5, v6, v5

    goto :goto_25

    :cond_24
    const/4 v5, 0x0

    :goto_25
    or-int/2addr v3, v5

    add-int/lit8 v4, v4, 0x1

    goto :goto_d
.end method

.method private static drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V
    .registers 6

    const/4 v0, 0x0

    :goto_1
    if-lt v0, p2, :cond_36

    sub-int v0, p1, p2

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    sub-int v0, p1, p2

    add-int/lit8 v0, v0, 0x1

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    sub-int v0, p1, p2

    sub-int v1, p1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int v0, p1, p2

    sub-int v1, p1, p2

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int v0, p1, p2

    sub-int v1, p1, p2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int v0, p1, p2

    add-int v1, p1, p2

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    return-void

    :cond_36
    sub-int v1, p1, v0

    :goto_38
    add-int v2, p1, v0

    if-le v1, v2, :cond_3f

    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    :cond_3f
    sub-int v2, p1, v0

    invoke-virtual {p0, v1, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int v2, p1, v0

    invoke-virtual {p0, v1, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    sub-int v2, p1, v0

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int v2, p1, v0

    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_38
.end method

.method private static drawModeMessage(Lcom/google/zxing/common/BitMatrix;ZILcom/google/zxing/common/BitArray;)V
    .registers 8

    div-int/lit8 v0, p2, 0x2

    if-eqz p1, :cond_41

    const/4 v1, 0x0

    :goto_5
    const/4 v2, 0x7

    if-lt v1, v2, :cond_9

    goto :goto_46

    :cond_9
    add-int/lit8 v2, v0, -0x3

    add-int/2addr v2, v1

    invoke-virtual {p3, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_17

    add-int/lit8 v3, v0, -0x5

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_17
    add-int/lit8 v3, v1, 0x7

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_24

    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_24
    rsub-int/lit8 v3, v1, 0x14

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_31

    add-int/lit8 v3, v0, 0x5

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_31
    rsub-int/lit8 v3, v1, 0x1b

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_3e

    add-int/lit8 v3, v0, -0x5

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_3e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_41
    const/4 v1, 0x0

    :goto_42
    const/16 v2, 0xa

    if-lt v1, v2, :cond_47

    :goto_46
    return-void

    :cond_47
    add-int/lit8 v2, v0, -0x5

    add-int/2addr v2, v1

    div-int/lit8 v3, v1, 0x5

    add-int/2addr v2, v3

    invoke-virtual {p3, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_58

    add-int/lit8 v3, v0, -0x7

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_58
    add-int/lit8 v3, v1, 0xa

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_65

    add-int/lit8 v3, v0, 0x7

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_65
    rsub-int/lit8 v3, v1, 0x1d

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_72

    add-int/lit8 v3, v0, 0x7

    invoke-virtual {p0, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_72
    rsub-int/lit8 v3, v1, 0x27

    invoke-virtual {p3, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_7f

    add-int/lit8 v3, v0, -0x7

    invoke-virtual {p0, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_7f
    add-int/lit8 v1, v1, 0x1

    goto :goto_42
.end method

.method public static encode([B)Lcom/google/zxing/aztec/encoder/AztecCode;
    .registers 3

    const/16 v0, 0x21

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->encode([BII)Lcom/google/zxing/aztec/encoder/AztecCode;

    move-result-object v0

    return-object v0
.end method

.method public static encode([BII)Lcom/google/zxing/aztec/encoder/AztecCode;
    .registers 31

    new-instance v1, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;

    move-object/from16 v2, p0

    invoke-direct {v1, v2}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;-><init>([B)V

    invoke-virtual {v1}, Lcom/google/zxing/aztec/encoder/HighLevelEncoder;->encode()Lcom/google/zxing/common/BitArray;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    mul-int v3, v3, p1

    div-int/lit8 v3, v3, 0x64

    const/16 v5, 0xb

    add-int/2addr v3, v5

    invoke-virtual {v1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    add-int/2addr v6, v3

    const/16 v7, 0x20

    const/4 v8, 0x0

    const/4 v10, 0x1

    if-eqz p2, :cond_7a

    if-gez p2, :cond_25

    move v11, v10

    goto :goto_26

    :cond_25
    move v11, v8

    :goto_26
    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v12

    if-eqz v11, :cond_2e

    const/4 v7, 0x4

    nop

    :cond_2e
    if-gt v12, v7, :cond_66

    invoke-static {v12, v11}, Lcom/google/zxing/aztec/encoder/Encoder;->totalBitsInLayer(IZ)I

    move-result v7

    sget-object v8, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v8, v8, v12

    rem-int v13, v7, v8

    sub-int v13, v7, v13

    invoke-static {v1, v8}, Lcom/google/zxing/aztec/encoder/Encoder;->stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;

    move-result-object v14

    invoke-virtual {v14}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v15

    add-int/2addr v15, v3

    if-gt v15, v13, :cond_5e

    if-eqz v11, :cond_5a

    invoke-virtual {v14}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v15

    mul-int/lit8 v9, v8, 0x40

    if-gt v15, v9, :cond_52

    goto :goto_5a

    :cond_52
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v9, "Data to large for user specified layer"

    invoke-direct {v5, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_5a
    :goto_5a
    move v15, v7

    move-object v7, v14

    goto/16 :goto_d0

    :cond_5e
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v9, "Data to large for user specified layer"

    invoke-direct {v5, v9}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_66
    new-instance v5, Ljava/lang/IllegalArgumentException;

    new-array v7, v10, [Ljava/lang/Object;

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const-string v8, "Illegal value %s for layers"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_7a
    const/4 v9, 0x0

    const/4 v11, 0x0

    move v12, v9

    move v9, v8

    :goto_7e
    if-gt v9, v7, :cond_28a

    const/4 v13, 0x3

    if-gt v9, v13, :cond_85

    move v13, v10

    goto :goto_86

    :cond_85
    move v13, v8

    :goto_86
    if-eqz v13, :cond_8b

    add-int/lit8 v14, v9, 0x1

    goto :goto_8c

    :cond_8b
    move v14, v9

    :goto_8c
    invoke-static {v14, v13}, Lcom/google/zxing/aztec/encoder/Encoder;->totalBitsInLayer(IZ)I

    move-result v15

    if-le v6, v15, :cond_9e

    nop

    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    move v6, v10

    :goto_9a
    const/16 v16, 0x4

    goto/16 :goto_27a

    :cond_9e
    sget-object v17, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v7, v17, v14

    if-eq v12, v7, :cond_ad

    sget-object v7, Lcom/google/zxing/aztec/encoder/Encoder;->WORD_SIZE:[I

    aget v7, v7, v14

    invoke-static {v1, v7}, Lcom/google/zxing/aztec/encoder/Encoder;->stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;

    move-result-object v11

    move v12, v7

    :cond_ad
    rem-int v7, v15, v12

    sub-int v7, v15, v7

    if-eqz v13, :cond_c4

    invoke-virtual {v11}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    mul-int/lit8 v10, v12, 0x40

    if-le v8, v10, :cond_c4

    nop

    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    const/4 v6, 0x1

    goto :goto_9a

    :cond_c4
    invoke-virtual {v11}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    add-int/2addr v8, v3

    if-gt v8, v7, :cond_271

    nop

    move-object v7, v11

    move v8, v12

    move v11, v13

    move v12, v14

    :goto_d0
    move v10, v11

    move v9, v12

    move v11, v15

    invoke-static {v7, v11, v8}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v12

    invoke-virtual {v7}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v13

    div-int/2addr v13, v8

    invoke-static {v10, v9, v13}, Lcom/google/zxing/aztec/encoder/Encoder;->generateModeMessage(ZII)Lcom/google/zxing/common/BitArray;

    move-result-object v14

    if-eqz v10, :cond_e6

    :goto_e2
    mul-int/lit8 v15, v9, 0x4

    add-int/2addr v5, v15

    goto :goto_e9

    :cond_e6
    const/16 v5, 0xe

    goto :goto_e2

    :goto_e9
    new-array v15, v5, [I

    if-eqz v10, :cond_100

    move/from16 v17, v5

    const/16 v18, 0x0

    move/from16 v0, v18

    :goto_f3
    move-object/from16 v22, v1

    array-length v1, v15

    if-lt v0, v1, :cond_f9

    goto :goto_11c

    :cond_f9
    aput v0, v15, v0

    add-int/lit8 v0, v0, 0x1

    move-object/from16 v1, v22

    goto :goto_f3

    :cond_100
    move-object/from16 v22, v1

    add-int/lit8 v0, v5, 0x1

    div-int/lit8 v1, v5, 0x2

    const/16 v17, 0x1

    add-int/lit8 v1, v1, -0x1

    div-int/lit8 v1, v1, 0xf

    const/16 v17, 0x2

    mul-int v1, v1, v17

    add-int v17, v0, v1

    div-int/lit8 v0, v5, 0x2

    div-int/lit8 v1, v17, 0x2

    const/16 v18, 0x0

    move/from16 v2, v18

    :goto_11a
    if-lt v2, v0, :cond_24c

    :goto_11c
    move/from16 v0, v17

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    const/4 v2, 0x0

    const/16 v17, 0x0

    move/from16 v18, v17

    :goto_128
    if-lt v2, v9, :cond_192

    invoke-static {v1, v10, v0, v14}, Lcom/google/zxing/aztec/encoder/Encoder;->drawModeMessage(Lcom/google/zxing/common/BitMatrix;ZILcom/google/zxing/common/BitArray;)V

    if-eqz v10, :cond_138

    div-int/lit8 v2, v0, 0x2

    move/from16 v23, v3

    const/4 v3, 0x5

    invoke-static {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/Encoder;->drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V

    goto :goto_14d

    :cond_138
    move/from16 v23, v3

    div-int/lit8 v2, v0, 0x2

    const/4 v3, 0x7

    invoke-static {v1, v2, v3}, Lcom/google/zxing/aztec/encoder/Encoder;->drawBullsEye(Lcom/google/zxing/common/BitMatrix;II)V

    const/4 v2, 0x0

    const/4 v3, 0x0

    move/from16 v17, v3

    move v3, v2

    :goto_145
    div-int/lit8 v2, v5, 0x2

    const/16 v16, 0x1

    add-int/lit8 v2, v2, -0x1

    if-lt v3, v2, :cond_162

    :goto_14d
    new-instance v2, Lcom/google/zxing/aztec/encoder/AztecCode;

    invoke-direct {v2}, Lcom/google/zxing/aztec/encoder/AztecCode;-><init>()V

    invoke-virtual {v2, v10}, Lcom/google/zxing/aztec/encoder/AztecCode;->setCompact(Z)V

    invoke-virtual {v2, v0}, Lcom/google/zxing/aztec/encoder/AztecCode;->setSize(I)V

    invoke-virtual {v2, v9}, Lcom/google/zxing/aztec/encoder/AztecCode;->setLayers(I)V

    invoke-virtual {v2, v13}, Lcom/google/zxing/aztec/encoder/AztecCode;->setCodeWords(I)V

    invoke-virtual {v2, v1}, Lcom/google/zxing/aztec/encoder/AztecCode;->setMatrix(Lcom/google/zxing/common/BitMatrix;)V

    return-object v2

    :cond_162
    div-int/lit8 v2, v0, 0x2

    const/16 v16, 0x1

    and-int/lit8 v2, v2, 0x1

    :goto_168
    if-lt v2, v0, :cond_16f

    add-int/lit8 v3, v3, 0xf

    add-int/lit8 v17, v17, 0x10

    goto :goto_145

    :cond_16f
    div-int/lit8 v16, v0, 0x2

    move/from16 v24, v3

    sub-int v3, v16, v17

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    div-int/lit8 v3, v0, 0x2

    add-int v3, v3, v17

    invoke-virtual {v1, v3, v2}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    div-int/lit8 v3, v0, 0x2

    sub-int v3, v3, v17

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    div-int/lit8 v3, v0, 0x2

    add-int v3, v3, v17

    invoke-virtual {v1, v2, v3}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    add-int/lit8 v2, v2, 0x2

    move/from16 v3, v24

    goto :goto_168

    :cond_192
    move/from16 v23, v3

    if-eqz v10, :cond_19f

    sub-int v3, v9, v2

    const/16 v16, 0x4

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0x9

    goto :goto_1a7

    :cond_19f
    const/16 v16, 0x4

    sub-int v3, v9, v2

    mul-int/lit8 v3, v3, 0x4

    add-int/lit8 v3, v3, 0xc

    :goto_1a7
    const/16 v17, 0x0

    move/from16 v4, v17

    :goto_1ab
    if-lt v4, v3, :cond_1b7

    mul-int/lit8 v4, v3, 0x8

    add-int v18, v18, v4

    add-int/lit8 v2, v2, 0x1

    move/from16 v3, v23

    goto/16 :goto_128

    :cond_1b7
    mul-int/lit8 v19, v4, 0x2

    const/16 v17, 0x0

    move/from16 v25, v0

    move/from16 v0, v17

    :goto_1bf
    move/from16 v26, v6

    const/4 v6, 0x2

    if-lt v0, v6, :cond_1cb

    add-int/lit8 v4, v4, 0x1

    move/from16 v0, v25

    move/from16 v6, v26

    goto :goto_1ab

    :cond_1cb
    add-int v17, v18, v19

    add-int v6, v17, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_1e6

    mul-int/lit8 v6, v2, 0x2

    add-int/2addr v6, v0

    aget v6, v15, v6

    mul-int/lit8 v17, v2, 0x2

    add-int v17, v17, v4

    move-object/from16 v27, v7

    aget v7, v15, v17

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    goto :goto_1e8

    :cond_1e6
    move-object/from16 v27, v7

    :goto_1e8
    mul-int/lit8 v6, v3, 0x2

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_206

    mul-int/lit8 v6, v2, 0x2

    add-int/2addr v6, v4

    aget v6, v15, v6

    add-int/lit8 v7, v5, -0x1

    mul-int/lit8 v17, v2, 0x2

    sub-int v7, v7, v17

    sub-int/2addr v7, v0

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_206
    mul-int/lit8 v6, v3, 0x4

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_227

    add-int/lit8 v6, v5, -0x1

    mul-int/lit8 v7, v2, 0x2

    sub-int/2addr v6, v7

    sub-int/2addr v6, v0

    aget v6, v15, v6

    add-int/lit8 v7, v5, -0x1

    mul-int/lit8 v17, v2, 0x2

    sub-int v7, v7, v17

    sub-int/2addr v7, v4

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_227
    mul-int/lit8 v6, v3, 0x6

    add-int v6, v18, v6

    add-int v6, v6, v19

    add-int/2addr v6, v0

    invoke-virtual {v12, v6}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v6

    if-eqz v6, :cond_244

    add-int/lit8 v6, v5, -0x1

    mul-int/lit8 v7, v2, 0x2

    sub-int/2addr v6, v7

    sub-int/2addr v6, v4

    aget v6, v15, v6

    mul-int/lit8 v7, v2, 0x2

    add-int/2addr v7, v0

    aget v7, v15, v7

    invoke-virtual {v1, v6, v7}, Lcom/google/zxing/common/BitMatrix;->set(II)V

    :cond_244
    add-int/lit8 v0, v0, 0x1

    move/from16 v6, v26

    move-object/from16 v7, v27

    goto/16 :goto_1bf

    :cond_24c
    move/from16 v23, v3

    move/from16 v26, v6

    move-object/from16 v27, v7

    const/16 v16, 0x4

    div-int/lit8 v3, v2, 0xf

    add-int/2addr v3, v2

    sub-int v4, v0, v2

    const/4 v6, 0x1

    sub-int/2addr v4, v6

    sub-int v7, v1, v3

    sub-int/2addr v7, v6

    aput v7, v15, v4

    add-int v4, v0, v2

    add-int v7, v1, v3

    add-int/2addr v7, v6

    aput v7, v15, v4

    add-int/lit8 v2, v2, 0x1

    move/from16 v3, v23

    move/from16 v6, v26

    move-object/from16 v7, v27

    goto/16 :goto_11a

    :cond_271
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    const/4 v6, 0x1

    const/16 v16, 0x4

    :goto_27a
    add-int/lit8 v9, v9, 0x1

    move v10, v6

    move-object/from16 v1, v22

    move/from16 v3, v23

    move/from16 v6, v26

    move-object/from16 v2, p0

    const/16 v7, 0x20

    const/4 v8, 0x0

    goto/16 :goto_7e

    :cond_28a
    move-object/from16 v22, v1

    move/from16 v23, v3

    move/from16 v26, v6

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Data too large for an Aztec code"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;
    .registers 12

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    div-int/2addr v0, p2

    new-instance v1, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;

    invoke-static {p2}, Lcom/google/zxing/aztec/encoder/Encoder;->getGF(I)Lcom/google/zxing/common/reedsolomon/GenericGF;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    div-int v2, p1, p2

    invoke-static {p0, p2, v2}, Lcom/google/zxing/aztec/encoder/Encoder;->bitsToWords(Lcom/google/zxing/common/BitArray;II)[I

    move-result-object v3

    sub-int v4, v2, v0

    invoke-virtual {v1, v3, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->encode([II)V

    rem-int v4, p1, p2

    new-instance v5, Lcom/google/zxing/common/BitArray;

    invoke-direct {v5}, Lcom/google/zxing/common/BitArray;-><init>()V

    const/4 v6, 0x0

    invoke-virtual {v5, v6, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    array-length v7, v3

    :goto_25
    if-lt v6, v7, :cond_28

    return-object v5

    :cond_28
    aget v8, v3, v6

    invoke-virtual {v5, v8, p2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v6, v6, 0x1

    goto :goto_25
.end method

.method static generateModeMessage(ZII)Lcom/google/zxing/common/BitArray;
    .registers 7

    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    const/4 v1, 0x4

    if-eqz p0, :cond_1b

    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x2

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v2, p2, -0x1

    const/4 v3, 0x6

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    const/16 v2, 0x1c

    invoke-static {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    goto :goto_2e

    :cond_1b
    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x5

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v2, p2, -0x1

    const/16 v3, 0xb

    invoke-virtual {v0, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    const/16 v2, 0x28

    invoke-static {v0, v2, v1}, Lcom/google/zxing/aztec/encoder/Encoder;->generateCheckWords(Lcom/google/zxing/common/BitArray;II)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    :goto_2e
    return-object v0
.end method

.method private static getGF(I)Lcom/google/zxing/common/reedsolomon/GenericGF;
    .registers 2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_20

    const/4 v0, 0x6

    if-eq p0, v0, :cond_1d

    const/16 v0, 0x8

    if-eq p0, v0, :cond_1a

    const/16 v0, 0xa

    if-eq p0, v0, :cond_17

    const/16 v0, 0xc

    if-eq p0, v0, :cond_14

    const/4 v0, 0x0

    return-object v0

    :cond_14
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    :cond_17
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    :cond_1a
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    :cond_1d
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0

    :cond_20
    sget-object v0, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_PARAM:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-object v0
.end method

.method static stuffBits(Lcom/google/zxing/common/BitArray;I)Lcom/google/zxing/common/BitArray;
    .registers 10

    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    const/4 v2, 0x1

    shl-int v3, v2, p1

    add-int/lit8 v3, v3, -0x2

    const/4 v4, 0x0

    :goto_f
    if-lt v4, v1, :cond_12

    return-object v0

    :cond_12
    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_14
    if-lt v6, p1, :cond_33

    and-int v6, v5, v3

    if-ne v6, v3, :cond_22

    and-int v6, v5, v3

    invoke-virtual {v0, v6, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v4, v4, -0x1

    goto :goto_31

    :cond_22
    and-int v6, v5, v3

    if-nez v6, :cond_2e

    or-int/lit8 v6, v5, 0x1

    invoke-virtual {v0, v6, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v4, v4, -0x1

    goto :goto_31

    :cond_2e
    invoke-virtual {v0, v5, p1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    :goto_31
    add-int/2addr v4, p1

    goto :goto_f

    :cond_33
    add-int v7, v4, v6

    if-ge v7, v1, :cond_3f

    add-int v7, v4, v6

    invoke-virtual {p0, v7}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_45

    :cond_3f
    add-int/lit8 v7, p1, -0x1

    sub-int/2addr v7, v6

    shl-int v7, v2, v7

    or-int/2addr v5, v7

    :cond_45
    add-int/lit8 v6, v6, 0x1

    goto :goto_14
.end method

.method private static totalBitsInLayer(IZ)I
    .registers 4

    if-eqz p1, :cond_5

    const/16 v0, 0x58

    goto :goto_7

    :cond_5
    const/16 v0, 0x70

    :goto_7
    const/16 v1, 0x10

    mul-int/2addr v1, p0

    add-int/2addr v0, v1

    mul-int/2addr v0, p0

    return v0
.end method
