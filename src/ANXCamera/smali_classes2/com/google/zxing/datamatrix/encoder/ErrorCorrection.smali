.class public final Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;
.super Ljava/lang/Object;
.source "ErrorCorrection.java"


# static fields
.field private static final ALOG:[I

.field private static final FACTORS:[[I

.field private static final FACTOR_SETS:[I

.field private static final LOG:[I

.field private static final MODULO_VALUE:I = 0x12d


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/16 v0, 0x10

    new-array v1, v0, [I

    fill-array-data v1, :array_d6

    sput-object v1, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->FACTOR_SETS:[I

    new-array v0, v0, [[I

    const/4 v1, 0x5

    new-array v2, v1, [I

    fill-array-data v2, :array_fa

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const/4 v2, 0x7

    new-array v3, v2, [I

    fill-array-data v3, :array_108

    const/4 v4, 0x1

    aput-object v3, v0, v4

    const/16 v3, 0xa

    new-array v4, v3, [I

    fill-array-data v4, :array_11a

    const/4 v5, 0x2

    aput-object v4, v0, v5

    const/16 v4, 0xb

    new-array v5, v4, [I

    fill-array-data v5, :array_132

    const/4 v6, 0x3

    aput-object v5, v0, v6

    const/16 v5, 0xc

    new-array v6, v5, [I

    fill-array-data v6, :array_14c

    const/4 v7, 0x4

    aput-object v6, v0, v7

    const/16 v6, 0xe

    new-array v7, v6, [I

    fill-array-data v7, :array_168

    aput-object v7, v0, v1

    const/16 v1, 0x12

    new-array v1, v1, [I

    fill-array-data v1, :array_188

    const/4 v7, 0x6

    aput-object v1, v0, v7

    const/16 v1, 0x14

    new-array v1, v1, [I

    fill-array-data v1, :array_1b0

    aput-object v1, v0, v2

    const/16 v1, 0x18

    new-array v1, v1, [I

    fill-array-data v1, :array_1dc

    const/16 v2, 0x8

    aput-object v1, v0, v2

    const/16 v1, 0x1c

    new-array v1, v1, [I

    fill-array-data v1, :array_210

    const/16 v2, 0x9

    aput-object v1, v0, v2

    const/16 v1, 0x24

    new-array v1, v1, [I

    fill-array-data v1, :array_24c

    nop

    aput-object v1, v0, v3

    const/16 v1, 0x2a

    new-array v1, v1, [I

    fill-array-data v1, :array_298

    nop

    aput-object v1, v0, v4

    const/16 v1, 0x30

    new-array v1, v1, [I

    fill-array-data v1, :array_2f0

    nop

    aput-object v1, v0, v5

    const/16 v1, 0x38

    new-array v1, v1, [I

    fill-array-data v1, :array_354

    nop

    nop

    const/16 v2, 0xd

    aput-object v1, v0, v2

    const/16 v1, 0x3e

    new-array v1, v1, [I

    fill-array-data v1, :array_3c8

    nop

    nop

    aput-object v1, v0, v6

    const/16 v1, 0x44

    new-array v1, v1, [I

    fill-array-data v1, :array_448

    nop

    nop

    nop

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->FACTORS:[[I

    const/16 v0, 0x100

    new-array v1, v0, [I

    sput-object v1, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    const/16 v1, 0xff

    new-array v2, v1, [I

    sput-object v2, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->ALOG:[I

    const/4 v2, 0x1

    const/4 v3, 0x0

    :goto_c1
    if-lt v3, v1, :cond_c4

    return-void

    :cond_c4
    sget-object v4, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->ALOG:[I

    aput v2, v4, v3

    sget-object v4, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    aput v3, v4, v2

    mul-int/lit8 v2, v2, 0x2

    if-lt v2, v0, :cond_d2

    xor-int/lit16 v2, v2, 0x12d

    :cond_d2
    add-int/lit8 v3, v3, 0x1

    goto :goto_c1

    nop

    :array_d6
    .array-data 4
        0x5
        0x7
        0xa
        0xb
        0xc
        0xe
        0x12
        0x14
        0x18
        0x1c
        0x24
        0x2a
        0x30
        0x38
        0x3e
        0x44
    .end array-data

    :array_fa
    .array-data 4
        0xe4
        0x30
        0xf
        0x6f
        0x3e
    .end array-data

    :array_108
    .array-data 4
        0x17
        0x44
        0x90
        0x86
        0xf0
        0x5c
        0xfe
    .end array-data

    :array_11a
    .array-data 4
        0x1c
        0x18
        0xb9
        0xa6
        0xdf
        0xf8
        0x74
        0xff
        0x6e
        0x3d
    .end array-data

    :array_132
    .array-data 4
        0xaf
        0x8a
        0xcd
        0xc
        0xc2
        0xa8
        0x27
        0xf5
        0x3c
        0x61
        0x78
    .end array-data

    :array_14c
    .array-data 4
        0x29
        0x99
        0x9e
        0x5b
        0x3d
        0x2a
        0x8e
        0xd5
        0x61
        0xb2
        0x64
        0xf2
    .end array-data

    :array_168
    .array-data 4
        0x9c
        0x61
        0xc0
        0xfc
        0x5f
        0x9
        0x9d
        0x77
        0x8a
        0x2d
        0x12
        0xba
        0x53
        0xb9
    .end array-data

    :array_188
    .array-data 4
        0x53
        0xc3
        0x64
        0x27
        0xbc
        0x4b
        0x42
        0x3d
        0xf1
        0xd5
        0x6d
        0x81
        0x5e
        0xfe
        0xe1
        0x30
        0x5a
        0xbc
    .end array-data

    :array_1b0
    .array-data 4
        0xf
        0xc3
        0xf4
        0x9
        0xe9
        0x47
        0xa8
        0x2
        0xbc
        0xa0
        0x99
        0x91
        0xfd
        0x4f
        0x6c
        0x52
        0x1b
        0xae
        0xba
        0xac
    .end array-data

    :array_1dc
    .array-data 4
        0x34
        0xbe
        0x58
        0xcd
        0x6d
        0x27
        0xb0
        0x15
        0x9b
        0xc5
        0xfb
        0xdf
        0x9b
        0x15
        0x5
        0xac
        0xfe
        0x7c
        0xc
        0xb5
        0xb8
        0x60
        0x32
        0xc1
    .end array-data

    :array_210
    .array-data 4
        0xd3
        0xe7
        0x2b
        0x61
        0x47
        0x60
        0x67
        0xae
        0x25
        0x97
        0xaa
        0x35
        0x4b
        0x22
        0xf9
        0x79
        0x11
        0x8a
        0x6e
        0xd5
        0x8d
        0x88
        0x78
        0x97
        0xe9
        0xa8
        0x5d
        0xff
    .end array-data

    :array_24c
    .array-data 4
        0xf5
        0x7f
        0xf2
        0xda
        0x82
        0xfa
        0xa2
        0xb5
        0x66
        0x78
        0x54
        0xb3
        0xdc
        0xfb
        0x50
        0xb6
        0xe5
        0x12
        0x2
        0x4
        0x44
        0x21
        0x65
        0x89
        0x5f
        0x77
        0x73
        0x2c
        0xaf
        0xb8
        0x3b
        0x19
        0xe1
        0x62
        0x51
        0x70
    .end array-data

    :array_298
    .array-data 4
        0x4d
        0xc1
        0x89
        0x1f
        0x13
        0x26
        0x16
        0x99
        0xf7
        0x69
        0x7a
        0x2
        0xf5
        0x85
        0xf2
        0x8
        0xaf
        0x5f
        0x64
        0x9
        0xa7
        0x69
        0xd6
        0x6f
        0x39
        0x79
        0x15
        0x1
        0xfd
        0x39
        0x36
        0x65
        0xf8
        0xca
        0x45
        0x32
        0x96
        0xb1
        0xe2
        0x5
        0x9
        0x5
    .end array-data

    :array_2f0
    .array-data 4
        0xf5
        0x84
        0xac
        0xdf
        0x60
        0x20
        0x75
        0x16
        0xee
        0x85
        0xee
        0xe7
        0xcd
        0xbc
        0xed
        0x57
        0xbf
        0x6a
        0x10
        0x93
        0x76
        0x17
        0x25
        0x5a
        0xaa
        0xcd
        0x83
        0x58
        0x78
        0x64
        0x42
        0x8a
        0xba
        0xf0
        0x52
        0x2c
        0xb0
        0x57
        0xbb
        0x93
        0xa0
        0xaf
        0x45
        0xd5
        0x5c
        0xfd
        0xe1
        0x13
    .end array-data

    :array_354
    .array-data 4
        0xaf
        0x9
        0xdf
        0xee
        0xc
        0x11
        0xdc
        0xd0
        0x64
        0x1d
        0xaf
        0xaa
        0xe6
        0xc0
        0xd7
        0xeb
        0x96
        0x9f
        0x24
        0xdf
        0x26
        0xc8
        0x84
        0x36
        0xe4
        0x92
        0xda
        0xea
        0x75
        0xcb
        0x1d
        0xe8
        0x90
        0xee
        0x16
        0x96
        0xc9
        0x75
        0x3e
        0xcf
        0xa4
        0xd
        0x89
        0xf5
        0x7f
        0x43
        0xf7
        0x1c
        0x9b
        0x2b
        0xcb
        0x6b
        0xe9
        0x35
        0x8f
        0x2e
    .end array-data

    :array_3c8
    .array-data 4
        0xf2
        0x5d
        0xa9
        0x32
        0x90
        0xd2
        0x27
        0x76
        0xca
        0xbc
        0xc9
        0xbd
        0x8f
        0x6c
        0xc4
        0x25
        0xb9
        0x70
        0x86
        0xe6
        0xf5
        0x3f
        0xc5
        0xbe
        0xfa
        0x6a
        0xb9
        0xdd
        0xaf
        0x40
        0x72
        0x47
        0xa1
        0x2c
        0x93
        0x6
        0x1b
        0xda
        0x33
        0x3f
        0x57
        0xa
        0x28
        0x82
        0xbc
        0x11
        0xa3
        0x1f
        0xb0
        0xaa
        0x4
        0x6b
        0xe8
        0x7
        0x5e
        0xa6
        0xe0
        0x7c
        0x56
        0x2f
        0xb
        0xcc
    .end array-data

    :array_448
    .array-data 4
        0xdc
        0xe4
        0xad
        0x59
        0xfb
        0x95
        0x9f
        0x38
        0x59
        0x21
        0x93
        0xf4
        0x9a
        0x24
        0x49
        0x7f
        0xd5
        0x88
        0xf8
        0xb4
        0xea
        0xc5
        0x9e
        0xb1
        0x44
        0x7a
        0x5d
        0xd5
        0xf
        0xa0
        0xe3
        0xec
        0x42
        0x8b
        0x99
        0xb9
        0xca
        0xa7
        0xb3
        0x19
        0xdc
        0xe8
        0x60
        0xd2
        0xe7
        0x88
        0xdf
        0xef
        0xb5
        0xf1
        0x3b
        0x34
        0xac
        0x19
        0x31
        0xe8
        0xd3
        0xbd
        0x40
        0x36
        0x6c
        0x99
        0x84
        0x3f
        0x60
        0x67
        0x52
        0xba
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createECCBlock(Ljava/lang/CharSequence;I)Ljava/lang/String;
    .registers 4

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->createECCBlock(Ljava/lang/CharSequence;III)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static createECCBlock(Ljava/lang/CharSequence;III)Ljava/lang/String;
    .registers 16

    const/4 v0, -0x1

    const/4 v1, 0x0

    :goto_2
    sget-object v2, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->FACTOR_SETS:[I

    array-length v2, v2

    if-lt v1, v2, :cond_8

    goto :goto_10

    :cond_8
    sget-object v2, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->FACTOR_SETS:[I

    aget v2, v2, v1

    if-ne v2, p3, :cond_a6

    move v0, v1

    nop

    :goto_10
    if-ltz v0, :cond_92

    sget-object v1, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->FACTORS:[[I

    aget-object v1, v1, v0

    new-array v2, p3, [C

    const/4 v3, 0x0

    :goto_19
    const/4 v4, 0x0

    if-lt v3, p3, :cond_8d

    move v3, p1

    move v5, v3

    :goto_1e
    add-int v3, p1, p2

    if-lt v5, v3, :cond_37

    new-array v3, p3, [C

    const/4 v4, 0x0

    :goto_25
    if-lt v4, p3, :cond_2c

    invoke-static {v3}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v4

    return-object v4

    :cond_2c
    sub-int v5, p3, v4

    add-int/lit8 v5, v5, -0x1

    aget-char v5, v2, v5

    aput-char v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    :cond_37
    add-int/lit8 v3, p3, -0x1

    aget-char v3, v2, v3

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v6

    xor-int/2addr v6, v3

    add-int/lit8 v3, p3, -0x1

    :goto_42
    if-gtz v3, :cond_64

    if-eqz v6, :cond_5f

    aget v3, v1, v4

    if-eqz v3, :cond_5f

    sget-object v3, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->ALOG:[I

    sget-object v7, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    aget v7, v7, v6

    sget-object v8, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    aget v9, v1, v4

    aget v8, v8, v9

    add-int/2addr v7, v8

    rem-int/lit16 v7, v7, 0xff

    aget v3, v3, v7

    int-to-char v3, v3

    aput-char v3, v2, v4

    goto :goto_61

    :cond_5f
    aput-char v4, v2, v4

    :goto_61
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    :cond_64
    if-eqz v6, :cond_84

    aget v7, v1, v3

    if-eqz v7, :cond_84

    add-int/lit8 v7, v3, -0x1

    aget-char v7, v2, v7

    sget-object v8, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->ALOG:[I

    sget-object v9, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    aget v9, v9, v6

    sget-object v10, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->LOG:[I

    aget v11, v1, v3

    aget v10, v10, v11

    add-int/2addr v9, v10

    rem-int/lit16 v9, v9, 0xff

    aget v8, v8, v9

    xor-int/2addr v7, v8

    int-to-char v7, v7

    aput-char v7, v2, v3

    goto :goto_8a

    :cond_84
    add-int/lit8 v7, v3, -0x1

    aget-char v7, v2, v7

    aput-char v7, v2, v3

    :goto_8a
    add-int/lit8 v3, v3, -0x1

    goto :goto_42

    :cond_8d
    aput-char v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_92
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Illegal number of error correction codewords specified: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_a6
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_2
.end method

.method public static encodeECC200(Ljava/lang/String;Lcom/google/zxing/datamatrix/encoder/SymbolInfo;)Ljava/lang/String;
    .registers 14

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v1

    if-ne v0, v1, :cond_a5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v1

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getErrorCodewords()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getInterleavedBlockCount()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2e

    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getErrorCodewords()I

    move-result v2

    invoke-static {p0, v2}, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->createECCBlock(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_42

    :cond_2e
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->capacity()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    new-array v2, v1, [I

    new-array v3, v1, [I

    new-array v4, v1, [I

    const/4 v5, 0x0

    :goto_3c
    if-lt v5, v1, :cond_84

    const/4 v5, 0x0

    move v6, v5

    :goto_40
    if-lt v6, v1, :cond_47

    :goto_42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_47
    new-instance v5, Ljava/lang/StringBuilder;

    aget v7, v2, v6

    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(I)V

    move-object v7, v5

    move v5, v6

    :goto_50
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v8

    if-lt v5, v8, :cond_7b

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aget v8, v3, v6

    invoke-static {v5, v8}, Lcom/google/zxing/datamatrix/encoder/ErrorCorrection;->createECCBlock(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v8

    const/4 v5, 0x0

    move v9, v6

    :goto_62
    aget v10, v3, v6

    mul-int/2addr v10, v1

    if-lt v9, v10, :cond_6a

    add-int/lit8 v6, v6, 0x1

    goto :goto_40

    :cond_6a
    invoke-virtual {p1}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataCapacity()I

    move-result v10

    add-int/2addr v10, v9

    add-int/lit8 v11, v5, 0x1

    invoke-virtual {v8, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-virtual {v0, v10, v5}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/2addr v9, v1

    move v5, v11

    goto :goto_62

    :cond_7b
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/2addr v5, v1

    goto :goto_50

    :cond_84
    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getDataLengthForInterleavedBlock(I)I

    move-result v6

    aput v6, v2, v5

    add-int/lit8 v6, v5, 0x1

    invoke-virtual {p1, v6}, Lcom/google/zxing/datamatrix/encoder/SymbolInfo;->getErrorLengthForInterleavedBlock(I)I

    move-result v6

    aput v6, v3, v5

    const/4 v6, 0x0

    aput v6, v4, v5

    if-lez v5, :cond_a2

    add-int/lit8 v6, v5, -0x1

    aget v6, v4, v6

    aget v7, v2, v5

    add-int/2addr v6, v7

    aput v6, v4, v5

    :cond_a2
    add-int/lit8 v5, v5, 0x1

    goto :goto_3c

    :cond_a5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    nop

    const-string v1, "The number of codewords does not match the selected symbol"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
