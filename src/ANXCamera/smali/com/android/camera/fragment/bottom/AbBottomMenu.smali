.class public abstract Lcom/android/camera/fragment/bottom/AbBottomMenu;
.super Ljava/lang/Object;
.source "AbBottomMenu.java"


# static fields
.field private static final CLICK_INTERVAL:I = 0x12c


# instance fields
.field protected mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

.field protected mContainerView:Landroid/widget/LinearLayout;

.field protected mContext:Landroid/content/Context;

.field protected mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

.field private mLastClickTime:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mContainerView:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mBeautyMenuAnimator:Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    return-void
.end method


# virtual methods
.method abstract addAllView()V
.end method

.method abstract getChildMenuViewList()Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/ui/ColorActivateTextView;",
            ">;"
        }
    .end annotation
.end method

.method abstract getDefaultType()I
.end method

.method abstract getMenuData()Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation
.end method

.method protected hideAdvance()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mContainerView:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/bottom/AbBottomMenu$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/bottom/AbBottomMenu$1;-><init>(Lcom/android/camera/fragment/bottom/AbBottomMenu;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method protected isClickEnable()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mLastClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x12c

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iput-wide v0, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mLastClickTime:J

    const/4 v0, 0x1

    return v0
.end method

.method abstract isRefreshUI()Z
.end method

.method selectBeautyType(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/AbBottomMenu;->getChildMenuViewList()Landroid/util/SparseArray;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/camera/ui/ColorActivateTextView;

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/AbBottomMenu;->mCurrentBeautyTextView:Lcom/android/camera/ui/ColorActivateTextView;

    :cond_1
    return-void
.end method

.method abstract switchMenu()V
.end method
