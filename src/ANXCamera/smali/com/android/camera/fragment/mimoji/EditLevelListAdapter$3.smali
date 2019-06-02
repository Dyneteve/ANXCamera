.class Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;
.super Ljava/lang/Object;
.source "EditLevelListAdapter.java"

# interfaces
.implements Lcom/android/camera/fragment/mimoji/ColorListAdapter$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->showColor(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$ViewHolder;Lcom/android/camera/fragment/mimoji/MimojiLevelBean;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

.field final synthetic val$mColorListAdapter:Lcom/android/camera/fragment/mimoji/ColorListAdapter;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;Lcom/android/camera/fragment/mimoji/ColorListAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    iput-object p2, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->val$mColorListAdapter:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->this$0:Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;

    invoke-static {v0}, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;->access$000(Lcom/android/camera/fragment/mimoji/EditLevelListAdapter;)Lcom/android/camera/fragment/mimoji/ClickCheck;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/ClickCheck;->checkClickable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->val$mColorListAdapter:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->getmLinearLayoutManagerWrapper()Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v1

    if-eq p1, v1, :cond_4

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    move-result v1

    if-ne p1, v1, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    if-eq p1, v1, :cond_3

    invoke-virtual {v0}, Landroid/support/v7/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    move-result v1

    if-ne p1, v1, :cond_5

    :cond_3
    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/mimoji/EditLevelListAdapter$3;->val$mColorListAdapter:Lcom/android/camera/fragment/mimoji/ColorListAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/mimoji/ColorListAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v1, 0x0

    add-int/lit8 p1, p1, -0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPosition(I)V

    :cond_5
    :goto_1
    return-void
.end method
