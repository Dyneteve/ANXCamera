.class public Lcom/android/camera/fragment/FragmentLighting;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentLighting.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;
    }
.end annotation


# instance fields
.field private mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

.field private mCurrentIndex:I

.field private mHolderWidth:I

.field private mLastIndex:I

.field private mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

.field private mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    iput v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyItemChanged(I)V

    :cond_0
    if-le p2, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyItemChanged(I)V

    :cond_1
    return-void
.end method

.method private onItemSelected(IZ)V
    .locals 4

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xa4

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object v1, v1, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    return-void

    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v3, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v2, v3, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->setComponentValue(ILjava/lang/String;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-interface {p2, v2, v0, v1, v3}, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;->setLighting(ZLjava/lang/String;Ljava/lang/String;Z)V

    iget p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iput p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentLighting;->scrollIfNeed(I)V

    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    iget p2, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/FragmentLighting;->notifyItemChanged(II)V

    return-void
.end method

.method private scrollIfNeed(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPosition(I)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    const/4 v1, 0x0

    add-int/lit8 p1, p1, -0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPosition(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method private setItemInCenter(I)V
    .locals 2

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLastIndex:I

    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mTotalWidth:I

    div-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mHolderWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->notifyDataSetChanged()V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v1, p1, v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPositionWithOffset(II)V

    return-void
.end method


# virtual methods
.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xff7

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f040020

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 3

    const v0, 0x7f0d0071

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    new-instance p1, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    iget-object v2, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-direct {p1, v0, v1, p0, v2}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;-><init>(Landroid/content/Context;ILandroid/view/View$OnClickListener;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    new-instance p1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "lighting_list"

    const/4 v2, 0x0

    invoke-direct {p1, v0, v2, v2, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;IZLjava/lang/String;)V

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance p1, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {p1}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {p1, v0, v1}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mTotalWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a00aa

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mHolderWidth:I

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {p1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->isEnableClick()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->onItemSelected(IZ)V

    return-void
.end method

.method public reInit()V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/FragmentLighting;->reInitAdapterBgMode(Z)V

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentMode:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getComponentValue(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v1, v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->findIndexOfValue(Ljava/lang/String;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/FragmentLighting;->setItemInCenter(I)V

    return-void
.end method

.method public reInitAdapterBgMode(Z)V
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->setBgMode(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->setBgMode(Z)V

    nop

    :goto_0
    if-eqz p1, :cond_1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getComponentRunningLighting()Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->initItems()V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mLightingAdapter:Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/FragmentLighting;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {p1, v0, v1}, Lcom/android/camera/fragment/FragmentLighting$LightingAdapter;->updateLightingData(Landroid/content/Context;Lcom/android/camera/data/data/runing/ComponentRunningLighting;)V

    :cond_1
    return-void
.end method

.method public switchLighting(I)V
    .locals 2

    nop

    const/4 v0, 0x3

    const/4 v1, -0x1

    if-eq p1, v0, :cond_1

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    iget-object v0, p0, Lcom/android/camera/fragment/FragmentLighting;->mComponentRunningLighting:Lcom/android/camera/data/data/runing/ComponentRunningLighting;

    invoke-virtual {v0}, Lcom/android/camera/data/data/runing/ComponentRunningLighting;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_2

    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_1
    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    if-lez p1, :cond_2

    iget p1, p0, Lcom/android/camera/fragment/FragmentLighting;->mCurrentIndex:I

    add-int/lit8 p1, p1, -0x1

    goto :goto_1

    :cond_2
    :goto_0
    move p1, v1

    :goto_1
    if-le p1, v1, :cond_3

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/FragmentLighting;->onItemSelected(IZ)V

    :cond_3
    return-void
.end method
