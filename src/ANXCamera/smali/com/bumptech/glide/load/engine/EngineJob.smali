.class Lcom/bumptech/glide/load/engine/EngineJob;
.super Ljava/lang/Object;
.source "EngineJob.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/DecodeJob$a;
.implements Lcom/bumptech/glide/util/a/a$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/EngineJob$a;,
        Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/DecodeJob$a<",
        "TR;>;",
        "Lcom/bumptech/glide/util/a/a$c;"
    }
.end annotation


# static fields
.field private static final gq:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

.field private static final gr:Landroid/os/Handler;

.field private static final gs:I = 0x1

.field private static final gt:I = 0x2

.field private static final gu:I = 0x3


# instance fields
.field private final aB:Lcom/bumptech/glide/load/engine/b/a;

.field private final av:Lcom/bumptech/glide/load/engine/b/a;

.field private final aw:Lcom/bumptech/glide/load/engine/b/a;

.field private dataSource:Lcom/bumptech/glide/load/DataSource;

.field private eC:Z

.field private eD:Lcom/bumptech/glide/load/engine/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;"
        }
    .end annotation
.end field

.field private volatile ea:Z

.field private final fc:Lcom/bumptech/glide/util/a/c;

.field private final fd:Landroid/support/v4/util/Pools$Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field private fl:Z

.field private gA:Lcom/bumptech/glide/load/engine/GlideException;

.field private gB:Z

.field private gC:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/g;",
            ">;"
        }
    .end annotation
.end field

.field private gD:Lcom/bumptech/glide/load/engine/k;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/k<",
            "*>;"
        }
    .end annotation
.end field

.field private gE:Lcom/bumptech/glide/load/engine/DecodeJob;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "TR;>;"
        }
    .end annotation
.end field

.field private final gj:Lcom/bumptech/glide/load/engine/b/a;

.field private final gk:Lcom/bumptech/glide/load/engine/h;

.field private final gv:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/request/g;",
            ">;"
        }
    .end annotation
.end field

.field private final gw:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

.field private gx:Z

.field private gy:Z

.field private gz:Z

.field private key:Lcom/bumptech/glide/load/c;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;-><init>()V

    sput-object v0, Lcom/bumptech/glide/load/engine/EngineJob;->gq:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/load/engine/EngineJob$a;

    invoke-direct {v2}, Lcom/bumptech/glide/load/engine/EngineJob$a;-><init>()V

    invoke-direct {v0, v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    sput-object v0, Lcom/bumptech/glide/load/engine/EngineJob;->gr:Landroid/os/Handler;

    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;Landroid/support/v4/util/Pools$Pool;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/h;",
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;)V"
        }
    .end annotation

    sget-object v7, Lcom/bumptech/glide/load/engine/EngineJob;->gq:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/bumptech/glide/load/engine/EngineJob;-><init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;Landroid/support/v4/util/Pools$Pool;Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;)V

    return-void
.end method

.method constructor <init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;Landroid/support/v4/util/Pools$Pool;Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;)V
    .locals 2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/b/a;",
            "Lcom/bumptech/glide/load/engine/h;",
            "Landroid/support/v4/util/Pools$Pool<",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;",
            "Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-static {}, Lcom/bumptech/glide/util/a/c;->eS()Lcom/bumptech/glide/util/a/c;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->aw:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->av:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gj:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->aB:Lcom/bumptech/glide/load/engine/b/a;

    iput-object p5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gk:Lcom/bumptech/glide/load/engine/h;

    iput-object p6, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fd:Landroid/support/v4/util/Pools$Pool;

    iput-object p7, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gw:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    return-void
.end method

.method private aZ()Lcom/bumptech/glide/load/engine/b/a;
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gx:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gj:Lcom/bumptech/glide/load/engine/b/a;

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gy:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->aB:Lcom/bumptech/glide/load/engine/b/a;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->av:Lcom/bumptech/glide/load/engine/b/a;

    :goto_0
    return-object v0
.end method

.method private c(Lcom/bumptech/glide/request/g;)V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method private d(Lcom/bumptech/glide/request/g;)Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private release(Z)V
    .locals 2

    invoke-static {}, Lcom/bumptech/glide/util/k;->eL()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eD:Lcom/bumptech/glide/load/engine/p;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gC:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    iput-boolean v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gE:Lcom/bumptech/glide/load/engine/DecodeJob;

    invoke-virtual {v1, p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->release(Z)V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gE:Lcom/bumptech/glide/load/engine/DecodeJob;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gA:Lcom/bumptech/glide/load/engine/GlideException;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fd:Landroid/support/v4/util/Pools$Pool;

    invoke-interface {p1, p0}, Landroid/support/v4/util/Pools$Pool;->release(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/GlideException;)V
    .locals 1

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gA:Lcom/bumptech/glide/load/engine/GlideException;

    sget-object p1, Lcom/bumptech/glide/load/engine/EngineJob;->gr:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method a(Lcom/bumptech/glide/request/g;)V
    .locals 2

    invoke-static {}, Lcom/bumptech/glide/util/k;->eL()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {p1, v0, v1}, Lcom/bumptech/glide/request/g;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gA:Lcom/bumptech/glide/load/engine/GlideException;

    invoke-interface {p1, v0}, Lcom/bumptech/glide/request/g;->a(Lcom/bumptech/glide/load/engine/GlideException;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method public aQ()Lcom/bumptech/glide/util/a/c;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    return-object v0
.end method

.method aY()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fl:Z

    return v0
.end method

.method public b(Lcom/bumptech/glide/load/engine/DecodeJob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "*>;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/EngineJob;->aZ()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/b/a;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method b(Lcom/bumptech/glide/request/g;)V
    .locals 1

    invoke-static {}, Lcom/bumptech/glide/util/k;->eL()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/EngineJob;->cancel()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/bumptech/glide/load/engine/EngineJob;->c(Lcom/bumptech/glide/request/g;)V

    :cond_2
    :goto_1
    return-void
.end method

.method ba()V
    .locals 6

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eD:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    invoke-direct {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gw:Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eD:Lcom/bumptech/glide/load/engine/p;

    iget-boolean v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eC:Z

    invoke-virtual {v0, v2, v3}, Lcom/bumptech/glide/load/engine/EngineJob$EngineResourceFactory;->a(Lcom/bumptech/glide/load/engine/p;Z)Lcom/bumptech/glide/load/engine/k;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/k;->acquire()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gk:Lcom/bumptech/glide/load/engine/h;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    invoke-interface {v0, p0, v2, v3}, Lcom/bumptech/glide/load/engine/h;->a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_2

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/request/g;

    invoke-direct {p0, v3}, Lcom/bumptech/glide/load/engine/EngineJob;->d(Lcom/bumptech/glide/request/g;)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/k;->acquire()V

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v3, v4, v5}, Lcom/bumptech/glide/request/g;->c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gD:Lcom/bumptech/glide/load/engine/k;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/k;->release()V

    invoke-direct {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    return-void

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already have resource"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Received a resource without any callbacks to notify"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method bb()V
    .locals 2

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gk:Lcom/bumptech/glide/load/engine/h;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    invoke-interface {v0, p0, v1}, Lcom/bumptech/glide/load/engine/h;->a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not cancelled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method bc()V
    .locals 4

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fc:Lcom/bumptech/glide/util/a/c;

    invoke-virtual {v0}, Lcom/bumptech/glide/util/a/c;->eT()V

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gk:Lcom/bumptech/glide/load/engine/h;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    const/4 v3, 0x0

    invoke-interface {v0, p0, v2, v3}, Lcom/bumptech/glide/load/engine/h;->a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gv:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/bumptech/glide/request/g;

    invoke-direct {p0, v2}, Lcom/bumptech/glide/load/engine/EngineJob;->d(Lcom/bumptech/glide/request/g;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gA:Lcom/bumptech/glide/load/engine/GlideException;

    invoke-interface {v2, v3}, Lcom/bumptech/glide/request/g;->a(Lcom/bumptech/glide/load/engine/GlideException;)V

    :cond_1
    goto :goto_0

    :cond_2
    invoke-direct {p0, v1}, Lcom/bumptech/glide/load/engine/EngineJob;->release(Z)V

    return-void

    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already failed once"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Received an exception without any callbacks to notify"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public c(Lcom/bumptech/glide/load/engine/DecodeJob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/DecodeJob<",
            "TR;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gE:Lcom/bumptech/glide/load/engine/DecodeJob;

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/DecodeJob;->aH()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->aw:Lcom/bumptech/glide/load/engine/b/a;

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/EngineJob;->aZ()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v0

    :goto_0
    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/b/a;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public c(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/DataSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TR;>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eD:Lcom/bumptech/glide/load/engine/p;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->dataSource:Lcom/bumptech/glide/load/DataSource;

    sget-object p1, Lcom/bumptech/glide/load/engine/EngineJob;->gr:Landroid/os/Handler;

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method cancel()V
    .locals 2

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gB:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gz:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gE:Lcom/bumptech/glide/load/engine/DecodeJob;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/DecodeJob;->cancel()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gk:Lcom/bumptech/glide/load/engine/h;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    invoke-interface {v0, p0, v1}, Lcom/bumptech/glide/load/engine/h;->a(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/c;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method init(Lcom/bumptech/glide/load/c;ZZZZ)Lcom/bumptech/glide/load/engine/EngineJob;
    .locals 0
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "ZZZZ)",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "TR;>;"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/EngineJob;->key:Lcom/bumptech/glide/load/c;

    iput-boolean p2, p0, Lcom/bumptech/glide/load/engine/EngineJob;->eC:Z

    iput-boolean p3, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gx:Z

    iput-boolean p4, p0, Lcom/bumptech/glide/load/engine/EngineJob;->gy:Z

    iput-boolean p5, p0, Lcom/bumptech/glide/load/engine/EngineJob;->fl:Z

    return-object p0
.end method

.method isCancelled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/EngineJob;->ea:Z

    return v0
.end method
