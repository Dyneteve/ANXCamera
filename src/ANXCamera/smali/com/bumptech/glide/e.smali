.class public Lcom/bumptech/glide/e;
.super Landroid/content/ContextWrapper;
.source "GlideContext.java"


# static fields
.field static final DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/j;
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/j<",
            "**>;"
        }
    .end annotation
.end field


# instance fields
.field private final bB:Lcom/bumptech/glide/request/f;

.field private final bF:Landroid/os/Handler;

.field private final bG:Lcom/bumptech/glide/request/target/i;

.field private final bl:Lcom/bumptech/glide/load/engine/Engine;

.field private final bq:Lcom/bumptech/glide/Registry;

.field private final br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

.field private final bw:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/j<",
            "**>;>;"
        }
    .end annotation
.end field

.field private final logLevel:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/bumptech/glide/b;

    invoke-direct {v0}, Lcom/bumptech/glide/b;-><init>()V

    sput-object v0, Lcom/bumptech/glide/e;->DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/j;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/Registry;Lcom/bumptech/glide/request/target/i;Lcom/bumptech/glide/request/f;Ljava/util/Map;Lcom/bumptech/glide/load/engine/Engine;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lcom/bumptech/glide/Registry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Lcom/bumptech/glide/request/target/i;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Ljava/util/Map;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p7    # Lcom/bumptech/glide/load/engine/Engine;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/b;",
            "Lcom/bumptech/glide/Registry;",
            "Lcom/bumptech/glide/request/target/i;",
            "Lcom/bumptech/glide/request/f;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/j<",
            "**>;>;",
            "Lcom/bumptech/glide/load/engine/Engine;",
            "I)V"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/bumptech/glide/e;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    iput-object p3, p0, Lcom/bumptech/glide/e;->bq:Lcom/bumptech/glide/Registry;

    iput-object p4, p0, Lcom/bumptech/glide/e;->bG:Lcom/bumptech/glide/request/target/i;

    iput-object p5, p0, Lcom/bumptech/glide/e;->bB:Lcom/bumptech/glide/request/f;

    iput-object p6, p0, Lcom/bumptech/glide/e;->bw:Ljava/util/Map;

    iput-object p7, p0, Lcom/bumptech/glide/e;->bl:Lcom/bumptech/glide/load/engine/Engine;

    iput p8, p0, Lcom/bumptech/glide/e;->logLevel:I

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/bumptech/glide/e;->bF:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public L()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    return-object v0
.end method

.method public R()Lcom/bumptech/glide/Registry;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->bq:Lcom/bumptech/glide/Registry;

    return-object v0
.end method

.method public S()Lcom/bumptech/glide/request/f;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/e;->bB:Lcom/bumptech/glide/request/f;

    return-object v0
.end method

.method public T()Landroid/os/Handler;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->bF:Landroid/os/Handler;

    return-object v0
.end method

.method public U()Lcom/bumptech/glide/load/engine/Engine;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->bl:Lcom/bumptech/glide/load/engine/Engine;

    return-object v0
.end method

.method public a(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/ViewTarget;
    .locals 1
    .param p1    # Landroid/widget/ImageView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/widget/ImageView;",
            "Ljava/lang/Class<",
            "TX;>;)",
            "Lcom/bumptech/glide/request/target/ViewTarget<",
            "Landroid/widget/ImageView;",
            "TX;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->bG:Lcom/bumptech/glide/request/target/i;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/request/target/i;->b(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/ViewTarget;

    move-result-object p1

    return-object p1
.end method

.method public b(Ljava/lang/Class;)Lcom/bumptech/glide/j;
    .locals 4
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/bumptech/glide/j<",
            "*TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/e;->bw:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/j;

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/e;->bw:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/j;

    :cond_0
    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    sget-object v0, Lcom/bumptech/glide/e;->DEFAULT_TRANSITION_OPTIONS:Lcom/bumptech/glide/j;

    :cond_2
    return-object v0
.end method

.method public getLogLevel()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/e;->logLevel:I

    return v0
.end method
