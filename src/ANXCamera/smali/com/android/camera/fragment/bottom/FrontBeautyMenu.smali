.class public Lcom/android/camera/fragment/bottom/FrontBeautyMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "FrontBeautyMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mFrontBeautyMenuTabList:Landroid/util/SparseArray;

.field private mLastCamerId:I

.field private mMenuTextViewList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/ui/ColorActivateTextView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/bottom/AbBottomMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    return-void
.end method

.method private isCameraSwitch()Z
    .locals 2

    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentCameraId()I

    move-result v0

    iget v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    if-eq v1, v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iput v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mLastCamerId:I

    const/4 v0, 0x0

    return v0
.end method

.method private isJustBeautyTab()Z
    .locals 3

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->gE()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->provider()Lcom/android/camera/data/provider/DataProvider;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/camera/data/provider/DataProvider;->dataGlobal()Lcom/android/camera/data/provider/DataProvider$ProviderEvent;

    move-result-object v0

    check-cast v0, Lcom/android/camera/data/data/global/DataItemGlobal;

    invoke-virtual {v0}, Lcom/android/camera/data/data/global/DataItemGlobal;->getCurrentMode()I

    move-result v0

    const/16 v2, 0xa2

    if-eq v0, v2, :cond_2

    const/16 v2, 0xa1

    if-eq v0, v2, :cond_2

    const/16 v2, 0xae

    if-eq v0, v2, :cond_2

    const/16 v2, 0xab

    if-eq v0, v2, :cond_2

    const/16 v2, 0xb0

    if-ne v0, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    nop

    :cond_2
    :goto_0
    return v1
.end method


# virtual methods
.method public addAllView()V
    .locals 9

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_0

    iget v4, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-eq v4, v5, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v4, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v6, 0x7f040003

    iget-object v7, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v6, v7, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/ColorActivateTextView;

    const v6, -0x66000001

    invoke-virtual {v4, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v6

    if-eqz v6, :cond_1

    const v6, -0x4c000001

    invoke-virtual {v4, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    goto :goto_1

    :cond_1
    const v6, -0xff5701

    invoke-virtual {v4, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    :goto_1
    iget-object v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    invoke-virtual {v4, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v4, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-boolean v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->redDot:Z

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0200f7

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-object v7, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContext:Landroid/content/Context;

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0a006a

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v7

    invoke-virtual {v4, v7}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablePadding(I)V

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v7, v6, v7}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_2
    iget v6, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-ne v5, v6, :cond_3

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    iput-object v4, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    goto :goto_2

    :cond_3
    invoke-virtual {v4, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    :goto_2
    iget-object v5, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    iget v3, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method getChildMenuViewList()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/ui/ColorActivateTextView;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method getMenuData()Landroid/util/SparseArray;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0

    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0901d5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0901d6

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090236

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/mi/config/b;->iw()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0901d7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const v3, 0x7f0901d8

    invoke-virtual {v1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    :cond_1
    new-instance v3, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v3}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    const/4 v4, 0x1

    iput v4, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    iput-object v0, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, v3, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    const/4 v5, 0x2

    iput v5, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    iput-object v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    iput v4, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v1, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v1, v5, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemFeature()Lcom/mi/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/mi/config/a;->fw()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/android/camera/CameraSettings;->isSupportBeautyMakeup()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    const/4 v1, 0x3

    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    iput-object v2, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    iput v5, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mFrontBeautyMenuTabList:Landroid/util/SparseArray;

    return-object v0
.end method

.method public isRefreshUI()Z
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isCameraSwitch()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isJustBeautyTab()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->isClickEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->isBeautyMakeupClicked()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/android/camera/CameraSettings;->setBeautyMakeupClicked()V

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0, v0, v0}, Lcom/android/camera/ui/ColorActivateTextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_1
    return-void
.end method

.method switchMenu()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->resetAll()V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->addAllView()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->getDefaultType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;->selectBeautyType(I)V

    invoke-static {}, Lcom/android/camera/CameraSettings;->getFaceBeautifyLevel()Ljava/lang/String;

    return-void
.end method
