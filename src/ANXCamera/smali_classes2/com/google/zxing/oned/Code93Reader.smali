.class public final Lcom/google/zxing/oned/Code93Reader;
.super Lcom/google/zxing/oned/OneDReader;
.source "Code93Reader.java"


# static fields
.field private static final ALPHABET:[C

.field private static final ALPHABET_STRING:Ljava/lang/String; = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

.field private static final ASTERISK_ENCODING:I

.field private static final CHARACTER_ENCODINGS:[I


# instance fields
.field private final counters:[I

.field private final decodeRowResult:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    const/16 v0, 0x30

    new-array v0, v0, [I

    fill-array-data v0, :array_20

    nop

    nop

    nop

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    sget-object v0, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    const/16 v1, 0x2f

    aget v0, v0, v1

    sput v0, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    return-void

    :array_20
    .array-data 4
        0x114
        0x148
        0x144
        0x142
        0x128
        0x124
        0x122
        0x150
        0x112
        0x10a
        0x1a8
        0x1a4
        0x1a2
        0x194
        0x192
        0x18a
        0x168
        0x164
        0x162
        0x134
        0x11a
        0x158
        0x14c
        0x146
        0x12c
        0x116
        0x1b4
        0x1b2
        0x1ac
        0x1a6
        0x196
        0x19a
        0x16c
        0x166
        0x136
        0x13a
        0x12e
        0x1d4
        0x1d2
        0x1ca
        0x16e
        0x176
        0x1ae
        0x126
        0x1da
        0x1d6
        0x132
        0x15e
    .end array-data
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/Code93Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    const/4 v0, 0x6

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    return-void
.end method

.method private static checkChecksums(Ljava/lang/CharSequence;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    add-int/lit8 v1, v0, -0x2

    const/16 v2, 0x14

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    add-int/lit8 v1, v0, -0x1

    const/16 v2, 0xf

    invoke-static {p0, v1, v2}, Lcom/google/zxing/oned/Code93Reader;->checkOneChecksum(Ljava/lang/CharSequence;II)V

    return-void
.end method

.method private static checkOneChecksum(Ljava/lang/CharSequence;II)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/ChecksumException;
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    add-int/lit8 v2, p1, -0x1

    :goto_4
    if-gez v2, :cond_18

    invoke-interface {p0, p1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    sget-object v3, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    rem-int/lit8 v4, v1, 0x2f

    aget-char v3, v3, v4

    if-ne v2, v3, :cond_13

    return-void

    :cond_13
    invoke-static {}, Lcom/google/zxing/ChecksumException;->getChecksumInstance()Lcom/google/zxing/ChecksumException;

    move-result-object v2

    throw v2

    :cond_18
    const-string v3, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ-. $/+%abcd*"

    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    mul-int/2addr v3, v0

    add-int/2addr v1, v3

    add-int/lit8 v0, v0, 0x1

    if-le v0, p2, :cond_29

    const/4 v0, 0x1

    :cond_29
    add-int/lit8 v2, v2, -0x1

    goto :goto_4
.end method

.method private static decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    :goto_a
    if-lt v2, v0, :cond_11

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_11
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    const/16 v4, 0x61

    if-lt v3, v4, :cond_84

    const/16 v4, 0x64

    if-gt v3, v4, :cond_84

    add-int/lit8 v4, v0, -0x1

    if-ge v2, v4, :cond_7f

    add-int/lit8 v4, v2, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/4 v5, 0x0

    const/16 v6, 0x5a

    const/16 v7, 0x41

    packed-switch v3, :pswitch_data_8a

    goto :goto_79

    :pswitch_30
    if-lt v4, v7, :cond_38

    if-gt v4, v6, :cond_38

    add-int/lit8 v6, v4, 0x20

    int-to-char v5, v6

    goto :goto_79

    :cond_38
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    :pswitch_3d
    if-lt v4, v7, :cond_47

    const/16 v7, 0x4f

    if-gt v4, v7, :cond_47

    add-int/lit8 v6, v4, -0x20

    int-to-char v5, v6

    goto :goto_79

    :cond_47
    if-ne v4, v6, :cond_4c

    const/16 v5, 0x3a

    goto :goto_79

    :cond_4c
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    :pswitch_51
    if-lt v4, v7, :cond_5b

    const/16 v6, 0x45

    if-gt v4, v6, :cond_5b

    add-int/lit8 v6, v4, -0x26

    int-to-char v5, v6

    goto :goto_79

    :cond_5b
    const/16 v6, 0x46

    if-lt v4, v6, :cond_67

    const/16 v6, 0x57

    if-gt v4, v6, :cond_67

    add-int/lit8 v6, v4, -0xb

    int-to-char v5, v6

    goto :goto_79

    :cond_67
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    :pswitch_6c
    if-lt v4, v7, :cond_74

    if-gt v4, v6, :cond_74

    add-int/lit8 v6, v4, -0x40

    int-to-char v5, v6

    goto :goto_79

    :cond_74
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v6

    throw v6

    :goto_79
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_87

    :cond_7f
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v4

    throw v4

    :cond_84
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_87
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :pswitch_data_8a
    .packed-switch 0x61
        :pswitch_6c
        :pswitch_51
        :pswitch_3d
        :pswitch_30
    .end packed-switch
.end method

.method private findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    invoke-static {v3, v1}, Ljava/util/Arrays;->fill([II)V

    iget-object v3, p0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    move v4, v2

    const/4 v5, 0x0

    array-length v6, v3

    const/4 v7, 0x0

    move v8, v2

    :goto_15
    if-ge v8, v0, :cond_5b

    invoke-virtual {p1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v9

    xor-int/2addr v9, v5

    const/4 v10, 0x1

    if-eqz v9, :cond_25

    aget v9, v3, v7

    add-int/2addr v9, v10

    aput v9, v3, v7

    goto :goto_58

    :cond_25
    add-int/lit8 v9, v6, -0x1

    if-ne v7, v9, :cond_4f

    invoke-static {v3}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v9

    sget v11, Lcom/google/zxing/oned/Code93Reader;->ASTERISK_ENCODING:I

    const/4 v12, 0x2

    if-ne v9, v11, :cond_39

    new-array v9, v12, [I

    aput v4, v9, v1

    aput v8, v9, v10

    return-object v9

    :cond_39
    aget v9, v3, v1

    aget v11, v3, v10

    add-int/2addr v9, v11

    add-int/2addr v4, v9

    add-int/lit8 v9, v6, -0x2

    invoke-static {v3, v12, v3, v1, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v9, v6, -0x2

    aput v1, v3, v9

    add-int/lit8 v9, v6, -0x1

    aput v1, v3, v9

    add-int/lit8 v7, v7, -0x1

    goto :goto_51

    :cond_4f
    add-int/lit8 v7, v7, 0x1

    :goto_51
    aput v10, v3, v7

    if-eqz v5, :cond_57

    move v10, v1

    nop

    :cond_57
    move v5, v10

    :goto_58
    add-int/lit8 v8, v8, 0x1

    goto :goto_15

    :cond_5b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method private static patternToChar(I)C
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    array-length v1, v1

    if-ge v0, v1, :cond_14

    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->CHARACTER_ENCODINGS:[I

    aget v1, v1, v0

    if-ne v1, p0, :cond_11

    sget-object v1, Lcom/google/zxing/oned/Code93Reader;->ALPHABET:[C

    aget-char v1, v1, v0

    return v1

    :cond_11
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_14
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private static toPattern([I)I
    .registers 9

    array-length v0, p0

    const/4 v1, 0x0

    array-length v2, p0

    const/4 v3, 0x0

    :goto_4
    if-lt v3, v2, :cond_33

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_8
    if-lt v3, v0, :cond_b

    return v2

    :cond_b
    aget v4, p0, v3

    int-to-float v4, v4

    const/high16 v5, 0x41100000    # 9.0f

    mul-float/2addr v4, v5

    int-to-float v5, v1

    div-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    const/4 v5, 0x1

    if-lt v4, v5, :cond_31

    const/4 v6, 0x4

    if-le v4, v6, :cond_1e

    goto :goto_31

    :cond_1e
    and-int/lit8 v6, v3, 0x1

    if-nez v6, :cond_2d

    const/4 v6, 0x0

    :goto_23
    if-lt v6, v4, :cond_26

    goto :goto_2e

    :cond_26
    shl-int/lit8 v7, v2, 0x1

    or-int/lit8 v2, v7, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_23

    :cond_2d
    shl-int/2addr v2, v4

    :goto_2e
    add-int/lit8 v3, v3, 0x1

    goto :goto_8

    :cond_31
    :goto_31
    const/4 v5, -0x1

    return v5

    :cond_33
    aget v4, p0, v3

    add-int/2addr v1, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_4
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/ChecksumException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v2}, Lcom/google/zxing/oned/Code93Reader;->findAsteriskPattern(Lcom/google/zxing/common/BitArray;)[I

    move-result-object v3

    const/4 v4, 0x1

    aget v5, v3, v4

    invoke-virtual {v2, v5}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    iget-object v7, v0, Lcom/google/zxing/oned/Code93Reader;->counters:[I

    const/4 v8, 0x0

    invoke-static {v7, v8}, Ljava/util/Arrays;->fill([II)V

    iget-object v9, v0, Lcom/google/zxing/oned/Code93Reader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->setLength(I)V

    :goto_20
    invoke-static {v2, v5, v7}, Lcom/google/zxing/oned/Code93Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    invoke-static {v7}, Lcom/google/zxing/oned/Code93Reader;->toPattern([I)I

    move-result v10

    if-ltz v10, :cond_c3

    invoke-static {v10}, Lcom/google/zxing/oned/Code93Reader;->patternToChar(I)C

    move-result v11

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move v12, v5

    array-length v13, v7

    move v14, v5

    move v5, v8

    :goto_34
    if-lt v5, v13, :cond_b5

    invoke-virtual {v2, v14}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    const/16 v10, 0x2a

    if-ne v11, v10, :cond_b1

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v4

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    const/4 v10, 0x0

    array-length v13, v7

    move v14, v10

    move v10, v8

    :goto_4a
    if-lt v10, v13, :cond_a4

    if-eq v5, v6, :cond_9f

    invoke-virtual {v2, v5}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    if-eqz v10, :cond_9f

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    const/4 v13, 0x2

    if-lt v10, v13, :cond_9a

    invoke-static {v9}, Lcom/google/zxing/oned/Code93Reader;->checkChecksums(Ljava/lang/CharSequence;)V

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    sub-int/2addr v10, v13

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-static {v9}, Lcom/google/zxing/oned/Code93Reader;->decodeExtended(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v10

    aget v15, v3, v4

    aget v16, v3, v8

    add-int v15, v15, v16

    int-to-float v15, v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v15, v15, v16

    int-to-float v4, v12

    int-to-float v8, v14

    div-float v8, v8, v16

    add-float/2addr v4, v8

    new-instance v8, Lcom/google/zxing/Result;

    nop

    nop

    new-array v13, v13, [Lcom/google/zxing/ResultPoint;

    new-instance v0, Lcom/google/zxing/ResultPoint;

    int-to-float v2, v1

    invoke-direct {v0, v15, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v2, 0x0

    aput-object v0, v13, v2

    new-instance v0, Lcom/google/zxing/ResultPoint;

    int-to-float v2, v1

    invoke-direct {v0, v4, v2}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v0, v13, v16

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->CODE_93:Lcom/google/zxing/BarcodeFormat;

    const/4 v2, 0x0

    invoke-direct {v8, v10, v2, v13, v0}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v8

    :cond_9a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_9f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_a4
    move/from16 v16, v4

    move v2, v8

    aget v0, v7, v10

    add-int/2addr v14, v0

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto :goto_4a

    :cond_b1
    move-object/from16 v2, p2

    goto/16 :goto_20

    :cond_b5
    move/from16 v16, v4

    move v2, v8

    aget v0, v7, v5

    add-int/2addr v14, v0

    add-int/lit8 v5, v5, 0x1

    move-object/from16 v0, p0

    move-object/from16 v2, p2

    goto/16 :goto_34

    :cond_c3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method
