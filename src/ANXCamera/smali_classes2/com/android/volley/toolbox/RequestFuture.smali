.class public Lcom/android/volley/toolbox/RequestFuture;
.super Ljava/lang/Object;
.source "RequestFuture.java"

# interfaces
.implements Ljava/util/concurrent/Future;
.implements Lcom/android/volley/Response$Listener;
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Future<",
        "TT;>;",
        "Lcom/android/volley/Response$Listener<",
        "TT;>;",
        "Lcom/android/volley/Response$ErrorListener;"
    }
.end annotation


# instance fields
.field private mException:Lcom/android/volley/VolleyError;

.field private mRequest:Lcom/android/volley/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/volley/Request<",
            "*>;"
        }
    .end annotation
.end field

.field private mResult:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mResultReceived:Z


# direct methods
.method private constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResultReceived:Z

    return-void
.end method

.method private declared-synchronized doGet(Ljava/lang/Long;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    if-nez v0, :cond_3e

    iget-boolean v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResultReceived:Z

    if-eqz v0, :cond_d

    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResult:Ljava/lang/Object;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_46

    monitor-exit p0

    return-object v0

    :cond_d
    const-wide/16 v0, 0x0

    if-nez p1, :cond_15

    :try_start_11
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    goto :goto_24

    :cond_15
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v0, v2, v0

    if-lez v0, :cond_24

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    :cond_24
    :goto_24
    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    if-nez v0, :cond_36

    iget-boolean v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResultReceived:Z

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResult:Ljava/lang/Object;
    :try_end_2e
    .catchall {:try_start_11 .. :try_end_2e} :catchall_46

    monitor-exit p0

    return-object v0

    :cond_30
    :try_start_30
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    invoke-direct {v0}, Ljava/util/concurrent/TimeoutException;-><init>()V

    throw v0

    :cond_36
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    iget-object v1, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_3e
    new-instance v0, Ljava/util/concurrent/ExecutionException;

    iget-object v1, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    invoke-direct {v0, v1}, Ljava/util/concurrent/ExecutionException;-><init>(Ljava/lang/Throwable;)V

    throw v0
    :try_end_46
    .catchall {:try_start_30 .. :try_end_46} :catchall_46

    :catchall_46
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static newFuture()Lcom/android/volley/toolbox/RequestFuture;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/android/volley/toolbox/RequestFuture<",
            "TE;>;"
        }
    .end annotation

    new-instance v0, Lcom/android/volley/toolbox/RequestFuture;

    invoke-direct {v0}, Lcom/android/volley/toolbox/RequestFuture;-><init>()V

    return-object v0
.end method


# virtual methods
.method public declared-synchronized cancel(Z)Z
    .registers 4

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mRequest:Lcom/android/volley/Request;
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_18

    const/4 v1, 0x0

    if-nez v0, :cond_8

    monitor-exit p0

    return v1

    :cond_8
    :try_start_8
    invoke-virtual {p0}, Lcom/android/volley/toolbox/RequestFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_16

    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->cancel()V
    :try_end_13
    .catchall {:try_start_8 .. :try_end_13} :catchall_18

    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_16
    monitor-exit p0

    return v1

    :catchall_18
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public get()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0, v0}, Lcom/android/volley/toolbox/RequestFuture;->doGet(Ljava/lang/Long;)Ljava/lang/Object;

    move-result-object v0
    :try_end_5
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_5} :catch_6

    return-object v0

    :catch_6
    move-exception v0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, p1, p2, p3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/volley/toolbox/RequestFuture;->doGet(Ljava/lang/Long;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isCancelled()Z
    .registers 2

    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mRequest:Lcom/android/volley/Request;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mRequest:Lcom/android/volley/Request;

    invoke-virtual {v0}, Lcom/android/volley/Request;->isCanceled()Z

    move-result v0

    return v0
.end method

.method public declared-synchronized isDone()Z
    .registers 2

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResultReceived:Z

    if-nez v0, :cond_12

    iget-object v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    if-nez v0, :cond_12

    invoke-virtual {p0}, Lcom/android/volley/toolbox/RequestFuture;->isCancelled()Z

    move-result v0
    :try_end_d
    .catchall {:try_start_1 .. :try_end_d} :catchall_15

    if-eqz v0, :cond_10

    goto :goto_12

    :cond_10
    const/4 v0, 0x0

    goto :goto_13

    :cond_12
    :goto_12
    const/4 v0, 0x1

    :goto_13
    monitor-exit p0

    return v0

    :catchall_15
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onErrorResponse(Lcom/android/volley/VolleyError;)V
    .registers 2

    monitor-enter p0

    :try_start_1
    iput-object p1, p0, Lcom/android/volley/toolbox/RequestFuture;->mException:Lcom/android/volley/VolleyError;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    monitor-exit p0

    return-void

    :catchall_8
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onResponse(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Lcom/android/volley/toolbox/RequestFuture;->mResultReceived:Z

    iput-object p1, p0, Lcom/android/volley/toolbox/RequestFuture;->mResult:Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V
    :try_end_9
    .catchall {:try_start_2 .. :try_end_9} :catchall_b

    monitor-exit p0

    return-void

    :catchall_b
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setRequest(Lcom/android/volley/Request;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request<",
            "*>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/volley/toolbox/RequestFuture;->mRequest:Lcom/android/volley/Request;

    return-void
.end method
