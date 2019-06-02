.class public abstract Lcom/google/zxing/oned/OneDimensionalCodeWriter;
.super Ljava/lang/Object;
.source "OneDimensionalCodeWriter.java"

# interfaces
.implements Lcom/google/zxing/Writer;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected static appendPattern([ZI[IZ)I
    .registers 12

    move v0, p3

    const/4 v1, 0x0

    array-length v2, p2

    const/4 v3, 0x0

    move v4, v0

    move v0, p1

    move p1, v3

    :goto_7
    if-lt p1, v2, :cond_a

    return v1

    :cond_a
    aget v5, p2, p1

    const/4 v6, 0x0

    :goto_d
    if-lt v6, v5, :cond_19

    add-int/2addr v1, v5

    if-eqz v4, :cond_14

    move v6, v3

    goto :goto_15

    :cond_14
    const/4 v6, 0x1

    :goto_15
    move v4, v6

    add-int/lit8 p1, p1, 0x1

    goto :goto_7

    :cond_19
    add-int/lit8 v7, v0, 0x1

    aput-boolean v4, p0, v0

    add-int/lit8 v6, v6, 0x1

    move v0, v7

    goto :goto_d
.end method

.method private static renderResult([ZIII)Lcom/google/zxing/common/BitMatrix;
    .registers 14

    array-length v0, p0

    add-int v1, v0, p3

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    div-int v4, v2, v1

    mul-int v5, v0, v4

    sub-int v5, v2, v5

    div-int/lit8 v5, v5, 0x2

    new-instance v6, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v6, v2, v3}, Lcom/google/zxing/common/BitMatrix;-><init>(II)V

    const/4 v7, 0x0

    move v8, v5

    :goto_1b
    if-lt v7, v0, :cond_1e

    return-object v6

    :cond_1e
    aget-boolean v9, p0, v7

    if-eqz v9, :cond_26

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9, v4, v3}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    :cond_26
    add-int/lit8 v7, v7, 0x1

    add-int/2addr v8, v4

    goto :goto_1b
.end method


# virtual methods
.method public final encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;II)Lcom/google/zxing/common/BitMatrix;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;

    move-result-object v0

    return-object v0
.end method

.method public encode(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Lcom/google/zxing/common/BitMatrix;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Lcom/google/zxing/common/BitMatrix;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_43

    if-ltz p3, :cond_27

    if-ltz p4, :cond_27

    invoke-virtual {p0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->getDefaultMargin()I

    move-result v0

    if-eqz p5, :cond_1e

    sget-object v1, Lcom/google/zxing/EncodeHintType;->MARGIN:Lcom/google/zxing/EncodeHintType;

    invoke-interface {p5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_1e
    invoke-virtual {p0, p1}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->encode(Ljava/lang/String;)[Z

    move-result-object v1

    invoke-static {v1, p3, p4, v0}, Lcom/google/zxing/oned/OneDimensionalCodeWriter;->renderResult([ZIII)Lcom/google/zxing/common/BitMatrix;

    move-result-object v2

    return-object v2

    :cond_27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Negative size is not allowed. Input: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v2, 0x78

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_43
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Found empty contents"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public abstract encode(Ljava/lang/String;)[Z
.end method

.method public getDefaultMargin()I
    .registers 2

    const/16 v0, 0xa

    return v0
.end method
