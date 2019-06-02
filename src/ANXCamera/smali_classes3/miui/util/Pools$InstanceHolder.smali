.class Lmiui/util/Pools$InstanceHolder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/Pools$IInstanceHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lmiui/util/Pools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/Pools$IInstanceHolder<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final JR:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final JS:Lmiui/util/concurrent/ConcurrentRingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/concurrent/ConcurrentRingQueue<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Class;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "TT;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmiui/util/Pools$InstanceHolder;->JR:Ljava/lang/Class;

    new-instance p1, Lmiui/util/concurrent/ConcurrentRingQueue;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p1, p2, v0, v1}, Lmiui/util/concurrent/ConcurrentRingQueue;-><init>(IZZ)V

    iput-object p1, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    return-void
.end method


# virtual methods
.method public dC()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JR:Ljava/lang/Class;

    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    invoke-virtual {v0}, Lmiui/util/concurrent/ConcurrentRingQueue;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .registers 2

    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    invoke-virtual {v0}, Lmiui/util/concurrent/ConcurrentRingQueue;->getCapacity()I

    move-result v0

    return v0
.end method

.method public put(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    invoke-virtual {v0, p1}, Lmiui/util/concurrent/ConcurrentRingQueue;->put(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public declared-synchronized resize(I)V
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    invoke-virtual {v0}, Lmiui/util/concurrent/ConcurrentRingQueue;->getCapacity()I

    move-result v0

    add-int/2addr p1, v0

    if-gtz p1, :cond_20

    invoke-static {}, Lmiui/util/Pools;->dA()Ljava/util/HashMap;

    move-result-object p1

    monitor-enter p1
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_30

    :try_start_f
    invoke-static {}, Lmiui/util/Pools;->dA()Ljava/util/HashMap;

    move-result-object v0

    invoke-virtual {p0}, Lmiui/util/Pools$InstanceHolder;->dC()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit p1
    :try_end_1b
    .catchall {:try_start_f .. :try_end_1b} :catchall_1d

    monitor-exit p0

    return-void

    :catchall_1d
    move-exception v0

    :try_start_1e
    monitor-exit p1
    :try_end_1f
    .catchall {:try_start_1e .. :try_end_1f} :catchall_1d

    :try_start_1f
    throw v0

    :cond_20
    if-lez p1, :cond_28

    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    invoke-virtual {v0, p1}, Lmiui/util/concurrent/ConcurrentRingQueue;->increaseCapacity(I)V

    goto :goto_2e

    :cond_28
    iget-object v0, p0, Lmiui/util/Pools$InstanceHolder;->JS:Lmiui/util/concurrent/ConcurrentRingQueue;

    neg-int p1, p1

    invoke-virtual {v0, p1}, Lmiui/util/concurrent/ConcurrentRingQueue;->decreaseCapacity(I)V
    :try_end_2e
    .catchall {:try_start_1f .. :try_end_2e} :catchall_30

    :goto_2e
    monitor-exit p0

    return-void

    :catchall_30
    move-exception p1

    monitor-exit p0

    throw p1
.end method
