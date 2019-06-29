.class public Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;
.super Ljava/lang/Object;
.source "BeautyMenuGroupManager.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

.field private mBeautyMenuList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/bottom/AbBottomMenu;",
            ">;"
        }
    .end annotation
.end field

.field private mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

.field private mContainerView:Landroid/widget/LinearLayout;

.field private mContext:Landroid/content/Context;

.field private mCurrentMenuGroupType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xa0

    iput v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    iput-object p2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    invoke-static {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->animator(Landroid/view/ViewGroup;)Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->initView()V

    return-void
.end method

.method private initView()V
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->getCurrentBeautyMenuType()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->updateCurrentMenu(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->addAllView()V

    return-void
.end method

.method private updateCurrentMenu(I)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/bottom/AbBottomMenu;

    if-eqz v0, :cond_0

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    return-void

    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    packed-switch p1, :pswitch_data_0

    new-instance v0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_0
    new-instance v0, Lcom/android/camera/fragment/bottom/MimojiMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/MimojiMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveSpeedMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveSpeedMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_2
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/android/camera/fragment/bottom/LiveBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/LiveBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_4
    new-instance v0, Lcom/android/camera/fragment/bottom/BackBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/BackBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    :pswitch_5
    new-instance v0, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, v1, v2, v3}, Lcom/android/camera/fragment/bottom/FrontBeautyMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    iget-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuList:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    nop

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public animateExpanding(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->expandAnimate()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-virtual {p1}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->shrinkAnimate()V

    :goto_0
    return-void
.end method

.method public getBottomMenu()Lcom/android/camera/fragment/bottom/AbBottomMenu;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    return-object v0
.end method

.method public getCurrentBeautyMenuType()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    return v0
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public setCurrentBeautyMenuType(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mCurrentMenuGroupType:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->updateCurrentMenu(I)V

    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public switchMenu()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuGroupManager;->mBottomMenu:Lcom/android/camera/fragment/bottom/AbBottomMenu;

    invoke-virtual {v0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->switchMenu()V

    return-void
.end method
