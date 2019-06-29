.class final Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;
.super Ljava/lang/Object;
.source "FlowableOnErrorNext.java"

# interfaces
.implements Lio/reactivex/FlowableSubscriber;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "OnErrorNextSubscriber"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lio/reactivex/FlowableSubscriber<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final actual:Lorg/reactivestreams/Subscriber;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final allowFatal:Z

.field final arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

.field done:Z

.field final nextSupplier:Lio/reactivex/functions/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/functions/Function<",
            "-",
            "Ljava/lang/Throwable;",
            "+",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;>;"
        }
    .end annotation
.end field

.field once:Z


# direct methods
.method constructor <init>(Lorg/reactivestreams/Subscriber;Lio/reactivex/functions/Function;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Subscriber<",
            "-TT;>;",
            "Lio/reactivex/functions/Function<",
            "-",
            "Ljava/lang/Throwable;",
            "+",
            "Lorg/reactivestreams/Publisher<",
            "+TT;>;>;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    iput-object p2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->nextSupplier:Lio/reactivex/functions/Function;

    iput-boolean p3, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->allowFatal:Z

    new-instance p1, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-direct {p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0}, Lorg/reactivestreams/Subscriber;->onComplete()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 6

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    iget-boolean v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->allowFatal:Z

    if-eqz v1, :cond_2

    instance-of v1, p1, Ljava/lang/Exception;

    if-nez v1, :cond_2

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_2
    :try_start_0
    iget-object v1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->nextSupplier:Lio/reactivex/functions/Function;

    invoke-interface {v1, p1}, Lio/reactivex/functions/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/reactivestreams/Publisher;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    nop

    if-nez v1, :cond_3

    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Publisher is null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_3
    invoke-interface {v1, p0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    return-void

    :catch_0
    move-exception v1

    invoke-static {v1}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v2, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    new-instance v3, Lio/reactivex/exceptions/CompositeException;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Throwable;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    aput-object v1, v4, v0

    invoke-direct {v3, v4}, Lio/reactivex/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    invoke-interface {v2, v3}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->done:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->actual:Lorg/reactivestreams/Subscriber;

    invoke-interface {v0, p1}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->once:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    const-wide/16 v0, 0x1

    invoke-virtual {p1, v0, v1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->produced(J)V

    :cond_1
    return-void
.end method

.method public onSubscribe(Lorg/reactivestreams/Subscription;)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/flowable/FlowableOnErrorNext$OnErrorNextSubscriber;->arbiter:Lio/reactivex/internal/subscriptions/SubscriptionArbiter;

    invoke-virtual {v0, p1}, Lio/reactivex/internal/subscriptions/SubscriptionArbiter;->setSubscription(Lorg/reactivestreams/Subscription;)V

    return-void
.end method
