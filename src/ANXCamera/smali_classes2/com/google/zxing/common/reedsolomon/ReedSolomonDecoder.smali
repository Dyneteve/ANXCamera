.class public final Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;
.super Ljava/lang/Object;
.source "ReedSolomonDecoder.java"


# instance fields
.field private final field:Lcom/google/zxing/common/reedsolomon/GenericGF;


# direct methods
.method public constructor <init>(Lcom/google/zxing/common/reedsolomon/GenericGF;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    return-void
.end method

.method private findErrorLocations(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_11

    new-array v2, v1, [I

    const/4 v3, 0x0

    invoke-virtual {p1, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v1

    aput v1, v2, v3

    return-object v2

    :cond_11
    new-array v1, v0, [I

    const/4 v2, 0x0

    const/4 v3, 0x1

    :goto_15
    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getSize()I

    move-result v4

    if-ge v3, v4, :cond_33

    if-lt v2, v0, :cond_20

    goto :goto_33

    :cond_20
    invoke-virtual {p1, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v4

    if-nez v4, :cond_30

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v4, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v4

    aput v4, v1, v2

    add-int/lit8 v2, v2, 0x1

    :cond_30
    add-int/lit8 v3, v3, 0x1

    goto :goto_15

    :cond_33
    :goto_33
    if-ne v2, v0, :cond_36

    return-object v1

    :cond_36
    new-instance v3, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v4, "Error locator degree does not match number of roots"

    invoke-direct {v3, v4}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method private findErrorMagnitudes(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;[I)[I
    .registers 12

    array-length v0, p2

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_4
    if-lt v2, v0, :cond_7

    return-object v1

    :cond_7
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v4, p2, v2

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    :goto_11
    if-lt v5, v0, :cond_3a

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {p1, v3}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v6

    iget-object v7, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v7, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v5

    aput v5, v1, v2

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getGeneratorBase()I

    move-result v5

    if-eqz v5, :cond_37

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v6, v1, v2

    invoke-virtual {v5, v6, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v5

    aput v5, v1, v2

    :cond_37
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_3a
    if-eq v2, v5, :cond_53

    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v7, p2, v5

    invoke-virtual {v6, v7, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v6

    and-int/lit8 v7, v6, 0x1

    if-nez v7, :cond_4b

    or-int/lit8 v7, v6, 0x1

    goto :goto_4d

    :cond_4b
    and-int/lit8 v7, v6, -0x2

    :goto_4d
    iget-object v8, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v4, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v4

    :cond_53
    add-int/lit8 v5, v5, 0x1

    goto :goto_11
.end method

.method private runEuclideanAlgorithm(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;Lcom/google/zxing/common/reedsolomon/GenericGFPoly;I)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v0

    invoke-virtual {p2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v1

    if-ge v0, v1, :cond_d

    move-object v0, p1

    move-object p1, p2

    move-object p2, v0

    :cond_d
    move-object v0, p1

    move-object v1, p2

    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v2}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getOne()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v3

    :goto_1b
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v4

    div-int/lit8 v5, p3, 0x2

    if-ge v4, v5, :cond_49

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v5

    if-eqz v5, :cond_41

    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v6, v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v6

    invoke-virtual {v3, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v7

    invoke-virtual {v1, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    const/4 v9, 0x2

    new-array v9, v9, [Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    aput-object v7, v9, v4

    const/4 v4, 0x1

    aput-object v8, v9, v4

    return-object v9

    :cond_41
    new-instance v4, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v6, "sigmaTilde(0) was zero"

    invoke-direct {v4, v6}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v4

    :cond_49
    move-object v4, v0

    move-object v5, v2

    move-object v0, v1

    move-object v2, v3

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v6

    if-nez v6, :cond_bf

    move-object v1, v4

    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v6}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v7

    invoke-virtual {v0, v7}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v7

    iget-object v8, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v8

    :goto_68
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    if-lt v9, v10, :cond_a3

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v9

    if-eqz v9, :cond_79

    goto :goto_a3

    :cond_79
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    sub-int/2addr v9, v10

    iget-object v10, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v11

    invoke-virtual {v10, v11, v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v10

    iget-object v11, p0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v11, v9, v10}, Lcom/google/zxing/common/reedsolomon/GenericGF;->buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v11

    invoke-virtual {v6, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    invoke-virtual {v0, v9, v10}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiplyByMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v11

    invoke-virtual {v1, v11}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v1

    goto :goto_68

    :cond_a3
    :goto_a3
    invoke-virtual {v6, v2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiply(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v9

    invoke-virtual {v9, v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v3

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v9

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v10

    if-ge v9, v10, :cond_b7

    goto/16 :goto_1b

    :cond_b7
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "Division algorithm failed to reduce polynomial?"

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    :cond_bf
    new-instance v6, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v7, "r_{i-1} was zero"

    invoke-direct {v6, v7}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v6
.end method


# virtual methods
.method public decode([II)V
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/common/reedsolomon/ReedSolomonException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    new-instance v3, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v4, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v3, v4, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    new-array v4, v2, [I

    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_11
    const/4 v7, 0x1

    if-lt v6, v2, :cond_5e

    if-eqz v5, :cond_17

    return-void

    :cond_17
    new-instance v6, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v6, v8, v4}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8, v2, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    invoke-direct {v0, v8, v6, v2}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->runEuclideanAlgorithm(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;Lcom/google/zxing/common/reedsolomon/GenericGFPoly;I)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v8

    nop

    const/4 v9, 0x0

    aget-object v9, v8, v9

    aget-object v10, v8, v7

    invoke-direct {v0, v9}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->findErrorLocations(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[I

    move-result-object v11

    invoke-direct {v0, v10, v11}, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->findErrorMagnitudes(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;[I)[I

    move-result-object v12

    const/4 v13, 0x0

    :goto_37
    array-length v14, v11

    if-lt v13, v14, :cond_3b

    return-void

    :cond_3b
    array-length v14, v1

    sub-int/2addr v14, v7

    iget-object v15, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v7, v11, v13

    invoke-virtual {v15, v7}, Lcom/google/zxing/common/reedsolomon/GenericGF;->log(I)I

    move-result v7

    sub-int/2addr v14, v7

    if-ltz v14, :cond_56

    aget v7, v1, v14

    aget v15, v12, v13

    invoke-static {v7, v15}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v7

    aput v7, v1, v14

    add-int/lit8 v13, v13, 0x1

    const/4 v7, 0x1

    goto :goto_37

    :cond_56
    new-instance v7, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;

    const-string v15, "Bad error location"

    invoke-direct {v7, v15}, Lcom/google/zxing/common/reedsolomon/ReedSolomonException;-><init>(Ljava/lang/String;)V

    throw v7

    :cond_5e
    iget-object v7, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v8, v0, Lcom/google/zxing/common/reedsolomon/ReedSolomonDecoder;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getGeneratorBase()I

    move-result v8

    add-int/2addr v8, v6

    invoke-virtual {v7, v8}, Lcom/google/zxing/common/reedsolomon/GenericGF;->exp(I)I

    move-result v7

    invoke-virtual {v3, v7}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->evaluateAt(I)I

    move-result v7

    array-length v8, v4

    const/4 v9, 0x1

    sub-int/2addr v8, v9

    sub-int/2addr v8, v6

    aput v7, v4, v8

    if-eqz v7, :cond_78

    const/4 v5, 0x0

    :cond_78
    add-int/lit8 v6, v6, 0x1

    goto :goto_11
.end method
