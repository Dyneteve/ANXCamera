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

.field mDividerView:Landroid/view/View;

.field mThumbnailGV:Landroid/widget/GridView;

.field mTvSubTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Landroid/view/View;)V
    .locals 2

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f0d00f2

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mTvSubTitle:Landroid/widget/TextView;

    const v0, 0x7f0d00f3

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-static {p1}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$400(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Landroid/content/Context;

    move-result-object p1

    const-string v1, "color_select"

    invoke-direct {v0, p1, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mColorRecycleView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    const p1, 0x7f0d00f4

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/GridView;

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mThumbnailGV:Landroid/widget/GridView;

    const p1, 0x7f0d00f1

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;->mDividerView:Landroid/view/View;

    return-void
.end method
