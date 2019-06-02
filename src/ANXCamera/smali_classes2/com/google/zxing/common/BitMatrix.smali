.class public final Lcom/google/zxing/common/BitMatrix;
.super Ljava/lang/Object;
.source "BitMatrix.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private final bits:[I

.field private final height:I

.field private final rowSize:I

.field private final width:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0, p1, p1}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    return-void
.end method

.method public constructor <init>(II)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_1a

    if-lt p2, v0, :cond_1a

    iput p1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iput p2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    add-int/lit8 v0, p1, 0x1f

    div-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    return-void

    :cond_1a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Both dimensions must be greater than 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private constructor <init>(III[I)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iput p2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iput p3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iput-object p4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v0, v0

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v0, :cond_7

    return-void

    :cond_7
    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    const/4 v3, 0x0

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public clone()Lcom/google/zxing/common/BitMatrix;
    .registers 6

    new-instance v0, Lcom/google/zxing/common/BitMatrix;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iget-object v4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-virtual {v4}, [I->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [I

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/google/zxing/common/BitMatrix;-><init>(III[I)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->clone()Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/common/BitMatrix;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/common/BitMatrix;

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-ne v2, v3, :cond_26

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-ne v2, v3, :cond_26

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    iget v3, v0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-ne v2, v3, :cond_26

    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget-object v3, v0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_26

    const/4 v1, 0x1

    :cond_26
    return v1
.end method

.method public flip(II)V
    .registers 8

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v1, v0

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    xor-int/2addr v2, v3

    aput v2, v1, v0

    return-void
.end method

.method public get(II)Z
    .registers 6

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v1, v1, v0

    and-int/lit8 v2, p1, 0x1f

    ushr-int/2addr v1, v2

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-eqz v1, :cond_12

    return v2

    :cond_12
    const/4 v1, 0x0

    return v1
.end method

.method public getBottomRightOnBit()[I
    .registers 9

    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v0, v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_5
    if-ltz v0, :cond_11

    iget-object v2, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v2, v0

    if-eqz v2, :cond_e

    goto :goto_11

    :cond_e
    add-int/lit8 v0, v0, -0x1

    goto :goto_5

    :cond_11
    :goto_11
    if-gez v0, :cond_15

    const/4 v1, 0x0

    return-object v1

    :cond_15
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    div-int v2, v0, v2

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    rem-int v3, v0, v3

    mul-int/lit8 v3, v3, 0x20

    iget-object v4, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v4, v4, v0

    const/16 v5, 0x1f

    :goto_25
    ushr-int v6, v4, v5

    if-eqz v6, :cond_33

    add-int/2addr v3, v5

    const/4 v6, 0x2

    new-array v6, v6, [I

    const/4 v7, 0x0

    aput v3, v6, v7

    aput v2, v6, v1

    return-object v6

    :cond_33
    add-int/lit8 v5, v5, -0x1

    goto :goto_25
.end method

.method public getEnclosingRectangle()[I
    .registers 10

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, 0x0

    :goto_7
    iget v5, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-lt v4, v5, :cond_26

    sub-int v4, v2, v0

    sub-int v5, v3, v1

    if-ltz v4, :cond_24

    if-gez v5, :cond_14

    goto :goto_24

    :cond_14
    const/4 v6, 0x4

    new-array v6, v6, [I

    const/4 v7, 0x0

    aput v0, v6, v7

    const/4 v7, 0x1

    aput v1, v6, v7

    const/4 v7, 0x2

    aput v4, v6, v7

    const/4 v7, 0x3

    aput v5, v6, v7

    return-object v6

    :cond_24
    :goto_24
    const/4 v6, 0x0

    return-object v6

    :cond_26
    const/4 v5, 0x0

    :goto_27
    iget v6, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-lt v5, v6, :cond_2e

    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_2e
    iget-object v6, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget v7, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v7, v4

    add-int/2addr v7, v5

    aget v6, v6, v7

    if-eqz v6, :cond_6f

    if-ge v4, v1, :cond_3b

    move v1, v4

    :cond_3b
    if-le v4, v3, :cond_3e

    move v3, v4

    :cond_3e
    mul-int/lit8 v7, v5, 0x20

    if-ge v7, v0, :cond_56

    const/4 v7, 0x0

    :goto_43
    rsub-int/lit8 v8, v7, 0x1f

    shl-int v8, v6, v8

    if-eqz v8, :cond_53

    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    if-ge v8, v0, :cond_56

    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    move v0, v8

    goto :goto_56

    :cond_53
    add-int/lit8 v7, v7, 0x1

    goto :goto_43

    :cond_56
    :goto_56
    mul-int/lit8 v7, v5, 0x20

    add-int/lit8 v7, v7, 0x1f

    if-le v7, v2, :cond_6f

    const/16 v7, 0x1f

    :goto_5e
    ushr-int v8, v6, v7

    if-eqz v8, :cond_6c

    mul-int/lit8 v8, v5, 0x20

    add-int/2addr v8, v7

    if-le v8, v2, :cond_6f

    mul-int/lit8 v8, v5, 0x20

    add-int v2, v8, v7

    goto :goto_6f

    :cond_6c
    add-int/lit8 v7, v7, -0x1

    goto :goto_5e

    :cond_6f
    :goto_6f
    add-int/lit8 v5, v5, 0x1

    goto :goto_27
.end method

.method public getHeight()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    return v0
.end method

.method public getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;
    .registers 8

    if-eqz p2, :cond_f

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v0

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-ge v0, v1, :cond_b

    goto :goto_f

    :cond_b
    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->clear()V

    goto :goto_18

    :cond_f
    :goto_f
    new-instance v0, Lcom/google/zxing/common/BitArray;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    invoke-direct {v0, v1}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    move-object p2, v0

    nop

    :goto_18
    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p1

    const/4 v1, 0x0

    :goto_1c
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    if-lt v1, v2, :cond_21

    return-object p2

    :cond_21
    mul-int/lit8 v2, v1, 0x20

    iget-object v3, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    add-int v4, v0, v1

    aget v3, v3, v4

    invoke-virtual {p2, v2, v3}, Lcom/google/zxing/common/BitArray;->setBulk(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1c
.end method

.method public getTopLeftOnBit()[I
    .registers 8

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v1, v1

    if-ge v0, v1, :cond_10

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v1, v1, v0

    if-eqz v1, :cond_d

    goto :goto_10

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_10
    :goto_10
    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    array-length v1, v1

    if-ne v0, v1, :cond_17

    const/4 v1, 0x0

    return-object v1

    :cond_17
    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    div-int v1, v0, v1

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    rem-int v2, v0, v2

    mul-int/lit8 v2, v2, 0x20

    iget-object v3, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v3, v3, v0

    const/4 v4, 0x0

    :goto_26
    rsub-int/lit8 v5, v4, 0x1f

    shl-int v5, v3, v5

    if-eqz v5, :cond_37

    add-int/2addr v2, v4

    const/4 v5, 0x2

    new-array v5, v5, [I

    const/4 v6, 0x0

    aput v2, v5, v6

    const/4 v6, 0x1

    aput v1, v5, v6

    return-object v5

    :cond_37
    add-int/lit8 v4, v4, 0x1

    goto :goto_26
.end method

.method public getWidth()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    return v0
.end method

.method public hashCode()I
    .registers 5

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    const/16 v1, 0x1f

    mul-int v2, v1, v0

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    add-int/2addr v2, v3

    mul-int v0, v1, v2

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    add-int/2addr v0, v3

    mul-int v2, v1, v0

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    add-int/2addr v2, v3

    mul-int/2addr v1, v2

    iget-object v0, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public rotate180()V
    .registers 7

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/common/BitMatrix;->getHeight()I

    move-result v1

    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2, v0}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    new-instance v3, Lcom/google/zxing/common/BitArray;

    invoke-direct {v3, v0}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    const/4 v4, 0x0

    :goto_13
    add-int/lit8 v5, v1, 0x1

    div-int/lit8 v5, v5, 0x2

    if-lt v4, v5, :cond_1a

    return-void

    :cond_1a
    invoke-virtual {p0, v4, v2}, Lcom/google/zxing/common/BitMatrix;->getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;

    move-result-object v2

    add-int/lit8 v5, v1, -0x1

    sub-int/2addr v5, v4

    invoke-virtual {p0, v5, v3}, Lcom/google/zxing/common/BitMatrix;->getRow(ILcom/google/zxing/common/BitArray;)Lcom/google/zxing/common/BitArray;

    move-result-object v3

    invoke-virtual {v2}, Lcom/google/zxing/common/BitArray;->reverse()V

    invoke-virtual {v3}, Lcom/google/zxing/common/BitArray;->reverse()V

    invoke-virtual {p0, v4, v3}, Lcom/google/zxing/common/BitMatrix;->setRow(ILcom/google/zxing/common/BitArray;)V

    add-int/lit8 v5, v1, -0x1

    sub-int/2addr v5, v4

    invoke-virtual {p0, v5, v2}, Lcom/google/zxing/common/BitMatrix;->setRow(ILcom/google/zxing/common/BitArray;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_13
.end method

.method public set(II)V
    .registers 8

    iget v0, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v0, p2

    div-int/lit8 v1, p1, 0x20

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    aget v2, v1, v0

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    aput v2, v1, v0

    return-void
.end method

.method public setRegion(IIII)V
    .registers 15

    if-ltz p2, :cond_43

    if-ltz p1, :cond_43

    const/4 v0, 0x1

    if-lt p4, v0, :cond_3b

    if-lt p3, v0, :cond_3b

    add-int v1, p1, p3

    add-int v2, p2, p4

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-gt v2, v3, :cond_33

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-gt v1, v3, :cond_33

    move v3, p2

    :goto_16
    if-lt v3, v2, :cond_19

    return-void

    :cond_19
    iget v4, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v4, v3

    move v5, p1

    :goto_1d
    if-lt v5, v1, :cond_22

    add-int/lit8 v3, v3, 0x1

    goto :goto_16

    :cond_22
    iget-object v6, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    div-int/lit8 v7, v5, 0x20

    add-int/2addr v7, v4

    aget v8, v6, v7

    and-int/lit8 v9, v5, 0x1f

    shl-int v9, v0, v9

    or-int/2addr v8, v9

    aput v8, v6, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_1d

    :cond_33
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v3, "The region must fit inside the matrix"

    invoke-direct {v0, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Height and width must be at least 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Left and top must be nonnegative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setRow(ILcom/google/zxing/common/BitArray;)V
    .registers 8

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getBitArray()[I

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/common/BitMatrix;->bits:[I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    mul-int/2addr v2, p1

    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->rowSize:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    add-int/lit8 v2, v2, 0x1

    mul-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    :goto_d
    iget v2, p0, Lcom/google/zxing/common/BitMatrix;->height:I

    if-lt v1, v2, :cond_16

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_16
    const/4 v2, 0x0

    :goto_17
    iget v3, p0, Lcom/google/zxing/common/BitMatrix;->width:I

    if-lt v2, v3, :cond_23

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_23
    invoke-virtual {p0, v2, v1}, Lcom/google/zxing/common/BitMatrix;->get(II)Z

    move-result v3

    if-eqz v3, :cond_2c

    const-string v3, "X "

    goto :goto_2e

    :cond_2c
    const-string v3, "  "

    :goto_2e
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_17
.end method
