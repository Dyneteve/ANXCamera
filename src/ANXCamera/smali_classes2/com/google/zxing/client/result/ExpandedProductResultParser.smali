.class public final Lcom/google/zxing/client/result/ExpandedProductResultParser;
.super Lcom/google/zxing/client/result/ResultParser;
.source "ExpandedProductResultParser.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/google/zxing/client/result/ResultParser;-><init>()V

    return-void
.end method

.method private static findAIvalue(ILjava/lang/String;)Ljava/lang/String;
    .registers 9

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x28

    if-eq v0, v2, :cond_a

    return-object v1

    :cond_a
    add-int/lit8 v2, p0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    :goto_16
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lt v4, v5, :cond_21

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_21
    invoke-interface {v2, v4}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    const/16 v6, 0x29

    if-ne v5, v6, :cond_2e

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_2e
    const/16 v6, 0x30

    if-lt v5, v6, :cond_3d

    const/16 v6, 0x39

    if-gt v5, v6, :cond_3d

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    nop

    add-int/lit8 v4, v4, 0x1

    goto :goto_16

    :cond_3d
    return-object v1
.end method

.method private static findValue(ILjava/lang/String;)Ljava/lang/String;
    .registers 8

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    :goto_a
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v2, v3, :cond_11

    goto :goto_23

    :cond_11
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x28

    if-ne v3, v4, :cond_28

    invoke-static {v2, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findAIvalue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_23

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    :cond_23
    :goto_23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    :cond_28
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2b
    add-int/lit8 v2, v2, 0x1

    goto :goto_a
.end method


# virtual methods
.method public parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;
    .registers 36

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/Result;->getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;

    move-result-object v0

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_a

    return-object v2

    :cond_a
    invoke-static/range {p1 .. p1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->getMassagedText(Lcom/google/zxing/Result;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const/16 v16, 0x0

    move-object/from16 v20, v3

    move-object/from16 v21, v4

    move-object/from16 v22, v5

    move-object/from16 v23, v6

    move-object/from16 v24, v7

    move-object/from16 v25, v8

    move-object/from16 v26, v9

    move-object/from16 v27, v10

    move-object/from16 v28, v11

    move-object/from16 v29, v12

    move-object/from16 v30, v13

    move-object/from16 v31, v14

    move-object/from16 v32, v15

    move/from16 v15, v16

    :goto_3e
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v15, v3, :cond_7a

    new-instance v19, Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    move-object/from16 v3, v19

    move-object v4, v1

    move-object/from16 v5, v20

    move-object/from16 v6, v21

    move-object/from16 v7, v22

    move-object/from16 v8, v23

    move-object/from16 v9, v24

    move-object/from16 v10, v25

    move-object/from16 v11, v26

    move-object/from16 v12, v27

    move-object/from16 v13, v28

    move-object/from16 v14, v29

    move-object/from16 v33, v0

    move v0, v15

    move-object/from16 v15, v30

    move-object/from16 v16, v31

    move-object/from16 v17, v32

    move-object/from16 v18, v2

    invoke-direct/range {v3 .. v18}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v19

    :cond_7a
    move-object/from16 v33, v0

    move v0, v15

    invoke-static {v0, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findAIvalue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_85

    const/4 v4, 0x0

    return-object v4

    :cond_85
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x2

    add-int v15, v0, v4

    invoke-static {v15, v1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->findValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/2addr v15, v4

    const-string v4, "00"

    if-ne v3, v4, :cond_a0

    move-object/from16 v21, v0

    nop

    :goto_9d
    move-object/from16 v0, v33

    goto :goto_3e

    :cond_a0
    const-string v4, "01"

    if-ne v3, v4, :cond_a7

    move-object/from16 v20, v0

    goto :goto_9d

    :cond_a7
    const-string v4, "10"

    if-ne v3, v4, :cond_ae

    move-object/from16 v22, v0

    goto :goto_9d

    :cond_ae
    const-string v4, "11"

    if-ne v3, v4, :cond_b5

    move-object/from16 v23, v0

    goto :goto_9d

    :cond_b5
    const-string v4, "13"

    if-ne v3, v4, :cond_bc

    move-object/from16 v24, v0

    goto :goto_9d

    :cond_bc
    const-string v4, "15"

    if-ne v3, v4, :cond_c3

    move-object/from16 v25, v0

    goto :goto_9d

    :cond_c3
    const-string v4, "17"

    if-ne v3, v4, :cond_ca

    move-object/from16 v26, v0

    goto :goto_9d

    :cond_ca
    const-string v4, "3100"

    const/4 v5, 0x3

    if-eq v3, v4, :cond_172

    const-string v4, "3101"

    if-eq v3, v4, :cond_172

    const-string v4, "3102"

    if-eq v3, v4, :cond_172

    const-string v4, "3103"

    if-eq v3, v4, :cond_172

    const-string v4, "3104"

    if-eq v3, v4, :cond_172

    const-string v4, "3105"

    if-eq v3, v4, :cond_172

    const-string v4, "3106"

    if-eq v3, v4, :cond_172

    const-string v4, "3107"

    if-eq v3, v4, :cond_172

    const-string v4, "3108"

    if-eq v3, v4, :cond_172

    const-string v4, "3109"

    if-ne v3, v4, :cond_f5

    goto/16 :goto_172

    :cond_f5
    const-string v4, "3200"

    if-eq v3, v4, :cond_167

    const-string v4, "3201"

    if-eq v3, v4, :cond_167

    const-string v4, "3202"

    if-eq v3, v4, :cond_167

    const-string v4, "3203"

    if-eq v3, v4, :cond_167

    const-string v4, "3204"

    if-eq v3, v4, :cond_167

    const-string v4, "3205"

    if-eq v3, v4, :cond_167

    const-string v4, "3206"

    if-eq v3, v4, :cond_167

    const-string v4, "3207"

    if-eq v3, v4, :cond_167

    const-string v4, "3208"

    if-eq v3, v4, :cond_167

    const-string v4, "3209"

    if-ne v3, v4, :cond_11e

    goto :goto_167

    :cond_11e
    const-string v4, "3920"

    if-eq v3, v4, :cond_15e

    const-string v4, "3921"

    if-eq v3, v4, :cond_15e

    const-string v4, "3922"

    if-eq v3, v4, :cond_15e

    const-string v4, "3923"

    if-ne v3, v4, :cond_12f

    goto :goto_15e

    :cond_12f
    const-string v4, "3930"

    if-eq v3, v4, :cond_145

    const-string v4, "3931"

    if-eq v3, v4, :cond_145

    const-string v4, "3932"

    if-eq v3, v4, :cond_145

    const-string v4, "3933"

    if-ne v3, v4, :cond_140

    goto :goto_145

    :cond_140
    invoke-interface {v2, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_9d

    :cond_145
    :goto_145
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v6, 0x4

    if-ge v4, v6, :cond_14e

    const/4 v4, 0x0

    return-object v4

    :cond_14e
    const/4 v4, 0x0

    invoke-virtual {v0, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v30

    const/4 v6, 0x0

    invoke-virtual {v0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v32

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v31

    goto/16 :goto_9d

    :cond_15e
    :goto_15e
    const/4 v4, 0x0

    move-object/from16 v30, v0

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v31

    goto/16 :goto_9d

    :cond_167
    :goto_167
    const/4 v4, 0x0

    move-object/from16 v27, v0

    const-string v28, "LB"

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v29

    goto/16 :goto_9d

    :cond_172
    :goto_172
    const/4 v4, 0x0

    move-object/from16 v27, v0

    const-string v28, "KG"

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v29

    goto/16 :goto_9d
.end method

.method public bridge synthetic parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ParsedResult;
    .registers 2

    invoke-virtual {p0, p1}, Lcom/google/zxing/client/result/ExpandedProductResultParser;->parse(Lcom/google/zxing/Result;)Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    move-result-object p1

    return-object p1
.end method
