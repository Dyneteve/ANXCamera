.class final Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;
.super Lio/reactivex/internal/subscribers/QueueDrainSubscriber;
.source "FlowableWindowTimed.java"

# interfaces
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableWindowTimed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "WindowExactBoundedSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/QueueDrainSubscriber<",
        "TT;",
        "Ljava/lang/Object;",
        "Lio/reactivex/Flowable<",
        "TT;>;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# instance fields
.field final bufferSize:I

.field count:J

.field final maxSize:J

.field producerIndex:J

.field final restartTimerOnMaxSize:Z

.field s:Lorg/reactivestreams/Subscription;

.field final scheduler:Lio/reactivex/Scheduler;

.field volatile terminated:Z

.field final timer:Lio/reactivex/internal/disposables/SequentialDisposable;

.field final timespan:J

.field final unit:Ljava/util/concurrent/TimeUnit;

.field window:Lio/reactivex/processors/UnicastProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/processors/UnicastProcessor<",
            "TT;>;"
        }
    .end annotation
.end field

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;IJZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-",
            "Lio/reactivex/Flowable<",
            "TT;>;>;J",
            "Ljava/util/concurrent/TimeUnit;",
            "Lio/reactivex/Scheduler;",
            "IJZ)V"
        }
    .end annotation

    new-instance v0, Lio/reactivex/internal/queue/MpscLinkedQueue;

    invoke-direct {v0}, Lio/reactivex/internal/queue/MpscLinkedQueue;-><init>()V

    invoke-direct {p0, p1, v0}, Lio/reactivex/internal/subscribers/QueueDrainSubscriber;-><init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/internal/fuseable/SimplePlainQueue;)V

    new-instance p1, Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-direct {p1}, Lio/reactivex/internal/disposables/SequentialDisposable;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    iput-wide p2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    iput-object p5, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iput p6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    iput-wide p7, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    iput-boolean p9, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz p9, :cond_0

    invoke-virtual {p5}, Lio/reactivex/Scheduler;->createWorker()Lio/reactivex/Scheduler$Worker;

    move-result-object p1

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)Z
    .locals 0

    iget-boolean p0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    return p0
.end method

.method static synthetic access$100(Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)Lio/reactivex/internal/fuseable/SimplePlainQueue;
    .locals 0

    iget-object p0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    return-object p0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    return-void
.end method

.method public dispose()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-static {v0}, Lio/reactivex/internal/disposables/DisposableHelper;->dispose(Ljava/util/concurrent/atomic/AtomicReference;)Z

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    :cond_0
    return-void
.end method

.method drainLoop()V
    .locals 16

    move-object/from16 v0, p0

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    iget-object v3, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    nop

    const/4 v5, 0x1

    :cond_0
    :goto_0
    iget-boolean v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->terminated:Z

    if-eqz v6, :cond_1

    iget-object v2, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v2}, Lorg/reactivestreams/Subscription;->cancel()V

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void

    :cond_1
    iget-boolean v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->poll()Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_2

    const/4 v8, 0x1

    goto :goto_1

    :cond_2
    const/4 v8, 0x0

    :goto_1
    instance-of v9, v7, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    const/4 v10, 0x0

    if-eqz v6, :cond_5

    if-nez v8, :cond_3

    if-eqz v9, :cond_5

    :cond_3
    iput-object v10, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->error:Ljava/lang/Throwable;

    if-eqz v1, :cond_4

    invoke-virtual {v3, v1}, Lio/reactivex/processors/UnicastProcessor;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v3}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    :goto_2
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void

    :cond_5
    if-eqz v8, :cond_6

    nop

    neg-int v5, v5

    invoke-virtual {v0, v5}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->leave(I)I

    move-result v5

    if-nez v5, :cond_0

    nop

    return-void

    :cond_6
    const-wide v11, 0x7fffffffffffffffL

    const-wide/16 v13, 0x1

    move v15, v5

    const-wide/16 v4, 0x0

    if-eqz v9, :cond_b

    check-cast v7, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-boolean v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-nez v6, :cond_8

    iget-wide v8, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    iget-wide v6, v7, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;->index:J

    cmp-long v6, v8, v6

    if-nez v6, :cond_7

    goto :goto_4

    :cond_7
    :goto_3
    move v5, v15

    goto :goto_0

    :cond_8
    :goto_4
    invoke-virtual {v3}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    iput-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    iget v3, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v3}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v3

    iput-object v3, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v6

    cmp-long v4, v6, v4

    if-eqz v4, :cond_a

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    cmp-long v4, v6, v11

    if-eqz v4, :cond_9

    invoke-virtual {v0, v13, v14}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    :cond_9
    goto :goto_3

    :cond_a
    iput-object v10, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-interface {v1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->clear()V

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    new-instance v1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v3, "Could not deliver first window due to lack of requests."

    invoke-direct {v1, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void

    :cond_b
    invoke-static {v7}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v3, v6}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    iget-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    add-long/2addr v6, v13

    iget-wide v8, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    cmp-long v8, v6, v8

    if-ltz v8, :cond_10

    iget-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    add-long/2addr v6, v13

    iput-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    iput-wide v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    invoke-virtual {v3}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v6

    cmp-long v3, v6, v4

    if-eqz v3, :cond_f

    iget v3, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v3}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v3

    iput-object v3, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v4, v3}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    cmp-long v4, v6, v11

    if-eqz v4, :cond_c

    invoke-virtual {v0, v13, v14}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    :cond_c
    iget-boolean v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v4, :cond_e

    iget-object v4, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v4}, Lio/reactivex/internal/disposables/SequentialDisposable;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lio/reactivex/disposables/Disposable;

    invoke-interface {v4}, Lio/reactivex/disposables/Disposable;->dispose()V

    iget-object v5, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v6, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-wide v7, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    invoke-direct {v6, v7, v8, v0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    iget-wide v7, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v9, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v11, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v5 .. v11}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v5

    iget-object v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v6, v4, v5}, Lio/reactivex/internal/disposables/SequentialDisposable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_d

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_d
    nop

    :cond_e
    goto :goto_5

    :cond_f
    iput-object v10, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {v1}, Lorg/reactivestreams/Subscription;->cancel()V

    iget-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v2, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v3, "Could not deliver window due to lack of requests"

    invoke-direct {v2, v3}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void

    :cond_10
    iput-wide v6, v0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    :goto_5
    goto/16 :goto_3
.end method

.method public onComplete()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->error:Ljava/lang/Throwable;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->terminated:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->fastEnter()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-virtual {v0, p1}, Lio/reactivex/processors/UnicastProcessor;->onNext(Ljava/lang/Object;)V

    iget-wide v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iget-wide v5, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->maxSize:J

    cmp-long p1, v1, v5

    if-ltz p1, :cond_5

    iget-wide v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    add-long/2addr v1, v3

    iput-wide v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    invoke-virtual {v0}, Lio/reactivex/processors/UnicastProcessor;->onComplete()V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v5

    cmp-long p1, v5, v1

    if-eqz p1, :cond_4

    iget p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {p1}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object p1

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    const-wide v0, 0x7fffffffffffffffL

    cmp-long p1, v5, v0

    if-eqz p1, :cond_1

    invoke-virtual {p0, v3, v4}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    :cond_1
    iget-boolean p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz p1, :cond_3

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {p1}, Lio/reactivex/internal/disposables/SequentialDisposable;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lio/reactivex/disposables/Disposable;

    invoke-interface {p1}, Lio/reactivex/disposables/Disposable;->dispose()V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    invoke-direct {v1, v2, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v0 .. v6}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v0

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v1, p1, v0}, Lio/reactivex/internal/disposables/SequentialDisposable;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_2
    nop

    :cond_3
    goto :goto_0

    :cond_4
    const/4 p1, 0x0

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v0, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v1, "Could not deliver window due to lack of requests"

    invoke-direct {v0, v1}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->dispose()V

    return-void

    :cond_5
    iput-wide v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->count:J

    :goto_0
    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->leave(I)I

    move-result p1

    if-nez p1, :cond_6

    return-void

    :cond_6
    goto :goto_1

    :cond_7
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->queue:Lio/reactivex/internal/fuseable/SimplePlainQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimplePlainQueue;->offer(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->enter()Z

    move-result p1

    if-nez p1, :cond_8

    return-void

    :cond_8
    :goto_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->drainLoop()V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 11

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_4

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->bufferSize:I

    invoke-static {v1}, Lio/reactivex/processors/UnicastProcessor;->create(I)Lio/reactivex/processors/UnicastProcessor;

    move-result-object v1

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->window:Lio/reactivex/processors/UnicastProcessor;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-eqz v4, :cond_3

    invoke-interface {v0, v1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    const-wide v0, 0x7fffffffffffffffL

    cmp-long v2, v2, v0

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x1

    invoke-virtual {p0, v2, v3}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->produced(J)J

    :cond_1
    new-instance v5, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;

    iget-wide v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->producerIndex:J

    invoke-direct {v5, v2, v3, p0}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber$ConsumerIndexHolder;-><init>(JLio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;)V

    iget-boolean v2, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->restartTimerOnMaxSize:Z

    if-eqz v2, :cond_2

    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v4 .. v10}, Lio/reactivex/Scheduler$Worker;->schedulePeriodically(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v2

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->scheduler:Lio/reactivex/Scheduler;

    iget-wide v6, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-wide v8, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timespan:J

    iget-object v10, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->unit:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v4 .. v10}, Lio/reactivex/Scheduler;->schedulePeriodicallyDirect(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Lio/reactivex/disposables/Disposable;

    move-result-object v2

    :goto_0
    iget-object v3, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->timer:Lio/reactivex/internal/disposables/SequentialDisposable;

    invoke-virtual {v3, v2}, Lio/reactivex/internal/disposables/SequentialDisposable;->replace(Lio/reactivex/disposables/Disposable;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_1

    :cond_3
    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->cancelled:Z

    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    new-instance p1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v1, "Could not deliver initial window due to lack of requests."

    invoke-direct {p1, v1}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_4
    :goto_1
    return-void
.end method

.method public request(J)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableWindowTimed$WindowExactBoundedSubscriber;->requested(J)V

    return-void
.end method
