.class public Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "LiveBeautyModeFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected getClassString()Ljava/lang/String;
    .locals 1

    const-class v0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getListItemMargin()I
    .locals 1

    invoke-super {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->getListItemMargin()I

    move-result v0

    return v0
.end method

.method protected getShineType()Ljava/lang/String;
    .locals 1

    const-string v0, "11"

    return-object v0
.end method

.method protected initExtraType()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mHeaderElement:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->mFooterElement:I

    return-void
.end method

.method protected onAdapterItemClick(Lcom/android/camera/data/data/TypeItem;)V
    .locals 3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz v0, :cond_0

    iget-object v1, p1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected(Ljava/lang/String;Z)V

    :cond_0
    iget-object p1, p1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    invoke-static {p1}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveBeautyCounter(Ljava/lang/String;)V

    return-void
.end method

.method protected onClearClick()V
    .locals 0

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->clearBeauty()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->selectFirstItem()V

    return-void
.end method

.method protected onResetClick()V
    .locals 2

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->selectFirstItem()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09025d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyModeFragment;->toast(Ljava/lang/String;)V

    const-string v0, "RESET"

    invoke-static {v0}, Lcom/android/camera/statistic/CameraStatUtil;->trackLiveBeautyCounter(Ljava/lang/String;)V

    return-void
.end method

.method protected setListPadding(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;->setListPadding(Landroid/support/v7/widget/RecyclerView;)V

    if-nez p1, :cond_0

    return-void

    :cond_0
    nop

    nop

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    return-void
.end method
