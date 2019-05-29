.class Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;
.super Ljava/lang/Object;
.source "AutoSelectHorizontalView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->init()V
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

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$000(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->getItemCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$102(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;I)I

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$300(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$500(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Landroid/support/v7/widget/LinearLayoutManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v1

    neg-int v1, v1

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result v2

    mul-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0, v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$002(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;Z)Z

    :cond_2
    return-void
.end method
