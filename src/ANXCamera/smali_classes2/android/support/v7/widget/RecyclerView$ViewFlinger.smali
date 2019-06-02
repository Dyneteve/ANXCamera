.class Landroid/support/v7/widget/RecyclerView$ViewFlinger;
.super Ljava/lang/Object;
.source "RecyclerView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/RecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewFlinger"
.end annotation


# instance fields
.field private mEatRunOnAnimationRequest:Z

.field private mInterpolator:Landroid/view/animation/Interpolator;

.field private mLastFlingX:I

.field private mLastFlingY:I

.field private mReSchedulePostAnimationCallback:Z

.field private mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field final synthetic this$0:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2200()Landroid/view/animation/Interpolator;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2200()Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    return-void
.end method

.method private computeScrollDuration(IIII)I
    .registers 20

    move-object v0, p0

    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    if-le v1, v2, :cond_d

    const/4 v3, 0x1

    goto :goto_e

    :cond_d
    const/4 v3, 0x0

    :goto_e
    mul-int v4, p3, p3

    mul-int v5, p4, p4

    add-int/2addr v4, v5

    int-to-double v5, v4

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    double-to-int v4, v5

    mul-int v6, p1, p1

    mul-int v7, p2, p2

    add-int/2addr v6, v7

    int-to-double v7, v6

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-int v6, v7

    if-eqz v3, :cond_2d

    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v7

    goto :goto_33

    :cond_2d
    iget-object v7, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v7

    :goto_33
    div-int/lit8 v8, v7, 0x2

    int-to-float v9, v6

    const/high16 v10, 0x3f800000    # 1.0f

    mul-float/2addr v9, v10

    int-to-float v11, v7

    div-float/2addr v9, v11

    invoke-static {v10, v9}, Ljava/lang/Math;->min(FF)F

    move-result v9

    int-to-float v11, v8

    int-to-float v12, v8

    invoke-direct {v0, v9}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->distanceInfluenceForSnapDuration(F)F

    move-result v13

    mul-float/2addr v12, v13

    add-float/2addr v11, v12

    if-lez v4, :cond_5a

    const/high16 v12, 0x447a0000    # 1000.0f

    int-to-float v10, v4

    div-float v10, v11, v10

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v10

    mul-float/2addr v12, v10

    invoke-static {v12}, Ljava/lang/Math;->round(F)I

    move-result v10

    const/4 v12, 0x4

    mul-int/2addr v10, v12

    goto :goto_68

    :cond_5a
    if-eqz v3, :cond_5e

    move v12, v1

    goto :goto_5f

    :cond_5e
    move v12, v2

    :goto_5f
    int-to-float v12, v12

    int-to-float v0, v7

    div-float v0, v12, v0

    add-float/2addr v0, v10

    const/high16 v10, 0x43960000    # 300.0f

    mul-float/2addr v0, v10

    float-to-int v10, v0

    :goto_68
    move v0, v10

    const/16 v10, 0x7d0

    invoke-static {v0, v10}, Ljava/lang/Math;->min(II)I

    move-result v10

    return v10
.end method

.method private disableRunOnAnimationRequests()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    return-void
.end method

.method private distanceInfluenceForSnapDuration(F)F
    .registers 6

    const/high16 v0, 0x3f000000    # 0.5f

    sub-float/2addr p1, v0

    float-to-double v0, p1

    const-wide v2, 0x3fde28c7460698c7L    # 0.4712389167638204

    mul-double/2addr v0, v2

    double-to-float p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method private enableRunOnAnimationRequests()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    if-eqz v0, :cond_a

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    :cond_a
    return-void
.end method


# virtual methods
.method public fling(II)V
    .registers 13

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x2

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView;->access$3200(Landroid/support/v7/widget/RecyclerView;I)V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v6, -0x80000000

    const v7, 0x7fffffff

    const/high16 v8, -0x80000000

    const v9, 0x7fffffff

    move v4, p1

    move v5, p2

    invoke-virtual/range {v1 .. v9}, Landroid/support/v4/widget/ScrollerCompat;->fling(IIIIIIII)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    return-void
.end method

.method postOnAnimation()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mEatRunOnAnimationRequest:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    goto :goto_12

    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v0, p0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :goto_12
    return-void
.end method

.method public run()V
    .registers 22

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->disableRunOnAnimationRequests()V

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->consumePendingUpdateOperations()V
    invoke-static {v1}, Landroid/support/v7/widget/RecyclerView;->access$2300(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v2}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView$LayoutManager;->mSmoothScroller:Landroid/support/v7/widget/RecyclerView$SmoothScroller;

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v3

    if-eqz v3, :cond_1e8

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v3

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v5

    iget v6, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    sub-int v6, v3, v6

    iget v7, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    sub-int v7, v5, v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    iput v3, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    iput v5, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    const/4 v10, 0x0

    const/4 v11, 0x0

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$2400(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v12

    if-eqz v12, :cond_126

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v12}, Landroid/support/v7/widget/RecyclerView;->eatRequestLayout()V

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->onEnterLayoutOrScroll()V
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$2500(Landroid/support/v7/widget/RecyclerView;)V

    const-string v12, "RV Scroll"

    invoke-static {v12}, Landroid/support/v4/os/TraceCompat;->beginSection(Ljava/lang/String;)V

    if-eqz v6, :cond_5f

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v12

    iget-object v13, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v13, v13, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v14, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v14, v14, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v12, v6, v13, v14}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v8

    sub-int v10, v6, v8

    :cond_5f
    if-eqz v7, :cond_75

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v12

    iget-object v13, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v13, v13, Landroid/support/v7/widget/RecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView$Recycler;

    iget-object v14, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v14, v14, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v12, v7, v13, v14}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v9

    sub-int v11, v7, v9

    :cond_75
    invoke-static {}, Landroid/support/v4/os/TraceCompat;->endSection()V

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->supportsChangeAnimations()Z
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$2600(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v12

    if-eqz v12, :cond_dd

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v12, v12, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v12}, Landroid/support/v7/widget/ChildHelper;->getChildCount()I

    move-result v12

    const/4 v13, 0x0

    :goto_89
    if-ge v13, v12, :cond_dd

    iget-object v14, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v14, v14, Landroid/support/v7/widget/RecyclerView;->mChildHelper:Landroid/support/v7/widget/ChildHelper;

    invoke-virtual {v14, v13}, Landroid/support/v7/widget/ChildHelper;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    iget-object v15, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v15, v14}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v15

    if-eqz v15, :cond_ce

    iget-object v4, v15, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v4, :cond_ce

    iget-object v4, v15, Landroid/support/v7/widget/RecyclerView$ViewHolder;->mShadowingHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    move/from16 v16, v8

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v8

    move/from16 v17, v9

    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    move-result v9

    move/from16 v18, v12

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v12

    if-ne v8, v12, :cond_bd

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v12

    if-eq v9, v12, :cond_d4

    :cond_bd
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v12

    add-int/2addr v12, v8

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v19

    move-object/from16 v20, v14

    add-int v14, v9, v19

    invoke-virtual {v4, v8, v9, v12, v14}, Landroid/view/View;->layout(IIII)V

    goto :goto_d4

    :cond_ce
    move/from16 v16, v8

    move/from16 v17, v9

    move/from16 v18, v12

    :cond_d4
    :goto_d4
    add-int/lit8 v13, v13, 0x1

    move/from16 v8, v16

    move/from16 v9, v17

    move/from16 v12, v18

    goto :goto_89

    :cond_dd
    move/from16 v16, v8

    move/from16 v17, v9

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->onExitLayoutOrScroll()V
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView;->access$2700(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Landroid/support/v7/widget/RecyclerView;->resumeRequestLayout(Z)V

    if-eqz v2, :cond_122

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isPendingInitialRun()Z

    move-result v4

    if-nez v4, :cond_122

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_122

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView;->mState:Landroid/support/v7/widget/RecyclerView$State;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    if-nez v4, :cond_108

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    goto :goto_122

    :cond_108
    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->getTargetPosition()I

    move-result v8

    if-lt v8, v4, :cond_11b

    add-int/lit8 v8, v4, -0x1

    invoke-virtual {v2, v8}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->setTargetPosition(I)V

    sub-int v8, v6, v10

    sub-int v9, v7, v11

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v2, v8, v9}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2800(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    goto :goto_122

    :cond_11b
    sub-int v8, v6, v10

    sub-int v9, v7, v11

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v2, v8, v9}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2800(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    :cond_122
    :goto_122
    move/from16 v8, v16

    move/from16 v9, v17

    :cond_126
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mItemDecorations:Ljava/util/ArrayList;
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView;->access$2900(Landroid/support/v7/widget/RecyclerView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_137

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_137
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v4

    const/4 v12, 0x2

    if-eq v4, v12, :cond_145

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->considerReleasingGlowsOnScroll(II)V
    invoke-static {v4, v6, v7}, Landroid/support/v7/widget/RecyclerView;->access$3000(Landroid/support/v7/widget/RecyclerView;II)V

    :cond_145
    if-nez v10, :cond_149

    if-eqz v11, :cond_18c

    :cond_149
    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getCurrVelocity()F

    move-result v4

    float-to-int v4, v4

    const/4 v13, 0x0

    if-eq v10, v3, :cond_15b

    if-gez v10, :cond_155

    neg-int v14, v4

    goto :goto_15a

    :cond_155
    if-lez v10, :cond_159

    move v14, v4

    goto :goto_15a

    :cond_159
    const/4 v14, 0x0

    :goto_15a
    move v13, v14

    :cond_15b
    const/4 v14, 0x0

    if-eq v11, v5, :cond_168

    if-gez v11, :cond_162

    neg-int v15, v4

    goto :goto_167

    :cond_162
    if-lez v11, :cond_166

    move v15, v4

    goto :goto_167

    :cond_166
    const/4 v15, 0x0

    :goto_167
    move v14, v15

    :cond_168
    iget-object v15, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v15}, Landroid/support/v4/view/ViewCompat;->getOverScrollMode(Landroid/view/View;)I

    move-result v15

    if-eq v15, v12, :cond_175

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v12, v13, v14}, Landroid/support/v7/widget/RecyclerView;->absorbGlows(II)V

    :cond_175
    if-nez v13, :cond_17f

    if-eq v10, v3, :cond_17f

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getFinalX()I

    move-result v12

    if-nez v12, :cond_18c

    :cond_17f
    if-nez v14, :cond_189

    if-eq v11, v5, :cond_189

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getFinalY()I

    move-result v12

    if-nez v12, :cond_18c

    :cond_189
    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    :cond_18c
    if-nez v8, :cond_190

    if-eqz v9, :cond_195

    :cond_190
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4, v8, v9}, Landroid/support/v7/widget/RecyclerView;->dispatchOnScrolled(II)V

    :cond_195
    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/RecyclerView;->awakenScrollBars()Z
    invoke-static {v4}, Landroid/support/v7/widget/RecyclerView;->access$3100(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v4

    if-nez v4, :cond_1a2

    iget-object v4, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v4}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_1a2
    const/4 v4, 0x1

    if-eqz v7, :cond_1b5

    iget-object v12, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v12}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v12

    invoke-virtual {v12}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v12

    if-eqz v12, :cond_1b5

    if-ne v9, v7, :cond_1b5

    move v12, v4

    goto :goto_1b6

    :cond_1b5
    const/4 v12, 0x0

    :goto_1b6
    if-eqz v6, :cond_1c8

    iget-object v13, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    # getter for: Landroid/support/v7/widget/RecyclerView;->mLayout:Landroid/support/v7/widget/RecyclerView$LayoutManager;
    invoke-static {v13}, Landroid/support/v7/widget/RecyclerView;->access$1300(Landroid/support/v7/widget/RecyclerView;)Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v13

    invoke-virtual {v13}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v13

    if-eqz v13, :cond_1c8

    if-ne v8, v6, :cond_1c8

    move v13, v4

    goto :goto_1c9

    :cond_1c8
    const/4 v13, 0x0

    :goto_1c9
    if-nez v6, :cond_1cd

    if-eqz v7, :cond_1d4

    :cond_1cd
    if-nez v13, :cond_1d4

    if-eqz v12, :cond_1d2

    goto :goto_1d4

    :cond_1d2
    const/4 v4, 0x0

    nop

    :cond_1d4
    :goto_1d4
    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->isFinished()Z

    move-result v14

    if-nez v14, :cond_1e1

    if-nez v4, :cond_1dd

    goto :goto_1e1

    :cond_1dd
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    goto :goto_1e8

    :cond_1e1
    :goto_1e1
    iget-object v14, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v15, 0x0

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static {v14, v15}, Landroid/support/v7/widget/RecyclerView;->access$3200(Landroid/support/v7/widget/RecyclerView;I)V

    goto :goto_1e9

    :cond_1e8
    :goto_1e8
    const/4 v15, 0x0

    :goto_1e9
    if-eqz v2, :cond_1fb

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->isPendingInitialRun()Z

    move-result v3

    if-eqz v3, :cond_1f4

    # invokes: Landroid/support/v7/widget/RecyclerView$SmoothScroller;->onAnimation(II)V
    invoke-static {v2, v15, v15}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->access$2800(Landroid/support/v7/widget/RecyclerView$SmoothScroller;II)V

    :cond_1f4
    iget-boolean v3, v0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mReSchedulePostAnimationCallback:Z

    if-nez v3, :cond_1fb

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$SmoothScroller;->stop()V

    :cond_1fb
    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->enableRunOnAnimationRequests()V

    return-void
.end method

.method public smoothScrollBy(II)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIII)V

    return-void
.end method

.method public smoothScrollBy(III)V
    .registers 5

    # getter for: Landroid/support/v7/widget/RecyclerView;->sQuinticInterpolator:Landroid/view/animation/Interpolator;
    invoke-static {}, Landroid/support/v7/widget/RecyclerView;->access$2200()Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-virtual {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(IIILandroid/view/animation/Interpolator;)V

    return-void
.end method

.method public smoothScrollBy(IIII)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->computeScrollDuration(IIII)I

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->smoothScrollBy(III)V

    return-void
.end method

.method public smoothScrollBy(IIILandroid/view/animation/Interpolator;)V
    .registers 12

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    if-eq v0, p4, :cond_12

    iput-object p4, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mInterpolator:Landroid/view/animation/Interpolator;

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p4}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    :cond_12
    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x2

    # invokes: Landroid/support/v7/widget/RecyclerView;->setScrollState(I)V
    invoke-static {v0, v1}, Landroid/support/v7/widget/RecyclerView;->access$3200(Landroid/support/v7/widget/RecyclerView;I)V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingY:I

    iput v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mLastFlingX:I

    iget-object v1, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/widget/ScrollerCompat;->startScroll(IIIII)V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->postOnAnimation()V

    return-void
.end method

.method public stop()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->this$0:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Landroid/support/v7/widget/RecyclerView$ViewFlinger;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    return-void
.end method
