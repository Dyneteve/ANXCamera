.class Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;
.super Ljava/lang/Object;
.source "FragmentBeauty.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/FragmentBeauty;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExitAnimationListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBeauty;


# direct methods
.method private constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/camera/fragment/FragmentBeauty;Lcom/android/camera/fragment/FragmentBeauty$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;-><init>(Lcom/android/camera/fragment/FragmentBeauty;)V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 5

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p1

    const/16 v0, 0xa0

    invoke-virtual {p1, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p1

    check-cast p1, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;

    const/16 v0, 0xa

    if-eqz p1, :cond_0

    const v1, 0x7f0d0028

    invoke-interface {p1, v1}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->getActiveFragment(I)I

    move-result v1

    const/16 v2, 0xffa

    if-ne v1, v2, :cond_0

    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    :cond_0
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentBeauty;->access$500(Lcom/android/camera/fragment/FragmentBeauty;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xa1

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    invoke-static {}, Lcom/android/camera/fragment/beauty/BeautyParameters;->isCurrentModeSupportBeauty()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    if-eqz v1, :cond_7

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v2

    if-nez v2, :cond_7

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isRecording()Z

    move-result v1

    if-nez v1, :cond_7

    :cond_1
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xaf

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;

    if-eqz v1, :cond_2

    invoke-interface {v1}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->reInitTipImage()V

    :cond_2
    iget-object v2, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    iget v2, v2, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    invoke-static {v2}, Lcom/android/camera/CameraSettings;->shouldShowUltraWideStickyTip(I)Z

    move-result v2

    if-eqz v2, :cond_3

    if-eqz v1, :cond_3

    const/16 v2, 0xd

    const v4, 0x7f090243

    invoke-interface {v1, v2, v4}, Lcom/android/camera/protocol/ModeProtocol$BottomPopupTips;->directlyShowTips(II)V

    :cond_3
    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {v1, v3}, Lcom/android/camera/fragment/FragmentBeauty;->access$600(Lcom/android/camera/fragment/FragmentBeauty;I)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {v1}, Lcom/android/camera/fragment/FragmentBeauty;->access$700(Lcom/android/camera/fragment/FragmentBeauty;)V

    iget-object v1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    iget v1, v1, Lcom/android/camera/fragment/FragmentBeauty;->mCurrentMode:I

    const/16 v2, 0xa3

    const/4 v4, 0x1

    if-eq v1, v2, :cond_6

    const/16 v2, 0xa7

    if-eq v1, v2, :cond_5

    const/16 v2, 0xab

    if-eq v1, v2, :cond_4

    goto :goto_0

    :cond_4
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xd2

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;

    if-eqz v1, :cond_7

    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$BokehFNumberController;->showFNumberPanel(Z)V

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xb5

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;

    if-eqz v1, :cond_7

    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$ManuallyAdjust;->setManuallyLayoutVisible(Z)V

    goto :goto_0

    :cond_6
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc3

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;

    if-eqz v1, :cond_7

    invoke-interface {v1, v4}, Lcom/android/camera/protocol/ModeProtocol$CameraModuleSpecial;->showOrHideChip(Z)V

    :cond_7
    :goto_0
    invoke-interface {p1, v0}, Lcom/android/camera/protocol/ModeProtocol$BaseDelegate;->delegateEvent(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBeauty$ExitAnimationListener;->this$0:Lcom/android/camera/fragment/FragmentBeauty;

    invoke-static {p1, v3}, Lcom/android/camera/fragment/FragmentBeauty;->access$502(Lcom/android/camera/fragment/FragmentBeauty;Z)Z

    :cond_8
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
