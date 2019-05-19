.class public Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;
.super Landroid/widget/BaseAdapter;
.source "MimojiThumbnailAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;
    }
.end annotation


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

    return-void
.end method


# virtual methods
.method public addData(Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

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
    .locals 4

    iget-object p3, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

    invoke-interface {p3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;

    nop

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const p3, 0x7f040049

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;

    invoke-direct {p3, p0, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;-><init>(Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;Landroid/view/View;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;

    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object v0

    iget-object v1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->thum:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/i;->b(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/h;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/music/RoundedCornersTransformation;

    const/16 v2, 0x14

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Lcom/android/camera/fragment/music/RoundedCornersTransformation;-><init>(II)V

    invoke-static {v1}, Lcom/bumptech/glide/request/f;->a(Lcom/bumptech/glide/load/i;)Lcom/bumptech/glide/request/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v0

    iget-object v1, p3, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->imageView:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    iget-object p3, p3, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter$ViewHolder;->selectView:Landroid/widget/ImageView;

    iget v0, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configType:I

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->getSelectItem(I)F

    move-result v0

    iget p1, p1, Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;->configID:I

    int-to-float p1, p1

    cmpl-float p1, v0, p1

    if-nez p1, :cond_1

    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    const/4 p1, 0x4

    :goto_1
    invoke-virtual {p3, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-object p2
.end method

.method public refreshData(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailAdapter;->mDatas:Ljava/util/List;

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
