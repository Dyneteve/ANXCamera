.class final Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableSubscribeOn.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Ljava/lang/Runnable;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SubscribeOnSubscriber"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber$Request;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Ljava/lang/Thread;",
        ">;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;",
        "Ljava/lang/Runnable;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x70559c6a66be0138L


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final nonScheduledRequests:Z

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final s:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lorg/reactivestreams/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher<",
            "TT;>;"
        }
    .end annotation
.end field

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/Scheduler$Worker;Lorg/reactivestreams/Publisher;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            "Lorg/reactivestreams/Publisher<",
            "TT;>;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->source:Lorg/reactivestreams/Publisher;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    xor-int/lit8 p1, p4, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->nonScheduledRequests:Z

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void
.end method

.method public onComplete()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {p1}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 5

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->setOnce(Ljava/util/concurrent/atomic/AtomicReference;Lorg/reactivestreams/Subscription;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-eqz v0, :cond_0

    invoke-virtual {p0, v3, v4, p1}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requestUpstream(JLorg/reactivestreams/Subscription;)V

    :cond_0
    return-void
.end method

.method public request(J)V
    .locals 4

    invoke-static {p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->validate(J)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/reactivestreams/Subscription;

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2, v0}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requestUpstream(JLorg/reactivestreams/Subscription;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {v0, p1, p2}, Lio/reactivex/internal/util/BackpressureHelper;->add(Ljava/util/concurrent/atomic/AtomicLong;J)J

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->s:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lorg/reactivestreams/Subscription;

    if-eqz p1, :cond_1

    iget-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v0, 0x0

    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    move-result-wide v2

    cmp-long p2, v2, v0

    if-eqz p2, :cond_1

    invoke-virtual {p0, v2, v3, p1}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->requestUpstream(JLorg/reactivestreams/Subscription;)V

    :cond_1
    :goto_0
    return-void
.end method

.method requestUpstream(JLorg/reactivestreams/Subscription;)V
    .locals 2

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->nonScheduledRequests:Z

    if-nez v0, :cond_1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->get()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->worker:Lio/reactivex/Scheduler$Worker;

    new-instance v1, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber$Request;

    invoke-direct {v1, p3, p1, p2}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber$Request;-><init>(Lorg/reactivestreams/Subscription;J)V

    invoke-virtual {v0, v1}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :cond_1
    :goto_0
    invoke-interface {p3, p1, p2}, Lorg/reactivestreams/Subscription;->request(J)V

    :goto_1
    return-void
.end method

.method public run()V
    .locals 2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->lazySet(Ljava/lang/Object;)V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->source:Lorg/reactivestreams/Publisher;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableSubscribeOn$SubscribeOnSubscriber;->source:Lorg/reactivestreams/Publisher;

    invoke-interface {v0, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    return-void
.end method
