.class public Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;
.super Lcom/android/camera/fragment/beauty/MakeupParamsFragment;
.source "RemodelingParamsFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$initOnItemClickListener$0(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    iput p3, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mSelectedParam:I

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    invoke-interface {p1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/data/data/TypeItem;

    iget-object p1, p1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 p3, 0xb4

    invoke-virtual {p2, p3}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz p2, :cond_0

    const/4 p3, 0x1

    invoke-interface {p2, p1, p3}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected getShineType()Ljava/lang/String;
    .locals 1

    const-string v0, "4"

    return-object v0
.end method

.method protected initExtraType()V
    .locals 3

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mHeaderElement:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mFooterElement:I

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "pref_beautify_skin_smooth_ratio_key"

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mItemList:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/TypeItem;

    iget-object v1, v1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->mFooterElement:I

    :cond_0
    return-void
.end method

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/android/camera/fragment/beauty/-$$Lambda$RemodelingParamsFragment$iN2j56dOqeTD-CXbEqMCIBRTBXg;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/-$$Lambda$RemodelingParamsFragment$iN2j56dOqeTD-CXbEqMCIBRTBXg;-><init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V

    return-object v0
.end method

.method protected onClearClick()V
    .locals 2

    invoke-super {p0}, Lcom/android/camera/fragment/beauty/MakeupParamsFragment;->onClearClick()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f09025e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;->toast(Ljava/lang/String;)V

    return-void
.end method
