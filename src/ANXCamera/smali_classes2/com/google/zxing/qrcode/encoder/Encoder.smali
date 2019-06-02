.class public final Lcom/google/zxing/qrcode/encoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field private static synthetic $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I = null

.field private static final ALPHANUMERIC_TABLE:[I

.field static final DEFAULT_BYTE_MODE_ENCODING:Ljava/lang/String; = "ISO-8859-1"


# direct methods
.method static synthetic $SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode()[I
    .registers 3

    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I

    if-eqz v0, :cond_5

    return-object v0

    :cond_5
    invoke-static {}, Lcom/google/zxing/qrcode/decoder/Mode;->values()[Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_c
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_15} :catch_16

    goto :goto_17

    :catch_16
    move-exception v1

    :goto_17
    :try_start_17
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

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
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_2b} :catch_2c

    goto :goto_2d

    :catch_2c
    move-exception v1

    :goto_2d
    :try_start_2d
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_FIRST_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_37
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_37} :catch_38

    goto :goto_39

    :catch_38
    move-exception v1

    :goto_39
    :try_start_39
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->FNC1_SECOND_POSITION:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_43
    .catch Ljava/lang/NoSuchFieldError; {:try_start_39 .. :try_end_43} :catch_44

    goto :goto_45

    :catch_44
    move-exception v1

    :goto_45
    :try_start_45
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->HANZI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_4f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_4f} :catch_50

    goto :goto_51

    :catch_50
    move-exception v1

    :goto_51
    :try_start_51
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_5a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_51 .. :try_end_5a} :catch_5b

    goto :goto_5c

    :catch_5b
    move-exception v1

    :goto_5c
    :try_start_5c
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_65
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5c .. :try_end_65} :catch_66

    goto :goto_67

    :catch_66
    move-exception v1

    :goto_67
    :try_start_67
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->STRUCTURED_APPEND:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_70
    .catch Ljava/lang/NoSuchFieldError; {:try_start_67 .. :try_end_70} :catch_71

    goto :goto_72

    :catch_71
    move-exception v1

    :goto_72
    :try_start_72
    sget-object v1, Lcom/google/zxing/qrcode/decoder/Mode;->TERMINATOR:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_7b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_72 .. :try_end_7b} :catch_7c

    goto :goto_7d

    :catch_7c
    move-exception v1

    :goto_7d
    sput-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode:[I

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 18

    const/16 v0, 0x60

    new-array v0, v0, [I

    const/4 v1, -0x1

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v3, 0x2

    aput v1, v0, v3

    const/4 v4, 0x3

    aput v1, v0, v4

    const/4 v5, 0x4

    aput v1, v0, v5

    const/4 v6, 0x5

    aput v1, v0, v6

    const/4 v7, 0x6

    aput v1, v0, v7

    const/4 v8, 0x7

    aput v1, v0, v8

    const/16 v9, 0x8

    aput v1, v0, v9

    const/16 v10, 0x9

    aput v1, v0, v10

    const/16 v11, 0xa

    aput v1, v0, v11

    const/16 v12, 0xb

    aput v1, v0, v12

    const/16 v13, 0xc

    aput v1, v0, v13

    const/16 v14, 0xd

    aput v1, v0, v14

    const/16 v15, 0xe

    aput v1, v0, v15

    const/16 v16, 0xf

    aput v1, v0, v16

    const/16 v16, 0x10

    aput v1, v0, v16

    const/16 v16, 0x11

    aput v1, v0, v16

    const/16 v16, 0x12

    aput v1, v0, v16

    const/16 v16, 0x13

    aput v1, v0, v16

    const/16 v16, 0x14

    aput v1, v0, v16

    const/16 v16, 0x15

    aput v1, v0, v16

    const/16 v16, 0x16

    aput v1, v0, v16

    const/16 v16, 0x17

    aput v1, v0, v16

    const/16 v16, 0x18

    aput v1, v0, v16

    const/16 v16, 0x19

    aput v1, v0, v16

    const/16 v16, 0x1a

    aput v1, v0, v16

    const/16 v16, 0x1b

    aput v1, v0, v16

    const/16 v16, 0x1c

    aput v1, v0, v16

    const/16 v16, 0x1d

    aput v1, v0, v16

    const/16 v16, 0x1e

    aput v1, v0, v16

    const/16 v16, 0x1f

    aput v1, v0, v16

    const/16 v16, 0x20

    const/16 v17, 0x24

    aput v17, v0, v16

    const/16 v16, 0x21

    aput v1, v0, v16

    const/16 v16, 0x22

    aput v1, v0, v16

    const/16 v16, 0x23

    aput v1, v0, v16

    const/16 v16, 0x24

    const/16 v17, 0x25

    aput v17, v0, v16

    const/16 v16, 0x25

    const/16 v17, 0x26

    aput v17, v0, v16

    const/16 v16, 0x26

    aput v1, v0, v16

    const/16 v16, 0x27

    aput v1, v0, v16

    const/16 v16, 0x28

    aput v1, v0, v16

    const/16 v16, 0x29

    aput v1, v0, v16

    const/16 v16, 0x2a

    const/16 v17, 0x27

    aput v17, v0, v16

    const/16 v16, 0x2b

    const/16 v17, 0x28

    aput v17, v0, v16

    const/16 v16, 0x2c

    aput v1, v0, v16

    const/16 v16, 0x2d

    const/16 v17, 0x29

    aput v17, v0, v16

    const/16 v16, 0x2e

    const/16 v17, 0x2a

    aput v17, v0, v16

    const/16 v16, 0x2f

    const/16 v17, 0x2b

    aput v17, v0, v16

    const/16 v16, 0x31

    aput v2, v0, v16

    const/16 v2, 0x32

    aput v3, v0, v2

    const/16 v2, 0x33

    aput v4, v0, v2

    const/16 v2, 0x34

    aput v5, v0, v2

    const/16 v2, 0x35

    aput v6, v0, v2

    const/16 v2, 0x36

    aput v7, v0, v2

    const/16 v2, 0x37

    aput v8, v0, v2

    const/16 v2, 0x38

    aput v9, v0, v2

    const/16 v2, 0x39

    aput v10, v0, v2

    const/16 v2, 0x3a

    const/16 v3, 0x2c

    aput v3, v0, v2

    const/16 v2, 0x3b

    aput v1, v0, v2

    const/16 v2, 0x3c

    aput v1, v0, v2

    const/16 v2, 0x3d

    aput v1, v0, v2

    const/16 v2, 0x3e

    aput v1, v0, v2

    const/16 v2, 0x3f

    aput v1, v0, v2

    const/16 v2, 0x40

    aput v1, v0, v2

    const/16 v2, 0x41

    aput v11, v0, v2

    const/16 v2, 0x42

    aput v12, v0, v2

    const/16 v2, 0x43

    aput v13, v0, v2

    const/16 v2, 0x44

    aput v14, v0, v2

    const/16 v2, 0x45

    aput v15, v0, v2

    const/16 v2, 0x46

    const/16 v3, 0xf

    aput v3, v0, v2

    const/16 v2, 0x47

    const/16 v3, 0x10

    aput v3, v0, v2

    const/16 v2, 0x48

    const/16 v3, 0x11

    aput v3, v0, v2

    const/16 v2, 0x49

    const/16 v3, 0x12

    aput v3, v0, v2

    const/16 v2, 0x4a

    const/16 v3, 0x13

    aput v3, v0, v2

    const/16 v2, 0x4b

    const/16 v3, 0x14

    aput v3, v0, v2

    const/16 v2, 0x4c

    const/16 v3, 0x15

    aput v3, v0, v2

    const/16 v2, 0x4d

    const/16 v3, 0x16

    aput v3, v0, v2

    const/16 v2, 0x4e

    const/16 v3, 0x17

    aput v3, v0, v2

    const/16 v2, 0x4f

    const/16 v3, 0x18

    aput v3, v0, v2

    const/16 v2, 0x50

    const/16 v3, 0x19

    aput v3, v0, v2

    const/16 v2, 0x51

    const/16 v3, 0x1a

    aput v3, v0, v2

    const/16 v2, 0x52

    const/16 v3, 0x1b

    aput v3, v0, v2

    const/16 v2, 0x53

    const/16 v3, 0x1c

    aput v3, v0, v2

    const/16 v2, 0x54

    const/16 v3, 0x1d

    aput v3, v0, v2

    const/16 v2, 0x55

    const/16 v3, 0x1e

    aput v3, v0, v2

    const/16 v2, 0x56

    const/16 v3, 0x1f

    aput v3, v0, v2

    const/16 v2, 0x57

    const/16 v3, 0x20

    aput v3, v0, v2

    const/16 v2, 0x58

    const/16 v3, 0x21

    aput v3, v0, v2

    const/16 v2, 0x59

    const/16 v3, 0x22

    aput v3, v0, v2

    const/16 v2, 0x5a

    const/16 v3, 0x23

    aput v3, v0, v2

    const/16 v2, 0x5b

    aput v1, v0, v2

    const/16 v2, 0x5c

    aput v1, v0, v2

    const/16 v2, 0x5d

    aput v1, v0, v2

    const/16 v2, 0x5e

    aput v1, v0, v2

    const/16 v2, 0x5f

    aput v1, v0, v2

    sput-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    :try_start_0
    invoke-virtual {p0, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_4} :catch_15

    nop

    nop

    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-lt v2, v1, :cond_b

    return-void

    :cond_b
    aget-byte v3, v0, v2

    const/16 v4, 0x8

    invoke-virtual {p1, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :catch_15
    move-exception v0

    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-lt v1, v0, :cond_8

    return-void

    :cond_8
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3b

    add-int/lit8 v4, v1, 0x1

    if-ge v4, v0, :cond_34

    add-int/lit8 v4, v1, 0x1

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    if-eq v4, v3, :cond_2e

    mul-int/lit8 v3, v2, 0x2d

    add-int/2addr v3, v4

    const/16 v5, 0xb

    invoke-virtual {p1, v3, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_5

    :cond_2e
    new-instance v3, Lcom/google/zxing/WriterException;

    invoke-direct {v3}, Lcom/google/zxing/WriterException;-><init>()V

    throw v3

    :cond_34
    const/4 v3, 0x6

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_3b
    new-instance v3, Lcom/google/zxing/WriterException;

    invoke-direct {v3}, Lcom/google/zxing/WriterException;-><init>()V

    throw v3
.end method

.method static appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-static {}, Lcom/google/zxing/qrcode/encoder/Encoder;->$SWITCH_TABLE$com$google$zxing$qrcode$decoder$Mode()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_33

    const/4 v1, 0x7

    if-eq v0, v1, :cond_2f

    packed-switch v0, :pswitch_data_38

    new-instance v0, Lcom/google/zxing/WriterException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid mode: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_27
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendAlphanumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    goto :goto_37

    :pswitch_2b
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V

    goto :goto_37

    :cond_2f
    invoke-static {p0, p2}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V

    goto :goto_37

    :cond_33
    invoke-static {p0, p2, p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->append8BitBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    nop

    :goto_37
    return-void

    :pswitch_data_38
    .packed-switch 0x2
        :pswitch_2b
        :pswitch_27
    .end packed-switch
.end method

.method private static appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V
    .registers 4

    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->ECI:Lcom/google/zxing/qrcode/decoder/Mode;

    invoke-virtual {v0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    invoke-virtual {p0}, Lcom/google/zxing/common/CharacterSetECI;->getValue()I

    move-result v0

    const/16 v1, 0x8

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    return-void
.end method

.method static appendKanjiBytes(Ljava/lang/String;Lcom/google/zxing/common/BitArray;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    :try_start_0
    const-string v0, "Shift_JIS"

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_6} :catch_51

    nop

    nop

    array-length v1, v0

    const/4 v2, 0x0

    :goto_a
    if-lt v2, v1, :cond_d

    return-void

    :cond_d
    aget-byte v3, v0, v2

    and-int/lit16 v3, v3, 0xff

    add-int/lit8 v4, v2, 0x1

    aget-byte v4, v0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v5, v3, 0x8

    or-int/2addr v5, v4

    const/4 v6, -0x1

    const v7, 0x8140

    if-lt v5, v7, :cond_28

    const v8, 0x9ffc

    if-gt v5, v8, :cond_28

    sub-int v6, v5, v7

    goto :goto_37

    :cond_28
    const v7, 0xe040

    if-lt v5, v7, :cond_37

    const v7, 0xebbf

    if-gt v5, v7, :cond_37

    const v7, 0xc140

    sub-int v6, v5, v7

    :cond_37
    :goto_37
    const/4 v7, -0x1

    if-eq v6, v7, :cond_49

    shr-int/lit8 v7, v6, 0x8

    mul-int/lit16 v7, v7, 0xc0

    and-int/lit16 v8, v6, 0xff

    add-int/2addr v7, v8

    const/16 v8, 0xd

    invoke-virtual {p1, v7, v8}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v2, v2, 0x2

    goto :goto_a

    :cond_49
    new-instance v7, Lcom/google/zxing/WriterException;

    const-string v8, "Invalid byte sequence"

    invoke-direct {v7, v8}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v7

    :catch_51
    move-exception v0

    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1, v0}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method static appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-virtual {p2, p1}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v0

    const/4 v1, 0x1

    shl-int v2, v1, v0

    if-ge p0, v2, :cond_d

    invoke-virtual {p3, p0, v0}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    return-void

    :cond_d
    new-instance v2, Lcom/google/zxing/WriterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, " is bigger than "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    shl-int v4, v1, v0

    sub-int/2addr v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method static appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V
    .registers 4

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Mode;->getBits()I

    move-result v0

    const/4 v1, 0x4

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    return-void
.end method

.method static appendNumericBytes(Ljava/lang/CharSequence;Lcom/google/zxing/common/BitArray;)V
    .registers 9

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-lt v1, v0, :cond_8

    return-void

    :cond_8
    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    add-int/lit8 v3, v1, 0x2

    if-ge v3, v0, :cond_30

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    add-int/lit8 v4, v1, 0x2

    invoke-interface {p0, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    add-int/lit8 v4, v4, -0x30

    mul-int/lit8 v5, v2, 0x64

    mul-int/lit8 v6, v3, 0xa

    add-int/2addr v5, v6

    add-int/2addr v5, v4

    const/16 v6, 0xa

    invoke-virtual {p1, v5, v6}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v1, v1, 0x3

    goto :goto_5

    :cond_30
    add-int/lit8 v3, v1, 0x1

    if-ge v3, v0, :cond_46

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    add-int/lit8 v3, v3, -0x30

    mul-int/lit8 v4, v2, 0xa

    add-int/2addr v4, v3

    const/4 v5, 0x7

    invoke-virtual {p1, v4, v5}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v1, v1, 0x2

    goto :goto_5

    :cond_46
    const/4 v3, 0x4

    invoke-virtual {p1, v2, v3}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method

.method private static calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 3

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v0

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule2(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule3(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule4(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const v0, 0x7fffffff

    const/4 v1, -0x1

    const/4 v2, 0x0

    :goto_5
    const/16 v3, 0x8

    if-lt v2, v3, :cond_a

    return v1

    :cond_a
    invoke-static {p0, p1, p2, v2, p3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p3}, Lcom/google/zxing/qrcode/encoder/Encoder;->calculateMaskPenalty(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v3

    if-ge v3, v0, :cond_15

    move v0, v3

    move v1, v2

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public static chooseMode(Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .registers 2

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v0

    return-object v0
.end method

.method private static chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;
    .registers 8

    const-string v0, "Shift_JIS"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/Encoder;->isOnlyDoubleByteKanji(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_11

    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->KANJI:Lcom/google/zxing/qrcode/decoder/Mode;

    goto :goto_13

    :cond_11
    sget-object v0, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    :goto_13
    return-object v0

    :cond_14
    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_17
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_2a

    if-eqz v1, :cond_22

    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->ALPHANUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    :cond_22
    if-eqz v0, :cond_27

    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->NUMERIC:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    :cond_27
    sget-object v2, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v2

    :cond_2a
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x30

    if-lt v3, v4, :cond_38

    const/16 v4, 0x39

    if-gt v3, v4, :cond_38

    const/4 v0, 0x1

    goto :goto_41

    :cond_38
    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->getAlphanumericCode(I)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_44

    const/4 v1, 0x1

    nop

    :goto_41
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    :cond_44
    sget-object v4, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    return-object v4
.end method

.method private static chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x1

    :goto_1
    const/16 v1, 0x28

    if-gt v0, v1, :cond_21

    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v2

    invoke-virtual {v1, p1}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v4

    sub-int v5, v2, v4

    add-int/lit8 v6, p0, 0x7

    div-int/lit8 v6, v6, 0x8

    if-lt v5, v6, :cond_1e

    return-object v1

    :cond_1e
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_21
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Data too big"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;

    move-result-object v0

    return-object v0
.end method

.method public static encode(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Ljava/util/Map;)Lcom/google/zxing/qrcode/encoder/QRCode;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/qrcode/encoder/QRCode;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    if-nez v2, :cond_a

    const/4 v3, 0x0

    goto :goto_12

    :cond_a
    sget-object v3, Lcom/google/zxing/EncodeHintType;->CHARACTER_SET:Lcom/google/zxing/EncodeHintType;

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    :goto_12
    if-nez v3, :cond_16

    const-string v3, "ISO-8859-1"

    :cond_16
    invoke-static {v0, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMode(Ljava/lang/String;Ljava/lang/String;)Lcom/google/zxing/qrcode/decoder/Mode;

    move-result-object v4

    new-instance v5, Lcom/google/zxing/common/BitArray;

    invoke-direct {v5}, Lcom/google/zxing/common/BitArray;-><init>()V

    sget-object v6, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v6, :cond_34

    const-string v6, "ISO-8859-1"

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_34

    invoke-static {v3}, Lcom/google/zxing/common/CharacterSetECI;->getCharacterSetECIByName(Ljava/lang/String;)Lcom/google/zxing/common/CharacterSetECI;

    move-result-object v6

    if-eqz v6, :cond_34

    invoke-static {v6, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendECI(Lcom/google/zxing/common/CharacterSetECI;Lcom/google/zxing/common/BitArray;)V

    :cond_34
    invoke-static {v4, v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendModeInfo(Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    new-instance v6, Lcom/google/zxing/common/BitArray;

    invoke-direct {v6}, Lcom/google/zxing/common/BitArray;-><init>()V

    invoke-static {v0, v4, v6, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendBytes(Ljava/lang/String;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;Ljava/lang/String;)V

    invoke-virtual {v5}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    const/4 v8, 0x1

    invoke-static {v8}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v8

    invoke-virtual {v4, v8}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    add-int/2addr v7, v8

    invoke-static {v7, v1}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v8

    invoke-virtual {v5}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v9

    invoke-virtual {v4, v8}, Lcom/google/zxing/qrcode/decoder/Mode;->getCharacterCountBits(Lcom/google/zxing/qrcode/decoder/Version;)I

    move-result v10

    add-int/2addr v9, v10

    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v10

    add-int/2addr v9, v10

    invoke-static {v9, v1}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseVersion(ILcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v10

    new-instance v11, Lcom/google/zxing/common/BitArray;

    invoke-direct {v11}, Lcom/google/zxing/common/BitArray;-><init>()V

    invoke-virtual {v11, v5}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    sget-object v12, Lcom/google/zxing/qrcode/decoder/Mode;->BYTE:Lcom/google/zxing/qrcode/decoder/Mode;

    if-ne v4, v12, :cond_79

    invoke-virtual {v6}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v12

    goto :goto_7d

    :cond_79
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v12

    :goto_7d
    invoke-static {v12, v10, v4, v11}, Lcom/google/zxing/qrcode/encoder/Encoder;->appendLengthInfo(ILcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/decoder/Mode;Lcom/google/zxing/common/BitArray;)V

    invoke-virtual {v11, v6}, Lcom/google/zxing/common/BitArray;->appendBitArray(Lcom/google/zxing/common/BitArray;)V

    invoke-virtual {v10, v1}, Lcom/google/zxing/qrcode/decoder/Version;->getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    move-result-object v13

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v14

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getTotalECCodewords()I

    move-result v15

    sub-int/2addr v14, v15

    invoke-static {v14, v11}, Lcom/google/zxing/qrcode/encoder/Encoder;->terminateBits(ILcom/google/zxing/common/BitArray;)V

    nop

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getTotalCodewords()I

    move-result v15

    nop

    invoke-virtual {v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getNumBlocks()I

    move-result v0

    invoke-static {v11, v15, v14, v0}, Lcom/google/zxing/qrcode/encoder/Encoder;->interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    new-instance v15, Lcom/google/zxing/qrcode/encoder/QRCode;

    invoke-direct {v15}, Lcom/google/zxing/qrcode/encoder/QRCode;-><init>()V

    invoke-virtual {v15, v1}, Lcom/google/zxing/qrcode/encoder/QRCode;->setECLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)V

    invoke-virtual {v15, v4}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMode(Lcom/google/zxing/qrcode/decoder/Mode;)V

    invoke-virtual {v15, v10}, Lcom/google/zxing/qrcode/encoder/QRCode;->setVersion(Lcom/google/zxing/qrcode/decoder/Version;)V

    invoke-virtual {v10}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v2

    move-object/from16 v16, v3

    new-instance v3, Lcom/google/zxing/qrcode/encoder/ByteMatrix;

    invoke-direct {v3, v2, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;-><init>(II)V

    move/from16 v17, v2

    invoke-static {v0, v1, v10, v3}, Lcom/google/zxing/qrcode/encoder/Encoder;->chooseMaskPattern(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I

    move-result v2

    invoke-virtual {v15, v2}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMaskPattern(I)V

    invoke-static {v0, v1, v10, v2, v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {v15, v3}, Lcom/google/zxing/qrcode/encoder/QRCode;->setMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    return-object v15
.end method

.method static generateECBytes([BI)[B
    .registers 7

    array-length v0, p0

    add-int v1, v0, p1

    new-array v1, v1, [I

    const/4 v2, 0x0

    :goto_6
    if-lt v2, v0, :cond_22

    new-instance v2, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;

    sget-object v3, Lcom/google/zxing/common/reedsolomon/GenericGF;->QR_CODE_FIELD_256:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v2, v3}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V

    invoke-virtual {v2, v1, p1}, Lcom/google/zxing/common/reedsolomon/ReedSolomonEncoder;->encode([II)V

    new-array v3, p1, [B

    const/4 v2, 0x0

    :goto_15
    if-lt v2, p1, :cond_18

    return-object v3

    :cond_18
    add-int v4, v0, v2

    aget v4, v1, v4

    int-to-byte v4, v4

    aput-byte v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    :cond_22
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method static getAlphanumericCode(I)I
    .registers 2

    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    array-length v0, v0

    if-ge p0, v0, :cond_a

    sget-object v0, Lcom/google/zxing/qrcode/encoder/Encoder;->ALPHANUMERIC_TABLE:[I

    aget v0, v0, p0

    return v0

    :cond_a
    const/4 v0, -0x1

    return v0
.end method

.method static getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    if-ge p3, p2, :cond_49

    rem-int v0, p0, p2

    sub-int v1, p2, v0

    div-int v2, p0, p2

    add-int/lit8 v3, v2, 0x1

    div-int v4, p1, p2

    add-int/lit8 v5, v4, 0x1

    sub-int v6, v2, v4

    sub-int v7, v3, v5

    if-ne v6, v7, :cond_41

    add-int v8, v1, v0

    if-ne p2, v8, :cond_39

    nop

    add-int v8, v4, v6

    nop

    mul-int/2addr v8, v1

    add-int v9, v5, v7

    nop

    mul-int/2addr v9, v0

    add-int/2addr v8, v9

    if-ne p0, v8, :cond_31

    const/4 v8, 0x0

    if-ge p3, v1, :cond_2c

    aput v4, p4, v8

    aput v6, p5, v8

    goto :goto_30

    :cond_2c
    aput v5, p4, v8

    aput v7, p5, v8

    :goto_30
    return-void

    :cond_31
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "Total bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_39
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "RS blocks mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_41
    new-instance v8, Lcom/google/zxing/WriterException;

    const-string v9, "EC bytes mismatch"

    invoke-direct {v8, v9}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v8

    :cond_49
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Block ID too large"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static interleaveWithECBytes(Lcom/google/zxing/common/BitArray;III)Lcom/google/zxing/common/BitArray;
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    move/from16 v6, p1

    move/from16 v7, p2

    move/from16 v8, p3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v0

    if-ne v0, v7, :cond_da

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v8}, Ljava/util/ArrayList;-><init>(I)V

    move-object v9, v3

    const/4 v3, 0x0

    move v11, v0

    move v12, v1

    move v13, v2

    move v10, v3

    :goto_1a
    const/16 v14, 0x8

    if-lt v10, v8, :cond_a0

    if-ne v7, v11, :cond_98

    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    const/4 v1, 0x0

    :goto_26
    if-lt v1, v12, :cond_78

    const/4 v1, 0x0

    move v2, v1

    :goto_2a
    if-lt v2, v13, :cond_58

    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v1

    if-ne v6, v1, :cond_33

    return-object v0

    :cond_33
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Interleaving error: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " and "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " differ."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_58
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5c
    :goto_5c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_65

    add-int/lit8 v2, v2, 0x1

    goto :goto_2a

    :cond_65
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/qrcode/encoder/BlockPair;

    invoke-virtual {v1}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getErrorCorrectionBytes()[B

    move-result-object v4

    array-length v5, v4

    if-ge v2, v5, :cond_5c

    aget-byte v5, v4, v2

    invoke-virtual {v0, v5, v14}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    goto :goto_5c

    :cond_78
    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7c
    :goto_7c
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_85

    add-int/lit8 v1, v1, 0x1

    goto :goto_26

    :cond_85
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/qrcode/encoder/BlockPair;

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/encoder/BlockPair;->getDataBytes()[B

    move-result-object v4

    array-length v5, v4

    if-ge v1, v5, :cond_7c

    aget-byte v5, v4, v1

    invoke-virtual {v0, v5, v14}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    goto :goto_7c

    :cond_98
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Data bytes does not match offset"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a0
    const/4 v0, 0x1

    new-array v15, v0, [I

    new-array v5, v0, [I

    nop

    nop

    move v0, v6

    move v1, v7

    move v2, v8

    move v3, v10

    move-object v4, v15

    move-object/from16 v16, v5

    invoke-static/range {v0 .. v5}, Lcom/google/zxing/qrcode/encoder/Encoder;->getNumDataBytesAndNumECBytesForBlockID(IIII[I[I)V

    const/4 v0, 0x0

    aget v1, v15, v0

    new-array v2, v1, [B

    mul-int/2addr v14, v11

    move-object/from16 v3, p0

    invoke-virtual {v3, v14, v2, v0, v1}, Lcom/google/zxing/common/BitArray;->toBytes(I[BII)V

    aget v4, v16, v0

    invoke-static {v2, v4}, Lcom/google/zxing/qrcode/encoder/Encoder;->generateECBytes([BI)[B

    move-result-object v4

    new-instance v5, Lcom/google/zxing/qrcode/encoder/BlockPair;

    invoke-direct {v5, v2, v4}, Lcom/google/zxing/qrcode/encoder/BlockPair;-><init>([B[B)V

    invoke-interface {v9, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    invoke-static {v12, v1}, Ljava/lang/Math;->max(II)I

    move-result v12

    array-length v5, v4

    invoke-static {v13, v5}, Ljava/lang/Math;->max(II)I

    move-result v13

    aget v0, v15, v0

    add-int/2addr v11, v0

    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_1a

    :cond_da
    move-object/from16 v3, p0

    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Number of bits and data bytes does not match"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isOnlyDoubleByteKanji(Ljava/lang/String;)Z
    .registers 7

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "Shift_JIS"

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_7} :catch_2d

    nop

    nop

    array-length v2, v1

    rem-int/lit8 v3, v2, 0x2

    if-eqz v3, :cond_f

    return v0

    :cond_f
    const/4 v3, 0x0

    :goto_10
    if-lt v3, v2, :cond_14

    const/4 v0, 0x1

    return v0

    :cond_14
    aget-byte v4, v1, v3

    and-int/lit16 v4, v4, 0xff

    const/16 v5, 0x81

    if-lt v4, v5, :cond_20

    const/16 v5, 0x9f

    if-le v4, v5, :cond_29

    :cond_20
    const/16 v5, 0xe0

    if-lt v4, v5, :cond_2c

    const/16 v5, 0xeb

    if-le v4, v5, :cond_29

    goto :goto_2c

    :cond_29
    add-int/lit8 v3, v3, 0x2

    goto :goto_10

    :cond_2c
    :goto_2c
    return v0

    :catch_2d
    move-exception v1

    return v0
.end method

.method static terminateBits(ILcom/google/zxing/common/BitArray;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    mul-int/lit8 v0, p0, 0x8

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    if-gt v1, v0, :cond_55

    const/4 v1, 0x0

    :goto_9
    const/4 v2, 0x4

    const/4 v3, 0x0

    if-ge v1, v2, :cond_1a

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-lt v2, v0, :cond_14

    goto :goto_1a

    :cond_14
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    :cond_1a
    :goto_1a
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    and-int/lit8 v1, v1, 0x7

    const/16 v2, 0x8

    if-lez v1, :cond_2e

    move v4, v1

    :goto_25
    if-lt v4, v2, :cond_28

    goto :goto_2e

    :cond_28
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_25

    :cond_2e
    :goto_2e
    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSizeInBytes()I

    move-result v3

    sub-int v3, p0, v3

    const/4 v4, 0x0

    :goto_35
    if-lt v4, v3, :cond_46

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-ne v2, v0, :cond_3e

    return-void

    :cond_3e
    new-instance v2, Lcom/google/zxing/WriterException;

    const-string v4, "Bits size does not equal capacity"

    invoke-direct {v2, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_46
    and-int/lit8 v5, v4, 0x1

    if-nez v5, :cond_4d

    const/16 v5, 0xec

    goto :goto_4f

    :cond_4d
    const/16 v5, 0x11

    :goto_4f
    invoke-virtual {p1, v5, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_35

    :cond_55
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "data bits cannot fit in the QR Code"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
