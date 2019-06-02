.class public Landroid/support/v4/util/LruCache;
.super Ljava/lang/Object;
.source "LruCache.java"


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


# instance fields
.field private createCount:I

.field private evictionCount:I

.field private hitCount:I

.field private final map:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private maxSize:I

.field private missCount:I

.field private putCount:I

.field private size:I


# direct methods
.method public constructor <init>(I)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-lez p1, :cond_13

    iput p1, p0, Landroid/support/v4/util/LruCache;->maxSize:I

    new-instance v0, Ljava/util/LinkedHashMap;

    const/4 v1, 0x0

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    iput-object v0, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    return-void

    :cond_13
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/util/LruCache;->sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_7

    return v0

    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Negative size: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method protected create(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public final declared-synchronized createCount()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->createCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZTK;TV;TV;)V"
        }
    .end annotation

    return-void
.end method

.method public final evictAll()V
    .registers 2

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/util/LruCache;->trimToSize(I)V

    return-void
.end method

.method public final declared-synchronized evictionCount()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->evictionCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    if-eqz p1, :cond_5a

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_4
    iget-object v1, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_52

    if-eqz v1, :cond_14

    :try_start_c
    iget v0, p0, Landroid/support/v4/util/LruCache;->hitCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v4/util/LruCache;->hitCount:I

    monitor-exit p0

    return-object v1

    :cond_14
    iget v2, p0, Landroid/support/v4/util/LruCache;->missCount:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Landroid/support/v4/util/LruCache;->missCount:I

    monitor-exit p0
    :try_end_1b
    .catchall {:try_start_c .. :try_end_1b} :catchall_58

    invoke-virtual {p0, p1}, Landroid/support/v4/util/LruCache;->create(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_22

    return-object v0

    :cond_22
    monitor-enter p0

    :try_start_23
    iget v0, p0, Landroid/support/v4/util/LruCache;->createCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/support/v4/util/LruCache;->createCount:I

    iget-object v0, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    if-eqz v1, :cond_38

    iget-object v0, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v0, p1, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_41

    :cond_38
    iget v0, p0, Landroid/support/v4/util/LruCache;->size:I

    invoke-direct {p0, p1, v2}, Landroid/support/v4/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    add-int/2addr v0, v3

    iput v0, p0, Landroid/support/v4/util/LruCache;->size:I

    :goto_41
    monitor-exit p0
    :try_end_42
    .catchall {:try_start_23 .. :try_end_42} :catchall_4f

    if-eqz v1, :cond_49

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Landroid/support/v4/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :cond_49
    iget v0, p0, Landroid/support/v4/util/LruCache;->maxSize:I

    invoke-virtual {p0, v0}, Landroid/support/v4/util/LruCache;->trimToSize(I)V

    return-object v2

    :catchall_4f
    move-exception v0

    :try_start_50
    monitor-exit p0
    :try_end_51
    .catchall {:try_start_50 .. :try_end_51} :catchall_4f

    throw v0

    :catchall_52
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_56
    :try_start_56
    monitor-exit p0
    :try_end_57
    .catchall {:try_start_56 .. :try_end_57} :catchall_58

    throw v0

    :catchall_58
    move-exception v0

    goto :goto_56

    :cond_5a
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final declared-synchronized hitCount()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->hitCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized maxSize()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->maxSize:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized missCount()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->missCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    if-eqz p1, :cond_37

    if-eqz p2, :cond_37

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_6
    iget v1, p0, Landroid/support/v4/util/LruCache;->putCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Landroid/support/v4/util/LruCache;->putCount:I

    iget v1, p0, Landroid/support/v4/util/LruCache;->size:I

    invoke-direct {p0, p1, p2}, Landroid/support/v4/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/LruCache;->size:I

    iget-object v1, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    if-eqz v0, :cond_27

    iget v1, p0, Landroid/support/v4/util/LruCache;->size:I

    invoke-direct {p0, p1, v0}, Landroid/support/v4/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, p0, Landroid/support/v4/util/LruCache;->size:I

    :cond_27
    monitor-exit p0
    :try_end_28
    .catchall {:try_start_6 .. :try_end_28} :catchall_34

    if-eqz v0, :cond_2e

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v0, p2}, Landroid/support/v4/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2e
    iget v1, p0, Landroid/support/v4/util/LruCache;->maxSize:I

    invoke-virtual {p0, v1}, Landroid/support/v4/util/LruCache;->trimToSize(I)V

    return-object v0

    :catchall_34
    move-exception v1

    :try_start_35
    monitor-exit p0
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_34

    throw v1

    :cond_37
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key == null || value == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final declared-synchronized putCount()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->putCount:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    if-eqz p1, :cond_25

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_4
    iget-object v1, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_a
    .catchall {:try_start_4 .. :try_end_a} :catchall_1d

    if-eqz v1, :cond_15

    :try_start_c
    iget v2, p0, Landroid/support/v4/util/LruCache;->size:I

    invoke-direct {p0, p1, v1}, Landroid/support/v4/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, p0, Landroid/support/v4/util/LruCache;->size:I

    :cond_15
    monitor-exit p0
    :try_end_16
    .catchall {:try_start_c .. :try_end_16} :catchall_23

    if-eqz v1, :cond_1c

    const/4 v2, 0x0

    invoke-virtual {p0, v2, p1, v1, v0}, Landroid/support/v4/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1c
    return-object v1

    :catchall_1d
    move-exception v1

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_21
    :try_start_21
    monitor-exit p0
    :try_end_22
    .catchall {:try_start_21 .. :try_end_22} :catchall_23

    throw v0

    :catchall_23
    move-exception v0

    goto :goto_21

    :cond_25
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key == null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resize(I)V
    .registers 4

    if-lez p1, :cond_d

    monitor-enter p0

    :try_start_3
    iput p1, p0, Landroid/support/v4/util/LruCache;->maxSize:I

    monitor-exit p0
    :try_end_6
    .catchall {:try_start_3 .. :try_end_6} :catchall_a

    invoke-virtual {p0, p1}, Landroid/support/v4/util/LruCache;->trimToSize(I)V

    return-void

    :catchall_a
    move-exception v0

    :try_start_b
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_b .. :try_end_c} :catchall_a

    throw v0

    :cond_d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxSize <= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final declared-synchronized size()I
    .registers 2

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->size:I
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)I"
        }
    .end annotation

    const/4 v0, 0x1

    return v0
.end method

.method public final declared-synchronized snapshot()Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    monitor-enter p0

    :try_start_1
    new-instance v0, Ljava/util/LinkedHashMap;

    iget-object v1, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_a

    monitor-exit p0

    return-object v0

    :catchall_a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized toString()Ljava/lang/String;
    .registers 7

    monitor-enter p0

    :try_start_1
    iget v0, p0, Landroid/support/v4/util/LruCache;->hitCount:I

    iget v1, p0, Landroid/support/v4/util/LruCache;->missCount:I

    add-int/2addr v0, v1

    const/4 v1, 0x0

    if-eqz v0, :cond_10

    const/16 v2, 0x64

    iget v3, p0, Landroid/support/v4/util/LruCache;->hitCount:I

    mul-int/2addr v2, v3

    div-int/2addr v2, v0

    goto :goto_11

    :cond_10
    move v2, v1

    :goto_11
    const-string v3, "LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    iget v5, p0, Landroid/support/v4/util/LruCache;->maxSize:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x1

    iget v5, p0, Landroid/support/v4/util/LruCache;->hitCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x2

    iget v5, p0, Landroid/support/v4/util/LruCache;->missCount:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    const/4 v1, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1
    :try_end_3b
    .catchall {:try_start_1 .. :try_end_3b} :catchall_3d

    monitor-exit p0

    return-object v1

    :catchall_3d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public trimToSize(I)V
    .registers 8

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v1

    :goto_3
    monitor-enter p0

    :try_start_4
    iget v3, p0, Landroid/support/v4/util/LruCache;->size:I

    if-ltz v3, :cond_56

    iget-object v3, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_14

    iget v3, p0, Landroid/support/v4/util/LruCache;->size:I

    if-nez v3, :cond_56

    :cond_14
    iget v3, p0, Landroid/support/v4/util/LruCache;->size:I

    if-le v3, p1, :cond_54

    iget-object v3, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_21

    goto :goto_54

    :cond_21
    iget-object v3, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    move-object v1, v4

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object v2, v4

    iget-object v4, p0, Landroid/support/v4/util/LruCache;->map:Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v1}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget v4, p0, Landroid/support/v4/util/LruCache;->size:I

    invoke-direct {p0, v1, v2}, Landroid/support/v4/util/LruCache;->safeSizeOf(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, p0, Landroid/support/v4/util/LruCache;->size:I

    iget v4, p0, Landroid/support/v4/util/LruCache;->evictionCount:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    iput v4, p0, Landroid/support/v4/util/LruCache;->evictionCount:I

    monitor-exit p0
    :try_end_50
    .catchall {:try_start_4 .. :try_end_50} :catchall_75

    invoke-virtual {p0, v5, v1, v2, v0}, Landroid/support/v4/util/LruCache;->entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_3

    :cond_54
    :goto_54
    :try_start_54
    monitor-exit p0

    return-void

    :cond_56
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".sizeOf() is reporting inconsistent results!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_75
    move-exception v0

    monitor-exit p0
    :try_end_77
    .catchall {:try_start_54 .. :try_end_77} :catchall_75

    throw v0
.end method
