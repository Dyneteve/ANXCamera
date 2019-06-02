.class Lcom/android/camera/fragment/FragmentBottomPopupTips$7;
.super Landroid/animation/AnimatorListenerAdapter;
.source "FragmentBottomPopupTips.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/camera/fragment/FragmentBottomPopupTips;->startLeftImageIntroAnim(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private cancelled:Z

.field final synthetic this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;


# direct methods
.method constructor <init>(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->cancelled:Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->canProvide()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->cancelled:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-static {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->access$800(Lcom/android/camera/fragment/FragmentBottomPopupTips;)V

    iget-object p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->this$0:Lcom/android/camera/fragment/FragmentBottomPopupTips;

    invoke-virtual {p1}, Lcom/android/camera/fragment/FragmentBottomPopupTips;->updateLeftTipImage()V

    :cond_1
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/fragment/FragmentBottomPopupTips$7;->cancelled:Z

    return-void
.end method
