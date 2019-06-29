.class public final Lcom/google/zxing/common/BitArray;
.super Ljava/lang/Object;
.source "BitArray.java"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private bits:[I

.field private size:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/common/BitArray;->size:I

    invoke-static {p1}, Lcom/google/zxing/common/BitArray;->makeArray(I)[I

    move-result-object v0

    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    return-void
.end method

.method constructor <init>([II)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iput p2, p0, Lcom/google/zxing/common/BitArray;->size:I

    return-void
.end method

.method private ensureCapacity(I)V
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    mul-int/lit8 v0, v0, 0x20

    if-le p1, v0, :cond_16

    invoke-static {p1}, Lcom/google/zxing/common/BitArray;->makeArray(I)[I

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    :cond_16
    return-void
.end method

.method private static makeArray(I)[I
    .registers 2

    add-int/lit8 v0, p0, 0x1f

    div-int/lit8 v0, v0, 0x20

    new-array v0, v0, [I

    return-object v0
.end method


# virtual methods
.method public appendBit(Z)V
    .registers 7

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-direct {p0, v0}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    if-eqz p1, :cond_1a

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    div-int/lit8 v2, v2, 0x20

    aget v3, v0, v2

    iget v4, p0, Lcom/google/zxing/common/BitArray;->size:I

    and-int/lit8 v4, v4, 0x1f

    shl-int v4, v1, v4

    or-int/2addr v3, v4

    aput v3, v0, v2

    :cond_1a
    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return-void
.end method

.method public appendBitArray(Lcom/google/zxing/common/BitArray;)V
    .registers 5

    iget v0, p1, Lcom/google/zxing/common/BitArray;->size:I

    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v1, v0

    invoke-direct {p0, v1}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    const/4 v1, 0x0

    :goto_9
    if-lt v1, v0, :cond_c

    return-void

    :cond_c
    invoke-virtual {p1, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method public appendBits(II)V
    .registers 6

    if-ltz p2, :cond_20

    const/16 v0, 0x20

    if-gt p2, v0, :cond_20

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/2addr v0, p2

    invoke-direct {p0, v0}, Lcom/google/zxing/common/BitArray;->ensureCapacity(I)V

    move v0, p2

    :goto_d
    if-gtz v0, :cond_10

    return-void

    :cond_10
    add-int/lit8 v1, v0, -0x1

    shr-int v1, p1, v1

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-ne v1, v2, :cond_19

    goto :goto_1a

    :cond_19
    const/4 v2, 0x0

    :goto_1a
    invoke-virtual {p0, v2}, Lcom/google/zxing/common/BitArray;->appendBit(Z)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    :cond_20
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Num bits must be between 0 and 32"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public clear()V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    const/4 v1, 0x0

    :goto_4
    if-lt v1, v0, :cond_7

    return-void

    :cond_7
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    const/4 v3, 0x0

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4
.end method

.method public clone()Lcom/google/zxing/common/BitArray;
    .registers 4

    new-instance v0, Lcom/google/zxing/common/BitArray;

    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-virtual {v1}, [I->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    invoke-direct {v0, v1, v2}, Lcom/google/zxing/common/BitArray;-><init>([II)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->clone()Lcom/google/zxing/common/BitArray;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 6

    instance-of v0, p1, Lcom/google/zxing/common/BitArray;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    move-object v0, p1

    check-cast v0, Lcom/google/zxing/common/BitArray;

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    iget v3, v0, Lcom/google/zxing/common/BitArray;->size:I

    if-ne v2, v3, :cond_1a

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    iget-object v3, v0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_1a

    const/4 v1, 0x1

    :cond_1a
    return v1
.end method

.method public flip(I)V
    .registers 7

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v2, v0, v1

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    xor-int/2addr v2, v3

    aput v2, v0, v1

    return-void
.end method

.method public get(I)Z
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v0, v0, v1

    and-int/lit8 v1, p1, 0x1f

    const/4 v2, 0x1

    shl-int v1, v2, v1

    and-int/2addr v0, v1

    if-eqz v0, :cond_f

    return v2

    :cond_f
    const/4 v0, 0x0

    return v0
.end method

.method public getBitArray()[I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    return-object v0
.end method

.method public getNextSet(I)I
    .registers 6

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt p1, v0, :cond_7

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0

    :cond_7
    div-int/lit8 v0, p1, 0x20

    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v1, v0

    and-int/lit8 v2, p1, 0x1f

    const/4 v3, 0x1

    shl-int v2, v3, v2

    sub-int/2addr v2, v3

    not-int v2, v2

    and-int/2addr v1, v2

    :goto_15
    if-eqz v1, :cond_27

    mul-int/lit8 v2, v0, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-le v2, v3, :cond_25

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    goto :goto_26

    :cond_25
    move v3, v2

    :goto_26
    return v3

    :cond_27
    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    if-ne v0, v2, :cond_31

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v2

    :cond_31
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v2, v0

    goto :goto_15
.end method

.method public getNextUnset(I)I
    .registers 6

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt p1, v0, :cond_7

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0

    :cond_7
    div-int/lit8 v0, p1, 0x20

    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v1, v1, v0

    not-int v1, v1

    and-int/lit8 v2, p1, 0x1f

    const/4 v3, 0x1

    shl-int v2, v3, v2

    sub-int/2addr v2, v3

    not-int v2, v2

    and-int/2addr v1, v2

    :goto_16
    if-eqz v1, :cond_28

    mul-int/lit8 v2, v0, 0x20

    invoke-static {v1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v3

    add-int/2addr v2, v3

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-le v2, v3, :cond_26

    iget v3, p0, Lcom/google/zxing/common/BitArray;->size:I

    goto :goto_27

    :cond_26
    move v3, v2

    :goto_27
    return v3

    :cond_28
    add-int/lit8 v0, v0, 0x1

    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v2, v2

    if-ne v0, v2, :cond_32

    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v2

    :cond_32
    iget-object v2, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v2, v2, v0

    not-int v1, v2

    goto :goto_16
.end method

.method public getSize()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    return v0
.end method

.method public getSizeInBytes()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    add-int/lit8 v0, v0, 0x7

    div-int/lit8 v0, v0, 0x8

    return v0
.end method

.method public hashCode()I
    .registers 3

    iget v0, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/16 v1, 0x1f

    mul-int/2addr v1, v0

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([I)I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public isRange(IIZ)Z
    .registers 14

    if-lt p2, p1, :cond_41

    const/4 v0, 0x1

    if-ne p2, p1, :cond_6

    return v0

    :cond_6
    add-int/lit8 v1, p2, -0x1

    div-int/lit8 v2, p1, 0x20

    div-int/lit8 v3, v1, 0x20

    move p2, v2

    move v4, p2

    :goto_e
    if-le v4, v3, :cond_11

    return v0

    :cond_11
    const/4 v5, 0x0

    if-le v4, v2, :cond_16

    move p2, v5

    goto :goto_18

    :cond_16
    and-int/lit8 p2, p1, 0x1f

    :goto_18
    move v6, p2

    const/16 p2, 0x1f

    if-ge v4, v3, :cond_1f

    move v7, p2

    goto :goto_21

    :cond_1f
    and-int/lit8 v7, v1, 0x1f

    :goto_21
    if-nez v6, :cond_27

    if-ne v7, p2, :cond_27

    const/4 p2, -0x1

    goto :goto_2b

    :cond_27
    const/4 p2, 0x0

    move v8, v6

    :goto_29
    if-le v8, v7, :cond_3b

    :goto_2b
    iget-object v8, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v8, v8, v4

    and-int/2addr v8, p2

    if-eqz p3, :cond_34

    move v9, p2

    goto :goto_35

    :cond_34
    move v9, v5

    :goto_35
    if-eq v8, v9, :cond_38

    return v5

    :cond_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_3b
    shl-int v9, v0, v8

    or-int/2addr p2, v9

    add-int/lit8 v8, v8, 0x1

    goto :goto_29

    :cond_41
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public reverse()V
    .registers 13

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    new-array v0, v0, [I

    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x20

    add-int/lit8 v3, v1, 0x1

    const/4 v4, 0x0

    :goto_e
    if-lt v4, v3, :cond_4a

    iget v4, p0, Lcom/google/zxing/common/BitArray;->size:I

    mul-int/lit8 v5, v3, 0x20

    if-eq v4, v5, :cond_47

    mul-int/lit8 v4, v3, 0x20

    iget v5, p0, Lcom/google/zxing/common/BitArray;->size:I

    sub-int/2addr v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_1d
    rsub-int/lit8 v7, v4, 0x1f

    if-lt v6, v7, :cond_40

    const/4 v2, 0x0

    aget v2, v0, v2

    shr-int/2addr v2, v4

    and-int/2addr v2, v5

    const/4 v6, 0x1

    :goto_27
    if-lt v6, v3, :cond_2e

    add-int/lit8 v6, v3, -0x1

    aput v2, v0, v6

    goto :goto_47

    :cond_2e
    aget v7, v0, v6

    rsub-int/lit8 v8, v4, 0x20

    shl-int v8, v7, v8

    or-int/2addr v2, v8

    add-int/lit8 v8, v6, -0x1

    aput v2, v0, v8

    shr-int v8, v7, v4

    and-int v2, v8, v5

    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    :cond_40
    shl-int/lit8 v7, v5, 0x1

    or-int/lit8 v5, v7, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_1d

    :cond_47
    :goto_47
    iput-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    return-void

    :cond_4a
    iget-object v5, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v5, v5, v4

    int-to-long v5, v5

    shr-long v7, v5, v2

    const-wide/32 v9, 0x55555555

    and-long/2addr v7, v9

    and-long/2addr v9, v5

    shl-long/2addr v9, v2

    or-long v5, v7, v9

    const/4 v7, 0x2

    shr-long v8, v5, v7

    const-wide/32 v10, 0x33333333

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    const/4 v7, 0x4

    shr-long v8, v5, v7

    const-wide/32 v10, 0xf0f0f0f

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    const/16 v7, 0x8

    shr-long v8, v5, v7

    const-wide/32 v10, 0xff00ff

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    const/16 v7, 0x10

    shr-long v8, v5, v7

    const-wide/32 v10, 0xffff

    and-long/2addr v8, v10

    and-long/2addr v10, v5

    shl-long/2addr v10, v7

    or-long v5, v8, v10

    sub-int v7, v1, v4

    long-to-int v8, v5

    aput v8, v0, v7

    add-int/lit8 v4, v4, 0x1

    goto/16 :goto_e
.end method

.method public set(I)V
    .registers 7

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aget v2, v0, v1

    and-int/lit8 v3, p1, 0x1f

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v2, v3

    aput v2, v0, v1

    return-void
.end method

.method public setBulk(II)V
    .registers 5

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    div-int/lit8 v1, p1, 0x20

    aput p2, v0, v1

    return-void
.end method

.method public setRange(II)V
    .registers 11

    if-lt p2, p1, :cond_39

    if-ne p2, p1, :cond_5

    return-void

    :cond_5
    add-int/lit8 v0, p2, -0x1

    div-int/lit8 v1, p1, 0x20

    div-int/lit8 v2, v0, 0x20

    move p2, v1

    move v3, p2

    :goto_d
    if-le v3, v2, :cond_10

    return-void

    :cond_10
    if-le v3, v1, :cond_14

    const/4 p2, 0x0

    goto :goto_16

    :cond_14
    and-int/lit8 p2, p1, 0x1f

    :goto_16
    move v4, p2

    const/16 p2, 0x1f

    if-ge v3, v2, :cond_1d

    move v5, p2

    goto :goto_1f

    :cond_1d
    and-int/lit8 v5, v0, 0x1f

    :goto_1f
    if-nez v4, :cond_25

    if-ne v5, p2, :cond_25

    const/4 p2, -0x1

    goto :goto_29

    :cond_25
    const/4 p2, 0x0

    move v6, v4

    :goto_27
    if-le v6, v5, :cond_33

    :goto_29
    iget-object v6, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v7, v6, v3

    or-int/2addr v7, p2

    aput v7, v6, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_33
    const/4 v7, 0x1

    shl-int/2addr v7, v6

    or-int/2addr p2, v7

    add-int/lit8 v6, v6, 0x1

    goto :goto_27

    :cond_39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method

.method public toBytes(I[BII)V
    .registers 10

    const/4 v0, 0x0

    :goto_1
    if-lt v0, p4, :cond_4

    return-void

    :cond_4
    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    const/16 v3, 0x8

    if-lt v2, v3, :cond_12

    add-int v2, p3, v0

    int-to-byte v3, v1

    aput-byte v3, p2, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_12
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v3

    if-eqz v3, :cond_1e

    rsub-int/lit8 v3, v2, 0x7

    const/4 v4, 0x1

    shl-int v3, v4, v3

    or-int/2addr v1, v3

    :cond_1e
    add-int/lit8 p1, p1, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/zxing/common/BitArray;->size:I

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    :goto_8
    iget v2, p0, Lcom/google/zxing/common/BitArray;->size:I

    if-lt v1, v2, :cond_11

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    :cond_11
    and-int/lit8 v2, v1, 0x7

    if-nez v2, :cond_1a

    const/16 v2, 0x20

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1a
    invoke-virtual {p0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    if-eqz v2, :cond_23

    const/16 v2, 0x58

    goto :goto_25

    :cond_23
    const/16 v2, 0x2e

    :goto_25
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_8
.end method

.method public xor(Lcom/google/zxing/common/BitArray;)V
    .registers 6

    iget-object v0, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v0, v0

    iget-object v1, p1, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v1, v1

    if-ne v0, v1, :cond_1d

    const/4 v0, 0x0

    :goto_9
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    array-length v1, v1

    if-lt v0, v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p0, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v2, v1, v0

    iget-object v3, p1, Lcom/google/zxing/common/BitArray;->bits:[I

    aget v3, v3, v0

    xor-int/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    :cond_1d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Sizes don\'t match"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
