.class public Lcom/android/camera/ui/zoom/ScaleGestureDetector;
.super Ljava/lang/Object;
.source "ScaleGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/zoom/ScaleGestureDetector$SimpleOnScaleGestureListener;,
        Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ScaleGestureDetector"


# instance fields
.field private mCurrSpan:F

.field private mCurrSpanX:F

.field private mCurrSpanY:F

.field private mCurrTime:J

.field private mFocusX:F

.field private mFocusY:F

.field private mInProgress:Z

.field private mInitialSpan:F

.field private final mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

.field private mMinSpan:I

.field private mPrevSpan:F

.field private mPrevSpanX:F

.field private mPrevSpanY:F

.field private mPrevTime:J

.field private mSpanSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector;-><init>(Landroid/content/Context;Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;Landroid/os/Handler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;Landroid/os/Handler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mSpanSlop:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x1050045

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mMinSpan:I

    return-void
.end method


# virtual methods
.method public getCurrentSpan()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    return v0
.end method

.method public getCurrentSpanX()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanX:F

    return v0
.end method

.method public getCurrentSpanY()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanY:F

    return v0
.end method

.method public getEventTime()J
    .locals 2

    iget-wide v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrTime:J

    return-wide v0
.end method

.method public getFocusX()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mFocusX:F

    return v0
.end method

.method public getFocusY()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mFocusY:F

    return v0
.end method

.method public getPreviousSpan()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    return v0
.end method

.method public getPreviousSpanX()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanX:F

    return v0
.end method

.method public getPreviousSpanY()F
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanY:F

    return v0
.end method

.method public getScaleFactor()F
    .locals 2

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    iget v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    return v0
.end method

.method public getTimeDelta()J
    .locals 4

    iget-wide v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrTime:J

    iget-wide v2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public isInProgress()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 14

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrTime:J

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v3, :cond_1

    const/4 v4, 0x3

    if-ne v0, v4, :cond_0

    goto :goto_0

    :cond_0
    move v4, v2

    goto :goto_1

    :cond_1
    :goto_0
    nop

    move v4, v3

    :goto_1
    const/4 v5, 0x0

    if-eqz v0, :cond_2

    if-eqz v4, :cond_4

    :cond_2
    iget-boolean v6, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v6, p0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;->onScaleEnd(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)V

    iput-boolean v2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    iput v5, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInitialSpan:F

    :cond_3
    if-eqz v4, :cond_4

    return v3

    :cond_4
    const/4 v4, 0x6

    if-eqz v0, :cond_6

    if-eq v0, v4, :cond_6

    const/4 v6, 0x5

    if-ne v0, v6, :cond_5

    goto :goto_2

    :cond_5
    move v6, v2

    goto :goto_3

    :cond_6
    :goto_2
    nop

    move v6, v3

    :goto_3
    if-ne v0, v4, :cond_7

    move v4, v3

    goto :goto_4

    :cond_7
    nop

    move v4, v2

    :goto_4
    if-eqz v4, :cond_8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v7

    goto :goto_5

    :cond_8
    const/4 v7, -0x1

    :goto_5
    nop

    if-eqz v4, :cond_9

    add-int/lit8 v4, v1, -0x1

    goto :goto_6

    :cond_9
    move v4, v1

    :goto_6
    move v8, v2

    move v9, v5

    move v10, v9

    :goto_7
    if-ge v8, v1, :cond_b

    if-ne v7, v8, :cond_a

    goto :goto_8

    :cond_a
    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getX(I)F

    move-result v11

    add-float/2addr v9, v11

    invoke-virtual {p1, v8}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    add-float/2addr v10, v11

    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_7

    :cond_b
    int-to-float v4, v4

    div-float/2addr v9, v4

    div-float/2addr v10, v4

    nop

    move v8, v5

    move v11, v8

    move v5, v2

    :goto_9
    if-ge v5, v1, :cond_d

    if-ne v7, v5, :cond_c

    goto :goto_a

    :cond_c
    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getX(I)F

    move-result v12

    sub-float/2addr v12, v9

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    add-float/2addr v8, v12

    invoke-virtual {p1, v5}, Landroid/view/MotionEvent;->getY(I)F

    move-result v12

    sub-float/2addr v12, v10

    invoke-static {v12}, Ljava/lang/Math;->abs(F)F

    move-result v12

    add-float/2addr v11, v12

    :goto_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_9

    :cond_d
    div-float/2addr v8, v4

    div-float/2addr v11, v4

    const/high16 p1, 0x40000000    # 2.0f

    mul-float/2addr v8, p1

    mul-float/2addr v11, p1

    float-to-double v4, v8

    float-to-double v12, v11

    invoke-static {v4, v5, v12, v13}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    double-to-float p1, v4

    iget-boolean v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    iput v9, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mFocusX:F

    iput v10, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mFocusY:F

    iget-boolean v4, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    if-eqz v4, :cond_e

    if-eqz v6, :cond_e

    iget-object v4, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v4, p0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;->onScaleEnd(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)V

    iput-boolean v2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInitialSpan:F

    :cond_e
    if-eqz v6, :cond_f

    iput v8, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanX:F

    iput v8, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanX:F

    iput v11, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanY:F

    iput v11, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanY:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInitialSpan:F

    :cond_f
    iget v2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mMinSpan:I

    iget-boolean v4, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    if-nez v4, :cond_11

    int-to-float v2, v2

    cmpl-float v2, p1, v2

    if-ltz v2, :cond_11

    if-nez v1, :cond_10

    iget v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInitialSpan:F

    sub-float v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mSpanSlop:I

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_11

    :cond_10
    iput v8, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanX:F

    iput v8, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanX:F

    iput v11, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanY:F

    iput v11, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanY:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    iget-wide v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrTime:J

    iput-wide v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevTime:J

    iget-object v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v1, p0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;->onScaleBegin(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    :cond_11
    const/4 v1, 0x2

    if-ne v0, v1, :cond_13

    iput v8, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanX:F

    iput v11, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanY:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    nop

    iget-boolean p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mInProgress:Z

    if-eqz p1, :cond_12

    iget-object p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mListener:Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {p1, p0}, Lcom/android/camera/ui/zoom/ScaleGestureDetector$OnScaleGestureListener;->onScale(Lcom/android/camera/ui/zoom/ScaleGestureDetector;)Z

    move-result p1

    goto :goto_b

    :cond_12
    move p1, v3

    :goto_b
    if-eqz p1, :cond_13

    iget p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanX:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanX:F

    iget p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpanY:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpanY:F

    iget p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrSpan:F

    iput p1, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevSpan:F

    iget-wide v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mCurrTime:J

    iput-wide v0, p0, Lcom/android/camera/ui/zoom/ScaleGestureDetector;->mPrevTime:J

    :cond_13
    return v3
.end method
