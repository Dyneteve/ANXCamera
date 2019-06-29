.class final Lcom/bumptech/glide/load/engine/m;
.super Ljava/lang/Object;
.source "Jobs.java"


# instance fields
.field private final hO:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final hP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/m;->hO:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/m;->hP:Ljava/util/Map;

    return-void
.end method

.method private g(Z)Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/m;->hP:Ljava/util/Map;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/m;->hO:Ljava/util/Map;

    :goto_0
    return-object p1
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/EngineJob;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/EngineJob;->bz()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/m;->g(Z)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method b(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/EngineJob;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;)V"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/bumptech/glide/load/engine/EngineJob;->bz()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/m;->g(Z)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method c(Lcom/bumptech/glide/load/c;Z)Lcom/bumptech/glide/load/engine/EngineJob;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Z)",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;"
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/bumptech/glide/load/engine/m;->g(Z)Ljava/util/Map;

    move-result-object p2

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/engine/EngineJob;

    return-object p1
.end method

.method getAll()Ljava/util/Map;
    .locals 1
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lcom/bumptech/glide/load/c;",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/m;->hO:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method
