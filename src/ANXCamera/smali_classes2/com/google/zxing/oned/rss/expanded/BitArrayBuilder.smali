.class final Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;
.super Ljava/lang/Object;
.source "BitArrayBuilder.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static buildBitArray(Ljava/util/List;)Lcom/google/zxing/common/BitArray;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)",
            "Lcom/google/zxing/common/BitArray;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v2

    if-nez v2, :cond_1b

    add-int/lit8 v0, v0, -0x1

    :cond_1b
    const/16 v2, 0xc

    mul-int/2addr v2, v0

    new-instance v3, Lcom/google/zxing/common/BitArray;

    invoke-direct {v3, v2}, Lcom/google/zxing/common/BitArray;-><init>(I)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v6

    const/16 v7, 0xb

    :goto_35
    if-gez v7, :cond_83

    const/4 v7, 0x1

    move v8, v7

    :goto_39
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-lt v8, v7, :cond_40

    return-object v3

    :cond_40
    invoke-interface {p0, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    move-object v9, v7

    check-cast v9, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v10

    const/16 v7, 0xb

    :goto_51
    if-gez v7, :cond_76

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    if-eqz v7, :cond_73

    invoke-virtual {v9}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v7

    const/16 v11, 0xb

    :goto_63
    if-gez v11, :cond_66

    goto :goto_73

    :cond_66
    shl-int v12, v1, v11

    and-int/2addr v12, v7

    if-eqz v12, :cond_6e

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    :cond_6e
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v11, v11, -0x1

    goto :goto_63

    :cond_73
    :goto_73
    add-int/lit8 v8, v8, 0x1

    goto :goto_39

    :cond_76
    shl-int v11, v1, v7

    and-int/2addr v11, v10

    if-eqz v11, :cond_7e

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    :cond_7e
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v7, v7, -0x1

    goto :goto_51

    :cond_83
    shl-int v8, v1, v7

    and-int/2addr v8, v6

    if-eqz v8, :cond_8b

    invoke-virtual {v3, v4}, Lcom/google/zxing/common/BitArray;->set(I)V

    :cond_8b
    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v7, v7, -0x1

    goto :goto_35
.end method
