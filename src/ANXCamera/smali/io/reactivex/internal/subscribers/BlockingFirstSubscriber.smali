.class public final Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;
.super Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;
.source "BlockingFirstSubscriber.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lio/reactivex/internal/subscribers/BlockingBaseSubscriber<",
        "TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lio/reactivex/internal/subscribers/BlockingBaseSubscriber;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    iput-object p1, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->error:Ljava/lang/Throwable;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lio/reactivex/plugins/RxJavaPlugins;->onError(Ljava/lang/Throwable;)V

    :goto_0
    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->countDown()V

    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    iput-object p1, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->value:Ljava/lang/Object;

    iget-object p1, p0, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1}, Lorg/reactivestreams/Subscription;->cancel()V

    invoke-virtual {p0}, Lio/reactivex/internal/subscribers/BlockingFirstSubscriber;->countDown()V

    :cond_0
    return-void
.end method
