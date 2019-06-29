.class public final Lio/reactivex/internal/operators/completable/CompletableMerge;
.super Lio/reactivex/Completable;
.source "CompletableMerge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/operators/completable/CompletableMerge$CompletableMergeSubscriber;
    }
.end annotation


# instance fields
.field final delayErrors:Z

.field final maxConcurrency:I

.field final source:Lorg/reactivestreams/Publisher;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/reactivestreams/Publisher<",
            "+",
            "Lio/reactivex/CompletableSource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/reactivestreams/Publisher;IZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/reactivestreams/Publisher<",
            "+",
            "Lio/reactivex/CompletableSource;",
            ">;IZ)V"
        }
    .end annotation

    invoke-direct {p0}, Lio/reactivex/Completable;-><init>()V

    iput-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->source:Lorg/reactivestreams/Publisher;

    iput p2, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->maxConcurrency:I

    iput-boolean p3, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->delayErrors:Z

    return-void
.end method


# virtual methods
.method public subscribeActual(Lio/reactivex/CompletableObserver;)V
    .locals 3

    new-instance v0, Lio/reactivex/internal/operators/completable/CompletableMerge$CompletableMergeSubscriber;

    iget v1, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->maxConcurrency:I

    iget-boolean v2, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->delayErrors:Z

    invoke-direct {v0, p1, v1, v2}, Lio/reactivex/internal/operators/completable/CompletableMerge$CompletableMergeSubscriber;-><init>(Lio/reactivex/CompletableObserver;IZ)V

    iget-object p1, p0, Lio/reactivex/internal/operators/completable/CompletableMerge;->source:Lorg/reactivestreams/Publisher;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Publisher;->subscribe(Lorg/reactivestreams/Subscriber;)V

    return-void
.end method
