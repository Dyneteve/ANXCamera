.class public abstract Lcom/android/camera/ui/autoselectview/AutoSelectViewHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "AutoSelectViewHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/android/camera/ui/autoselectview/SelectItemBean;",
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
.method public abstract setData(Lcom/android/camera/ui/autoselectview/SelectItemBean;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation
.end method

.method public setViewAlpha(F)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Lcom/android/camera/ui/autoselectview/AlphaView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/android/camera/ui/autoselectview/AlphaView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/autoselectview/AlphaView;->setViewAlpha(F)V

    :cond_0
    return-void
.end method
