.class public Lcom/android/camera/fragment/bottom/LiveStickerMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "LiveStickerMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final LIVE_STICKER_TYPE:I


# instance fields
.field private mLiveStickerMenuTabList:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation
.end field

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

    return-void
.end method


# virtual methods
.method addAllView()V
    .locals 7

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->getMenuData()Landroid/util/SparseArray;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/camera/fragment/beauty/MenuItem;

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContext:Landroid/content/Context;

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f040004

    iget-object v6, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v4, v5, v6, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/android/camera/ui/ColorActivateTextView;

    const v5, -0x66000001

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    const v5, -0x4c000001

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    iget-object v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setText(Ljava/lang/CharSequence;)V

    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v4, p0}, Lcom/android/camera/ui/ColorActivateTextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v5, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    if-nez v5, :cond_0

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    iput-object v4, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    goto :goto_1

    :cond_0
    invoke-virtual {v4, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    :goto_1
    iget-object v5, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    iget v3, v3, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-virtual {v5, v3, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v3, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
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

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mMenuTextViewList:Landroid/util/SparseArray;

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method getMenuData()Landroid/util/SparseArray;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    return-object v0

    :cond_0
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    new-instance v0, Lcom/android/camera/fragment/beauty/MenuItem;

    invoke-direct {v0}, Lcom/android/camera/fragment/beauty/MenuItem;-><init>()V

    const/4 v1, 0x0

    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->type:I

    invoke-static {}, Lcom/android/camera/CameraAppImpl;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f090228

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/android/camera/fragment/beauty/MenuItem;->text:Ljava/lang/String;

    iput v1, v0, Lcom/android/camera/fragment/beauty/MenuItem;->number:I

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    invoke-virtual {v2, v1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mLiveStickerMenuTabList:Landroid/util/SparseArray;

    return-object v0
.end method

.method isRefreshUI()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method switchMenu()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->addAllView()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->getDefaultType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/bottom/LiveStickerMenu;->selectBeautyType(I)V

    return-void
.end method
