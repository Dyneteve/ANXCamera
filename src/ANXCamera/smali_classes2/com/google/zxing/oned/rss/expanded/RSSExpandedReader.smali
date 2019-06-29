.class public final Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;
.super Lcom/google/zxing/oned/rss/AbstractRSSReader;
.source "RSSExpandedReader.java"


# static fields
.field private static final EVEN_TOTAL_SUBSET:[I

.field private static final FINDER_PATTERNS:[[I

.field private static final FINDER_PATTERN_SEQUENCES:[[I

.field private static final FINDER_PAT_A:I = 0x0

.field private static final FINDER_PAT_B:I = 0x1

.field private static final FINDER_PAT_C:I = 0x2

.field private static final FINDER_PAT_D:I = 0x3

.field private static final FINDER_PAT_E:I = 0x4

.field private static final FINDER_PAT_F:I = 0x5

.field private static final GSUM:[I

.field private static final MAX_PAIRS:I = 0xb

.field private static final SYMBOL_WIDEST:[I

.field private static final WEIGHTS:[[I


# instance fields
.field private final pairs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation
.end field

.field private final rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation
.end field

.field private final startEnd:[I

.field private startFromEven:Z


# direct methods
.method static constructor <clinit>()V
    .registers 15

    const/4 v0, 0x5

    new-array v1, v0, [I

    fill-array-data v1, :array_1ae

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    new-array v1, v0, [I

    fill-array-data v1, :array_1bc

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    new-array v1, v0, [I

    const/4 v2, 0x1

    const/16 v3, 0x15c

    aput v3, v1, v2

    const/4 v3, 0x2

    const/16 v4, 0x56c

    aput v4, v1, v3

    const/4 v4, 0x3

    const/16 v5, 0xb84

    aput v5, v1, v4

    const/4 v5, 0x4

    const/16 v6, 0xf94

    aput v6, v1, v5

    sput-object v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    const/4 v1, 0x6

    new-array v6, v1, [[I

    new-array v7, v5, [I

    fill-array-data v7, :array_1ca

    const/4 v8, 0x0

    aput-object v7, v6, v8

    new-array v7, v5, [I

    fill-array-data v7, :array_1d6

    aput-object v7, v6, v2

    new-array v7, v5, [I

    fill-array-data v7, :array_1e2

    aput-object v7, v6, v3

    new-array v7, v5, [I

    fill-array-data v7, :array_1ee

    aput-object v7, v6, v4

    new-array v7, v5, [I

    fill-array-data v7, :array_1fa

    aput-object v7, v6, v5

    new-array v7, v5, [I

    fill-array-data v7, :array_206

    aput-object v7, v6, v0

    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    const/16 v6, 0x17

    new-array v6, v6, [[I

    const/16 v7, 0x8

    new-array v9, v7, [I

    fill-array-data v9, :array_212

    aput-object v9, v6, v8

    new-array v9, v7, [I

    fill-array-data v9, :array_226

    aput-object v9, v6, v2

    new-array v9, v7, [I

    fill-array-data v9, :array_23a

    aput-object v9, v6, v3

    new-array v9, v7, [I

    fill-array-data v9, :array_24e

    aput-object v9, v6, v4

    new-array v9, v7, [I

    fill-array-data v9, :array_262

    aput-object v9, v6, v5

    new-array v9, v7, [I

    fill-array-data v9, :array_276

    aput-object v9, v6, v0

    new-array v9, v7, [I

    fill-array-data v9, :array_28a

    aput-object v9, v6, v1

    new-array v9, v7, [I

    fill-array-data v9, :array_29e

    const/4 v10, 0x7

    aput-object v9, v6, v10

    new-array v9, v7, [I

    fill-array-data v9, :array_2b2

    aput-object v9, v6, v7

    new-array v9, v7, [I

    fill-array-data v9, :array_2c6

    const/16 v11, 0x9

    aput-object v9, v6, v11

    new-array v9, v7, [I

    fill-array-data v9, :array_2da

    const/16 v12, 0xa

    aput-object v9, v6, v12

    new-array v9, v7, [I

    fill-array-data v9, :array_2ee

    const/16 v13, 0xb

    aput-object v9, v6, v13

    new-array v9, v7, [I

    fill-array-data v9, :array_302

    const/16 v14, 0xc

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_316

    const/16 v14, 0xd

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_32a

    const/16 v14, 0xe

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_33e

    const/16 v14, 0xf

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_352

    const/16 v14, 0x10

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_366

    const/16 v14, 0x11

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_37a

    const/16 v14, 0x12

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_38e

    const/16 v14, 0x13

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_3a2

    const/16 v14, 0x14

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_3b6

    const/16 v14, 0x15

    aput-object v9, v6, v14

    new-array v9, v7, [I

    fill-array-data v9, :array_3ca

    const/16 v14, 0x16

    aput-object v9, v6, v14

    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    new-array v6, v12, [[I

    new-array v9, v3, [I

    aput-object v9, v6, v8

    new-array v8, v4, [I

    aput v2, v8, v2

    aput v2, v8, v3

    aput-object v8, v6, v2

    new-array v8, v5, [I

    aput v3, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput-object v8, v6, v3

    new-array v8, v0, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v3, v8, v5

    aput-object v8, v6, v4

    new-array v8, v1, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v4, v8, v5

    aput v0, v8, v0

    aput-object v8, v6, v5

    new-array v8, v10, [I

    aput v5, v8, v2

    aput v2, v8, v3

    aput v4, v8, v4

    aput v5, v8, v5

    aput v0, v8, v0

    aput v0, v8, v1

    aput-object v8, v6, v0

    new-array v8, v7, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v4, v8, v10

    aput-object v8, v6, v1

    new-array v8, v11, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v5, v8, v7

    aput-object v8, v6, v10

    new-array v8, v12, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v3, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v0, v8, v7

    aput v0, v8, v11

    aput-object v8, v6, v7

    new-array v8, v13, [I

    aput v2, v8, v3

    aput v2, v8, v4

    aput v3, v8, v5

    aput v4, v8, v0

    aput v4, v8, v1

    aput v5, v8, v10

    aput v5, v8, v7

    aput v0, v8, v11

    aput v0, v8, v12

    aput-object v8, v6, v11

    sput-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    return-void

    :array_1ae
    .array-data 4
        0x7
        0x5
        0x4
        0x3
        0x1
    .end array-data

    :array_1bc
    .array-data 4
        0x4
        0x14
        0x34
        0x68
        0xcc
    .end array-data

    :array_1ca
    .array-data 4
        0x1
        0x8
        0x4
        0x1
    .end array-data

    :array_1d6
    .array-data 4
        0x3
        0x6
        0x4
        0x1
    .end array-data

    :array_1e2
    .array-data 4
        0x3
        0x4
        0x6
        0x1
    .end array-data

    :array_1ee
    .array-data 4
        0x3
        0x2
        0x8
        0x1
    .end array-data

    :array_1fa
    .array-data 4
        0x2
        0x6
        0x5
        0x1
    .end array-data

    :array_206
    .array-data 4
        0x2
        0x2
        0x9
        0x1
    .end array-data

    :array_212
    .array-data 4
        0x1
        0x3
        0x9
        0x1b
        0x51
        0x20
        0x60
        0x4d
    .end array-data

    :array_226
    .array-data 4
        0x14
        0x3c
        0xb4
        0x76
        0x8f
        0x7
        0x15
        0x3f
    .end array-data

    :array_23a
    .array-data 4
        0xbd
        0x91
        0xd
        0x27
        0x75
        0x8c
        0xd1
        0xcd
    .end array-data

    :array_24e
    .array-data 4
        0xc1
        0x9d
        0x31
        0x93
        0x13
        0x39
        0xab
        0x5b
    .end array-data

    :array_262
    .array-data 4
        0x3e
        0xba
        0x88
        0xc5
        0xa9
        0x55
        0x2c
        0x84
    .end array-data

    :array_276
    .array-data 4
        0xb9
        0x85
        0xbc
        0x8e
        0x4
        0xc
        0x24
        0x6c
    .end array-data

    :array_28a
    .array-data 4
        0x71
        0x80
        0xad
        0x61
        0x50
        0x1d
        0x57
        0x32
    .end array-data

    :array_29e
    .array-data 4
        0x96
        0x1c
        0x54
        0x29
        0x7b
        0x9e
        0x34
        0x9c
    .end array-data

    :array_2b2
    .array-data 4
        0x2e
        0x8a
        0xcb
        0xbb
        0x8b
        0xce
        0xc4
        0xa6
    .end array-data

    :array_2c6
    .array-data 4
        0x4c
        0x11
        0x33
        0x99
        0x25
        0x6f
        0x7a
        0x9b
    .end array-data

    :array_2da
    .array-data 4
        0x2b
        0x81
        0xb0
        0x6a
        0x6b
        0x6e
        0x77
        0x92
    .end array-data

    :array_2ee
    .array-data 4
        0x10
        0x30
        0x90
        0xa
        0x1e
        0x5a
        0x3b
        0xb1
    .end array-data

    :array_302
    .array-data 4
        0x6d
        0x74
        0x89
        0xc8
        0xb2
        0x70
        0x7d
        0xa4
    .end array-data

    :array_316
    .array-data 4
        0x46
        0xd2
        0xd0
        0xca
        0xb8
        0x82
        0xb3
        0x73
    .end array-data

    :array_32a
    .array-data 4
        0x86
        0xbf
        0x97
        0x1f
        0x5d
        0x44
        0xcc
        0xbe
    .end array-data

    :array_33e
    .array-data 4
        0x94
        0x16
        0x42
        0xc6
        0xac
        0x5e
        0x47
        0x2
    .end array-data

    :array_352
    .array-data 4
        0x6
        0x12
        0x36
        0xa2
        0x40
        0xc0
        0x9a
        0x28
    .end array-data

    :array_366
    .array-data 4
        0x78
        0x95
        0x19
        0x4b
        0xe
        0x2a
        0x7e
        0xa7
    .end array-data

    :array_37a
    .array-data 4
        0x4f
        0x1a
        0x4e
        0x17
        0x45
        0xcf
        0xc7
        0xaf
    .end array-data

    :array_38e
    .array-data 4
        0x67
        0x62
        0x53
        0x26
        0x72
        0x83
        0xb6
        0x7c
    .end array-data

    :array_3a2
    .array-data 4
        0xa1
        0x3d
        0xb7
        0x7f
        0xaa
        0x58
        0x35
        0x9f
    .end array-data

    :array_3b6
    .array-data 4
        0x37
        0xa5
        0x49
        0x8
        0x18
        0x48
        0x5
        0xf
    .end array-data

    :array_3ca
    .array-data 4
        0x2d
        0x87
        0xc2
        0xa0
        0x3a
        0xae
        0x64
        0x59
    .end array-data
.end method

.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcom/google/zxing/oned/rss/AbstractRSSReader;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    return-void
.end method

.method private adjustOddEvenCounts(I)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v0

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v1

    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v1

    add-int v2, v0, v1

    sub-int/2addr v2, p1

    and-int/lit8 v3, v0, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_1b

    move v3, v5

    goto :goto_1c

    :cond_1b
    move v3, v4

    :goto_1c
    and-int/lit8 v6, v1, 0x1

    if-nez v6, :cond_22

    move v4, v5

    nop

    :cond_22
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/16 v9, 0xd

    if-le v0, v9, :cond_2b

    const/4 v7, 0x1

    goto :goto_2e

    :cond_2b
    if-ge v0, v8, :cond_2e

    const/4 v6, 0x1

    :cond_2e
    :goto_2e
    const/4 v10, 0x0

    const/4 v11, 0x0

    if-le v1, v9, :cond_34

    const/4 v11, 0x1

    goto :goto_37

    :cond_34
    if-ge v1, v8, :cond_37

    const/4 v10, 0x1

    :cond_37
    :goto_37
    if-ne v2, v5, :cond_4d

    if-eqz v3, :cond_44

    if-nez v4, :cond_3f

    const/4 v7, 0x1

    goto :goto_79

    :cond_3f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_44
    if-eqz v4, :cond_48

    const/4 v11, 0x1

    goto :goto_79

    :cond_48
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_4d
    const/4 v5, -0x1

    if-ne v2, v5, :cond_64

    if-eqz v3, :cond_5b

    if-nez v4, :cond_56

    const/4 v6, 0x1

    goto :goto_79

    :cond_56
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_5b
    if-eqz v4, :cond_5f

    const/4 v10, 0x1

    goto :goto_79

    :cond_5f
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_64
    if-nez v2, :cond_c3

    if-eqz v3, :cond_77

    if-eqz v4, :cond_72

    if-ge v0, v1, :cond_6f

    const/4 v6, 0x1

    const/4 v11, 0x1

    goto :goto_79

    :cond_6f
    const/4 v7, 0x1

    const/4 v10, 0x1

    goto :goto_79

    :cond_72
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_77
    if-nez v4, :cond_be

    :goto_79
    if-eqz v6, :cond_8e

    if-nez v7, :cond_89

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_8e

    :cond_89
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_8e
    :goto_8e
    if-eqz v7, :cond_9b

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    :cond_9b
    if-eqz v10, :cond_b0

    if-nez v11, :cond_ab

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->increment([I[F)V

    goto :goto_b0

    :cond_ab
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_b0
    :goto_b0
    if-eqz v11, :cond_bd

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v5

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v8

    invoke-static {v5, v8}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decrement([I[F)V

    :cond_bd
    return-void

    :cond_be
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5

    :cond_c3
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v5

    throw v5
.end method

.method private checkChecksum()Z
    .registers 11

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v3

    if-nez v3, :cond_14

    return v1

    :cond_14
    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x1

    :goto_1a
    iget-object v7, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    if-lt v6, v7, :cond_31

    const/16 v6, 0xd3

    rem-int/2addr v4, v6

    add-int/lit8 v7, v5, -0x4

    mul-int/2addr v6, v7

    add-int/2addr v6, v4

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/DataCharacter;->getValue()I

    move-result v7

    if-ne v6, v7, :cond_30

    const/4 v1, 0x1

    :cond_30
    return v1

    :cond_31
    iget-object v7, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v7, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getLeftChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v8

    add-int/2addr v4, v8

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getRightChar()Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v8

    if-eqz v8, :cond_51

    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/DataCharacter;->getChecksumPortion()I

    move-result v9

    add-int/2addr v4, v9

    add-int/lit8 v5, v5, 0x1

    :cond_51
    add-int/lit8 v6, v6, 0x1

    goto :goto_1a
.end method

.method private checkRows(Ljava/util/List;I)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move v0, p2

    :goto_1
    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_60

    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    iget-object v2, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_1b
    if-lt v3, v2, :cond_4e

    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-static {v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isValidSequence(Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_2f

    goto :goto_4b

    :cond_2f
    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v3

    if-eqz v3, :cond_38

    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v3

    :cond_38
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v3, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v0, 0x1

    :try_start_45
    invoke-direct {p0, v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v4
    :try_end_49
    .catch Lcom/google/zxing/NotFoundException; {:try_start_45 .. :try_end_49} :catch_4a

    return-object v4

    :catch_4a
    move-exception v4

    :goto_4b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_4e
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    :cond_60
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0
.end method

.method private checkRows(Z)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x19

    if-le v0, v2, :cond_11

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-object v1

    :cond_11
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    if-eqz p1, :cond_1d

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    :cond_1d
    move-object v0, v1

    :try_start_1e
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    invoke-direct {p0, v1, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1
    :try_end_28
    .catch Lcom/google/zxing/NotFoundException; {:try_start_1e .. :try_end_28} :catch_2a

    move-object v0, v1

    goto :goto_2b

    :catch_2a
    move-exception v1

    :goto_2b
    if-eqz p1, :cond_32

    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    :cond_32
    return-object v0
.end method

.method static constructResult(Ljava/util/List;)Lcom/google/zxing/Result;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)",
            "Lcom/google/zxing/Result;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    invoke-static {p0}, Lcom/google/zxing/oned/rss/expanded/BitArrayBuilder;->buildBitArray(Ljava/util/List;)Lcom/google/zxing/common/BitArray;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->createDecoder(Lcom/google/zxing/common/BitArray;)Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/decoders/AbstractExpandedDecoder;->parseInformation()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v4

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x1

    sub-int/2addr v5, v6

    invoke-interface {p0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    invoke-virtual {v5}, Lcom/google/zxing/oned/rss/FinderPattern;->getResultPoints()[Lcom/google/zxing/ResultPoint;

    move-result-object v5

    new-instance v7, Lcom/google/zxing/Result;

    nop

    nop

    const/4 v8, 0x4

    new-array v8, v8, [Lcom/google/zxing/ResultPoint;

    aget-object v9, v4, v3

    aput-object v9, v8, v3

    aget-object v9, v4, v6

    aput-object v9, v8, v6

    aget-object v3, v5, v3

    const/4 v9, 0x2

    aput-object v3, v8, v9

    aget-object v3, v5, v6

    const/4 v6, 0x3

    aput-object v3, v8, v6

    sget-object v3, Lcom/google/zxing/BarcodeFormat;->RSS_EXPANDED:Lcom/google/zxing/BarcodeFormat;

    const/4 v6, 0x0

    invoke-direct {v7, v2, v6, v8, v3}, Lcom/google/zxing/Result;-><init>(Ljava/lang/String;[B[Lcom/google/zxing/ResultPoint;Lcom/google/zxing/BarcodeFormat;)V

    return-object v7
.end method

.method private findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object v2

    const/4 v3, 0x0

    aput v3, v2, v3

    const/4 v4, 0x1

    aput v3, v2, v4

    const/4 v5, 0x2

    aput v3, v2, v5

    const/4 v6, 0x3

    aput v3, v2, v6

    invoke-virtual/range {p1 .. p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    if-ltz p3, :cond_20

    move/from16 v8, p3

    nop

    :goto_1d
    move-object/from16 v9, p2

    goto :goto_3f

    :cond_20
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_28

    const/4 v8, 0x0

    goto :goto_1d

    :cond_28
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v8

    sub-int/2addr v8, v4

    move-object/from16 v9, p2

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v8}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v10

    invoke-virtual {v10}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v10

    aget v8, v10, v4

    :goto_3f
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v10

    rem-int/2addr v10, v5

    if-eqz v10, :cond_48

    move v10, v4

    goto :goto_49

    :cond_48
    move v10, v3

    :goto_49
    iget-boolean v11, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v11, :cond_53

    if-eqz v10, :cond_51

    move v11, v3

    goto :goto_52

    :cond_51
    move v11, v4

    :goto_52
    move v10, v11

    :cond_53
    const/4 v11, 0x0

    :goto_54
    if-lt v8, v7, :cond_57

    goto :goto_60

    :cond_57
    invoke-virtual {v1, v8}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v12

    xor-int/2addr v12, v4

    move v11, v12

    if-nez v11, :cond_b5

    nop

    :goto_60
    const/4 v12, 0x0

    move v13, v8

    move v14, v8

    :goto_63
    if-ge v14, v7, :cond_b0

    invoke-virtual {v1, v14}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v15

    xor-int/2addr v15, v11

    if-eqz v15, :cond_72

    aget v15, v2, v12

    add-int/2addr v15, v4

    aput v15, v2, v12

    goto :goto_ad

    :cond_72
    if-ne v12, v6, :cond_a3

    if-eqz v10, :cond_79

    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    :cond_79
    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isFinderPattern([I)Z

    move-result v15

    if-eqz v15, :cond_88

    iget-object v5, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v13, v5, v3

    iget-object v3, v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aput v14, v3, v4

    return-void

    :cond_88
    if-eqz v10, :cond_8d

    invoke-static {v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->reverseCounters([I)V

    :cond_8d
    aget v15, v2, v3

    aget v16, v2, v4

    add-int v15, v15, v16

    add-int/2addr v13, v15

    aget v15, v2, v5

    aput v15, v2, v3

    aget v15, v2, v6

    aput v15, v2, v4

    aput v3, v2, v5

    aput v3, v2, v6

    add-int/lit8 v12, v12, -0x1

    goto :goto_a5

    :cond_a3
    add-int/lit8 v12, v12, 0x1

    :goto_a5
    aput v4, v2, v12

    if-eqz v11, :cond_ab

    move v15, v3

    goto :goto_ac

    :cond_ab
    move v15, v4

    :goto_ac
    move v11, v15

    :goto_ad
    add-int/lit8 v14, v14, 0x1

    goto :goto_63

    :cond_b0
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v3

    throw v3

    :cond_b5
    add-int/lit8 v8, v8, 0x1

    goto :goto_54
.end method

.method private static getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I
    .registers 3

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    goto :goto_17

    :cond_f
    invoke-virtual {p0, p1}, Lcom/google/zxing/common/BitArray;->getNextSet(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v0

    :goto_17
    return v0
.end method

.method private static isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z
    .registers 4

    invoke-virtual {p0}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v0

    if-nez v0, :cond_c

    if-eqz p1, :cond_c

    if-eqz p2, :cond_c

    const/4 v0, 0x0

    goto :goto_d

    :cond_c
    const/4 v0, 0x1

    :goto_d
    return v0
.end method

.method private static isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/lang/Iterable<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)Z"
        }
    .end annotation

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_c

    const/4 v0, 0x0

    return v0

    :cond_c
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    const/4 v2, 0x1

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_17
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_1e

    goto :goto_46

    :cond_1e
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    const/4 v5, 0x0

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_34

    goto :goto_42

    :cond_34
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v4, v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2d

    const/4 v5, 0x1

    nop

    :goto_42
    if-nez v5, :cond_17

    const/4 v2, 0x0

    nop

    :goto_46
    if-eqz v2, :cond_4

    const/4 v0, 0x1

    return v0
.end method

.method private static isValidSequence(Ljava/util/List;)Z
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;)Z"
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERN_SEQUENCES:[[I

    array-length v1, v0

    const/4 v2, 0x0

    move v3, v2

    :goto_5
    if-lt v3, v1, :cond_8

    return v2

    :cond_8
    aget-object v4, v0, v3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v5

    array-length v6, v4

    if-le v5, v6, :cond_12

    goto :goto_33

    :cond_12
    const/4 v5, 0x1

    const/4 v6, 0x0

    :goto_14
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v7

    if-lt v6, v7, :cond_1b

    goto :goto_2f

    :cond_1b
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->getFinderPattern()Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v7

    aget v8, v4, v6

    if-eq v7, v8, :cond_36

    const/4 v5, 0x0

    nop

    :goto_2f
    if-eqz v5, :cond_33

    const/4 v0, 0x1

    return v0

    :cond_33
    :goto_33
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_36
    add-int/lit8 v6, v6, 0x1

    goto :goto_14
.end method

.method private parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;
    .registers 19

    move-object v1, p0

    move-object/from16 v2, p1

    const/4 v0, 0x0

    const/4 v3, 0x1

    if-eqz p3, :cond_24

    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v4, v0

    sub-int/2addr v4, v3

    :goto_c
    if-ltz v4, :cond_18

    invoke-virtual {v2, v4}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_15

    goto :goto_18

    :cond_15
    add-int/lit8 v4, v4, -0x1

    goto :goto_c

    :cond_18
    :goto_18
    add-int/2addr v4, v3

    iget-object v5, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v5, v5, v0

    sub-int/2addr v5, v4

    move v6, v4

    iget-object v7, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v7, v3

    goto :goto_37

    :cond_24
    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v6, v4, v0

    iget-object v4, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v4, v4, v3

    add-int/2addr v4, v3

    invoke-virtual {v2, v4}, Lcom/google/zxing/common/BitArray;->getNextUnset(I)I

    move-result v4

    iget-object v5, v1, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v5, v5, v3

    sub-int v5, v4, v5

    :goto_37
    move v12, v6

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDecodeFinderCounters()[I

    move-result-object v13

    array-length v6, v13

    sub-int/2addr v6, v3

    invoke-static {v13, v0, v13, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput v5, v13, v0

    :try_start_43
    sget-object v6, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->FINDER_PATTERNS:[[I

    invoke-static {v13, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFinderValue([I[[I)I

    move-result v7
    :try_end_49
    .catch Lcom/google/zxing/NotFoundException; {:try_start_43 .. :try_end_49} :catch_5d

    nop

    nop

    new-instance v14, Lcom/google/zxing/oned/rss/FinderPattern;

    const/4 v6, 0x2

    new-array v8, v6, [I

    aput v12, v8, v0

    aput v4, v8, v3

    move-object v6, v14

    move v9, v12

    move v10, v4

    move/from16 v11, p2

    invoke-direct/range {v6 .. v11}, Lcom/google/zxing/oned/rss/FinderPattern;-><init>(I[IIII)V

    return-object v14

    :catch_5d
    move-exception v0

    const/4 v3, 0x0

    return-object v3
.end method

.method private static removePartialRows(Ljava/util/List;Ljava/util/List;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_b

    return-void

    :cond_b
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    if-ne v2, v3, :cond_20

    goto :goto_4

    :cond_20
    const/4 v2, 0x1

    invoke-virtual {v1}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getPairs()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_29
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_30

    goto :goto_54

    :cond_30
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    const/4 v5, 0x0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3b
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_42

    goto :goto_50

    :cond_42
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v4, v7}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3b

    const/4 v5, 0x1

    nop

    :goto_50
    if-nez v5, :cond_29

    const/4 v2, 0x0

    nop

    :goto_54
    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_4
.end method

.method private static reverseCounters([I)V
    .registers 5

    array-length v0, p0

    const/4 v1, 0x0

    :goto_2
    div-int/lit8 v2, v0, 0x2

    if-lt v1, v2, :cond_7

    return-void

    :cond_7
    aget v2, p0, v1

    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aget v3, p0, v3

    aput v3, p0, v1

    sub-int v3, v0, v1

    add-int/lit8 v3, v3, -0x1

    aput v2, p0, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private storeRow(IZ)V
    .registers 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-lt v0, v3, :cond_c

    goto :goto_21

    :cond_c
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    invoke-virtual {v3}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->getRowNumber()I

    move-result v4

    if-le v4, p1, :cond_46

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v2

    nop

    :goto_21
    if-nez v2, :cond_45

    if-eqz v1, :cond_26

    goto :goto_45

    :cond_26
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isPartialRow(Ljava/lang/Iterable;Ljava/lang/Iterable;)Z

    move-result v3

    if-eqz v3, :cond_31

    return-void

    :cond_31
    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    new-instance v4, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;

    iget-object v5, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-direct {v4, v5, p1, p2}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;-><init>(Ljava/util/List;IZ)V

    invoke-interface {v3, v0, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-static {v3, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->removePartialRows(Ljava/util/List;Ljava/util/List;)V

    return-void

    :cond_45
    :goto_45
    return-void

    :cond_46
    iget-object v4, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {v3, v4}, Lcom/google/zxing/oned/rss/expanded/ExpandedRow;->isEquivalent(Ljava/util/List;)Z

    move-result v1

    add-int/lit8 v0, v0, 0x1

    goto :goto_3
.end method


# virtual methods
.method decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;
    .registers 30
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    move-object/from16 v0, p1

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getDataCharacterCounters()[I

    move-result-object v1

    const/4 v2, 0x0

    aput v2, v1, v2

    const/4 v3, 0x1

    aput v2, v1, v3

    const/4 v4, 0x2

    aput v2, v1, v4

    const/4 v5, 0x3

    aput v2, v1, v5

    const/4 v5, 0x4

    aput v2, v1, v5

    const/4 v6, 0x5

    aput v2, v1, v6

    const/4 v6, 0x6

    aput v2, v1, v6

    const/4 v6, 0x7

    aput v2, v1, v6

    if-eqz p4, :cond_2a

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v6

    aget v6, v6, v2

    invoke-static {v0, v6, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPatternInReverse(Lcom/google/zxing/common/BitArray;I[I)V

    goto :goto_38

    :cond_2a
    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v6

    aget v6, v6, v3

    invoke-static {v0, v6, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->recordPattern(Lcom/google/zxing/common/BitArray;I[I)V

    const/4 v6, 0x0

    array-length v7, v1

    sub-int/2addr v7, v3

    :goto_36
    if-lt v6, v7, :cond_182

    :goto_38
    const/16 v6, 0x11

    invoke-static {v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->count([I)I

    move-result v7

    int-to-float v7, v7

    int-to-float v8, v6

    div-float/2addr v7, v8

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v8

    aget v8, v8, v3

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getStartEnd()[I

    move-result-object v9

    aget v9, v9, v2

    sub-int/2addr v8, v9

    int-to-float v8, v8

    const/high16 v9, 0x41700000    # 15.0f

    div-float/2addr v8, v9

    sub-float v9, v7, v8

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    div-float/2addr v9, v8

    const v10, 0x3e99999a    # 0.3f

    cmpl-float v9, v9, v10

    if-gtz v9, :cond_179

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddCounts()[I

    move-result-object v9

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenCounts()[I

    move-result-object v11

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getOddRoundingErrors()[F

    move-result-object v12

    invoke-virtual/range {p0 .. p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getEvenRoundingErrors()[F

    move-result-object v13

    const/4 v14, 0x0

    :goto_71
    array-length v10, v1

    if-lt v14, v10, :cond_11f

    move-object/from16 v10, p0

    invoke-direct {v10, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->adjustOddEvenCounts(I)V

    invoke-virtual/range {p2 .. p2}, Lcom/google/zxing/oned/rss/FinderPattern;->getValue()I

    move-result v14

    mul-int/2addr v14, v5

    if-eqz p3, :cond_82

    move v15, v2

    goto :goto_83

    :cond_82
    move v15, v4

    :goto_83
    add-int/2addr v14, v15

    xor-int/lit8 v15, p4, 0x1

    add-int/2addr v14, v15

    add-int/lit8 v16, v14, -0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    array-length v2, v9

    sub-int/2addr v2, v3

    :goto_8d
    if-gez v2, :cond_f9

    const/4 v2, 0x0

    array-length v4, v11

    sub-int/2addr v4, v3

    :goto_92
    if-gez v4, :cond_d6

    add-int v4, v15, v2

    and-int/lit8 v19, v14, 0x1

    if-nez v19, :cond_cf

    const/16 v3, 0xd

    if-gt v14, v3, :cond_cf

    if-lt v14, v5, :cond_cf

    sub-int/2addr v3, v14

    const/4 v5, 0x2

    div-int/2addr v3, v5

    sget-object v5, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->SYMBOL_WIDEST:[I

    aget v5, v5, v3

    rsub-int/lit8 v0, v5, 0x9

    move/from16 v20, v6

    const/4 v6, 0x1

    invoke-static {v9, v5, v6}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v6

    move/from16 v21, v5

    const/4 v5, 0x0

    invoke-static {v11, v0, v5}, Lcom/google/zxing/oned/rss/RSSUtils;->getRSSvalue([IIZ)I

    move-result v5

    sget-object v17, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->EVEN_TOTAL_SUBSET:[I

    aget v17, v17, v3

    sget-object v18, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->GSUM:[I

    aget v18, v18, v3

    mul-int v19, v6, v17

    add-int v19, v19, v5

    move/from16 v22, v0

    add-int v0, v19, v18

    move/from16 v23, v3

    new-instance v3, Lcom/google/zxing/oned/rss/DataCharacter;

    invoke-direct {v3, v0, v4}, Lcom/google/zxing/oned/rss/DataCharacter;-><init>(II)V

    return-object v3

    :cond_cf
    move/from16 v20, v6

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_d6
    move v0, v5

    move/from16 v20, v6

    const/4 v5, 0x0

    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v3

    if-eqz v3, :cond_f0

    sget-object v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v3, v3, v16

    const/4 v6, 0x2

    mul-int v17, v6, v4

    const/4 v6, 0x1

    add-int/lit8 v17, v17, 0x1

    aget v3, v3, v17

    aget v6, v11, v4

    mul-int/2addr v6, v3

    add-int/2addr v2, v6

    :cond_f0
    add-int/lit8 v4, v4, -0x1

    move v5, v0

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v3, 0x1

    goto :goto_92

    :cond_f9
    move v0, v5

    move/from16 v20, v6

    const/4 v5, 0x0

    invoke-static/range {p2 .. p4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->isNotA1left(Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Z

    move-result v3

    if-eqz v3, :cond_111

    sget-object v3, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->WEIGHTS:[[I

    aget-object v3, v3, v16

    const/4 v4, 0x2

    mul-int v6, v4, v2

    aget v3, v3, v6

    aget v6, v9, v2

    mul-int/2addr v6, v3

    add-int/2addr v15, v6

    goto :goto_112

    :cond_111
    const/4 v4, 0x2

    :goto_112
    aget v3, v9, v2

    add-int/2addr v14, v3

    add-int/lit8 v2, v2, -0x1

    move v5, v0

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v3, 0x1

    goto/16 :goto_8d

    :cond_11f
    move-object/from16 v10, p0

    move v0, v5

    move/from16 v20, v6

    move v5, v2

    const/high16 v2, 0x3f800000    # 1.0f

    aget v3, v1, v14

    int-to-float v3, v3

    mul-float/2addr v2, v3

    div-float/2addr v2, v7

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v3, v2

    float-to-int v3, v3

    const/4 v6, 0x1

    if-ge v3, v6, :cond_141

    const v15, 0x3e99999a    # 0.3f

    cmpg-float v16, v2, v15

    if-ltz v16, :cond_13c

    const/4 v3, 0x1

    goto :goto_157

    :cond_13c
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_141
    const v15, 0x3e99999a    # 0.3f

    const/16 v0, 0x8

    if-le v3, v0, :cond_157

    const v0, 0x410b3333    # 8.7f

    cmpl-float v0, v2, v0

    if-gtz v0, :cond_152

    const/16 v3, 0x8

    goto :goto_157

    :cond_152
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_157
    :goto_157
    div-int/lit8 v0, v14, 0x2

    and-int/lit8 v16, v14, 0x1

    if-nez v16, :cond_165

    aput v3, v9, v0

    int-to-float v4, v3

    sub-float v4, v2, v4

    aput v4, v12, v0

    goto :goto_16c

    :cond_165
    aput v3, v11, v0

    int-to-float v4, v3

    sub-float v4, v2, v4

    aput v4, v13, v0

    :goto_16c
    add-int/lit8 v14, v14, 0x1

    move v2, v5

    move v3, v6

    move v10, v15

    move/from16 v6, v20

    move-object/from16 v0, p1

    const/4 v4, 0x2

    const/4 v5, 0x4

    goto/16 :goto_71

    :cond_179
    move-object/from16 v10, p0

    move/from16 v20, v6

    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v0

    throw v0

    :cond_182
    move-object/from16 v10, p0

    move v5, v2

    move v0, v3

    aget v2, v1, v6

    aget v3, v1, v7

    aput v3, v1, v6

    aput v2, v1, v7

    add-int/lit8 v6, v6, 0x1

    add-int/lit8 v7, v7, -0x1

    move v3, v0

    move v2, v5

    move-object/from16 v0, p1

    const/4 v4, 0x2

    const/4 v5, 0x4

    goto/16 :goto_36
.end method

.method public decodeRow(ILcom/google/zxing/common/BitArray;Ljava/util/Map;)Lcom/google/zxing/Result;
    .registers 6
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
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    :try_start_8
    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v1
    :try_end_10
    .catch Lcom/google/zxing/NotFoundException; {:try_start_8 .. :try_end_10} :catch_11

    return-object v1

    :catch_11
    move-exception v0

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    invoke-virtual {p0, p1, p2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->constructResult(Ljava/util/List;)Lcom/google/zxing/Result;

    move-result-object v1

    return-object v1
.end method

.method decodeRow2pairs(ILcom/google/zxing/common/BitArray;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/google/zxing/common/BitArray;",
            ")",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-virtual {p0, p2, v0, p1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    move-result-object v0

    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_b
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_b} :catch_c

    goto :goto_0

    :catch_c
    move-exception v0

    iget-object v1, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_40

    invoke-direct {p0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkChecksum()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    return-object v0

    :cond_1e
    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const/4 v2, 0x0

    invoke-direct {p0, p1, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->storeRow(IZ)V

    if-eqz v0, :cond_3b

    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_34

    return-object v3

    :cond_34
    invoke-direct {p0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->checkRows(Z)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_3b

    return-object v1

    :cond_3b
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_40
    throw v0
.end method

.method getRows()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedRow;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    return-object v0
.end method

.method public reset()V
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->pairs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->rows:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method retrieveNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)Lcom/google/zxing/oned/rss/expanded/ExpandedPair;
    .registers 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/zxing/common/BitArray;",
            "Ljava/util/List<",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;",
            ">;I)",
            "Lcom/google/zxing/oned/rss/expanded/ExpandedPair;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_c

    move v0, v2

    goto :goto_d

    :cond_c
    move v0, v1

    :goto_d
    iget-boolean v3, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startFromEven:Z

    if-eqz v3, :cond_17

    if-eqz v0, :cond_15

    move v3, v1

    goto :goto_16

    :cond_15
    move v3, v2

    :goto_16
    move v0, v3

    :cond_17
    const/4 v3, 0x1

    const/4 v4, -0x1

    :cond_19
    invoke-direct {p0, p1, p2, v4}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->findNextPair(Lcom/google/zxing/common/BitArray;Ljava/util/List;I)V

    invoke-direct {p0, p1, p3, v0}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->parseFoundFinderPattern(Lcom/google/zxing/common/BitArray;IZ)Lcom/google/zxing/oned/rss/FinderPattern;

    move-result-object v5

    if-nez v5, :cond_2b

    iget-object v6, p0, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->startEnd:[I

    aget v6, v6, v1

    invoke-static {p1, v6}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->getNextSecondBar(Lcom/google/zxing/common/BitArray;I)I

    move-result v4

    goto :goto_2c

    :cond_2b
    const/4 v3, 0x0

    :goto_2c
    if-nez v3, :cond_19

    invoke-virtual {p0, p1, v5, v0, v2}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v6

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4f

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    sub-int/2addr v7, v2

    invoke-interface {p2, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-virtual {v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;->mustBeLast()Z

    move-result v2

    if-nez v2, :cond_4a

    goto :goto_4f

    :cond_4a
    invoke-static {}, Lcom/google/zxing/NotFoundException;->getNotFoundInstance()Lcom/google/zxing/NotFoundException;

    move-result-object v1

    throw v1

    :cond_4f
    :goto_4f
    :try_start_4f
    invoke-virtual {p0, p1, v5, v0, v1}, Lcom/google/zxing/oned/rss/expanded/RSSExpandedReader;->decodeDataCharacter(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/oned/rss/FinderPattern;ZZ)Lcom/google/zxing/oned/rss/DataCharacter;

    move-result-object v1
    :try_end_53
    .catch Lcom/google/zxing/NotFoundException; {:try_start_4f .. :try_end_53} :catch_54

    goto :goto_56

    :catch_54
    move-exception v1

    const/4 v1, 0x0

    :goto_56
    const/4 v2, 0x1

    new-instance v7, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;

    invoke-direct {v7, v6, v1, v5, v2}, Lcom/google/zxing/oned/rss/expanded/ExpandedPair;-><init>(Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/DataCharacter;Lcom/google/zxing/oned/rss/FinderPattern;Z)V

    return-object v7
.end method
