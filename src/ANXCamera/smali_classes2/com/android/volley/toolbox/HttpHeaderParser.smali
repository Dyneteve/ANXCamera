.class public Lcom/android/volley/toolbox/HttpHeaderParser;
.super Ljava/lang/Object;
.source "HttpHeaderParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;
    .registers 22

    move-object/from16 v1, p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, v1, Lcom/android/volley/NetworkResponse;->headers:Ljava/util/Map;

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v0, 0x0

    const/4 v13, 0x0

    const-string v14, "Date"

    invoke-interface {v4, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    if-eqz v14, :cond_20

    invoke-static {v14}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v5

    :cond_20
    const-string v15, "Cache-Control"

    invoke-interface {v4, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    move-object v14, v15

    check-cast v14, Ljava/lang/String;

    if-eqz v14, :cond_82

    const/4 v15, 0x1

    const-string v0, ","

    move-wide/from16 v16, v7

    invoke-virtual {v14, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    const/4 v0, 0x0

    :goto_35
    move v8, v0

    array-length v0, v7

    if-ge v8, v0, :cond_85

    aget-object v0, v7, v8

    move-object/from16 v18, v7

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7

    const-string v0, "no-cache"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_80

    const-string v0, "no-store"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_52

    goto :goto_80

    :cond_52
    const-string v0, "max-age="

    invoke-virtual {v7, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_69

    const/16 v0, 0x8

    :try_start_5c
    invoke-virtual {v7, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v19
    :try_end_64
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_64} :catch_67

    move-wide/from16 v11, v19

    :goto_66
    goto :goto_7b

    :catch_67
    move-exception v0

    goto :goto_66

    :cond_69
    const-string v0, "must-revalidate"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_79

    const-string v0, "proxy-revalidate"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7b

    :cond_79
    const-wide/16 v11, 0x0

    :cond_7b
    :goto_7b
    add-int/lit8 v0, v8, 0x1

    move-object/from16 v7, v18

    goto :goto_35

    :cond_80
    :goto_80
    const/4 v0, 0x0

    return-object v0

    :cond_82
    move-wide/from16 v16, v7

    move v15, v0

    :cond_85
    const-string v0, "Expires"

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_95

    invoke-static {v0}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseDateAsEpoch(Ljava/lang/String;)J

    move-result-wide v7

    move-wide/from16 v16, v7

    :cond_95
    const-string v7, "ETag"

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v15, :cond_a5

    const-wide/16 v13, 0x3e8

    mul-long/2addr v13, v11

    add-long v9, v2, v13

    goto :goto_b3

    :cond_a5
    const-wide/16 v13, 0x0

    cmp-long v8, v5, v13

    if-lez v8, :cond_b3

    cmp-long v8, v16, v5

    if-ltz v8, :cond_b3

    sub-long v13, v16, v5

    add-long v9, v2, v13

    :cond_b3
    :goto_b3
    new-instance v8, Lcom/android/volley/Cache$Entry;

    invoke-direct {v8}, Lcom/android/volley/Cache$Entry;-><init>()V

    iget-object v13, v1, Lcom/android/volley/NetworkResponse;->data:[B

    iput-object v13, v8, Lcom/android/volley/Cache$Entry;->data:[B

    iput-object v7, v8, Lcom/android/volley/Cache$Entry;->etag:Ljava/lang/String;

    iput-wide v9, v8, Lcom/android/volley/Cache$Entry;->softTtl:J

    iget-wide v13, v8, Lcom/android/volley/Cache$Entry;->softTtl:J

    iput-wide v13, v8, Lcom/android/volley/Cache$Entry;->ttl:J

    iput-wide v5, v8, Lcom/android/volley/Cache$Entry;->serverDate:J

    iput-object v4, v8, Lcom/android/volley/Cache$Entry;->responseHeaders:Ljava/util/Map;

    return-object v8
.end method

.method public static parseCharset(Ljava/util/Map;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    const-string v0, "Content-Type"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_36

    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    move v3, v2

    :goto_12
    array-length v4, v1

    if-ge v3, v4, :cond_36

    aget-object v4, v1, v3

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    const/4 v6, 0x2

    if-ne v5, v6, :cond_33

    const/4 v5, 0x0

    aget-object v5, v4, v5

    const-string v6, "charset"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_33

    aget-object v2, v4, v2

    return-object v2

    :cond_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_36
    const-string v1, "ISO-8859-1"

    return-object v1
.end method

.method public static parseDateAsEpoch(Ljava/lang/String;)J
    .registers 4

    :try_start_0
    invoke-static {p0}, Lorg/apache/http/impl/cookie/DateUtils;->parseDate(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_8
    .catch Lorg/apache/http/impl/cookie/DateParseException; {:try_start_0 .. :try_end_8} :catch_9

    return-wide v0

    :catch_9
    move-exception v0

    const-wide/16 v1, 0x0

    return-wide v1
.end method
