.class final Lcom/google/zxing/oned/UPCEANExtension2Support;
.super Ljava/lang/Object;
.source "UPCEANExtension2Support.java"


# instance fields
.field private final decodeMiddleCounters:[I

.field private final decodeRowStringBuffer:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddleCounters:[I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    return-void
.end method

.method private static parseExtensionString(Ljava/lang/String;)Ljava/util/Map;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Lcom/google/zxing/ResultMetadataType;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_9

    const/4 v0, 0x0

    return-object v0

    :cond_9
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/google/zxing/ResultMetadataType;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    sget-object v1, Lcom/google/zxing/ResultMetadataType;->ISSUE_NUMBER:Lcom/google/zxing/ResultMetadataType;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddleCounters:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v3, 0x2

    aput v1, v0, v3

    const/4 v4, 0x3

    aput v1, v0, v4

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v4

    aget v5, p2, v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_16
    if-ge v7, v3, :cond_4e

    if-lt v5, v4, :cond_1b

    goto :goto_4e

    :cond_1b
    sget-object v8, Lcom/google/zxing/oned/UPCEANReader;->L_AND_G_PATTERNS:[[I

    invoke-static {p1, v0, v5, v8}, Lcom/google/zxing/oned/UPCEANReader;->decodeDigit(Lcom/google/zxing/common/BitArray;[II[[I)I

    move-result v8

    const/16 v9, 0x30

    rem-int/lit8 v10, v8, 0xa

    add-int/2addr v9, v10

    int-to-char v9, v9

    invoke-virtual {p3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    array-length v9, v0

    move v10, v5

    move v5, v1

    :goto_2d
    if-lt v5, v9, :cond_48

    const/16 v5, 0xa

    if-lt v8, v5, :cond_39

    rsub-int/lit8 v5, v7, 0x1

    shl-int v5, v2, v5

    or-int/2addr v5, v6

    move v6, v5

    :cond_39
    if-eq v7, v2, :cond_44

    invoke-virtual {p1, v10}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v5

    invoke-virtual {p1, v5}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v5

    goto :goto_45

    :cond_44
    move v5, v10

    :goto_45
    add-int/lit8 v7, v7, 0x1

    goto :goto_16

    :cond_48
    aget v11, v0, v5

    add-int/2addr v10, v11

    add-int/lit8 v5, v5, 0x1

    goto :goto_2d

    :cond_4e
    :goto_4e
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-ne v1, v3, :cond_66

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    rem-int/lit8 v1, v1, 0x4

    if-ne v1, v6, :cond_61

    return v5

    :cond_61
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_66
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method decodeRow(ILcom/google/zxing/common/BitArray;[I)Lcom/google/zxing/Result;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeRowStringBuffer:Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    invoke-virtual {p0, p2, p3, v0}, Lcom/google/zxing/oned/UPCEANExtension2Support;->decodeMiddle(Lcom/google/zxing/common/BitArray;[ILjava/lang/StringBuilder;)I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/zxing/oned/UPCEANExtension2Support;->parseExtensionString(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    new-instance v5, Lcom/google/zxing/Result;

    nop

    const/4 v6, 0x2

    new-array v6, v6, [Lcom/google/zxing/ResultPoint;

    new-instance v7, Lcom/google/zxing/ResultPoint;

    aget v8, p3, v1

    const/4 v9, 0x1

    aget v10, p3, v9

    add-int/2addr v8, v10

    int-to-float v8, v8

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v8, v10

    int-to-float v10, p1

    invoke-direct {v7, v8, v10}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v7, v6, v1

    new-instance v1, Lcom/google/zxing/ResultPoint;

    int-to-float v7, v2

    int-to-float v8, p1

    invoke-direct {v1, v7, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    aput-object v1, v6, v9

    sget-object v1, Lcom/google/zxing/BarcodeFormat;->UPC_EAN_EXTENSION:Lcom/google/zxing/BarcodeFormat;

    const/4 v7, 0x0

    invoke-direct {v5, v3, v7, v6, v1}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    move-object v1, v5

    if-eqz v4, :cond_3f

    invoke-virtual {v1, v4}, Lcom/google/zxing/Result;->putAllMetadata(Ljava/util/Map;)V

    :cond_3f
    return-object v1
.end method
