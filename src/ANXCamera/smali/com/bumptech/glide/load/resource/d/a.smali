.class public Lcom/bumptech/glide/load/resource/d/a;
.super Ljava/lang/Object;
.source "BitmapBytesTranscoder.java"

# interfaces
.implements Lcom/bumptech/glide/load/resource/d/e;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/bumptech/glide/load/resource/d/e<",
        "Landroid/graphics/Bitmap;",
        "[B>;"
    }
.end annotation


# instance fields
.field private final nM:Landroid/graphics/Bitmap$CompressFormat;

.field private final quality:I


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v1, 0x64

    invoke-direct {p0, v0, v1}, Lcom/bumptech/glide/load/resource/d/a;-><init>(Landroid/graphics/Bitmap$CompressFormat;I)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap$CompressFormat;I)V
    .locals 0
    .param p1    # Landroid/graphics/Bitmap$CompressFormat;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/bumptech/glide/load/resource/d/a;->nM:Landroid/graphics/Bitmap$CompressFormat;

    iput p2, p0, Lcom/bumptech/glide/load/resource/d/a;->quality:I

    return-void
.end method


# virtual methods
.method public a(Lcom/bumptech/glide/load/engine/p;Lcom/bumptech/glide/load/f;)Lcom/bumptech/glide/load/engine/p;
    .locals 3
    .param p1    # Lcom/bumptech/glide/load/engine/p;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/bumptech/glide/load/f;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/bumptech/glide/load/engine/p<",
            "Landroid/graphics/Bitmap;",
            ">;",
            "Lcom/bumptech/glide/load/f;",
            ")",
            "Lcom/bumptech/glide/load/engine/p<",
            "[B>;"
        }
    .end annotation

    new-instance p2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/bumptech/glide/load/resource/d/a;->nM:Landroid/graphics/Bitmap$CompressFormat;

    iget v2, p0, Lcom/bumptech/glide/load/resource/d/a;->quality:I

    invoke-virtual {v0, v1, v2, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-interface {p1}, Lcom/bumptech/glide/load/engine/p;->recycle()V

    new-instance p1, Lcom/bumptech/glide/load/resource/a/b;

    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/bumptech/glide/load/resource/a/b;-><init>([B)V

    return-object p1
.end method
