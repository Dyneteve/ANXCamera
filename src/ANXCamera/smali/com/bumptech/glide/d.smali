.class public final Lcom/bumptech/glide/d;
.super Ljava/lang/Object;
.source "GlideBuilder.java"


# instance fields
.field private aA:Lcom/bumptech/glide/load/engine/a/l;

.field private aB:Lcom/bumptech/glide/request/f;

.field private aC:Lcom/bumptech/glide/manager/l$a;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private aD:Lcom/bumptech/glide/load/engine/b/a;

.field private aE:Z

.field private al:Lcom/bumptech/glide/load/engine/Engine;

.field private am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private an:Lcom/bumptech/glide/load/engine/a/j;

.field private ar:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

.field private at:Lcom/bumptech/glide/manager/d;

.field private final aw:Ljava/util/Map;
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

.field private ax:Lcom/bumptech/glide/load/engine/b/a;

.field private ay:Lcom/bumptech/glide/load/engine/b/a;

.field private az:Lcom/bumptech/glide/load/engine/a/a$a;

.field private logLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/d;->aw:Ljava/util/Map;

    const/4 v0, 0x4

    iput v0, p0, Lcom/bumptech/glide/d;->logLevel:I

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/d;->aB:Lcom/bumptech/glide/request/f;

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/load/engine/Engine;)Lcom/bumptech/glide/d;
    .locals 0

    iput-object p1, p0, Lcom/bumptech/glide/d;->al:Lcom/bumptech/glide/load/engine/Engine;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/a$a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/a$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->az:Lcom/bumptech/glide/load/engine/a/a$a;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/j;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/j;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->an:Lcom/bumptech/glide/load/engine/a/j;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/l$a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/l$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/a/l$a;->bJ()Lcom/bumptech/glide/load/engine/a/l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/d;->a(Lcom/bumptech/glide/load/engine/a/l;)Lcom/bumptech/glide/d;

    move-result-object p1

    return-object p1
.end method

.method public a(Lcom/bumptech/glide/load/engine/a/l;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/a/l;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/d;->b(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;

    move-result-object p1

    return-object p1
.end method

.method public a(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->ar:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/bitmap_recycle/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/manager/d;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/d;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->at:Lcom/bumptech/glide/manager/d;

    return-object p0
.end method

.method public a(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/request/f;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->aB:Lcom/bumptech/glide/request/f;

    return-object p0
.end method

.method public a(Ljava/lang/Class;Lcom/bumptech/glide/j;)Lcom/bumptech/glide/d;
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/j;
        .annotation build Landroid/support/annotation/Nullable;
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
            "TT;>;",
            "Lcom/bumptech/glide/j<",
            "*TT;>;)",
            "Lcom/bumptech/glide/d;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/d;->aw:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method a(Lcom/bumptech/glide/manager/l$a;)V
    .locals 0
    .param p1    # Lcom/bumptech/glide/manager/l$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/bumptech/glide/d;->aC:Lcom/bumptech/glide/manager/l$a;

    return-void
.end method

.method public b(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->ax:Lcom/bumptech/glide/load/engine/b/a;

    return-object p0
.end method

.method public c(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->ay:Lcom/bumptech/glide/load/engine/b/a;

    return-object p0
.end method

.method public c(Z)Lcom/bumptech/glide/d;
    .locals 0
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-boolean p1, p0, Lcom/bumptech/glide/d;->aE:Z

    return-object p0
.end method

.method public d(Lcom/bumptech/glide/load/engine/b/a;)Lcom/bumptech/glide/d;
    .locals 0
    .param p1    # Lcom/bumptech/glide/load/engine/b/a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/d;->aD:Lcom/bumptech/glide/load/engine/b/a;

    return-object p0
.end method

.method public f(I)Lcom/bumptech/glide/d;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    const/4 v0, 0x2

    if-lt p1, v0, :cond_0

    const/4 v0, 0x6

    if-gt p1, v0, :cond_0

    iput p1, p0, Lcom/bumptech/glide/d;->logLevel:I

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Log level must be one of Log.VERBOSE, Log.DEBUG, Log.INFO, Log.WARN, or Log.ERROR"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method h(Landroid/content/Context;)Lcom/bumptech/glide/c;
    .locals 12
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v2, p0, Lcom/bumptech/glide/d;->ax:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_0

    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bO()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->ax:Lcom/bumptech/glide/load/engine/b/a;

    :cond_0
    iget-object v2, p0, Lcom/bumptech/glide/d;->ay:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_1

    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bN()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->ay:Lcom/bumptech/glide/load/engine/b/a;

    :cond_1
    iget-object v2, p0, Lcom/bumptech/glide/d;->aD:Lcom/bumptech/glide/load/engine/b/a;

    if-nez v2, :cond_2

    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bQ()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->aD:Lcom/bumptech/glide/load/engine/b/a;

    :cond_2
    iget-object v2, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    if-nez v2, :cond_3

    new-instance v2, Lcom/bumptech/glide/load/engine/a/l$a;

    invoke-direct {v2, p1}, Lcom/bumptech/glide/load/engine/a/l$a;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/a/l$a;->bJ()Lcom/bumptech/glide/load/engine/a/l;

    move-result-object v2

    iput-object v2, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    :cond_3
    iget-object v2, p0, Lcom/bumptech/glide/d;->at:Lcom/bumptech/glide/manager/d;

    if-nez v2, :cond_4

    new-instance v2, Lcom/bumptech/glide/manager/f;

    invoke-direct {v2}, Lcom/bumptech/glide/manager/f;-><init>()V

    iput-object v2, p0, Lcom/bumptech/glide/d;->at:Lcom/bumptech/glide/manager/d;

    :cond_4
    iget-object v2, p0, Lcom/bumptech/glide/d;->am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/a/l;->bH()I

    move-result v2

    if-lez v2, :cond_5

    new-instance v3, Lcom/bumptech/glide/load/engine/bitmap_recycle/j;

    int-to-long v4, v2

    invoke-direct {v3, v4, v5}, Lcom/bumptech/glide/load/engine/bitmap_recycle/j;-><init>(J)V

    iput-object v3, p0, Lcom/bumptech/glide/d;->am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    goto :goto_0

    :cond_5
    new-instance v2, Lcom/bumptech/glide/load/engine/bitmap_recycle/e;

    invoke-direct {v2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/e;-><init>()V

    iput-object v2, p0, Lcom/bumptech/glide/d;->am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    :cond_6
    :goto_0
    iget-object v2, p0, Lcom/bumptech/glide/d;->ar:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v2, :cond_7

    new-instance v2, Lcom/bumptech/glide/load/engine/bitmap_recycle/i;

    iget-object v3, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/a/l;->bI()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i;-><init>(I)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->ar:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    :cond_7
    iget-object v2, p0, Lcom/bumptech/glide/d;->an:Lcom/bumptech/glide/load/engine/a/j;

    if-nez v2, :cond_8

    new-instance v2, Lcom/bumptech/glide/load/engine/a/i;

    iget-object v3, p0, Lcom/bumptech/glide/d;->aA:Lcom/bumptech/glide/load/engine/a/l;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/a/l;->bG()I

    move-result v3

    int-to-long v3, v3

    invoke-direct {v2, v3, v4}, Lcom/bumptech/glide/load/engine/a/i;-><init>(J)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->an:Lcom/bumptech/glide/load/engine/a/j;

    :cond_8
    iget-object v2, p0, Lcom/bumptech/glide/d;->az:Lcom/bumptech/glide/load/engine/a/a$a;

    if-nez v2, :cond_9

    new-instance v2, Lcom/bumptech/glide/load/engine/a/h;

    invoke-direct {v2, p1}, Lcom/bumptech/glide/load/engine/a/h;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->az:Lcom/bumptech/glide/load/engine/a/a$a;

    :cond_9
    iget-object v2, p0, Lcom/bumptech/glide/d;->al:Lcom/bumptech/glide/load/engine/Engine;

    if-nez v2, :cond_a

    new-instance v2, Lcom/bumptech/glide/load/engine/Engine;

    iget-object v4, p0, Lcom/bumptech/glide/d;->an:Lcom/bumptech/glide/load/engine/a/j;

    iget-object v5, p0, Lcom/bumptech/glide/d;->az:Lcom/bumptech/glide/load/engine/a/a$a;

    iget-object v6, p0, Lcom/bumptech/glide/d;->ay:Lcom/bumptech/glide/load/engine/b/a;

    iget-object v7, p0, Lcom/bumptech/glide/d;->ax:Lcom/bumptech/glide/load/engine/b/a;

    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bP()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v8

    invoke-static {}, Lcom/bumptech/glide/load/engine/b/a;->bQ()Lcom/bumptech/glide/load/engine/b/a;

    move-result-object v9

    iget-boolean v10, p0, Lcom/bumptech/glide/d;->aE:Z

    move-object v3, v2

    invoke-direct/range {v3 .. v10}, Lcom/bumptech/glide/load/engine/Engine;-><init>(Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/a/a$a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Lcom/bumptech/glide/load/engine/b/a;Z)V

    iput-object v2, p0, Lcom/bumptech/glide/d;->al:Lcom/bumptech/glide/load/engine/Engine;

    :cond_a
    new-instance v6, Lcom/bumptech/glide/manager/l;

    iget-object v2, p0, Lcom/bumptech/glide/d;->aC:Lcom/bumptech/glide/manager/l$a;

    invoke-direct {v6, v2}, Lcom/bumptech/glide/manager/l;-><init>(Lcom/bumptech/glide/manager/l$a;)V

    new-instance v11, Lcom/bumptech/glide/c;

    iget-object v2, p0, Lcom/bumptech/glide/d;->al:Lcom/bumptech/glide/load/engine/Engine;

    iget-object v3, p0, Lcom/bumptech/glide/d;->an:Lcom/bumptech/glide/load/engine/a/j;

    iget-object v4, p0, Lcom/bumptech/glide/d;->am:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iget-object v5, p0, Lcom/bumptech/glide/d;->ar:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    iget-object v7, p0, Lcom/bumptech/glide/d;->at:Lcom/bumptech/glide/manager/d;

    iget v8, p0, Lcom/bumptech/glide/d;->logLevel:I

    iget-object v9, p0, Lcom/bumptech/glide/d;->aB:Lcom/bumptech/glide/request/f;

    invoke-virtual {v9}, Lcom/bumptech/glide/request/f;->dL()Lcom/bumptech/glide/request/f;

    move-result-object v9

    iget-object v10, p0, Lcom/bumptech/glide/d;->aw:Ljava/util/Map;

    move-object v0, v11

    move-object v1, p1

    invoke-direct/range {v0 .. v10}, Lcom/bumptech/glide/c;-><init>(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/load/engine/a/j;Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/manager/l;Lcom/bumptech/glide/manager/d;ILcom/bumptech/glide/request/f;Ljava/util/Map;)V

    return-object v11
.end method
