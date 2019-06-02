.class final Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
.super Ljava/lang/Object;
.source "GenericGFPoly.java"


# instance fields
.field private final coefficients:[I

.field private final field:Lcom/google/zxing/common/reedsolomon/GenericGF;


# direct methods
.method constructor <init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    array-length v0, p2

    if-eqz v0, :cond_38

    iput-object p1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    array-length v0, p2

    const/4 v1, 0x1

    if-le v0, v1, :cond_35

    const/4 v2, 0x0

    aget v3, p2, v2

    if-nez v3, :cond_35

    const/4 v3, 0x1

    :goto_12
    if-ge v3, v0, :cond_1c

    aget v4, p2, v3

    if-eqz v4, :cond_19

    goto :goto_1c

    :cond_19
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    :cond_1c
    :goto_1c
    if-ne v3, v0, :cond_23

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    goto :goto_37

    :cond_23
    sub-int v1, v0, v3

    new-array v1, v1, [I

    iput-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    nop

    nop

    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    nop

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v4, v4

    invoke-static {p2, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_37

    :cond_35
    iput-object p2, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    :goto_37
    return-void

    :cond_38
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 9

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v1, p1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    invoke-virtual {p0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v0

    if-eqz v0, :cond_11

    return-object p1

    :cond_11
    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v0

    if-eqz v0, :cond_18

    return-object p0

    :cond_18
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    iget-object v1, p1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v2, v0

    array-length v3, v1

    if-le v2, v3, :cond_23

    move-object v2, v0

    move-object v0, v1

    move-object v1, v2

    :cond_23
    array-length v2, v1

    new-array v2, v2, [I

    array-length v3, v1

    array-length v4, v0

    sub-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move v4, v3

    :goto_2e
    array-length v5, v1

    if-lt v4, v5, :cond_39

    new-instance v4, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v4, v5, v2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    return-object v4

    :cond_39
    sub-int v5, v4, v3

    aget v5, v0, v5

    aget v6, v1, v4

    invoke-static {v5, v6}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v5

    aput v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2e

    :cond_48
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GenericGFPolys do not have same GenericGF field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method divide(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)[Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 10

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v1, p1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v0

    if-nez v0, :cond_6a

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v0

    move-object v1, p0

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v2

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v3, v2}, Lcom/google/zxing/common/reedsolomon/GenericGF;->inverse(I)I

    move-result v3

    :goto_25
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v4

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v5

    if-lt v4, v5, :cond_60

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v4

    if-eqz v4, :cond_36

    goto :goto_60

    :cond_36
    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v4

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v6

    invoke-virtual {v1, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v6

    invoke-virtual {v5, v6, v3}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v5

    invoke-virtual {p1, v4, v5}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->multiplyByMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v6

    iget-object v7, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v7, v4, v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->buildMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v0

    invoke-virtual {v1, v6}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->addOrSubtract(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v1

    goto :goto_25

    :cond_60
    :goto_60
    const/4 v4, 0x2

    new-array v4, v4, [Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    aput-object v1, v4, v5

    return-object v4

    :cond_6a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Divide by 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_72
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GenericGFPolys do not have same GenericGF field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method evaluateAt(I)I
    .registers 8

    const/4 v0, 0x0

    if-nez p1, :cond_8

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v0

    return v0

    :cond_8
    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v1, v1

    const/4 v2, 0x1

    if-ne p1, v2, :cond_1e

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v4, v3

    :goto_12
    if-lt v0, v4, :cond_15

    return v2

    :cond_15
    aget v5, v3, v0

    invoke-static {v2, v5}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_1e
    iget-object v2, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    aget v0, v2, v0

    const/4 v2, 0x1

    :goto_23
    if-lt v2, v1, :cond_26

    return v0

    :cond_26
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v3, p1, v0}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v3

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    aget v4, v4, v2

    invoke-static {v3, v4}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_23
.end method

.method getCoefficient(I)I
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    iget-object v1, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    sub-int/2addr v1, p1

    aget v0, v0, v1

    return v0
.end method

.method getCoefficients()[I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    return-object v0
.end method

.method getDegree()I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method isZero()Z
    .registers 3

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    if-nez v0, :cond_9

    const/4 v0, 0x1

    return v0

    :cond_9
    return v1
.end method

.method multiply(I)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 7

    if-nez p1, :cond_9

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v0

    return-object v0

    :cond_9
    const/4 v0, 0x1

    if-ne p1, v0, :cond_d

    return-object p0

    :cond_d
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v0, v0

    new-array v1, v0, [I

    const/4 v2, 0x0

    :goto_13
    if-lt v2, v0, :cond_1d

    new-instance v2, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    return-object v2

    :cond_1d
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    aget v4, v4, v2

    invoke-virtual {v3, v4, p1}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_13
.end method

.method multiply(Lcom/google/zxing/common/reedsolomon/GenericGFPoly;)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 14

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v1, p1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    invoke-virtual {p0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v0

    if-nez v0, :cond_4d

    invoke-virtual {p1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->isZero()Z

    move-result v0

    if-eqz v0, :cond_17

    goto :goto_4d

    :cond_17
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v1, v0

    iget-object v2, p1, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v3, v2

    add-int v4, v1, v3

    add-int/lit8 v4, v4, -0x1

    new-array v4, v4, [I

    const/4 v5, 0x0

    :goto_24
    if-lt v5, v1, :cond_2e

    new-instance v5, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v6, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v5, v6, v4}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    return-object v5

    :cond_2e
    aget v6, v0, v5

    const/4 v7, 0x0

    :goto_31
    if-lt v7, v3, :cond_36

    add-int/lit8 v5, v5, 0x1

    goto :goto_24

    :cond_36
    add-int v8, v5, v7

    add-int v9, v5, v7

    aget v9, v4, v9

    iget-object v10, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    aget v11, v2, v7

    invoke-virtual {v10, v6, v11}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v10

    invoke-static {v9, v10}, Lcom/google/zxing/common/reedsolomon/GenericGF;->addOrSubtract(II)I

    move-result v9

    aput v9, v4, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_31

    :cond_4d
    :goto_4d
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v0

    return-object v0

    :cond_54
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "GenericGFPolys do not have same GenericGF field"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method multiplyByMonomial(II)Lcom/google/zxing/common/reedsolomon/GenericGFPoly;
    .registers 8

    if-ltz p1, :cond_2c

    if-nez p2, :cond_b

    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v0}, Lcom/google/zxing/common/reedsolomon/GenericGF;->getZero()Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    move-result-object v0

    return-object v0

    :cond_b
    iget-object v0, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    array-length v0, v0

    add-int v1, v0, p1

    new-array v1, v1, [I

    const/4 v2, 0x0

    :goto_13
    if-lt v2, v0, :cond_1d

    new-instance v2, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;

    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-direct {v2, v3, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;-><init>(Lcom/google/zxing/common/reedsolomon/GenericGF;[I)V

    return-object v2

    :cond_1d
    iget-object v3, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->coefficients:[I

    aget v4, v4, v2

    invoke-virtual {v3, v4, p2}, Lcom/google/zxing/common/reedsolomon/GenericGF;->multiply(II)I

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_2c
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v1

    const/16 v2, 0x8

    mul-int/2addr v2, v1

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {p0}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getDegree()I

    move-result v1

    :goto_10
    if-gez v1, :cond_17

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_17
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->getCoefficient(I)I

    move-result v2

    if-eqz v2, :cond_66

    if-gez v2, :cond_26

    const-string v3, " - "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    neg-int v2, v2

    goto :goto_31

    :cond_26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-lez v3, :cond_31

    const-string v3, " + "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_31
    :goto_31
    const/4 v3, 0x1

    if-eqz v1, :cond_36

    if-eq v2, v3, :cond_54

    :cond_36
    iget-object v4, p0, Lcom/google/zxing/common/reedsolomon/GenericGFPoly;->field:Lcom/google/zxing/common/reedsolomon/GenericGF;

    invoke-virtual {v4, v2}, Lcom/google/zxing/common/reedsolomon/GenericGF;->log(I)I

    move-result v4

    if-nez v4, :cond_44

    const/16 v5, 0x31

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_54

    :cond_44
    if-ne v4, v3, :cond_4c

    const/16 v5, 0x61

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_54

    :cond_4c
    const-string v5, "a^"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_54
    :goto_54
    if-eqz v1, :cond_66

    if-ne v1, v3, :cond_5e

    const/16 v3, 0x78

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_66

    :cond_5e
    const-string v3, "x^"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    :cond_66
    :goto_66
    add-int/lit8 v1, v1, -0x1

    goto :goto_10
.end method
