.class public abstract Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "BaseRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mDdataList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation
.end field

.field private onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public declared-synchronized addData(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->notifyItemInserted(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized addData(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le p2, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->notifyItemInserted(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getDataList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->onBindViewHolder(Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;I)V
    .locals 2
    .param p1    # Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p2, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;->setData(Ljava/lang/Object;I)V

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

    iget-object v1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v0, v1, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerViewHolder;->setClickListener(Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;Ljava/lang/Object;I)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public declared-synchronized removeData(I)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->notifyItemRemoved(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setDataList(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setOnRecyclerItemClickListener(Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->onRecyclerItemClickListener:Lcom/android/camera/ui/baseview/OnRecyclerItemClickListener;

    return-void
.end method

.method public declared-synchronized updateData(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    if-nez p1, :cond_0

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->addData(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :cond_1
    if-ltz p1, :cond_4

    :try_start_1
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le p1, v0, :cond_2

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne p1, v0, :cond_3

    invoke-virtual {p0, p2}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->addData(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    :try_start_2
    iget-object v0, p0, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->mDdataList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/baseview/BaseRecyclerAdapter;->notifyItemChanged(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
