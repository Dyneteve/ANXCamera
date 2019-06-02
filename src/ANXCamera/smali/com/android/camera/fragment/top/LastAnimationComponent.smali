.class public Lcom/android/camera/fragment/top/LastAnimationComponent;
.super Ljava/lang/Object;
.source "LastAnimationComponent.java"


# instance fields
.field public mAnchorView:Landroid/view/View;

.field private mExpandOffset:I

.field private mGravity:I

.field public mHidedViews:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mQuartEaseIn:Landroid/view/animation/Interpolator;

.field private mQuartEaseOut:Landroid/view/animation/Interpolator;

.field public mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field public mReverseLeft:I

.field public mReverseRecyclerViewLeft:I

.field private mShowDelay:I

.field public mShown:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/view/animation/QuarticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseInInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseIn:Landroid/view/animation/Interpolator;

    new-instance v0, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    return-void
.end method


# virtual methods
.method public hideOtherViews(ILjava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Landroid/widget/ImageView;",
            ">;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/data/data/config/TopConfigItem;

    if-eqz v1, :cond_2

    iget v1, v1, Lcom/android/camera/data/data/config/TopConfigItem;->configItem:I

    if-ne v1, p1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_4

    goto :goto_1

    :cond_4
    iget-object v1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    const-wide/16 v3, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    iget v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    if-lez v3, :cond_5

    const-wide/16 v3, 0x8c

    goto :goto_2

    :cond_5
    const-wide/16 v3, 0x118

    :goto_2
    invoke-virtual {v1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationXBy(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    if-lez v2, :cond_6

    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseIn:Landroid/view/animation/Interpolator;

    goto :goto_3

    :cond_6
    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    :goto_3
    invoke-virtual {v1, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    :cond_7
    return-void
.end method

.method public reverse(Z)Z
    .locals 11

    iget-boolean v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iput-boolean v1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShown:Z

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const-wide/16 v3, 0x118

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/View;

    if-eqz p1, :cond_1

    invoke-static {v8, v7}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    invoke-static {v8}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    iget-object v10, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    invoke-virtual {v8, v1}, Landroid/view/View;->setEnabled(Z)V

    goto :goto_1

    :cond_1
    invoke-static {v8, v7}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    invoke-static {v8}, Lcom/android/camera/animation/type/AlphaInOnSubscribe;->directSetResult(Landroid/view/View;)V

    :goto_1
    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mHidedViews:Ljava/util/List;

    :cond_3
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    if-eqz v0, :cond_5

    if-eqz p1, :cond_4

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v9, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    sub-int/2addr v8, v9

    int-to-float v8, v8

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    iget-object v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    iget v8, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseLeft:I

    iget-object v9, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v9

    sub-int/2addr v8, v9

    invoke-static {v0, v8}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->directSetResult(Landroid/view/View;I)V

    :goto_2
    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    :cond_5
    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v2

    sub-int/2addr v0, v2

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v3, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    new-instance v0, Lcom/android/camera/fragment/top/LastAnimationComponent$1;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/top/LastAnimationComponent$1;-><init>(Lcom/android/camera/fragment/top/LastAnimationComponent;)V

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->withEndAction(Ljava/lang/Runnable;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_3

    :cond_6
    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1, v7}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mReverseRecyclerViewLeft:I

    iget-object v3, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getLeft()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v0, v0

    invoke-static {p1, v0}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    iput-object v2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    :goto_3
    return v1
.end method

.method public setExpandGravity(I)V
    .locals 1

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mGravity:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    const/16 p1, -0xc8

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    goto :goto_0

    :cond_0
    const/16 p1, 0xc8

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mExpandOffset:I

    const/16 p1, 0x8c

    iput p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    :goto_0
    return-void
.end method

.method public showExtraView(II)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    int-to-float p1, p1

    invoke-static {v0, p1}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object p2, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, p2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method

.method public translateAnchorView(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mAnchorView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mShowDelay:I

    int-to-long v0, v0

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    const-wide/16 v0, 0x118

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v0, p0, Lcom/android/camera/fragment/top/LastAnimationComponent;->mQuartEaseOut:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    return-void
.end method
