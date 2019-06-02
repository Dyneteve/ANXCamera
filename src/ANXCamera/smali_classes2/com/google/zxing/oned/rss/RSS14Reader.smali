.class public final Lcom/google/zxing/oned/rss/RSS14Reader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSS14Reader.java"


# static fields
.field private static final FINDER_PATTERNS:[[I

.field private static final INSIDE_GSUM:[I

.field private static final INSIDE_ODD_TOTAL_SUBSET:[I

.field private static final INSIDE_ODD_WIDEST:[I

.field private static final OUTSIDE_EVEN_TOTAL_SUBSET:[I

.field private static final OUTSIDE_GSUM:[I

.field private static final OUTSIDE_ODD_WIDEST:[I


# instance fields
.field private final possibleLeftPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field

.field private final possibleRightPairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 8

    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_90

    sput-object v1, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    const/4 v1, 0x4

    new-array v2, v1, [I

    fill-array-data v2, :array_9e

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    new-array v2, v0, [I

    const/4 v3, 0x1

    const/16 v4, 0xa1

    aput v4, v2, v3

    const/4 v4, 0x2

    const/16 v5, 0x3c1

    aput v5, v2, v4

    const/4 v5, 0x3

    const/16 v6, 0x7df

    aput v6, v2, v5

    const/16 v6, 0xa9b

    aput v6, v2, v1

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    new-array v2, v1, [I

    const/16 v6, 0x150

    aput v6, v2, v3

    const/16 v6, 0x40c

    aput v6, v2, v4

    const/16 v6, 0x5ec

    aput v6, v2, v5

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    new-array v2, v0, [I

    fill-array-data v2, :array_aa

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    new-array v2, v1, [I

    fill-array-data v2, :array_b8

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    const/16 v2, 0x9

    new-array v2, v2, [[I

    new-array v6, v1, [I

    fill-array-data v6, :array_c4

    const/4 v7, 0x0

    aput-object v6, v2, v7

    new-array v6, v1, [I

    fill-array-data v6, :array_d0

    aput-object v6, v2, v3

    new-array v3, v1, [I

    fill-array-data v3, :array_dc

    aput-object v3, v2, v4

    new-array v3, v1, [I

    fill-array-data v3, :array_e8

    aput-object v3, v2, v5

    new-array v3, v1, [I

    fill-array-data v3, :array_f4

    aput-object v3, v2, v1

    new-array v3, v1, [I

    fill-array-data v3, :array_100

    aput-object v3, v2, v0

    new-array v0, v1, [I

    fill-array-data v0, :array_10c

    const/4 v3, 0x6

    aput-object v0, v2, v3

    new-array v0, v1, [I

    fill-array-data v0, :array_118

    const/4 v3, 0x7

    aput-object v0, v2, v3

    new-array v0, v1, [I

    fill-array-data v0, :array_124

    const/16 v1, 0x8

    aput-object v0, v2, v1

    sput-object v2, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    return-void

    :array_90
    .array-data 4
        0x1
        0xa
        0x22
        0x46
        0x7e
    .end array-data

    :array_9e
    .array-data 4
        0x4
        0x14
        0x30
        0x51
    .end array-data

    :array_aa
    .array-data 4
        0x8
        0x6
        0x4
        0x3
        0x1
    .end array-data

    :array_b8
    .array-data 4
        0x2
        0x4
        0x6
        0x8
    .end array-data

    :array_c4
    .array-data 4
        0x3
        0x8
        0x2
        0x1
    .end array-data

    :array_d0
    .array-data 4
        0x3
        0x5
        0x5
        0x1
    .end array-data

    :array_dc
    .array-data 4
        0x3
        0x3
        0x7
        0x1
    .end array-data

    :array_e8
    .array-data 4
        0x3
        0x1
        0x9
        0x1
    .end array-data

    :array_f4
    .array-data 4
        0x2
        0x7
        0x4
        0x1
    .end array-data

    :array_100
    .array-data 4
        0x2
        0x5
        0x6
        0x1
    .end array-data

    :array_10c
    .array-data 4
        0x2
        0x3
        0x8
        0x1
    .end array-data

    :array_118
    .array-data 4
        0x1
        0x5
        0x7
        0x1
    .end array-data

    :array_124
    .array-data 4
        0x1
        0x3
        0x9
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    return-void
.end method

.method private static addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/google/zxing/oned/rss/Pair;",
            ">;",
            "Lcom/google/zxing/oned/rss/Pair;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_f

    goto :goto_24

    :cond_f
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/Pair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v3

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v4

    if-ne v3, v4, :cond_8

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/Pair;->incrementCount()V

    const/4 v0, 0x1

    nop

    :goto_24
    if-nez v0, :cond_29

    invoke-interface {p0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    :cond_29
    return-void
.end method

.method private adjustOddEvenCounts(ZI)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v1

    add-int v2, v0, v1

    sub-int/2addr v2, p2

    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, p1, :cond_1b

    move v3, v5

    goto :goto_1c

    :cond_1b
    move v3, v4

    :goto_1c
    and-int/lit8 v6, v1, 0x1

    if-ne v6, v5, :cond_22

    move v4, v5

    nop

    :cond_22
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x4

    if-eqz p1, :cond_3a

    const/16 v11, 0xc

    if-le v0, v11, :cond_2f

    const/4 v7, 0x1

    goto :goto_32

    :cond_2f
    if-ge v0, v10, :cond_32

    const/4 v6, 0x1

    :cond_32
    :goto_32
    if-le v1, v11, :cond_36

    const/4 v9, 0x1

    goto :goto_4d

    :cond_36
    if-ge v1, v10, :cond_4d

    const/4 v8, 0x1

    goto :goto_4d

    :cond_3a
    const/16 v11, 0xb

    if-le v0, v11, :cond_40

    const/4 v7, 0x1

    goto :goto_44

    :cond_40
    const/4 v11, 0x5

    if-ge v0, v11, :cond_44

    const/4 v6, 0x1

    :cond_44
    :goto_44
    const/16 v11, 0xa

    if-le v1, v11, :cond_4a

    const/4 v9, 0x1

    goto :goto_4d

    :cond_4a
    if-ge v1, v10, :cond_4d

    const/4 v8, 0x1

    :cond_4d
    :goto_4d
    if-ne v2, v5, :cond_63

    if-eqz v3, :cond_5a

    if-nez v4, :cond_55

    const/4 v7, 0x1

    goto :goto_8f

    :cond_55
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_5a
    if-eqz v4, :cond_5e

    const/4 v9, 0x1

    goto :goto_8f

    :cond_5e
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_63
    const/4 v5, -0x1

    if-ne v2, v5, :cond_7a

    if-eqz v3, :cond_71

    if-nez v4, :cond_6c

    const/4 v6, 0x1

    goto :goto_8f

    :cond_6c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_71
    if-eqz v4, :cond_75

    const/4 v8, 0x1

    goto :goto_8f

    :cond_75
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_7a
    if-nez v2, :cond_d9

    if-eqz v3, :cond_8d

    if-eqz v4, :cond_88

    if-ge v0, v1, :cond_85

    const/4 v6, 0x1

    const/4 v9, 0x1

    goto :goto_8f

    :cond_85
    const/4 v7, 0x1

    const/4 v8, 0x1

    goto :goto_8f

    :cond_88
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_8d
    if-nez v4, :cond_d4

    :goto_8f
    if-eqz v6, :cond_a4

    if-nez v7, :cond_9f

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_a4

    :cond_9f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_a4
    :goto_a4
    if-eqz v7, :cond_b1

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    :cond_b1
    if-eqz v8, :cond_c6

    if-nez v9, :cond_c1

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->increment([I[F)V

    goto :goto_c6

    :cond_c1
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_c6
    :goto_c6
    if-eqz v9, :cond_d3

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v10

    invoke-static {v5, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->decrement([I[F)V

    :cond_d3
    return-void

    :cond_d4
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_d9
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private static checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z
    .registers 5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getChecksumPortion()I

    move-result v1

    const/16 v2, 0x10

    mul-int/2addr v2, v1

    add-int/2addr v0, v2

    rem-int/lit8 v0, v0, 0x4f

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v1

    const/16 v2, 0x9

    mul-int/2addr v2, v1

    invoke-virtual {p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v1

    add-int/2addr v2, v1

    move v1, v2

    const/16 v2, 0x48

    if-le v1, v2, :cond_29

    add-int/lit8 v1, v1, -0x1

    :cond_29
    const/16 v2, 0x8

    if-le v1, v2, :cond_2f

    add-int/lit8 v1, v1, -0x1

    :cond_2f
    if-ne v0, v1, :cond_33

    const/4 v2, 0x1

    return v2

    :cond_33
    const/4 v2, 0x0

    return v2
.end method

.method private static constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;
    .registers 17

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v0

    int-to-long v0, v0

    const-wide/32 v2, 0x453af5

    mul-long/2addr v2, v0

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/oned/rss/Pair;->getValue()I

    move-result v0

    int-to-long v0, v0

    add-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const/16 v4, 0xe

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    const/16 v5, 0xd

    rsub-int/lit8 v4, v4, 0xd

    :goto_22
    const/16 v6, 0x30

    if-gtz v4, :cond_81

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    const/4 v7, 0x0

    :goto_2b
    const/4 v8, 0x3

    if-lt v7, v5, :cond_71

    rem-int/lit8 v5, v4, 0xa

    const/16 v6, 0xa

    rsub-int/lit8 v4, v5, 0xa

    if-ne v4, v6, :cond_37

    const/4 v4, 0x0

    :cond_37
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/oned/rss/Pair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v6

    invoke-virtual {v6}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v6

    new-instance v7, Lcom/google/zxing/Result;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    const/4 v11, 0x4

    new-array v11, v11, [Lcom/google/zxing/ResultPoint;

    const/4 v12, 0x0

    aget-object v13, v5, v12

    aput-object v13, v11, v12

    const/4 v13, 0x1

    aget-object v14, v5, v13

    aput-object v14, v11, v13

    const/4 v14, 0x2

    aget-object v12, v6, v12

    aput-object v12, v11, v14

    aget-object v12, v6, v13

    aput-object v12, v11, v8

    sget-object v8, Lcom/google/zxing/BarcodeFormat;->RSS_14:Lcom/google/zxing/BarcodeFormat;

    invoke-direct {v7, v9, v10, v11, v8}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v7

    :cond_71
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v9

    sub-int/2addr v9, v6

    and-int/lit8 v10, v7, 0x1

    if-nez v10, :cond_7c

    mul-int/2addr v8, v9

    goto :goto_7d

    :cond_7c
    move v8, v9

    :goto_7d
    add-int/2addr v4, v8

    add-int/lit8 v7, v7, 0x1

    goto :goto_2b

    :cond_81
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, -0x1

    goto :goto_22
.end method

.method private decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;
    .registers 31
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDataCharacterCounters()[I

    move-result-object v2

    const/4 v3, 0x0

    aput v3, v2, v3

    const/4 v4, 0x1

    aput v3, v2, v4

    const/4 v5, 0x2

    aput v3, v2, v5

    const/4 v6, 0x3

    aput v3, v2, v6

    const/4 v7, 0x4

    aput v3, v2, v7

    const/4 v8, 0x5

    aput v3, v2, v8

    const/4 v8, 0x6

    aput v3, v2, v8

    const/4 v8, 0x7

    aput v3, v2, v8

    if-eqz v1, :cond_2c

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v3

    invoke-static {v0, v8, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    goto :goto_3b

    :cond_2c
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v4

    add-int/2addr v8, v4

    invoke-static {v0, v8, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    const/4 v8, 0x0

    array-length v9, v2

    sub-int/2addr v9, v4

    :goto_39
    if-lt v8, v9, :cond_153

    :goto_3b
    if-eqz v1, :cond_40

    const/16 v8, 0x10

    goto :goto_42

    :cond_40
    const/16 v8, 0xf

    :goto_42
    move v10, v8

    invoke-static {v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->count([I)I

    move-result v8

    int-to-float v8, v8

    int-to-float v9, v10

    div-float v11, v8, v9

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddCounts()[I

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenCounts()[I

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getOddRoundingErrors()[F

    move-result-object v14

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getEvenRoundingErrors()[F

    move-result-object v15

    const/4 v8, 0x0

    :goto_5c
    array-length v9, v2

    if-lt v8, v9, :cond_11c

    move-object/from16 v9, p0

    invoke-direct {v9, v1, v10}, Lcom/google/zxing/oned/rss/RSS14Reader;->adjustOddEvenCounts(ZI)V

    const/4 v8, 0x0

    const/16 v16, 0x0

    array-length v3, v12

    sub-int/2addr v3, v4

    :goto_69
    if-gez v3, :cond_108

    const/4 v3, 0x0

    const/16 v18, 0x0

    array-length v5, v13

    sub-int/2addr v5, v4

    move/from16 v20, v18

    :goto_72
    if-gez v5, :cond_f1

    mul-int/2addr v6, v3

    add-int v6, v16, v6

    if-eqz v1, :cond_b3

    and-int/lit8 v5, v8, 0x1

    if-nez v5, :cond_ae

    const/16 v5, 0xc

    if-gt v8, v5, :cond_ae

    if-lt v8, v7, :cond_ae

    sub-int/2addr v5, v8

    const/4 v7, 0x2

    div-int/2addr v5, v7

    sget-object v7, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_ODD_WIDEST:[I

    aget v7, v7, v5

    rsub-int/lit8 v4, v7, 0x9

    const/4 v0, 0x0

    invoke-static {v12, v7, v0}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v0

    const/4 v1, 0x1

    invoke-static {v13, v4, v1}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v1

    sget-object v17, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_EVEN_TOTAL_SUBSET:[I

    aget v17, v17, v5

    sget-object v18, Lcom/google/zxing/oned/rss/RSS14Reader;->OUTSIDE_GSUM:[I

    aget v18, v18, v5

    move/from16 v21, v4

    new-instance v4, Lcom/google/zxing/oned/rss/DataCharacter;

    mul-int v19, v0, v17

    add-int v19, v19, v1

    move/from16 v22, v0

    add-int v0, v19, v18

    invoke-direct {v4, v0, v6}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v4

    :cond_ae
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_b3
    move/from16 v0, v20

    and-int/lit8 v1, v0, 0x1

    if-nez v1, :cond_ec

    const/16 v1, 0xa

    if-gt v0, v1, :cond_ec

    if-lt v0, v7, :cond_ec

    sub-int/2addr v1, v0

    const/4 v4, 0x2

    div-int/2addr v1, v4

    sget-object v4, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_WIDEST:[I

    aget v4, v4, v1

    rsub-int/lit8 v5, v4, 0x9

    const/4 v7, 0x1

    invoke-static {v12, v4, v7}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v7

    move/from16 v23, v4

    const/4 v4, 0x0

    invoke-static {v13, v5, v4}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v4

    sget-object v17, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_ODD_TOTAL_SUBSET:[I

    aget v17, v17, v1

    sget-object v18, Lcom/google/zxing/oned/rss/RSS14Reader;->INSIDE_GSUM:[I

    aget v18, v18, v1

    move/from16 v24, v1

    new-instance v1, Lcom/google/zxing/oned/rss/DataCharacter;

    mul-int v19, v4, v17

    add-int v19, v19, v7

    move/from16 v25, v4

    add-int v4, v19, v18

    invoke-direct {v1, v4, v6}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v1

    :cond_ec
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_f1
    move/from16 v0, v20

    const/4 v1, 0x2

    const/4 v4, 0x0

    mul-int/lit8 v3, v3, 0x9

    aget v17, v13, v5

    add-int v3, v3, v17

    aget v17, v13, v5

    add-int v20, v0, v17

    add-int/lit8 v5, v5, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v4, 0x1

    goto/16 :goto_72

    :cond_108
    move v1, v5

    const/4 v4, 0x0

    mul-int/lit8 v16, v16, 0x9

    aget v0, v12, v3

    add-int v16, v16, v0

    aget v0, v12, v3

    add-int/2addr v8, v0

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v4, 0x1

    goto/16 :goto_69

    :cond_11c
    move-object/from16 v9, p0

    move v4, v3

    move v1, v5

    aget v0, v2, v8

    int-to-float v0, v0

    div-float/2addr v0, v11

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v3, v0

    float-to-int v3, v3

    const/4 v5, 0x1

    if-ge v3, v5, :cond_12d

    const/4 v3, 0x1

    goto :goto_133

    :cond_12d
    const/16 v1, 0x8

    if-le v3, v1, :cond_133

    const/16 v3, 0x8

    :cond_133
    :goto_133
    div-int/lit8 v1, v8, 0x2

    and-int/lit8 v16, v8, 0x1

    if-nez v16, :cond_141

    aput v3, v12, v1

    int-to-float v4, v3

    sub-float v4, v0, v4

    aput v4, v14, v1

    goto :goto_148

    :cond_141
    aput v3, v13, v1

    int-to-float v4, v3

    sub-float v4, v0, v4

    aput v4, v15, v1

    :goto_148
    add-int/lit8 v8, v8, 0x1

    move v4, v5

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v3, 0x0

    const/4 v5, 0x2

    goto/16 :goto_5c

    :cond_153
    move v5, v4

    aget v0, v2, v8

    aget v1, v2, v9

    aput v1, v2, v8

    aput v0, v2, v9

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v9, v9, -0x1

    move-object/from16 v0, p1

    move/from16 v1, p3

    const/4 v3, 0x0

    const/4 v5, 0x2

    goto/16 :goto_39
.end method

.method private decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;
    .registers 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "ZI",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/oned/rss/Pair;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_2
    invoke-direct {p0, p1, v1, p2}, Lcom/google/zxing/oned/rss/RSS14Reader;->findFinderPattern(Lcom/google/zxing/common/BitArray;IZ)[I

    move-result-object v2

    invoke-direct {p0, p1, p3, p2, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v3

    if-nez p4, :cond_e

    move-object v4, v0

    goto :goto_16

    :cond_e
    sget-object v4, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    invoke-interface {p4, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/ResultPointCallback;

    :goto_16
    nop

    const/4 v5, 0x1

    if-eqz v4, :cond_36

    aget v6, v2, v1

    aget v7, v2, v5

    add-int/2addr v6, v7

    int-to-float v6, v6

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    if-eqz p2, :cond_2d

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    sub-int/2addr v7, v5

    int-to-float v7, v7

    sub-float v6, v7, v6

    :cond_2d
    new-instance v7, Lcom/google/zxing/ResultPoint;

    int-to-float v8, p3

    invoke-direct {v7, v6, v8}, Lcom/google/zxing/ResultPoint;-><init>(FF)V

    invoke-interface {v4, v7}, Lcom/google/zxing/ResultPointCallback;->foundPossibleResultPoint(Lcom/google/zxing/ResultPoint;)V

    :cond_36
    invoke-direct {p0, p1, v3, v5}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v5

    invoke-direct {p0, p1, v3, v1}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;Z)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1

    new-instance v6, Lcom/google/zxing/oned/rss/Pair;

    const/16 v7, 0x63d

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v8

    mul-int/2addr v7, v8

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v8

    add-int/2addr v7, v8

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v8

    const/4 v9, 0x4

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v10

    mul-int/2addr v9, v10

    add-int/2addr v8, v9

    nop

    invoke-direct {v6, v7, v8, v3}, Lcom/google/zxing/oned/rss/Pair;-><init>(IILcom/google/zxing/oned/rss/FinderPattern;)V
    :try_end_5b
    .catch Lcom/google/zxing/NotFoundException; {:try_start_2 .. :try_end_5b} :catch_5c

    return-object v6

    :catch_5c
    move-exception v1

    return-object v0
.end method

.method private findFinderPattern(Lcom/google/zxing/common/BitArray;IZ)[I
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v0

    const/4 v1, 0x0

    aput v1, v0, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v3, 0x2

    aput v1, v0, v3

    const/4 v4, 0x3

    aput v1, v0, v4

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    const/4 v6, 0x0

    :goto_15
    if-lt p2, v5, :cond_18

    goto :goto_21

    :cond_18
    invoke-virtual {p1, p2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    xor-int/2addr v7, v2

    move v6, v7

    if-ne p3, v6, :cond_69

    nop

    :goto_21
    const/4 v7, 0x0

    move v8, p2

    move v9, p2

    :goto_24
    if-ge v9, v5, :cond_64

    invoke-virtual {p1, v9}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v10

    xor-int/2addr v10, v6

    if-eqz v10, :cond_33

    aget v10, v0, v7

    add-int/2addr v10, v2

    aput v10, v0, v7

    goto :goto_61

    :cond_33
    if-ne v7, v4, :cond_57

    invoke-static {v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->isFinderPattern([I)Z

    move-result v10

    if-eqz v10, :cond_42

    new-array v3, v3, [I

    aput v8, v3, v1

    aput v9, v3, v2

    return-object v3

    :cond_42
    aget v10, v0, v1

    aget v11, v0, v2

    add-int/2addr v10, v11

    add-int/2addr v8, v10

    aget v10, v0, v3

    aput v10, v0, v1

    aget v10, v0, v4

    aput v10, v0, v2

    aput v1, v0, v3

    aput v1, v0, v4

    add-int/lit8 v7, v7, -0x1

    goto :goto_59

    :cond_57
    add-int/lit8 v7, v7, 0x1

    :goto_59
    aput v2, v0, v7

    if-eqz v6, :cond_5f

    move v10, v1

    goto :goto_60

    :cond_5f
    move v10, v2

    :goto_60
    move v6, v10

    :goto_61
    add-int/lit8 v9, v9, 0x1

    goto :goto_24

    :cond_64
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_69
    add-int/lit8 p2, p2, 0x1

    goto :goto_15
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ[I)Lcom/google/zxing/oned/rss/FinderPattern;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    const/4 v1, 0x0

    aget v2, p4, v1

    invoke-virtual {v0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    aget v3, p4, v1

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    :goto_d
    if-ltz v3, :cond_1a

    invoke-virtual {v0, v3}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    xor-int/2addr v5, v2

    if-nez v5, :cond_17

    goto :goto_1a

    :cond_17
    add-int/lit8 v3, v3, -0x1

    goto :goto_d

    :cond_1a
    :goto_1a
    add-int/2addr v3, v4

    aget v5, p4, v1

    sub-int/2addr v5, v3

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/RSS14Reader;->getDecodeFinderCounters()[I

    move-result-object v6

    array-length v7, v6

    sub-int/2addr v7, v4

    invoke-static {v6, v1, v6, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput v5, v6, v1

    sget-object v7, Lcom/google/zxing/oned/rss/RSS14Reader;->FINDER_PATTERNS:[[I

    invoke-static {v6, v7}, Lcom/google/zxing/oned/rss/RSS14Reader;->parseFinderValue([I[[I)I

    move-result v7

    move v8, v3

    aget v9, p4, v4

    if-eqz p3, :cond_43

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v10

    sub-int/2addr v10, v4

    sub-int/2addr v10, v8

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v8

    sub-int/2addr v8, v4

    sub-int/2addr v8, v9

    move v15, v8

    move v14, v10

    goto :goto_45

    :cond_43
    move v14, v8

    move v15, v9

    :goto_45
    new-instance v16, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v8, 0x2

    new-array v10, v8, [I

    aput v3, v10, v1

    aget v1, p4, v4

    aput v1, v10, v4

    move-object/from16 v8, v16

    move v9, v7

    move v11, v14

    move v12, v15

    move/from16 v13, p2

    invoke-direct/range {v8 .. v13}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v16
.end method


# virtual methods
.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p2, v0, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-static {v1, v0}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    const/4 v1, 0x1

    invoke-direct {p0, p2, v1, p1, p3}, Lcom/google/zxing/oned/rss/RSS14Reader;->decodePair(Lcom/google/zxing/common/BitArray;ZILjava/util/Map;)Lcom/google/zxing/oned/rss/Pair;

    move-result-object v2

    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-static {v3, v2}, Lcom/google/zxing/oned/rss/RSS14Reader;->addOrTally(Ljava/util/Collection;Lcom/google/zxing/oned/rss/Pair;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->reverse()V

    iget-object v3, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_21
    if-ge v4, v3, :cond_5a

    iget-object v5, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/Pair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v6

    if-le v6, v1, :cond_57

    iget-object v6, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_38
    if-lt v7, v6, :cond_3b

    goto :goto_57

    :cond_3b
    iget-object v8, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/oned/rss/Pair;

    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/Pair;->getCount()I

    move-result v9

    if-le v9, v1, :cond_54

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/RSS14Reader;->checkChecksum(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Z

    move-result v9

    if-eqz v9, :cond_54

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/RSS14Reader;->constructResult(Lcom/google/zxing/oned/rss/Pair;Lcom/google/zxing/oned/rss/Pair;)Lcom/google/zxing/Result;

    move-result-object v1

    return-object v1

    :cond_54
    add-int/lit8 v7, v7, 0x1

    goto :goto_38

    :cond_57
    :goto_57
    add-int/lit8 v4, v4, 0x1

    goto :goto_21

    :cond_5a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1
.end method

.method public reset()V
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleLeftPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/google/zxing/oned/rss/RSS14Reader;->possibleRightPairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method
