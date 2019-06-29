.class public Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;
.super Ljava/lang/Object;
.source "BeautyMenuAnimator.java"

# interfaces
.implements Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ThreeChildAnimationProvider"
.end annotation


# instance fields
.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    return-void
.end method


# virtual methods
.method public expandAnimation(Landroid/view/ViewGroup;)Ljava/util/ArrayList;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/view/ViewPropertyAnimatorCompat;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    const-wide/16 v6, 0x12c

    invoke-virtual {v4, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    iget-object v8, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v4, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v4, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider$1;

    invoke-direct {v4, p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider$1;-><init>(Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;)V

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    const-wide/16 v9, 0x50

    invoke-virtual {v8, v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    iget-object v10, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v8, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    iget-object v10, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v8, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    iget-object v9, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v8, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v8

    invoke-virtual {v8, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v5

    invoke-virtual {v5, v6, v7}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v5

    iget-object v6, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v5, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    return-object v0
.end method

.method public shrinkAnimation(Landroid/view/ViewGroup;)Ljava/util/ArrayList;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/view/ViewPropertyAnimatorCompat;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v6

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v7

    sub-int/2addr v6, v7

    div-int/2addr v6, v4

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v6

    const-wide/16 v7, 0x12c

    invoke-virtual {v6, v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v6

    iget-object v9, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v6, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v6, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider$2;

    invoke-direct {v6, p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider$2;-><init>(Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;)V

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    const-wide/16 v10, 0x0

    invoke-virtual {v9, v10, v11}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setStartDelay(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    const-wide/16 v11, 0x96

    invoke-virtual {v9, v11, v12}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    iget-object v11, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v9, v11}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v9

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v11

    sub-int/2addr v9, v11

    div-int/2addr v9, v4

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v11

    sub-int/2addr v9, v11

    int-to-float v9, v9

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v11

    invoke-virtual {v11, v9}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    iget-object v11, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v9, v11}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {v5}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v9, v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    iget-object v10, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {v9, v10}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v9

    sub-int/2addr p1, v9

    div-int/2addr p1, v4

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v4

    sub-int/2addr p1, v4

    int-to-float p1, p1

    invoke-static {v5}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v4

    invoke-virtual {v4, p1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->translationX(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v7, v8}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-virtual {p1, v4}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {p1, v6}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v5, v2}, Landroid/view/View;->setEnabled(Z)V

    return-object v0
.end method
