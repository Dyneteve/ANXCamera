.class public final Lcom/google/zxing/oned/CodaBarReader;
.super Lcom/google/zxing/oned/OneDReader;
.source "CodaBarReader.java"


# static fields
.field static final ALPHABET:[C

.field private static final ALPHABET_STRING:Ljava/lang/String; = "0123456789-$:/.+ABCD"

.field static final CHARACTER_ENCODINGS:[I

.field private static final MAX_ACCEPTABLE:F = 2.0f

.field private static final MIN_CHARACTER_LENGTH:I = 0x3

.field private static final PADDING:F = 1.5f

.field private static final STARTEND_ENCODING:[C


# instance fields
.field private counterLength:I

.field private counters:[I

.field private final decodeRowResult:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "0123456789-$:/.+ABCD"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    const/16 v0, 0x14

    new-array v0, v0, [I

    fill-array-data v0, :array_1c

    nop

    nop

    sput-object v0, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    const/4 v0, 0x4

    new-array v0, v0, [C

    fill-array-data v0, :array_48

    sput-object v0, Lcom/google/zxing/oned/CodaBarReader;->STARTEND_ENCODING:[C

    return-void

    :array_1c
    .array-data 4
        0x3
        0x6
        0x9
        0x60
        0x12
        0x42
        0x21
        0x24
        0x30
        0x48
        0xc
        0x18
        0x45
        0x51
        0x54
        0x15
        0x1a
        0x29
        0xb
        0xe
    .end array-data

    :array_48
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcom/google/zxing/oned/OneDReader;-><init>()V

    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    const/16 v0, 0x50

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    return-void
.end method

.method static arrayContains([CC)Z
    .registers 6

    const/4 v0, 0x0

    if-eqz p0, :cond_11

    array-length v1, p0

    move v2, v0

    :goto_5
    if-lt v2, v1, :cond_8

    goto :goto_11

    :cond_8
    aget-char v3, p0, v2

    if-ne v3, p1, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_11
    :goto_11
    return v0
.end method

.method private counterAppend(I)V
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    iget v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    aput p1, v0, v1

    iget v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    iget v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    iget-object v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    array-length v1, v1

    if-lt v0, v1, :cond_23

    iget v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    mul-int/lit8 v0, v0, 0x2

    new-array v0, v0, [I

    iget-object v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    iget v2, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    :cond_23
    return-void
.end method

.method private findStartPattern()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x1

    :goto_1
    iget v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    if-ge v0, v1, :cond_37

    invoke-direct {p0, v0}, Lcom/google/zxing/oned/CodaBarReader;->toNarrowWidePattern(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_34

    sget-object v2, Lcom/google/zxing/oned/CodaBarReader;->STARTEND_ENCODING:[C

    sget-object v3, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    aget-char v3, v3, v1

    invoke-static {v2, v3}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v2

    if-eqz v2, :cond_34

    const/4 v2, 0x0

    move v3, v0

    :goto_1a
    add-int/lit8 v4, v0, 0x7

    if-lt v3, v4, :cond_2c

    const/4 v3, 0x1

    if-eq v0, v3, :cond_2b

    iget-object v3, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    add-int/lit8 v4, v0, -0x1

    aget v3, v3, v4

    div-int/lit8 v4, v2, 0x2

    if-lt v3, v4, :cond_34

    :cond_2b
    return v0

    :cond_2c
    iget-object v4, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    aget v4, v4, v3

    add-int/2addr v2, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_34
    add-int/lit8 v0, v0, 0x2

    goto :goto_1

    :cond_37
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private setCounters(Lcom/google/zxing/common/BitArray;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    invoke-virtual {p1, v0}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v1

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ge v1, v2, :cond_2c

    const/4 v3, 0x1

    const/4 v4, 0x0

    :goto_f
    if-lt v1, v2, :cond_15

    invoke-direct {p0, v4}, Lcom/google/zxing/oned/CodaBarReader;->counterAppend(I)V

    return-void

    :cond_15
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    xor-int/2addr v5, v3

    if-eqz v5, :cond_1f

    add-int/lit8 v4, v4, 0x1

    goto :goto_29

    :cond_1f
    invoke-direct {p0, v4}, Lcom/google/zxing/oned/CodaBarReader;->counterAppend(I)V

    const/4 v4, 0x1

    if-eqz v3, :cond_27

    move v5, v0

    goto :goto_28

    :cond_27
    const/4 v5, 0x1

    :goto_28
    move v3, v5

    :goto_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_f

    :cond_2c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private toNarrowWidePattern(I)I
    .registers 16

    add-int/lit8 v0, p1, 0x7

    iget v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    const/4 v2, -0x1

    if-lt v0, v1, :cond_8

    return v2

    :cond_8
    iget-object v1, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    const/4 v3, 0x0

    const v4, 0x7fffffff

    move v5, p1

    :goto_f
    if-lt v5, v0, :cond_57

    add-int v5, v4, v3

    div-int/lit8 v6, v5, 0x2

    const/4 v5, 0x0

    const v7, 0x7fffffff

    add-int/lit8 v8, p1, 0x1

    :goto_1b
    if-lt v8, v0, :cond_4c

    add-int v8, v7, v5

    div-int/lit8 v9, v8, 0x2

    const/16 v8, 0x80

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_25
    const/4 v12, 0x7

    if-lt v11, v12, :cond_39

    const/4 v11, 0x0

    :goto_29
    sget-object v12, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    array-length v12, v12

    if-lt v11, v12, :cond_2f

    return v2

    :cond_2f
    sget-object v12, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    aget v12, v12, v11

    if-ne v12, v10, :cond_36

    return v11

    :cond_36
    add-int/lit8 v11, v11, 0x1

    goto :goto_29

    :cond_39
    and-int/lit8 v12, v11, 0x1

    if-nez v12, :cond_3f

    move v12, v6

    goto :goto_40

    :cond_3f
    move v12, v9

    :goto_40
    shr-int/lit8 v8, v8, 0x1

    add-int v13, p1, v11

    aget v13, v1, v13

    if-le v13, v12, :cond_49

    or-int/2addr v10, v8

    :cond_49
    add-int/lit8 v11, v11, 0x1

    goto :goto_25

    :cond_4c
    aget v9, v1, v8

    if-ge v9, v7, :cond_51

    move v7, v9

    :cond_51
    if-le v9, v5, :cond_54

    move v5, v9

    :cond_54
    add-int/lit8 v8, v8, 0x2

    goto :goto_1b

    :cond_57
    aget v6, v1, v5

    if-ge v6, v4, :cond_5c

    move v4, v6

    :cond_5c
    if-le v6, v3, :cond_5f

    move v3, v6

    :cond_5f
    add-int/lit8 v5, v5, 0x2

    goto :goto_f
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
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object/from16 v2, p3

    iget-object v3, v0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    const/4 v4, 0x0

    invoke-static {v3, v4}, Ljava/util/Arrays;->fill([II)V

    move-object/from16 v3, p2

    invoke-direct {v0, v3}, Lcom/google/zxing/oned/CodaBarReader;->setCounters(Lcom/google/zxing/common/BitArray;)V

    invoke-direct/range {p0 .. p0}, Lcom/google/zxing/oned/CodaBarReader;->findStartPattern()I

    move-result v5

    move v6, v5

    iget-object v7, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    :goto_1b
    invoke-direct {v0, v6}, Lcom/google/zxing/oned/CodaBarReader;->toNarrowWidePattern(I)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_141

    iget-object v9, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    int-to-char v10, v7

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v6, 0x8

    iget-object v9, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->length()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_40

    sget-object v9, Lcom/google/zxing/oned/CodaBarReader;->STARTEND_ENCODING:[C

    sget-object v11, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    aget-char v11, v11, v7

    invoke-static {v9, v11}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v9

    if-eqz v9, :cond_40

    goto :goto_44

    :cond_40
    iget v7, v0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    if-lt v6, v7, :cond_13d

    :goto_44
    iget-object v7, v0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    add-int/lit8 v9, v6, -0x1

    aget v7, v7, v9

    const/4 v9, 0x0

    const/4 v11, -0x8

    :goto_4c
    if-lt v11, v8, :cond_12a

    iget v8, v0, Lcom/google/zxing/oned/CodaBarReader;->counterLength:I

    if-ge v6, v8, :cond_5c

    div-int/lit8 v8, v9, 0x2

    if-lt v7, v8, :cond_57

    goto :goto_5c

    :cond_57
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v4

    throw v4

    :cond_5c
    :goto_5c
    invoke-virtual {v0, v5}, Lcom/google/zxing/oned/CodaBarReader;->validatePattern(I)V

    const/4 v8, 0x0

    :goto_60
    iget-object v11, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->length()I

    move-result v11

    if-lt v8, v11, :cond_10d

    iget-object v8, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    sget-object v11, Lcom/google/zxing/oned/CodaBarReader;->STARTEND_ENCODING:[C

    invoke-static {v11, v8}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v11

    if-eqz v11, :cond_108

    iget-object v11, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    iget-object v12, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    sub-int/2addr v12, v10

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v11

    sget-object v12, Lcom/google/zxing/oned/CodaBarReader;->STARTEND_ENCODING:[C

    invoke-static {v12, v11}, Lcom/google/zxing/oned/CodaBarReader;->arrayContains([CC)Z

    move-result v12

    if-eqz v12, :cond_103

    iget-object v12, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->length()I

    move-result v12

    const/4 v13, 0x3

    if-le v12, v13, :cond_fe

    if-eqz v2, :cond_9e

    sget-object v12, Lcom/google/zxing/DecodeHintType;->RETURN_CODABAR_START_END:Lcom/google/zxing/DecodeHintType;

    invoke-interface {v2, v12}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_af

    :cond_9e
    iget-object v12, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    iget-object v13, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->length()I

    move-result v13

    sub-int/2addr v13, v10

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    iget-object v12, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    :cond_af
    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_b1
    if-lt v13, v5, :cond_ef

    int-to-float v14, v12

    move v13, v5

    :goto_b5
    add-int/lit8 v15, v6, -0x1

    if-lt v13, v15, :cond_e0

    int-to-float v13, v12

    new-instance v15, Lcom/google/zxing/Result;

    iget-object v10, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    nop

    const/4 v4, 0x2

    new-array v4, v4, [Lcom/google/zxing/ResultPoint;

    new-instance v2, Lcom/google/zxing/ResultPoint;

    int-to-float v3, v1

    invoke-direct {v2, v14, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/4 v3, 0x0

    aput-object v2, v4, v3

    new-instance v2, Lcom/google/zxing/ResultPoint;

    int-to-float v3, v1

    invoke-direct {v2, v13, v3}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    const/16 v16, 0x1

    aput-object v2, v4, v16

    sget-object v2, Lcom/google/zxing/BarcodeFormat;->CODABAR:Lcom/google/zxing/BarcodeFormat;

    const/4 v3, 0x0

    invoke-direct {v15, v10, v3, v4, v2}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v15

    :cond_e0
    move v3, v4

    move/from16 v16, v10

    iget-object v2, v0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    aget v2, v2, v13

    add-int/2addr v12, v2

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    goto :goto_b5

    :cond_ef
    move v3, v4

    move/from16 v16, v10

    iget-object v2, v0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    aget v2, v2, v13

    add-int/2addr v12, v2

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    goto :goto_b1

    :cond_fe
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_103
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_108
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2

    :cond_10d
    move v3, v4

    move/from16 v16, v10

    iget-object v2, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    sget-object v4, Lcom/google/zxing/oned/CodaBarReader;->ALPHABET:[C

    iget-object v10, v0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v10

    aget-char v4, v4, v10

    invoke-virtual {v2, v8, v4}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v8, v8, 0x1

    move v4, v3

    move/from16 v10, v16

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    goto/16 :goto_60

    :cond_12a
    move v3, v4

    move/from16 v16, v10

    iget-object v2, v0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    add-int v4, v6, v11

    aget v2, v2, v4

    add-int/2addr v9, v2

    add-int/lit8 v11, v11, 0x1

    move v4, v3

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    goto/16 :goto_4c

    :cond_13d
    move-object/from16 v3, p2

    goto/16 :goto_1b

    :cond_141
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v2

    throw v2
.end method

.method validatePattern(I)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x4

    new-array v1, v0, [I

    new-array v2, v0, [I

    iget-object v3, p0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    move v4, p1

    const/4 v5, 0x0

    move v6, v4

    move v4, v5

    :goto_11
    sget-object v7, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    iget-object v8, p0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v8

    aget v7, v7, v8

    const/4 v8, 0x6

    :goto_1c
    const/4 v9, 0x2

    if-gez v8, :cond_a5

    if-lt v4, v3, :cond_9f

    nop

    new-array v8, v0, [F

    new-array v10, v0, [F

    const/4 v0, 0x0

    :goto_27
    if-lt v0, v9, :cond_66

    move v0, p1

    nop

    :goto_2b
    move v4, v5

    sget-object v5, Lcom/google/zxing/oned/CodaBarReader;->CHARACTER_ENCODINGS:[I

    iget-object v6, p0, Lcom/google/zxing/oned/CodaBarReader;->decodeRowResult:Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x6

    :goto_37
    if-gez v6, :cond_42

    if-lt v4, v3, :cond_3d

    nop

    return-void

    :cond_3d
    add-int/lit8 v0, v0, 0x8

    add-int/lit8 v5, v4, 0x1

    goto :goto_2b

    :cond_42
    and-int/lit8 v7, v6, 0x1

    and-int/lit8 v11, v5, 0x1

    mul-int/2addr v11, v9

    add-int/2addr v7, v11

    iget-object v11, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    add-int v12, v0, v6

    aget v11, v11, v12

    int-to-float v12, v11

    aget v13, v10, v7

    cmpg-float v12, v12, v13

    if-ltz v12, :cond_61

    int-to-float v12, v11

    aget v13, v8, v7

    cmpl-float v12, v12, v13

    if-gtz v12, :cond_61

    shr-int/lit8 v5, v5, 0x1

    add-int/lit8 v6, v6, -0x1

    goto :goto_37

    :cond_61
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v9

    throw v9

    :cond_66
    const/4 v4, 0x0

    aput v4, v10, v0

    add-int/lit8 v4, v0, 0x2

    aget v7, v1, v0

    int-to-float v7, v7

    aget v11, v2, v0

    int-to-float v11, v11

    div-float/2addr v7, v11

    add-int/lit8 v11, v0, 0x2

    aget v11, v1, v11

    int-to-float v11, v11

    add-int/lit8 v12, v0, 0x2

    aget v12, v2, v12

    int-to-float v12, v12

    div-float/2addr v11, v12

    add-float/2addr v7, v11

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v7, v11

    aput v7, v10, v4

    add-int/lit8 v4, v0, 0x2

    aget v4, v10, v4

    aput v4, v8, v0

    add-int/lit8 v4, v0, 0x2

    add-int/lit8 v7, v0, 0x2

    aget v7, v1, v7

    int-to-float v7, v7

    mul-float/2addr v7, v11

    const/high16 v11, 0x3fc00000    # 1.5f

    add-float/2addr v7, v11

    add-int/lit8 v11, v0, 0x2

    aget v11, v2, v11

    int-to-float v11, v11

    div-float/2addr v7, v11

    aput v7, v8, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_27

    :cond_9f
    add-int/lit8 v6, v6, 0x8

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_11

    :cond_a5
    and-int/lit8 v10, v8, 0x1

    and-int/lit8 v11, v7, 0x1

    mul-int/2addr v11, v9

    add-int/2addr v10, v11

    aget v9, v1, v10

    iget-object v11, p0, Lcom/google/zxing/oned/CodaBarReader;->counters:[I

    add-int v12, v6, v8

    aget v11, v11, v12

    add-int/2addr v9, v11

    aput v9, v1, v10

    aget v9, v2, v10

    add-int/lit8 v9, v9, 0x1

    aput v9, v2, v10

    shr-int/lit8 v7, v7, 0x1

    add-int/lit8 v8, v8, -0x1

    goto/16 :goto_1c
.end method
