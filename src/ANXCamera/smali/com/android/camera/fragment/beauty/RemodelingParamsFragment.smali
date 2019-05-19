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

.method protected initOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/android/camera/fragment/beauty/-$$Lambda$RemodelingParamsFragment$iN2j56dOqeTD-CXbEqMCIBRTBXg;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/beauty/-$$Lambda$RemodelingParamsFragment$iN2j56dOqeTD-CXbEqMCIBRTBXg;-><init>(Lcom/android/camera/fragment/beauty/RemodelingParamsFragment;)V

    return-object v0
.end method
