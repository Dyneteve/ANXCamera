.class public final Lcom/google/zxing/aztec/decoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/aztec/decoder/Decoder$Table;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

.field private static final DIGIT_TABLE:[Ljava/lang/String;

.field private static final LOWER_TABLE:[Ljava/lang/String;

.field private static final MIXED_TABLE:[Ljava/lang/String;

.field private static final PUNCT_TABLE:[Ljava/lang/String;

.field private static final UPPER_TABLE:[Ljava/lang/String;


# instance fields
.field private ddata:Lcom/google/zxing/aztec/AztecDetectorResult;


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[I
    .registers 3

    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-static {}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->values()[Lcom/google/zxing/aztec/decoder/Decoder$Table;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v1

    :goto_17
    :try_start_17
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    move-exception v1

    :goto_22
    :try_start_22
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->LOWER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

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
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->MIXED:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

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
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->PUNCT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_41} :catch_42

    goto :goto_43

    :catch_42
    move-exception v1

    :goto_43
    :try_start_43
    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    invoke-virtual {v1}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    move-exception v1

    :goto_4e
    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 33

    nop

    const-string v0, "CTRL_PS"

    const-string v1, " "

    const-string v2, "A"

    const-string v3, "B"

    const-string v4, "C"

    const-string v5, "D"

    const-string v6, "E"

    const-string v7, "F"

    const-string v8, "G"

    const-string v9, "H"

    const-string v10, "I"

    const-string v11, "J"

    const-string v12, "K"

    const-string v13, "L"

    const-string v14, "M"

    const-string v15, "N"

    const-string v16, "O"

    const-string v17, "P"

    const-string v18, "Q"

    const-string v19, "R"

    const-string v20, "S"

    const-string v21, "T"

    const-string v22, "U"

    const-string v23, "V"

    const-string v24, "W"

    const-string v25, "X"

    const-string v26, "Y"

    const-string v27, "Z"

    const-string v28, "CTRL_LL"

    const-string v29, "CTRL_ML"

    const-string v30, "CTRL_DL"

    const-string v31, "CTRL_BS"

    filled-new-array/range {v0 .. v31}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    nop

    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "a"

    const-string v4, "b"

    const-string v5, "c"

    const-string v6, "d"

    const-string v7, "e"

    const-string v8, "f"

    const-string v9, "g"

    const-string v10, "h"

    const-string v11, "i"

    const-string v12, "j"

    const-string v13, "k"

    const-string v14, "l"

    const-string v15, "m"

    const-string v16, "n"

    const-string v17, "o"

    const-string v18, "p"

    const-string v19, "q"

    const-string v20, "r"

    const-string v21, "s"

    const-string v22, "t"

    const-string v23, "u"

    const-string v24, "v"

    const-string v25, "w"

    const-string v26, "x"

    const-string v27, "y"

    const-string v28, "z"

    const-string v29, "CTRL_US"

    const-string v30, "CTRL_ML"

    const-string v31, "CTRL_DL"

    const-string v32, "CTRL_BS"

    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    nop

    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "\u0001"

    const-string v4, "\u0002"

    const-string v5, "\u0003"

    const-string v6, "\u0004"

    const-string v7, "\u0005"

    const-string v8, "\u0006"

    const-string v9, "\u0007"

    const-string v10, "\u0008"

    const-string v11, "\t"

    const-string v12, "\n"

    const-string v13, "\u000b"

    const-string v14, "\u000c"

    const-string v15, "\r"

    const-string v16, "\u001b"

    const-string v17, "\u001c"

    const-string v18, "\u001d"

    const-string v19, "\u001e"

    const-string v20, "\u001f"

    const-string v21, "@"

    const-string v22, "\\"

    const-string v23, "^"

    const-string v24, "_"

    const-string v25, "`"

    const-string v26, "|"

    const-string v27, "~"

    const-string v28, "\u007f"

    const-string v29, "CTRL_LL"

    const-string v30, "CTRL_UL"

    const-string v31, "CTRL_PL"

    const-string v32, "CTRL_BS"

    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    nop

    const-string v1, ""

    const-string v2, "\r"

    const-string v3, "\r\n"

    const-string v4, ". "

    const-string v5, ", "

    const-string v6, ": "

    const-string v7, "!"

    const-string v8, "\""

    const-string v9, "#"

    const-string v10, "$"

    const-string v11, "%"

    const-string v12, "&"

    const-string v13, "\'"

    const-string v14, "("

    const-string v15, ")"

    const-string v16, "*"

    const-string v17, "+"

    const-string v18, ","

    const-string v19, "-"

    const-string v20, "."

    const-string v21, "/"

    const-string v22, ":"

    const-string v23, ";"

    const-string v24, "<"

    const-string v25, "="

    const-string v26, ">"

    const-string v27, "?"

    const-string v28, "["

    const-string v29, "]"

    const-string v30, "{"

    const-string v31, "}"

    const-string v32, "CTRL_UL"

    filled-new-array/range {v1 .. v32}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    nop

    const-string v1, "CTRL_PS"

    const-string v2, " "

    const-string v3, "0"

    const-string v4, "1"

    const-string v5, "2"

    const-string v6, "3"

    const-string v7, "4"

    const-string v8, "5"

    const-string v9, "6"

    const-string v10, "7"

    const-string v11, "8"

    const-string v12, "9"

    const-string v13, ","

    const-string v14, "."

    const-string v15, "CTRL_UL"

    const-string v16, "CTRL_US"

    filled-new-array/range {v1 .. v16}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private correctBits([Z)[Z
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/4 v3, 0x2

    if-gt v0, v3, :cond_13

    const/4 v0, 0x6

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_6:Lcom/google/zxing/common/reedsolomon/GenericGF;

    nop

    :goto_11
    move v4, v0

    goto :goto_36

    :cond_13
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/16 v3, 0x8

    if-gt v0, v3, :cond_22

    const/16 v0, 0x8

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_8:Lcom/google/zxing/common/reedsolomon/GenericGF;

    goto :goto_11

    :cond_22
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v0

    const/16 v3, 0x16

    if-gt v0, v3, :cond_31

    const/16 v0, 0xa

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_10:Lcom/google/zxing/common/reedsolomon/GenericGF;

    goto :goto_11

    :cond_31
    const/16 v0, 0xc

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->AZTEC_DATA_12:Lcom/google/zxing/common/reedsolomon/GenericGF;

    goto :goto_11

    :goto_36
    iget-object v0, v1, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v0}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbDatablocks()I

    move-result v5

    array-length v0, v2

    div-int v6, v0, v4

    if-lt v6, v5, :cond_d0

    array-length v0, v2

    rem-int/2addr v0, v4

    sub-int v7, v6, v5

    new-array v8, v6, [I

    const/4 v9, 0x0

    move v10, v0

    :goto_49
    if-lt v9, v6, :cond_c3

    :try_start_4b
    new-instance v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;

    invoke-direct {v0, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    invoke-virtual {v0, v8, v7}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->decode([II)V
    :try_end_53
    .catch Lcom/google/zxing/common/reedsolomon/ReedSolomonException; {:try_start_4b .. :try_end_53} :catch_bd

    nop

    const/4 v0, 0x1

    shl-int v9, v0, v4

    sub-int/2addr v9, v0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_5a
    if-lt v12, v5, :cond_a3

    mul-int v12, v5, v4

    sub-int/2addr v12, v11

    new-array v13, v12, [Z

    const/4 v12, 0x0

    const/4 v14, 0x0

    :goto_63
    if-lt v14, v5, :cond_66

    return-object v13

    :cond_66
    aget v15, v8, v14

    const/16 v16, 0x0

    if-eq v15, v0, :cond_8c

    add-int/lit8 v0, v9, -0x1

    if-ne v15, v0, :cond_71

    goto :goto_8c

    :cond_71
    add-int/lit8 v0, v4, -0x1

    :goto_73
    if-gez v0, :cond_76

    goto :goto_9d

    :cond_76
    add-int/lit8 v18, v12, 0x1

    const/16 v17, 0x1

    shl-int v19, v17, v0

    and-int v19, v15, v19

    if-eqz v19, :cond_83

    const/16 v19, 0x1

    goto :goto_85

    :cond_83
    move/from16 v19, v16

    :goto_85
    aput-boolean v19, v13, v12

    add-int/lit8 v0, v0, -0x1

    move/from16 v12, v18

    goto :goto_73

    :cond_8c
    :goto_8c
    add-int v0, v12, v4

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le v15, v1, :cond_94

    const/4 v1, 0x1

    goto :goto_96

    :cond_94
    move/from16 v1, v16

    :goto_96
    invoke-static {v13, v12, v0, v1}, Ljava/util/Arrays;->fill([ZIIZ)V

    add-int/lit8 v0, v4, -0x1

    add-int/2addr v12, v0

    nop

    :goto_9d
    add-int/lit8 v14, v14, 0x1

    const/4 v0, 0x1

    move-object/from16 v1, p0

    goto :goto_63

    :cond_a3
    aget v0, v8, v12

    if-eqz v0, :cond_b8

    if-eq v0, v9, :cond_b8

    const/4 v1, 0x1

    if-eq v0, v1, :cond_b0

    add-int/lit8 v13, v9, -0x1

    if-ne v0, v13, :cond_b2

    :cond_b0
    add-int/lit8 v11, v11, 0x1

    :cond_b2
    add-int/lit8 v12, v12, 0x1

    move v0, v1

    move-object/from16 v1, p0

    goto :goto_5a

    :cond_b8
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :catch_bd
    move-exception v0

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :cond_c3
    invoke-static {v2, v10, v4}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v0

    aput v0, v8, v9

    add-int/lit8 v9, v9, 0x1

    add-int/2addr v10, v4

    move-object/from16 v1, p0

    goto/16 :goto_49

    :cond_d0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static getCharacter(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;
    .registers 4

    invoke-static {}, Lcom/google/zxing/aztec/decoder/Decoder;->$SWITCH_TABLE$com$google$zxing$aztec$decoder$Decoder$Table()[I

    move-result-object v0

    invoke-virtual {p0}, Lcom/google/zxing/aztec/decoder/Decoder$Table;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_2e

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Bad table"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_15
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->PUNCT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_1a
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->DIGIT_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_1f
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->MIXED_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_24
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->LOWER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_29
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder;->UPPER_TABLE:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0

    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_29
        :pswitch_24
        :pswitch_1f
        :pswitch_1a
        :pswitch_15
    .end packed-switch
.end method

.method private static getEncodedData([Z)Ljava/lang/String;
    .registers 11

    array-length v0, p0

    sget-object v1, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    sget-object v2, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    new-instance v3, Ljava/lang/StringBuilder;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v4, 0x0

    :cond_d
    :goto_d
    if-lt v4, v0, :cond_10

    goto :goto_58

    :cond_10
    sget-object v5, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    const/4 v6, 0x5

    if-ne v2, v5, :cond_4c

    sub-int v5, v0, v4

    if-ge v5, v6, :cond_1a

    goto :goto_58

    :cond_1a
    invoke-static {p0, v4, v6}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v5

    add-int/lit8 v4, v4, 0x5

    if-nez v5, :cond_31

    sub-int v6, v0, v4

    const/16 v7, 0xb

    if-ge v6, v7, :cond_29

    goto :goto_58

    :cond_29
    invoke-static {p0, v4, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v6

    add-int/lit8 v5, v6, 0x1f

    add-int/lit8 v4, v4, 0xb

    :cond_31
    const/4 v6, 0x0

    :goto_32
    if-lt v6, v5, :cond_35

    goto :goto_3d

    :cond_35
    sub-int v7, v0, v4

    const/16 v8, 0x8

    if-ge v7, v8, :cond_3f

    move v4, v0

    nop

    :goto_3d
    move-object v2, v1

    goto :goto_d

    :cond_3f
    invoke-static {p0, v4, v8}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v7

    int-to-char v8, v7

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x8

    add-int/lit8 v6, v6, 0x1

    goto :goto_32

    :cond_4c
    sget-object v5, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    if-ne v2, v5, :cond_52

    const/4 v5, 0x4

    goto :goto_53

    :cond_52
    move v5, v6

    :goto_53
    sub-int v7, v0, v4

    if-ge v7, v5, :cond_5d

    nop

    :goto_58
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    :cond_5d
    invoke-static {p0, v4, v5}, Lcom/google/zxing/aztec/decoder/Decoder;->readCode([ZII)I

    move-result v7

    add-int/2addr v4, v5

    invoke-static {v2, v7}, Lcom/google/zxing/aztec/decoder/Decoder;->getCharacter(Lcom/google/zxing/aztec/decoder/Decoder$Table;I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "CTRL_"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_81

    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-static {v6}, Lcom/google/zxing/aztec/decoder/Decoder;->getTable(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;

    move-result-object v2

    const/4 v6, 0x6

    invoke-virtual {v8, v6}, Ljava/lang/String;->charAt(I)C

    move-result v6

    const/16 v9, 0x4c

    if-ne v6, v9, :cond_d

    move-object v1, v2

    goto :goto_d

    :cond_81
    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v2, v1

    goto :goto_d
.end method

.method private static getTable(C)Lcom/google/zxing/aztec/decoder/Decoder$Table;
    .registers 2

    const/16 v0, 0x42

    if-eq p0, v0, :cond_1e

    const/16 v0, 0x44

    if-eq p0, v0, :cond_1b

    const/16 v0, 0x50

    if-eq p0, v0, :cond_18

    packed-switch p0, :pswitch_data_22

    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->UPPER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    :pswitch_12
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->MIXED:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    :pswitch_15
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->LOWER:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    :cond_18
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->PUNCT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    :cond_1b
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->DIGIT:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    :cond_1e
    sget-object v0, Lcom/google/zxing/aztec/decoder/Decoder$Table;->BINARY:Lcom/google/zxing/aztec/decoder/Decoder$Table;

    return-object v0

    nop

    :pswitch_data_22
    .packed-switch 0x4c
        :pswitch_15
        :pswitch_12
    .end packed-switch
.end method

.method public static highLevelDecode([Z)Ljava/lang/String;
    .registers 2

    invoke-static {p0}, Lcom/google/zxing/aztec/decoder/Decoder;->getEncodedData([Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static readCode([ZII)I
    .registers 6

    const/4 v0, 0x0

    move v1, p1

    :goto_2
    add-int v2, p1, p2

    if-lt v1, v2, :cond_7

    return v0

    :cond_7
    shl-int/lit8 v0, v0, 0x1

    aget-boolean v2, p0, v1

    if-eqz v2, :cond_f

    or-int/lit8 v0, v0, 0x1

    :cond_f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
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


# virtual methods
.method public decode(Lcom/google/zxing/aztec/AztecDetectorResult;)Lcom/google/zxing/common/DecoderResult;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    iput-object p1, p0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {p1}, Lcom/google/zxing/aztec/AztecDetectorResult;->getBits()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->extractBits(Lcom/google/zxing/common/BitMatrix;)[Z

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/google/zxing/aztec/decoder/Decoder;->correctBits([Z)[Z

    move-result-object v2

    invoke-static {v2}, Lcom/google/zxing/aztec/decoder/Decoder;->getEncodedData([Z)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/google/zxing/common/DecoderResult;

    const/4 v5, 0x0

    invoke-direct {v4, v5, v3, v5, v5}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v4
.end method

.method extractBits(Lcom/google/zxing/common/BitMatrix;)[Z
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v2}, Lcom/google/zxing/aztec/AztecDetectorResult;->isCompact()Z

    move-result v2

    iget-object v3, v0, Lcom/google/zxing/aztec/decoder/Decoder;->ddata:Lcom/google/zxing/aztec/AztecDetectorResult;

    invoke-virtual {v3}, Lcom/google/zxing/aztec/AztecDetectorResult;->getNbLayers()I

    move-result v3

    if-eqz v2, :cond_18

    const/16 v4, 0xb

    :goto_14
    mul-int/lit8 v5, v3, 0x4

    add-int/2addr v4, v5

    goto :goto_1b

    :cond_18
    const/16 v4, 0xe

    goto :goto_14

    :goto_1b
    new-array v5, v4, [I

    invoke-static {v3, v2}, Lcom/google/zxing/aztec/decoder/Decoder;->totalBitsInLayer(IZ)I

    move-result v6

    new-array v6, v6, [Z

    const/4 v7, 0x2

    if-eqz v2, :cond_30

    const/4 v8, 0x0

    :goto_27
    array-length v9, v5

    if-lt v8, v9, :cond_2b

    goto :goto_41

    :cond_2b
    aput v8, v5, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_27

    :cond_30
    add-int/lit8 v8, v4, 0x1

    div-int/lit8 v9, v4, 0x2

    add-int/lit8 v9, v9, -0x1

    div-int/lit8 v9, v9, 0xf

    mul-int/2addr v9, v7

    add-int/2addr v8, v9

    div-int/lit8 v9, v4, 0x2

    div-int/lit8 v10, v8, 0x2

    const/4 v11, 0x0

    :goto_3f
    if-lt v11, v9, :cond_c0

    :goto_41
    const/4 v8, 0x0

    const/4 v9, 0x0

    move v12, v8

    move v13, v9

    :goto_45
    if-lt v12, v3, :cond_48

    return-object v6

    :cond_48
    const/4 v14, 0x4

    if-eqz v2, :cond_51

    sub-int v8, v3, v12

    mul-int/2addr v8, v14

    add-int/lit8 v8, v8, 0x9

    goto :goto_56

    :cond_51
    sub-int v8, v3, v12

    mul-int/2addr v8, v14

    add-int/lit8 v8, v8, 0xc

    :goto_56
    move v15, v8

    mul-int/lit8 v16, v12, 0x2

    add-int/lit8 v8, v4, -0x1

    sub-int v17, v8, v16

    const/4 v8, 0x0

    :goto_5e
    if-lt v8, v15, :cond_66

    mul-int/lit8 v8, v15, 0x8

    add-int/2addr v13, v8

    add-int/lit8 v12, v12, 0x1

    goto :goto_45

    :cond_66
    mul-int/lit8 v18, v8, 0x2

    const/4 v9, 0x0

    :goto_69
    if-lt v9, v7, :cond_6e

    add-int/lit8 v8, v8, 0x1

    goto :goto_5e

    :cond_6e
    add-int v10, v13, v18

    add-int/2addr v10, v9

    add-int v11, v16, v9

    aget v11, v5, v11

    add-int v19, v16, v8

    aget v14, v5, v19

    invoke-virtual {v1, v11, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    aput-boolean v11, v6, v10

    mul-int v10, v7, v15

    add-int/2addr v10, v13

    add-int v10, v10, v18

    add-int/2addr v10, v9

    add-int v11, v16, v8

    aget v11, v5, v11

    sub-int v14, v17, v9

    aget v14, v5, v14

    invoke-virtual {v1, v11, v14}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v11

    aput-boolean v11, v6, v10

    const/4 v14, 0x4

    mul-int v10, v14, v15

    add-int/2addr v10, v13

    add-int v10, v10, v18

    add-int/2addr v10, v9

    sub-int v11, v17, v9

    aget v11, v5, v11

    sub-int v19, v17, v8

    aget v7, v5, v19

    invoke-virtual {v1, v11, v7}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v7

    aput-boolean v7, v6, v10

    const/4 v7, 0x6

    mul-int/2addr v7, v15

    add-int/2addr v7, v13

    add-int v7, v7, v18

    add-int/2addr v7, v9

    sub-int v10, v17, v8

    aget v10, v5, v10

    add-int v11, v16, v9

    aget v11, v5, v11

    invoke-virtual {v1, v10, v11}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v10

    aput-boolean v10, v6, v7

    add-int/lit8 v9, v9, 0x1

    const/4 v7, 0x2

    goto :goto_69

    :cond_c0
    div-int/lit8 v7, v11, 0xf

    add-int/2addr v7, v11

    sub-int v12, v9, v11

    add-int/lit8 v12, v12, -0x1

    sub-int v13, v10, v7

    add-int/lit8 v13, v13, -0x1

    aput v13, v5, v12

    add-int v12, v9, v11

    add-int v13, v10, v7

    add-int/lit8 v13, v13, 0x1

    aput v13, v5, v12

    add-int/lit8 v11, v11, 0x1

    const/4 v7, 0x2

    goto/16 :goto_3f
.end method
