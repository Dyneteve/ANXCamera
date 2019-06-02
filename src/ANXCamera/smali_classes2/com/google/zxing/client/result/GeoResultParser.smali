.class public final Lcom/google/zxing/client/result/GeoResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "GeoResultParser.java"


# static fields
.field private static final GEO_URL_PATTERN:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const-string v0, "geo:([\\-0-9.]+),([\\-0-9.]+)(?:,([\\-0-9.]+))?(?:\\?(.*))?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/client/result/GeoResultParser;->GEO_URL_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;
    .registers 16

    invoke-static {p1}, Lcom/google/zxing/client/result/GeoResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/client/result/GeoResultParser;->GEO_URL_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_12

    return-object v3

    :cond_12
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    const/4 v2, 0x1

    :try_start_18
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    move-wide v5, v4

    const-wide v7, 0x4056800000000000L    # 90.0

    cmpl-double v2, v5, v7

    if-gtz v2, :cond_74

    const-wide v7, -0x3fa9800000000000L    # -90.0

    cmpg-double v2, v5, v7

    if-gez v2, :cond_34

    goto :goto_74

    :cond_34
    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v7

    const-wide v9, 0x4066800000000000L    # 180.0

    cmpl-double v2, v7, v9

    if-gtz v2, :cond_73

    const-wide v9, -0x3f99800000000000L    # -180.0

    cmpg-double v2, v7, v9

    if-gez v2, :cond_50

    goto :goto_73

    :cond_50
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_5c

    const-wide/16 v2, 0x0

    nop

    move-wide v9, v2

    goto :goto_6b

    :cond_5c
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v9
    :try_end_64
    .catch Ljava/lang/NumberFormatException; {:try_start_18 .. :try_end_64} :catch_75

    const-wide/16 v12, 0x0

    cmpg-double v2, v9, v12

    if-gez v2, :cond_6b

    return-object v3

    :cond_6b
    :goto_6b
    nop

    new-instance v2, Lcom/google/zxing/client/result/GeoParsedResult;

    move-object v4, v2

    invoke-direct/range {v4 .. v11}, Lcom/google/zxing/client/result/GeoParsedResult;-><init>(DDDLjava/lang/String;)V

    return-object v2

    :cond_73
    :goto_73
    return-object v3

    :cond_74
    :goto_74
    return-object v3

    :catch_75
    move-exception v2

    return-object v3
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/GeoResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/GeoParsedResult;

    move-result-object p1

    return-object p1
.end method
