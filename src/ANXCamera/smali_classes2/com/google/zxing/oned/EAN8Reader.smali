.class public final Lcom/google/zxing/oned/EAN8Reader;
.super Lcom/google/zxing/oned/UPCEANReader;
.source "EAN8Reader.java"


# instance fields
.field private final decodeMiddleCounters:[I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/zxing/oned/UPCEANReader;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/EAN8Reader;->decodeMiddleCounters:[I

    return-void
.end method


# virtual methods
.method protected decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/EAN8Reader;->decodeMiddleCounters:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v3, 0x2

    aput v1, v0, v3

    const/4 v3, 0x3

    aput v1, v0, v3

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    aget v4, p2, v2

    const/4 v5, 0x0

    :goto_15
    const/16 v6, 0x30

    const/4 v7, 0x4

    if-ge v5, v7, :cond_37

    if-lt v4, v3, :cond_1d

    goto :goto_37

    :cond_1d
    sget-object v7, Lcom/google/zxing/oned/EAN8Reader;->L_PATTERNS:[[I

    invoke-static {p1, v0, v4, v7}, Lcom/google/zxing/oned/EAN8Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    add-int/2addr v6, v8

    int-to-char v6, v6

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v9, v0

    move v6, v4

    move v4, v1

    :goto_2b
    if-lt v4, v9, :cond_31

    add-int/lit8 v5, v5, 0x1

    move v4, v6

    goto :goto_15

    :cond_31
    aget v7, v0, v4

    add-int/2addr v6, v7

    add-int/lit8 v4, v4, 0x1

    goto :goto_2b

    :cond_37
    :goto_37
    sget-object v5, Lcom/google/zxing/oned/EAN8Reader;->MIDDLE_PATTERN:[I

    invoke-static {p1, v4, v2, v5}, Lcom/google/zxing/oned/EAN8Reader;->findGuardPattern(Lcom/google/zxing/common/BitArray;IZ[I)[I

    move-result-object v5

    aget v2, v5, v2

    const/4 v4, 0x0

    :goto_40
    if-ge v4, v7, :cond_60

    if-lt v2, v3, :cond_45

    goto :goto_60

    :cond_45
    sget-object v8, Lcom/google/zxing/oned/EAN8Reader;->L_PATTERNS:[[I

    invoke-static {p1, v0, v2, v8}, Lcom/google/zxing/oned/EAN8Reader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    add-int v9, v6, v8

    int-to-char v9, v9

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v9, v0

    move v10, v2

    move v2, v1

    :goto_54
    if-lt v2, v9, :cond_5a

    add-int/lit8 v4, v4, 0x1

    move v2, v10

    goto :goto_40

    :cond_5a
    aget v11, v0, v2

    add-int/2addr v10, v11

    add-int/lit8 v2, v2, 0x1

    goto :goto_54

    :cond_60
    :goto_60
    return v2
.end method

.method getBarcodeFormat()Lcom/google/zxing/BarcodeFormat;
    .registers 2

    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_8:Lcom/google/zxing/BarcodeFormat;

    return-object v0
.end method
