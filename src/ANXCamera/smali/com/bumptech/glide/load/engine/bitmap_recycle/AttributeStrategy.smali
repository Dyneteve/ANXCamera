.class Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;
.super Ljava/lang/Object;
.source "AttributeStrategy.java"

# interfaces
.implements Lcom/bumptech/glide/load/engine/bitmap_recycle/k;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key;,
        Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;
    }
.end annotation


# instance fields
.field private final ig:Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;

.field private final ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/g<",
            "Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ig:Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;

    new-instance v0, Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    invoke-direct {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/g;-><init>()V

    iput-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    return-void
.end method

.method static d(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string/jumbo p0, "x"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, "], "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static g(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->d(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public b(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ig:Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;

    invoke-virtual {v0, p1, p2, p3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;->f(IILandroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key;

    move-result-object p1

    iget-object p2, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    invoke-virtual {p2, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/g;->b(Lcom/bumptech/glide/load/engine/bitmap_recycle/l;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public bM()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    invoke-virtual {v0}, Lcom/bumptech/glide/load/engine/bitmap_recycle/g;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public c(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    .locals 0

    invoke-static {p1, p2, p3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->d(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public d(Landroid/graphics/Bitmap;)V
    .locals 4

    iget-object v0, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ig:Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;->f(IILandroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key;

    move-result-object v0

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    invoke-virtual {v1, v0, p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/g;->a(Lcom/bumptech/glide/load/engine/bitmap_recycle/l;Ljava/lang/Object;)V

    return-void
.end method

.method public e(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 0

    invoke-static {p1}, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->g(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public f(Landroid/graphics/Bitmap;)I
    .locals 0

    invoke-static {p1}, Lcom/bumptech/glide/util/k;->p(Landroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AttributeStrategy:\n  "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy;->ii:Lcom/bumptech/glide/load/engine/bitmap_recycle/g;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
