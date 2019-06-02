.class public final Lcom/google/zxing/client/result/VEventResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "VEventResultParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/zxing/client/result/VCardResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_15

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_15

    :cond_e
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_16

    :cond_15
    :goto_15
    const/4 v0, 0x0

    :goto_16
    return-object v0
.end method

.method private static matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)[Ljava/lang/String;
    .registers 9

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/google/zxing/client/result/VCardResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;ZZ)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_29

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_e

    goto :goto_29

    :cond_e
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    new-array v3, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    :goto_15
    if-lt v4, v2, :cond_18

    return-object v3

    :cond_18
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    aput-object v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_29
    :goto_29
    const/4 v0, 0x0

    return-object v0
.end method

.method private static stripMailto(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_17

    const-string v0, "mailto:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "MAILTO:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    :cond_12
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_17
    return-object p0
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;
    .registers 28

    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/VEventResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "BEGIN:VEVENT"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    const/4 v3, 0x0

    if-gez v2, :cond_e

    return-object v3

    :cond_e
    const-string v0, "SUMMARY"

    const/4 v4, 0x1

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v18

    const-string v0, "DTSTART"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v19

    if-nez v19, :cond_1e

    return-object v3

    :cond_1e
    const-string v0, "DTEND"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v20

    const-string v0, "DURATION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v21

    const-string v0, "LOCATION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v22

    const-string v0, "ORGANIZER"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/client/result/VEventResultParser;->stripMailto(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    const-string v0, "ATTENDEE"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v13

    if-eqz v13, :cond_52

    const/4 v0, 0x0

    :goto_43
    array-length v5, v13

    if-lt v0, v5, :cond_47

    goto :goto_52

    :cond_47
    aget-object v5, v13, v0

    invoke-static {v5}, Lcom/google/zxing/client/result/VEventResultParser;->stripMailto(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v13, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_43

    :cond_52
    :goto_52
    const-string v0, "DESCRIPTION"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v24

    const-string v0, "GEO"

    invoke-static {v0, v1, v4}, Lcom/google/zxing/client/result/VEventResultParser;->matchSingleVCardPrefixedField(Ljava/lang/CharSequence;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_69

    const-wide/high16 v5, 0x7ff8000000000000L    # Double.NaN

    const-wide/high16 v7, 0x7ff8000000000000L    # Double.NaN

    nop

    move-wide v14, v5

    move-wide/from16 v16, v7

    goto :goto_89

    :cond_69
    const/16 v0, 0x3b

    invoke-virtual {v4, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    if-gez v5, :cond_72

    return-object v3

    :cond_72
    const/4 v0, 0x0

    :try_start_73
    invoke-virtual {v4, v0, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v6

    add-int/lit8 v0, v5, 0x1

    invoke-virtual {v4, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v8
    :try_end_85
    .catch Ljava/lang/NumberFormatException; {:try_start_73 .. :try_end_85} :catch_b0

    nop

    move-wide v14, v6

    move-wide/from16 v16, v8

    :goto_89
    :try_start_89
    new-instance v0, Lcom/google/zxing/client/result/CalendarParsedResult;
    :try_end_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_89 .. :try_end_8b} :catch_ac

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    move-object v5, v0

    move-object/from16 v6, v18

    move-object/from16 v7, v19

    move-object/from16 v8, v20

    move-object/from16 v9, v21

    move-object/from16 v10, v22

    move-object/from16 v11, v23

    move-object v12, v13

    move-object/from16 v25, v13

    move-object/from16 v13, v24

    :try_start_a6
    invoke-direct/range {v5 .. v17}, Lcom/google/zxing/client/result/CalendarParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;DD)V
    :try_end_a9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_a6 .. :try_end_a9} :catch_aa

    return-object v0

    :catch_aa
    move-exception v0

    goto :goto_af

    :catch_ac
    move-exception v0

    move-object/from16 v25, v13

    :goto_af
    return-object v3

    :catch_b0
    move-exception v0

    move-object/from16 v25, v13

    return-object v3
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/VEventResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/CalendarParsedResult;

    move-result-object p1

    return-object p1
.end method
