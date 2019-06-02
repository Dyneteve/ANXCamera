.class public final Lio/reactivex/internal/disposables/ObserverFullArbiter;
.super Lio/reactivex/internal/disposables/FullArbiterPad1;
.source "ObserverFullArbiter.java"

# interfaces
.implements Lio/reactivex/disposables/Disposable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/disposables/FullArbiterPad1;",
        "Lio/reactivex/disposables/Disposable;"
    }
.end annotation


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer<",
            "-TT;>;"
        }
    .end annotation
.end field

.field volatile cancelled:Z

.field final queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/queue/SpscLinkedArrayQueue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field resource:Lio/reactivex/disposables/Disposable;

.field volatile s:Lio/reactivex/disposables/Disposable;


# direct methods
.method public constructor <init>(Lio/reactivex/Observer;Lio/reactivex/disposables/Disposable;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer<",
            "-TT;>;",
            "Lio/reactivex/disposables/Disposable;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0}, Lio/reactivex/internal/disposables/FullArbiterPad1;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->actual:Lio/reactivex/Observer;

    iput-object p2, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    new-instance p1, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-direct {p1, p3}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object p1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    sget-object p1, Lio/reactivex/internal/disposables/EmptyDisposable;->INSTANCE:Lio/reactivex/internal/disposables/EmptyDisposable;

    iput-object p1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    :cond_0
    return-void
.end method

.method disposeResource()V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    const/4 v1, 0x0

    iput-object v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    :cond_0
    return-void
.end method

.method drain()V
    .locals 7

    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    nop

    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget-object v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->actual:Lio/reactivex/Observer;

    const/4 v2, 0x1

    move v3, v2

    :cond_1
    :goto_0
    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_2

    nop

    iget-object v4, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v3, v3

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v3

    if-nez v3, :cond_1

    nop

    return-void

    :cond_2
    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->poll()Ljava/lang/Object;

    move-result-object v5

    iget-object v6, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    if-ne v4, v6, :cond_8

    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isDisposable(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->getDisposable(Ljava/lang/Object;)Lio/reactivex/disposables/Disposable;

    move-result-object v4

    iget-object v5, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v5}, Lio/reactivex/disposables/Disposable;->dispose()V

    iget-boolean v5, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v5, :cond_3

    iput-object v4, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    goto :goto_1

    :cond_3
    invoke-interface {v4}, Lio/reactivex/disposables/Disposable;->dispose()V

    :goto_1
    goto :goto_3

    :cond_4
    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v4

    iget-boolean v5, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v5, :cond_5

    iput-boolean v2, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    invoke-interface {v1, v4}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_5
    invoke-static {v4}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    :goto_2
    goto :goto_3

    :cond_6
    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->isComplete(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-virtual {v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->clear()V

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->disposeResource()V

    iget-boolean v4, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-nez v4, :cond_8

    iput-boolean v2, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    invoke-interface {v1}, Lio/reactivex/Observer;->onComplete()V

    goto :goto_3

    :cond_7
    invoke-static {v5}, Lio/reactivex/internal/util/NotificationLite;->getValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v1, v4}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    :cond_8
    :goto_3
    goto :goto_0
.end method

.method public isDisposed()Z
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->resource:Lio/reactivex/disposables/Disposable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->isDisposed()Z

    move-result v0

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    :goto_0
    return v0
.end method

.method public onComplete(Lio/reactivex/disposables/Disposable;)V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {}, Lio/reactivex/internal/util/NotificationLite;->complete()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;Lio/reactivex/disposables/Disposable;)V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;Lio/reactivex/disposables/Disposable;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lio/reactivex/disposables/Disposable;",
            ")Z"
        }
    .end annotation

    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->next(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    const/4 p1, 0x1

    return p1
.end method

.method public setDisposable(Lio/reactivex/disposables/Disposable;)Z
    .locals 2

    iget-boolean v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->cancelled:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->queue:Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget-object v1, p0, Lio/reactivex/internal/disposables/ObserverFullArbiter;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {p1}, Lio/reactivex/internal/util/NotificationLite;->disposable(Lio/reactivex/disposables/Disposable;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;->offer(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lio/reactivex/internal/disposables/ObserverFullArbiter;->drain()V

    const/4 p1, 0x1

    return p1
.end method
