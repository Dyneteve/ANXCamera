.class public final Lcom/google/zxing/oned/EAN13Reader;
.super Lcom/google/zxing/oned/UPCEANReader;
.source "EAN13Reader.java"


# static fields
.field static final FIRST_DIGIT_ENCODINGS:[I


# instance fields
.field private final decodeMiddleCounters:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0xa

    new-array v0, v0, [I

    const/4 v1, 0x1

    const/16 v2, 0xb

    aput v2, v0, v1

    const/4 v1, 0x2

    const/16 v2, 0xd

    aput v2, v0, v1

    const/4 v1, 0x3

    const/16 v2, 0xe

    aput v2, v0, v1

    const/4 v1, 0x4

    const/16 v2, 0x13

    aput v2, v0, v1

    const/4 v1, 0x5

    const/16 v2, 0x19

    aput v2, v0, v1

    const/4 v1, 0x6

    const/16 v2, 0x1c

    aput v2, v0, v1

    const/4 v1, 0x7

    const/16 v2, 0x15

    aput v2, v0, v1

    const/16 v1, 0x8

    const/16 v2, 0x16

    aput v2, v0, v1

    const/16 v1, 0x9

    const/16 v2, 0x1a

    aput v2, v0, v1

    sput-object v0, Lcom/google/zxing/oned/EAN13Reader;->FIRST_DIGIT_ENCODINGS:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANReader;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/EAN13Reader;->decodeMiddleCounters:[I

    return-void
.end method

.method private static determineFirstDigit(Ljava/lang/StringBuilder;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0xa

    if-ge v0, v1, :cond_17

    sget-object v1, Lcom/google/zxing/oned/EAN13Reader;->FIRST_DIGIT_ENCODINGS:[I

    aget v1, v1, v0

    if-ne p1, v1, :cond_14

    const/4 v1, 0x0

    const/16 v2, 0x30

    add-int/2addr v2, v0

    int-to-char v2, v2

    invoke-virtual {p0, v1, v2}, Ljava/lang/StringBuilder;->insert(IC)Ljava/lang/StringBuilder;

    return-void

    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method


# virtual methods
.method protected decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p3

    move-object/from16 v2, p0

    iget-object v3, v2, Lcom/google/zxing/oned/EAN13Reader;->decodeMiddleCounters:[I

    const/4 v4, 0x0

    aput v4, v3, v4

    const/4 v5, 0x1

    aput v4, v3, v5

    const/4 v6, 0x2

    aput v4, v3, v6

    const/4 v6, 0x3

    aput v4, v3, v6

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    aget v7, p2, v5

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_1c
    const/16 v10, 0x30

    const/4 v11, 0x6

    if-ge v9, v11, :cond_4a

    if-lt v7, v6, :cond_24

    goto :goto_4a

    :cond_24
    sget-object v11, Lcom/google/zxing/oned/EAN13Reader;->L_AND_G_PATTERNS:[[I

    invoke-static {v0, v3, v7, v11}, Lcom/google/zxing/oned/EAN13Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v12

    rem-int/lit8 v11, v12, 0xa

    add-int/2addr v10, v11

    int-to-char v10, v10

    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v13, v3

    move v10, v7

    move v7, v4

    :goto_34
    if-lt v7, v13, :cond_44

    const/16 v7, 0xa

    if-lt v12, v7, :cond_40

    rsub-int/lit8 v7, v9, 0x5

    shl-int v7, v5, v7

    or-int/2addr v7, v8

    move v8, v7

    :cond_40
    add-int/lit8 v9, v9, 0x1

    move v7, v10

    goto :goto_1c

    :cond_44
    aget v11, v3, v7

    add-int/2addr v10, v11

    add-int/lit8 v7, v7, 0x1

    goto :goto_34

    :cond_4a
    :goto_4a
    invoke-static {v1, v8}, Lcom/google/zxing/oned/EAN13Reader;->determineFirstDigit(Ljava/lang/StringBuilder;I)V

    sget-object v9, Lcom/google/zxing/oned/EAN13Reader;->MIDDLE_PATTERN:[I

    invoke-static {v0, v7, v5, v9}, Lcom/google/zxing/oned/EAN13Reader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v9

    aget v5, v9, v5

    const/4 v7, 0x0

    :goto_56
    if-ge v7, v11, :cond_76

    if-lt v5, v6, :cond_5b

    goto :goto_76

    :cond_5b
    sget-object v12, Lcom/google/zxing/oned/EAN13Reader;->L_PATTERNS:[[I

    invoke-static {v0, v3, v5, v12}, Lcom/google/zxing/oned/EAN13Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v12

    add-int v13, v10, v12

    int-to-char v13, v13

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v13, v3

    move v14, v5

    move v5, v4

    :goto_6a
    if-lt v5, v13, :cond_70

    add-int/lit8 v7, v7, 0x1

    move v5, v14

    goto :goto_56

    :cond_70
    aget v15, v3, v5

    add-int/2addr v14, v15

    add-int/lit8 v5, v5, 0x1

    goto :goto_6a

    :cond_76
    :goto_76
    return v5
.end method

.method getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .registers 2

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method
