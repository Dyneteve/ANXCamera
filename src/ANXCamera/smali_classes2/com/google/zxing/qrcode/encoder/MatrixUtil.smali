.class final Lcom/google/zxing/qrcode/encoder/MatrixUtil;
.super Ljava/lang/Object;
.source "MatrixUtil.java"


# static fields
.field private static final POSITION_ADJUSTMENT_PATTERN:[[I

.field private static final POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

.field private static final POSITION_DETECTION_PATTERN:[[I

.field private static final TYPE_INFO_COORDINATES:[[I

.field private static final TYPE_INFO_MASK_PATTERN:I = 0x5412

.field private static final TYPE_INFO_POLY:I = 0x537

.field private static final VERSION_INFO_POLY:I = 0x1f25


# direct methods
.method static constructor <clinit>()V
    .registers 18

    const/4 v0, 0x7

    new-array v1, v0, [[I

    new-array v2, v0, [I

    fill-array-data v2, :array_24c

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-array v2, v0, [I

    const/4 v4, 0x1

    aput v4, v2, v3

    const/4 v5, 0x6

    aput v4, v2, v5

    aput-object v2, v1, v4

    new-array v2, v0, [I

    aput v4, v2, v3

    const/4 v6, 0x2

    aput v4, v2, v6

    const/4 v7, 0x3

    aput v4, v2, v7

    const/4 v8, 0x4

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v6

    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v7

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v7

    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v7

    aput v4, v2, v8

    aput v4, v2, v5

    aput-object v2, v1, v8

    new-array v2, v0, [I

    aput v4, v2, v3

    aput v4, v2, v5

    const/4 v9, 0x5

    aput-object v2, v1, v9

    new-array v2, v0, [I

    fill-array-data v2, :array_25e

    aput-object v2, v1, v5

    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    new-array v1, v9, [[I

    new-array v2, v9, [I

    fill-array-data v2, :array_270

    aput-object v2, v1, v3

    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v8

    aput-object v2, v1, v4

    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v6

    aput v4, v2, v8

    aput-object v2, v1, v6

    new-array v2, v9, [I

    aput v4, v2, v3

    aput v4, v2, v8

    aput-object v2, v1, v7

    new-array v2, v9, [I

    fill-array-data v2, :array_27e

    aput-object v2, v1, v8

    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    const/16 v1, 0x28

    new-array v1, v1, [[I

    new-array v2, v0, [I

    fill-array-data v2, :array_28c

    aput-object v2, v1, v3

    new-array v2, v0, [I

    fill-array-data v2, :array_29e

    aput-object v2, v1, v4

    new-array v2, v0, [I

    fill-array-data v2, :array_2b0

    aput-object v2, v1, v6

    new-array v2, v0, [I

    fill-array-data v2, :array_2c2

    aput-object v2, v1, v7

    new-array v2, v0, [I

    fill-array-data v2, :array_2d4

    aput-object v2, v1, v8

    new-array v2, v0, [I

    fill-array-data v2, :array_2e6

    aput-object v2, v1, v9

    new-array v2, v0, [I

    fill-array-data v2, :array_2f8

    aput-object v2, v1, v5

    new-array v2, v0, [I

    fill-array-data v2, :array_30a

    aput-object v2, v1, v0

    new-array v2, v0, [I

    fill-array-data v2, :array_31c

    const/16 v10, 0x8

    aput-object v2, v1, v10

    new-array v2, v0, [I

    fill-array-data v2, :array_32e

    const/16 v11, 0x9

    aput-object v2, v1, v11

    new-array v2, v0, [I

    fill-array-data v2, :array_340

    const/16 v12, 0xa

    aput-object v2, v1, v12

    new-array v2, v0, [I

    fill-array-data v2, :array_352

    const/16 v13, 0xb

    aput-object v2, v1, v13

    new-array v2, v0, [I

    fill-array-data v2, :array_364

    const/16 v14, 0xc

    aput-object v2, v1, v14

    new-array v2, v0, [I

    fill-array-data v2, :array_376

    const/16 v15, 0xd

    aput-object v2, v1, v15

    new-array v2, v0, [I

    fill-array-data v2, :array_388

    const/16 v16, 0xe

    aput-object v2, v1, v16

    new-array v2, v0, [I

    fill-array-data v2, :array_39a

    const/16 v17, 0xf

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_3ac

    const/16 v17, 0x10

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_3be

    const/16 v17, 0x11

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_3d0

    const/16 v17, 0x12

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_3e2

    const/16 v17, 0x13

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_3f4

    const/16 v17, 0x14

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_406

    const/16 v17, 0x15

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_418

    const/16 v17, 0x16

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_42a

    const/16 v17, 0x17

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_43c

    const/16 v17, 0x18

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_44e

    const/16 v17, 0x19

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_460

    const/16 v17, 0x1a

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_472

    const/16 v17, 0x1b

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_484

    const/16 v17, 0x1c

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_496

    const/16 v17, 0x1d

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_4a8

    const/16 v17, 0x1e

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_4ba

    const/16 v17, 0x1f

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_4cc

    const/16 v17, 0x20

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_4de

    const/16 v17, 0x21

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_4f0

    const/16 v17, 0x22

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_502

    const/16 v17, 0x23

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_514

    const/16 v17, 0x24

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_526

    const/16 v17, 0x25

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_538

    const/16 v17, 0x26

    aput-object v2, v1, v17

    new-array v2, v0, [I

    fill-array-data v2, :array_54a

    const/16 v17, 0x27

    aput-object v2, v1, v17

    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    const/16 v1, 0xf

    new-array v1, v1, [[I

    new-array v2, v6, [I

    aput v10, v2, v3

    aput-object v2, v1, v3

    new-array v2, v6, [I

    fill-array-data v2, :array_55c

    aput-object v2, v1, v4

    new-array v2, v6, [I

    fill-array-data v2, :array_564

    aput-object v2, v1, v6

    new-array v2, v6, [I

    fill-array-data v2, :array_56c

    aput-object v2, v1, v7

    new-array v2, v6, [I

    fill-array-data v2, :array_574

    aput-object v2, v1, v8

    new-array v2, v6, [I

    fill-array-data v2, :array_57c

    aput-object v2, v1, v9

    new-array v2, v6, [I

    fill-array-data v2, :array_584

    aput-object v2, v1, v5

    new-array v2, v6, [I

    fill-array-data v2, :array_58c

    aput-object v2, v1, v0

    new-array v0, v6, [I

    fill-array-data v0, :array_594

    aput-object v0, v1, v10

    new-array v0, v6, [I

    fill-array-data v0, :array_59c

    aput-object v0, v1, v11

    new-array v0, v6, [I

    fill-array-data v0, :array_5a4

    aput-object v0, v1, v12

    new-array v0, v6, [I

    fill-array-data v0, :array_5ac

    aput-object v0, v1, v13

    new-array v0, v6, [I

    fill-array-data v0, :array_5b4

    aput-object v0, v1, v14

    new-array v0, v6, [I

    fill-array-data v0, :array_5bc

    aput-object v0, v1, v15

    new-array v0, v6, [I

    aput v10, v0, v4

    aput-object v0, v1, v16

    sput-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    return-void

    :array_24c
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_25e
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_270
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_27e
    .array-data 4
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_28c
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_29e
    .array-data 4
        0x6
        0x12
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_2b0
    .array-data 4
        0x6
        0x16
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_2c2
    .array-data 4
        0x6
        0x1a
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_2d4
    .array-data 4
        0x6
        0x1e
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_2e6
    .array-data 4
        0x6
        0x22
        -0x1
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_2f8
    .array-data 4
        0x6
        0x16
        0x26
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_30a
    .array-data 4
        0x6
        0x18
        0x2a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_31c
    .array-data 4
        0x6
        0x1a
        0x2e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_32e
    .array-data 4
        0x6
        0x1c
        0x32
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_340
    .array-data 4
        0x6
        0x1e
        0x36
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_352
    .array-data 4
        0x6
        0x20
        0x3a
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_364
    .array-data 4
        0x6
        0x22
        0x3e
        -0x1
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_376
    .array-data 4
        0x6
        0x1a
        0x2e
        0x42
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_388
    .array-data 4
        0x6
        0x1a
        0x30
        0x46
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_39a
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_3ac
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_3be
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_3d0
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_3e2
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        -0x1
        -0x1
        -0x1
    .end array-data

    :array_3f4
    .array-data 4
        0x6
        0x1c
        0x32
        0x48
        0x5e
        -0x1
        -0x1
    .end array-data

    :array_406
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        -0x1
        -0x1
    .end array-data

    :array_418
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        -0x1
        -0x1
    .end array-data

    :array_42a
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        -0x1
        -0x1
    .end array-data

    :array_43c
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        -0x1
        -0x1
    .end array-data

    :array_44e
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        -0x1
        -0x1
    .end array-data

    :array_460
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        -0x1
        -0x1
    .end array-data

    :array_472
    .array-data 4
        0x6
        0x1a
        0x32
        0x4a
        0x62
        0x7a
        -0x1
    .end array-data

    :array_484
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        -0x1
    .end array-data

    :array_496
    .array-data 4
        0x6
        0x1a
        0x34
        0x4e
        0x68
        0x82
        -0x1
    .end array-data

    :array_4a8
    .array-data 4
        0x6
        0x1e
        0x38
        0x52
        0x6c
        0x86
        -0x1
    .end array-data

    :array_4ba
    .array-data 4
        0x6
        0x22
        0x3c
        0x56
        0x70
        0x8a
        -0x1
    .end array-data

    :array_4cc
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        -0x1
    .end array-data

    :array_4de
    .array-data 4
        0x6
        0x22
        0x3e
        0x5a
        0x76
        0x92
        -0x1
    .end array-data

    :array_4f0
    .array-data 4
        0x6
        0x1e
        0x36
        0x4e
        0x66
        0x7e
        0x96
    .end array-data

    :array_502
    .array-data 4
        0x6
        0x18
        0x32
        0x4c
        0x66
        0x80
        0x9a
    .end array-data

    :array_514
    .array-data 4
        0x6
        0x1c
        0x36
        0x50
        0x6a
        0x84
        0x9e
    .end array-data

    :array_526
    .array-data 4
        0x6
        0x20
        0x3a
        0x54
        0x6e
        0x88
        0xa2
    .end array-data

    :array_538
    .array-data 4
        0x6
        0x1a
        0x36
        0x52
        0x6e
        0x8a
        0xa6
    .end array-data

    :array_54a
    .array-data 4
        0x6
        0x1e
        0x3a
        0x56
        0x72
        0x8e
        0xaa
    .end array-data

    :array_55c
    .array-data 4
        0x8
        0x1
    .end array-data

    :array_564
    .array-data 4
        0x8
        0x2
    .end array-data

    :array_56c
    .array-data 4
        0x8
        0x3
    .end array-data

    :array_574
    .array-data 4
        0x8
        0x4
    .end array-data

    :array_57c
    .array-data 4
        0x8
        0x5
    .end array-data

    :array_584
    .array-data 4
        0x8
        0x7
    .end array-data

    :array_58c
    .array-data 4
        0x8
        0x8
    .end array-data

    :array_594
    .array-data 4
        0x7
        0x8
    .end array-data

    :array_59c
    .array-data 4
        0x5
        0x8
    .end array-data

    :array_5a4
    .array-data 4
        0x4
        0x8
    .end array-data

    :array_5ac
    .array-data 4
        0x3
        0x8
    .end array-data

    :array_5b4
    .array-data 4
        0x2
        0x8
    .end array-data

    :array_5bc
    .array-data 4
        0x1
        0x8
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static buildMatrix(Lcom/google/zxing/common/BitArray;Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;Lcom/google/zxing/qrcode/decoder/Version;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-static {p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedBasicPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p1, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p2, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedVersionInfo(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p0, p3, p4}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    return-void
.end method

.method static calculateBCHCode(II)I
    .registers 4

    if-eqz p1, :cond_19

    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    shl-int/2addr p0, v1

    :goto_9
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    if-ge v1, v0, :cond_10

    return p0

    :cond_10
    invoke-static {p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->findMSBSet(I)I

    move-result v1

    sub-int/2addr v1, v0

    shl-int v1, p1, v1

    xor-int/2addr p0, v1

    goto :goto_9

    :cond_19
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "0 polynomial"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static clearMatrix(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 2

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->clear(B)V

    return-void
.end method

.method static embedBasicPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p0, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->maybeEmbedPositionAdjustmentPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    return-void
.end method

.method private static embedDarkDotAtLeftBottomCorner(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    const/16 v1, 0x8

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    return-void

    :cond_17
    new-instance v0, Lcom/google/zxing/WriterException;

    invoke-direct {v0}, Lcom/google/zxing/WriterException;-><init>()V

    throw v0
.end method

.method static embedDataBits(Lcom/google/zxing/common/BitArray;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    sub-int/2addr v4, v3

    :goto_d
    if-gtz v2, :cond_36

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-ne v0, v3, :cond_16

    return-void

    :cond_16
    new-instance v3, Lcom/google/zxing/WriterException;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Not all bits consumed: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v6, 0x2f

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_36
    const/4 v5, 0x6

    if-ne v2, v5, :cond_3b

    add-int/lit8 v2, v2, -0x1

    :cond_3b
    :goto_3b
    if-ltz v4, :cond_7a

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    if-lt v4, v5, :cond_44

    goto :goto_7a

    :cond_44
    const/4 v5, 0x0

    :goto_45
    const/4 v6, 0x2

    if-lt v5, v6, :cond_4a

    add-int/2addr v4, v1

    goto :goto_3b

    :cond_4a
    sub-int v6, v2, v5

    invoke-virtual {p2, v6, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-nez v7, :cond_57

    goto :goto_77

    :cond_57
    invoke-virtual {p0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v7

    const/4 v8, 0x0

    if-ge v0, v7, :cond_65

    invoke-virtual {p0, v0}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v7

    add-int/lit8 v0, v0, 0x1

    goto :goto_66

    :cond_65
    move v7, v8

    :goto_66
    const/4 v9, -0x1

    if-eq p1, v9, :cond_74

    invoke-static {p1, v6, v4}, Lcom/google/zxing/qrcode/encoder/MaskUtil;->getDataMaskBit(III)Z

    move-result v9

    if-eqz v9, :cond_74

    if-eqz v7, :cond_72

    goto :goto_73

    :cond_72
    move v8, v3

    :goto_73
    move v7, v8

    :cond_74
    invoke-virtual {p2, v6, v4, v7}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    :goto_77
    add-int/lit8 v5, v5, 0x1

    goto :goto_45

    :cond_7a
    :goto_7a
    neg-int v1, v1

    add-int/2addr v4, v1

    add-int/lit8 v2, v2, -0x2

    goto :goto_d
.end method

.method private static embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x8

    if-lt v0, v1, :cond_6

    return-void

    :cond_6
    add-int v1, p0, v0

    invoke-virtual {p2, v1, p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-eqz v1, :cond_1b

    add-int v1, p0, v0

    const/4 v2, 0x0

    invoke-virtual {p2, v1, p1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1b
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1
.end method

.method private static embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 9

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x5

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    const/4 v2, 0x0

    :goto_6
    if-lt v2, v1, :cond_b

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_b
    add-int v3, p0, v2

    add-int v4, p1, v0

    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN:[[I

    aget-object v5, v5, v0

    aget v5, v5, v2

    invoke-virtual {p2, v3, v4, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method private static embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 9

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x7

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    const/4 v2, 0x0

    :goto_6
    if-lt v2, v1, :cond_b

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_b
    add-int v3, p0, v2

    add-int v4, p1, v0

    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    aget-object v5, v5, v0

    aget v5, v5, v2

    invoke-virtual {p2, v3, v4, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_6
.end method

.method private static embedPositionDetectionPatternsAndSeparators(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    sget-object v0, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_DETECTION_PATTERN:[[I

    const/4 v1, 0x0

    aget-object v0, v0, v1

    array-length v0, v0

    invoke-static {v1, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-static {v2, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-static {v1, v2, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionDetectionPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    const/16 v2, 0x8

    add-int/lit8 v3, v2, -0x1

    invoke-static {v1, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    add-int/lit8 v4, v2, -0x1

    invoke-static {v3, v4, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-static {v1, v3, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedHorizontalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    const/4 v3, 0x7

    invoke-static {v3, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v4

    sub-int/2addr v4, v3

    add-int/lit8 v4, v4, -0x1

    invoke-static {v4, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v1

    sub-int/2addr v1, v3

    nop

    invoke-static {v3, v1, p0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    return-void
.end method

.method private static embedTimingPatterns(Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 5

    const/16 v0, 0x8

    :goto_2
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v1

    add-int/lit8 v1, v1, -0x8

    if-lt v0, v1, :cond_b

    return-void

    :cond_b
    add-int/lit8 v1, v0, 0x1

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x6

    invoke-virtual {p0, v0, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v3

    if-eqz v3, :cond_1d

    invoke-virtual {p0, v0, v2, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    :cond_1d
    invoke-virtual {p0, v2, v0}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v3

    invoke-static {v3}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-virtual {p0, v2, v0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    :cond_2a
    add-int/lit8 v0, v0, 0x1

    goto :goto_2
.end method

.method static embedTypeInfo(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    invoke-static {p0, p1, v0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V

    const/4 v1, 0x0

    :goto_9
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    if-lt v1, v2, :cond_10

    return-void

    :cond_10
    invoke-virtual {v0}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    invoke-virtual {v0, v2}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v2

    sget-object v4, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v4, v4, v1

    const/4 v5, 0x0

    aget v4, v4, v5

    sget-object v5, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->TYPE_INFO_COORDINATES:[[I

    aget-object v5, v5, v1

    aget v5, v5, v3

    invoke-virtual {p2, v4, v5, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    const/16 v6, 0x8

    if-ge v1, v6, :cond_3b

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getWidth()I

    move-result v6

    sub-int/2addr v6, v1

    sub-int/2addr v6, v3

    const/16 v3, 0x8

    invoke-virtual {p2, v6, v3, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    goto :goto_49

    :cond_3b
    const/16 v3, 0x8

    invoke-virtual {p2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v6

    add-int/lit8 v6, v6, -0x7

    add-int/lit8 v7, v1, -0x8

    add-int/2addr v6, v7

    invoke-virtual {p2, v3, v6, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    :goto_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method private static embedVerticalSeparationPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_1
    const/4 v1, 0x7

    if-lt v0, v1, :cond_5

    return-void

    :cond_5
    add-int v1, p1, v0

    invoke-virtual {p2, p0, v1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v1

    invoke-static {v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v1

    if-eqz v1, :cond_1a

    add-int v1, p1, v0

    const/4 v2, 0x0

    invoke-virtual {p2, p0, v1, v2}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(III)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1a
    new-instance v1, Lcom/google/zxing/WriterException;

    invoke-direct {v1}, Lcom/google/zxing/WriterException;-><init>()V

    throw v1
.end method

.method static findMSBSet(I)I
    .registers 2

    const/4 v0, 0x0

    :goto_1
    if-nez p0, :cond_4

    return v0

    :cond_4
    ushr-int/lit8 p0, p0, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method

.method private static isEmpty(I)Z
    .registers 2

    const/4 v0, -0x1

    if-ne p0, v0, :cond_5

    const/4 v0, 0x1

    return v0

    :cond_5
    const/4 v0, 0x0

    return v0
.end method

.method static makeTypeInfoBits(Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;ILcom/google/zxing/common/BitArray;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/zxing/qrcode/encoder/QRCode;->isValidMaskPattern(I)Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/ErrorCorrectionLevel;->getBits()I

    move-result v0

    shl-int/lit8 v0, v0, 0x3

    or-int/2addr v0, p1

    const/4 v1, 0x5

    invoke-virtual {p2, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    const/16 v1, 0x537

    invoke-static {v0, v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v1

    const/16 v2, 0xa

    invoke-virtual {p2, v1, v2}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    new-instance v2, Lcom/google/zxing/common/BitArray;

    invoke-direct {v2}, Lcom/google/zxing/common/BitArray;-><init>()V

    const/16 v3, 0x5412

    const/16 v4, 0xf

    invoke-virtual {v2, v3, v4}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    invoke-virtual {p2, v2}, Lcom/google/zxing/common/BitArray;->xor(Lcom/google/zxing/common/BitArray;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    if-ne v3, v4, :cond_32

    return-void

    :cond_32
    new-instance v3, Lcom/google/zxing/WriterException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "should not happen but we got: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_4a
    new-instance v0, Lcom/google/zxing/WriterException;

    const-string v1, "Invalid mask pattern"

    invoke-direct {v0, v1}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static makeVersionInfoBits(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/common/BitArray;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x6

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/16 v1, 0x1f25

    invoke-static {v0, v1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->calculateBCHCode(II)I

    move-result v0

    const/16 v1, 0xc

    invoke-virtual {p1, v0, v1}, Lcom/google/zxing/common/BitArray;->appendBits(II)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v1

    const/16 v2, 0x12

    if-ne v1, v2, :cond_20

    return-void

    :cond_20
    new-instance v1, Lcom/google/zxing/WriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "should not happen but we got: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/zxing/common/BitArray;->getSize()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/zxing/WriterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static maybeEmbedPositionAdjustmentPatterns(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 11

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sget-object v1, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v1, v1, v0

    sget-object v2, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->POSITION_ADJUSTMENT_PATTERN_COORDINATE_TABLE:[[I

    aget-object v2, v2, v0

    array-length v2, v2

    const/4 v3, 0x0

    :goto_18
    if-lt v3, v2, :cond_1b

    return-void

    :cond_1b
    const/4 v4, 0x0

    :goto_1c
    if-lt v4, v2, :cond_21

    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :cond_21
    aget v5, v1, v3

    aget v6, v1, v4

    const/4 v7, -0x1

    if-eq v6, v7, :cond_3c

    if-ne v5, v7, :cond_2b

    goto :goto_3c

    :cond_2b
    invoke-virtual {p1, v6, v5}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->get(II)B

    move-result v7

    invoke-static {v7}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->isEmpty(I)Z

    move-result v7

    if-eqz v7, :cond_3c

    add-int/lit8 v7, v6, -0x2

    add-int/lit8 v8, v5, -0x2

    invoke-static {v7, v8, p1}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->embedPositionAdjustmentPattern(IILcom/google/zxing/qrcode/encoder/ByteMatrix;)V

    :cond_3c
    :goto_3c
    add-int/lit8 v4, v4, 0x1

    goto :goto_1c
.end method

.method static maybeEmbedVersionInfo(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/qrcode/encoder/ByteMatrix;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/zxing/qrcode/decoder/Version;->getVersionNumber()I

    move-result v0

    const/4 v1, 0x7

    if-ge v0, v1, :cond_8

    return-void

    :cond_8
    new-instance v0, Lcom/google/zxing/common/BitArray;

    invoke-direct {v0}, Lcom/google/zxing/common/BitArray;-><init>()V

    invoke-static {p0, v0}, Lcom/google/zxing/qrcode/encoder/MatrixUtil;->makeVersionInfoBits(Lcom/google/zxing/qrcode/decoder/Version;Lcom/google/zxing/common/BitArray;)V

    const/16 v1, 0x11

    const/4 v2, 0x0

    :goto_13
    const/4 v3, 0x6

    if-lt v2, v3, :cond_17

    return-void

    :cond_17
    const/4 v3, 0x0

    :goto_18
    const/4 v4, 0x3

    if-lt v3, v4, :cond_1e

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_1e
    invoke-virtual {v0, v1}, Lcom/google/zxing/common/BitArray;->get(I)Z

    move-result v4

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v2, v5, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    invoke-virtual {p1}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->getHeight()I

    move-result v5

    add-int/lit8 v5, v5, -0xb

    add-int/2addr v5, v3

    invoke-virtual {p1, v5, v2, v4}, Lcom/google/zxing/qrcode/encoder/ByteMatrix;->set(IIZ)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_18
.end method
