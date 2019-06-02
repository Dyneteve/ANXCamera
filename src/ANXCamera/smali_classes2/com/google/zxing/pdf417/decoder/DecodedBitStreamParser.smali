.class final Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I = null

.field private static final AL:I = 0x1c

.field private static final AS:I = 0x1b

.field private static final BEGIN_MACRO_PDF417_CONTROL_BLOCK:I = 0x3a0

.field private static final BEGIN_MACRO_PDF417_OPTIONAL_FIELD:I = 0x39b

.field private static final BYTE_COMPACTION_MODE_LATCH:I = 0x385

.field private static final BYTE_COMPACTION_MODE_LATCH_6:I = 0x39c

.field private static final DEFAULT_ENCODING:Ljava/nio/charset/Charset;

.field private static final ECI_CHARSET:I = 0x39f

.field private static final ECI_GENERAL_PURPOSE:I = 0x39e

.field private static final ECI_USER_DEFINED:I = 0x39d

.field private static final EXP900:[Ljava/math/BigInteger;

.field private static final LL:I = 0x1b

.field private static final MACRO_PDF417_TERMINATOR:I = 0x39a

.field private static final MAX_NUMERIC_CODEWORDS:I = 0xf

.field private static final MIXED_CHARS:[C

.field private static final ML:I = 0x1c

.field private static final MODE_SHIFT_TO_BYTE_COMPACTION_MODE:I = 0x391

.field private static final NUMBER_OF_SEQUENCE_CODEWORDS:I = 0x2

.field private static final NUMERIC_COMPACTION_MODE_LATCH:I = 0x386

.field private static final PAL:I = 0x1d

.field private static final PL:I = 0x19

.field private static final PS:I = 0x1d

.field private static final PUNCT_CHARS:[C

.field private static final TEXT_COMPACTION_MODE_LATCH:I = 0x384


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I
    .registers 3

    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->values()[Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v1

    :goto_17
    :try_start_17
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    move-exception v1

    :goto_22
    :try_start_22
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception v1

    :goto_2d
    :try_start_2d
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_36} :catch_37

    goto :goto_38

    :catch_37
    move-exception v1

    :goto_38
    :try_start_38
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_41} :catch_42

    goto :goto_43

    :catch_42
    move-exception v1

    :goto_43
    :try_start_43
    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_4c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    move-exception v1

    :goto_4e
    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 5

    const/16 v0, 0x1d

    new-array v0, v0, [C

    fill-array-data v0, :array_50

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    const/16 v0, 0x19

    new-array v0, v0, [C

    fill-array-data v0, :array_72

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    const-string v0, "ISO-8859-1"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    const/16 v0, 0x10

    new-array v0, v0, [Ljava/math/BigInteger;

    sput-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v0, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v1, Ljava/math/BigInteger;->ONE:Ljava/math/BigInteger;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-wide/16 v0, 0x384

    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    const/4 v2, 0x1

    aput-object v0, v1, v2

    const/4 v1, 0x2

    :goto_39
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    array-length v2, v2

    if-lt v1, v2, :cond_3f

    return-void

    :cond_3f
    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    add-int/lit8 v4, v1, -0x1

    aget-object v3, v3, v4

    invoke-virtual {v3, v0}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_39

    :array_50
    .array-data 2
        0x3bs
        0x3cs
        0x3es
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5fs
        0x60s
        0x7es
        0x21s
        0xds
        0x9s
        0x2cs
        0x3as
        0xas
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x22s
        0x7cs
        0x2as
        0x28s
        0x29s
        0x3fs
        0x7bs
        0x7ds
        0x27s
    .end array-data

    nop

    :array_72
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x26s
        0xds
        0x9s
        0x2cs
        0x3as
        0x23s
        0x2ds
        0x2es
        0x24s
        0x2fs
        0x2bs
        0x25s
        0x2as
        0x3ds
        0x5es
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I
    .registers 29

    move/from16 v0, p0

    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    const/16 v7, 0x386

    const-wide/16 v8, 0x384

    const/16 v10, 0x39c

    const/4 v11, 0x0

    const/4 v12, 0x6

    const/16 v13, 0x385

    const/16 v14, 0x384

    if-ne v0, v13, :cond_98

    const/4 v15, 0x0

    const-wide/16 v16, 0x0

    new-array v3, v12, [I

    const/16 v19, 0x0

    add-int/lit8 v20, p3, 0x1

    aget v1, p1, p3

    move v12, v1

    move/from16 v1, v20

    :goto_27
    aget v4, p1, v11

    if-ge v1, v4, :cond_7e

    if-eqz v19, :cond_2e

    goto :goto_7e

    :cond_2e
    add-int/lit8 v4, v15, 0x1

    aput v12, v3, v15

    mul-long v21, v8, v16

    int-to-long v8, v12

    add-long v16, v21, v8

    add-int/lit8 v8, v1, 0x1

    aget v12, p1, v1

    if-eq v12, v14, :cond_71

    if-eq v12, v13, :cond_71

    if-eq v12, v7, :cond_71

    if-eq v12, v10, :cond_71

    if-eq v12, v6, :cond_71

    if-eq v12, v5, :cond_71

    const/16 v1, 0x39a

    if-ne v12, v1, :cond_4c

    goto :goto_71

    :cond_4c
    rem-int/lit8 v1, v4, 0x5

    if-nez v1, :cond_6e

    if-lez v4, :cond_6e

    const/4 v1, 0x0

    :goto_53
    const/4 v9, 0x6

    if-lt v1, v9, :cond_5b

    const-wide/16 v16, 0x0

    const/4 v15, 0x0

    move v1, v8

    goto :goto_7b

    :cond_5b
    rsub-int/lit8 v9, v1, 0x5

    const/16 v15, 0x8

    mul-int/2addr v9, v15

    shr-long v5, v16, v9

    long-to-int v5, v5

    int-to-byte v5, v5

    invoke-virtual {v2, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v1, v1, 0x1

    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    goto :goto_53

    :cond_6e
    move v15, v4

    move v1, v8

    goto :goto_77

    :cond_71
    :goto_71
    add-int/lit8 v1, v8, -0x1

    const/16 v19, 0x1

    nop

    move v15, v4

    :goto_77
    const/16 v5, 0x39b

    const/16 v6, 0x3a0

    :goto_7b
    const-wide/16 v8, 0x384

    goto :goto_27

    :cond_7e
    :goto_7e
    aget v4, p1, v11

    if-ne v1, v4, :cond_89

    if-ge v12, v14, :cond_89

    add-int/lit8 v4, v15, 0x1

    aput v12, v3, v15

    goto :goto_8a

    :cond_89
    move v4, v15

    :goto_8a
    const/4 v5, 0x0

    :goto_8b
    if-lt v5, v4, :cond_8f

    goto/16 :goto_114

    :cond_8f
    aget v6, v3, v5

    int-to-byte v6, v6

    invoke-virtual {v2, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_8b

    :cond_98
    if-ne v0, v10, :cond_112

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move/from16 v1, p3

    :goto_a0
    aget v8, p1, v11

    if-ge v1, v8, :cond_114

    if-eqz v6, :cond_a8

    goto/16 :goto_114

    :cond_a8
    add-int/lit8 v8, v1, 0x1

    aget v1, p1, v1

    if-ge v1, v14, :cond_c1

    add-int/lit8 v3, v3, 0x1

    const-wide/16 v15, 0x384

    mul-long v19, v15, v4

    int-to-long v11, v1

    add-long v19, v19, v11

    nop

    move-wide/from16 v4, v19

    const/16 v9, 0x3a0

    const/16 v11, 0x39b

    const/16 v12, 0x39a

    goto :goto_e1

    :cond_c1
    const-wide/16 v15, 0x384

    if-eq v1, v14, :cond_d8

    if-eq v1, v13, :cond_d8

    if-eq v1, v7, :cond_d8

    if-eq v1, v10, :cond_d8

    const/16 v9, 0x3a0

    if-eq v1, v9, :cond_da

    const/16 v11, 0x39b

    if-eq v1, v11, :cond_dc

    const/16 v12, 0x39a

    if-ne v1, v12, :cond_e1

    goto :goto_de

    :cond_d8
    const/16 v9, 0x3a0

    :cond_da
    const/16 v11, 0x39b

    :cond_dc
    const/16 v12, 0x39a

    :goto_de
    add-int/lit8 v8, v8, -0x1

    const/4 v6, 0x1

    :cond_e1
    :goto_e1
    rem-int/lit8 v17, v3, 0x5

    if-nez v17, :cond_109

    if-lez v3, :cond_109

    const/16 v17, 0x0

    move/from16 v7, v17

    :goto_eb
    const/4 v9, 0x6

    if-lt v7, v9, :cond_f5

    const-wide/16 v4, 0x0

    const/4 v3, 0x0

    move v1, v8

    const/16 v7, 0x386

    goto :goto_110

    :cond_f5
    rsub-int/lit8 v17, v7, 0x5

    const/16 v18, 0x8

    mul-int v17, v17, v18

    shr-long v9, v4, v17

    long-to-int v9, v9

    int-to-byte v9, v9

    invoke-virtual {v2, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    add-int/lit8 v7, v7, 0x1

    const/16 v9, 0x3a0

    const/16 v10, 0x39c

    goto :goto_eb

    :cond_109
    const/16 v18, 0x8

    move v1, v8

    const/16 v7, 0x386

    const/16 v10, 0x39c

    :goto_110
    const/4 v11, 0x0

    goto :goto_a0

    :cond_112
    move/from16 v1, p3

    :cond_114
    :goto_114
    new-instance v3, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    move-object/from16 v5, p2

    invoke-direct {v3, v4, v5}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    move-object/from16 v4, p4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return v1
.end method

.method static decode([ILjava/lang/String;)Lcom/google/zxing/common/DecoderResult;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    array-length v1, p0

    mul-int/lit8 v1, v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->DEFAULT_ENCODING:Ljava/nio/charset/Charset;

    const/4 v2, 0x1

    add-int/lit8 v3, v2, 0x1

    aget v2, p0, v2

    new-instance v4, Lcom/google/zxing/pdf417/PDF417ResultMetadata;

    invoke-direct {v4}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;-><init>()V

    :goto_14
    const/4 v5, 0x0

    aget v5, p0, v5

    if-lt v3, v5, :cond_32

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-eqz v5, :cond_2d

    new-instance v5, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v5, v7, v6, v7, p1}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Lcom/google/zxing/common/DecoderResult;->setOther(Ljava/lang/Object;)V

    return-object v5

    :cond_2d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    :cond_32
    const/16 v5, 0x391

    if-eq v2, v5, :cond_74

    packed-switch v2, :pswitch_data_8e

    packed-switch v2, :pswitch_data_98

    add-int/lit8 v3, v3, -0x1

    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    goto :goto_7e

    :pswitch_43
    invoke-static {p0, v3, v4}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I

    move-result v3

    goto :goto_7e

    :pswitch_48
    add-int/lit8 v5, v3, 0x1

    aget v3, p0, v3

    invoke-static {v3}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByValue(I)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v3

    nop

    invoke-virtual {v3}, Lcom/google/zxing/common/CharacterSetECI;->name()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    goto :goto_7d

    :pswitch_5a
    add-int/lit8 v3, v3, 0x2

    goto :goto_7e

    :pswitch_5d
    add-int/lit8 v3, v3, 0x1

    goto :goto_7e

    :pswitch_60
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    :pswitch_65
    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->numericCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    goto :goto_7e

    :pswitch_6a
    invoke-static {v2, p0, v1, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->byteCompaction(I[ILjava/nio/charset/Charset;ILjava/lang/StringBuilder;)I

    move-result v3

    goto :goto_7e

    :pswitch_6f
    invoke-static {p0, v3, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result v3

    goto :goto_7e

    :cond_74
    add-int/lit8 v5, v3, 0x1

    aget v3, p0, v3

    int-to-char v3, v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    nop

    :goto_7d
    move v3, v5

    :goto_7e
    array-length v5, p0

    if-ge v3, v5, :cond_88

    add-int/lit8 v5, v3, 0x1

    aget v2, p0, v3

    nop

    move v3, v5

    goto :goto_14

    :cond_88
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    nop

    :pswitch_data_8e
    .packed-switch 0x384
        :pswitch_6f
        :pswitch_6a
        :pswitch_65
    .end packed-switch

    :pswitch_data_98
    .packed-switch 0x39a
        :pswitch_60
        :pswitch_60
        :pswitch_6a
        :pswitch_5d
        :pswitch_5a
        :pswitch_48
        :pswitch_43
    .end packed-switch
.end method

.method private static decodeBase900toBase10([II)Ljava/lang/String;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    sget-object v0, Ljava/math/BigInteger;->ZERO:Ljava/math/BigInteger;

    const/4 v1, 0x0

    :goto_3
    const/4 v2, 0x1

    if-lt v1, p1, :cond_1d

    invoke-virtual {v0}, Ljava/math/BigInteger;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x31

    if-ne v3, v4, :cond_18

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_18
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v2

    throw v2

    :cond_1d
    sget-object v3, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->EXP900:[Ljava/math/BigInteger;

    sub-int v4, p1, v1

    sub-int/2addr v4, v2

    aget-object v2, v3, v4

    aget v3, p0, v1

    int-to-long v3, v3

    invoke-static {v3, v4}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->add(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    add-int/lit8 v1, v1, 0x1

    goto :goto_3
.end method

.method private static decodeMacroBlock([IILcom/google/zxing/pdf417/PDF417ResultMetadata;)I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    add-int/lit8 v0, p1, 0x2

    const/4 v1, 0x0

    aget v2, p0, v1

    if-gt v0, v2, :cond_7e

    const/4 v0, 0x2

    new-array v2, v0, [I

    const/4 v3, 0x0

    :goto_b
    if-lt v3, v0, :cond_75

    nop

    nop

    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setSegmentIndex(I)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->textCompaction([IILjava/lang/StringBuilder;)I

    move-result p1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setFileId(Ljava/lang/String;)V

    aget v3, p0, p1

    const/16 v4, 0x39b

    const/16 v5, 0x39a

    const/4 v6, 0x1

    if-ne v3, v4, :cond_6b

    add-int/lit8 p1, p1, 0x1

    aget v3, p0, v1

    sub-int/2addr v3, p1

    new-array v3, v3, [I

    const/4 v4, 0x0

    const/4 v7, 0x0

    :goto_3c
    aget v8, p0, v1

    if-ge p1, v8, :cond_63

    if-eqz v7, :cond_43

    goto :goto_63

    :cond_43
    add-int/lit8 v8, p1, 0x1

    aget p1, p0, p1

    const/16 v9, 0x384

    if-ge p1, v9, :cond_53

    add-int/lit8 v9, v4, 0x1

    aput p1, v3, v4

    nop

    move p1, v8

    move v4, v9

    goto :goto_3c

    :cond_53
    if-ne p1, v5, :cond_5e

    invoke-virtual {p2, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    add-int/lit8 v8, v8, 0x1

    const/4 v7, 0x1

    nop

    move p1, v8

    goto :goto_3c

    :cond_5e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :cond_63
    :goto_63
    invoke-static {v3, v4}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setOptionalData([I)V

    goto :goto_74

    :cond_6b
    aget v1, p0, p1

    if-ne v1, v5, :cond_74

    invoke-virtual {p2, v6}, Lcom/google/zxing/pdf417/PDF417ResultMetadata;->setLastSegment(Z)V

    add-int/lit8 p1, p1, 0x1

    :cond_74
    :goto_74
    return p1

    :cond_75
    aget v4, p0, p1

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 p1, p1, 0x1

    goto :goto_b

    :cond_7e
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeTextCompaction([I[IILjava/lang/StringBuilder;)V
    .registers 19

    move-object/from16 v0, p3

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    sget-object v2, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    const/4 v3, 0x0

    :goto_7
    move/from16 v4, p2

    if-lt v3, v4, :cond_c

    return-void

    :cond_c
    aget v5, p0, v3

    const/4 v6, 0x0

    invoke-static {}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$pdf417$decoder$DecodedBitStreamParser$Mode()[I

    move-result-object v7

    invoke-virtual {v1}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v8

    aget v7, v7, v8

    const/16 v8, 0x41

    const/16 v10, 0x1b

    const/16 v11, 0x391

    const/16 v12, 0x384

    const/16 v13, 0x1a

    const/16 v9, 0x1d

    packed-switch v7, :pswitch_data_116

    goto/16 :goto_10c

    :pswitch_2a
    move-object v1, v2

    if-ge v5, v9, :cond_33

    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v6, v7, v5

    goto/16 :goto_10c

    :cond_33
    if-ne v5, v9, :cond_39

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_39
    if-ne v5, v11, :cond_43

    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_10c

    :cond_43
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :pswitch_49
    move-object v1, v2

    if-ge v5, v13, :cond_50

    add-int/2addr v8, v5

    int-to-char v6, v8

    goto/16 :goto_10c

    :cond_50
    if-ne v5, v13, :cond_56

    const/16 v6, 0x20

    goto/16 :goto_10c

    :cond_56
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :pswitch_5c
    if-ge v5, v9, :cond_64

    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->PUNCT_CHARS:[C

    aget-char v6, v7, v5

    goto/16 :goto_10c

    :cond_64
    if-ne v5, v9, :cond_6a

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_6a
    if-ne v5, v11, :cond_74

    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_10c

    :cond_74
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :pswitch_7a
    const/16 v7, 0x19

    if-ge v5, v7, :cond_84

    sget-object v7, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->MIXED_CHARS:[C

    aget-char v6, v7, v5

    goto/16 :goto_10c

    :cond_84
    if-ne v5, v7, :cond_8a

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_8a
    if-ne v5, v13, :cond_90

    const/16 v6, 0x20

    goto/16 :goto_10c

    :cond_90
    if-ne v5, v10, :cond_96

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_96
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_9e

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_9e
    if-ne v5, v9, :cond_a5

    move-object v2, v1

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :cond_a5
    if-ne v5, v11, :cond_af

    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_10c

    :cond_af
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto/16 :goto_10c

    :pswitch_b5
    if-ge v5, v13, :cond_bc

    const/16 v7, 0x61

    add-int/2addr v7, v5

    int-to-char v6, v7

    goto :goto_10c

    :cond_bc
    if-ne v5, v13, :cond_c1

    const/16 v6, 0x20

    goto :goto_10c

    :cond_c1
    if-ne v5, v10, :cond_c7

    move-object v2, v1

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_c7
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_ce

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_ce
    if-ne v5, v9, :cond_d4

    move-object v2, v1

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_d4
    if-ne v5, v11, :cond_dd

    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_10c

    :cond_dd
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :pswitch_e2
    if-ge v5, v13, :cond_e7

    add-int/2addr v8, v5

    int-to-char v6, v8

    goto :goto_10c

    :cond_e7
    if-ne v5, v13, :cond_ec

    const/16 v6, 0x20

    goto :goto_10c

    :cond_ec
    if-ne v5, v10, :cond_f1

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->LOWER:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_f1
    const/16 v7, 0x1c

    if-ne v5, v7, :cond_f8

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->MIXED:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_f8
    if-ne v5, v9, :cond_fe

    move-object v2, v1

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->PUNCT_SHIFT:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    goto :goto_10c

    :cond_fe
    if-ne v5, v11, :cond_107

    aget v7, p1, v3

    int-to-char v7, v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_10c

    :cond_107
    if-ne v5, v12, :cond_10c

    sget-object v1, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;->ALPHA:Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser$Mode;

    nop

    :cond_10c
    :goto_10c
    if-eqz v6, :cond_111

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_111
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_7

    nop

    :pswitch_data_116
    .packed-switch 0x1
        :pswitch_e2
        :pswitch_b5
        :pswitch_7a
        :pswitch_5c
        :pswitch_49
        :pswitch_2a
    .end packed-switch
.end method

.method private static numericCompaction([IILjava/lang/StringBuilder;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/16 v2, 0xf

    new-array v2, v2, [I

    :goto_6
    const/4 v3, 0x0

    aget v4, p0, v3

    if-ge p1, v4, :cond_4f

    if-eqz v1, :cond_e

    goto :goto_4f

    :cond_e
    add-int/lit8 v4, p1, 0x1

    aget p1, p0, p1

    aget v3, p0, v3

    if-ne v4, v3, :cond_17

    const/4 v1, 0x1

    :cond_17
    const/16 v3, 0x384

    if-ge p1, v3, :cond_20

    aput p1, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_39

    :cond_20
    if-eq p1, v3, :cond_36

    const/16 v3, 0x385

    if-eq p1, v3, :cond_36

    const/16 v3, 0x39c

    if-eq p1, v3, :cond_36

    const/16 v3, 0x3a0

    if-eq p1, v3, :cond_36

    const/16 v3, 0x39b

    if-eq p1, v3, :cond_36

    const/16 v3, 0x39a

    if-ne p1, v3, :cond_39

    :cond_36
    add-int/lit8 v4, v4, -0x1

    const/4 v1, 0x1

    :cond_39
    :goto_39
    rem-int/lit8 v3, v0, 0xf

    if-eqz v3, :cond_43

    const/16 v3, 0x386

    if-eq p1, v3, :cond_43

    if-eqz v1, :cond_4d

    :cond_43
    if-lez v0, :cond_4d

    invoke-static {v2, v0}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeBase900toBase10([II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    :cond_4d
    move p1, v4

    goto :goto_6

    :cond_4f
    :goto_4f
    return p1
.end method

.method private static textCompaction([IILjava/lang/StringBuilder;)I
    .registers 11

    const/4 v0, 0x0

    aget v1, p0, v0

    sub-int/2addr v1, p1

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [I

    aget v2, p0, v0

    sub-int/2addr v2, p1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_11
    aget v5, p0, v0

    if-ge p1, v5, :cond_56

    if-eqz v4, :cond_18

    goto :goto_56

    :cond_18
    add-int/lit8 v5, p1, 0x1

    aget p1, p0, p1

    const/16 v6, 0x384

    if-ge p1, v6, :cond_2f

    div-int/lit8 v6, p1, 0x1e

    aput v6, v1, v3

    add-int/lit8 v6, v3, 0x1

    rem-int/lit8 v7, p1, 0x1e

    aput v7, v1, v6

    add-int/lit8 v3, v3, 0x2

    nop

    :goto_2d
    move p1, v5

    goto :goto_11

    :cond_2f
    const/16 v7, 0x391

    if-eq p1, v7, :cond_4a

    const/16 v7, 0x3a0

    if-eq p1, v7, :cond_46

    packed-switch p1, :pswitch_data_5a

    packed-switch p1, :pswitch_data_64

    goto :goto_2d

    :pswitch_3e
    add-int/lit8 v7, v3, 0x1

    aput v6, v1, v3

    nop

    move p1, v5

    move v3, v7

    goto :goto_11

    :cond_46
    :pswitch_46
    add-int/lit8 v5, v5, -0x1

    const/4 v4, 0x1

    goto :goto_2d

    :cond_4a
    aput v7, v1, v3

    add-int/lit8 v6, v5, 0x1

    aget p1, p0, v5

    aput p1, v2, v3

    add-int/lit8 v3, v3, 0x1

    move p1, v6

    goto :goto_11

    :cond_56
    :goto_56
    invoke-static {v1, v2, v3, p2}, Lcom/google/zxing/pdf417/decoder/DecodedBitStreamParser;->decodeTextCompaction([I[IILjava/lang/StringBuilder;)V

    return p1

    :pswitch_data_5a
    .packed-switch 0x384
        :pswitch_3e
        :pswitch_46
        :pswitch_46
    .end packed-switch

    :pswitch_data_64
    .packed-switch 0x39a
        :pswitch_46
        :pswitch_46
        :pswitch_46
    .end packed-switch
.end method
