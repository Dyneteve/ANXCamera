.class public final Lcom/bumptech/glide/load/resource/gif/a;
.super Ljava/lang/Object;
.source "GifBitmapProvider.java"

# interfaces
.implements Lcom/bumptech/glide/b/a$a;


# instance fields
.field private final bm:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

.field private final br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/bumptech/glide/load/resource/gif/a;-><init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V

    return-void
.end method

.method public constructor <init>(Lcom/bumptech/glide/load/engine/bitmap_recycle/d;Lcom/bumptech/glide/load/engine/bitmap_recycle/b;)V
    .locals 0
    .param p2    # Lcom/bumptech/glide/load/engine/bitmap_recycle/b;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/gif/a;->bm:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    iput-object p2, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    return-void
.end method


# virtual methods
.method public a(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 1
    .param p3    # Landroid/graphics/Bitmap$Config;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->bm:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-interface {v0, p1, p2, p3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->g(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public b([I)V
    .locals 1
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    return-void
.end method

.method public c(Landroid/graphics/Bitmap;)V
    .locals 1
    .param p1    # Landroid/graphics/Bitmap;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->bm:Lcom/bumptech/glide/load/engine/bitmap_recycle/d;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/d;->d(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public c([B)V
    .locals 1
    .param p1    # [B
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->put(Ljava/lang/Object;)V

    return-void
.end method

.method public q(I)[B
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v0, :cond_0

    new-array p1, p1, [B

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    const-class v1, [B

    invoke-interface {v0, p1, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->a(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    return-object p1
.end method

.method public r(I)[I
    .locals 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    if-nez v0, :cond_0

    new-array p1, p1, [I

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/bumptech/glide/load/resource/gif/a;->br:Lcom/bumptech/glide/load/engine/bitmap_recycle/b;

    const-class v1, [I

    invoke-interface {v0, p1, v1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/b;->a(ILjava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [I

    return-object p1
.end method
