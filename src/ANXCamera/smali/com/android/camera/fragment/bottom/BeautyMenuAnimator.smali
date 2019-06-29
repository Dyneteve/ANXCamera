.class public Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;
.super Ljava/lang/Object;
.source "BeautyMenuAnimator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;,
        Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$CommonChildAnimationsProvider;,
        Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;
    }
.end annotation


# instance fields
.field private mAnimationsProviders:[Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;

.field private mExpand:Z

.field private mViewGroup:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;

    new-instance v2, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;

    invoke-direct {v2}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ThreeChildAnimationProvider;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$CommonChildAnimationsProvider;

    invoke-direct {v2}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$CommonChildAnimationsProvider;-><init>()V

    aput-object v2, v1, v0

    iput-object v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mAnimationsProviders:[Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;

    iput-object p1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    return-void
.end method

.method public static animator(Landroid/view/ViewGroup;)Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;
    .locals 1

    new-instance v0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;

    invoke-direct {v0, p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;-><init>(Landroid/view/ViewGroup;)V

    return-object v0
.end method

.method private getChildExpandAnimations()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/view/ViewPropertyAnimatorCompat;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mAnimationsProviders:[Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-interface {v3, v4}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;->expandAnimation(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getChildShrinkAnimations()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/support/v4/view/ViewPropertyAnimatorCompat;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mAnimationsProviders:[Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-interface {v3, v4}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator$ChildAnimationsProvider;->shrinkAnimation(Landroid/view/ViewGroup;)Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static triggerAnimators(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/view/ViewPropertyAnimatorCompat;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public expandAnimate()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->getChildExpandAnimations()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->triggerAnimators(Ljava/util/List;)V

    iput-boolean v1, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    :cond_2
    return-void
.end method

.method public getChildCount()I
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    return v0
.end method

.method public resetAll()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    return-void
.end method

.method public shrinkAnimate()V
    .locals 2

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->getChildShrinkAnimations()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {v0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->triggerAnimators(Ljava/util/List;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    :cond_2
    return-void
.end method

.method public shrinkImmediately()V
    .locals 6

    iget-boolean v0, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    return-void

    :cond_1
    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v4

    invoke-static {v2}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-static {v2, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    :goto_0
    if-ge v1, v0, :cond_2

    iget-object v2, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v4, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mViewGroup:Landroid/view/ViewGroup;

    invoke-virtual {v4}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v4

    invoke-static {v2}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v5

    sub-int/2addr v4, v5

    div-int/lit8 v4, v4, 0x2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    invoke-static {v2, v4}, Landroid/support/v4/view/ViewCompat;->setTranslationX(Landroid/view/View;F)V

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Landroid/view/View;->setAlpha(F)V

    const/4 v4, 0x4

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    iput-boolean v3, p0, Lcom/android/camera/fragment/bottom/BeautyMenuAnimator;->mExpand:Z

    return-void
.end method
