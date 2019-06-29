.class final Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;
.super Ljava/util/concurrent/atomic/AtomicInteger;
.source "FlowablePublish.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowablePublish;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "PublishSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicInteger;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# static fields
.field static final EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

.field static final TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

.field private static final serialVersionUID:J = -0x2cec618a478db7eL


# instance fields
.field final bufferSize:I

.field final current:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field volatile queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field final shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

.field sourceMode:I

.field final subscribers:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "[",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;",
            ">;"
        }
    .end annotation
.end field

.field volatile terminalEvent:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    new-array v1, v0, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    sput-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    new-array v0, v0, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    sput-object v0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    return-void
.end method

.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber<",
            "TT;>;>;I)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->shouldConnect:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->bufferSize:I

    return-void
.end method


# virtual methods
.method add(Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber<",
            "TT;>;)Z"
        }
    .end annotation

    :goto_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    array-length v1, v0

    add-int/lit8 v3, v1, 0x1

    new-array v3, v3, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-static {v0, v2, v3, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-object p1, v3, v1

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v0, v3}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    goto :goto_0
.end method

.method checkTerminated(Ljava/lang/Object;Z)Z
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    if-eqz p2, :cond_4

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1, p0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object p2, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-virtual {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    array-length p2, p1

    :goto_0
    if-ge v0, p2, :cond_0

    aget-object v1, p1, v0

    iget-object v1, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->child:Lorg/reactivestreams/Subscriber;

    invoke-interface {v1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v3

    :cond_1
    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    iget-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p2, p0, v2}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-virtual {p2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    array-length v1, p2

    if-eqz v1, :cond_2

    array-length v1, p2

    :goto_1
    if-ge v0, v1, :cond_3

    aget-object v2, p2, v0

    iget-object v2, v2, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->child:Lorg/reactivestreams/Subscriber;

    invoke-interface {v2, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_2
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    :cond_3
    return v3

    :cond_4
    return v0
.end method

.method dispatch()V
    .locals 21

    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    nop

    const/4 v2, 0x1

    move v3, v2

    :goto_0
    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    iget-object v4, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    if-eqz v4, :cond_2

    invoke-interface {v4}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    nop

    move v6, v2

    :goto_2
    invoke-virtual {v1, v0, v6}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->checkTerminated(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    return-void

    :cond_3
    if-nez v6, :cond_13

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    array-length v0, v7

    const-wide v8, 0x7fffffffffffffffL

    nop

    array-length v10, v7

    move-wide v11, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_3
    const-wide/16 v13, 0x0

    if-ge v8, v10, :cond_6

    aget-object v15, v7, v8

    move/from16 v16, v6

    invoke-virtual {v15}, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->get()J

    move-result-wide v5

    cmp-long v13, v5, v13

    if-ltz v13, :cond_4

    invoke-static {v11, v12, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    move-wide v11, v5

    goto :goto_4

    :cond_4
    const-wide/high16 v13, -0x8000000000000000L

    cmp-long v5, v5, v13

    if-nez v5, :cond_5

    add-int/lit8 v9, v9, 0x1

    :cond_5
    :goto_4
    add-int/lit8 v8, v8, 0x1

    move/from16 v6, v16

    goto :goto_3

    :cond_6
    move/from16 v16, v6

    const-wide/16 v5, 0x1

    if-ne v0, v9, :cond_a

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    :try_start_0
    invoke-interface {v4}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_5

    :catch_0
    move-exception v0

    move-object v4, v0

    invoke-static {v4}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    invoke-static {v4}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    nop

    const/4 v4, 0x0

    :goto_5
    if-nez v4, :cond_7

    move v4, v2

    goto :goto_6

    :cond_7
    const/4 v4, 0x0

    :goto_6
    invoke-virtual {v1, v0, v4}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->checkTerminated(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_8

    return-void

    :cond_8
    iget v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->sourceMode:I

    if-eq v0, v2, :cond_9

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0, v5, v6}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_9
    move v4, v2

    move/from16 v17, v3

    goto/16 :goto_d

    :cond_a
    nop

    const/4 v9, 0x0

    :goto_7
    move/from16 v17, v3

    int-to-long v2, v9

    cmp-long v0, v2, v11

    if-gez v0, :cond_10

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    :try_start_1
    invoke-interface {v4}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v10
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_8

    :catch_1
    move-exception v0

    move-object v10, v0

    invoke-static {v10}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0}, Lorg/reactivestreams/Subscription;->cancel()V

    invoke-static {v10}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    nop

    const/4 v10, 0x0

    :goto_8
    if-nez v10, :cond_b

    const/4 v15, 0x1

    goto :goto_9

    :cond_b
    nop

    const/4 v15, 0x0

    :goto_9
    invoke-virtual {v1, v0, v15}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->checkTerminated(Ljava/lang/Object;Z)Z

    move-result v0

    if-eqz v0, :cond_c

    return-void

    :cond_c
    if-eqz v15, :cond_d

    goto :goto_b

    :cond_d
    invoke-static {v10}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    array-length v2, v7

    const/4 v3, 0x0

    :goto_a
    if-ge v3, v2, :cond_f

    aget-object v10, v7, v3

    invoke-virtual {v10}, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->get()J

    move-result-wide v18

    cmp-long v16, v18, v13

    if-lez v16, :cond_e

    iget-object v8, v10, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->child:Lorg/reactivestreams/Subscriber;

    invoke-interface {v8, v0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    invoke-virtual {v10, v5, v6}, Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;->produced(J)J

    :cond_e
    add-int/lit8 v3, v3, 0x1

    goto :goto_a

    :cond_f
    add-int/lit8 v9, v9, 0x1

    nop

    move/from16 v16, v15

    move/from16 v3, v17

    const/4 v2, 0x1

    goto :goto_7

    :cond_10
    move/from16 v15, v16

    :goto_b
    if-lez v9, :cond_11

    iget v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->sourceMode:I

    const/4 v4, 0x1

    if-eq v0, v4, :cond_12

    iget-object v0, v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    invoke-interface {v0, v2, v3}, Lorg/reactivestreams/Subscription;->request(J)V

    goto :goto_c

    :cond_11
    const/4 v4, 0x1

    :cond_12
    :goto_c
    cmp-long v0, v11, v13

    if-eqz v0, :cond_14

    if-nez v15, :cond_14

    nop

    :goto_d
    move v2, v4

    move/from16 v3, v17

    goto/16 :goto_0

    :cond_13
    move v4, v2

    move/from16 v17, v3

    :cond_14
    move/from16 v2, v17

    neg-int v0, v2

    invoke-virtual {v1, v0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->addAndGet(I)I

    move-result v3

    if-nez v3, :cond_15

    nop

    return-void

    :cond_15
    nop

    move v2, v4

    goto/16 :goto_0
.end method

.method public dispose()V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->current:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    :cond_0
    return-void
.end method

.method public isDisposed()Z
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->TERMINATED:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onComplete()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    if-nez v0, :cond_0

    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->dispatch()V

    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    if-nez v0, :cond_0

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->dispatch()V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->sourceMode:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    new-instance p1, Lio/reactivex/exceptions/MissingBackpressureException;

    const-string v0, "Prefetch queue is full?!"

    invoke-direct {p1, v0}, Lio/reactivex/exceptions/MissingBackpressureException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->dispatch()V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 3

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_2

    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueSubscription;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lio/reactivex/internal/fuseable/QueueSubscription;

    const/4 v1, 0x3

    invoke-interface {v0, v1}, Lio/reactivex/internal/fuseable/QueueSubscription;->requestFusion(I)I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->sourceMode:I

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->terminalEvent:Ljava/lang/Object;

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->dispatch()V

    return-void

    :cond_0
    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    iput v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->sourceMode:I

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    return-void

    :cond_1
    new-instance v0, Lio/reactivex/internal/queue/SpscArrayQueue;

    iget v1, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->bufferSize:I

    invoke-direct {v0, v1}, Lio/reactivex/internal/queue/SpscArrayQueue;-><init>(I)V

    iput-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->bufferSize:I

    int-to-long v0, v0

    invoke-interface {p1, v0, v1}, Lorg/reactivestreams/Subscription;->request(J)V

    :cond_2
    return-void
.end method

.method remove(Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber<",
            "TT;>;)V"
        }
    .end annotation

    :goto_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    array-length v1, v0

    if-nez v1, :cond_0

    goto :goto_4

    :cond_0
    const/4 v2, -0x1

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    if-ge v4, v1, :cond_2

    aget-object v5, v0, v4

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    nop

    nop

    move v2, v4

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    if-gez v2, :cond_3

    return-void

    :cond_3
    const/4 v4, 0x1

    if-ne v1, v4, :cond_4

    sget-object v1, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->EMPTY:[Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    goto :goto_3

    :cond_4
    add-int/lit8 v5, v1, -0x1

    new-array v5, v5, [Lio/reactivex/internal/operators/flowable/FlowablePublish$InnerSubscriber;

    invoke-static {v0, v3, v5, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v3, v2, 0x1

    sub-int/2addr v1, v2

    sub-int/2addr v1, v4

    invoke-static {v0, v3, v5, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v1, v5

    :goto_3
    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowablePublish$PublishSubscriber;->subscribers:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    nop

    :goto_4
    return-void

    :cond_5
    goto :goto_0
.end method
