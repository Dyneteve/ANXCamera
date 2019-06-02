.class public abstract Lcom/google/zxing/client/result/ResultParser;
.super Ljava/lang/Object;
.source "ResultParser.java"


# static fields
.field private static final AMPERSAND:Ljava/util/regex/Pattern;

.field private static final BYTE_ORDER_MARK:Ljava/lang/String; = "\ufeff"

.field private static final DIGITS:Ljava/util/regex/Pattern;

.field private static final EQUALS:Ljava/util/regex/Pattern;

.field private static final PARSERS:[Lcom/google/zxing/client/result/ResultParser;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0x14

    new-array v0, v0, [Lcom/google/zxing/client/result/ResultParser;

    new-instance v1, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/BookmarkDoCoMoResultParser;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/AddressBookDoCoMoResultParser;-><init>()V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/EmailDoCoMoResultParser;-><init>()V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/AddressBookAUResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/AddressBookAUResultParser;-><init>()V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/VCardResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VCardResultParser;-><init>()V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/BizcardResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/BizcardResultParser;-><init>()V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/VEventResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VEventResultParser;-><init>()V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/EmailAddressResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/EmailAddressResultParser;-><init>()V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/SMTPResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMTPResultParser;-><init>()V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/TelResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/TelResultParser;-><init>()V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/SMSMMSResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMSMMSResultParser;-><init>()V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/SMSTOMMSTOResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/SMSTOMMSTOResultParser;-><init>()V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/GeoResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/GeoResultParser;-><init>()V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/WifiResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/WifiResultParser;-><init>()V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/URLTOResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/URLTOResultParser;-><init>()V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/URIResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/URIResultParser;-><init>()V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/ISBNResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ISBNResultParser;-><init>()V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/ProductResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ProductResultParser;-><init>()V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/ExpandedProductResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;-><init>()V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/client/result/VINResultParser;

    invoke-direct {v1}, Lcom/google/zxing/client/result/VINResultParser;-><init>()V

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->PARSERS:[Lcom/google/zxing/client/result/ResultParser;

    const-string v0, "\\d+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    const-string v0, "&"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->AMPERSAND:Ljava/util/regex/Pattern;

    const-string v0, "="

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/ResultParser;->EQUALS:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static appendKeyValue(Ljava/lang/CharSequence;Ljava/util/Map;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->EQUALS:Ljava/util/regex/Pattern;

    const/4 v1, 0x2

    invoke-virtual {v0, p0, v1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;I)[Ljava/lang/String;

    move-result-object v0

    array-length v2, v0

    if-ne v2, v1, :cond_1a

    const/4 v1, 0x0

    aget-object v1, v0, v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    :try_start_10
    invoke-static {v2}, Lcom/google/zxing/client/result/ResultParser;->urlDecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v2, v3

    invoke-interface {p1, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/IllegalArgumentException; {:try_start_10 .. :try_end_18} :catch_19

    goto :goto_1a

    :catch_19
    move-exception v3

    :cond_1a
    :goto_1a
    return-void
.end method

.method protected static getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\ufeff"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_11
    return-object v0
.end method

.method protected static isStringOfDigits(Ljava/lang/CharSequence;I)Z
    .registers 3

    if-eqz p0, :cond_18

    if-lez p1, :cond_18

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-ne p1, v0, :cond_18

    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    return v0

    :cond_18
    const/4 v0, 0x0

    return v0
.end method

.method protected static isSubstringOfDigits(Ljava/lang/CharSequence;II)Z
    .registers 7

    const/4 v0, 0x0

    if-eqz p0, :cond_20

    if-gtz p2, :cond_6

    goto :goto_20

    :cond_6
    add-int v1, p1, p2

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lt v2, v1, :cond_1f

    sget-object v2, Lcom/google/zxing/client/result/ResultParser;->DIGITS:Ljava/util/regex/Pattern;

    invoke-interface {p0, p1, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_1f

    const/4 v0, 0x1

    :cond_1f
    return v0

    :cond_20
    :goto_20
    return v0
.end method

.method static matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;
    .registers 11

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    :goto_6
    if-lt v1, v2, :cond_9

    goto :goto_10

    :cond_9
    invoke-virtual {p1, p0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-gez v1, :cond_28

    nop

    :goto_10
    if-eqz v0, :cond_26

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_19

    goto :goto_26

    :cond_19
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3

    :cond_26
    :goto_26
    const/4 v3, 0x0

    return-object v3

    :cond_28
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    add-int/2addr v1, v3

    move v3, v1

    const/4 v4, 0x1

    :goto_2f
    if-nez v4, :cond_32

    goto :goto_6

    :cond_32
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    if-gez v1, :cond_3e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v4, 0x0

    goto :goto_2f

    :cond_3e
    add-int/lit8 v5, v1, -0x1

    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x5c

    if-ne v5, v6, :cond_4b

    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    :cond_4b
    if-nez v0, :cond_54

    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x3

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    move-object v0, v5

    :cond_54
    invoke-virtual {p1, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/google/zxing/client/result/ResultParser;->unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz p3, :cond_62

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    :cond_62
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6b

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6b
    add-int/lit8 v1, v1, 0x1

    const/4 v4, 0x0

    goto :goto_2f
.end method

.method static matchSinglePrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)Ljava/lang/String;
    .registers 6

    invoke-static {p0, p1, p2, p3}, Lcom/google/zxing/client/result/ResultParser;->matchPrefixedField(Ljava/lang/String;Ljava/lang/String;CZ)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    goto :goto_b

    :cond_8
    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_b
    return-object v1
.end method

.method protected static maybeAppend(Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .registers 3

    if-eqz p0, :cond_a

    const/16 v0, 0xa

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_a
    return-void
.end method

.method protected static maybeAppend([Ljava/lang/String;Ljava/lang/StringBuilder;)V
    .registers 6

    if-eqz p0, :cond_14

    array-length v0, p0

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v0, :cond_7

    goto :goto_14

    :cond_7
    aget-object v2, p0, v1

    const/16 v3, 0xa

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_14
    :goto_14
    return-void
.end method

.method protected static maybeWrap(Ljava/lang/String;)[Ljava/lang/String;
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    goto :goto_a

    :cond_4
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    :goto_a
    return-object v0
.end method

.method protected static parseHexDigit(C)I
    .registers 3

    const/16 v0, 0x30

    if-lt p0, v0, :cond_b

    const/16 v0, 0x39

    if-gt p0, v0, :cond_b

    add-int/lit8 v0, p0, -0x30

    return v0

    :cond_b
    const/16 v0, 0xa

    const/16 v1, 0x61

    if-lt p0, v1, :cond_19

    const/16 v1, 0x66

    if-gt p0, v1, :cond_19

    add-int/lit8 v1, p0, -0x61

    add-int/2addr v0, v1

    return v0

    :cond_19
    const/16 v1, 0x41

    if-lt p0, v1, :cond_25

    const/16 v1, 0x46

    if-gt p0, v1, :cond_25

    add-int/lit8 v1, p0, -0x41

    add-int/2addr v0, v1

    return v0

    :cond_25
    const/4 v0, -0x1

    return v0
.end method

.method static parseNameValuePairs(Ljava/lang/String;)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_a

    const/4 v1, 0x0

    return-object v1

    :cond_a
    new-instance v1, Ljava/util/HashMap;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sget-object v2, Lcom/google/zxing/client/result/ResultParser;->AMPERSAND:Ljava/util/regex/Pattern;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    :goto_1e
    if-lt v4, v3, :cond_21

    return-object v1

    :cond_21
    aget-object v5, v2, v4

    invoke-static {v5, v1}, Lcom/google/zxing/client/result/ResultParser;->appendKeyValue(Ljava/lang/CharSequence;Ljava/util/Map;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_1e
.end method

.method public static parseResult(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 6

    sget-object v0, Lcom/google/zxing/client/result/ResultParser;->PARSERS:[Lcom/google/zxing/client/result/ResultParser;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-lt v2, v1, :cond_11

    new-instance v0, Lcom/google/zxing/client/result/TextParsedResult;

    invoke-virtual {p0}, Lcom/google/zxing/Result;->getText()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/client/result/TextParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_11
    aget-object v3, v0, v2

    invoke-virtual {v3, p0}, Lcom/google/zxing/client/result/ResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;

    move-result-object v4

    if-eqz v4, :cond_1a

    return-object v4

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_4
.end method

.method protected static unescapeBackslash(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const/16 v0, 0x5c

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_9

    return-object p0

    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    add-int/lit8 v4, v2, -0x1

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v1}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    move v5, v1

    :goto_1e
    if-lt v5, v2, :cond_25

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_25
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-nez v4, :cond_30

    if-eq v6, v0, :cond_2e

    goto :goto_30

    :cond_2e
    const/4 v4, 0x1

    goto :goto_35

    :cond_30
    :goto_30
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    nop

    :goto_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e
.end method

.method static urlDecode(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    :try_start_0
    const-string v0, "UTF-8"

    invoke-static {p0, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_6
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v0

    :catch_7
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public abstract parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
.end method
