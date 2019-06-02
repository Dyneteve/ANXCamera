.class final Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;
.super Ljava/lang/Object;
.source "PDF417CodewordDecoder.java"


# static fields
.field private static final RATIOS_TABLE:[[F


# direct methods
.method static constructor <clinit>()V
    .registers 9

    sget-object v0, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    array-length v0, v0

    const/16 v1, 0x8

    filled-new-array {v0, v1}, [I

    move-result-object v0

    const-class v2, F

    invoke-static {v2, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[F

    sput-object v0, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    const/4 v0, 0x0

    :goto_14
    sget-object v2, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    array-length v2, v2

    if-lt v0, v2, :cond_1a

    return-void

    :cond_1a
    sget-object v2, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    aget v2, v2, v0

    and-int/lit8 v3, v2, 0x1

    const/4 v4, 0x0

    :goto_21
    if-lt v4, v1, :cond_26

    add-int/lit8 v0, v0, 0x1

    goto :goto_14

    :cond_26
    const/4 v5, 0x0

    :goto_27
    and-int/lit8 v6, v2, 0x1

    if-eq v6, v3, :cond_3e

    and-int/lit8 v3, v2, 0x1

    sget-object v6, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    aget-object v6, v6, v0

    rsub-int/lit8 v7, v4, 0x8

    add-int/lit8 v7, v7, -0x1

    const/high16 v8, 0x41880000    # 17.0f

    div-float v8, v5, v8

    aput v8, v6, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    :cond_3e
    const/high16 v6, 0x3f800000    # 1.0f

    add-float/2addr v5, v6

    shr-int/lit8 v2, v2, 0x1

    goto :goto_27
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getBitValue([I)I
    .registers 10

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    :goto_3
    array-length v3, p0

    if-lt v2, v3, :cond_8

    long-to-int v2, v0

    return v2

    :cond_8
    const/4 v3, 0x0

    :goto_9
    aget v4, p0, v2

    if-lt v3, v4, :cond_10

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_10
    const/4 v4, 0x1

    shl-long v5, v0, v4

    rem-int/lit8 v7, v2, 0x2

    if-nez v7, :cond_18

    goto :goto_19

    :cond_18
    const/4 v4, 0x0

    :goto_19
    int-to-long v7, v4

    or-long v0, v5, v7

    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method private static getClosestDecodedValue([I)I
    .registers 12

    invoke-static {p0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v0

    const/16 v1, 0x8

    new-array v2, v1, [F

    const/4 v3, 0x0

    :goto_9
    array-length v4, v2

    if-lt v3, v4, :cond_3e

    const v3, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v4, -0x1

    const/4 v5, 0x0

    move v6, v3

    :goto_12
    sget-object v3, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    array-length v3, v3

    if-lt v5, v3, :cond_18

    return v4

    :cond_18
    const/4 v3, 0x0

    sget-object v7, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->RATIOS_TABLE:[[F

    aget-object v7, v7, v5

    const/4 v8, 0x0

    :goto_1e
    if-lt v8, v1, :cond_21

    goto :goto_2e

    :cond_21
    aget v9, v7, v8

    aget v10, v2, v8

    sub-float/2addr v9, v10

    mul-float v10, v9, v9

    add-float/2addr v3, v10

    cmpl-float v10, v3, v6

    if-ltz v10, :cond_3b

    nop

    :goto_2e
    cmpg-float v8, v3, v6

    if-gez v8, :cond_38

    move v6, v3

    sget-object v8, Lcom/google/zxing/pdf417/PDF417Common;->SYMBOL_TABLE:[I

    aget v3, v8, v5

    move v4, v3

    :cond_38
    add-int/lit8 v5, v5, 0x1

    goto :goto_12

    :cond_3b
    add-int/lit8 v8, v8, 0x1

    goto :goto_1e

    :cond_3e
    aget v4, p0, v3

    int-to-float v4, v4

    int-to-float v5, v0

    div-float/2addr v4, v5

    aput v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_9
.end method

.method private static getDecodedCodewordValue([I)I
    .registers 4

    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getBitValue([I)I

    move-result v0

    invoke-static {v0}, Lcom/google/zxing/pdf417/PDF417Common;->getCodeword(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_c

    goto :goto_d

    :cond_c
    move v2, v0

    :goto_d
    return v2
.end method

.method static getDecodedValue([I)I
    .registers 3

    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->sampleBitCounts([I)[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getDecodedCodewordValue([I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_c

    return v0

    :cond_c
    invoke-static {p0}, Lcom/google/zxing/pdf417/decoder/PDF417CodewordDecoder;->getClosestDecodedValue([I)I

    move-result v1

    return v1
.end method

.method private static sampleBitCounts([I)[I
    .registers 9

    invoke-static {p0}, Lcom/google/zxing/pdf417/PDF417Common;->getBitCountSum([I)I

    move-result v0

    int-to-float v0, v0

    const/16 v1, 0x8

    new-array v1, v1, [I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_c
    const/16 v5, 0x11

    if-lt v4, v5, :cond_11

    return-object v1

    :cond_11
    const/high16 v5, 0x42080000    # 34.0f

    div-float v5, v0, v5

    int-to-float v6, v4

    mul-float/2addr v6, v0

    const/high16 v7, 0x41880000    # 17.0f

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    nop

    aget v6, p0, v2

    add-int/2addr v6, v3

    int-to-float v6, v6

    cmpg-float v6, v6, v5

    if-gtz v6, :cond_29

    aget v6, p0, v2

    add-int/2addr v3, v6

    add-int/lit8 v2, v2, 0x1

    :cond_29
    aget v6, v1, v2

    add-int/lit8 v6, v6, 0x1

    aput v6, v1, v2

    add-int/lit8 v4, v4, 0x1

    goto :goto_c
.end method
