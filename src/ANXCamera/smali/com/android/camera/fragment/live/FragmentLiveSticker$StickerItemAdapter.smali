.class Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentLiveSticker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "StickerItemAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;",
        ">;"
    }
.end annotation


# instance fields
.field mContext:Landroid/content/Context;

.field mGlideOptions:Lcom/bumptech/glide/request/f;

.field mLayoutInflater:Landroid/view/LayoutInflater;

.field mListener:Landroid/widget/AdapterView$OnItemClickListener;

.field mSelectIndex:I

.field mStickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;ILandroid/widget/AdapterView$OnItemClickListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/camera/sticker/LiveStickerInfo;",
            ">;I",
            "Landroid/widget/AdapterView$OnItemClickListener;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    new-instance v0, Lcom/bumptech/glide/request/f;

    invoke-direct {v0}, Lcom/bumptech/glide/request/f;-><init>()V

    const v1, 0x7f0200fb

    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/f;->R(I)Lcom/bumptech/glide/request/f;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mGlideOptions:Lcom/bumptech/glide/request/f;

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    iput p3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    iput-object p4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->onBindViewHolder(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;I)V
    .locals 6

    const v0, 0x7f0e0093

    invoke-virtual {p1, v0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/live/LiveDownloadView;

    const v1, 0x7f0e0091

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f0e0092

    invoke-virtual {p1, v2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mStickerList:Ljava/util/List;

    invoke-interface {v3, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/sticker/LiveStickerInfo;

    iget-object v4, p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    iget-boolean v4, v3, Lcom/android/camera/sticker/LiveStickerInfo;->isLocal:Z

    if-eqz v4, :cond_0

    iget v4, v3, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    if-lez v4, :cond_0

    iget v4, v3, Lcom/android/camera/sticker/LiveStickerInfo;->iconId:I

    invoke-virtual {v1, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    :cond_0
    iget-object v4, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mContext:Landroid/content/Context;

    invoke-static {v4}, Lcom/bumptech/glide/c;->g(Landroid/content/Context;)Lcom/bumptech/glide/i;

    move-result-object v4

    iget-object v5, v3, Lcom/android/camera/sticker/LiveStickerInfo;->icon:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/bumptech/glide/i;->m(Ljava/lang/String;)Lcom/bumptech/glide/h;

    move-result-object v4

    iget-object v5, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mGlideOptions:Lcom/bumptech/glide/request/f;

    invoke-virtual {v4, v5}, Lcom/bumptech/glide/h;->b(Lcom/bumptech/glide/request/f;)Lcom/bumptech/glide/h;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/bumptech/glide/h;->a(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    :goto_0
    invoke-virtual {v3}, Lcom/android/camera/sticker/LiveStickerInfo;->getDownloadState()I

    move-result v1

    const/4 v4, 0x3

    if-ne v1, v4, :cond_1

    const/4 v4, 0x1

    iput-boolean v4, p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->mWaitingDownloadSuccess:Z

    iput v4, v3, Lcom/android/camera/sticker/LiveStickerInfo;->downloadState:I

    :cond_1
    iget-boolean p1, p1, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->mWaitingDownloadSuccess:Z

    if-eqz p1, :cond_2

    const/4 p1, 0x5

    if-eq v1, p1, :cond_3

    :cond_2
    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/live/LiveDownloadView;->setStateImage(I)V

    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-ne p2, p1, :cond_3

    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    iget p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-eq p2, p1, :cond_4

    const/16 p1, 0x8

    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
    .locals 2

    iget-object p2, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f040029

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;

    invoke-direct {p2, p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;-><init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public setSelectIndex(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    return-void
.end method
