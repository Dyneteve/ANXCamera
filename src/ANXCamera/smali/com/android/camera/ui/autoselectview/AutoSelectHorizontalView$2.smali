.class Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;
.super Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;
.source "AutoSelectHorizontalView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;


# direct methods
.method constructor <init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;-><init>()V

    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onChanged()V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$600(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)V

    return-void
.end method

.method public onItemRangeChanged(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;->onItemRangeChanged(II)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1, p2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->notifyItemRangeChanged(II)V

    return-void
.end method

.method public onItemRangeInserted(II)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public onItemRangeRemoved(II)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->notifyDataSetChanged()V

    return-void
.end method
