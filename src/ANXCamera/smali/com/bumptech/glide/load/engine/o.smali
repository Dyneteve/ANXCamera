.class final Lcom/bumptech/glide/load/engine/o;
.super Ljava/lang/Object;
.source "LockedResource.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/p;
.implements Lcom/bumptech/glide/util/a/a$c;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/p<",
        "TZ;>;",
        "Lcom/bumptech/glide/util/a/a$c;"
    }
.end annotation


# static fields
.field private static final gQ:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/o<",
            "*>;>;"
        }
    .end annotation
.end field


# instance fields
.field private final fd:Lcom/bumptech/glide/util/a/c;

.field private gI:Z

.field private gR:Lcom/bumptech/glide/load/engine/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;"
        }
    .end annotation
.end field

.field private isLocked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/bumptech/glide/load/engine/o$1;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/o$1;-><init>()V

    const/16 v1, 0x14

    invoke-static {v1, v0}, Lcom/bumptech/glide/util/a/a;->b(ILcom/bumptech/glide/util/a/a$a;)Landroid/support/v4/util/Pools$Pool;

    move-result-object v0

    sput-object v0, Lcom/bumptech/glide/load/engine/o;->gQ:Landroid/support/v4/util/Pools$Pool;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/bumptech/glide/util/a/c;->eS()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/o;->fd:Lcom/bumptech/glide/util/a/c;

    return-void
.end method

.method static f(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/o;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/engine/o<",
            "TZ;>;"
        }
    .end annotation

    sget-object v0, Lcom/bumptech/glide/load/engine/o;->gQ:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0}, Landroid/support/v4/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/o;

    invoke-static {v0}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/o;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/o;->g(Lcom/bumptech/glide/load/engine/p;)V

    return-object v0
.end method

.method private g(Lcom/bumptech/glide/load/engine/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->gI:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    return-void
.end method

.method private release()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    sget-object v0, Lcom/bumptech/glide/load/engine/o;->gQ:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {v0, p0}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public aQ()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->fd:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

.method public bf()Ljava/lang/Class;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "TZ;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->bf()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/lang/Object;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TZ;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->getSize()I

    move-result v0

    return v0
.end method

.method public declared-synchronized recycle()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->fd:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->gI:Z

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->gR:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/o;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized unlock()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/o;->fd:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->isLocked:Z

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/o;->gI:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/o;->recycle()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already unlocked"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
