.class Lcom/bumptech/glide/load/engine/k;
.super Ljava/lang/Object;
.source "EngineResource.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/k$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Z:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/engine/p<",
        "TZ;>;"
    }
.end annotation


# instance fields
.field private final fE:Z

.field private final fF:Lcom/bumptech/glide/load/engine/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;"
        }
    .end annotation
.end field

.field private fy:Lcom/bumptech/glide/load/engine/k$a;

.field private final hH:Z

.field private hI:I

.field private hJ:Z

.field private key:Lcom/bumptech/glide/load/c;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/p;ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;ZZ)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/p;

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    iput-boolean p2, p0, Lcom/bumptech/glide/load/engine/k;->fE:Z

    iput-boolean p3, p0, Lcom/bumptech/glide/load/engine/k;->hH:Z

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k$a;)V
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/k;->key:Lcom/bumptech/glide/load/c;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/k;->fy:Lcom/bumptech/glide/load/engine/k$a;

    return-void
.end method

.method acquire()V
    .locals 2

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/k;->hJ:Z

    if-nez v0, :cond_1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalThreadStateException;

    const-string v1, "Must call acquire on the main thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot acquire a recycled resource"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method bE()Lcom/bumptech/glide/load/engine/p;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    return-object v0
.end method

.method bF()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/k;->fE:Z

    return v0
.end method

.method public bG()Ljava/lang/Class;
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

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->bG()Ljava/lang/Class;

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

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSize()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->getSize()I

    move-result v0

    return v0
.end method

.method public recycle()V
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    if-gtz v0, :cond_2

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/k;->hJ:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/k;->hJ:Z

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/k;->hH:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot recycle a resource that has already been recycled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot recycle a resource while it is still acquired"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method release()V
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    if-lez v0, :cond_2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/k;->fy:Lcom/bumptech/glide/load/engine/k$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/k;->key:Lcom/bumptech/glide/load/c;

    invoke-interface {v0, v1, p0}, Lcom/bumptech/glide/load/engine/k$a;->b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/k;)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/IllegalThreadStateException;

    const-string v1, "Must call release on the main thread"

    invoke-direct {v0, v1}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot release a recycled or not yet acquired resource"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "EngineResource{isCacheable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/k;->fE:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", listener="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/k;->fy:Lcom/bumptech/glide/load/engine/k$a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/k;->key:Lcom/bumptech/glide/load/c;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", acquired="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/bumptech/glide/load/engine/k;->hI:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", isRecycled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/bumptech/glide/load/engine/k;->hJ:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", resource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/k;->fF:Lcom/bumptech/glide/load/engine/p;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
