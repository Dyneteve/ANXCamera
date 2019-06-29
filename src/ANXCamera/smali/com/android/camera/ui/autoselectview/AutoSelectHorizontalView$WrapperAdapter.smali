.class Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AutoSelectHorizontalView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "WrapperAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter$HeaderFooterViewHolder;
    }
.end annotation


# static fields
.field private static final HEADER_FOOTER_TYPE:I = -0x1


# instance fields
.field private adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

.field private context:Landroid/content/Context;

.field private headerFooterWidth:I

.field public itemPageCount:I

.field private itemWidth:I

.field final synthetic this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;


# direct methods
.method public constructor <init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/content/Context;I)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->this$0:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iput-object p3, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->context:Landroid/content/Context;

    iput p4, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->itemPageCount:I

    return-void
.end method

.method static synthetic access$702(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;Landroid/content/Context;)Landroid/content/Context;
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->context:Landroid/content/Context;

    return-object p1
.end method

.method private isHeaderOrFooter(I)Z
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemCount()I

    move-result v1

    sub-int/2addr v1, v0

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    return v0
.end method


# virtual methods
.method public getHeaderFooterWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->headerFooterWidth:I

    return v0
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    if-lez p1, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-gt p1, v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, -0x1

    return p1
.end method

.method public getItemWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->itemWidth:I

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    invoke-direct {p0, p2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->isHeaderOrFooter(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 3

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    new-instance p2, Landroid/view/View;

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->context:Landroid/content/Context;

    invoke-direct {p2, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p1

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->itemPageCount:I

    div-int/2addr p1, v2

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr v1, p1

    iput v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->headerFooterWidth:I

    new-instance p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->headerFooterWidth:I

    invoke-direct {p1, v1, v0}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p1, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter$HeaderFooterViewHolder;

    invoke-direct {p1, p0, p2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter$HeaderFooterViewHolder;-><init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;Landroid/view/View;)V

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p2

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result p1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->itemPageCount:I

    div-int/2addr p1, v0

    iget-object v0, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_1

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->itemWidth:I

    iget-object p1, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    return-object p2
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroid/support/v7/widget/RecyclerView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->adapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method
