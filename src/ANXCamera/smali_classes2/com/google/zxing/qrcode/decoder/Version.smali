.class public final Lcom/google/zxing/qrcode/decoder/Version;
.super Ljava/lang/Object;
.source "Version.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/decoder/Version$ECB;,
        Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    }
.end annotation


# static fields
.field private static final VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

.field private static final VERSION_DECODE_INFO:[I


# instance fields
.field private final alignmentPatternCenters:[I

.field private final ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

.field private final totalCodewords:I

.field private final versionNumber:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x22

    new-array v0, v0, [I

    fill-array-data v0, :array_18

    nop

    nop

    nop

    nop

    nop

    nop

    nop

    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    invoke-static {}, Lcom/google/zxing/qrcode/decoder/Version;->buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0

    sput-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    return-void

    nop

    :array_18
    .array-data 4
        0x7c94
        0x85bc
        0x9a99
        0xa4d3
        0xbbf6
        0xc762
        0xd847
        0xe60d
        0xf928
        0x10b78
        0x1145d
        0x12a17
        0x13532
        0x149a6
        0x15683
        0x168c9
        0x177ec
        0x18ec4
        0x191e1
        0x1afab
        0x1b08e
        0x1cc1a
        0x1d33f
        0x1ed75
        0x1f250
        0x209d5
        0x216f0
        0x228ba
        0x2379f
        0x24b0b
        0x2542e
        0x26a64
        0x27541
        0x28c69
    .end array-data
.end method

.method private varargs constructor <init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V
    .registers 12

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    iput-object p2, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    iput-object p3, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/4 v0, 0x0

    const/4 v1, 0x0

    aget-object v2, p3, v1

    invoke-virtual {v2}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECCodewordsPerBlock()I

    move-result v2

    aget-object v3, p3, v1

    invoke-virtual {v3}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;->getECBlocks()[Lcom/google/zxing/qrcode/decoder/Version$ECB;

    move-result-object v3

    array-length v4, v3

    :goto_18
    if-lt v1, v4, :cond_1d

    iput v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    return-void

    :cond_1d
    aget-object v5, v3, v1

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getCount()I

    move-result v6

    invoke-virtual {v5}, Lcom/google/zxing/qrcode/decoder/Version$ECB;->getDataCodewords()I

    move-result v7

    add-int/2addr v7, v2

    mul-int/2addr v6, v7

    add-int/2addr v0, v6

    add-int/lit8 v1, v1, 0x1

    goto :goto_18
.end method

.method private static buildVersions()[Lcom/google/zxing/qrcode/decoder/Version;
    .registers 17

    const/16 v0, 0x28

    new-array v0, v0, [Lcom/google/zxing/qrcode/decoder/Version;

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v2, 0x0

    new-array v3, v2, [I

    const/4 v4, 0x4

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    const/4 v7, 0x1

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v10, 0x13

    invoke-direct {v9, v7, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v8, v2

    const/4 v9, 0x7

    invoke-direct {v6, v9, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v10, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v10, v8, v2

    const/16 v10, 0xa

    invoke-direct {v6, v10, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v8, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v10, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    invoke-direct {v10, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v10, v8, v2

    const/16 v10, 0xd

    invoke-direct {v6, v10, v8}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    const/4 v8, 0x2

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v10, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x9

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v10, v2

    const/16 v12, 0x11

    invoke-direct {v6, v12, v10}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    const/4 v10, 0x3

    aput-object v6, v5, v10

    invoke-direct {v1, v7, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v2

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1468

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x22

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0xa

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x1c

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    invoke-direct {v1, v8, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v7

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1470

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x37

    invoke-direct {v13, v7, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v9, 0xf

    invoke-direct {v6, v9, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x2c

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x11

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0xd

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    invoke-direct {v1, v10, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v8

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1478

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x50

    invoke-direct {v13, v7, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x14

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x20

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v14, 0x18

    invoke-direct {v13, v8, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x9

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    invoke-direct {v1, v4, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v10

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1480

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x6c

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1a

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2b

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xb

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/4 v6, 0x5

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v4

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v8, [I

    fill-array-data v3, :array_1488

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v13, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v6, 0x44

    invoke-direct {v15, v8, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v13, v2

    const/16 v6, 0x12

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v12, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x1b

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v6, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v4, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1c

    invoke-direct {v6, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/4 v6, 0x6

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/4 v3, 0x5

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_1490

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v13, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x4e

    invoke-direct {v15, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v13, v2

    const/16 v11, 0x14

    invoke-direct {v12, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v12, v5, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x1f

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v4, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xd

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v10

    const/4 v11, 0x7

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v6

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_149a

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x61

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x26

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x27

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x12

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xe

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v10

    const/16 v11, 0x8

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/4 v3, 0x7

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14a4

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x74

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x1e

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v15, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x24

    invoke-direct {v15, v10, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v15, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x25

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x16

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x10

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x11

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x14

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xd

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v10

    const/16 v11, 0x9

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x8

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14ae

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x44

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x45

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x12

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2b

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x2c

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1a

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x13

    invoke-direct {v13, v6, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x14

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v13, v6, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x10

    invoke-direct {v13, v8, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1c

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v10

    const/16 v11, 0xa

    invoke-direct {v1, v11, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x9

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14b8

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x51

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    const/16 v13, 0x14

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x32

    invoke-direct {v13, v7, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x33

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1e

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v7

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x17

    invoke-direct {v13, v4, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    const/16 v13, 0x1c

    invoke-direct {v11, v13, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v8

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v12, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xc

    invoke-direct {v13, v10, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v2

    new-instance v13, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x8

    const/16 v9, 0xd

    invoke-direct {v13, v15, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v13, v12, v7

    invoke-direct {v11, v14, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v11, v5, v10

    const/16 v9, 0xb

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xa

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14c2

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x5c

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x5d

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x24

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x25

    invoke-direct {v12, v8, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x14

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x15

    invoke-direct {v12, v6, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x1a

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xe

    const/4 v15, 0x7

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xf

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x1c

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v10

    const/16 v9, 0xc

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xb

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v10, [I

    fill-array-data v3, :array_14cc

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x6b

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    const/16 v12, 0x1a

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x8

    const/16 v15, 0x25

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x26

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x8

    const/16 v15, 0x14

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x15

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xc

    const/16 v15, 0xb

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v10

    const/16 v9, 0xd

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xc

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14d6

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x73

    invoke-direct {v12, v10, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x74

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x1e

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x28

    invoke-direct {v12, v4, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x29

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xb

    const/16 v15, 0x10

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x11

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x14

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xb

    const/16 v15, 0xc

    invoke-direct {v12, v13, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0xd

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v10

    const/16 v9, 0xe

    invoke-direct {v1, v9, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xd

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14e2

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x57

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x58

    invoke-direct {v12, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x29

    const/4 v15, 0x5

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x2a

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v7

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v15, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v13, 0x19

    const/4 v15, 0x7

    invoke-direct {v12, v15, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v7

    const/16 v12, 0x1e

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v8

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v11, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0xb

    const/16 v6, 0xc

    invoke-direct {v12, v15, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v11, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/4 v15, 0x7

    invoke-direct {v6, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v6, v11, v7

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v9, v5, v10

    const/16 v6, 0xf

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xe

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14ee

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x62

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x63

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    invoke-direct {v6, v14, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2d

    const/4 v15, 0x7

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2e

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0xf

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x14

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    invoke-direct {v6, v14, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    invoke-direct {v1, v15, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0xf

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_14fa

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6b

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6c

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xa

    const/16 v15, 0x2e

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2f

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/16 v15, 0xf

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0xf

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/16 v6, 0x11

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x10

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_1506

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x78

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x79

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x9

    const/16 v15, 0x2b

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2c

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x16

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    invoke-direct {v11, v7, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0xf

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/16 v6, 0x12

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x11

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_1512

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x71

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x72

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x2c

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xb

    const/16 v15, 0x2d

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x15

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x9

    const/16 v15, 0xd

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    const/16 v15, 0x10

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/16 v6, 0x13

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x12

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    new-array v3, v4, [I

    fill-array-data v3, :array_151e

    new-array v5, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6b

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6c

    const/4 v15, 0x5

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x29

    invoke-direct {v11, v10, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xd

    const/16 v15, 0x2a

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v12, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v12, 0x5

    invoke-direct {v11, v12, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v11, v12, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xa

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v10

    const/16 v6, 0x14

    invoke-direct {v1, v6, v3, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x13

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v5, v3, [I

    fill-array-data v5, :array_152a

    new-array v3, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x74

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x75

    invoke-direct {v11, v4, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/16 v15, 0x2a

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    const/16 v11, 0x1a

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v7

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x16

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v8

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x13

    const/16 v15, 0x10

    invoke-direct {v11, v12, v15}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1e

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v10

    const/16 v6, 0x15

    invoke-direct {v1, v6, v5, v3}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x14

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v5, v3, [I

    fill-array-data v5, :array_1538

    new-array v3, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x6f

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x70

    const/4 v15, 0x7

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v11, 0x1c

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v2

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v15, 0x11

    const/16 v4, 0x2e

    invoke-direct {v12, v15, v4}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v9, v2

    invoke-direct {v6, v11, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v3, v7

    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v4, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v4, v3, v8

    new-instance v4, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0xd

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    invoke-direct {v4, v14, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v4, v3, v10

    const/16 v4, 0x16

    invoke-direct {v1, v4, v5, v3}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x15

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1546

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x79

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7a

    const/4 v12, 0x5

    invoke-direct {v3, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v3, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xe

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x17

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x16

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1554

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x75

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x76

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v12, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v12, v9, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v12, v6, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x11

    invoke-direct {v11, v8, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v6, v7

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    invoke-direct {v1, v14, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x17

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1562

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x6a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x6b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1a

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    invoke-direct {v1, v13, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v14

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_1570

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x72

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x73

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x16

    invoke-direct {v11, v9, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v6, v2

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x17

    const/4 v15, 0x6

    invoke-direct {v11, v15, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v6, v7

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x21

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x1a

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v13

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x5

    new-array v4, v3, [I

    fill-array-data v4, :array_157e

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x8

    const/16 v12, 0x17

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1c

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x1b

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1a

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_158c

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x75

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x76

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2d

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x4

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x1c

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1b

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_159c

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x75

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x15

    const/16 v12, 0x2d

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x25

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x1d

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1c

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15ac

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x73

    const/4 v12, 0x5

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x74

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v13, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x10

    invoke-direct {v9, v13, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    invoke-direct {v1, v9, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1d

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15bc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    invoke-direct {v9, v10, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2a

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v7, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1c

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x1f

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    aput-object v1, v0, v9

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15cc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v7, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x23

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x23

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x20

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x1f

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15dc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x15

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xb

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x21

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x20

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x6

    new-array v4, v3, [I

    fill-array-data v4, :array_15ec

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x73

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x74

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x17

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2c

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/4 v11, 0x7

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x3b

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    invoke-direct {v9, v7, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x22

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x21

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_15fc

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0x79

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7a

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xc

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1a

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x27

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    const/16 v12, 0x16

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x29

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x23

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x22

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_160e

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x79

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2f

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v8, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x40

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x24

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x23

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1620

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x11

    const/16 v12, 0x7a

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x7b

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1d

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x31

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xf

    invoke-direct {v9, v14, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2e

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x25

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x24

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1632

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v6, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v9, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v11, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v12, 0x7a

    invoke-direct {v11, v3, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v11, v9, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x12

    const/16 v12, 0x7b

    invoke-direct {v3, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v3, v9, v7

    const/16 v3, 0x1e

    invoke-direct {v6, v3, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v6, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xd

    const/16 v12, 0x2e

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x20

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x30

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xe

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2a

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x20

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x26

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x25

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v4, v3, [I

    fill-array-data v4, :array_1644

    const/4 v3, 0x4

    new-array v5, v3, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x14

    const/16 v12, 0x75

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x76

    const/4 v12, 0x4

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v2

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x28

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x30

    const/4 v12, 0x7

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v7

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x2b

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x16

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v8

    new-instance v3, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0xa

    const/16 v12, 0xf

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x43

    const/16 v12, 0x10

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v3, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v3, v5, v10

    const/16 v3, 0x27

    invoke-direct {v1, v3, v4, v5}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v3, 0x26

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/Version;

    const/4 v3, 0x7

    new-array v3, v3, [I

    fill-array-data v3, :array_1656

    const/4 v4, 0x4

    new-array v4, v4, [Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x13

    const/16 v12, 0x76

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x77

    const/4 v12, 0x6

    invoke-direct {v9, v12, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v2

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x12

    const/16 v12, 0x2f

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x1f

    const/16 v12, 0x30

    invoke-direct {v9, v11, v12}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1c

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v7

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v11, 0x22

    invoke-direct {v9, v11, v14}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v2

    new-instance v9, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    invoke-direct {v9, v11, v13}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v9, v6, v7

    const/16 v9, 0x1e

    invoke-direct {v5, v9, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v8

    new-instance v5, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    new-array v6, v8, [Lcom/google/zxing/qrcode/decoder/Version$ECB;

    new-instance v8, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v9, 0x14

    const/16 v11, 0xf

    invoke-direct {v8, v9, v11}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v8, v6, v2

    new-instance v2, Lcom/google/zxing/qrcode/decoder/Version$ECB;

    const/16 v8, 0x3d

    const/16 v9, 0x10

    invoke-direct {v2, v8, v9}, Lcom/google/zxing/qrcode/decoder/Version$ECB;-><init>(II)V

    aput-object v2, v6, v7

    const/16 v2, 0x1e

    invoke-direct {v5, v2, v6}, Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;-><init>(I[Lcom/google/zxing/qrcode/decoder/Version$ECB;)V

    aput-object v5, v4, v10

    const/16 v2, 0x28

    invoke-direct {v1, v2, v3, v4}, Lcom/google/zxing/qrcode/decoder/Version;-><init>(I[I[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;)V

    const/16 v2, 0x27

    aput-object v1, v0, v2

    return-object v0

    :array_1468
    .array-data 4
        0x6
        0x12
    .end array-data

    :array_1470
    .array-data 4
        0x6
        0x16
    .end array-data

    :array_1478
    .array-data 4
        0x6
        0x1a
    .end array-data

    :array_1480
    .array-data 4
        0x6
        0x1e
    .end array-data

    :array_1488
    .array-data 4
        0x6
        0x22
    .end array-data

    :array_1490
    .array-data 4
        0x6
        0x16
        0x26
    .end array-data

    :array_149a
    .array-data 4
        0x6
        0x18
        0x2a
    .end array-data

    :array_14a4
    .array-data 4
        0x6
        0x1a
        0x2e
    .end array-data

    :array_14ae
    .array-data 4
        0x6
        0x1c
        0x32
    .end array-data

    :array_14b8
    .array-data 4
        0x6
        0x1e
        0x36
    .end array-data

    :array_14c2
    .array-data 4
        0x6
        0x20
        0x3a
    .end array-data

    :array_14cc
    .array-data 4
        0x6
        0x22
        0x3e
    .end array-data

    :array_14d6
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
    .end array-data

    :array_14e2
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
    .end array-data

    :array_14ee
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
    .end array-data

    :array_14fa
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
    .end array-data

    :array_1506
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
    .end array-data

    :array_1512
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
    .end array-data

    :array_151e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
    .end array-data

    :array_152a
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
    .end array-data

    :array_1538
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
    .end array-data

    :array_1546
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
    .end array-data

    :array_1554
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
    .end array-data

    :array_1562
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
    .end array-data

    :array_1570
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
    .end array-data

    :array_157e
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
    .end array-data

    :array_158c
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
    .end array-data

    :array_159c
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
    .end array-data

    :array_15ac
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
    .end array-data

    :array_15bc
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
    .end array-data

    :array_15cc
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
    .end array-data

    :array_15dc
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
    .end array-data

    :array_15ec
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
    .end array-data

    :array_15fc
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    :array_160e
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    :array_1620
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    :array_1632
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    :array_1644
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    :array_1656
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data
.end method

.method static decodeVersionInformation(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 6

    const v0, 0x7fffffff

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_5
    sget-object v3, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    array-length v3, v3

    if-lt v2, v3, :cond_14

    const/4 v2, 0x3

    if-gt v0, v2, :cond_12

    invoke-static {v1}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v2

    return-object v2

    :cond_12
    const/4 v2, 0x0

    return-object v2

    :cond_14
    sget-object v3, Lcom/google/zxing/qrcode/decoder/Version;->VERSION_DECODE_INFO:[I

    aget v3, v3, v2

    if-ne v3, p0, :cond_21

    add-int/lit8 v4, v2, 0x7

    invoke-static {v4}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v4

    return-object v4

    :cond_21
    invoke-static {p0, v3}, Lcom/google/zxing/qrcode/decoder/FormatInformation;->numBitsDiffering(II)I

    move-result v4

    if-ge v4, v0, :cond_2a

    add-int/lit8 v1, v2, 0x7

    move v0, v4

    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_5
.end method

.method public static getProvisionalVersionForDimension(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    rem-int/lit8 v0, p0, 0x4

    const/4 v1, 0x1

    if-ne v0, v1, :cond_14

    add-int/lit8 v0, p0, -0x11

    :try_start_7
    div-int/lit8 v0, v0, 0x4

    invoke-static {v0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;

    move-result-object v0
    :try_end_d
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_d} :catch_e

    return-object v0

    :catch_e
    move-exception v0

    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v1

    throw v1

    :cond_14
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    move-result-object v0

    throw v0
.end method

.method public static getVersionForNumber(I)Lcom/google/zxing/qrcode/decoder/Version;
    .registers 3

    const/4 v0, 0x1

    if-lt p0, v0, :cond_e

    const/16 v0, 0x28

    if-gt p0, v0, :cond_e

    sget-object v0, Lcom/google/zxing/qrcode/decoder/Version;->VERSIONS:[Lcom/google/zxing/qrcode/decoder/Version;

    add-int/lit8 v1, p0, -0x1

    aget-object v0, v0, v1

    return-object v0

    :cond_e
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method buildFunctionPattern()Lcom/google/zxing/common/BitMatrix;
    .registers 11

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getDimensionForVersion()I

    move-result v0

    new-instance v1, Lcom/google/zxing/common/BitMatrix;

    invoke-direct {v1, v0}, Lcom/google/zxing/common/BitMatrix;-><init>(I)V

    const/16 v2, 0x9

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v2}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    add-int/lit8 v4, v0, -0x8

    const/16 v5, 0x8

    invoke-virtual {v1, v4, v3, v5, v2}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    add-int/lit8 v4, v0, -0x8

    invoke-virtual {v1, v3, v4, v2, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    iget-object v4, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    array-length v4, v4

    const/4 v5, 0x0

    :goto_1f
    if-lt v5, v4, :cond_3d

    add-int/lit8 v5, v0, -0x11

    const/4 v6, 0x6

    const/4 v7, 0x1

    invoke-virtual {v1, v6, v2, v7, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    add-int/lit8 v5, v0, -0x11

    invoke-virtual {v1, v2, v6, v5, v7}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    iget v2, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    if-le v2, v6, :cond_3c

    add-int/lit8 v2, v0, -0xb

    const/4 v5, 0x3

    invoke-virtual {v1, v2, v3, v5, v6}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    add-int/lit8 v2, v0, -0xb

    invoke-virtual {v1, v3, v2, v6, v5}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    :cond_3c
    return-object v1

    :cond_3d
    iget-object v6, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v6, v6, v5

    add-int/lit8 v6, v6, -0x2

    const/4 v7, 0x0

    :goto_44
    if-lt v7, v4, :cond_49

    add-int/lit8 v5, v5, 0x1

    goto :goto_1f

    :cond_49
    if-nez v5, :cond_51

    if-eqz v7, :cond_62

    add-int/lit8 v8, v4, -0x1

    if-eq v7, v8, :cond_62

    :cond_51
    add-int/lit8 v8, v4, -0x1

    if-ne v5, v8, :cond_58

    if-nez v7, :cond_58

    goto :goto_62

    :cond_58
    iget-object v8, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    aget v8, v8, v7

    add-int/lit8 v8, v8, -0x2

    const/4 v9, 0x5

    invoke-virtual {v1, v8, v6, v9, v9}, Lcom/google/zxing/common/BitMatrix;->setRegion(IIII)V

    :cond_62
    :goto_62
    add-int/lit8 v7, v7, 0x1

    goto :goto_44
.end method

.method public getAlignmentPatternCenters()[I
    .registers 2

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->alignmentPatternCenters:[I

    return-object v0
.end method

.method public getDimensionForVersion()I
    .registers 3

    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    const/4 v1, 0x4

    mul-int/2addr v1, v0

    const/16 v0, 0x11

    add-int/2addr v0, v1

    return v0
.end method

.method public getECBlocksForLevel(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;)Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;
    .registers 4

    iget-object v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->ecBlocks:[Lcom/google/zxing/qrcode/decoder/Version$ECBlocks;

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->ordinal()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getTotalCodewords()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->totalCodewords:I

    return v0
.end method

.method public getVersionNumber()I
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    iget v0, p0, Lcom/google/zxing/qrcode/decoder/Version;->versionNumber:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
