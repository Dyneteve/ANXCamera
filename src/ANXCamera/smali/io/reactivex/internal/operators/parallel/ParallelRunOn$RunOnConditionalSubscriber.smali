.class final Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;
.super Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;
.source "ParallelRunOn.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/parallel/ParallelRunOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RunOnConditionalSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0xeeb976b788f368aL


# instance fields
.field final actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber<",
            "-TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lio/reactivex/internal/fuseable/ConditionalSubscriber;ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/fuseable/ConditionalSubscriber<",
            "-TT;>;I",
            "Lio/reactivex/internal/queue/SpscArrayQueue<",
            "TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p2, p3, p4}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$BaseRunOnSubscriber;-><init>(ILio/reactivex/internal/queue/SpscArrayQueue;Lio/reactivex/Scheduler$Worker;)V

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    return-void
.end method


# virtual methods
.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(Lorg/reactivestreams/Subscription;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    iget-object v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    invoke-interface {v0, p0}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    iget v0, p0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->prefetch:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_0
    return-void
.end method

.method public run()V
    .locals 18

    move-object/from16 v0, p0

    iget v1, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->consumed:I

    iget-object v2, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->queue:Lio/reactivex/internal/queue/SpscArrayQueue;

    iget-object v3, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->actual:Lio/reactivex/internal/fuseable/ConditionalSubscriber;

    iget v4, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->limit:I

    const/4 v5, 0x1

    move v6, v5

    :goto_0
    iget-object v7, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v7

    nop

    const-wide/16 v9, 0x0

    move-wide v11, v9

    :goto_1
    cmp-long v13, v11, v7

    if-eqz v13, :cond_7

    iget-boolean v14, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->cancelled:Z

    if-eqz v14, :cond_0

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    return-void

    :cond_0
    iget-boolean v14, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->done:Z

    if-eqz v14, :cond_1

    iget-object v15, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->error:Ljava/lang/Throwable;

    if-eqz v15, :cond_1

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    invoke-interface {v3, v15}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_1
    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v15

    const/16 v16, 0x0

    if-nez v15, :cond_2

    move/from16 v17, v5

    goto :goto_2

    :cond_2
    nop

    move/from16 v17, v16

    :goto_2
    if-eqz v14, :cond_3

    if-eqz v17, :cond_3

    invoke-interface {v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_3
    if-eqz v17, :cond_4

    goto :goto_3

    :cond_4
    invoke-interface {v3, v15}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->tryOnNext(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    const-wide/16 v13, 0x1

    add-long/2addr v11, v13

    :cond_5
    add-int/lit8 v1, v1, 0x1

    if-ne v1, v4, :cond_6

    nop

    iget-object v13, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->s:Lorg/reactivestreams/Subscription;

    int-to-long v14, v1

    invoke-interface {v13, v14, v15}, Lorg/reactivestreams/Subscription;->request(J)V

    move/from16 v1, v16

    :cond_6
    goto :goto_1

    :cond_7
    :goto_3
    if-nez v13, :cond_a

    iget-boolean v13, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->cancelled:Z

    if-eqz v13, :cond_8

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    return-void

    :cond_8
    iget-boolean v13, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->done:Z

    if-eqz v13, :cond_a

    iget-object v13, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->error:Ljava/lang/Throwable;

    if-eqz v13, :cond_9

    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->clear()V

    invoke-interface {v3, v13}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onError(Ljava/lang/Throwable;)V

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_9
    invoke-virtual {v2}, Lio/reactivex/internal/queue/SpscArrayQueue;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_a

    invoke-interface {v3}, Lio/reactivex/internal/fuseable/ConditionalSubscriber;->onComplete()V

    iget-object v0, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_a
    cmp-long v9, v11, v9

    if-eqz v9, :cond_b

    const-wide v9, 0x7fffffffffffffffL

    cmp-long v7, v7, v9

    if-eqz v7, :cond_b

    iget-object v7, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    neg-long v8, v11

    invoke-virtual {v7, v8, v9}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    :cond_b
    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->get()I

    move-result v7

    if-ne v7, v6, :cond_c

    iput v1, v0, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->consumed:I

    neg-int v6, v6

    invoke-virtual {v0, v6}, Lio/reactivex/internal/operators/parallel/ParallelRunOn$RunOnConditionalSubscriber;->addAndGet(I)I

    move-result v6

    if-nez v6, :cond_d

    nop

    return-void

    :cond_c
    nop

    move v6, v7

    :cond_d
    goto/16 :goto_0
.end method
