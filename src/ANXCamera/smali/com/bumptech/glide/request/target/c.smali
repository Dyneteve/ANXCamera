.class public Lcom/bumptech/glide/request/target/c;
.super Lcom/bumptech/glide/request/target/h;
.source "BitmapImageViewTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/bumptech/glide/request/target/h<",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/bumptech/glide/request/target/h;-><init>(Landroid/widget/ImageView;)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/bumptech/glide/request/target/h;-><init>(Landroid/widget/ImageView;Z)V

    return-void
.end method


# virtual methods
.method protected n(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/bumptech/glide/request/target/c;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected synthetic x(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/bumptech/glide/request/target/c;->n(Landroid/graphics/Bitmap;)V

    return-void
.end method
