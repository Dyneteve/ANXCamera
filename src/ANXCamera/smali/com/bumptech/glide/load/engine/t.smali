.class Lcom/bumptech/glide/load/engine/t;
.super Ljava/lang/Object;
.source "SourceGenerator.java"

# interfaces
.implements Lcom/bumptech/glide/load/a/d$a;
.implements Lcom/bumptech/glide/load/engine/d;
.implements Lcom/bumptech/glide/load/engine/d$a;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/a/d$a<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/bumptech/glide/load/engine/d$a;",
        "Lcom/bumptech/glide/load/engine/d;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "SourceGenerator"


# instance fields
.field private final eG:Lcom/bumptech/glide/load/engine/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/e<",
            "*>;"
        }
    .end annotation
.end field

.field private final eH:Lcom/bumptech/glide/load/engine/d$a;

.field private volatile eM:Lcom/bumptech/glide/load/model/m$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/model/m$a<",
            "*>;"
        }
    .end annotation
.end field

.field private gZ:I

.field private ha:Lcom/bumptech/glide/load/engine/a;

.field private hb:Ljava/lang/Object;

.field private hc:Lcom/bumptech/glide/load/engine/b;


# direct methods
.method constructor <init>(Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V
    .locals 0
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

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    iput-object p2, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    return-void
.end method

.method private at()Z
    .locals 2

    iget v0, p0, Lcom/bumptech/glide/load/engine/t;->gZ:I

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->aF()Ljava/util/List;

    move-result-object v1

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

.method private m(Ljava/lang/Object;)V
    .locals 7

    invoke-static {}, Lcom/bumptech/glide/util/e;->eK()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v2, p1}, Lcom/bumptech/glide/load/engine/e;->d(Ljava/lang/Object;)Lcom/bumptech/glide/load/a;

    move-result-object v2

    new-instance v3, Lcom/bumptech/glide/load/engine/c;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->az()Lcom/bumptech/glide/load/f;

    move-result-object v4

    invoke-direct {v3, v2, p1, v4}, Lcom/bumptech/glide/load/engine/c;-><init>(Lcom/bumptech/glide/load/a;Ljava/lang/Object;Lcom/bumptech/glide/load/f;)V

    new-instance v4, Lcom/bumptech/glide/load/engine/b;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v5, v5, Lcom/bumptech/glide/load/model/m$a;->eJ:Lcom/bumptech/glide/load/c;

    iget-object v6, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v6}, Lcom/bumptech/glide/load/engine/e;->aA()Lcom/bumptech/glide/load/c;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/bumptech/glide/load/engine/b;-><init>(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/c;)V

    iput-object v4, p0, Lcom/bumptech/glide/load/engine/t;->hc:Lcom/bumptech/glide/load/engine/b;

    iget-object v4, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v4}, Lcom/bumptech/glide/load/engine/e;->aw()Lcom/bumptech/glide/load/engine/a/a;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/t;->hc:Lcom/bumptech/glide/load/engine/b;

    invoke-interface {v4, v5, v3}, Lcom/bumptech/glide/load/engine/a/a;->a(Lcom/bumptech/glide/load/c;Lcom/bumptech/glide/load/engine/a/a$b;)V

    const-string v3, "SourceGenerator"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "SourceGenerator"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Finished encoding source to cache, key: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/t;->hc:Lcom/bumptech/glide/load/engine/b;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v5, ", data: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", encoder: "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", duration: "

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0, v1}, Lcom/bumptech/glide/util/e;->f(J)D

    move-result-wide v0

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    iget-object p1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object p1, p1, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {p1}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    nop

    new-instance p1, Lcom/bumptech/glide/load/engine/a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->eJ:Lcom/bumptech/glide/load/c;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-direct {p1, v0, v1, p0}, Lcom/bumptech/glide/load/engine/a;-><init>(Ljava/util/List;Lcom/bumptech/glide/load/engine/e;Lcom/bumptech/glide/load/engine/d$a;)V

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t;->ha:Lcom/bumptech/glide/load/engine/a;

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cleanup()V

    throw p1
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Ljava/lang/Exception;",
            "Lcom/bumptech/glide/load/a/d<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            ")V"
        }
    .end annotation

    iget-object p4, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v0

    invoke-interface {p4, p1, p2, p3, v0}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V

    return-void
.end method

.method public a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/c;",
            "Ljava/lang/Object;",
            "Lcom/bumptech/glide/load/a/d<",
            "*>;",
            "Lcom/bumptech/glide/load/DataSource;",
            "Lcom/bumptech/glide/load/c;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object p4, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object p4, p4, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {p4}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v4

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p1

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V

    return-void
.end method

.method public as()Z
    .locals 5

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->hb:Ljava/lang/Object;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->hb:Ljava/lang/Object;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->hb:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/bumptech/glide/load/engine/t;->m(Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->ha:Lcom/bumptech/glide/load/engine/a;

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->ha:Lcom/bumptech/glide/load/engine/a;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/a;->as()Z

    move-result v0

    if-eqz v0, :cond_1

    return v2

    :cond_1
    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->ha:Lcom/bumptech/glide/load/engine/a;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    const/4 v0, 0x0

    :cond_2
    :goto_0
    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/t;->at()Z

    move-result v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->aF()Ljava/util/List;

    move-result-object v1

    iget v3, p0, Lcom/bumptech/glide/load/engine/t;->gZ:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/bumptech/glide/load/engine/t;->gZ:I

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/bumptech/glide/load/model/m$a;

    iput-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->ax()Lcom/bumptech/glide/load/engine/g;

    move-result-object v1

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v3, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v3}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/bumptech/glide/load/engine/g;->b(Lcom/bumptech/glide/load/DataSource;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v3, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v3}, Lcom/bumptech/glide/load/a/d;->aj()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/bumptech/glide/load/engine/e;->c(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_3
    nop

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v1}, Lcom/bumptech/glide/load/engine/e;->ay()Lcom/bumptech/glide/Priority;

    move-result-object v1

    invoke-interface {v0, v1, p0}, Lcom/bumptech/glide/load/a/d;->a(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/a/d$a;)V

    move v0, v2

    goto :goto_0

    :cond_4
    return v0
.end method

.method public av()V
    .locals 1

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public b(Ljava/lang/Exception;)V
    .locals 4
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->hc:Lcom/bumptech/glide/load/engine/b;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v2, v2, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    iget-object v3, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v3, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v3}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v3

    invoke-interface {v0, v1, p1, v2, v3}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Exception;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;)V

    return-void
.end method

.method public cancel()V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v0}, Lcom/bumptech/glide/load/a/d;->cancel()V

    :cond_0
    return-void
.end method

.method public k(Ljava/lang/Object;)V
    .locals 6

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eG:Lcom/bumptech/glide/load/engine/e;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/e;->ax()Lcom/bumptech/glide/load/engine/g;

    move-result-object v0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v1, v1, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v1}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/load/engine/g;->b(Lcom/bumptech/glide/load/DataSource;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/bumptech/glide/load/engine/t;->hb:Ljava/lang/Object;

    iget-object p1, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/d$a;->av()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/engine/t;->eH:Lcom/bumptech/glide/load/engine/d$a;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v1, v1, Lcom/bumptech/glide/load/model/m$a;->eJ:Lcom/bumptech/glide/load/c;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v3, v2, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    iget-object v2, p0, Lcom/bumptech/glide/load/engine/t;->eM:Lcom/bumptech/glide/load/model/m$a;

    iget-object v2, v2, Lcom/bumptech/glide/load/model/m$a;->jY:Lcom/bumptech/glide/load/a/d;

    invoke-interface {v2}, Lcom/bumptech/glide/load/a/d;->ak()Lcom/bumptech/glide/load/DataSource;

    move-result-object v4

    iget-object v5, p0, Lcom/bumptech/glide/load/engine/t;->hc:Lcom/bumptech/glide/load/engine/b;

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Lcom/bumptech/glide/load/engine/d$a;->a(Lcom/bumptech/glide/load/c;Ljava/lang/Object;Lcom/bumptech/glide/load/a/d;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/c;)V

    :goto_0
    return-void
.end method
