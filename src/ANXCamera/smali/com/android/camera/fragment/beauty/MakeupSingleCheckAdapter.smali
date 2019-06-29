.class public Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "MakeupSingleCheckAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mIsCustomWidth:Z

.field private mItemHorizontalMargin:I

.field private mItemMargin:I

.field private mItemWidth:I

.field private mPreSelectedItem:I

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mSelectedItem:I

.field private mSingleCheckList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
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
            "Lcom/android/camera/data/data/TypeItem;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    iput p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/util/List;IZII)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/camera/data/data/TypeItem;",
            ">;IZII)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    iput p3, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemHorizontalMargin:I

    iput-boolean p4, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mIsCustomWidth:Z

    iput p5, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemWidth:I

    iput p6, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemMargin:I

    return-void
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mIsCustomWidth:Z

    return p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemWidth:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mItemMargin:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    return p0
.end method

.method static synthetic access$502(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    return p1
.end method

.method static synthetic access$600(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    return p0
.end method

.method static synthetic access$602(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mPreSelectedItem:I

    return p1
.end method

.method static synthetic access$700(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)Landroid/support/v7/widget/RecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object p0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onBindViewHolder(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSingleCheckList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/TypeItem;

    :try_start_0
    invoke-virtual {p1, v0, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->setDataToView(Lcom/android/camera/data/data/TypeItem;I)V
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

    invoke-virtual {p0, p1, p2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;
    .locals 2

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f040048

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;

    invoke-direct {p2, p0, p1, p0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;-><init>(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;Landroid/view/View;Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;)V

    return-object p2
.end method

.method public onItemHolderClick(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    const/4 v2, 0x0

    invoke-static {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->access$000(Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->getAdapterPosition()I

    move-result v4

    invoke-virtual {p1}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter$SingleCheckViewHolder;->getItemId()J

    move-result-wide v5

    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->onItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public setSelectedPosition(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->mSelectedItem:I

    return-void
.end method
