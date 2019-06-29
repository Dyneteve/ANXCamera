.class public Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "EyeLightSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;,
        Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mBackgroundColorNormal:I

.field private mBackgroundColorPressed:I

.field private mContext:Landroid/content/Context;

.field private mItemHorizontalMargin:I

.field private mPreSelectedItem:I

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mSelectedItem:I

.field private mSingleCheckList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;",
            ">;"
        }
    .end annotation
.end field

.field private onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    iput p3, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0b0062

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorPressed:I

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const/4 p2, 0x3

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0b0060

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0b0061

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    :goto_1
    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mItemHorizontalMargin:I

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    return p0
.end method

.method static synthetic access$302(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    return p1
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorPressed:I

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mBackgroundColorNormal:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mPreSelectedItem:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onBindViewHolder(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;

    :try_start_0
    invoke-virtual {p1, v0, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->setDataToView(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$EyeLightItem;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;
    .locals 2

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040009

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;

    invoke-direct {p2, p0, p1, p0}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;-><init>(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;)V

    return-object p2
.end method

.method public onItemHolderClick(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->access$000(Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter$SingleCheckViewHolder;->getItemId()J

    move-result-wide v5

    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/EyeLightSingleCheckAdapter;->mSelectedItem:I

    return-void
.end method
