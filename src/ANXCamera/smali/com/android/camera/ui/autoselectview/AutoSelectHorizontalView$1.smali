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
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$000(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "View"

    const-string v1, "mAutoSelectAdapter  \u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->getItemCount()I

    move-result v1

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$202(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;I)I

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v0

    const/4 v1, 0x0

    if-gez v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$202(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;I)I

    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$300(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$500(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Landroid/support/v7/widget/LinearLayoutManager;

    move-result-object v0

    iget-object v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I

    move-result v2

    neg-int v2, v2

    iget-object v3, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v3}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result v3

    mul-int/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-static {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->access$002(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;Z)Z

    :cond_4
    return-void
.end method
