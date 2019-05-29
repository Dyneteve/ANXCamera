.class public Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "FragmentFilter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "EffectItemAdapter"
.end annotation


# instance fields
.field protected mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

.field protected mLayoutInflater:Landroid/view/LayoutInflater;

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentFilter;


# direct methods
.method public constructor <init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/content/Context;Lcom/android/camera/data/data/config/ComponentConfigFilter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p3, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {v0}, Lcom/android/camera/data/data/config/ComponentConfigFilter;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/ComponentDataItem;

    check-cast p1, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;

    iget-object v1, p1, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/fragment/FragmentFilter$EffectItemHolder;->bindEffectIndex(ILcom/android/camera/data/data/ComponentDataItem;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2

    iget-object p2, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v0, 0x7f040007

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-direct {p2, v0, p1}, Lcom/android/camera/fragment/FragmentFilter$EffectStillItemHolder;-><init>(Lcom/android/camera/fragment/FragmentFilter;Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->this$0:Lcom/android/camera/fragment/FragmentFilter;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2
.end method

.method public updateData(Lcom/android/camera/data/data/config/ComponentConfigFilter;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->mFilters:Lcom/android/camera/data/data/config/ComponentConfigFilter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentFilter$EffectItemAdapter;->notifyDataSetChanged()V

    return-void
.end method
