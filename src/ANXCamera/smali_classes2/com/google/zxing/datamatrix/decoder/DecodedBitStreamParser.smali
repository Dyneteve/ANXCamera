.class final Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "DecodedBitStreamParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

.field private static final C40_BASIC_SET_CHARS:[C

.field private static final C40_SHIFT2_SET_CHARS:[C

.field private static final TEXT_BASIC_SET_CHARS:[C

.field private static final TEXT_SHIFT3_SET_CHARS:[C


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode()[I
    .registers 3

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-static {}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->values()[Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ANSIX12_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v1

    :goto_17
    :try_start_17
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_20} :catch_21

    goto :goto_22

    :catch_21
    move-exception v1

    :goto_22
    :try_start_22
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->BASE256_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception v1

    :goto_2d
    :try_start_2d
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->C40_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

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
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->EDIFACT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_41
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_41} :catch_42

    goto :goto_43

    :catch_42
    move-exception v1

    :goto_43
    :try_start_43
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_4c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4c} :catch_4d

    goto :goto_4e

    :catch_4d
    move-exception v1

    :goto_4e
    :try_start_4e
    sget-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->TEXT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    invoke-virtual {v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_57
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4e .. :try_end_57} :catch_58

    goto :goto_59

    :catch_58
    move-exception v1

    :goto_59
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 2

    const/16 v0, 0x28

    new-array v1, v0, [C

    fill-array-data v1, :array_2e

    nop

    nop

    nop

    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    const/16 v1, 0x1b

    new-array v1, v1, [C

    fill-array-data v1, :array_5a

    nop

    nop

    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    new-array v0, v0, [C

    fill-array-data v0, :array_7a

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    const/16 v0, 0x20

    new-array v0, v0, [C

    fill-array-data v0, :array_a6

    nop

    nop

    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    return-void

    nop

    :array_2e
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
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
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
    .end array-data

    :array_5a
    .array-data 2
        0x21s
        0x22s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5es
        0x5fs
    .end array-data

    nop

    :array_7a
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
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
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data

    :array_a6
    .array-data 2
        0x60s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x7fs
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static decode([B)Lcom/google/zxing/common/DecoderResult;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    new-instance v0, Lcom/google/zxing/common/BitSource;

    invoke-direct {v0, p0}, Lcom/google/zxing/common/BitSource;-><init>([B)V

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v2, 0x64

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    new-instance v3, Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    :cond_1a
    sget-object v5, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    if-ne v4, v5, :cond_23

    invoke-static {v0, v1, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeAsciiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    move-result-object v4

    goto :goto_4b

    :cond_23
    invoke-static {}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->$SWITCH_TABLE$com$google$zxing$datamatrix$decoder$DecodedBitStreamParser$Mode()[I

    move-result-object v5

    invoke-virtual {v4}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_72

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v5

    throw v5

    :pswitch_35
    invoke-static {v0, v1, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeBase256Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/util/Collection;)V

    goto :goto_49

    :pswitch_39
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeEdifactSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    goto :goto_49

    :pswitch_3d
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeAnsiX12Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    goto :goto_49

    :pswitch_41
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeTextSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    goto :goto_49

    :pswitch_45
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->decodeC40Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V

    nop

    :goto_49
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    :goto_4b
    sget-object v5, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    if-eq v4, v5, :cond_55

    invoke-virtual {v0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v5

    if-gtz v5, :cond_1a

    :cond_55
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    if-lez v5, :cond_5e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    :cond_5e
    new-instance v5, Lcom/google/zxing/common/DecoderResult;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_6d

    move-object v7, v8

    goto :goto_6e

    :cond_6d
    move-object v7, v3

    :goto_6e
    invoke-direct {v5, p0, v6, v7, v8}, Lcom/google/zxing/common/DecoderResult;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v5

    :pswitch_data_72
    .packed-switch 0x3
        :pswitch_45
        :pswitch_41
        :pswitch_3d
        :pswitch_39
        :pswitch_35
    .end packed-switch
.end method

.method private static decodeAnsiX12Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x3

    new-array v1, v0, [I

    :cond_3
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_c

    return-void

    :cond_c
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    const/16 v4, 0xfe

    if-ne v2, v4, :cond_15

    return-void

    :cond_15
    invoke-virtual {p0, v3}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v3

    invoke-static {v2, v3, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    const/4 v3, 0x0

    :goto_1d
    if-lt v3, v0, :cond_26

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    if-gtz v2, :cond_3

    return-void

    :cond_26
    aget v4, v1, v3

    if-nez v4, :cond_30

    const/16 v5, 0xd

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_60

    :cond_30
    const/4 v5, 0x1

    if-ne v4, v5, :cond_39

    const/16 v5, 0x2a

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_60

    :cond_39
    const/4 v5, 0x2

    if-ne v4, v5, :cond_42

    const/16 v5, 0x3e

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_60

    :cond_42
    if-ne v4, v0, :cond_4a

    const/16 v5, 0x20

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_60

    :cond_4a
    const/16 v5, 0xe

    if-ge v4, v5, :cond_55

    add-int/lit8 v5, v4, 0x2c

    int-to-char v5, v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_60

    :cond_55
    const/16 v5, 0x28

    if-ge v4, v5, :cond_63

    add-int/lit8 v5, v4, 0x33

    int-to-char v5, v5

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    nop

    :goto_60
    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_63
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeAsciiSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    :cond_2
    const/16 v2, 0x8

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    if-eqz v2, :cond_b0

    const/16 v3, 0x80

    if-gt v2, v3, :cond_1b

    if-eqz v1, :cond_12

    add-int/lit16 v2, v2, 0x80

    :cond_12
    add-int/lit8 v0, v2, -0x1

    int-to-char v0, v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_1b
    const/16 v3, 0x81

    if-ne v2, v3, :cond_22

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_22
    const/16 v3, 0xe5

    if-gt v2, v3, :cond_36

    add-int/lit16 v3, v2, -0x82

    const/16 v4, 0xa

    if-ge v3, v4, :cond_31

    const/16 v4, 0x30

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_31
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto/16 :goto_a7

    :cond_36
    const/16 v3, 0xe6

    if-ne v2, v3, :cond_3d

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->C40_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_3d
    const/16 v3, 0xe7

    if-ne v2, v3, :cond_44

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->BASE256_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_44
    const/16 v3, 0xe8

    if-ne v2, v3, :cond_4e

    const/16 v3, 0x1d

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a7

    :cond_4e
    const/16 v3, 0xe9

    if-eq v2, v3, :cond_a7

    const/16 v3, 0xea

    if-eq v2, v3, :cond_a7

    const/16 v3, 0xeb

    if-ne v2, v3, :cond_5c

    const/4 v1, 0x1

    goto :goto_a7

    :cond_5c
    const/16 v3, 0xec

    if-ne v2, v3, :cond_6b

    const-string v3, "[)>\u001e05\u001d"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\u001e\u0004"

    invoke-virtual {p2, v0, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a7

    :cond_6b
    const/16 v3, 0xed

    if-ne v2, v3, :cond_7a

    const-string v3, "[)>\u001e06\u001d"

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\u001e\u0004"

    invoke-virtual {p2, v0, v3}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_a7

    :cond_7a
    const/16 v3, 0xee

    if-ne v2, v3, :cond_81

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ANSIX12_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_81
    const/16 v3, 0xef

    if-ne v2, v3, :cond_88

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->TEXT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_88
    const/16 v3, 0xf0

    if-ne v2, v3, :cond_8f

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->EDIFACT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_8f
    const/16 v3, 0xf1

    if-eq v2, v3, :cond_a7

    const/16 v3, 0xf2

    if-lt v2, v3, :cond_a7

    const/16 v3, 0xfe

    if-ne v2, v3, :cond_a2

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v3

    if-nez v3, :cond_a2

    goto :goto_a7

    :cond_a2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :cond_a7
    :goto_a7
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    if-gtz v2, :cond_2

    sget-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    return-object v0

    :cond_b0
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeBase256Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;Ljava/util/Collection;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitSource;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Collection<",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->getByteOffset()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v1, v0

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v2

    add-int/lit8 v3, v1, 0x1

    invoke-static {v2, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v1

    if-nez v1, :cond_1a

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v2

    div-int/2addr v2, v0

    goto :goto_2f

    :cond_1a
    const/16 v2, 0xfa

    if-ge v1, v2, :cond_20

    move v2, v1

    goto :goto_2f

    :cond_20
    add-int/lit16 v4, v1, -0xf9

    mul-int/2addr v2, v4

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    add-int/lit8 v5, v3, 0x1

    invoke-static {v4, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v3

    add-int/2addr v2, v3

    move v3, v5

    :goto_2f
    if-ltz v2, :cond_76

    new-array v4, v2, [B

    const/4 v5, 0x0

    :goto_34
    if-lt v5, v2, :cond_5a

    invoke-interface {p2, v4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :try_start_39
    new-instance v0, Ljava/lang/String;

    const-string v5, "ISO8859_1"

    invoke-direct {v0, v4, v5}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_43
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_39 .. :try_end_43} :catch_45

    nop

    return-void

    :catch_45
    move-exception v0

    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "Platform does not support required encoding: "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    :cond_5a
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v6

    if-lt v6, v0, :cond_71

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v6

    add-int/lit8 v7, v3, 0x1

    invoke-static {v6, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->unrandomize255State(II)I

    move-result v3

    int-to-byte v3, v3

    aput-byte v3, v4, v5

    add-int/lit8 v5, v5, 0x1

    move v3, v7

    goto :goto_34

    :cond_71
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0

    :cond_76
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method private static decodeC40Segment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x3

    new-array v2, v1, [I

    const/4 v3, 0x0

    :cond_5
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_e

    return-void

    :cond_e
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    const/16 v6, 0xfe

    if-ne v4, v6, :cond_17

    return-void

    :cond_17
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v5

    invoke-static {v4, v5, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    const/4 v5, 0x0

    :goto_1f
    if-lt v5, v1, :cond_28

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    if-gtz v4, :cond_5

    return-void

    :cond_28
    aget v6, v2, v5

    packed-switch v3, :pswitch_data_a8

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_32
    if-eqz v0, :cond_3c

    add-int/lit16 v7, v6, 0xe0

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_42

    :cond_3c
    add-int/lit8 v7, v6, 0x60

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_42
    const/4 v3, 0x0

    goto :goto_9e

    :pswitch_44
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_5b

    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    aget-char v7, v7, v6

    if-eqz v0, :cond_57

    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_6b

    :cond_57
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_6b

    :cond_5b
    const/16 v7, 0x1b

    if-ne v6, v7, :cond_65

    const/16 v7, 0x1d

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_6b

    :cond_65
    const/16 v7, 0x1e

    if-ne v6, v7, :cond_6d

    const/4 v0, 0x1

    nop

    :goto_6b
    const/4 v3, 0x0

    goto :goto_9e

    :cond_6d
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_72
    if-eqz v0, :cond_7c

    add-int/lit16 v7, v6, 0x80

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_80

    :cond_7c
    int-to-char v7, v6

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_80
    const/4 v3, 0x0

    goto :goto_9e

    :pswitch_82
    if-ge v6, v1, :cond_87

    add-int/lit8 v3, v6, 0x1

    goto :goto_9e

    :cond_87
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_a2

    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_BASIC_SET_CHARS:[C

    aget-char v7, v7, v6

    if-eqz v0, :cond_9a

    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_9e

    :cond_9a
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    nop

    :goto_9e
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1f

    :cond_a2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_82
        :pswitch_72
        :pswitch_44
        :pswitch_32
    .end packed-switch
.end method

.method private static decodeEdifactSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .registers 6

    :cond_0
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    const/16 v1, 0x10

    if-gt v0, v1, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x0

    :goto_a
    const/4 v1, 0x4

    if-lt v0, v1, :cond_14

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v0

    if-gtz v0, :cond_0

    return-void

    :cond_14
    const/4 v1, 0x6

    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v1

    const/16 v2, 0x1f

    if-ne v1, v2, :cond_2b

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->getBitOffset()I

    move-result v2

    const/16 v3, 0x8

    rsub-int/lit8 v2, v2, 0x8

    if-eq v2, v3, :cond_2a

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    :cond_2a
    return-void

    :cond_2b
    and-int/lit8 v2, v1, 0x20

    if-nez v2, :cond_31

    or-int/lit8 v1, v1, 0x40

    :cond_31
    int-to-char v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v0, v0, 0x1

    goto :goto_a
.end method

.method private static decodeTextSegment(Lcom/google/zxing/common/BitSource;Ljava/lang/StringBuilder;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x3

    new-array v2, v1, [I

    const/4 v3, 0x0

    :cond_5
    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    const/16 v5, 0x8

    if-ne v4, v5, :cond_e

    return-void

    :cond_e
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v4

    const/16 v6, 0xfe

    if-ne v4, v6, :cond_17

    return-void

    :cond_17
    invoke-virtual {p0, v5}, Lcom/google/zxing/common/BitSource;->readBits(I)I

    move-result v5

    invoke-static {v4, v5, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->parseTwoBytes(II[I)V

    const/4 v5, 0x0

    :goto_1f
    if-lt v5, v1, :cond_28

    invoke-virtual {p0}, Lcom/google/zxing/common/BitSource;->available()I

    move-result v4

    if-gtz v4, :cond_5

    return-void

    :cond_28
    aget v6, v2, v5

    packed-switch v3, :pswitch_data_b2

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_32
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_4a

    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_SHIFT3_SET_CHARS:[C

    aget-char v7, v7, v6

    if-eqz v0, :cond_45

    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_48

    :cond_45
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_48
    const/4 v3, 0x0

    goto :goto_a9

    :cond_4a
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_4f
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_66

    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->C40_SHIFT2_SET_CHARS:[C

    aget-char v7, v7, v6

    if-eqz v0, :cond_62

    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_76

    :cond_62
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_76

    :cond_66
    const/16 v7, 0x1b

    if-ne v6, v7, :cond_70

    const/16 v7, 0x1d

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_76

    :cond_70
    const/16 v7, 0x1e

    if-ne v6, v7, :cond_78

    const/4 v0, 0x1

    nop

    :goto_76
    const/4 v3, 0x0

    goto :goto_a9

    :cond_78
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_7d
    if-eqz v0, :cond_87

    add-int/lit16 v7, v6, 0x80

    int-to-char v7, v7

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_8b

    :cond_87
    int-to-char v7, v6

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_8b
    const/4 v3, 0x0

    goto :goto_a9

    :pswitch_8d
    if-ge v6, v1, :cond_92

    add-int/lit8 v3, v6, 0x1

    goto :goto_a9

    :cond_92
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    array-length v7, v7

    if-ge v6, v7, :cond_ad

    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->TEXT_BASIC_SET_CHARS:[C

    aget-char v7, v7, v6

    if-eqz v0, :cond_a5

    add-int/lit16 v8, v7, 0x80

    int-to-char v8, v8

    invoke-virtual {p1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    goto :goto_a9

    :cond_a5
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    nop

    :goto_a9
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_1f

    :cond_ad
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :pswitch_data_b2
    .packed-switch 0x0
        :pswitch_8d
        :pswitch_7d
        :pswitch_4f
        :pswitch_32
    .end packed-switch
.end method

.method private static parseTwoBytes(II[I)V
    .registers 7

    shl-int/lit8 v0, p0, 0x8

    add-int/2addr v0, p1

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    div-int/lit16 v2, v0, 0x640

    const/4 v3, 0x0

    aput v2, p2, v3

    mul-int/lit16 v3, v2, 0x640

    sub-int/2addr v0, v3

    div-int/lit8 v2, v0, 0x28

    aput v2, p2, v1

    mul-int/lit8 v1, v2, 0x28

    sub-int v1, v0, v1

    const/4 v3, 0x2

    aput v1, p2, v3

    return-void
.end method

.method private static unrandomize255State(II)I
    .registers 5

    const/16 v0, 0x95

    mul-int/2addr v0, p1

    rem-int/lit16 v0, v0, 0xff

    add-int/lit8 v0, v0, 0x1

    sub-int v1, p0, v0

    if-ltz v1, :cond_d

    move v2, v1

    goto :goto_f

    :cond_d
    add-int/lit16 v2, v1, 0x100

    :goto_f
    return v2
.end method
