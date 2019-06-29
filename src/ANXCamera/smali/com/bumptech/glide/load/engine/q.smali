.class Lcom/bumptech/glide/load/engine/q;
.super Ljava/lang/Object;
.source "ResourceCacheGenerator.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/d$a;
.implements Lcom/bumptech/glide/load/engine/d;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/d$a<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/bumptech/glide/load/engine/d;"
    }
.end annotation


# instance fields
.field private final fH:Lcom/bumptech/glide/load/engine/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;"
        }
    .end annotation
.end field

.field private final fI:Lcom/bumptech/glide/load/engine/d$a;

.field private fJ:I

.field private fK:Lcom/bumptech/glide/load/c;

.field private fL:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/io/File;",
            "*>;>;"
        }
    .end annotation
.end field

.field private fM:I

.field private volatile fN:Lcom/bumptech/glide/load/model/m$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;"
        }
    .end annotation
.end field

.field private fO:Ljava/io/File;

.field private hT:I

.field private hU:Lcom/bumptech/glide/load/engine/r;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;",
            "Lcom/bumptech/glide/load/engine/d$a;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/q;->fI:Lcom/bumptech/glide/load/engine/d$a;

    return-void
.end method

.method private aT()Z
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/load/engine/q;->fM:I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fL:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public aS()Z
    .locals 14

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/e;->bg()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    return v2

    :cond_0
    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->bd()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    const-class v3, Ljava/io/File;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->bb()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    return v2

    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->fL:Ljava/util/List;

    const/4 v4, 0x1

    if-eqz v3, :cond_5

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->aT()Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    nop

    :goto_1
    if-nez v2, :cond_4

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/q;->aT()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fL:Ljava/util/List;

    iget v1, p0, Lcom/bumptech/glide/load/engine/q;->fM:I

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->fM:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/model/m;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fO:Ljava/io/File;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/e;->getWidth()I

    move-result v3

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v5}, Lcom/bumptech/glide/load/engine/e;->getHeight()I

    move-result v5

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/e;->aZ()Lcom/bumptech/glide/load/f;

    move-result-object v6

    invoke-interface {v0, v1, v3, v5, v6}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    iget-object v1, v1, Lcom/bumptech/glide/load/model/m$a;->kZ:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v1}, Lcom/bumptech/glide/load/a/d;->aJ()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/e;->d(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    nop

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->kZ:Lcom/bumptech/glide/load/a/d;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->aY()Lcom/bumptech/glide/Priority;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/bumptech/glide/load/a/d;->a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V

    move v2, v4

    :cond_3
    goto :goto_1

    :cond_4
    return v2

    :cond_5
    :goto_2
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lt v3, v5, :cond_7

    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->fJ:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/bumptech/glide/load/engine/q;->fJ:I

    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->fJ:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-lt v3, v4, :cond_6

    return v2

    :cond_6
    iput v2, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    :cond_7
    iget v3, p0, Lcom/bumptech/glide/load/engine/q;->fJ:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/load/c;

    iget v4, p0, Lcom/bumptech/glide/load/engine/q;->hT:I

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Ljava/lang/Class;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4, v11}, Lcom/bumptech/glide/load/engine/e;->f(Ljava/lang/Class;)Lcom/bumptech/glide/load/i;

    move-result-object v10

    new-instance v13, Lcom/bumptech/glide/load/engine/r;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->L()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    move-result-object v5

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->ba()Lcom/bumptech/glide/load/c;

    move-result-object v7

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->getWidth()I

    move-result v8

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->getHeight()I

    move-result v9

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->aZ()Lcom/bumptech/glide/load/f;

    move-result-object v12

    move-object v4, v13

    move-object v6, v3

    invoke-direct/range {v4 .. v12}, Lcom/bumptech/glide/load/engine/r;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/b;Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;IILcom/bumptech/glide/load/i;Ljava/lang/Class;Lcom/bumptech/glide/load/f;)V

    iput-object v13, p0, Lcom/bumptech/glide/load/engine/q;->hU:Lcom/bumptech/glide/load/engine/r;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->aW()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->hU:Lcom/bumptech/glide/load/engine/r;

    invoke-interface {v4, v5}, Lcom/bumptech/glide/load/engine/a/a;->e(Lcom/bumptech/glide/load/c;)Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fO:Ljava/io/File;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fO:Ljava/io/File;

    if-eqz v4, :cond_8

    iput-object v3, p0, Lcom/bumptech/glide/load/engine/q;->fK:Lcom/bumptech/glide/load/c;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/q;->fH:Lcom/bumptech/glide/load/engine/e;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/q;->fO:Ljava/io/File;

    invoke-virtual {v3, v4}, Lcom/bumptech/glide/load/engine/e;->g(Ljava/io/File;)Ljava/util/List;

    move-result-object v3

    iput-object v3, p0, Lcom/bumptech/glide/load/engine/q;->fL:Ljava/util/List;

    iput v2, p0, Lcom/bumptech/glide/load/engine/q;->fM:I

    :cond_8
    goto/16 :goto_0
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 4
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fI:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->hU:Lcom/bumptech/glide/load/engine/r;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    iget-object v2, v2, Lcom/bumptech/glide/load/model/m$a;->kZ:Lcom/bumptech/glide/load/a/d;

    sget-object v3, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V

    return-void
.end method

.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->kZ:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cancel()V

    :cond_0
    return-void
.end method

.method public n(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/q;->fI:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/q;->fK:Lcom/bumptech/glide/load/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/q;->fN:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v2, Lcom/bumptech/glide/load/model/m$a;->kZ:Lcom/bumptech/glide/load/a/d;

    sget-object v4, Lcom/bumptech/glide/load/DataSource;->ek:Lcom/bumptech/glide/load/DataSource;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/q;->hU:Lcom/bumptech/glide/load/engine/r;

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V

    return-void
.end method
