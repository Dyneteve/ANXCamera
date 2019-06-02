.class Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;
.super Lcom/bumptech/glide/load/engine/bitmap_recycle/c;
.source "SizeStrategy.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "KeyPool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/c<",
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/c;-><init>()V

    return-void
.end method


# virtual methods
.method protected synthetic bo()Lcom/bumptech/glide/load/engine/bitmap_recycle/l;
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;->by()Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    move-result-object v0

    return-object v0
.end method

.method protected by()Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;
    .locals 1

    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool;)V

    return-object v0
.end method

.method public v(I)Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;
    .locals 1

    invoke-super {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/c;->bp()Lcom/bumptech/glide/load/engine/bitmap_recycle/l;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    invoke-virtual {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;->init(I)V

    return-object v0
.end method
