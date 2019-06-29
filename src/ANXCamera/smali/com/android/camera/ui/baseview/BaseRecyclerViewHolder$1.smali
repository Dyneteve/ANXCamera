.class Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;
.super Ljava/lang/Object;
.source "BaseRecyclerViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;->setClickListener(Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;Ljava/lang/Object;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;

.field final synthetic val$data:Ljava/lang/Object;

.field final synthetic val$onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;Ljava/lang/Object;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->this$0:Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;

    iput-object p2, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

    iput-object p3, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$data:Ljava/lang/Object;

    iput p4, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$data:Ljava/lang/Object;

    iget v1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;->val$position:I

    invoke-interface {p1, v0, v1}, Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;->OnRecyclerItemClickListener(Ljava/lang/Object;I)V

    return-void
.end method
