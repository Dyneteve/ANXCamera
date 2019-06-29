.class Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;
.super Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;
.source "MimojiThumbnailRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ThumbnailViewViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder<",
        "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
        ">;"
    }
.end annotation


# instance fields
.field imageView:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f0e00f3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->imageView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method public setData(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I)V
    .locals 4

    new-instance v0, Lcom/bumptech/glide/request/a/c$a;

    const/16 v1, 0x12c

    invoke-direct {v0, v1}, Lcom/bumptech/glide/request/a/c$a;-><init>(I)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/a/c$a;->n(Z)Lcom/bumptech/glide/request/a/c$a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/bumptech/glide/request/a/c$a;->fg()Lcom/bumptech/glide/request/a/c;

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object v0

    iget-object v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/i;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object v0

    new-instance v2, Lcom/bumptech/glide/request/f;

    invoke-direct {v2}, Lcom/bumptech/glide/request/f;-><init>()V

    iget-object v3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    new-instance v2, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    const/16 v3, 0x14

    invoke-direct {v2, v3, v1}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;-><init>(II)V

    invoke-static {v2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fmoji bitmap isRecycled"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->imageView:Landroid/widget/ImageView;

    iget v1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-static {v1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->getSelectItem(I)F

    move-result v1

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float p1, p1

    cmpl-float p1, v1, p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v1, 0x7f02000e

    invoke-virtual {p1, v1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fmoji MimojiThumbnailAdapter getView position: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public bridge synthetic setData(Ljava/lang/Object;I)V
    .locals 0

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;->setData(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I)V

    return-void
.end method
