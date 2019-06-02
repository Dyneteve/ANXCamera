.class Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;
.super Lcom/android/camera/fragment/CommonRecyclerViewHolder;
.source "FragmentLiveSticker.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StickerItemHolder"
.end annotation


# instance fields
.field mWaitingDownloadSuccess:Z

.field final synthetic this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-direct {p0, p2}, Lcom/android/camera/fragment/CommonRecyclerViewHolder;-><init>(Landroid/view/View;)V

    invoke-virtual {p2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f0d0092

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getView(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/android/camera/fragment/live/LiveDownloadView;

    invoke-virtual {p1, p0}, Lcom/android/camera/fragment/live/LiveDownloadView;->setOnDownloadSuccessListener(Lcom/android/camera/fragment/sticker/download/DownloadView$OnDownloadSuccessListener;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getAdapterPosition()I

    move-result v3

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mSelectIndex:I

    if-ne v3, v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    iget-object v0, v0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->mListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getItemId()J

    move-result-wide v4

    move-object v2, p1

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method public onDownloadSuccess(Lcom/android/camera/fragment/sticker/download/DownloadView;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->getLayoutPosition()I

    move-result p1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->mWaitingDownloadSuccess:Z

    iget-object v0, p0, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter$StickerItemHolder;->this$0:Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/live/FragmentLiveSticker$StickerItemAdapter;->notifyItemChanged(I)V

    return-void
.end method
