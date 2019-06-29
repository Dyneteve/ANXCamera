.class public Lcom/bumptech/glide/load/resource/bitmap/d;
.super Ljava/lang/Object;
.source "BitmapDrawableTransformation.java"

# interfaces
.implements Lcom/bumptech/glide/load/i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/i<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private final lB:Lcom/bumptech/glide/load/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/bumptech/glide/load/i;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/i<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/load/resource/bitmap/p;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/bumptech/glide/load/resource/bitmap/p;-><init>(Lcom/bumptech/glide/load/i;Z)V

    invoke-static {v0}, Lcom/bumptech/glide/util/i;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/bumptech/glide/load/i;

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    return-void
.end method

.method private static j(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/Drawable;",
            ">;)",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Wrapped transformation unexpectedly returned a non BitmapDrawable resource: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {p0}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static k(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;)",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/bumptech/glide/load/resource/bitmap/d;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/bumptech/glide/load/resource/bitmap/d;

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    iget-object p1, p1, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method public transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/p;II)Lcom/bumptech/glide/load/engine/p;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;II)",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/drawable/BitmapDrawable;",
            ">;"
        }
    .end annotation

    invoke-static {p2}, Lcom/bumptech/glide/load/resource/bitmap/d;->k(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p2

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/bumptech/glide/load/i;->transform(Landroid/content/Context;Lcom/bumptech/glide/load/engine/p;II)Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    invoke-static {p1}, Lcom/bumptech/glide/load/resource/bitmap/d;->j(Lcom/bumptech/glide/load/engine/p;)Lcom/bumptech/glide/load/engine/p;

    move-result-object p1

    return-object p1
.end method

.method public updateDiskCacheKey(Ljava/security/MessageDigest;)V
    .locals 1
    .param p1    # Ljava/security/MessageDigest;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/bumptech/glide/load/resource/bitmap/d;->lB:Lcom/bumptech/glide/load/i;

    invoke-interface {v0, p1}, Lcom/bumptech/glide/load/i;->updateDiskCacheKey(Ljava/security/MessageDigest;)V

    return-void
.end method
