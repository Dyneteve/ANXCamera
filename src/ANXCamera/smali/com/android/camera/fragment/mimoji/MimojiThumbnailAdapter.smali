.class public Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;
.super Landroid/widget/BaseAdapter;
.source "MimojiThumbnailAdapter.java"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mSelectedDrawable:Landroid/graphics/drawable/Drawable;

.field private selectIndex:F


# direct methods
.method constructor <init>(Landroid/content/Context;I)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->selectIndex:F

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItem(I)F

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->selectIndex:F

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    const p2, 0x7f02000d

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mSelectedDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method


# virtual methods
.method public addData(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getSelectItem(I)F
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInnerConfigSelectIndex(I)F

    move-result p1

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f04004b

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    new-instance p3, Lcom/bumptech/glide/request/a/c$a;

    const/16 v0, 0x12c

    invoke-direct {p3, v0}, Lcom/bumptech/glide/request/a/c$a;-><init>(I)V

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/bumptech/glide/request/a/c$a;->n(Z)Lcom/bumptech/glide/request/a/c$a;

    move-result-object p3

    invoke-virtual {p3}, Lcom/bumptech/glide/request/a/c$a;->eE()Lcom/bumptech/glide/request/a/c;

    move-result-object p3

    instance-of v1, p2, Landroid/widget/ImageView;

    if-eqz v1, :cond_2

    if-eqz p1, :cond_1

    iget-object v1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object v1

    iget-object v2, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/i;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object v1

    new-instance v2, Lcom/bumptech/glide/request/f;

    invoke-direct {v2}, Lcom/bumptech/glide/request/f;-><init>()V

    move-object v3, p2

    check-cast v3, Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/bumptech/glide/request/f;->i(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/f;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v1

    new-instance v2, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    const/16 v4, 0x14

    invoke-direct {v2, v4, v0}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;-><init>(II)V

    invoke-static {v2}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    invoke-static {p3}, Lcom/bumptech/glide/load/resource/b/c;->f(Lcom/bumptech/glide/request/a/g;)Lcom/bumptech/glide/load/resource/b/c;

    move-result-object p3

    invoke-virtual {v0, p3}, Lcom/bumptech/glide/h;->a(Lcom/bumptech/glide/j;)Lcom/bumptech/glide/h;

    move-result-object p3

    invoke-virtual {p3, v3}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p3

    const-string v0, "bitmap isRecycled"

    invoke-static {p3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    iget p3, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {p0, p3}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItem(I)F

    move-result p3

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float p1, p1

    cmpl-float p1, p3, p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mSelectedDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    :goto_1
    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-object p2
.end method

.method public refreshData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setSelectItem(II)V
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    int-to-float p2, p2

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->setInnerConfigSelectIndex(IF)V

    return-void
.end method
