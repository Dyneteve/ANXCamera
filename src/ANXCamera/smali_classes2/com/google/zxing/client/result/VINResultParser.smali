.class public final Lcom/google/zxing/client/result/VINResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "VINResultParser.java"


# static fields
.field private static final AZ09:Ljava/util/regex/Pattern;

.field private static final IOQ:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "[IOQ]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VINResultParser;->IOQ:Ljava/util/regex/Pattern;

    const-string v0, "[A-Z0-9]{17}"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/VINResultParser;->AZ09:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static checkChar(I)C
    .registers 2

    const/16 v0, 0xa

    if-ge p0, v0, :cond_9

    const/16 v0, 0x30

    add-int/2addr v0, p0

    int-to-char v0, v0

    return v0

    :cond_9
    if-ne p0, v0, :cond_e

    const/16 v0, 0x58

    return v0

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private static checkChecksum(Ljava/lang/CharSequence;)Z
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v1, v2, :cond_1a

    const/16 v1, 0x8

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    rem-int/lit8 v2, v0, 0xb

    invoke-static {v2}, Lcom/google/zxing/client/result/VINResultParser;->checkChar(I)C

    move-result v2

    if-ne v1, v2, :cond_18

    const/4 v3, 0x1

    return v3

    :cond_18
    const/4 v3, 0x0

    return v3

    :cond_1a
    add-int/lit8 v2, v1, 0x1

    invoke-static {v2}, Lcom/google/zxing/client/result/VINResultParser;->vinPositionWeight(I)I

    move-result v2

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/client/result/VINResultParser;->vinCharValue(C)I

    move-result v3

    mul-int/2addr v2, v3

    add-int/2addr v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private static countryCode(Ljava/lang/CharSequence;)Ljava/lang/String;
    .registers 11

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v0

    const/4 v1, 0x1

    invoke-interface {p0, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0x45

    const/16 v3, 0x33

    const/16 v4, 0x39

    const/16 v5, 0x41

    if-eq v0, v4, :cond_8b

    const/16 v6, 0x54

    const/16 v7, 0x53

    if-eq v0, v7, :cond_79

    const/16 v8, 0x5a

    const/16 v9, 0x52

    if-eq v0, v8, :cond_72

    const/16 v8, 0x57

    packed-switch v0, :pswitch_data_98

    packed-switch v0, :pswitch_data_a6

    packed-switch v0, :pswitch_data_b2

    goto/16 :goto_96

    :pswitch_2d
    const/16 v2, 0x30

    if-eq v1, v2, :cond_35

    if-lt v1, v3, :cond_96

    if-gt v1, v4, :cond_96

    :cond_35
    const-string v2, "RU"

    return-object v2

    :pswitch_38
    const-string v2, "DE"

    return-object v2

    :pswitch_3b
    const/16 v2, 0x46

    if-lt v1, v2, :cond_44

    if-gt v1, v9, :cond_44

    const-string v2, "FR"

    return-object v2

    :cond_44
    if-lt v1, v7, :cond_96

    if-gt v1, v8, :cond_96

    const-string v2, "ES"

    return-object v2

    :pswitch_4b
    if-lt v1, v5, :cond_96

    if-gt v1, v2, :cond_96

    const-string v2, "IN"

    return-object v2

    :pswitch_52
    const-string v2, "CN"

    return-object v2

    :pswitch_55
    const/16 v2, 0x4c

    if-lt v1, v2, :cond_96

    if-gt v1, v9, :cond_96

    const-string v2, "KO"

    return-object v2

    :pswitch_5e
    if-lt v1, v5, :cond_96

    if-gt v1, v6, :cond_96

    const-string v2, "JP"

    return-object v2

    :pswitch_65
    if-lt v1, v5, :cond_96

    if-gt v1, v8, :cond_96

    const-string v2, "MX"

    return-object v2

    :pswitch_6c
    const-string v2, "CA"

    return-object v2

    :pswitch_6f
    const-string v2, "US"

    return-object v2

    :cond_72
    if-lt v1, v5, :cond_96

    if-gt v1, v9, :cond_96

    const-string v2, "IT"

    return-object v2

    :cond_79
    if-lt v1, v5, :cond_82

    const/16 v2, 0x4d

    if-gt v1, v2, :cond_82

    const-string v2, "UK"

    return-object v2

    :cond_82
    const/16 v2, 0x4e

    if-lt v1, v2, :cond_96

    if-gt v1, v6, :cond_96

    const-string v2, "DE"

    return-object v2

    :cond_8b
    if-lt v1, v5, :cond_8f

    if-le v1, v2, :cond_93

    :cond_8f
    if-lt v1, v3, :cond_96

    if-gt v1, v4, :cond_96

    :cond_93
    const-string v2, "BR"

    return-object v2

    :cond_96
    :goto_96
    const/4 v2, 0x0

    return-object v2

    :pswitch_data_98
    .packed-switch 0x31
        :pswitch_6f
        :pswitch_6c
        :pswitch_65
        :pswitch_6f
        :pswitch_6f
    .end packed-switch

    :pswitch_data_a6
    .packed-switch 0x4a
        :pswitch_5e
        :pswitch_55
        :pswitch_52
        :pswitch_4b
    .end packed-switch

    :pswitch_data_b2
    .packed-switch 0x56
        :pswitch_3b
        :pswitch_38
        :pswitch_2d
    .end packed-switch
.end method

.method private static modelYear(C)I
    .registers 2

    const/16 v0, 0x45

    if-lt p0, v0, :cond_d

    const/16 v0, 0x48

    if-gt p0, v0, :cond_d

    add-int/lit8 v0, p0, -0x45

    add-int/lit16 v0, v0, 0x7c0

    return v0

    :cond_d
    const/16 v0, 0x4a

    if-lt p0, v0, :cond_1a

    const/16 v0, 0x4e

    if-gt p0, v0, :cond_1a

    add-int/lit8 v0, p0, -0x4a

    add-int/lit16 v0, v0, 0x7c4

    return v0

    :cond_1a
    const/16 v0, 0x50

    if-ne p0, v0, :cond_21

    const/16 v0, 0x7c9

    return v0

    :cond_21
    const/16 v0, 0x52

    if-lt p0, v0, :cond_2e

    const/16 v0, 0x54

    if-gt p0, v0, :cond_2e

    add-int/lit8 v0, p0, -0x52

    add-int/lit16 v0, v0, 0x7ca

    return v0

    :cond_2e
    const/16 v0, 0x56

    if-lt p0, v0, :cond_3b

    const/16 v0, 0x59

    if-gt p0, v0, :cond_3b

    add-int/lit8 v0, p0, -0x56

    add-int/lit16 v0, v0, 0x7cd

    return v0

    :cond_3b
    const/16 v0, 0x31

    if-lt p0, v0, :cond_48

    const/16 v0, 0x39

    if-gt p0, v0, :cond_48

    add-int/lit8 v0, p0, -0x31

    add-int/lit16 v0, v0, 0x7d1

    return v0

    :cond_48
    const/16 v0, 0x41

    if-lt p0, v0, :cond_55

    const/16 v0, 0x44

    if-gt p0, v0, :cond_55

    add-int/lit8 v0, p0, -0x41

    add-int/lit16 v0, v0, 0x7da

    return v0

    :cond_55
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private static vinCharValue(C)I
    .registers 2

    const/16 v0, 0x41

    if-lt p0, v0, :cond_d

    const/16 v0, 0x49

    if-gt p0, v0, :cond_d

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_d
    const/16 v0, 0x4a

    if-lt p0, v0, :cond_1a

    const/16 v0, 0x52

    if-gt p0, v0, :cond_1a

    add-int/lit8 v0, p0, -0x4a

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_1a
    const/16 v0, 0x53

    if-lt p0, v0, :cond_27

    const/16 v0, 0x5a

    if-gt p0, v0, :cond_27

    add-int/lit8 v0, p0, -0x53

    add-int/lit8 v0, v0, 0x2

    return v0

    :cond_27
    const/16 v0, 0x30

    if-lt p0, v0, :cond_32

    const/16 v0, 0x39

    if-gt p0, v0, :cond_32

    add-int/lit8 v0, p0, -0x30

    return v0

    :cond_32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method private static vinPositionWeight(I)I
    .registers 4

    const/16 v0, 0x9

    const/4 v1, 0x1

    if-lt p0, v1, :cond_a

    const/4 v1, 0x7

    if-gt p0, v1, :cond_a

    sub-int/2addr v0, p0

    return v0

    :cond_a
    const/16 v1, 0x8

    const/16 v2, 0xa

    if-ne p0, v1, :cond_11

    return v2

    :cond_11
    if-ne p0, v0, :cond_15

    const/4 v0, 0x0

    return v0

    :cond_15
    if-lt p0, v2, :cond_1e

    const/16 v0, 0x11

    if-gt p0, v0, :cond_1e

    rsub-int/lit8 v0, p0, 0x13

    return v0

    :cond_1e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/VINResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/VINParsedResult;

    move-result-object p1

    return-object p1
.end method

.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/VINParsedResult;
    .registers 16

    invoke-virtual {p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->CODE_39:Lcom/google/zxing/BarcodeFormat;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_a

    return-object v2

    :cond_a
    invoke-virtual {p1}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/result/VINResultParser;->IOQ:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const-string v3, ""

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/result/VINResultParser;->AZ09:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_2b

    return-object v2

    :cond_2b
    :try_start_2b
    invoke-static {v0}, Lcom/google/zxing/client/result/VINResultParser;->checkChecksum(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_32

    return-object v2

    :cond_32
    const/4 v1, 0x0

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    new-instance v13, Lcom/google/zxing/client/result/VINParsedResult;

    nop

    const/16 v4, 0x9

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    const/16 v5, 0x11

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-static {v1}, Lcom/google/zxing/client/result/VINResultParser;->countryCode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    const/16 v5, 0x8

    invoke-virtual {v0, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/client/result/VINResultParser;->modelYear(C)I

    move-result v10

    const/16 v3, 0xa

    invoke-virtual {v0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v3, 0xb

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    move-object v3, v13

    move-object v4, v0

    move-object v5, v1

    invoke-direct/range {v3 .. v12}, Lcom/google/zxing/client/result/VINParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ICLjava/lang/String;)V
    :try_end_6b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2b .. :try_end_6b} :catch_6c

    return-object v13

    :catch_6c
    move-exception v1

    return-object v2
.end method
