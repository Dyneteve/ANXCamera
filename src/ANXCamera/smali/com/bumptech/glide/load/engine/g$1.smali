.class Lcom/bumptech/glide/load/engine/g$1;
.super Lcom/bumptech/glide/load/engine/g;
.source "DiskCacheStrategy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/g;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z
    .locals 0

    sget-object p1, Lcom/bumptech/glide/load/DataSource;->dg:Lcom/bumptech/glide/load/DataSource;

    if-eq p2, p1, :cond_0

    sget-object p1, Lcom/bumptech/glide/load/DataSource;->dh:Lcom/bumptech/glide/load/DataSource;

    if-eq p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public aU()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public aV()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public b(Lcom/bumptech/glide/load/DataSource;)Z
    .locals 1

    sget-object v0, Lcom/bumptech/glide/load/DataSource;->de:Lcom/bumptech/glide/load/DataSource;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
