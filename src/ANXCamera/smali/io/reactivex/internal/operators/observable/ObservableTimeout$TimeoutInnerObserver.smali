.class final Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;
.super Lio/reactivex/observers/DisposableObserver;
.source "ObservableTimeout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/reactivex/internal/operators/observable/ObservableTimeout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "TimeoutInnerObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "U:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/observers/DisposableObserver<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field done:Z

.field final index:J

.field final parent:Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;


# direct methods
.method constructor <init>(Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;J)V
    .locals 0

    invoke-direct {p0}, Lio/reactivex/observers/DisposableObserver;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;

    iput-wide p2, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->index:J

    return-void
.end method


# virtual methods
.method public onComplete()V
    .locals 3

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;

    iget-wide v1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->index:J

    invoke-interface {v0, v1, v2}, Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;->timeout(J)V

    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iget-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    iget-object v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;

    invoke-interface {v0, p1}, Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;->innerError(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2

    iget-boolean p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    if-eqz p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->done:Z

    invoke-virtual {p0}, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->dispose()V

    iget-object p1, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->parent:Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;

    iget-wide v0, p0, Lio/reactivex/internal/operators/observable/ObservableTimeout$TimeoutInnerObserver;->index:J

    invoke-interface {p1, v0, v1}, Lio/reactivex/internal/operators/observable/ObservableTimeout$OnTimeout;->timeout(J)V

    return-void
.end method
