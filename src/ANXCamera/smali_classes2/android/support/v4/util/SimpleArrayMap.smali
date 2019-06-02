.class public Landroid/support/v4/util/SimpleArrayMap;
.super Ljava/lang/Object;
.source "SimpleArrayMap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final BASE_SIZE:I = 0x4

.field private static final CACHE_SIZE:I = 0xa

.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "ArrayMap"

.field static mBaseCache:[Ljava/lang/Object;

.field static mBaseCacheSize:I

.field static mTwiceBaseCache:[Ljava/lang/Object;

.field static mTwiceBaseCacheSize:I


# instance fields
.field mArray:[Ljava/lang/Object;

.field mHashes:[I

.field mSize:I


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    return-void
.end method

.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_e

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    goto :goto_11

    :cond_e
    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    :goto_11
    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    return-void
.end method

.method public constructor <init>(Landroid/support/v4/util/SimpleArrayMap;)V
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/util/SimpleArrayMap;-><init>()V

    if-eqz p1, :cond_8

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->putAll(Landroid/support/v4/util/SimpleArrayMap;)V

    :cond_8
    return-void
.end method

.method private allocArrays(I)V
    .registers 8

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x8

    if-ne p1, v3, :cond_32

    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    :try_start_a
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_2d

    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aput-object v0, v4, v2

    aput-object v0, v4, v1

    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    monitor-exit v3

    return-void

    :cond_2d
    monitor-exit v3

    goto :goto_60

    :catchall_2f
    move-exception v0

    monitor-exit v3
    :try_end_31
    .catchall {:try_start_a .. :try_end_31} :catchall_2f

    throw v0

    :cond_32
    const/4 v3, 0x4

    if-ne p1, v3, :cond_60

    const-class v3, Landroid/support/v4/util/ArrayMap;

    monitor-enter v3

    :try_start_38
    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    if-eqz v4, :cond_5b

    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    iput-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v5, v4, v1

    check-cast v5, [Ljava/lang/Object;

    check-cast v5, [Ljava/lang/Object;

    sput-object v5, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    aget-object v5, v4, v2

    check-cast v5, [I

    check-cast v5, [I

    iput-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aput-object v0, v4, v2

    aput-object v0, v4, v1

    sget v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    sub-int/2addr v0, v2

    sput v0, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    monitor-exit v3

    return-void

    :cond_5b
    monitor-exit v3

    goto :goto_60

    :catchall_5d
    move-exception v0

    monitor-exit v3
    :try_end_5f
    .catchall {:try_start_38 .. :try_end_5f} :catchall_5d

    throw v0

    :cond_60
    :goto_60
    new-array v0, p1, [I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    shl-int/lit8 v0, p1, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    return-void
.end method

.method private static freeArrays([I[Ljava/lang/Object;I)V
    .registers 10

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/16 v4, 0xa

    const/4 v5, 0x1

    const/16 v6, 0x8

    if-ne v0, v6, :cond_2e

    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    :try_start_e
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    if-ge v6, v4, :cond_29

    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    aput-object p0, p1, v5

    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    :goto_1b
    if-lt v3, v2, :cond_22

    aput-object v1, p1, v3

    add-int/lit8 v3, v3, -0x1

    goto :goto_1b

    :cond_22
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCache:[Ljava/lang/Object;

    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mTwiceBaseCacheSize:I

    :cond_29
    monitor-exit v0

    goto :goto_55

    :catchall_2b
    move-exception v1

    monitor-exit v0
    :try_end_2d
    .catchall {:try_start_e .. :try_end_2d} :catchall_2b

    throw v1

    :cond_2e
    array-length v0, p0

    const/4 v6, 0x4

    if-ne v0, v6, :cond_55

    const-class v0, Landroid/support/v4/util/ArrayMap;

    monitor-enter v0

    :try_start_35
    sget v6, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    if-ge v6, v4, :cond_50

    sget-object v4, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    aput-object v4, p1, v3

    aput-object p0, p1, v5

    shl-int/lit8 v3, p2, 0x1

    sub-int/2addr v3, v5

    :goto_42
    if-lt v3, v2, :cond_49

    aput-object v1, p1, v3

    add-int/lit8 v3, v3, -0x1

    goto :goto_42

    :cond_49
    sput-object p1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCache:[Ljava/lang/Object;

    sget v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    add-int/2addr v1, v5

    sput v1, Landroid/support/v4/util/SimpleArrayMap;->mBaseCacheSize:I

    :cond_50
    monitor-exit v0

    goto :goto_55

    :catchall_52
    move-exception v1

    monitor-exit v0
    :try_end_54
    .catchall {:try_start_35 .. :try_end_54} :catchall_52

    throw v1

    :cond_55
    :goto_55
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 4

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-eqz v0, :cond_18

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    sget-object v0, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    :cond_18
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 3

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 3

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfValue(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public ensureCapacity(I)V
    .registers 7

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v0, v0

    if-ge v0, p1, :cond_26

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    invoke-direct {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lez v2, :cond_21

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v4, 0x0

    invoke-static {v0, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/lit8 v3, v3, 0x1

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_21
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v0, v1, v2}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    :cond_26
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 10

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Ljava/util/Map;

    const/4 v2, 0x0

    if-eqz v1, :cond_43

    move-object v1, p1

    check-cast v1, Ljava/util/Map;

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->size()I

    move-result v3

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    if-eq v3, v4, :cond_17

    return v2

    :cond_17
    move v3, v2

    :goto_18
    :try_start_18
    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v3, v4, :cond_3d

    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v3}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-nez v5, :cond_33

    if-nez v6, :cond_32

    invoke-interface {v1, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3a

    :cond_32
    return v2

    :cond_33
    invoke-virtual {v5, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7
    :try_end_37
    .catch Ljava/lang/NullPointerException; {:try_start_18 .. :try_end_37} :catch_41
    .catch Ljava/lang/ClassCastException; {:try_start_18 .. :try_end_37} :catch_3f

    if-nez v7, :cond_3a

    return v2

    :cond_3a
    add-int/lit8 v3, v3, 0x1

    goto :goto_18

    :cond_3d
    nop

    return v0

    :catch_3f
    move-exception v0

    return v2

    :catch_41
    move-exception v0

    return v2

    :cond_43
    return v2
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_f

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v2, v0, 0x1

    add-int/lit8 v2, v2, 0x1

    aget-object v1, v1, v2

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    return-object v1
.end method

.method public hashCode()I
    .registers 10

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    :goto_9
    if-ge v3, v5, :cond_1e

    aget-object v6, v1, v4

    aget v7, v0, v3

    if-nez v6, :cond_13

    const/4 v8, 0x0

    goto :goto_17

    :cond_13
    invoke-virtual {v6}, Ljava/lang/Object;->hashCode()I

    move-result v8

    :goto_17
    xor-int/2addr v7, v8

    add-int/2addr v2, v7

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v4, v4, 0x2

    goto :goto_9

    :cond_1e
    return v2
.end method

.method indexOf(Ljava/lang/Object;I)I
    .registers 9

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-nez v0, :cond_6

    const/4 v1, -0x1

    return v1

    :cond_6
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v1, v0, p2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    if-gez v1, :cond_f

    return v1

    :cond_f
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c

    return v1

    :cond_1c
    add-int/lit8 v2, v1, 0x1

    :goto_1e
    if-ge v2, v0, :cond_36

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-ne v3, p2, :cond_36

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_33

    return v2

    :cond_33
    add-int/lit8 v2, v2, 0x1

    goto :goto_1e

    :cond_36
    add-int/lit8 v3, v1, -0x1

    :goto_38
    if-ltz v3, :cond_50

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-ne v4, p2, :cond_50

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4d

    return v3

    :cond_4d
    add-int/lit8 v3, v3, -0x1

    goto :goto_38

    :cond_50
    not-int v3, v2

    return v3
.end method

.method public indexOfKey(Ljava/lang/Object;)I
    .registers 3

    if-nez p1, :cond_7

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v0

    goto :goto_f

    :cond_7
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v0

    :goto_f
    return v0
.end method

.method indexOfNull()I
    .registers 7

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-nez v0, :cond_6

    const/4 v1, -0x1

    return v1

    :cond_6
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/support/v4/util/ContainerHelpers;->binarySearch([III)I

    move-result v1

    if-gez v1, :cond_10

    return v1

    :cond_10
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aget-object v2, v2, v3

    if-nez v2, :cond_19

    return v1

    :cond_19
    add-int/lit8 v2, v1, 0x1

    :goto_1b
    if-ge v2, v0, :cond_2f

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v3, v3, v2

    if-nez v3, :cond_2f

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v2, 0x1

    aget-object v3, v3, v4

    if-nez v3, :cond_2c

    return v2

    :cond_2c
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    :cond_2f
    add-int/lit8 v3, v1, -0x1

    :goto_31
    if-ltz v3, :cond_45

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aget v4, v4, v3

    if-nez v4, :cond_45

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, v3, 0x1

    aget-object v4, v4, v5

    if-nez v4, :cond_42

    return v3

    :cond_42
    add-int/lit8 v3, v3, -0x1

    goto :goto_31

    :cond_45
    not-int v3, v2

    return v3
.end method

.method indexOfValue(Ljava/lang/Object;)I
    .registers 6

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v0, v0, 0x2

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    const/4 v2, 0x1

    if-nez p1, :cond_16

    nop

    :goto_a
    if-ge v2, v0, :cond_27

    aget-object v3, v1, v2

    if-nez v3, :cond_13

    shr-int/lit8 v3, v2, 0x1

    return v3

    :cond_13
    add-int/lit8 v2, v2, 0x2

    goto :goto_a

    :cond_16
    nop

    :goto_17
    if-ge v2, v0, :cond_27

    aget-object v3, v1, v2

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_24

    shr-int/lit8 v3, v2, 0x1

    return v3

    :cond_24
    add-int/lit8 v2, v2, 0x2

    goto :goto_17

    :cond_27
    const/4 v2, -0x1

    return v2
.end method

.method public isEmpty()Z
    .registers 2

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-gtz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public keyAt(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    if-nez p1, :cond_8

    const/4 v0, 0x0

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->indexOfNull()I

    move-result v1

    goto :goto_10

    :cond_8
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/util/SimpleArrayMap;->indexOf(Ljava/lang/Object;I)I

    move-result v1

    :goto_10
    if-ltz v1, :cond_1f

    shl-int/lit8 v2, v1, 0x1

    add-int/lit8 v2, v2, 0x1

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object v1, v1, v2

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aput-object p2, v3, v2

    return-object v1

    :cond_1f
    not-int v1, v1

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v3, v3

    if-lt v2, v3, :cond_5b

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v3, 0x4

    const/16 v4, 0x8

    if-lt v2, v4, :cond_36

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shr-int/lit8 v3, v3, 0x1

    add-int/2addr v3, v2

    goto :goto_3c

    :cond_36
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lt v2, v3, :cond_3c

    move v3, v4

    nop

    :cond_3c
    :goto_3c
    move v2, v3

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    invoke-direct {p0, v2}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v5, v5

    if-lez v5, :cond_56

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v6, v3

    const/4 v7, 0x0

    invoke-static {v3, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v7, v5, v7, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_56
    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v3, v4, v5}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    :cond_5b
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_7d

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v4, v1, 0x1

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, v1

    invoke-static {v2, v1, v3, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    add-int/lit8 v5, v1, 0x1

    shl-int/lit8 v5, v5, 0x1

    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, v1

    shl-int/lit8 v6, v6, 0x1

    invoke-static {v2, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_7d
    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    aput v0, v2, v1

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    aput-object p1, v2, v3

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v3, v1, 0x1

    add-int/lit8 v3, v3, 0x1

    aput-object p2, v2, v3

    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v2, 0x0

    return-object v2
.end method

.method public putAll(Landroid/support/v4/util/SimpleArrayMap;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/SimpleArrayMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    iget v0, p1, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->ensureCapacity(I)V

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v2, 0x0

    if-nez v1, :cond_22

    if-lez v0, :cond_34

    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v1, v2, v3, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p1, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v4, v0, 0x1

    invoke-static {v1, v2, v3, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto :goto_34

    :cond_22
    nop

    :goto_23
    move v1, v2

    if-ge v1, v0, :cond_34

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Landroid/support/v4/util/SimpleArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v1, 0x1

    goto :goto_23

    :cond_34
    :goto_34
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Landroid/support/v4/util/SimpleArrayMap;->indexOfKey(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_b

    invoke-virtual {p0, v0}, Landroid/support/v4/util/SimpleArrayMap;->removeAt(I)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    :cond_b
    const/4 v1, 0x0

    return-object v1
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    const/4 v3, 0x0

    if-gt v1, v2, :cond_22

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    invoke-static {v1, v2, v4}, Landroid/support/v4/util/SimpleArrayMap;->freeArrays([I[Ljava/lang/Object;I)V

    sget-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_INTS:[I

    iput-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    sget-object v1, Landroid/support/v4/util/ContainerHelpers;->EMPTY_OBJECTS:[Ljava/lang/Object;

    iput-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iput v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    goto/16 :goto_ab

    :cond_22
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v1, v1

    const/16 v4, 0x8

    if-le v1, v4, :cond_76

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    array-length v5, v5

    div-int/lit8 v5, v5, 0x3

    if-ge v1, v5, :cond_76

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-le v1, v4, :cond_3d

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shr-int/2addr v4, v2

    add-int/2addr v4, v1

    nop

    :cond_3d
    move v1, v4

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget-object v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    invoke-direct {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->allocArrays(I)V

    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, v2

    iput v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-lez p1, :cond_58

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    invoke-static {v4, v3, v6, v3, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    invoke-static {v5, v3, v6, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_58
    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v3, :cond_75

    add-int/lit8 v3, p1, 0x1

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v7, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v7, p1

    invoke-static {v4, v3, v6, p1, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v3, p1, 0x1

    shl-int/2addr v3, v2

    iget-object v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v7, p1, 0x1

    iget v8, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v8, p1

    shl-int/lit8 v2, v8, 0x1

    invoke-static {v5, v3, v6, v7, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_75
    goto :goto_ab

    :cond_76
    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge p1, v1, :cond_9b

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    add-int/lit8 v3, p1, 0x1

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mHashes:[I

    iget v5, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v5, p1

    invoke-static {v1, v3, v4, p1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    add-int/lit8 v3, p1, 0x1

    shl-int/2addr v3, v2

    iget-object v4, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v5, p1, 0x1

    iget v6, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    sub-int/2addr v6, p1

    shl-int/2addr v6, v2

    invoke-static {v1, v3, v4, v5, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_9b
    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/2addr v3, v2

    const/4 v4, 0x0

    aput-object v4, v1, v3

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    iget v3, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    shl-int/2addr v3, v2

    add-int/2addr v3, v2

    aput-object v4, v1, v3

    :goto_ab
    return-object v0
.end method

.method public setValueAt(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    shl-int/lit8 v0, p1, 0x1

    add-int/lit8 v0, v0, 0x1

    iget-object p1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aget-object p1, p1, v0

    iget-object v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    aput-object p2, v1, v0

    return-object p1
.end method

.method public size()I
    .registers 2

    iget v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 6

    invoke-virtual {p0}, Landroid/support/v4/util/SimpleArrayMap;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "{}"

    return-object v0

    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    iget v1, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    mul-int/lit8 v1, v1, 0x1c

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_18
    iget v2, p0, Landroid/support/v4/util/SimpleArrayMap;->mSize:I

    if-ge v1, v2, :cond_49

    if-lez v1, :cond_23

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_23
    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    if-eq v2, p0, :cond_2d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_32

    :cond_2d
    const-string v3, "(this Map)"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_32
    const/16 v3, 0x3d

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Landroid/support/v4/util/SimpleArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    if-eq v3, p0, :cond_41

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_46

    :cond_41
    const-string v4, "(this Map)"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_18

    :cond_49
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public valueAt(I)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/util/SimpleArrayMap;->mArray:[Ljava/lang/Object;

    shl-int/lit8 v1, p1, 0x1

    add-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method
