.class public abstract Landroid/support/v4/widget/AutoScrollHelper;
.super Ljava/lang/Object;
.source "AutoScrollHelper.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;,
        Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;
    }
.end annotation


# static fields
.field private static final DEFAULT_ACTIVATION_DELAY:I

.field private static final DEFAULT_EDGE_TYPE:I = 0x1

.field private static final DEFAULT_MAXIMUM_EDGE:F = 3.4028235E38f

.field private static final DEFAULT_MAXIMUM_VELOCITY_DIPS:I = 0x627

.field private static final DEFAULT_MINIMUM_VELOCITY_DIPS:I = 0x13b

.field private static final DEFAULT_RAMP_DOWN_DURATION:I = 0x1f4

.field private static final DEFAULT_RAMP_UP_DURATION:I = 0x1f4

.field private static final DEFAULT_RELATIVE_EDGE:F = 0.2f

.field private static final DEFAULT_RELATIVE_VELOCITY:F = 1.0f

.field public static final EDGE_TYPE_INSIDE:I = 0x0

.field public static final EDGE_TYPE_INSIDE_EXTEND:I = 0x1

.field public static final EDGE_TYPE_OUTSIDE:I = 0x2

.field private static final HORIZONTAL:I = 0x0

.field public static final NO_MAX:F = 3.4028235E38f

.field public static final NO_MIN:F = 0.0f

.field public static final RELATIVE_UNSPECIFIED:F = 0.0f

.field private static final VERTICAL:I = 0x1


# instance fields
.field private mActivationDelay:I

.field private mAlreadyDelayed:Z

.field private mAnimating:Z

.field private final mEdgeInterpolator:Landroid/view/animation/Interpolator;

.field private mEdgeType:I

.field private mEnabled:Z

.field private mExclusive:Z

.field private mMaximumEdges:[F

.field private mMaximumVelocity:[F

.field private mMinimumVelocity:[F

.field private mNeedsCancel:Z

.field private mNeedsReset:Z

.field private mRelativeEdges:[F

.field private mRelativeVelocity:[F

.field private mRunnable:Ljava/lang/Runnable;

.field private final mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

.field private final mTarget:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v0

    sput v0, Landroid/support/v4/widget/AutoScrollHelper;->DEFAULT_ACTIVATION_DELAY:I

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-direct {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    new-instance v0, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeInterpolator:Landroid/view/animation/Interpolator;

    const/4 v0, 0x2

    new-array v1, v0, [F

    fill-array-data v1, :array_7e

    iput-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeEdges:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_86

    iput-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumEdges:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_8e

    iput-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeVelocity:[F

    new-array v1, v0, [F

    fill-array-data v1, :array_96

    iput-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMinimumVelocity:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_9e

    iput-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumVelocity:[F

    iput-object p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->density:F

    const v2, 0x44c4e000    # 1575.0f

    mul-float/2addr v2, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v2, v1

    float-to-int v2, v2

    iget v3, v0, Landroid/util/DisplayMetrics;->density:F

    const v4, 0x439d8000    # 315.0f

    mul-float/2addr v4, v3

    add-float/2addr v4, v1

    float-to-int v1, v4

    int-to-float v3, v2

    int-to-float v4, v2

    invoke-virtual {p0, v3, v4}, Landroid/support/v4/widget/AutoScrollHelper;->setMaximumVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;

    int-to-float v3, v1

    int-to-float v4, v1

    invoke-virtual {p0, v3, v4}, Landroid/support/v4/widget/AutoScrollHelper;->setMinimumVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;

    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setEdgeType(I)Landroid/support/v4/widget/AutoScrollHelper;

    const v3, 0x7f7fffff    # Float.MAX_VALUE

    invoke-virtual {p0, v3, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setMaximumEdges(FF)Landroid/support/v4/widget/AutoScrollHelper;

    const v3, 0x3e4ccccd    # 0.2f

    invoke-virtual {p0, v3, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setRelativeEdges(FF)Landroid/support/v4/widget/AutoScrollHelper;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {p0, v3, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setRelativeVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;

    sget v3, Landroid/support/v4/widget/AutoScrollHelper;->DEFAULT_ACTIVATION_DELAY:I

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setActivationDelay(I)Landroid/support/v4/widget/AutoScrollHelper;

    const/16 v3, 0x1f4

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setRampUpDuration(I)Landroid/support/v4/widget/AutoScrollHelper;

    invoke-virtual {p0, v3}, Landroid/support/v4/widget/AutoScrollHelper;->setRampDownDuration(I)Landroid/support/v4/widget/AutoScrollHelper;

    return-void

    :array_7e
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_86
    .array-data 4
        0x7f7fffff    # Float.MAX_VALUE
        0x7f7fffff    # Float.MAX_VALUE
    .end array-data

    :array_8e
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_96
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_9e
    .array-data 4
        0x7f7fffff    # Float.MAX_VALUE
        0x7f7fffff    # Float.MAX_VALUE
    .end array-data
.end method

.method static synthetic access$100(Landroid/support/v4/widget/AutoScrollHelper;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    return v0
.end method

.method static synthetic access$102(Landroid/support/v4/widget/AutoScrollHelper;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    return p1
.end method

.method static synthetic access$200(Landroid/support/v4/widget/AutoScrollHelper;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    return v0
.end method

.method static synthetic access$202(Landroid/support/v4/widget/AutoScrollHelper;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    return p1
.end method

.method static synthetic access$300(Landroid/support/v4/widget/AutoScrollHelper;)Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/v4/widget/AutoScrollHelper;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->shouldAnimate()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Landroid/support/v4/widget/AutoScrollHelper;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsCancel:Z

    return v0
.end method

.method static synthetic access$502(Landroid/support/v4/widget/AutoScrollHelper;Z)Z
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsCancel:Z

    return p1
.end method

.method static synthetic access$600(Landroid/support/v4/widget/AutoScrollHelper;)V
    .registers 1

    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->cancelTargetTouch()V

    return-void
.end method

.method static synthetic access$700(Landroid/support/v4/widget/AutoScrollHelper;)Landroid/view/View;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$800(III)I
    .registers 4

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(III)I

    move-result v0

    return v0
.end method

.method static synthetic access$900(FFF)F
    .registers 4

    invoke-static {p0, p1, p2}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result v0

    return v0
.end method

.method private cancelTargetTouch()V
    .registers 11

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-wide v0, v8

    move-wide v2, v8

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    return-void
.end method

.method private computeTargetVelocity(IFFF)F
    .registers 13

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeEdges:[F

    aget v0, v0, p1

    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumEdges:[F

    aget v1, v1, p1

    invoke-direct {p0, v0, p3, v1, p2}, Landroid/support/v4/widget/AutoScrollHelper;->getEdgeValue(FFFF)F

    move-result v2

    const/4 v3, 0x0

    cmpl-float v4, v2, v3

    if-nez v4, :cond_12

    return v3

    :cond_12
    iget-object v4, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeVelocity:[F

    aget v4, v4, p1

    iget-object v5, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMinimumVelocity:[F

    aget v5, v5, p1

    iget-object v6, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumVelocity:[F

    aget v6, v6, p1

    mul-float v7, v4, p4

    cmpl-float v3, v2, v3

    if-lez v3, :cond_2b

    mul-float v3, v2, v7

    invoke-static {v3, v5, v6}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result v3

    return v3

    :cond_2b
    neg-float v3, v2

    mul-float/2addr v3, v7

    invoke-static {v3, v5, v6}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result v3

    neg-float v3, v3

    return v3
.end method

.method private static constrain(FFF)F
    .registers 4

    cmpl-float v0, p0, p2

    if-lez v0, :cond_5

    return p2

    :cond_5
    cmpg-float v0, p0, p1

    if-gez v0, :cond_a

    return p1

    :cond_a
    return p0
.end method

.method private static constrain(III)I
    .registers 3

    if-le p0, p2, :cond_3

    return p2

    :cond_3
    if-ge p0, p1, :cond_6

    return p1

    :cond_6
    return p0
.end method

.method private constrainEdgeValue(FF)F
    .registers 7

    const/4 v0, 0x0

    cmpl-float v1, p2, v0

    if-nez v1, :cond_6

    return v0

    :cond_6
    iget v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeType:I

    packed-switch v1, :pswitch_data_2e

    goto :goto_2c

    :pswitch_c
    cmpg-float v1, p1, v0

    if-gez v1, :cond_2c

    neg-float v0, p2

    div-float v0, p1, v0

    return v0

    :pswitch_14
    cmpg-float v1, p1, p2

    if-gez v1, :cond_2c

    cmpl-float v1, p1, v0

    const/high16 v2, 0x3f800000    # 1.0f

    if-ltz v1, :cond_22

    div-float v0, p1, p2

    sub-float/2addr v2, v0

    return v2

    :cond_22
    iget-boolean v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    if-eqz v1, :cond_2c

    iget v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeType:I

    const/4 v3, 0x1

    if-ne v1, v3, :cond_2c

    return v2

    :cond_2c
    :goto_2c
    return v0

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_14
        :pswitch_14
        :pswitch_c
    .end packed-switch
.end method

.method private getEdgeValue(FFFF)F
    .registers 12

    mul-float v0, p1, p2

    const/4 v1, 0x0

    invoke-static {v0, v1, p3}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result v0

    invoke-direct {p0, p4, v0}, Landroid/support/v4/widget/AutoScrollHelper;->constrainEdgeValue(FF)F

    move-result v2

    sub-float v3, p2, p4

    invoke-direct {p0, v3, v0}, Landroid/support/v4/widget/AutoScrollHelper;->constrainEdgeValue(FF)F

    move-result v3

    sub-float v4, v3, v2

    cmpg-float v5, v4, v1

    if-gez v5, :cond_20

    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeInterpolator:Landroid/view/animation/Interpolator;

    neg-float v5, v4

    invoke-interface {v1, v5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    neg-float v1, v1

    :goto_1f
    goto :goto_2b

    :cond_20
    cmpl-float v5, v4, v1

    if-lez v5, :cond_35

    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {v1, v4}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    goto :goto_1f

    :goto_2b
    nop

    const/high16 v5, -0x40800000    # -1.0f

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v1, v5, v6}, Landroid/support/v4/widget/AutoScrollHelper;->constrain(FFF)F

    move-result v5

    return v5

    :cond_35
    return v1
.end method

.method private requestStop()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    goto :goto_d

    :cond_8
    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->requestStop()V

    :goto_d
    return-void
.end method

.method private shouldAnimate()Z
    .registers 5

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getVerticalDirection()I

    move-result v1

    invoke-virtual {v0}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->getHorizontalDirection()I

    move-result v2

    if-eqz v1, :cond_12

    invoke-virtual {p0, v1}, Landroid/support/v4/widget/AutoScrollHelper;->canTargetScrollVertically(I)Z

    move-result v3

    if-nez v3, :cond_1a

    :cond_12
    if-eqz v2, :cond_1c

    invoke-virtual {p0, v2}, Landroid/support/v4/widget/AutoScrollHelper;->canTargetScrollHorizontally(I)Z

    move-result v3

    if-eqz v3, :cond_1c

    :cond_1a
    const/4 v3, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v3, 0x0

    :goto_1d
    return v3
.end method

.method private startAnimating()V
    .registers 6

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_c

    new-instance v0, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/support/v4/widget/AutoScrollHelper$ScrollAnimationRunnable;-><init>(Landroid/support/v4/widget/AutoScrollHelper;Landroid/support/v4/widget/AutoScrollHelper$1;)V

    iput-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRunnable:Ljava/lang/Runnable;

    :cond_c
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    iput-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsReset:Z

    iget-boolean v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAlreadyDelayed:Z

    if-nez v1, :cond_24

    iget v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mActivationDelay:I

    if-lez v1, :cond_24

    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    iget-object v2, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRunnable:Ljava/lang/Runnable;

    iget v3, p0, Landroid/support/v4/widget/AutoScrollHelper;->mActivationDelay:I

    int-to-long v3, v3

    invoke-static {v1, v2, v3, v4}, Landroid/support/v4/view/ViewCompat;->postOnAnimationDelayed(Landroid/view/View;Ljava/lang/Runnable;J)V

    goto :goto_29

    :cond_24
    iget-object v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRunnable:Ljava/lang/Runnable;

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :goto_29
    iput-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAlreadyDelayed:Z

    return-void
.end method


# virtual methods
.method public abstract canTargetScrollHorizontally(I)Z
.end method

.method public abstract canTargetScrollVertically(I)Z
.end method

.method public isEnabled()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEnabled:Z

    return v0
.end method

.method public isExclusive()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mExclusive:Z

    return v0
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 10

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEnabled:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    invoke-static {p2}, Landroid/support/v4/view/MotionEventCompat;->getActionMasked(Landroid/view/MotionEvent;)I

    move-result v0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_5c

    goto :goto_51

    :pswitch_f
    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->requestStop()V

    goto :goto_51

    :pswitch_13
    iput-boolean v2, p0, Landroid/support/v4/widget/AutoScrollHelper;->mNeedsCancel:Z

    iput-boolean v1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAlreadyDelayed:Z

    :pswitch_17
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {p0, v1, v3, v4, v5}, Landroid/support/v4/widget/AutoScrollHelper;->computeTargetVelocity(IFFF)F

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Landroid/support/v4/widget/AutoScrollHelper;->mTarget:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-direct {p0, v2, v4, v5, v6}, Landroid/support/v4/widget/AutoScrollHelper;->computeTargetVelocity(IFFF)F

    move-result v4

    iget-object v5, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v5, v3, v4}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->setTargetVelocity(FF)V

    iget-boolean v5, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    if-nez v5, :cond_51

    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->shouldAnimate()Z

    move-result v5

    if-eqz v5, :cond_51

    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->startAnimating()V

    :cond_51
    :goto_51
    iget-boolean v3, p0, Landroid/support/v4/widget/AutoScrollHelper;->mExclusive:Z

    if-eqz v3, :cond_5b

    iget-boolean v3, p0, Landroid/support/v4/widget/AutoScrollHelper;->mAnimating:Z

    if-eqz v3, :cond_5b

    move v1, v2

    nop

    :cond_5b
    return v1

    :pswitch_data_5c
    .packed-switch 0x0
        :pswitch_13
        :pswitch_f
        :pswitch_17
        :pswitch_f
    .end packed-switch
.end method

.method public abstract scrollTargetBy(II)V
.end method

.method public setActivationDelay(I)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mActivationDelay:I

    return-object p0
.end method

.method public setEdgeType(I)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 2

    iput p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEdgeType:I

    return-object p0
.end method

.method public setEnabled(Z)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEnabled:Z

    if-eqz v0, :cond_9

    if-nez p1, :cond_9

    invoke-direct {p0}, Landroid/support/v4/widget/AutoScrollHelper;->requestStop()V

    :cond_9
    iput-boolean p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mEnabled:Z

    return-object p0
.end method

.method public setExclusive(Z)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/widget/AutoScrollHelper;->mExclusive:Z

    return-object p0
.end method

.method public setMaximumEdges(FF)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 5

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumEdges:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumEdges:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    return-object p0
.end method

.method public setMaximumVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumVelocity:[F

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v2, p1, v1

    const/4 v3, 0x0

    aput v2, v0, v3

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMaximumVelocity:[F

    div-float v1, p2, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    return-object p0
.end method

.method public setMinimumVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMinimumVelocity:[F

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v2, p1, v1

    const/4 v3, 0x0

    aput v2, v0, v3

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mMinimumVelocity:[F

    div-float v1, p2, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    return-object p0
.end method

.method public setRampDownDuration(I)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->setRampDownDuration(I)V

    return-object p0
.end method

.method public setRampUpDuration(I)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mScroller:Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;

    invoke-virtual {v0, p1}, Landroid/support/v4/widget/AutoScrollHelper$ClampedScroller;->setRampUpDuration(I)V

    return-object p0
.end method

.method public setRelativeEdges(FF)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 5

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeEdges:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeEdges:[F

    const/4 v1, 0x1

    aput p2, v0, v1

    return-object p0
.end method

.method public setRelativeVelocity(FF)Landroid/support/v4/widget/AutoScrollHelper;
    .registers 7

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeVelocity:[F

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float v2, p1, v1

    const/4 v3, 0x0

    aput v2, v0, v3

    iget-object v0, p0, Landroid/support/v4/widget/AutoScrollHelper;->mRelativeVelocity:[F

    div-float v1, p2, v1

    const/4 v2, 0x1

    aput v1, v0, v2

    return-object p0
.end method
