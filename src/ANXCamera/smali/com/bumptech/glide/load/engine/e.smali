.class final Lcom/bumptech/glide/load/engine/e;
.super Ljava/lang/Object;
.source "DecodeHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Transcode:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private ap:Lcom/bumptech/glide/e;

.field private bs:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "TTranscode;>;"
        }
    .end annotation
.end field

.field private bv:Ljava/lang/Object;

.field private final eG:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/c;",
            ">;"
        }
    .end annotation
.end field

.field private eP:Lcom/bumptech/glide/load/c;

.field private eR:Lcom/bumptech/glide/load/f;

.field private final eS:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;>;"
        }
    .end annotation
.end field

.field private eT:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private eU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

.field private eV:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;"
        }
    .end annotation
.end field

.field private eW:Z

.field private eX:Z

.field private eY:Lcom/bumptech/glide/Priority;

.field private eZ:Lcom/bumptech/glide/load/engine/g;

.field private fa:Z

.field private fb:Z

.field private height:I

.field private width:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eS:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    return-void
.end method


# virtual methods
.method a(Lcom/bumptech/glide/e;Ljava/lang/Object;Lcom/bumptech/glide/load/c;IILcom/bumptech/glide/load/engine/g;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/f;Ljava/util/Map;ZZLcom/bumptech/glide/load/engine/DecodeJob$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/e;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/c;",
            "II",
            "Lcom/bumptech/glide/load/engine/g;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "TR;>;",
            "Lcom/bumptech/glide/Priority;",
            "Lcom/bumptech/glide/load/f;",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/bumptech/glide/load/i<",
            "*>;>;ZZ",
            "Lcom/bumptech/glide/load/engine/DecodeJob$d;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    iput-object p3, p0, Lcom/bumptech/glide/load/engine/e;->eP:Lcom/bumptech/glide/load/c;

    iput p4, p0, Lcom/bumptech/glide/load/engine/e;->width:I

    iput p5, p0, Lcom/bumptech/glide/load/engine/e;->height:I

    iput-object p6, p0, Lcom/bumptech/glide/load/engine/e;->eZ:Lcom/bumptech/glide/load/engine/g;

    iput-object p7, p0, Lcom/bumptech/glide/load/engine/e;->eT:Ljava/lang/Class;

    iput-object p14, p0, Lcom/bumptech/glide/load/engine/e;->eU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

    iput-object p8, p0, Lcom/bumptech/glide/load/engine/e;->bs:Ljava/lang/Class;

    iput-object p9, p0, Lcom/bumptech/glide/load/engine/e;->eY:Lcom/bumptech/glide/Priority;

    iput-object p10, p0, Lcom/bumptech/glide/load/engine/e;->eR:Lcom/bumptech/glide/load/f;

    iput-object p11, p0, Lcom/bumptech/glide/load/engine/e;->eV:Ljava/util/Map;

    iput-boolean p12, p0, Lcom/bumptech/glide/load/engine/e;->fa:Z

    iput-boolean p13, p0, Lcom/bumptech/glide/load/engine/e;->fb:Z

    return-void
.end method

.method a(Lcom/bumptech/glide/load/engine/p;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "*>;)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/Registry;->a(Lcom/bumptech/glide/load/engine/p;)Z

    move-result p1

    return p1
.end method

.method aA()Lcom/bumptech/glide/load/c;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eP:Lcom/bumptech/glide/load/c;

    return-object v0
.end method

.method aB()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->bs:Ljava/lang/Class;

    return-object v0
.end method

.method aC()Ljava/lang/Class;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    return-object v0
.end method

.method aD()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/e;->eT:Ljava/lang/Class;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/e;->bs:Ljava/lang/Class;

    invoke-virtual {v0, v1, v2, v3}, Lcom/bumptech/glide/Registry;->c(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method aE()Z
    .locals 1

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->fb:Z

    return v0
.end method

.method aF()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;>;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eW:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eW:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eS:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/Registry;->f(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/bumptech/glide/load/model/m;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    iget v5, p0, Lcom/bumptech/glide/load/engine/e;->width:I

    iget v6, p0, Lcom/bumptech/glide/load/engine/e;->height:I

    iget-object v7, p0, Lcom/bumptech/glide/load/engine/e;->eR:Lcom/bumptech/glide/load/f;

    invoke-interface {v3, v4, v5, v6, v7}, Lcom/bumptech/glide/load/model/m;->b(Ljava/lang/Object;IILcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/model/m$a;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/e;->eS:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eS:Ljava/util/List;

    return-object v0
.end method

.method aG()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/c;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eX:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eX:Z

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/e;->aF()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/load/model/m$a;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    iget-object v6, v4, Lcom/bumptech/glide/load/model/m$a;->eK:Lcom/bumptech/glide/load/c;

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    iget-object v6, v4, Lcom/bumptech/glide/load/model/m$a;->eK:Lcom/bumptech/glide/load/c;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    move v5, v2

    :goto_1
    iget-object v6, v4, Lcom/bumptech/glide/load/model/m$a;->jY:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_2

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    iget-object v7, v4, Lcom/bumptech/glide/load/model/m$a;->jY:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    iget-object v7, v4, Lcom/bumptech/glide/load/model/m$a;->jY:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    return-object v0
.end method

.method aw()Lcom/bumptech/glide/load/engine/a/a;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eU:Lcom/bumptech/glide/load/engine/DecodeJob$d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/engine/DecodeJob$d;->aw()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v0

    return-object v0
.end method

.method ax()Lcom/bumptech/glide/load/engine/g;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eZ:Lcom/bumptech/glide/load/engine/g;

    return-object v0
.end method

.method ay()Lcom/bumptech/glide/Priority;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eY:Lcom/bumptech/glide/Priority;

    return-object v0
.end method

.method az()Lcom/bumptech/glide/load/f;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eR:Lcom/bumptech/glide/load/f;

    return-object v0
.end method

.method b(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/h;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/bumptech/glide/load/engine/p<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/h<",
            "TZ;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/Registry;->b(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/h;

    move-result-object p1

    return-object p1
.end method

.method c(Lcom/bumptech/glide/load/c;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/e;->aF()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/bumptech/glide/load/model/m$a;

    iget-object v4, v4, Lcom/bumptech/glide/load/model/m$a;->eK:Lcom/bumptech/glide/load/c;

    invoke-interface {v4, p1}, Lcom/bumptech/glide/load/c;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method c(Ljava/lang/Class;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/load/engine/e;->d(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/n;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method clear()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->bv:Ljava/lang/Object;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eP:Lcom/bumptech/glide/load/c;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eT:Ljava/lang/Class;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->bs:Ljava/lang/Class;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eR:Lcom/bumptech/glide/load/f;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eY:Lcom/bumptech/glide/Priority;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eV:Ljava/util/Map;

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eZ:Lcom/bumptech/glide/load/engine/g;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eS:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eW:Z

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/e;->eG:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iput-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->eX:Z

    return-void
.end method

.method d(Ljava/lang/Object;)Lcom/bumptech/glide/load/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(TX;)",
            "Lcom/bumptech/glide/load/a<",
            "TX;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/Registry$NoSourceEncoderAvailableException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/Registry;->d(Ljava/lang/Object;)Lcom/bumptech/glide/load/a;

    move-result-object p1

    return-object p1
.end method

.method d(Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/n;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Data:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TData;>;)",
            "Lcom/bumptech/glide/load/engine/n<",
            "TData;*TTranscode;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/e;->eT:Ljava/lang/Class;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/e;->bs:Ljava/lang/Class;

    invoke-virtual {v0, p1, v1, v2}, Lcom/bumptech/glide/Registry;->a(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/n;

    move-result-object p1

    return-object p1
.end method

.method e(Ljava/lang/Class;)Lcom/bumptech/glide/load/i;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Z:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TZ;>;)",
            "Lcom/bumptech/glide/load/i<",
            "TZ;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eV:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/i;

    if-nez v0, :cond_1

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/e;->eV:Ljava/util/Map;

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

    check-cast v0, Lcom/bumptech/glide/load/i;

    goto :goto_1

    :cond_0
    goto :goto_0

    :cond_1
    :goto_1
    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->eV:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/bumptech/glide/load/engine/e;->fa:Z

    if-nez v0, :cond_2

    goto :goto_2

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missing transformation for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ". If you wish to ignore unknown resource types, use the optional transformation methods."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_2
    invoke-static {}, Lcom/bumptech/glide/load/resource/b;->cm()Lcom/bumptech/glide/load/resource/b;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v0
.end method

.method g(Ljava/io/File;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")",
            "Ljava/util/List<",
            "Lcom/bumptech/glide/load/model/m<",
            "Ljava/io/File;",
            "*>;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/bumptech/glide/Registry$NoModelLoaderAvailableException;
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->r()Lcom/bumptech/glide/Registry;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/Registry;->f(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method getHeight()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/load/engine/e;->height:I

    return v0
.end method

.method getWidth()I
    .locals 1

    iget v0, p0, Lcom/bumptech/glide/load/engine/e;->width:I

    return v0
.end method

.method l()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/e;->ap:Lcom/bumptech/glide/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/e;->l()Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    move-result-object v0

    return-object v0
.end method
