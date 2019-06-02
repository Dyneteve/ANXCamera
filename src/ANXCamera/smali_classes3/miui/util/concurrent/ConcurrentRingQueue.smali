.class public Lmiui/util/concurrent/ConcurrentRingQueue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmiui/util/concurrent/Queue;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lmiui/util/concurrent/Queue<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private Mk:I

.field private final Ml:Z

.field private final Mm:Z

.field private final Mn:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/concurrent/ConcurrentRingQueue$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final Mp:Ljava/util/concurrent/atomic/AtomicInteger;

.field private volatile Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/concurrent/ConcurrentRingQueue$Node<",
            "TT;>;"
        }
    .end annotation
.end field

.field private volatile Mr:I


# direct methods
.method public constructor <init>(IZZ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    iput-boolean p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ml:Z

    iput-boolean p3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mm:Z

    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    :goto_26
    if-ge p3, p1, :cond_34

    new-instance v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    invoke-direct {v1, v0}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object v1, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p2, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    add-int/lit8 p3, p3, 0x1

    goto :goto_26

    :cond_34
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    return-void
.end method


# virtual methods
.method public clear()I
    .registers 5

    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_2b

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_13

    goto :goto_2b

    :cond_13
    nop

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    move v1, v2

    :goto_17
    iget-object v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v0, v3, :cond_23

    const/4 v3, 0x0

    iput-object v3, v0, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    iget-object v0, v0, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_17

    :cond_23
    iput-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return v1

    :cond_2b
    :goto_2b
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public decreaseCapacity(I)V
    .registers 5

    iget-boolean v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mm:Z

    if-eqz v0, :cond_2b

    if-gtz p1, :cond_7

    goto :goto_2b

    :cond_7
    :goto_7
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_27

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_1a

    goto :goto_27

    :cond_1a
    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    sub-int/2addr v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    iput p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :cond_27
    :goto_27
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_7

    :cond_2b
    :goto_2b
    return-void
.end method

.method public get()Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    :goto_0
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_33

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_13

    goto :goto_33

    :cond_13
    nop

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v3, 0x0

    move-object v4, v1

    move-object v1, v0

    move-object v0, v3

    :goto_1c
    if-nez v0, :cond_29

    if-eq v1, v4, :cond_29

    iget-object v0, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    iput-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v4, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_1c

    :cond_29
    if-eqz v0, :cond_2d

    iput-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    :cond_2d
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-object v0

    :cond_33
    :goto_33
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_0
.end method

.method public getCapacity()I
    .registers 3

    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    if-lez v0, :cond_8

    iget v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    add-int/2addr v1, v0

    goto :goto_a

    :cond_8
    iget v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    :goto_a
    return v1
.end method

.method public increaseCapacity(I)V
    .registers 5

    iget-boolean v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ml:Z

    if-nez v0, :cond_2c

    if-gtz p1, :cond_7

    goto :goto_2c

    :cond_7
    :goto_7
    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-nez v0, :cond_28

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v0

    if-nez v0, :cond_1a

    goto :goto_28

    :cond_1a
    neg-int v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    iget v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    add-int/2addr v0, p1

    iput v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mk:I

    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void

    :cond_28
    :goto_28
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_7

    :cond_2c
    :goto_2c
    return-void
.end method

.method public isEmpty()Z
    .registers 3

    iget-object v0, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public put(Ljava/lang/Object;)Z
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :goto_4
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_63

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_16

    goto :goto_63

    :cond_16
    nop

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    iget-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v5, 0x1

    if-eq v4, v1, :cond_3e

    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p1, p1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq p1, v1, :cond_39

    iget-boolean p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mm:Z

    if-eqz p1, :cond_39

    if-lez v3, :cond_39

    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object p1, p1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    sub-int/2addr v3, v5

    iput v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    :cond_39
    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_5d

    :cond_3e
    iget-boolean v4, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Ml:Z

    if-nez v4, :cond_47

    if-gez v3, :cond_45

    goto :goto_47

    :cond_45
    move v5, v0

    goto :goto_5d

    :cond_47
    :goto_47
    new-instance v4, Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    const/4 v6, 0x0

    invoke-direct {v4, v6}, Lmiui/util/concurrent/ConcurrentRingQueue$Node;-><init>(Lmiui/util/concurrent/ConcurrentRingQueue$1;)V

    iput-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iget-object v4, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object v1, v4, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    add-int/2addr v3, v5

    iput v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mr:I

    iget-object p1, v2, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    iput-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    nop

    :goto_5d
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mp:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return v5

    :cond_63
    :goto_63
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_4
.end method

.method public remove(Lmiui/util/concurrent/Queue$Predicate;)I
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lmiui/util/concurrent/Queue$Predicate<",
            "TT;>;)I"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :goto_4
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_3c

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_16

    goto :goto_3c

    :cond_16
    nop

    :try_start_17
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    move v2, v0

    :goto_1a
    iget-object v3, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v1, v3, :cond_2e

    iget-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    invoke-interface {p1, v3}, Lmiui/util/concurrent/Queue$Predicate;->apply(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    const/4 v3, 0x0

    iput-object v3, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    :cond_2b
    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;
    :try_end_2d
    .catchall {:try_start_17 .. :try_end_2d} :catchall_35

    goto :goto_1a

    :cond_2e
    iget-object p1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    nop

    return v2

    :catchall_35
    move-exception p1

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    throw p1

    :cond_3c
    :goto_3c
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_4
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    :goto_4
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-nez v1, :cond_34

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, -0x1

    invoke-virtual {v1, v0, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v1

    if-nez v1, :cond_16

    goto :goto_34

    :cond_16
    nop

    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mo:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    :goto_19
    iget-object v2, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mq:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    if-eq v1, v2, :cond_2d

    iget-object v2, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    const/4 p1, 0x0

    iput-object p1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->element:Ljava/lang/Object;

    const/4 p1, 0x1

    goto :goto_2e

    :cond_2a
    iget-object v1, v1, Lmiui/util/concurrent/ConcurrentRingQueue$Node;->Ms:Lmiui/util/concurrent/ConcurrentRingQueue$Node;

    goto :goto_19

    :cond_2d
    move p1, v0

    :goto_2e
    iget-object v1, p0, Lmiui/util/concurrent/ConcurrentRingQueue;->Mn:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return p1

    :cond_34
    :goto_34
    invoke-static {}, Ljava/lang/Thread;->yield()V

    goto :goto_4
.end method
