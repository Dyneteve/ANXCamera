.class public Lcom/android/camera/fragment/bottom/ShineMenu;
.super Lcom/android/camera/fragment/bottom/AbBottomMenu;
.source "ShineMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/android/camera/fragment/bottom/AbBottomMenu;-><init>(Landroid/content/Context;Landroid/widget/LinearLayout;Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;)V

    return-void
.end method


# virtual methods
.method addAllView()V
    .locals 0

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

    const/4 v0, 0x0

    return-object v0
.end method

.method getDefaultType()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method getMenuData()Landroid/util/SparseArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/SparseArray<",
            "Lcom/android/camera/fragment/beauty/MenuItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method isRefreshUI()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    return-void
.end method

.method switchMenu()V
    .locals 0

    return-void
.end method
