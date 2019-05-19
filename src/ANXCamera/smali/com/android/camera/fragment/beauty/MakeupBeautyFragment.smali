.class public Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;
.super Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;
.source "MakeupBeautyFragment.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "MakeupBeautyFragment"


# instance fields
.field private mHeaderImageView:Lcom/android/camera/ui/ColorImageView;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;)Lcom/android/camera/ui/ColorImageView;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    return-object p0
.end method


# virtual methods
.method protected getClassString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getHeaderView()Landroid/view/View;
    .locals 4

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f040001

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0d000e

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorImageView;

    iput-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0b0059

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setColor(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const v2, 0x7f020190

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorImageView;->setImageResource(I)V

    const v1, 0x7f0d000f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f090218

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    return-object v0
.end method

.method protected getShineType()Ljava/lang/String;
    .locals 1

    const-string v0, "5"

    return-object v0
.end method

.method protected onAdapterItemClick(Lcom/android/camera/data/data/TypeItem;)V
    .locals 2

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xb4

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {v0, p1, v1}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method protected onHeaderClick()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorImageView;->clearAnimation()V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorImageView;->setRotation(F)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mHeaderImageView:Lcom/android/camera/ui/ColorImageView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->rotation(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment$1;-><init>(Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    :cond_0
    invoke-static {}, Lcom/android/camera/CameraSettings;->resetEyeLight()V

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyHelper;->resetBeauty()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    iget v2, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->setSelectedPosition(I)V

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;

    iget v2, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mSelectedParam:I

    invoke-virtual {v1, v2}, Lcom/android/camera/fragment/beauty/BaseBeautyMakeupFragment$MyLayoutManager;->scrollToPosition(I)V

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb4

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mItemList:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/TypeItem;

    iget-object v0, v0, Lcom/android/camera/data/data/TypeItem;->mKeyOrType:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {v1, v0, v2}, Lcom/android/camera/protocol/ModeProtocol$MakeupProtocol;->onMakeupItemSelected(Ljava/lang/String;Z)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->mMakeupAdapter:Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/MakeupSingleCheckAdapter;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090228

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/MakeupBeautyFragment;->toast(Ljava/lang/String;)V

    return-void
.end method