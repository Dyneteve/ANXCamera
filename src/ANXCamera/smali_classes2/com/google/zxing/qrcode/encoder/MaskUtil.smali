.class final Lcom/google/zxing/qrcode/encoder/MaskUtil;
.super Ljava/lang/Object;
.source "MaskUtil.java"


# static fields
.field private static final N1:I = 0x3

.field private static final N2:I = 0x3

.field private static final N3:I = 0x28

.field private static final N4:I = 0xa


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static applyMaskPenaltyRule1(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 3

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {p0, v1}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method private static applyMaskPenaltyRule1Internal(Lcom/google/zxing/qrcode/encoder/ByteMatrix;Z)I
    .registers 13

    const/4 v0, 0x0

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v1

    goto :goto_c

    :cond_8
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v1

    :goto_c
    if-eqz p1, :cond_13

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    goto :goto_17

    :cond_13
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v2

    :goto_17
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v3

    const/4 v4, 0x0

    :goto_1c
    if-lt v4, v1, :cond_1f

    return v0

    :cond_1f
    const/4 v5, 0x0

    const/4 v6, -0x1

    const/4 v7, 0x0

    :goto_22
    const/4 v8, 0x3

    const/4 v9, 0x5

    if-lt v7, v2, :cond_2f

    if-lt v5, v9, :cond_2c

    add-int/lit8 v7, v5, -0x5

    add-int/2addr v8, v7

    add-int/2addr v0, v8

    :cond_2c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c

    :cond_2f
    if-eqz p1, :cond_36

    aget-object v10, v3, v4

    aget-byte v10, v10, v7

    goto :goto_3a

    :cond_36
    aget-object v10, v3, v7

    aget-byte v10, v10, v4

    :goto_3a
    if-ne v10, v6, :cond_3f

    add-int/lit8 v5, v5, 0x1

    goto :goto_47

    :cond_3f
    if-lt v5, v9, :cond_45

    add-int/lit8 v9, v5, -0x5

    add-int/2addr v8, v9

    add-int/2addr v0, v8

    :cond_45
    const/4 v5, 0x1

    move v6, v10

    :goto_47
    add-int/lit8 v7, v7, 0x1

    goto :goto_22
.end method

.method static applyMaskPenaltyRule2(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 10

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    :goto_e
    add-int/lit8 v5, v3, -0x1

    if-lt v4, v5, :cond_15

    const/4 v4, 0x3

    mul-int/2addr v4, v0

    return v4

    :cond_15
    const/4 v5, 0x0

    :goto_16
    add-int/lit8 v6, v2, -0x1

    if-lt v5, v6, :cond_1d

    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_1d
    aget-object v6, v1, v4

    aget-byte v6, v6, v5

    aget-object v7, v1, v4

    add-int/lit8 v8, v5, 0x1

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_3d

    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v6, v7, :cond_3d

    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    add-int/lit8 v8, v5, 0x1

    aget-byte v7, v7, v8

    if-ne v6, v7, :cond_3d

    add-int/lit8 v0, v0, 0x1

    :cond_3d
    add-int/lit8 v5, v5, 0x1

    goto :goto_16
.end method

.method static applyMaskPenaltyRule3(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 11

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    :goto_e
    if-lt v4, v3, :cond_13

    mul-int/lit8 v4, v0, 0x28

    return v4

    :cond_13
    const/4 v5, 0x0

    :goto_14
    if-lt v5, v2, :cond_19

    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_19
    aget-object v6, v1, v4

    add-int/lit8 v7, v5, 0x6

    const/4 v8, 0x1

    if-ge v7, v2, :cond_5c

    aget-byte v7, v6, v5

    if-ne v7, v8, :cond_5c

    add-int/lit8 v7, v5, 0x1

    aget-byte v7, v6, v7

    if-nez v7, :cond_5c

    add-int/lit8 v7, v5, 0x2

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    add-int/lit8 v7, v5, 0x3

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    add-int/lit8 v7, v5, 0x4

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    add-int/lit8 v7, v5, 0x5

    aget-byte v7, v6, v7

    if-nez v7, :cond_5c

    add-int/lit8 v7, v5, 0x6

    aget-byte v7, v6, v7

    if-ne v7, v8, :cond_5c

    add-int/lit8 v7, v5, -0x4

    invoke-static {v6, v7, v5}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteHorizontal([BII)Z

    move-result v7

    if-nez v7, :cond_5a

    add-int/lit8 v7, v5, 0x7

    add-int/lit8 v9, v5, 0xb

    invoke-static {v6, v7, v9}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteHorizontal([BII)Z

    move-result v7

    if-eqz v7, :cond_5c

    :cond_5a
    add-int/lit8 v0, v0, 0x1

    :cond_5c
    add-int/lit8 v7, v4, 0x6

    if-ge v7, v3, :cond_aa

    aget-object v7, v1, v4

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    add-int/lit8 v7, v4, 0x1

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-nez v7, :cond_aa

    add-int/lit8 v7, v4, 0x2

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    add-int/lit8 v7, v4, 0x3

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    add-int/lit8 v7, v4, 0x4

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    add-int/lit8 v7, v4, 0x5

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-nez v7, :cond_aa

    add-int/lit8 v7, v4, 0x6

    aget-object v7, v1, v7

    aget-byte v7, v7, v5

    if-ne v7, v8, :cond_aa

    add-int/lit8 v7, v4, -0x4

    invoke-static {v1, v5, v7, v4}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteVertical([[BIII)Z

    move-result v7

    if-nez v7, :cond_a8

    add-int/lit8 v7, v4, 0x7

    add-int/lit8 v8, v4, 0xb

    invoke-static {v1, v5, v7, v8}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->isWhiteVertical([[BIII)Z

    move-result v7

    if-eqz v7, :cond_aa

    :cond_a8
    add-int/lit8 v0, v0, 0x1

    :cond_aa
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_14
.end method

.method static applyMaskPenaltyRule4(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)I
    .registers 10

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getArray()[[B

    move-result-object v1

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    :goto_e
    if-lt v4, v3, :cond_26

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v5

    mul-int/2addr v4, v5

    mul-int/lit8 v5, v0, 0x2

    sub-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Math;->abs(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0xa

    div-int/2addr v5, v4

    mul-int/lit8 v6, v5, 0xa

    return v6

    :cond_26
    aget-object v5, v1, v4

    const/4 v6, 0x0

    :goto_29
    if-lt v6, v2, :cond_2e

    add-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_2e
    aget-byte v7, v5, v6

    const/4 v8, 0x1

    if-ne v7, v8, :cond_35

    add-int/lit8 v0, v0, 0x1

    :cond_35
    add-int/lit8 v6, v6, 0x1

    goto :goto_29
.end method

.method static getDataMaskBit(III)Z
    .registers 7

    const/4 v0, 0x1

    packed-switch p0, :pswitch_data_52

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid mask pattern: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_18
    mul-int v1, p2, p1

    rem-int/lit8 v2, v1, 0x3

    add-int v3, p2, p1

    and-int/2addr v3, v0

    add-int/2addr v2, v3

    and-int/2addr v2, v0

    goto :goto_4b

    :pswitch_22
    mul-int v1, p2, p1

    and-int/lit8 v2, v1, 0x1

    rem-int/lit8 v3, v1, 0x3

    add-int/2addr v2, v3

    and-int/2addr v2, v0

    goto :goto_4b

    :pswitch_2b
    mul-int v1, p2, p1

    and-int/lit8 v2, v1, 0x1

    rem-int/lit8 v3, v1, 0x3

    add-int/2addr v2, v3

    goto :goto_4b

    :pswitch_33
    div-int/lit8 v1, p2, 0x2

    div-int/lit8 v2, p1, 0x3

    add-int/2addr v1, v2

    and-int/lit8 v2, v1, 0x1

    goto :goto_4b

    :pswitch_3b
    add-int v1, p2, p1

    rem-int/lit8 v2, v1, 0x3

    goto :goto_4b

    :pswitch_40
    rem-int/lit8 v2, p1, 0x3

    goto :goto_4b

    :pswitch_43
    and-int/lit8 v2, p2, 0x1

    goto :goto_4b

    :pswitch_46
    add-int v1, p2, p1

    and-int/lit8 v2, v1, 0x1

    nop

    :goto_4b
    move v1, v2

    if-nez v1, :cond_4f

    return v0

    :cond_4f
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_46
        :pswitch_43
        :pswitch_40
        :pswitch_3b
        :pswitch_33
        :pswitch_2b
        :pswitch_22
        :pswitch_18
    .end packed-switch
.end method

.method private static isWhiteHorizontal([BII)Z
    .registers 6

    move v0, p1

    :goto_1
    const/4 v1, 0x1

    if-lt v0, p2, :cond_5

    return v1

    :cond_5
    if-ltz v0, :cond_10

    array-length v2, p0

    if-ge v0, v2, :cond_10

    aget-byte v2, p0, v0

    if-ne v2, v1, :cond_10

    const/4 v1, 0x0

    return v1

    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static isWhiteVertical([[BIII)Z
    .registers 7

    move v0, p2

    :goto_1
    const/4 v1, 0x1

    if-lt v0, p3, :cond_5

    return v1

    :cond_5
    if-ltz v0, :cond_12

    array-length v2, p0

    if-ge v0, v2, :cond_12

    aget-object v2, p0, v0

    aget-byte v2, v2, p1

    if-ne v2, v1, :cond_12

    const/4 v1, 0x0

    return v1

    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method
