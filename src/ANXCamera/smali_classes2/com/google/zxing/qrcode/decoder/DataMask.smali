.class abstract Lcom/google/zxing/qrcode/decoder/DataMask;
.super Ljava/lang/Object;
.source "DataMask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask010;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask100;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask110;,
        Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;
    }
.end annotation


# static fields
.field private static final DATA_MASKS:[Lcom/google/zxing/qrcode/decoder/DataMask;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/google/zxing/qrcode/decoder/DataMask;

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask000;)V

    const/4 v3, 0x0

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask001;)V

    const/4 v3, 0x1

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask010;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask010;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask010;)V

    const/4 v3, 0x2

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask011;)V

    const/4 v3, 0x3

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask100;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask100;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask100;)V

    const/4 v3, 0x4

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask101;)V

    const/4 v3, 0x5

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask110;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask110;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask110;)V

    const/4 v3, 0x6

    aput-object v1, v0, v3

    new-instance v1, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;

    invoke-direct {v1, v2}, Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;-><init>(Lcom/google/zxing/qrcode/decoder/DataMask$DataMask111;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lcom/google/zxing/qrcode/decoder/DataMask;->DATA_MASKS:[Lcom/google/zxing/qrcode/decoder/DataMask;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/zxing/qrcode/decoder/DataMask;)V
    .registers 2

    invoke-direct {p0}, Lcom/google/zxing/qrcode/decoder/DataMask;-><init>()V

    return-void
.end method

.method static forReference(I)Lcom/google/zxing/qrcode/decoder/DataMask;
    .registers 2

    if-ltz p0, :cond_a

    const/4 v0, 0x7

    if-gt p0, v0, :cond_a

    sget-object v0, Lcom/google/zxing/qrcode/decoder/DataMask;->DATA_MASKS:[Lcom/google/zxing/qrcode/decoder/DataMask;

    aget-object v0, v0, p0

    return-object v0

    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
.end method


# virtual methods
.method abstract isMasked(II)Z
.end method

.method final unmaskBitMatrix(Lcom/google/zxing/common/BitMatrix;I)V
    .registers 6

    const/4 v0, 0x0

    :goto_1
    if-lt v0, p2, :cond_4

    return-void

    :cond_4
    const/4 v1, 0x0

    :goto_5
    if-lt v1, p2, :cond_a

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_a
    invoke-virtual {p0, v0, v1}, Lcom/google/zxing/qrcode/decoder/DataMask;->isMasked(II)Z

    move-result v2

    if-eqz v2, :cond_13

    invoke-virtual {p1, v1, v0}, Lcom/google/zxing/common/BitMatrix;->flip(II)V

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_5
.end method
