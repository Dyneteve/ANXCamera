.class Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;
.super Ljava/lang/Object;
.source "ItemTouchHelper.java"

# interfaces
.implements Landroid/support/v4/animation/AnimatorListenerCompat;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/helper/ItemTouchHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecoverAnimation"
.end annotation


# instance fields
.field final mActionState:I

.field private final mAnimationType:I

.field private mEnded:Z

.field private mFraction:F

.field public mIsPendingCleanup:Z

.field mOverridden:Z

.field final mStartDx:F

.field final mStartDy:F

.field final mTargetX:F

.field final mTargetY:F

.field private final mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

.field final mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field mX:F

.field mY:F

.field final synthetic this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIFFFF)V
    .registers 11

    iput-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->this$0:Landroid/support/v7/widget/helper/ItemTouchHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mOverridden:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mEnded:Z

    iput p4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mActionState:I

    iput p3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mAnimationType:I

    iput-object p2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iput p5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDx:F

    iput p6, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDy:F

    iput p7, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetX:F

    iput p8, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetY:F

    invoke-static {}, Landroid/support/v4/animation/AnimatorCompatHelper;->emptyValueAnimator()Landroid/support/v4/animation/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    new-instance v1, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation$1;

    invoke-direct {v1, p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation$1;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;Landroid/support/v7/widget/helper/ItemTouchHelper;)V

    invoke-interface {v0, v1}, Landroid/support/v4/animation/ValueAnimatorCompat;->addUpdateListener(Landroid/support/v4/animation/AnimatorUpdateListenerCompat;)V

    iget-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    iget-object v0, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-interface {p1, v0}, Landroid/support/v4/animation/ValueAnimatorCompat;->setTarget(Landroid/view/View;)V

    iget-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    invoke-interface {p1, p0}, Landroid/support/v4/animation/ValueAnimatorCompat;->addListener(Landroid/support/v4/animation/AnimatorListenerCompat;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->setFraction(F)V

    return-void
.end method

.method static synthetic access$1900(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mEnded:Z

    return v0
.end method

.method static synthetic access$2000(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;)I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mAnimationType:I

    return v0
.end method


# virtual methods
.method public cancel()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    invoke-interface {v0}, Landroid/support/v4/animation/ValueAnimatorCompat;->cancel()V

    return-void
.end method

.method public onAnimationCancel(Landroid/support/v4/animation/ValueAnimatorCompat;)V
    .registers 3

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->setFraction(F)V

    return-void
.end method

.method public onAnimationEnd(Landroid/support/v4/animation/ValueAnimatorCompat;)V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mEnded:Z

    return-void
.end method

.method public onAnimationRepeat(Landroid/support/v4/animation/ValueAnimatorCompat;)V
    .registers 2

    return-void
.end method

.method public onAnimationStart(Landroid/support/v4/animation/ValueAnimatorCompat;)V
    .registers 2

    return-void
.end method

.method public setDuration(J)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    invoke-interface {v0, p1, p2}, Landroid/support/v4/animation/ValueAnimatorCompat;->setDuration(J)V

    return-void
.end method

.method public setFraction(F)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mFraction:F

    return-void
.end method

.method public start()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mValueAnimator:Landroid/support/v4/animation/ValueAnimatorCompat;

    invoke-interface {v0}, Landroid/support/v4/animation/ValueAnimatorCompat;->start()V

    return-void
.end method

.method public update()V
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDx:F

    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetX:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mX:F

    goto :goto_20

    :cond_13
    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDx:F

    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mFraction:F

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetX:F

    iget v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDx:F

    sub-float/2addr v2, v3

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mX:F

    :goto_20
    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDy:F

    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetY:F

    cmpl-float v0, v0, v1

    if-nez v0, :cond_33

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mY:F

    goto :goto_40

    :cond_33
    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDy:F

    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mFraction:F

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mTargetY:F

    iget v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mStartDy:F

    sub-float/2addr v2, v3

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mY:F

    :goto_40
    return-void
.end method
