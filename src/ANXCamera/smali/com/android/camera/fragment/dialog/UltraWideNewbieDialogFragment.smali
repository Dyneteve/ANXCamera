.class public Lcom/android/camera/fragment/dialog/UltraWideNewbieDialogFragment;
.super Lcom/android/camera/fragment/dialog/AiSceneNewbieDialogFragment;
.source "UltraWideNewbieDialogFragment.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "UltraWideHint"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/fragment/dialog/AiSceneNewbieDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackEvent(I)Z
    .locals 2

    invoke-super {p0, p1}, Lcom/android/camera/fragment/dialog/AiSceneNewbieDialogFragment;->onBackEvent(I)Z

    move-result p1

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xaf

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directShowLeftImageIntro()V

    :cond_0
    return p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const p3, 0x7f04001a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    sget-boolean p2, Lcom/android/camera/HybridZoomingSystem;->IS_3_OR_MORE_SAT:Z

    if-eqz p2, :cond_0

    const p2, 0x7f0e005d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const p3, 0x7f0902a6

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/dialog/UltraWideNewbieDialogFragment;->initViewOnTouchListener(Landroid/view/View;)V

    const p2, 0x7f0e005c

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/android/camera/fragment/dialog/UltraWideNewbieDialogFragment;->adjustViewHeight(Landroid/view/View;)V

    return-object p1
.end method
