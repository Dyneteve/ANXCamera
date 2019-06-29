.class final Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "ParallelFromPublisher.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelFromPublisher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ParallelDispatcher"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x3e0ae1f3a0d08e59L


# instance fields
.field volatile cancelled:Z

.field volatile done:Z

.field final emissions:[J

.field error:Ljava/lang/Throwable;

.field index:I

.field final limit:I

.field final prefetch:I

.field produced:I

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field final requests:Ljava/util/concurrent/atomic/AtomicLongArray;

.field s:Lorg/reactivestreams/Subscription;

.field sourceMode:I

.field final subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field final subscribers:[Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([Lorg/reactivestreams/Subscriber;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    iput p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    shr-int/lit8 v0, p2, 0x2

    sub-int/2addr p2, v0

    iput p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->limit:I

    array-length p1, p1

    new-instance p2, Ljava/util/concurrent/atomic/AtomicLongArray;

    add-int v0, p1, p1

    add-int/lit8 v1, v0, 0x1

    invoke-direct {p2, v1}, Ljava/util/concurrent/atomic/AtomicLongArray;-><init>(I)V

    iput-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    iget-object p2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    int-to-long v1, p1

    invoke-virtual {p2, v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLongArray;->lazySet(IJ)V

    new-array p1, p1, [J

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    return-void
.end method


# virtual methods
.method cancel(I)V
    .locals 4

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicLongArray;->decrementAndGet(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    iget-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->getAndIncrement()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    :cond_0
    return-void
.end method

.method drain()V
    .locals 2

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drainSync()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drainAsync()V

    :goto_0
    return-void
.end method

.method drainAsync()V
    .locals 18

    move-object/from16 v1, p0

    iget-object v0, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget-object v2, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    iget-object v3, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    iget-object v4, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    array-length v5, v4

    iget v6, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    iget v7, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->produced:I

    const/4 v8, 0x1

    move v9, v7

    move v7, v8

    :goto_0
    const/4 v10, 0x0

    move v11, v9

    move v9, v10

    :goto_1
    iget-boolean v12, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    if-eqz v12, :cond_0

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    return-void

    :cond_0
    iget-boolean v12, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    if-eqz v12, :cond_2

    iget-object v13, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->error:Ljava/lang/Throwable;

    if-eqz v13, :cond_2

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    array-length v0, v2

    :goto_2
    if-ge v10, v0, :cond_1

    aget-object v1, v2, v10

    invoke-interface {v1, v13}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_1
    return-void

    :cond_2
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v13

    if-eqz v12, :cond_4

    if-eqz v13, :cond_4

    array-length v0, v2

    :goto_3
    if-ge v10, v0, :cond_3

    aget-object v1, v2, v10

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_3
    return-void

    :cond_4
    if-eqz v13, :cond_5

    goto :goto_4

    :cond_5
    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v12

    aget-wide v14, v4, v6

    cmp-long v12, v12, v14

    if-eqz v12, :cond_9

    add-int v12, v5, v6

    invoke-virtual {v3, v12}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v12

    const-wide/16 v16, 0x0

    cmp-long v12, v12, v16

    if-nez v12, :cond_9

    :try_start_0
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v9
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    nop

    if-nez v9, :cond_6

    nop

    :goto_4
    move v9, v11

    goto :goto_7

    :cond_6
    aget-object v12, v2, v6

    invoke-interface {v12, v9}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    const-wide/16 v12, 0x1

    add-long/2addr v14, v12

    aput-wide v14, v4, v6

    add-int/lit8 v9, v11, 0x1

    iget v11, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->limit:I

    if-ne v9, v11, :cond_7

    nop

    iget-object v11, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    int-to-long v12, v9

    invoke-interface {v11, v12, v13}, Lorg/reactivestreams/Subscription;->request(J)V

    move v9, v10

    :cond_7
    nop

    move v11, v9

    move v9, v10

    goto :goto_6

    :catch_0
    move-exception v0

    move-object v3, v0

    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v0, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    array-length v0, v2

    :goto_5
    if-ge v10, v0, :cond_8

    aget-object v1, v2, v10

    invoke-interface {v1, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_5

    :cond_8
    return-void

    :cond_9
    add-int/2addr v9, v8

    :goto_6
    add-int/lit8 v6, v6, 0x1

    if-ne v6, v5, :cond_a

    nop

    move v6, v10

    :cond_a
    if-ne v9, v5, :cond_d

    goto :goto_4

    :goto_7
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->get()I

    move-result v10

    if-ne v10, v7, :cond_b

    iput v6, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    iput v9, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->produced:I

    neg-int v7, v7

    invoke-virtual {v1, v7}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->addAndGet(I)I

    move-result v7

    if-nez v7, :cond_c

    nop

    return-void

    :cond_b
    nop

    move v7, v10

    :cond_c
    goto/16 :goto_0

    :cond_d
    goto/16 :goto_1
.end method

.method drainSync()V
    .locals 17

    move-object/from16 v1, p0

    iget-object v0, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget-object v2, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    iget-object v3, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->requests:Ljava/util/concurrent/atomic/AtomicLongArray;

    iget-object v4, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->emissions:[J

    array-length v5, v4

    iget v6, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    const/4 v7, 0x1

    move v8, v7

    :goto_0
    const/4 v9, 0x0

    move v10, v9

    :goto_1
    iget-boolean v11, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    if-eqz v11, :cond_0

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    return-void

    :cond_0
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_2

    array-length v0, v2

    :goto_2
    if-ge v9, v0, :cond_1

    aget-object v1, v2, v9

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    :cond_1
    return-void

    :cond_2
    invoke-virtual {v3, v6}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v11

    aget-wide v13, v4, v6

    cmp-long v11, v11, v13

    if-eqz v11, :cond_6

    add-int v11, v5, v6

    invoke-virtual {v3, v11}, Ljava/util/concurrent/atomic/AtomicLongArray;->get(I)J

    move-result-wide v11

    const-wide/16 v15, 0x0

    cmp-long v11, v11, v15

    if-nez v11, :cond_6

    :try_start_0
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v10
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    nop

    if-nez v10, :cond_4

    array-length v0, v2

    :goto_3
    if-ge v9, v0, :cond_3

    aget-object v1, v2, v9

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    :cond_3
    return-void

    :cond_4
    aget-object v11, v2, v6

    invoke-interface {v11, v10}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    const-wide/16 v10, 0x1

    add-long/2addr v13, v10

    aput-wide v13, v4, v6

    nop

    nop

    move v10, v9

    goto :goto_5

    :catch_0
    move-exception v0

    move-object v3, v0

    invoke-static {v3}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v0, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    array-length v0, v2

    :goto_4
    if-ge v9, v0, :cond_5

    aget-object v1, v2, v9

    invoke-interface {v1, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_5
    return-void

    :cond_6
    add-int/2addr v10, v7

    :goto_5
    add-int/lit8 v6, v6, 0x1

    if-ne v6, v5, :cond_7

    nop

    move v6, v9

    :cond_7
    if-ne v10, v5, :cond_a

    nop

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->get()I

    move-result v9

    if-ne v9, v8, :cond_8

    iput v6, v1, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->index:I

    neg-int v8, v8

    invoke-virtual {v1, v8}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->addAndGet(I)I

    move-result v8

    if-nez v8, :cond_9

    nop

    return-void

    :cond_8
    nop

    move v8, v9

    :cond_9
    goto/16 :goto_0

    :cond_a
    goto/16 :goto_1
.end method

.method public onComplete()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    new-instance p1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v0, "Queue is full?"

    invoke-direct {p1, v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 3

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_2

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->s:Lorg/reactivestreams/Subscription;

    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lio/reactivex/internal/fuseable/QueueSubscription;

    const/4 v1, 0x7

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iput v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    iput-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iput-boolean v2, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->drain()V

    return-void

    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    iput v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->sourceMode:I

    iput-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    return-void

    :cond_1
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v1, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->setupSubscribers()V

    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->prefetch:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_2
    return-void
.end method

.method setupSubscribers()V
    .locals 6

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscribers:[Lorg/reactivestreams/Subscriber;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    iget-boolean v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->cancelled:Z

    if-eqz v3, :cond_0

    return-void

    :cond_0
    iget-object v3, p0, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;->subscriberCount:Ljava/util/concurrent/atomic/AtomicInteger;

    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->lazySet(I)V

    aget-object v3, v0, v2

    new-instance v5, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;

    invoke-direct {v5, p0, v2, v1}, Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher$RailSubscription;-><init>(Lio/reactivex/internal/operators/parallel/ParallelFromPublisher$ParallelDispatcher;II)V

    invoke-interface {v3, v5}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    move v2, v4

    goto :goto_0

    :cond_1
    return-void
.end method
