.class Lcom/bumptech/glide/load/engine/a;
.super Ljava/lang/Object;
.source "DataCacheGenerator.java"

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
.field private final eF:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/c;",
            ">;"
        }
    .end annotation
.end field

.field private final eG:Lcom/bumptech/glide/load/engine/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;"
        }
    .end annotation
.end field

.field private final eH:Lcom/bumptech/glide/load/engine/d$a;

.field private eI:I

.field private eJ:Lcom/bumptech/glide/load/c;

.field private eK:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/io/File;",
            "*>;>;"
        }
    .end annotation
.end field

.field private eL:I

.field private volatile eM:Lcom/bumptech/glide/load/model/m$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;"
        }
    .end annotation
.end field

.field private eN:Ljava/io/File;


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

    invoke-virtual {p1}, Lcom/bumptech/glide/load/engine/e;->aG()Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/bumptech/glide/load/engine/a;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V

    return-void
.end method

.method constructor <init>(Ljava/util/List;Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/c;",
            ">;",
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;",
            "Lcom/bumptech/glide/load/engine/d$a;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/bumptech/glide/load/engine/a;->eI:I

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/a;->eF:Ljava/util/List;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/a;->eH:Lcom/bumptech/glide/load/engine/d$a;

    return-void
.end method

.method private at()Z
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/load/engine/a;->eL:I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eK:Ljava/util/List;

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
.method public as()Z
    .locals 7

    :goto_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eK:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a;->at()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    nop

    :goto_1
    if-nez v2, :cond_2

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/a;->at()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eK:Ljava/util/List;

    iget v3, p0, Lcom/bumptech/glide/load/engine/a;->eL:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/bumptech/glide/load/engine/a;->eL:I

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/model/m;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/a;->eN:Ljava/io/File;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v5}, Lcom/bumptech/glide/load/engine/e;->getHeight()I

    move-result v5

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/e;->az()Lcom/bumptech/glide/load/f;

    move-result-object v6

    invoke-interface {v0, v3, v4, v5, v6}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v3, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v3}, Lcom/bumptech/glide/load/a/d;->aj()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/bumptech/glide/load/engine/e;->c(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    nop

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v2}, Lcom/bumptech/glide/load/engine/e;->ay()Lcom/bumptech/glide/Priority;

    move-result-object v2

    invoke-interface {v0, v2, p0}, Lcom/bumptech/glide/load/a/d;->a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V

    move v2, v1

    :cond_1
    goto :goto_1

    :cond_2
    return v2

    :cond_3
    :goto_2
    iget v0, p0, Lcom/bumptech/glide/load/engine/a;->eI:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/bumptech/glide/load/engine/a;->eI:I

    iget v0, p0, Lcom/bumptech/glide/load/engine/a;->eI:I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eF:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_4

    return v2

    :cond_4
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eF:Ljava/util/List;

    iget v1, p0, Lcom/bumptech/glide/load/engine/a;->eI:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/c;

    new-instance v1, Lcom/bumptech/glide/load/engine/b;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/e;->aA()Lcom/bumptech/glide/load/c;

    move-result-object v3

    invoke-direct {v1, v0, v3}, Lcom/bumptech/glide/load/engine/b;-><init>(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;)V

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v3}, Lcom/bumptech/glide/load/engine/e;->aw()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v3

    invoke-interface {v3, v1}, Lcom/bumptech/glide/load/engine/a/a;->e(Lcom/bumptech/glide/load/c;)Ljava/io/File;

    move-result-object v1

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eN:Ljava/io/File;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eN:Ljava/io/File;

    if-eqz v1, :cond_5

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eJ:Lcom/bumptech/glide/load/c;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eG:Lcom/bumptech/glide/load/engine/e;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eN:Ljava/io/File;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/e;->g(Ljava/io/File;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eK:Ljava/util/List;

    iput v2, p0, Lcom/bumptech/glide/load/engine/a;->eL:I

    :cond_5
    goto/16 :goto_0
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 4
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eJ:Lcom/bumptech/glide/load/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v2, v2, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    sget-object v3, Lcom/bumptech/glide/load/DataSource;->df:Lcom/bumptech/glide/load/DataSource;

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V

    return-void
.end method

.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cancel()V

    :cond_0
    return-void
.end method

.method public k(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/a;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/a;->eJ:Lcom/bumptech/glide/load/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/a;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v2, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    sget-object v4, Lcom/bumptech/glide/load/DataSource;->df:Lcom/bumptech/glide/load/DataSource;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/a;->eJ:Lcom/bumptech/glide/load/c;

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V

    return-void
.end method
