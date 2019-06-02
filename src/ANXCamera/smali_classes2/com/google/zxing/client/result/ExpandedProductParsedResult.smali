.class public final Lcom/google/zxing/client/result/ExpandedProductParsedResult;
.super Lcom/google/zxing/client/result/ParsedResult;
.source "ExpandedProductParsedResult.java"


# static fields
.field public static final KILOGRAM:Ljava/lang/String; = "KG"

.field public static final POUND:Ljava/lang/String; = "LB"


# instance fields
.field private final bestBeforeDate:Ljava/lang/String;

.field private final expirationDate:Ljava/lang/String;

.field private final lotNumber:Ljava/lang/String;

.field private final packagingDate:Ljava/lang/String;

.field private final price:Ljava/lang/String;

.field private final priceCurrency:Ljava/lang/String;

.field private final priceIncrement:Ljava/lang/String;

.field private final productID:Ljava/lang/String;

.field private final productionDate:Ljava/lang/String;

.field private final rawText:Ljava/lang/String;

.field private final sscc:Ljava/lang/String;

.field private final uncommonAIs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final weight:Ljava/lang/String;

.field private final weightIncrement:Ljava/lang/String;

.field private final weightType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 32
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    sget-object v1, Lcom/google/zxing/client/result/ParsedResultType;->PRODUCT:Lcom/google/zxing/client/result/ParsedResultType;

    invoke-direct {v0, v1}, Lcom/google/zxing/client/result/ParsedResult;-><init>(Lcom/google/zxing/client/result/ParsedResultType;)V

    move-object/from16 v1, p1

    iput-object v1, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->rawText:Ljava/lang/String;

    move-object/from16 v2, p2

    iput-object v2, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productID:Ljava/lang/String;

    move-object/from16 v3, p3

    iput-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->sscc:Ljava/lang/String;

    move-object/from16 v4, p4

    iput-object v4, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->lotNumber:Ljava/lang/String;

    move-object/from16 v5, p5

    iput-object v5, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productionDate:Ljava/lang/String;

    move-object/from16 v6, p6

    iput-object v6, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->packagingDate:Ljava/lang/String;

    move-object/from16 v7, p7

    iput-object v7, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->bestBeforeDate:Ljava/lang/String;

    move-object/from16 v8, p8

    iput-object v8, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->expirationDate:Ljava/lang/String;

    move-object/from16 v9, p9

    iput-object v9, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weight:Ljava/lang/String;

    move-object/from16 v10, p10

    iput-object v10, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightType:Ljava/lang/String;

    move-object/from16 v11, p11

    iput-object v11, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightIncrement:Ljava/lang/String;

    move-object/from16 v12, p12

    iput-object v12, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->price:Ljava/lang/String;

    move-object/from16 v13, p13

    iput-object v13, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceIncrement:Ljava/lang/String;

    move-object/from16 v14, p14

    iput-object v14, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceCurrency:Ljava/lang/String;

    move-object/from16 v15, p15

    iput-object v15, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->uncommonAIs:Ljava/util/Map;

    return-void
.end method

.method private static equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    if-nez p0, :cond_8

    if-nez p1, :cond_6

    const/4 v0, 0x1

    goto :goto_c

    :cond_6
    const/4 v0, 0x0

    goto :goto_c

    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_c
    return v0
.end method

.method private static hashNotNull(Ljava/lang/Object;)I
    .registers 2

    if-nez p0, :cond_4

    const/4 v0, 0x0

    goto :goto_8

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_8
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productID:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productID:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->sscc:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->sscc:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->lotNumber:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->lotNumber:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productionDate:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productionDate:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->bestBeforeDate:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->bestBeforeDate:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->expirationDate:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->expirationDate:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weight:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weight:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightType:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightType:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightIncrement:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightIncrement:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->price:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->price:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceIncrement:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceIncrement:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceCurrency:Ljava/lang/String;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceCurrency:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    iget-object v2, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->uncommonAIs:Ljava/util/Map;

    iget-object v3, v0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->uncommonAIs:Ljava/util/Map;

    invoke-static {v2, v3}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->equalsOrNull(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8c

    const/4 v1, 0x1

    :cond_8c
    return v1
.end method

.method public getBestBeforeDate()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->bestBeforeDate:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayResult()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->rawText:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExpirationDate()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->expirationDate:Ljava/lang/String;

    return-object v0
.end method

.method public getLotNumber()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->lotNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getPackagingDate()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->packagingDate:Ljava/lang/String;

    return-object v0
.end method

.method public getPrice()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->price:Ljava/lang/String;

    return-object v0
.end method

.method public getPriceCurrency()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceCurrency:Ljava/lang/String;

    return-object v0
.end method

.method public getPriceIncrement()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceIncrement:Ljava/lang/String;

    return-object v0
.end method

.method public getProductID()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productID:Ljava/lang/String;

    return-object v0
.end method

.method public getProductionDate()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productionDate:Ljava/lang/String;

    return-object v0
.end method

.method public getRawText()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->rawText:Ljava/lang/String;

    return-object v0
.end method

.method public getSscc()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->sscc:Ljava/lang/String;

    return-object v0
.end method

.method public getUncommonAIs()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->uncommonAIs:Ljava/util/Map;

    return-object v0
.end method

.method public getWeight()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weight:Ljava/lang/String;

    return-object v0
.end method

.method public getWeightIncrement()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightIncrement:Ljava/lang/String;

    return-object v0
.end method

.method public getWeightType()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightType:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 3

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productID:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->sscc:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->lotNumber:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->productionDate:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->bestBeforeDate:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->expirationDate:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weight:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightType:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->weightIncrement:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->price:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceIncrement:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->priceCurrency:Ljava/lang/String;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->uncommonAIs:Ljava/util/Map;

    invoke-static {v1}, Lcom/google/zxing/client/result/ExpandedProductParsedResult;->hashNotNull(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method
