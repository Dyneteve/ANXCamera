.class public abstract Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "BaseRecyclerViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public setClickListener(Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;Ljava/lang/Object;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener<",
            "TT;>;TT;I)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder$1;-><init>(Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;Ljava/lang/Object;I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public abstract setData(Ljava/lang/Object;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation
.end method
