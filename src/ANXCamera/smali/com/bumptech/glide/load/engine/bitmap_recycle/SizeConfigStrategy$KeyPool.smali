.class Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool;
.super Lcom/bumptech/glide/load/engine/bitmap_recycle/c;
.source "SizeConfigStrategy.java"


# annotations
.annotation build Landroid/support/annotation/VisibleForTesting;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "KeyPool"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/c<",
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;",
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
.method protected synthetic bP()Lcom/bumptech/glide/load/engine/bitmap_recycle/l;
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool;->bY()Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;

    move-result-object v0

    return-object v0
.end method

.method protected bY()Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;
    .locals 1

    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool;)V

    return-object v0
.end method

.method public d(ILandroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;
    .locals 1

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool;->bQ()Lcom/bumptech/glide/load/engine/bitmap_recycle/l;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;->c(ILandroid/graphics/Bitmap$Config;)V

    return-object v0
.end method
