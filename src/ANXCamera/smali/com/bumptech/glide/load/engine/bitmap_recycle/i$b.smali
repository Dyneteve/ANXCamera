.class final Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;
.super Lcom/bumptech/glide/load/engine/bitmap_recycle/c;
.source "LruArrayPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/bumptech/glide/load/engine/bitmap_recycle/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/c<",
        "Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;",
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

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;->bt()Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;

    move-result-object v0

    return-object v0
.end method

.method protected bt()Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;
    .locals 1

    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;

    invoke-direct {v0, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;)V

    return-object v0
.end method

.method e(ILjava/lang/Class;)Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$b;->bp()Lcom/bumptech/glide/load/engine/bitmap_recycle/l;

    move-result-object v0

    check-cast v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;

    invoke-virtual {v0, p1, p2}, Lcom/bumptech/glide/load/engine/bitmap_recycle/i$a;->d(ILjava/lang/Class;)V

    return-object v0
.end method
