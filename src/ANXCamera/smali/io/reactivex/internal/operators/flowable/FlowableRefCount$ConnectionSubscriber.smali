.class final Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;
.super Ljava/util/concurrent/atomic/AtomicReference;
.source "FlowableRefCount.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;
.implements Lorg/reactivestreams/Subscription;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableRefCount;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ConnectionSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/concurrent/atomic/AtomicReference<",
        "Lorg/reactivestreams/Subscription;",
        ">;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;",
        "Lorg/reactivestreams/Subscription;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x21c3e08adcbe456L


# instance fields
.field final currentBase:Lio/reactivex/disposables/CompositeDisposable;

.field final requested:Ljava/util/concurrent/atomic/AtomicLong;

.field final resource:Lio/reactivex/disposables/Disposable;

.field final subscriber:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/flowable/FlowableRefCount;Lorg/reactivestreams/Subscriber;Lio/reactivex/disposables/CompositeDisposable;Lio/reactivex/disposables/Disposable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;",
            "Lio/reactivex/disposables/CompositeDisposable;",
            "Lio/reactivex/disposables/Disposable;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->subscriber:Lorg/reactivestreams/Subscriber;

    iput-object p3, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->currentBase:Lio/reactivex/disposables/CompositeDisposable;

    iput-object p4, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->resource:Lio/reactivex/disposables/Disposable;

    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    invoke-static {p0}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->cancel(Ljava/util/concurrent/atomic/AtomicReference;)Z

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->resource:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    return-void
.end method

.method cleanup()V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->currentBase:Lio/reactivex/disposables/CompositeDisposable;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->source:Lio/reactivex/flowables/ConnectableFlowable;

    instance-of v0, v0, Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->source:Lio/reactivex/flowables/ConnectableFlowable;

    check-cast v0, Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    new-instance v1, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v1}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v1, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->baseDisposable:Lio/reactivex/disposables/CompositeDisposable;

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->subscriptionCount:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v0, v0, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    nop

    return-void

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->this$0:Lio/reactivex/internal/operators/flowable/FlowableRefCount;

    iget-object v1, v1, Lio/reactivex/internal/operators/flowable/FlowableRefCount;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public onComplete()V
    .locals 1

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->cleanup()V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->subscriber:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    invoke-virtual {p0}, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->cleanup()V

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->subscriber:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->subscriber:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {p0, v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->deferredSetOnce(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicLong;Lorg/reactivestreams/Subscription;)Z

    return-void
.end method

.method public request(J)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableRefCount$ConnectionSubscriber;->requested:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-static {p0, v0, p1, p2}, Lio/reactivex/internal/subscriptions/SubscriptionHelper;->deferredRequest(Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/atomic/AtomicLong;J)V

    return-void
.end method
