.class Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;
.super Ljava/lang/Object;
.source "Engine.java"

# interfaces
.implements Lcom/bumptech/glide/util/a/a$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/util/a/a$a<",
        "Lcom/bumptech/glide/load/engine/EngineJob<",
        "*>;>;"
    }
.end annotation


# instance fields
.field final synthetic hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;)V
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public by()Lcom/bumptech/glide/load/engine/EngineJob;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/bumptech/glide/load/engine/EngineJob<",
            "*>;"
        }
    .end annotation

    new-instance v7, Lcom/bumptech/glide/load/engine/EngineJob;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v1, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->by:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v2, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->bx:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v3, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->hl:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v4, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->bD:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v5, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->hm:Lcom/bumptech/glide/load/engine/h;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->hn:Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;

    iget-object v6, v0, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory;->gf:Landroid/support/v4/util/Pools$Pool;

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/bumptech/glide/load/engine/EngineJob;-><init>(Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/h;Landroid/support/v4/util/Pools$Pool;)V

    return-object v7
.end method

.method public synthetic create()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/Engine$EngineJobFactory$1;->by()Lcom/bumptech/glide/load/engine/EngineJob;

    move-result-object v0

    return-object v0
.end method
