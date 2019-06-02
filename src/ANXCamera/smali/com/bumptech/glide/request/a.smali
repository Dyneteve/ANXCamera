.class public final Lcom/bumptech/glide/request/a;
.super Ljava/lang/Object;
.source "ErrorRequestCoordinator.java"

# interfaces
.implements Lcom/bumptech/glide/request/c;
.implements Lcom/bumptech/glide/request/d;


# instance fields
.field private final nG:Lcom/bumptech/glide/request/d;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nH:Lcom/bumptech/glide/request/c;

.field private nI:Lcom/bumptech/glide/request/c;


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/request/d;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    return-void
.end method

.method private dk()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->d(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private dl()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->f(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private dm()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {v0, p0}, Lcom/bumptech/glide/request/d;->e(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private do()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {v0}, Lcom/bumptech/glide/request/d;->dn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private g(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/request/c;Lcom/bumptech/glide/request/c;)V
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    iput-object p2, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    return-void
.end method

.method public begin()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->begin()V

    :cond_0
    return-void
.end method

.method public c(Lcom/bumptech/glide/request/c;)Z
    .locals 3

    instance-of v0, p1, Lcom/bumptech/glide/request/a;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Lcom/bumptech/glide/request/a;

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    iget-object v2, p1, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0, v2}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    iget-object p1, p1, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/request/c;->c(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    nop

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->clear()V

    :cond_0
    return-void
.end method

.method public d(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->dk()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public dj()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->dj()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public dn()Z
    .locals 1

    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->do()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/bumptech/glide/request/a;->dj()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public e(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->dm()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public f(Lcom/bumptech/glide/request/c;)Z
    .locals 1

    invoke-direct {p0}, Lcom/bumptech/glide/request/a;->dl()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/a;->g(Lcom/bumptech/glide/request/c;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public h(Lcom/bumptech/glide/request/c;)V
    .locals 0

    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->h(Lcom/bumptech/glide/request/c;)V

    :cond_0
    return-void
.end method

.method public i(Lcom/bumptech/glide/request/c;)V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {p1}, Lcom/bumptech/glide/request/c;->begin()V

    :cond_0
    return-void

    :cond_1
    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/bumptech/glide/request/a;->nG:Lcom/bumptech/glide/request/d;

    invoke-interface {p1, p0}, Lcom/bumptech/glide/request/d;->i(Lcom/bumptech/glide/request/c;)V

    :cond_2
    return-void
.end method

.method public isCancelled()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isCancelled()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isComplete()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isComplete()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isFailed()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPaused()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isPaused()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public isRunning()Z
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    :goto_0
    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public pause()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isFailed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->pause()V

    :cond_1
    return-void
.end method

.method public recycle()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nH:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    iget-object v0, p0, Lcom/bumptech/glide/request/a;->nI:Lcom/bumptech/glide/request/c;

    invoke-interface {v0}, Lcom/bumptech/glide/request/c;->recycle()V

    return-void
.end method
