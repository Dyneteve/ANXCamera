.class Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;
.super Ljava/lang/Object;
.source "Engine.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "EngineJobFactory"
.end annotation


# instance fields
.field final aC:Lcom/bumptech/glide/load/engine/b/a;

.field final aw:Lcom/bumptech/glide/load/engine/b/a;

.field final ax:Lcom/bumptech/glide/load/engine/b/a;

.field final fe:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field final gk:Lcom/bumptech/glide/load/engine/b/a;

.field final gl:Lcom/bumptech/glide/load/engine/h;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;-><init>(Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;)V

    const/16 v1, 0x96

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/a/a;->a(ILcom/bumptech/glide/util/a/a$a;)Landroid/support/v4/util/Pools$Pool;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->fe:Landroid/support/v4/util/Pools$Pool;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->ax:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->aw:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->gk:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p4, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->aC:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p5, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->gl:Lcom/bumptech/glide/load/engine/h;

    return-void
.end method

.method private static a(Ljava/util/concurrent/ExecutorService;)V
    .locals 3

    nop

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-interface {p0, v1, v2, v0}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-interface {p0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {p0, v1, v2, v0}, Ljava/util/concurrent/ExecutorService;->awaitTermination(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Failed to shutdown"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_0
    nop

    return-void

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/c;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/c;",
            "ZZZZ)",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "TR;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->fe:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/EngineJob;

    invoke-static {v0}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/bumptech/glide/load/engine/EngineJob;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Lcom/bumptech/glide/load/engine/EngineJob;->init(Lcom/bumptech/glide/load/c;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object p1

    return-object p1
.end method

.method shutdown()V
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->ax:Lcom/bumptech/glide/load/engine/b/a;

    invoke-static {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->a(Ljava/util/concurrent/ExecutorService;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->aw:Lcom/bumptech/glide/load/engine/b/a;

    invoke-static {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->a(Ljava/util/concurrent/ExecutorService;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->gk:Lcom/bumptech/glide/load/engine/b/a;

    invoke-static {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->a(Ljava/util/concurrent/ExecutorService;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->aC:Lcom/bumptech/glide/load/engine/b/a;

    invoke-static {v0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->a(Ljava/util/concurrent/ExecutorService;)V

    return-void
.end method
