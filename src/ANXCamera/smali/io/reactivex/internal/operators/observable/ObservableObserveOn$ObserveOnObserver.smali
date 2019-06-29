.class final Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;
.super Lio/reactivex/internal/observers/BasicIntQueueDisposable;
.source "ObservableObserveOn.java"

# interfaces
.implements Lio/reactivex/Observer;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableObserveOn;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "ObserveOnObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/observers/BasicIntQueueDisposable<",
        "TT;>;",
        "Lio/reactivex/Observer<",
        "TT;>;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x5b45d4a143741ca0L


# instance fields
.field final actual:Lio/reactivex/Observer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Observer<",
            "-TT;>;"
        }
    .end annotation
.end field

.field final bufferSize:I

.field volatile cancelled:Z

.field final delayError:Z

.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field outputFused:Z

.field queue:Lio/reactivex/internal/fuseable/SimpleQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/internal/fuseable/SimpleQueue<",
            "TT;>;"
        }
    .end annotation
.end field

.field s:Lio/reactivex/disposables/Disposable;

.field sourceMode:I

.field final worker:Lio/reactivex/Scheduler$Worker;


# direct methods
.method constructor <init>(Lio/reactivex/Observer;Lio/reactivex/Scheduler$Worker;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/Observer<",
            "-TT;>;",
            "Lio/reactivex/Scheduler$Worker;",
            "ZI)V"
        }
    .end annotation

    invoke-direct {p0}, Lio/reactivex/internal/observers/BasicIntQueueDisposable;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    iput-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    iput-boolean p3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    iput p4, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->bufferSize:I

    return-void
.end method


# virtual methods
.method checkTerminated(ZZLio/reactivex/Observer;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Lio/reactivex/Observer<",
            "-TT;>;)Z"
        }
    .end annotation

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    return v1

    :cond_0
    if-eqz p1, :cond_4

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    if-eqz v0, :cond_2

    if-eqz p2, :cond_4

    if-eqz p1, :cond_1

    invoke-interface {p3, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_1
    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    :goto_0
    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {p1}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return v1

    :cond_2
    if-eqz p1, :cond_3

    iget-object p2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {p2}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    invoke-interface {p3, p1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {p1}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return v1

    :cond_3
    if-eqz p2, :cond_4

    invoke-interface {p3}, Lio/reactivex/Observer;->onComplete()V

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {p1}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return v1

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    return-void
.end method

.method public dispose()V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v0}, Lio/reactivex/disposables/Disposable;->dispose()V

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    :cond_0
    return-void
.end method

.method drainFused()V
    .locals 4

    nop

    const/4 v0, 0x1

    :goto_0
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    iget-boolean v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->delayError:Z

    if-nez v3, :cond_1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    invoke-interface {v0, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_1
    iget-object v2, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    if-eqz v1, :cond_3

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v1, v0}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {v0}, Lio/reactivex/Observer;->onComplete()V

    :goto_1
    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void

    :cond_3
    neg-int v0, v0

    invoke-virtual {p0, v0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->addAndGet(I)I

    move-result v0

    if-nez v0, :cond_4

    nop

    return-void

    :cond_4
    goto :goto_0
.end method

.method drainNormal()V
    .locals 7

    nop

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget-object v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    const/4 v2, 0x1

    move v3, v2

    :cond_0
    iget-boolean v4, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v5

    invoke-virtual {p0, v4, v5, v1}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->checkTerminated(ZZLio/reactivex/Observer;)Z

    move-result v4

    if-eqz v4, :cond_1

    return-void

    :cond_1
    :goto_0
    iget-boolean v4, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    :try_start_0
    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v5
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    nop

    if-nez v5, :cond_2

    move v6, v2

    goto :goto_1

    :cond_2
    const/4 v6, 0x0

    :goto_1
    invoke-virtual {p0, v4, v6, v1}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->checkTerminated(ZZLio/reactivex/Observer;)Z

    move-result v4

    if-eqz v4, :cond_3

    return-void

    :cond_3
    if-eqz v6, :cond_4

    nop

    neg-int v3, v3

    invoke-virtual {p0, v3}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->addAndGet(I)I

    move-result v3

    if-nez v3, :cond_0

    nop

    return-void

    :cond_4
    invoke-interface {v1, v5}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-static {v2}, Lio/reactivex/exceptions/Exceptions;->throwIfFatal(Ljava/lang/Throwable;)V

    iget-object v3, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-interface {v3}, Lio/reactivex/disposables/Disposable;->dispose()V

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->clear()V

    invoke-interface {v1, v2}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0}, Lio/reactivex/Scheduler$Worker;->dispose()V

    return-void
.end method

.method public isDisposed()Z
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->cancelled:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onComplete()V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->error:Ljava/lang/Throwable;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0, p1}, Lio/reactivex/internal/fuseable/SimpleQueue;->offer(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    return-void
.end method

.method public onSubscribe(Lio/reactivex/disposables/Disposable;)V
    .locals 2

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    invoke-static {v0, p1}, Lio/reactivex/internal/disposables/DisposableHelper;->validate(Lio/reactivex/disposables/Disposable;Lio/reactivex/disposables/Disposable;)Z

    move-result v0

    if-eqz v0, :cond_2

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->s:Lio/reactivex/disposables/Disposable;

    instance-of v0, p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    if-eqz v0, :cond_1

    check-cast p1, Lio/reactivex/internal/fuseable/QueueDisposable;

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Lio/reactivex/internal/fuseable/QueueDisposable;->requestFusion(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iput-boolean v1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->done:Z

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {p1, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->schedule()V

    return-void

    :cond_0
    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iput v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->sourceMode:I

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {p1, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    return-void

    :cond_1
    new-instance p1, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;

    iget v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->bufferSize:I

    invoke-direct {p1, v0}, Lio/reactivex/internal/queue/SpscLinkedArrayQueue;-><init>(I)V

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->actual:Lio/reactivex/Observer;

    invoke-interface {p1, p0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    :cond_2
    return-void
.end method

.method public poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .annotation build Lio/reactivex/annotations/Nullable;
    .end annotation

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->queue:Lio/reactivex/internal/fuseable/SimpleQueue;

    invoke-interface {v0}, Lio/reactivex/internal/fuseable/SimpleQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public requestFusion(I)I
    .locals 1

    const/4 v0, 0x2

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->outputFused:Z

    return v0

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public run()V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->outputFused:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->drainFused()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->drainNormal()V

    :goto_0
    return-void
.end method

.method schedule()V
    .locals 1

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->getAndIncrement()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableObserveOn$ObserveOnObserver;->worker:Lio/reactivex/Scheduler$Worker;

    invoke-virtual {v0, p0}, Lio/reactivex/Scheduler$Worker;->schedule(Ljava/lang/Runnable;)Lio/reactivex/disposables/Disposable;

    :cond_0
    return-void
.end method
