.class Landroid/support/v4/util/ContainerHelpers;
.super Ljava/lang/Object;
.source "ContainerHelpers.java"


# static fields
.field static final EMPTY_INTS:[I

.field static final EMPTY_LONGS:[J

.field static final EMPTY_OBJECTS:[Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x0

    new-array v1, v0, [I

    sput-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    new-array v1, v0, [J

    sput-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_LONGS:[J

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static binarySearch([III)I
    .registers 7

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x1

    :goto_3
    if-gt v0, v1, :cond_16

    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    aget v3, p0, v2

    if-ge v3, p2, :cond_10

    add-int/lit8 v0, v2, 0x1

    goto :goto_14

    :cond_10
    if-le v3, p2, :cond_15

    add-int/lit8 v1, v2, -0x1

    :goto_14
    goto :goto_3

    :cond_15
    return v2

    :cond_16
    not-int v2, v0

    return v2
.end method

.method static binarySearch([JIJ)I
    .registers 10

    const/4 v0, 0x0

    add-int/lit8 v1, p1, -0x1

    :goto_3
    if-gt v0, v1, :cond_1a

    add-int v2, v0, v1

    ushr-int/lit8 v2, v2, 0x1

    aget-wide v3, p0, v2

    cmp-long v5, v3, p2

    if-gez v5, :cond_12

    add-int/lit8 v0, v2, 0x1

    goto :goto_18

    :cond_12
    cmp-long v5, v3, p2

    if-lez v5, :cond_19

    add-int/lit8 v1, v2, -0x1

    :goto_18
    goto :goto_3

    :cond_19
    return v2

    :cond_1a
    not-int v2, v0

    return v2
.end method

.method public static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    if-eq p0, p1, :cond_d

    if-eqz p0, :cond_b

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method

.method public static idealByteArraySize(I)I
    .registers 4

    const/4 v0, 0x4

    :goto_1
    const/16 v1, 0x20

    if-ge v0, v1, :cond_13

    const/4 v1, 0x1

    shl-int v2, v1, v0

    add-int/lit8 v2, v2, -0xc

    if-gt p0, v2, :cond_10

    shl-int/2addr v1, v0

    add-int/lit8 v1, v1, -0xc

    return v1

    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_13
    return p0
.end method

.method public static idealIntArraySize(I)I
    .registers 2

    mul-int/lit8 v0, p0, 0x4

    invoke-static {v0}, Landroid/support/v4/util/ContainerHelpers;->idealByteArraySize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x4

    return v0
.end method

.method public static idealLongArraySize(I)I
    .registers 2

    mul-int/lit8 v0, p0, 0x8

    invoke-static {v0}, Landroid/support/v4/util/ContainerHelpers;->idealByteArraySize(I)I

    move-result v0

    div-int/lit8 v0, v0, 0x8

    return v0
.end method
