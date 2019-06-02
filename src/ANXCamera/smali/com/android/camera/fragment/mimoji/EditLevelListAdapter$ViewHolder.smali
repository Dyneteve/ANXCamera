.class public Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "EditLevelListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ViewHolder"
.end annotation


# instance fields
.field mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

.field mThumbnailGV:Landroid/support/v7/widget/RecyclerView;

.field mTvSubTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const p1, 0x7f0d00f0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mTvSubTitle:Landroid/widget/TextView;

    const p1, 0x7f0d00f1

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

    const p1, 0x7f0d00f2

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mThumbnailGV:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method
