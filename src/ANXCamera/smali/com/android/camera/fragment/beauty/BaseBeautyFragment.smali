.class public abstract Lcom/android/camera/fragment/beauty/BaseBeautyFragment;
.super Landroid/support/v4/app/Fragment;
.source "BaseBeautyFragment.java"


# instance fields
.field private isOnCreate:Z

.field private isViewCreated:Z

.field private isViewCreatedAndVisibleToUser:Z

.field private isVisibleToUser:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    return-void
.end method

.method private beforeViewGoneToUser()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreatedAndVisibleToUser:Z

    return-void
.end method

.method private beforeViewVisibleToUser()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreatedAndVisibleToUser:Z

    return-void
.end method


# virtual methods
.method protected enterAnim(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0xf0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method protected exitAnim(Landroid/view/View;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method protected abstract getAnimateView()Landroid/view/View;
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isOnCreate:Z

    return-void
.end method

.method public onCreateAnimation(IZI)Landroid/view/animation/Animation;
    .locals 0

    if-nez p2, :cond_0

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/high16 p2, 0x3f800000    # 1.0f

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    new-instance p2, Lmiui/view/animation/QuinticEaseInInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/QuinticEaseInInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 p2, 0x8c

    invoke-virtual {p1, p2, p3}, Landroid/view/animation/Animation;->setDuration(J)V

    return-object p1

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateAnimation(IZI)Landroid/view/animation/Animation;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreated:Z

    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreatedAndVisibleToUser:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewGoneToUser()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndJumpOut()V

    :cond_0
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreated:Z

    iget-boolean p2, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isVisibleToUser:Z

    if-eqz p2, :cond_1

    iget-boolean p2, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isOnCreate:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isOnCreate:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewVisibleToUser()V

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndVisibleToUser(Z)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewVisibleToUser()V

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndVisibleToUser(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onViewCreatedAndJumpOut()V
    .locals 1
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->getAnimateView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->getAnimateView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->exitAnim(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method protected onViewCreatedAndVisibleToUser(Z)V
    .locals 0
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->getAnimateView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->getAnimateView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->enterAnim(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setUserVisibleHint(Z)V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isVisibleToUser:Z

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->setUserVisibleHint(Z)V

    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreated:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isOnCreate:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isOnCreate:Z

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewVisibleToUser()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndVisibleToUser(Z)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewVisibleToUser()V

    invoke-virtual {p0, v1}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndVisibleToUser(Z)V

    :cond_1
    :goto_0
    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->isViewCreatedAndVisibleToUser:Z

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->beforeViewGoneToUser()V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/BaseBeautyFragment;->onViewCreatedAndJumpOut()V

    :cond_2
    return-void
.end method
