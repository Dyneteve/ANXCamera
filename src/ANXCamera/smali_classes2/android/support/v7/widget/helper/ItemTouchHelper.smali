.class public Landroid/support/v7/widget/helper/ItemTouchHelper;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "ItemTouchHelper.java"

# interfaces
.implements Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;,
        Landroid/support/v7/widget/helper/ItemTouchHelper$ItemTouchHelperGestureListener;,
        Landroid/support/v7/widget/helper/ItemTouchHelper$SimpleCallback;,
        Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;,
        Landroid/support/v7/widget/helper/ItemTouchHelper$ViewDropHandler;
    }
.end annotation


# static fields
.field private static final ACTION_MODE_DRAG_MASK:I = 0xff0000

.field private static final ACTION_MODE_IDLE_MASK:I = 0xff

.field private static final ACTION_MODE_SWIPE_MASK:I = 0xff00

.field public static final ACTION_STATE_DRAG:I = 0x2

.field public static final ACTION_STATE_IDLE:I = 0x0

.field public static final ACTION_STATE_SWIPE:I = 0x1

.field private static final ACTIVE_POINTER_ID_NONE:I = -0x1

.field public static final ANIMATION_TYPE_DRAG:I = 0x8

.field public static final ANIMATION_TYPE_SWIPE_CANCEL:I = 0x4

.field public static final ANIMATION_TYPE_SWIPE_SUCCESS:I = 0x2

.field private static final DEBUG:Z = false

.field private static final DIRECTION_FLAG_COUNT:I = 0x8

.field public static final DOWN:I = 0x2

.field public static final END:I = 0x20

.field public static final LEFT:I = 0x4

.field public static final RIGHT:I = 0x8

.field public static final START:I = 0x10

.field private static final TAG:Ljava/lang/String; = "ItemTouchHelper"

.field public static final UP:I = 0x1


# instance fields
.field mActionState:I

.field mActivePointerId:I

.field mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

.field private mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

.field private mDistances:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mDragScrollStartTimeInMs:J

.field mDx:F

.field mDy:F

.field private mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field mInitialTouchX:F

.field mInitialTouchY:F

.field private final mOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

.field private mOverdrawChild:Landroid/view/View;

.field private mOverdrawChildPosition:I

.field final mPendingCleanup:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field mRecoverAnimations:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;",
            ">;"
        }
    .end annotation
.end field

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final mScrollRunnable:Ljava/lang/Runnable;

.field mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

.field mSelectedFlags:I

.field mSelectedStartX:F

.field mSelectedStartY:F

.field private mSlop:I

.field private mSwapTargets:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private final mTmpPosition:[F

.field private mTmpRect:Landroid/graphics/Rect;

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V
    .registers 5

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mPendingCleanup:Ljava/util/List;

    const/4 v0, 0x2

    new-array v0, v0, [F

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    const/4 v2, 0x0

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    new-instance v2, Landroid/support/v7/widget/helper/ItemTouchHelper$1;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$1;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;)V

    iput-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mScrollRunnable:Ljava/lang/Runnable;

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    iput v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChildPosition:I

    new-instance v0, Landroid/support/v7/widget/helper/ItemTouchHelper$2;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$2;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;)V

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    iput-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    return-void
.end method

.method static synthetic access$000(Landroid/support/v7/widget/helper/ItemTouchHelper;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->scrollIfNecessary()Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->moveIfNecessary(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method static synthetic access$1000(Landroid/support/v7/widget/helper/ItemTouchHelper;ILandroid/view/MotionEvent;I)Z
    .registers 5

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/helper/ItemTouchHelper;->checkSelectForSwipe(ILandroid/view/MotionEvent;I)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/view/VelocityTracker;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    return-object v0
.end method

.method static synthetic access$1500(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->postDispatchSwipe(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V

    return-void
.end method

.method static synthetic access$1600(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$1700(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/view/View;)V
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->removeChildDrawingOrderCallbackIfNecessary(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$1800(Landroid/support/v7/widget/helper/ItemTouchHelper;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->hasRunningRecoverAnim()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Landroid/support/v7/widget/helper/ItemTouchHelper;)Ljava/lang/Runnable;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mScrollRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$2300(Landroid/support/v7/widget/helper/ItemTouchHelper;)I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChildPosition:I

    return v0
.end method

.method static synthetic access$2302(Landroid/support/v7/widget/helper/ItemTouchHelper;I)I
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChildPosition:I

    return p1
.end method

.method static synthetic access$2400(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/view/MotionEvent;)Landroid/view/View;
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findChildView(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v7/widget/RecyclerView;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v7/widget/helper/ItemTouchHelper;)Landroid/support/v4/view/GestureDetectorCompat;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/helper/ItemTouchHelper;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->obtainVelocityTracker()V

    return-void
.end method

.method static synthetic access$600(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/view/MotionEvent;)Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findAnimation(Landroid/view/MotionEvent;)Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)I
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->endRecoverAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)I

    move-result v0

    return v0
.end method

.method static synthetic access$800(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 3

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method static synthetic access$900(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/view/MotionEvent;II)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/helper/ItemTouchHelper;->updateDxDy(Landroid/view/MotionEvent;II)V

    return-void
.end method

.method private addChildDrawingOrderCallback()V
    .registers 3

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_7

    return-void

    :cond_7
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    if-nez v0, :cond_12

    new-instance v0, Landroid/support/v7/widget/helper/ItemTouchHelper$5;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$5;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;)V

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    :cond_12
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setChildDrawingOrderCallback(Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;)V

    return-void
.end method

.method private checkHorizontalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I
    .registers 9

    and-int/lit8 v0, p2, 0xc

    if-eqz v0, :cond_5c

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v2, 0x4

    const/16 v3, 0x8

    if-lez v0, :cond_10

    move v0, v3

    goto :goto_11

    :cond_10
    move v0, v2

    :goto_11
    iget-object v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_3f

    iget v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    const/4 v5, -0x1

    if-le v4, v5, :cond_3f

    iget-object v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    invoke-static {v4, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v4

    cmpl-float v1, v4, v1

    if-lez v1, :cond_28

    move v2, v3

    nop

    :cond_28
    move v1, v2

    and-int v2, v1, p2

    if-eqz v2, :cond_3f

    if-ne v0, v1, :cond_3f

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getMinFlingVelocity()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_3f

    return v1

    :cond_3f
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getSwipeThreshold(Landroid/support/v7/widget/RecyclerView$ViewHolder;)F

    move-result v2

    mul-float/2addr v1, v2

    and-int v2, p2, v0

    if-eqz v2, :cond_5c

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v1

    if-lez v2, :cond_5c

    return v0

    :cond_5c
    const/4 v0, 0x0

    return v0
.end method

.method private checkSelectForSwipe(ILandroid/view/MotionEvent;I)Z
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v3, 0x0

    if-nez v2, :cond_9c

    const/4 v2, 0x2

    move/from16 v4, p1

    if-ne v4, v2, :cond_9e

    iget v5, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    if-eq v5, v2, :cond_9e

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->isItemViewSwipeEnabled()Z

    move-result v2

    if-nez v2, :cond_1c

    goto/16 :goto_9e

    :cond_1c
    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getScrollState()I

    move-result v2

    const/4 v5, 0x1

    if-ne v2, v5, :cond_26

    return v3

    :cond_26
    invoke-direct {v0, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findSwipedView(Landroid/view/MotionEvent;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    if-nez v2, :cond_2d

    return v3

    :cond_2d
    iget-object v6, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v7, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v6, v7, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getAbsoluteMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v6

    const v7, 0xff00

    and-int/2addr v7, v6

    shr-int/lit8 v7, v7, 0x8

    if-nez v7, :cond_3e

    return v3

    :cond_3e
    invoke-static/range {p2 .. p3}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v8

    invoke-static/range {p2 .. p3}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v9

    iget v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchX:F

    sub-float v10, v8, v10

    iget v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchY:F

    sub-float v11, v9, v11

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v12

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v13

    iget v14, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSlop:I

    int-to-float v14, v14

    cmpg-float v14, v12, v14

    if-gez v14, :cond_65

    iget v14, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSlop:I

    int-to-float v14, v14

    cmpg-float v14, v13, v14

    if-gez v14, :cond_65

    return v3

    :cond_65
    cmpl-float v14, v12, v13

    const/4 v15, 0x0

    if-lez v14, :cond_7c

    cmpg-float v14, v10, v15

    if-gez v14, :cond_73

    and-int/lit8 v14, v7, 0x4

    if-nez v14, :cond_73

    return v3

    :cond_73
    cmpl-float v14, v10, v15

    if-lez v14, :cond_8e

    and-int/lit8 v14, v7, 0x8

    if-nez v14, :cond_8e

    return v3

    :cond_7c
    cmpg-float v14, v11, v15

    if-gez v14, :cond_85

    and-int/lit8 v14, v7, 0x1

    if-nez v14, :cond_85

    return v3

    :cond_85
    cmpl-float v14, v11, v15

    if-lez v14, :cond_8e

    and-int/lit8 v14, v7, 0x2

    if-nez v14, :cond_8e

    return v3

    :cond_8e
    iput v15, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    iput v15, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v3

    iput v3, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    invoke-direct {v0, v2, v5}, Landroid/support/v7/widget/helper/ItemTouchHelper;->select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return v5

    :cond_9c
    move/from16 v4, p1

    :cond_9e
    :goto_9e
    return v3
.end method

.method private checkVerticalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I
    .registers 9

    and-int/lit8 v0, p2, 0x3

    if-eqz v0, :cond_5b

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-lez v0, :cond_f

    move v0, v3

    goto :goto_10

    :cond_f
    move v0, v2

    :goto_10
    iget-object v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v4, :cond_3e

    iget v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    const/4 v5, -0x1

    if-le v4, v5, :cond_3e

    iget-object v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    invoke-static {v4, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v4

    cmpl-float v1, v4, v1

    if-lez v1, :cond_27

    move v2, v3

    nop

    :cond_27
    move v1, v2

    and-int v2, v1, p2

    if-eqz v2, :cond_3e

    if-ne v1, v0, :cond_3e

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getMinFlingVelocity()I

    move-result v3

    int-to-float v3, v3

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_3e

    return v1

    :cond_3e
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getSwipeThreshold(Landroid/support/v7/widget/RecyclerView$ViewHolder;)F

    move-result v2

    mul-float/2addr v1, v2

    and-int v2, p2, v0

    if-eqz v2, :cond_5b

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpl-float v2, v2, v1

    if-lez v2, :cond_5b

    return v0

    :cond_5b
    const/4 v0, 0x0

    return v0
.end method

.method private destroyCallbacks()V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroid/support/v7/widget/RecyclerView;->removeOnChildAttachStateChangeListener(Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;)V

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_19
    if-ltz v1, :cond_30

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v5, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v3, v4, v5}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->clearView(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    add-int/lit8 v1, v1, -0x1

    goto :goto_19

    :cond_30
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    const/4 v1, -0x1

    iput v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChildPosition:I

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->releaseVelocityTracker()V

    return-void
.end method

.method private endRecoverAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)I
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    if-ltz v1, :cond_37

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v3, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v3, p1, :cond_34

    iget-boolean v3, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mOverridden:Z

    or-int/2addr v3, p2

    iput-boolean v3, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mOverridden:Z

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mEnded:Z
    invoke-static {v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->access$1900(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;)Z

    move-result v3

    if-nez v3, :cond_24

    invoke-virtual {v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->cancel()V

    :cond_24
    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    iget-object v3, v2, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mAnimationType:I
    invoke-static {v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->access$2000(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;)I

    move-result v3

    return v3

    :cond_34
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_37
    const/4 v1, 0x0

    return v1
.end method

.method private findAnimation(Landroid/view/MotionEvent;)Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    return-object v1

    :cond_a
    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findChildView(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_16
    if-ltz v2, :cond_2a

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v4, v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-ne v4, v0, :cond_27

    return-object v3

    :cond_27
    add-int/lit8 v2, v2, -0x1

    goto :goto_16

    :cond_2a
    return-object v1
.end method

.method private findChildView(Landroid/view/MotionEvent;)Landroid/view/View;
    .registers 9

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v2, :cond_21

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    add-float/2addr v3, v4

    iget v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iget v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    add-float/2addr v4, v5

    invoke-static {v2, v0, v1, v3, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper;->hitTest(Landroid/view/View;FFFF)Z

    move-result v3

    if-eqz v3, :cond_21

    return-object v2

    :cond_21
    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_29
    if-ltz v2, :cond_45

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    iget-object v4, v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mViewHolder:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v4, v4, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget v5, v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mX:F

    iget v6, v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mY:F

    invoke-static {v4, v0, v1, v5, v6}, Landroid/support/v7/widget/helper/ItemTouchHelper;->hitTest(Landroid/view/View;FFFF)Z

    move-result v5

    if-eqz v5, :cond_42

    return-object v4

    :cond_42
    add-int/lit8 v2, v2, -0x1

    goto :goto_29

    :cond_45
    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v0, v1}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v2

    return-object v2
.end method

.method private findSwapTargets(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Ljava/util/List;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ")",
            "Ljava/util/List<",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    if-nez v2, :cond_17

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDistances:Ljava/util/List;

    goto :goto_21

    :cond_17
    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDistances:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    :goto_21
    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getBoundingBoxMargin()I

    move-result v2

    iget v3, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget v4, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    sub-int/2addr v3, v2

    iget v4, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iget v5, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    sub-int/2addr v4, v2

    iget-object v5, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v3

    const/4 v6, 0x2

    mul-int v7, v6, v2

    add-int/2addr v5, v7

    iget-object v7, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getHeight()I

    move-result v7

    add-int/2addr v7, v4

    mul-int v8, v6, v2

    add-int/2addr v7, v8

    add-int v8, v3, v5

    div-int/2addr v8, v6

    add-int v9, v4, v7

    div-int/2addr v9, v6

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v10

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v11

    const/4 v13, 0x0

    :goto_61
    if-ge v13, v11, :cond_116

    invoke-virtual {v10, v13}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    iget-object v15, v1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-ne v14, v15, :cond_72

    nop

    :goto_6c
    move/from16 v19, v2

    move/from16 v21, v3

    goto/16 :goto_10b

    :cond_72
    invoke-virtual {v14}, Landroid/view/View;->getBottom()I

    move-result v15

    if-lt v15, v4, :cond_107

    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    move-result v15

    if-gt v15, v7, :cond_107

    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v15

    if-lt v15, v3, :cond_107

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v15

    if-le v15, v5, :cond_8b

    goto :goto_6c

    :cond_8b
    iget-object v15, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v15, v14}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v15

    iget-object v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v6, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    invoke-virtual {v12, v6, v1, v15}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->canDropOver(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v1

    if-eqz v1, :cond_107

    invoke-virtual {v14}, Landroid/view/View;->getLeft()I

    move-result v1

    invoke-virtual {v14}, Landroid/view/View;->getRight()I

    move-result v6

    add-int/2addr v1, v6

    const/4 v6, 0x2

    div-int/2addr v1, v6

    sub-int v1, v8, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    invoke-virtual {v14}, Landroid/view/View;->getTop()I

    move-result v12

    invoke-virtual {v14}, Landroid/view/View;->getBottom()I

    move-result v16

    add-int v12, v12, v16

    div-int/2addr v12, v6

    sub-int v12, v9, v12

    invoke-static {v12}, Ljava/lang/Math;->abs(I)I

    move-result v12

    mul-int v16, v1, v1

    mul-int v17, v12, v12

    add-int v6, v16, v17

    const/16 v16, 0x0

    move/from16 v18, v1

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    move/from16 v19, v2

    move/from16 v2, v16

    const/16 v16, 0x0

    :goto_d5
    move/from16 v20, v16

    move/from16 v21, v3

    move/from16 v3, v20

    if-ge v3, v1, :cond_f6

    move/from16 v22, v1

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDistances:Ljava/util/List;

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-le v6, v1, :cond_f8

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v16, v3, 0x1

    move/from16 v3, v21

    move/from16 v1, v22

    goto :goto_d5

    :cond_f6
    move/from16 v22, v1

    :cond_f8
    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    invoke-interface {v1, v2, v15}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDistances:Ljava/util/List;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_10b

    :cond_107
    move/from16 v19, v2

    move/from16 v21, v3

    :goto_10b
    add-int/lit8 v13, v13, 0x1

    move/from16 v2, v19

    move/from16 v3, v21

    move-object/from16 v1, p1

    const/4 v6, 0x2

    goto/16 :goto_61

    :cond_116
    move/from16 v19, v2

    move/from16 v21, v3

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    return-object v1
.end method

.method private findSwipedView(Landroid/view/MotionEvent;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .registers 10

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_d

    return-object v2

    :cond_d
    iget v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActivePointerId:I

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v1

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    iget v4, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchX:F

    sub-float/2addr v3, v4

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    iget v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchY:F

    sub-float/2addr v4, v5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSlop:I

    int-to-float v7, v7

    cmpg-float v7, v5, v7

    if-gez v7, :cond_38

    iget v7, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSlop:I

    int-to-float v7, v7

    cmpg-float v7, v6, v7

    if-gez v7, :cond_38

    return-object v2

    :cond_38
    cmpl-float v7, v5, v6

    if-lez v7, :cond_43

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v7

    if-eqz v7, :cond_43

    return-object v2

    :cond_43
    cmpl-float v7, v6, v5

    if-lez v7, :cond_4e

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v7

    if-eqz v7, :cond_4e

    return-object v2

    :cond_4e
    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findChildView(Landroid/view/MotionEvent;)Landroid/view/View;

    move-result-object v7

    if-nez v7, :cond_55

    return-object v2

    :cond_55
    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v7}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v2

    return-object v2
.end method

.method private getSelectedDxDy([F)V
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedFlags:I

    and-int/lit8 v0, v0, 0xc

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    add-float/2addr v0, v2

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    aput v0, p1, v1

    goto :goto_23

    :cond_19
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationX(Landroid/view/View;)F

    move-result v0

    aput v0, p1, v1

    :goto_23
    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedFlags:I

    and-int/lit8 v0, v0, 0x3

    const/4 v1, 0x1

    if-eqz v0, :cond_3c

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    add-float/2addr v0, v2

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    aput v0, p1, v1

    goto :goto_46

    :cond_3c
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getTranslationY(Landroid/view/View;)F

    move-result v0

    aput v0, p1, v1

    :goto_46
    return-void
.end method

.method private hasRunningRecoverAnim()Z
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_1d

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;

    # getter for: Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->mEnded:Z
    invoke-static {v3}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->access$1900(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;)Z

    move-result v3

    if-nez v3, :cond_1a

    const/4 v1, 0x1

    return v1

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1d
    return v1
.end method

.method private static hitTest(Landroid/view/View;FFFF)Z
    .registers 6

    cmpl-float v0, p1, p3

    if-ltz v0, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p3

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_1e

    cmpl-float v0, p2, p4

    if-ltz v0, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p4

    cmpg-float v0, p2, v0

    if-gtz v0, :cond_1e

    const/4 v0, 0x1

    goto :goto_1f

    :cond_1e
    const/4 v0, 0x0

    :goto_1f
    return v0
.end method

.method private initGestureDetector()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/support/v7/widget/helper/ItemTouchHelper$ItemTouchHelperGestureListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Landroid/support/v7/widget/helper/ItemTouchHelper$ItemTouchHelperGestureListener;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/helper/ItemTouchHelper$1;)V

    invoke-direct {v0, v1, v2}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    return-void
.end method

.method private moveIfNecessary(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v9, p1

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->isLayoutRequested()Z

    move-result v1

    if-eqz v1, :cond_d

    return-void

    :cond_d
    iget v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    const/4 v2, 0x2

    if-eq v1, v2, :cond_13

    return-void

    :cond_13
    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v1, v9}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getMoveThreshold(Landroid/support/v7/widget/RecyclerView$ViewHolder;)F

    move-result v10

    iget v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    add-float/2addr v1, v2

    float-to-int v11, v1

    iget v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iget v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    add-float/2addr v1, v2

    float-to-int v12, v1

    iget-object v1, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    sub-int v1, v12, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v10

    cmpg-float v1, v1, v2

    if-gez v1, :cond_58

    iget-object v1, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int v1, v11, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget-object v2, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v10

    cmpg-float v1, v1, v2

    if-gez v1, :cond_58

    return-void

    :cond_58
    invoke-direct/range {p0 .. p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->findSwapTargets(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v1

    if-nez v1, :cond_63

    return-void

    :cond_63
    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    invoke-virtual {v1, v9, v13, v11, v12}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->chooseDropTarget(Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/util/List;II)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v14

    if-nez v14, :cond_76

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSwapTargets:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDistances:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    return-void

    :cond_76
    invoke-virtual {v14}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v15

    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v16

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2, v9, v14}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v1

    if-eqz v1, :cond_96

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    move-object v3, v9

    move/from16 v4, v16

    move-object v5, v14

    move v6, v15

    move v7, v11

    move v8, v12

    invoke-virtual/range {v1 .. v8}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onMoved(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;ILandroid/support/v7/widget/RecyclerView$ViewHolder;III)V

    :cond_96
    return-void
.end method

.method private obtainVelocityTracker()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    :cond_9
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    return-void
.end method

.method private postDispatchSwipe(Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/helper/ItemTouchHelper$4;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper$4;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;I)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private releaseVelocityTracker()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_c

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_c
    return-void
.end method

.method private removeChildDrawingOrderCallbackIfNecessary(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    if-ne p1, v0, :cond_10

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mChildDrawingOrderCallback:Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;

    if-eqz v1, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setChildDrawingOrderCallback(Landroid/support/v7/widget/RecyclerView$ChildDrawingOrderCallback;)V

    :cond_10
    return-void
.end method

.method private scrollIfNecessary()Z
    .registers 24

    move-object/from16 v0, p0

    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x0

    const-wide/high16 v3, -0x8000000000000000L

    if-nez v1, :cond_c

    iput-wide v3, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    return v2

    :cond_c
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    iget-wide v7, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    cmp-long v1, v7, v3

    if-nez v1, :cond_1a

    const-wide/16 v7, 0x0

    :goto_18
    move-wide v14, v7

    goto :goto_1f

    :cond_1a
    iget-wide v7, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    sub-long v7, v5, v7

    goto :goto_18

    :goto_1f
    iget-object v1, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    iget-object v7, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    if-nez v7, :cond_30

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    iput-object v7, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    :cond_30
    const/4 v7, 0x0

    const/4 v8, 0x0

    iget-object v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v9, v9, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v9, v10}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    move-result v9

    const/4 v10, 0x0

    if-eqz v9, :cond_85

    iget v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    add-float/2addr v9, v11

    float-to-int v9, v9

    iget-object v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->left:I

    sub-int v11, v9, v11

    iget-object v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v12}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result v12

    sub-int/2addr v11, v12

    iget v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    cmpg-float v12, v12, v10

    if-gez v12, :cond_5f

    if-gez v11, :cond_5f

    move v7, v11

    goto :goto_85

    :cond_5f
    iget v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    cmpl-float v12, v12, v10

    if-lez v12, :cond_85

    iget-object v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v12, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    move-result v12

    add-int/2addr v12, v9

    iget-object v13, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->right:I

    add-int/2addr v12, v13

    iget-object v13, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v13}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v13

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v13, v2

    sub-int/2addr v12, v13

    if-lez v12, :cond_85

    move v2, v12

    move v7, v2

    :cond_85
    :goto_85
    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    move-result v2

    if-eqz v2, :cond_cd

    iget v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iget v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    add-float/2addr v2, v9

    float-to-int v2, v2

    iget-object v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->top:I

    sub-int v9, v2, v9

    iget-object v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v11

    sub-int/2addr v9, v11

    iget v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    cmpg-float v11, v11, v10

    if-gez v11, :cond_a8

    if-gez v9, :cond_a8

    move v8, v9

    goto :goto_cd

    :cond_a8
    iget v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    cmpl-float v10, v11, v10

    if-lez v10, :cond_cd

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v10, v2

    iget-object v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpRect:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v10, v11

    iget-object v11, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v11}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v11

    iget-object v12, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v12}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result v12

    sub-int/2addr v11, v12

    sub-int/2addr v10, v11

    if-lez v10, :cond_cd

    move v8, v10

    :cond_cd
    :goto_cd
    if-eqz v7, :cond_e6

    iget-object v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v2, v2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v11

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v13

    move v12, v7

    invoke-virtual/range {v9 .. v15}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->interpolateOutOfBoundsScroll(Landroid/support/v7/widget/RecyclerView;IIIJ)I

    move-result v7

    :cond_e6
    if-eqz v8, :cond_106

    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v10, v10, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v18

    iget-object v10, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v10}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v20

    move-object/from16 v16, v2

    move-object/from16 v17, v9

    move/from16 v19, v8

    move-wide/from16 v21, v14

    invoke-virtual/range {v16 .. v22}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->interpolateOutOfBoundsScroll(Landroid/support/v7/widget/RecyclerView;IIIJ)I

    move-result v8

    :cond_106
    if-nez v7, :cond_10f

    if-eqz v8, :cond_10b

    goto :goto_10f

    :cond_10b
    iput-wide v3, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    const/4 v2, 0x0

    return v2

    :cond_10f
    :goto_10f
    iget-wide v9, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    cmp-long v2, v9, v3

    if-nez v2, :cond_117

    iput-wide v5, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    :cond_117
    iget-object v2, v0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v7, v8}, Landroid/support/v7/widget/RecyclerView;->scrollBy(II)V

    const/4 v2, 0x1

    return v2
.end method

.method private select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .registers 31

    move-object/from16 v11, p0

    move-object/from16 v12, p1

    move/from16 v13, p2

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v12, v0, :cond_f

    iget v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    if-ne v13, v0, :cond_f

    return-void

    :cond_f
    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDragScrollStartTimeInMs:J

    iget v14, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    const/4 v15, 0x1

    invoke-direct {v11, v12, v15}, Landroid/support/v7/widget/helper/ItemTouchHelper;->endRecoverAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)I

    iput v13, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    const/4 v10, 0x2

    if-ne v13, v10, :cond_25

    iget-object v0, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iput-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChild:Landroid/view/View;

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->addChildDrawingOrderCallback()V

    :cond_25
    const/16 v9, 0x8

    mul-int v0, v9, v13

    add-int/2addr v0, v9

    shl-int v0, v15, v0

    add-int/lit8 v16, v0, -0x1

    const/16 v17, 0x0

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v8, 0x0

    if-eqz v0, :cond_f7

    iget-object v7, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v7, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_de

    if-ne v14, v10, :cond_43

    move v0, v8

    goto :goto_47

    :cond_43
    invoke-direct {v11, v7}, Landroid/support/v7/widget/helper/ItemTouchHelper;->swipeIfNecessary(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v0

    :goto_47
    move v6, v0

    invoke-direct/range {p0 .. p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->releaseVelocityTracker()V

    const/4 v0, 0x4

    if-eq v6, v0, :cond_72

    if-eq v6, v9, :cond_72

    const/16 v1, 0x10

    if-eq v6, v1, :cond_72

    const/16 v1, 0x20

    if-eq v6, v1, :cond_72

    packed-switch v6, :pswitch_data_15a

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_5d
    move/from16 v18, v1

    move/from16 v19, v2

    goto :goto_86

    :pswitch_62
    const/4 v1, 0x0

    iget v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    iget-object v3, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    goto :goto_5d

    :cond_72
    const/4 v1, 0x0

    iget v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v2}, Ljava/lang/Math;->signum(F)F

    move-result v2

    iget-object v3, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    nop

    move/from16 v19, v1

    move/from16 v18, v2

    :goto_86
    if-ne v14, v10, :cond_8b

    const/16 v0, 0x8

    :goto_8a
    goto :goto_90

    :cond_8b
    if-lez v6, :cond_8f

    const/4 v0, 0x2

    goto :goto_8a

    :cond_8f
    nop

    :goto_90
    move v5, v0

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    invoke-direct {v11, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->getSelectedDxDy([F)V

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    aget v20, v0, v8

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    aget v21, v0, v15

    new-instance v22, Landroid/support/v7/widget/helper/ItemTouchHelper$3;

    move-object/from16 v0, v22

    move-object v1, v11

    move-object v2, v7

    move v3, v5

    move v4, v14

    move v15, v5

    move/from16 v5, v20

    move/from16 v23, v6

    move/from16 v6, v21

    move-object/from16 v24, v7

    move/from16 v7, v18

    move/from16 v25, v14

    move v14, v8

    move/from16 v8, v19

    move/from16 v26, v9

    move/from16 v9, v23

    move v14, v10

    move-object/from16 v10, v24

    invoke-direct/range {v0 .. v10}, Landroid/support/v7/widget/helper/ItemTouchHelper$3;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper;Landroid/support/v7/widget/RecyclerView$ViewHolder;IIFFFFILandroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    sub-float v3, v18, v20

    sub-float v4, v19, v21

    invoke-virtual {v1, v2, v15, v3, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getAnimationDuration(Landroid/support/v7/widget/RecyclerView;IFF)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->setDuration(J)V

    iget-object v3, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0}, Landroid/support/v7/widget/helper/ItemTouchHelper$RecoverAnimation;->start()V

    const/4 v0, 0x1

    nop

    move/from16 v17, v0

    move-object/from16 v0, v24

    goto :goto_f3

    :cond_de
    move-object/from16 v24, v7

    move/from16 v26, v9

    move/from16 v25, v14

    move v14, v10

    move-object/from16 v0, v24

    iget-object v1, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-direct {v11, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->removeChildDrawingOrderCallbackIfNecessary(Landroid/view/View;)V

    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->clearView(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :goto_f3
    const/4 v1, 0x0

    iput-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    goto :goto_fc

    :cond_f7
    move/from16 v26, v9

    move/from16 v25, v14

    move v14, v10

    :goto_fc
    if-eqz v12, :cond_12e

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1, v12}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getAbsoluteMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v0

    and-int v0, v0, v16

    iget v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    mul-int/lit8 v1, v1, 0x8

    shr-int/2addr v0, v1

    iput v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedFlags:I

    iget-object v0, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    iput v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartX:F

    iget-object v0, v12, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    iput v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelectedStartY:F

    iput-object v12, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v13, v14, :cond_12e

    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v0, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    goto :goto_12f

    :cond_12e
    const/4 v1, 0x0

    :goto_12f
    iget-object v0, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_140

    iget-object v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v2, :cond_13d

    const/4 v1, 0x1

    nop

    :cond_13d
    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_140
    if-nez v17, :cond_14b

    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->requestSimpleAnimationsInNextLayout()V

    :cond_14b
    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget v3, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v1, v11, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    return-void

    :pswitch_data_15a
    .packed-switch 0x1
        :pswitch_62
        :pswitch_62
    .end packed-switch
.end method

.method private setupCallbacks()V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSlop:I

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p0}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOnItemTouchListener:Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, p0}, Landroid/support/v7/widget/RecyclerView;->addOnChildAttachStateChangeListener(Landroid/support/v7/widget/RecyclerView$OnChildAttachStateChangeListener;)V

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->initGestureDetector()V

    return-void
.end method

.method private swipeIfNecessary(Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .registers 9

    iget v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_7

    return v1

    :cond_7
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v2, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->getMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v3, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v3

    invoke-virtual {v2, v0, v3}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->convertToAbsoluteDirection(II)I

    move-result v2

    const v3, 0xff00

    and-int v4, v2, v3

    shr-int/lit8 v4, v4, 0x8

    if-nez v4, :cond_25

    return v1

    :cond_25
    and-int/2addr v3, v0

    shr-int/lit8 v3, v3, 0x8

    iget v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v5

    iget v6, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_57

    invoke-direct {p0, p1, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper;->checkHorizontalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I

    move-result v5

    move v6, v5

    if-lez v5, :cond_4f

    and-int v1, v3, v6

    if-nez v1, :cond_4e

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {v6, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->convertToRelativeDirection(II)I

    move-result v1

    return v1

    :cond_4e
    return v6

    :cond_4f
    invoke-direct {p0, p1, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper;->checkVerticalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I

    move-result v5

    move v6, v5

    if-lez v5, :cond_76

    return v6

    :cond_57
    invoke-direct {p0, p1, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper;->checkVerticalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I

    move-result v5

    move v6, v5

    if-lez v5, :cond_5f

    return v6

    :cond_5f
    invoke-direct {p0, p1, v4}, Landroid/support/v7/widget/helper/ItemTouchHelper;->checkHorizontalSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)I

    move-result v5

    move v6, v5

    if-lez v5, :cond_76

    and-int v1, v3, v6

    if-nez v1, :cond_75

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    invoke-static {v6, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->convertToRelativeDirection(II)I

    move-result v1

    return v1

    :cond_75
    return v6

    :cond_76
    return v1
.end method

.method private updateDxDy(Landroid/view/MotionEvent;II)V
    .registers 8

    invoke-static {p1, p3}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v0

    invoke-static {p1, p3}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchX:F

    sub-float v2, v0, v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mInitialTouchY:F

    sub-float v2, v1, v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    and-int/lit8 v2, p2, 0x4

    const/4 v3, 0x0

    if-nez v2, :cond_21

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    :cond_21
    and-int/lit8 v2, p2, 0x8

    if-nez v2, :cond_2d

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    :cond_2d
    and-int/lit8 v2, p2, 0x1

    if-nez v2, :cond_39

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    :cond_39
    and-int/lit8 v2, p2, 0x2

    if-nez v2, :cond_45

    iget v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iput v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    :cond_45
    return-void
.end method


# virtual methods
.method public attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_c

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->destroyCallbacks()V

    :cond_c
    iput-object p1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_15

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->setupCallbacks()V

    :cond_15
    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 5

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    return-void
.end method

.method public onChildViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public onChildViewDetachedFromWindow(Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->removeChildDrawingOrderCallbackIfNecessary(Landroid/view/View;)V

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    if-nez v0, :cond_c

    return-void

    :cond_c
    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    const/4 v2, 0x0

    if-eqz v1, :cond_1a

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-ne v0, v1, :cond_1a

    const/4 v1, 0x0

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    goto :goto_2e

    :cond_1a
    invoke-direct {p0, v0, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->endRecoverAnimation(Landroid/support/v7/widget/RecyclerView$ViewHolder;Z)I

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mPendingCleanup:Ljava/util/List;

    iget-object v2, v0, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-interface {v1, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2e

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v2, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->clearView(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_2e
    :goto_2e
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 14

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mOverdrawChildPosition:I

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v2, :cond_18

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    invoke-direct {p0, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->getSelectedDxDy([F)V

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    const/4 v3, 0x0

    aget v0, v2, v3

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    const/4 v3, 0x1

    aget v1, v2, v3

    :cond_18
    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v6, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    iget v7, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    move-object v3, p1

    move-object v4, p2

    move v8, v0

    move v9, v1

    # invokes: Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/util/List;IFF)V
    invoke-static/range {v2 .. v9}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->access$1400(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/util/List;IFF)V

    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 14

    const/4 v0, 0x0

    const/4 v1, 0x0

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    if-eqz v2, :cond_15

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    invoke-direct {p0, v2}, Landroid/support/v7/widget/helper/ItemTouchHelper;->getSelectedDxDy([F)V

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    const/4 v3, 0x0

    aget v0, v2, v3

    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mTmpPosition:[F

    const/4 v3, 0x1

    aget v1, v2, v3

    :cond_15
    iget-object v2, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v5, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mSelected:Landroid/support/v7/widget/RecyclerView$ViewHolder;

    iget-object v6, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecoverAnimations:Ljava/util/List;

    iget v7, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mActionState:I

    move-object v3, p1

    move-object v4, p2

    move v8, v0

    move v9, v1

    # invokes: Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/util/List;IFF)V
    invoke-static/range {v2 .. v9}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->access$1300(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Ljava/util/List;IFF)V

    return-void
.end method

.method public startDrag(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->hasDragFlag(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    invoke-static {v0, v1, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->access$2100(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "ItemTouchHelper"

    const-string v1, "Start drag has been called but swiping is not enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_12
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eq v0, v1, :cond_24

    const-string v0, "ItemTouchHelper"

    const-string v1, "Start drag has been called with a view holder which is not a child of the RecyclerView which is controlled by this ItemTouchHelper."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_24
    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->obtainVelocityTracker()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public startSwipe(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mCallback:Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    # invokes: Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->hasSwipeFlag(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    invoke-static {v0, v1, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->access$2200(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-nez v0, :cond_12

    const-string v0, "ItemTouchHelper"

    const-string v1, "Start swipe has been called but dragging is not enabled"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_12
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    if-eq v0, v1, :cond_24

    const-string v0, "ItemTouchHelper"

    const-string v1, "Start swipe has been called with a view holder which is not a child of the RecyclerView controlled by this ItemTouchHelper."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_24
    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->obtainVelocityTracker()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDy:F

    iput v0, p0, Landroid/support/v7/widget/helper/ItemTouchHelper;->mDx:F

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/helper/ItemTouchHelper;->select(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method
