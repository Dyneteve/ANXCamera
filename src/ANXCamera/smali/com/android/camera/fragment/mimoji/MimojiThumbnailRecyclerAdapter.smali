.class public Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;
.super Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;
.source "MimojiThumbnailRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/camera/ui/baseview/BaseRecyclerAdapter<",
        "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private selectIndex:F


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;-><init>(Ljava/util/ArrayList;)V

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->getSelectItem(I)F

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->selectIndex:F

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/arcsoft/avatar/AvatarConfig$ASAvatarConfigInfo;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;-><init>(Ljava/util/ArrayList;)V

    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->selectIndex:F

    return-void
.end method

.method public static getSelectItem(I)F
    .locals 1

    invoke-static {}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInstance()Lcom/android/camera/fragment/mimoji/AvatarEngineManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/camera/fragment/mimoji/AvatarEngineManager;->getInnerConfigSelectIndex(I)F

    move-result p0

    return p0
.end method


# virtual methods
.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f04004b

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;

    invoke-direct {p2, p1}, Lcom/android/camera/fragment/mimoji/MimojiThumbnailRecyclerAdapter$ThumbnailViewViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
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
