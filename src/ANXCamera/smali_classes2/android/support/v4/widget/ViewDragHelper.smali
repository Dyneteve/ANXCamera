.class public Landroid/support/v4/widget/ViewDragHelper;
.super Ljava/lang/Object;
.source "ViewDragHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/ViewDragHelper$Callback;
    }
.end annotation


# static fields
.field private static final BASE_SETTLE_DURATION:I = 0x100

.field public static final DIRECTION_ALL:I = 0x3

.field public static final DIRECTION_HORIZONTAL:I = 0x1

.field public static final DIRECTION_VERTICAL:I = 0x2

.field public static final EDGE_ALL:I = 0xf

.field public static final EDGE_BOTTOM:I = 0x8

.field public static final EDGE_LEFT:I = 0x1

.field public static final EDGE_RIGHT:I = 0x2

.field private static final EDGE_SIZE:I = 0x14

.field public static final EDGE_TOP:I = 0x4

.field public static final INVALID_POINTER:I = -0x1

.field private static final MAX_SETTLE_DURATION:I = 0x258

.field public static final STATE_DRAGGING:I = 0x1

.field public static final STATE_IDLE:I = 0x0

.field public static final STATE_SETTLING:I = 0x2

.field private static final TAG:Ljava/lang/String; = "ViewDragHelper"

.field private static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private mActivePointerId:I

.field private final mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

.field private mCapturedView:Landroid/view/View;

.field private mDragState:I

.field private mEdgeDragsInProgress:[I

.field private mEdgeDragsLocked:[I

.field private mEdgeSize:I

.field private mInitialEdgesTouched:[I

.field private mInitialMotionX:[F

.field private mInitialMotionY:[F

.field private mLastMotionX:[F

.field private mLastMotionY:[F

.field private mMaxVelocity:F

.field private mMinVelocity:F

.field private final mParentView:Landroid/view/ViewGroup;

.field private mPointersDown:I

.field private mReleaseInProgress:Z

.field private mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field private final mSetIdleRunnable:Ljava/lang/Runnable;

.field private mTouchSlop:I

.field private mTrackingEdges:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/support/v4/widget/ViewDragHelper$1;

    invoke-direct {v0}, Landroid/support/v4/widget/ViewDragHelper$1;-><init>()V

    sput-object v0, Landroid/support/v4/widget/ViewDragHelper;->sInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/support/v4/widget/ViewDragHelper$Callback;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    new-instance v0, Landroid/support/v4/widget/ViewDragHelper$2;

    invoke-direct {v0, p0}, Landroid/support/v4/widget/ViewDragHelper$2;-><init>(Landroid/support/v4/widget/ViewDragHelper;)V

    iput-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mSetIdleRunnable:Ljava/lang/Runnable;

    if-eqz p2, :cond_51

    if-eqz p3, :cond_49

    iput-object p2, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iput-object p3, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v2, 0x41a00000    # 20.0f

    mul-float/2addr v2, v1

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    float-to-int v2, v2

    iput v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    int-to-float v2, v2

    iput v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    sget-object v2, Landroid/support/v4/widget/ViewDragHelper;->sInterpolator:Landroid/view/animation/Interpolator;

    invoke-static {p1, v2}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;Landroid/view/animation/Interpolator;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    return-void

    :cond_49
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Callback may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_51
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Parent view may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private checkNewEdgeDrag(FFII)Z
    .registers 10

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v2, v2, p3

    and-int/2addr v2, p4

    const/4 v3, 0x0

    if-ne v2, p4, :cond_5a

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v2, p4

    if-eqz v2, :cond_5a

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    aget v2, v2, p3

    and-int/2addr v2, p4

    if-eq v2, p4, :cond_5a

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v2, v2, p3

    and-int/2addr v2, p4

    if-eq v2, p4, :cond_5a

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gtz v2, :cond_32

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v2, v2

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_32

    goto :goto_5a

    :cond_32
    const/high16 v2, 0x3f000000    # 0.5f

    mul-float/2addr v2, v1

    cmpg-float v2, v0, v2

    if-gez v2, :cond_49

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v2, p4}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeLock(I)Z

    move-result v2

    if-eqz v2, :cond_49

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    aget v4, v2, p3

    or-int/2addr v4, p4

    aput v4, v2, p3

    return v3

    :cond_49
    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v2, v2, p3

    and-int/2addr v2, p4

    if-nez v2, :cond_59

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_59

    const/4 v3, 0x1

    nop

    :cond_59
    return v3

    :cond_5a
    :goto_5a
    return v3
.end method

.method private checkTouchSlop(Landroid/view/View;FF)Z
    .registers 11

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v1, p1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewHorizontalDragRange(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x1

    if-lez v1, :cond_f

    move v1, v2

    goto :goto_10

    :cond_f
    move v1, v0

    :goto_10
    iget-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v3, p1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result v3

    if-lez v3, :cond_1a

    move v3, v2

    goto :goto_1b

    :cond_1a
    move v3, v0

    :goto_1b
    if-eqz v1, :cond_31

    if-eqz v3, :cond_31

    mul-float v4, p2, p2

    mul-float v5, p3, p3

    add-float/2addr v4, v5

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    iget v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    mul-int/2addr v5, v6

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_30

    move v0, v2

    nop

    :cond_30
    return v0

    :cond_31
    if-eqz v1, :cond_41

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_40

    move v0, v2

    nop

    :cond_40
    return v0

    :cond_41
    if-eqz v3, :cond_51

    invoke-static {p3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_50

    move v0, v2

    nop

    :cond_50
    return v0

    :cond_51
    return v0
.end method

.method private clampMag(FFF)F
    .registers 7

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v1, v0, p2

    const/4 v2, 0x0

    if-gez v1, :cond_a

    return v2

    :cond_a
    cmpl-float v1, v0, p3

    if-lez v1, :cond_16

    cmpl-float v1, p1, v2

    if-lez v1, :cond_14

    move v1, p3

    goto :goto_15

    :cond_14
    neg-float v1, p3

    :goto_15
    return v1

    :cond_16
    return p1
.end method

.method private clampMag(III)I
    .registers 6

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-ge v0, p2, :cond_8

    const/4 v1, 0x0

    return v1

    :cond_8
    if-le v0, p3, :cond_10

    if-lez p1, :cond_e

    move v1, p3

    goto :goto_f

    :cond_e
    neg-int v1, p3

    :goto_f
    return v1

    :cond_10
    return p1
.end method

.method private clearMotionHistory()V
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([FF)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    iput v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    return-void
.end method

.method private clearMotionHistory(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    const/4 v1, 0x0

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    const/4 v1, 0x0

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    aput v1, v0, p1

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    aput v1, v0, p1

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    const/4 v1, 0x1

    shl-int/2addr v1, p1

    not-int v1, v1

    and-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    return-void
.end method

.method private computeAxisDuration(III)I
    .registers 11

    if-nez p1, :cond_4

    const/4 v0, 0x0

    return v0

    :cond_4
    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    div-int/lit8 v1, v0, 0x2

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    int-to-float v4, v1

    int-to-float v5, v1

    invoke-direct {p0, v2}, Landroid/support/v4/widget/ViewDragHelper;->distanceInfluenceForSnapDuration(F)F

    move-result v6

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result p2

    if-lez p2, :cond_38

    const/4 v3, 0x4

    const/high16 v5, 0x447a0000    # 1000.0f

    int-to-float v6, p2

    div-float v6, v4, v6

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    mul-float/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    mul-int/2addr v3, v5

    goto :goto_44

    :cond_38
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v5

    int-to-float v5, v5

    int-to-float v6, p3

    div-float/2addr v5, v6

    add-float/2addr v3, v5

    const/high16 v6, 0x43800000    # 256.0f

    mul-float/2addr v3, v6

    float-to-int v3, v3

    :goto_44
    const/16 v5, 0x258

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    return v5
.end method

.method private computeSettleDuration(Landroid/view/View;IIII)I
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget v2, v0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    float-to-int v2, v2

    iget v3, v0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    float-to-int v3, v3

    move/from16 v4, p4

    invoke-direct {v0, v4, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->clampMag(III)I

    move-result v2

    iget v3, v0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    float-to-int v3, v3

    iget v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    float-to-int v4, v4

    move/from16 v5, p5

    invoke-direct {v0, v5, v3, v4}, Landroid/support/v4/widget/ViewDragHelper;->clampMag(III)I

    move-result v3

    invoke-static/range {p2 .. p2}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-static/range {p3 .. p3}, Ljava/lang/Math;->abs(I)I

    move-result v5

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v6

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v7

    add-int v8, v6, v7

    add-int v9, v4, v5

    if-eqz v2, :cond_36

    int-to-float v10, v6

    int-to-float v11, v8

    :goto_34
    div-float/2addr v10, v11

    goto :goto_39

    :cond_36
    int-to-float v10, v4

    int-to-float v11, v9

    goto :goto_34

    :goto_39
    if-eqz v3, :cond_3f

    int-to-float v11, v7

    int-to-float v12, v8

    :goto_3d
    div-float/2addr v11, v12

    goto :goto_42

    :cond_3f
    int-to-float v11, v5

    int-to-float v12, v9

    goto :goto_3d

    :goto_42
    iget-object v12, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v12, v1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewHorizontalDragRange(Landroid/view/View;)I

    move-result v12

    move/from16 v13, p2

    invoke-direct {v0, v13, v2, v12}, Landroid/support/v4/widget/ViewDragHelper;->computeAxisDuration(III)I

    move-result v12

    iget-object v14, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v14, v1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result v14

    move/from16 v15, p3

    invoke-direct {v0, v15, v3, v14}, Landroid/support/v4/widget/ViewDragHelper;->computeAxisDuration(III)I

    move-result v14

    int-to-float v0, v12

    mul-float/2addr v0, v10

    int-to-float v1, v14

    mul-float/2addr v1, v11

    add-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public static create(Landroid/view/ViewGroup;FLandroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;
    .registers 6

    invoke-static {p0, p2}, Landroid/support/v4/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;Landroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;

    move-result-object v0

    iget v1, v0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    div-float/2addr v2, p1

    mul-float/2addr v1, v2

    float-to-int v1, v1

    iput v1, v0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    return-object v0
.end method

.method public static create(Landroid/view/ViewGroup;Landroid/support/v4/widget/ViewDragHelper$Callback;)Landroid/support/v4/widget/ViewDragHelper;
    .registers 4

    new-instance v0, Landroid/support/v4/widget/ViewDragHelper;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0, p1}, Landroid/support/v4/widget/ViewDragHelper;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/support/v4/widget/ViewDragHelper$Callback;)V

    return-object v0
.end method

.method private dispatchViewReleased(FF)V
    .registers 6

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mReleaseInProgress:Z

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v1, v2, p1, p2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewReleased(Landroid/view/View;FF)V

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mReleaseInProgress:Z

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v2, v0, :cond_14

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    :cond_14
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

.method private dragTo(IIII)V
    .registers 21

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p1

    move/from16 v4, p2

    iget-object v5, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v5

    iget-object v6, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v6

    if-eqz v1, :cond_2a

    iget-object v7, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move/from16 v9, p1

    invoke-virtual {v7, v8, v9, v1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->clampViewPositionHorizontal(Landroid/view/View;II)I

    move-result v3

    iget-object v7, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v8, v3, v5

    invoke-virtual {v7, v8}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_2c

    :cond_2a
    move/from16 v9, p1

    :goto_2c
    if-eqz v2, :cond_40

    iget-object v7, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move/from16 v15, p2

    invoke-virtual {v7, v8, v15, v2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->clampViewPositionVertical(Landroid/view/View;II)I

    move-result v4

    iget-object v7, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v8, v4, v6

    invoke-virtual {v7, v8}, Landroid/view/View;->offsetTopAndBottom(I)V

    goto :goto_42

    :cond_40
    move/from16 v15, p2

    :goto_42
    if-nez v1, :cond_46

    if-eqz v2, :cond_55

    :cond_46
    sub-int v7, v3, v5

    sub-int v8, v4, v6

    iget-object v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v11, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move v12, v3

    move v13, v4

    move v14, v7

    move v15, v8

    invoke-virtual/range {v10 .. v15}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    :cond_55
    return-void
.end method

.method private ensureMotionHistorySizeForId(I)V
    .registers 12

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    array-length v0, v0

    if-gt v0, p1, :cond_70

    :cond_9
    add-int/lit8 v0, p1, 0x1

    new-array v0, v0, [F

    add-int/lit8 v1, p1, 0x1

    new-array v1, v1, [F

    add-int/lit8 v2, p1, 0x1

    new-array v2, v2, [F

    add-int/lit8 v3, p1, 0x1

    new-array v3, v3, [F

    add-int/lit8 v4, p1, 0x1

    new-array v4, v4, [I

    add-int/lit8 v5, p1, 0x1

    new-array v5, v5, [I

    add-int/lit8 v6, p1, 0x1

    new-array v6, v6, [I

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v7, :cond_62

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    array-length v8, v8

    const/4 v9, 0x0

    invoke-static {v7, v9, v0, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    array-length v8, v8

    invoke-static {v7, v9, v1, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    array-length v8, v8

    invoke-static {v7, v9, v2, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    array-length v8, v8

    invoke-static {v7, v9, v3, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    array-length v8, v8

    invoke-static {v7, v9, v4, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    array-length v8, v8

    invoke-static {v7, v9, v5, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    array-length v8, v8

    invoke-static {v7, v9, v6, v9, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_62
    iput-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    iput-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    iput-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    iput-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    iput-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    iput-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    iput-object v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsLocked:[I

    :cond_70
    return-void
.end method

.method private forceSettleCapturedViewAt(IIII)Z
    .registers 16

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v7

    sub-int v8, p1, v0

    sub-int v9, p2, v7

    if-nez v8, :cond_1e

    if-nez v9, :cond_1e

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    return v1

    :cond_1e
    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move-object v1, p0

    move v3, v8

    move v4, v9

    move v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Landroid/support/v4/widget/ViewDragHelper;->computeSettleDuration(Landroid/view/View;IIII)I

    move-result v10

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    move v2, v0

    move v3, v7

    move v4, v8

    move v5, v9

    move v6, v10

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/widget/ScrollerCompat;->startScroll(IIIII)V

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    const/4 v1, 0x1

    return v1
.end method

.method private getEdgesTouched(II)I
    .registers 6

    const/4 v0, 0x0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLeft()I

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    add-int/2addr v1, v2

    if-ge p1, v1, :cond_e

    or-int/lit8 v0, v0, 0x1

    :cond_e
    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    add-int/2addr v1, v2

    if-ge p2, v1, :cond_1b

    or-int/lit8 v0, v0, 0x4

    :cond_1b
    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getRight()I

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    sub-int/2addr v1, v2

    if-le p1, v1, :cond_28

    or-int/lit8 v0, v0, 0x2

    :cond_28
    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBottom()I

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    sub-int/2addr v1, v2

    if-le p2, v1, :cond_35

    or-int/lit8 v0, v0, 0x8

    :cond_35
    return v0
.end method

.method private releaseViewForPointerUp()V
    .registers 5

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v0

    iget v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    invoke-direct {p0, v0, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->clampMag(FFF)F

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v1, v2}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    iget v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mMaxVelocity:F

    invoke-direct {p0, v1, v2, v3}, Landroid/support/v4/widget/ViewDragHelper;->clampMag(FFF)F

    move-result v1

    invoke-direct {p0, v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->dispatchViewReleased(FF)V

    return-void
.end method

.method private reportNewEdgeDrags(FFI)V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, p2, p3, v1}, Landroid/support/v4/widget/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_a

    or-int/lit8 v0, v0, 0x1

    :cond_a
    const/4 v1, 0x4

    invoke-direct {p0, p2, p1, p3, v1}, Landroid/support/v4/widget/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_13

    or-int/lit8 v0, v0, 0x4

    :cond_13
    const/4 v1, 0x2

    invoke-direct {p0, p1, p2, p3, v1}, Landroid/support/v4/widget/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_1c

    or-int/lit8 v0, v0, 0x2

    :cond_1c
    const/16 v1, 0x8

    invoke-direct {p0, p2, p1, p3, v1}, Landroid/support/v4/widget/ViewDragHelper;->checkNewEdgeDrag(FFII)Z

    move-result v1

    if-eqz v1, :cond_26

    or-int/lit8 v0, v0, 0x8

    :cond_26
    if-eqz v0, :cond_34

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeDragsInProgress:[I

    aget v2, v1, p3

    or-int/2addr v2, v0

    aput v2, v1, p3

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v1, v0, p3}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeDragStarted(II)V

    :cond_34
    return-void
.end method

.method private saveInitialMotion(FFI)V
    .registers 7

    invoke-direct {p0, p3}, Landroid/support/v4/widget/ViewDragHelper;->ensureMotionHistorySizeForId(I)V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    aput p1, v1, p3

    aput p1, v0, p3

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    aput p2, v1, p3

    aput p2, v0, p3

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    float-to-int v1, p1

    float-to-int v2, p2

    invoke-direct {p0, v1, v2}, Landroid/support/v4/widget/ViewDragHelper;->getEdgesTouched(II)I

    move-result v1

    aput v1, v0, p3

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    const/4 v1, 0x1

    shl-int/2addr v1, p3

    or-int/2addr v0, v1

    iput v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    return-void
.end method

.method private saveLastMotion(Landroid/view/MotionEvent;)V
    .registers 8

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1e

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    aput v3, v5, v2

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    aput v4, v5, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1e
    return-void
.end method


# virtual methods
.method public abort()V
    .registers 11

    invoke-virtual {p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v1}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v2}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v2

    iget-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v9

    iget-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    sub-int v7, v2, v0

    sub-int v8, v9, v1

    move v5, v2

    move v6, v9

    invoke-virtual/range {v3 .. v8}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    :cond_32
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    return-void
.end method

.method protected canScroll(Landroid/view/View;ZIIII)Z
    .registers 23

    move-object/from16 v0, p1

    instance-of v1, v0, Landroid/view/ViewGroup;

    const/4 v2, 0x1

    if-eqz v1, :cond_62

    move-object v1, v0

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScrollX()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScrollY()I

    move-result v4

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    add-int/lit8 v6, v5, -0x1

    :goto_18
    if-ltz v6, :cond_62

    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    add-int v7, p5, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    if-lt v7, v8, :cond_5f

    add-int v7, p5, v3

    invoke-virtual {v13}, Landroid/view/View;->getRight()I

    move-result v8

    if-ge v7, v8, :cond_5f

    add-int v7, p6, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    if-lt v7, v8, :cond_5f

    add-int v7, p6, v4

    invoke-virtual {v13}, Landroid/view/View;->getBottom()I

    move-result v8

    if-ge v7, v8, :cond_5f

    const/4 v9, 0x1

    add-int v7, p5, v3

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v8

    sub-int v12, v7, v8

    add-int v7, p6, v4

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v8

    sub-int v14, v7, v8

    move-object/from16 v7, p0

    move-object v8, v13

    move/from16 v10, p3

    move/from16 v11, p4

    move-object v15, v13

    move v13, v14

    invoke-virtual/range {v7 .. v13}, Landroid/support/v4/widget/ViewDragHelper;->canScroll(Landroid/view/View;ZIIII)Z

    move-result v7

    if-eqz v7, :cond_5f

    return v2

    :cond_5f
    add-int/lit8 v6, v6, -0x1

    goto :goto_18

    :cond_62
    if-eqz p2, :cond_7a

    move/from16 v3, p3

    neg-int v4, v3

    invoke-static {v0, v4}, Landroid/support/v4/view/ViewCompat;->canScrollHorizontally(Landroid/view/View;I)Z

    move-result v4

    if-nez v4, :cond_77

    move/from16 v4, p4

    neg-int v5, v4

    invoke-static {v0, v5}, Landroid/support/v4/view/ViewCompat;->canScrollVertically(Landroid/view/View;I)Z

    move-result v5

    if-eqz v5, :cond_7e

    goto :goto_79

    :cond_77
    move/from16 v4, p4

    :goto_79
    goto :goto_7f

    :cond_7a
    move/from16 v3, p3

    move/from16 v4, p4

    :cond_7e
    const/4 v2, 0x0

    :goto_7f
    return v2
.end method

.method public cancel()V
    .registers 2

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper;->clearMotionHistory()V

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_12
    return-void
.end method

.method public captureChildView(Landroid/view/View;I)V
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    if-ne v0, v1, :cond_16

    iput-object p1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    iput p2, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewCaptured(Landroid/view/View;I)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    return-void

    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "captureChildView: parameter must be a descendant of the ViewDragHelper\'s tracked parent view ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public checkTouchSlop(I)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v0, :cond_12

    invoke-virtual {p0, p1, v2}, Landroid/support/v4/widget/ViewDragHelper;->checkTouchSlop(II)Z

    move-result v3

    if-eqz v3, :cond_f

    const/4 v1, 0x1

    return v1

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_12
    return v1
.end method

.method public checkTouchSlop(II)Z
    .registers 12

    invoke-virtual {p0, p2}, Landroid/support/v4/widget/ViewDragHelper;->isPointerDown(I)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    :cond_8
    and-int/lit8 v0, p1, 0x1

    const/4 v2, 0x1

    if-ne v0, v2, :cond_f

    move v0, v2

    goto :goto_10

    :cond_f
    move v0, v1

    :goto_10
    and-int/lit8 v3, p1, 0x2

    const/4 v4, 0x2

    if-ne v3, v4, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    move v3, v1

    :goto_18
    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    aget v4, v4, p2

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    aget v5, v5, p2

    sub-float/2addr v4, v5

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    aget v5, v5, p2

    iget-object v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    aget v6, v6, p2

    sub-float/2addr v5, v6

    if-eqz v0, :cond_40

    if-eqz v3, :cond_40

    mul-float v6, v4, v4

    mul-float v7, v5, v5

    add-float/2addr v6, v7

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    iget v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    mul-int/2addr v7, v8

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_3f

    move v1, v2

    nop

    :cond_3f
    return v1

    :cond_40
    if-eqz v0, :cond_50

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_4f

    move v1, v2

    nop

    :cond_4f
    return v1

    :cond_50
    if-eqz v3, :cond_60

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_5f

    move v1, v2

    nop

    :cond_5f
    return v1

    :cond_60
    return v1
.end method

.method public continueSettling(Z)Z
    .registers 15

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_6c

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v0

    iget-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v3}, Landroid/support/v4/widget/ScrollerCompat;->getCurrX()I

    move-result v3

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/ScrollerCompat;->getCurrY()I

    move-result v10

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getLeft()I

    move-result v4

    sub-int v11, v3, v4

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    sub-int v12, v10, v4

    if-eqz v11, :cond_2f

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v4, v11}, Landroid/view/View;->offsetLeftAndRight(I)V

    :cond_2f
    if-eqz v12, :cond_36

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v4, v12}, Landroid/view/View;->offsetTopAndBottom(I)V

    :cond_36
    if-nez v11, :cond_3a

    if-eqz v12, :cond_45

    :cond_3a
    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    move v6, v3

    move v7, v10

    move v8, v11

    move v9, v12

    invoke-virtual/range {v4 .. v9}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    :cond_45
    if-eqz v0, :cond_5d

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/ScrollerCompat;->getFinalX()I

    move-result v4

    if-ne v3, v4, :cond_5d

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/ScrollerCompat;->getFinalY()I

    move-result v4

    if-ne v10, v4, :cond_5d

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v4}, Landroid/support/v4/widget/ScrollerCompat;->abortAnimation()V

    const/4 v0, 0x0

    :cond_5d
    if-nez v0, :cond_6c

    if-eqz p1, :cond_69

    iget-object v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mSetIdleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_6c

    :cond_69
    invoke-virtual {p0, v1}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    :cond_6c
    :goto_6c
    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v0, v2, :cond_72

    const/4 v1, 0x1

    nop

    :cond_72
    return v1
.end method

.method public findTopChildUnder(II)Landroid/view/View;
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_8
    if-ltz v1, :cond_32

    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iget-object v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v3, v1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getOrderedChildIndex(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v3

    if-lt p1, v3, :cond_2f

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v3

    if-ge p1, v3, :cond_2f

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v3

    if-lt p2, v3, :cond_2f

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v3

    if-ge p2, v3, :cond_2f

    return-object v2

    :cond_2f
    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_32
    const/4 v1, 0x0

    return-object v1
.end method

.method public flingCapturedView(IIII)V
    .registers 15

    iget-boolean v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mReleaseInProgress:Z

    if-eqz v0, :cond_30

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v2

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v3

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v0, v4}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v0

    float-to-int v4, v0

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v0, v5}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v0

    float-to-int v5, v0

    move v6, p1

    move v7, p3

    move v8, p2

    move v9, p4

    invoke-virtual/range {v1 .. v9}, Landroid/support/v4/widget/ScrollerCompat;->fling(IIIIIIII)V

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/support/v4/widget/ViewDragHelper;->setDragState(I)V

    return-void

    :cond_30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot flingCapturedView outside of a call to Callback#onViewReleased"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getActivePointerId()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    return v0
.end method

.method public getCapturedView()Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    return-object v0
.end method

.method public getEdgeSize()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mEdgeSize:I

    return v0
.end method

.method public getMinVelocity()F
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    return v0
.end method

.method public getTouchSlop()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mTouchSlop:I

    return v0
.end method

.method public getViewDragState()I
    .registers 2

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    return v0
.end method

.method public isCapturedViewUnder(II)Z
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {p0, v0, p1, p2}, Landroid/support/v4/widget/ViewDragHelper;->isViewUnder(Landroid/view/View;II)Z

    move-result v0

    return v0
.end method

.method public isEdgeTouched(I)Z
    .registers 6

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_5
    if-ge v2, v0, :cond_12

    invoke-virtual {p0, p1, v2}, Landroid/support/v4/widget/ViewDragHelper;->isEdgeTouched(II)Z

    move-result v3

    if-eqz v3, :cond_f

    const/4 v1, 0x1

    return v1

    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_12
    return v1
.end method

.method public isEdgeTouched(II)Z
    .registers 4

    invoke-virtual {p0, p2}, Landroid/support/v4/widget/ViewDragHelper;->isPointerDown(I)Z

    move-result v0

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v0, v0, p2

    and-int/2addr v0, p1

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    return v0
.end method

.method public isPointerDown(I)Z
    .registers 5

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mPointersDown:I

    const/4 v1, 0x1

    shl-int v2, v1, p1

    and-int/2addr v0, v2

    if-eqz v0, :cond_9

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    return v1
.end method

.method public isViewUnder(Landroid/view/View;II)Z
    .registers 6

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v1

    if-lt p2, v1, :cond_1e

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v1

    if-ge p2, v1, :cond_1e

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    if-lt p3, v1, :cond_1e

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result v1

    if-ge p3, v1, :cond_1e

    const/4 v0, 0x1

    nop

    :cond_1e
    return v0
.end method

.method public processTouchEvent(Landroid/view/MotionEvent;)V
    .registers 14

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v1

    if-nez v0, :cond_d

    invoke-virtual {p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    :cond_d
    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v2, :cond_17

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_17
    iget-object v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_166

    :pswitch_21
    goto/16 :goto_165

    :pswitch_23
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v4

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v5, v3, :cond_66

    iget v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    if-ne v4, v3, :cond_66

    const/4 v3, -0x1

    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v5

    nop

    :goto_35
    if-ge v2, v5, :cond_60

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v6

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    if-ne v6, v7, :cond_40

    goto :goto_5d

    :cond_40
    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v7

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v8

    float-to-int v9, v7

    float-to-int v10, v8

    invoke-virtual {p0, v9, v10}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v9

    iget-object v10, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne v9, v10, :cond_5d

    iget-object v9, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {p0, v9, v6}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v9

    if-eqz v9, :cond_5d

    iget v3, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    goto :goto_60

    :cond_5d
    :goto_5d
    add-int/lit8 v2, v2, 0x1

    goto :goto_35

    :cond_60
    :goto_60
    const/4 v2, -0x1

    if-ne v3, v2, :cond_66

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper;->releaseViewForPointerUp()V

    :cond_66
    invoke-direct {p0, v4}, Landroid/support/v4/widget/ViewDragHelper;->clearMotionHistory(I)V

    goto/16 :goto_165

    :pswitch_6b
    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    invoke-static {p1, v1}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    invoke-direct {p0, v3, v4, v2}, Landroid/support/v4/widget/ViewDragHelper;->saveInitialMotion(FFI)V

    iget v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-nez v5, :cond_9a

    float-to-int v5, v3

    float-to-int v6, v4

    invoke-virtual {p0, v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5, v2}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    iget-object v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v6, v6, v2

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v7, v6

    if-eqz v7, :cond_98

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v8, v6

    invoke-virtual {v7, v8, v2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeTouched(II)V

    :cond_98
    goto/16 :goto_165

    :cond_9a
    float-to-int v5, v3

    float-to-int v6, v4

    invoke-virtual {p0, v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->isCapturedViewUnder(II)Z

    move-result v5

    if-eqz v5, :cond_165

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {p0, v5, v2}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    goto/16 :goto_165

    :pswitch_a9
    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v2, v3, :cond_b1

    const/4 v2, 0x0

    invoke-direct {p0, v2, v2}, Landroid/support/v4/widget/ViewDragHelper;->dispatchViewReleased(FF)V

    :cond_b1
    invoke-virtual {p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    goto/16 :goto_165

    :pswitch_b6
    iget v4, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v4, v3, :cond_f0

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->findPointerIndex(Landroid/view/MotionEvent;I)I

    move-result v2

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v3

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v4

    iget-object v5, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionX:[F

    iget v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    aget v5, v5, v6

    sub-float v5, v3, v5

    float-to-int v5, v5

    iget-object v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mLastMotionY:[F

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    aget v6, v6, v7

    sub-float v6, v4, v6

    float-to-int v6, v6

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v7

    add-int/2addr v7, v5

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v8

    add-int/2addr v8, v6

    invoke-direct {p0, v7, v8, v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->dragTo(IIII)V

    invoke-direct {p0, p1}, Landroid/support/v4/widget/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto/16 :goto_165

    :cond_f0
    invoke-static {p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v4

    nop

    :goto_f5
    if-ge v2, v4, :cond_12d

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v5

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v6

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v7

    iget-object v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    aget v8, v8, v5

    sub-float v8, v6, v8

    iget-object v9, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    aget v9, v9, v5

    sub-float v9, v7, v9

    invoke-direct {p0, v8, v9, v5}, Landroid/support/v4/widget/ViewDragHelper;->reportNewEdgeDrags(FFI)V

    iget v10, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v10, v3, :cond_117

    goto :goto_12d

    :cond_117
    float-to-int v10, v6

    float-to-int v11, v7

    invoke-virtual {p0, v10, v11}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v10

    invoke-direct {p0, v10, v8, v9}, Landroid/support/v4/widget/ViewDragHelper;->checkTouchSlop(Landroid/view/View;FF)Z

    move-result v11

    if-eqz v11, :cond_12a

    invoke-virtual {p0, v10, v5}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v11

    if-eqz v11, :cond_12a

    goto :goto_12d

    :cond_12a
    add-int/lit8 v2, v2, 0x1

    goto :goto_f5

    :cond_12d
    :goto_12d
    invoke-direct {p0, p1}, Landroid/support/v4/widget/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto :goto_165

    :pswitch_131
    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v2, v3, :cond_138

    invoke-direct {p0}, Landroid/support/v4/widget/ViewDragHelper;->releaseViewForPointerUp()V

    :cond_138
    invoke-virtual {p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    goto :goto_165

    :pswitch_13c
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-static {p1, v2}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v2

    float-to-int v5, v3

    float-to-int v6, v4

    invoke-virtual {p0, v5, v6}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v5

    invoke-direct {p0, v3, v4, v2}, Landroid/support/v4/widget/ViewDragHelper;->saveInitialMotion(FFI)V

    invoke-virtual {p0, v5, v2}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    iget-object v6, p0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v6, v6, v2

    iget v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v7, v6

    if-eqz v7, :cond_165

    iget-object v7, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget v8, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v8, v6

    invoke-virtual {v7, v8, v2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeTouched(II)V

    :cond_165
    :goto_165
    return-void

    :pswitch_data_166
    .packed-switch 0x0
        :pswitch_13c
        :pswitch_131
        :pswitch_b6
        :pswitch_a9
        :pswitch_21
        :pswitch_6b
        :pswitch_23
    .end packed-switch
.end method

.method setDragState(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mParentView:Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mSetIdleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-eq v0, p1, :cond_19

    iput p1, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onViewDragStateChanged(I)V

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-nez v0, :cond_19

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    :cond_19
    return-void
.end method

.method public setEdgeTrackingEnabled(I)V
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    return-void
.end method

.method public setMinVelocity(F)V
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/ViewDragHelper;->mMinVelocity:F

    return-void
.end method

.method public settleCapturedViewAt(II)Z
    .registers 6

    iget-boolean v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mReleaseInProgress:Z

    if-eqz v0, :cond_1b

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v0, v1}, Landroid/support/v4/view/VelocityTrackerCompat;->getXVelocity(Landroid/view/VelocityTracker;I)F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-static {v1, v2}, Landroid/support/v4/view/VelocityTrackerCompat;->getYVelocity(Landroid/view/VelocityTracker;I)F

    move-result v1

    float-to-int v1, v1

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/support/v4/widget/ViewDragHelper;->forceSettleCapturedViewAt(IIII)Z

    move-result v0

    return v0

    :cond_1b
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot settleCapturedViewAt outside of a call to Callback#onViewReleased"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v2

    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getActionIndex(Landroid/view/MotionEvent;)I

    move-result v3

    if-nez v2, :cond_11

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    :cond_11
    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v4, :cond_1b

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v4

    iput-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_1b
    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    const/4 v4, 0x2

    packed-switch v2, :pswitch_data_15c

    :cond_24
    :pswitch_24
    move/from16 v16, v2

    move/from16 v17, v3

    const/4 v5, 0x0

    goto/16 :goto_153

    :pswitch_2b
    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v4

    invoke-direct {v0, v4}, Landroid/support/v4/widget/ViewDragHelper;->clearMotionHistory(I)V

    nop

    :cond_33
    :goto_33
    move/from16 v16, v2

    move/from16 v17, v3

    goto/16 :goto_11b

    :pswitch_39
    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v7

    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v8

    invoke-static {v1, v3}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v9

    invoke-direct {v0, v8, v9, v7}, Landroid/support/v4/widget/ViewDragHelper;->saveInitialMotion(FFI)V

    iget v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-nez v10, :cond_5e

    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v4, v4, v7

    iget v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v10, v4

    if-eqz v10, :cond_5d

    iget-object v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget v11, v0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v11, v4

    invoke-virtual {v10, v11, v7}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeTouched(II)V

    :cond_5d
    goto :goto_33

    :cond_5e
    iget v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v10, v4, :cond_33

    float-to-int v4, v8

    float-to-int v10, v9

    invoke-virtual {v0, v4, v10}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v4

    iget-object v10, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne v4, v10, :cond_6f

    invoke-virtual {v0, v4, v7}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    :cond_6f
    goto :goto_33

    :pswitch_70
    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    if-eqz v4, :cond_24

    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    if-nez v4, :cond_79

    goto :goto_33

    :cond_79
    invoke-static/range {p1 .. p1}, Landroid/support/v4/view/MotionEventCompat;->getPointerCount(Landroid/view/MotionEvent;)I

    move-result v4

    const/4 v7, 0x0

    :goto_7e
    if-ge v7, v4, :cond_10a

    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v8

    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getX(Landroid/view/MotionEvent;I)F

    move-result v9

    invoke-static {v1, v7}, Landroid/support/v4/view/MotionEventCompat;->getY(Landroid/view/MotionEvent;I)F

    move-result v10

    iget-object v11, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionX:[F

    aget v11, v11, v8

    sub-float v11, v9, v11

    iget-object v12, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialMotionY:[F

    aget v12, v12, v8

    sub-float v12, v10, v12

    float-to-int v13, v9

    float-to-int v14, v10

    invoke-virtual {v0, v13, v14}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v13

    if-eqz v13, :cond_a8

    invoke-direct {v0, v13, v11, v12}, Landroid/support/v4/widget/ViewDragHelper;->checkTouchSlop(Landroid/view/View;FF)Z

    move-result v14

    if-eqz v14, :cond_a8

    const/4 v14, 0x1

    goto :goto_a9

    :cond_a8
    const/4 v14, 0x0

    :goto_a9
    if-eqz v14, :cond_e8

    invoke-virtual {v13}, Landroid/view/View;->getLeft()I

    move-result v15

    float-to-int v5, v11

    add-int/2addr v5, v15

    iget-object v6, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    move/from16 v16, v2

    float-to-int v2, v11

    invoke-virtual {v6, v13, v5, v2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->clampViewPositionHorizontal(Landroid/view/View;II)I

    move-result v2

    invoke-virtual {v13}, Landroid/view/View;->getTop()I

    move-result v6

    move/from16 v17, v3

    float-to-int v3, v12

    add-int/2addr v3, v6

    move/from16 v18, v4

    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    move/from16 v19, v5

    float-to-int v5, v12

    invoke-virtual {v4, v13, v3, v5}, Landroid/support/v4/widget/ViewDragHelper$Callback;->clampViewPositionVertical(Landroid/view/View;II)I

    move-result v4

    iget-object v5, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v5, v13}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewHorizontalDragRange(Landroid/view/View;)I

    move-result v5

    move/from16 v20, v3

    iget-object v3, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v3, v13}, Landroid/support/v4/widget/ViewDragHelper$Callback;->getViewVerticalDragRange(Landroid/view/View;)I

    move-result v3

    if-eqz v5, :cond_e1

    if-lez v5, :cond_ee

    if-ne v2, v15, :cond_ee

    :cond_e1
    if-eqz v3, :cond_110

    if-lez v3, :cond_ee

    if-ne v4, v6, :cond_ee

    goto :goto_110

    :cond_e8
    move/from16 v16, v2

    move/from16 v17, v3

    move/from16 v18, v4

    :cond_ee
    invoke-direct {v0, v11, v12, v8}, Landroid/support/v4/widget/ViewDragHelper;->reportNewEdgeDrags(FFI)V

    iget v2, v0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_f7

    goto :goto_110

    :cond_f7
    if-eqz v14, :cond_100

    invoke-virtual {v0, v13, v8}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    move-result v2

    if-eqz v2, :cond_100

    goto :goto_110

    :cond_100
    add-int/lit8 v7, v7, 0x1

    move/from16 v2, v16

    move/from16 v3, v17

    move/from16 v4, v18

    goto/16 :goto_7e

    :cond_10a
    move/from16 v16, v2

    move/from16 v17, v3

    move/from16 v18, v4

    :cond_110
    :goto_110
    invoke-direct/range {p0 .. p1}, Landroid/support/v4/widget/ViewDragHelper;->saveLastMotion(Landroid/view/MotionEvent;)V

    goto :goto_11b

    :pswitch_114
    move/from16 v16, v2

    move/from16 v17, v3

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/widget/ViewDragHelper;->cancel()V

    :goto_11b
    const/4 v5, 0x0

    goto :goto_153

    :pswitch_11d
    move/from16 v16, v2

    move/from16 v17, v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    const/4 v5, 0x0

    invoke-static {v1, v5}, Landroid/support/v4/view/MotionEventCompat;->getPointerId(Landroid/view/MotionEvent;I)I

    move-result v6

    invoke-direct {v0, v2, v3, v6}, Landroid/support/v4/widget/ViewDragHelper;->saveInitialMotion(FFI)V

    float-to-int v7, v2

    float-to-int v8, v3

    invoke-virtual {v0, v7, v8}, Landroid/support/v4/widget/ViewDragHelper;->findTopChildUnder(II)Landroid/view/View;

    move-result-object v7

    iget-object v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-ne v7, v8, :cond_142

    iget v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-ne v8, v4, :cond_142

    invoke-virtual {v0, v7, v6}, Landroid/support/v4/widget/ViewDragHelper;->tryCaptureViewForDrag(Landroid/view/View;I)Z

    :cond_142
    iget-object v4, v0, Landroid/support/v4/widget/ViewDragHelper;->mInitialEdgesTouched:[I

    aget v4, v4, v6

    iget v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v8, v4

    if-eqz v8, :cond_153

    iget-object v8, v0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    iget v9, v0, Landroid/support/v4/widget/ViewDragHelper;->mTrackingEdges:I

    and-int/2addr v9, v4

    invoke-virtual {v8, v9, v6}, Landroid/support/v4/widget/ViewDragHelper$Callback;->onEdgeTouched(II)V

    :cond_153
    :goto_153
    iget v2, v0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_159

    goto :goto_15a

    :cond_159
    move v3, v5

    :goto_15a
    return v3

    nop

    :pswitch_data_15c
    .packed-switch 0x0
        :pswitch_11d
        :pswitch_114
        :pswitch_70
        :pswitch_114
        :pswitch_24
        :pswitch_39
        :pswitch_2b
    .end packed-switch
.end method

.method public smoothSlideViewTo(Landroid/view/View;II)Z
    .registers 6

    iput-object p1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0, v0}, Landroid/support/v4/widget/ViewDragHelper;->forceSettleCapturedViewAt(IIII)Z

    move-result v0

    if-nez v0, :cond_17

    iget v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mDragState:I

    if-nez v1, :cond_17

    iget-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    if-eqz v1, :cond_17

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    :cond_17
    return v0
.end method

.method tryCaptureViewForDrag(Landroid/view/View;I)Z
    .registers 5

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCapturedView:Landroid/view/View;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_a

    iget v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    if-ne v0, p2, :cond_a

    return v1

    :cond_a
    if-eqz p1, :cond_1a

    iget-object v0, p0, Landroid/support/v4/widget/ViewDragHelper;->mCallback:Landroid/support/v4/widget/ViewDragHelper$Callback;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/widget/ViewDragHelper$Callback;->tryCaptureView(Landroid/view/View;I)Z

    move-result v0

    if-eqz v0, :cond_1a

    iput p2, p0, Landroid/support/v4/widget/ViewDragHelper;->mActivePointerId:I

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/widget/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    return v1

    :cond_1a
    const/4 v0, 0x0

    return v0
.end method
