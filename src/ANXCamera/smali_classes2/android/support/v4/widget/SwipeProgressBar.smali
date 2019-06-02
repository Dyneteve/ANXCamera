.class final Landroid/support/v4/widget/SwipeProgressBar;
.super Ljava/lang/Object;
.source "SwipeProgressBar.java"


# static fields
.field private static final ANIMATION_DURATION_MS:I = 0x7d0

.field private static final COLOR1:I = -0x4d000000

.field private static final COLOR2:I = -0x80000000

.field private static final COLOR3:I = 0x4d000000

.field private static final COLOR4:I = 0x1a000000

.field private static final FINISH_ANIMATION_DURATION_MS:I = 0x3e8

.field private static final INTERPOLATOR:Landroid/view/animation/Interpolator;


# instance fields
.field private mBounds:Landroid/graphics/Rect;

.field private final mClipRect:Landroid/graphics/RectF;

.field private mColor1:I

.field private mColor2:I

.field private mColor3:I

.field private mColor4:I

.field private mFinishTime:J

.field private final mPaint:Landroid/graphics/Paint;

.field private mParent:Landroid/view/View;

.field private mRunning:Z

.field private mStartTime:J

.field private mTriggerPercentage:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/support/v4/view/animation/FastOutSlowInInterpolator;

    invoke-direct {v0}, Landroid/support/v4/view/animation/FastOutSlowInInterpolator;-><init>()V

    sput-object v0, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput-object p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    const/high16 v0, -0x4d000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    const/high16 v0, 0x4d000000    # 1.34217728E8f

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    const/high16 v0, 0x1a000000

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    return-void
.end method

.method private drawCircle(Landroid/graphics/Canvas;FFIF)V
    .registers 9

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    sget-object v0, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-interface {v0, p5}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    invoke-virtual {p1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    iget-object v1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, p2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawTrigger(Landroid/graphics/Canvas;II)V
    .registers 8

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v0, p2

    int-to-float v1, p3

    int-to-float v2, p2

    iget v3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    mul-float/2addr v2, v3

    iget-object v3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;)V
    .registers 33

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v8

    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v9

    div-int/lit8 v10, v8, 0x2

    div-int/lit8 v11, v9, 0x2

    const/4 v0, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v12

    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-boolean v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    const-wide/16 v2, 0x0

    const/4 v13, 0x0

    if-nez v1, :cond_40

    iget-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    cmp-long v1, v4, v2

    if-lez v1, :cond_2c

    goto :goto_40

    :cond_2c
    iget v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    cmpl-float v1, v1, v13

    if-lez v1, :cond_19c

    iget v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    float-to-double v1, v1

    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    cmpg-double v1, v1, v3

    if-gtz v1, :cond_19c

    invoke-direct {v6, v7, v10, v11}, Landroid/support/v4/widget/SwipeProgressBar;->drawTrigger(Landroid/graphics/Canvas;II)V

    goto/16 :goto_19c

    :cond_40
    :goto_40
    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v14

    iget-wide v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    sub-long v4, v14, v4

    const-wide/16 v16, 0x7d0

    rem-long v4, v4, v16

    iget-wide v2, v6, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    sub-long v1, v14, v2

    div-long v16, v1, v16

    long-to-float v1, v4

    const/high16 v2, 0x41a00000    # 20.0f

    div-float v20, v1, v2

    iget-boolean v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    const/high16 v21, 0x42c80000    # 100.0f

    if-nez v1, :cond_a2

    iget-wide v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    sub-long v1, v14, v1

    const-wide/16 v22, 0x3e8

    cmp-long v1, v1, v22

    if-ltz v1, :cond_6c

    const-wide/16 v1, 0x0

    iput-wide v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    return-void

    :cond_6c
    iget-wide v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    sub-long v1, v14, v1

    rem-long v1, v1, v22

    long-to-float v3, v1

    const/high16 v22, 0x41200000    # 10.0f

    div-float v3, v3, v22

    div-float v13, v3, v21

    move/from16 v24, v0

    div-int/lit8 v0, v8, 0x2

    int-to-float v0, v0

    move-wide/from16 v25, v1

    sget-object v1, Landroid/support/v4/widget/SwipeProgressBar;->INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-interface {v1, v13}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v1

    mul-float/2addr v0, v1

    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    int-to-float v2, v10

    sub-float/2addr v2, v0

    move/from16 v27, v3

    int-to-float v3, v10

    add-float/2addr v3, v0

    move/from16 v28, v0

    int-to-float v0, v9

    move-wide/from16 v29, v4

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mClipRect:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {v7, v0, v1, v1}, Landroid/graphics/Canvas;->saveLayerAlpha(Landroid/graphics/RectF;II)I

    const/4 v0, 0x1

    move/from16 v24, v0

    goto :goto_a6

    :cond_a2
    move/from16 v24, v0

    move-wide/from16 v29, v4

    :goto_a6
    const-wide/16 v0, 0x0

    cmp-long v0, v16, v0

    const/high16 v13, 0x42960000    # 75.0f

    const/high16 v18, 0x42480000    # 50.0f

    const/high16 v19, 0x41c80000    # 25.0f

    if-nez v0, :cond_b8

    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_e8

    :cond_b8
    const/4 v0, 0x0

    cmpl-float v1, v20, v0

    if-ltz v1, :cond_c7

    cmpg-float v0, v20, v19

    if-gez v0, :cond_c7

    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_e8

    :cond_c7
    cmpl-float v0, v20, v19

    if-ltz v0, :cond_d5

    cmpg-float v0, v20, v18

    if-gez v0, :cond_d5

    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_e8

    :cond_d5
    cmpl-float v0, v20, v18

    if-ltz v0, :cond_e3

    cmpg-float v0, v20, v13

    if-gez v0, :cond_e3

    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    goto :goto_e8

    :cond_e3
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    invoke-virtual {v7, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    :goto_e8
    const/4 v0, 0x0

    cmpl-float v1, v20, v0

    const/high16 v22, 0x40000000    # 2.0f

    if-ltz v1, :cond_107

    cmpg-float v0, v20, v19

    if-gtz v0, :cond_107

    add-float v0, v20, v19

    mul-float v0, v0, v22

    div-float v23, v0, v21

    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    move-object v0, v6

    move-object v1, v7

    move-wide/from16 v25, v29

    move/from16 v5, v23

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    goto :goto_109

    :cond_107
    move-wide/from16 v25, v29

    :goto_109
    const/4 v0, 0x0

    cmpl-float v1, v20, v0

    if-ltz v1, :cond_121

    cmpg-float v0, v20, v18

    if-gtz v0, :cond_121

    mul-float v0, v20, v22

    div-float v23, v0, v21

    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    move-object v0, v6

    move-object v1, v7

    move/from16 v5, v23

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    :cond_121
    cmpl-float v0, v20, v19

    if-ltz v0, :cond_13a

    cmpg-float v0, v20, v13

    if-gtz v0, :cond_13a

    sub-float v0, v20, v19

    mul-float v0, v0, v22

    div-float v19, v0, v21

    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    move-object v0, v6

    move-object v1, v7

    move/from16 v5, v19

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    :cond_13a
    cmpl-float v0, v20, v18

    if-ltz v0, :cond_153

    cmpg-float v0, v20, v21

    if-gtz v0, :cond_153

    sub-float v0, v20, v18

    mul-float v0, v0, v22

    div-float v18, v0, v21

    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    move-object v0, v6

    move-object v1, v7

    move/from16 v5, v18

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    :cond_153
    cmpl-float v0, v20, v13

    if-ltz v0, :cond_16b

    cmpg-float v0, v20, v21

    if-gtz v0, :cond_16b

    sub-float v0, v20, v13

    mul-float v0, v0, v22

    div-float v13, v0, v21

    int-to-float v2, v10

    int-to-float v3, v11

    iget v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    move-object v0, v6

    move-object v1, v7

    move v5, v13

    invoke-direct/range {v0 .. v5}, Landroid/support/v4/widget/SwipeProgressBar;->drawCircle(Landroid/graphics/Canvas;FFIF)V

    :cond_16b
    iget v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_184

    if-eqz v24, :cond_184

    invoke-virtual {v7, v12}, Landroid/graphics/Canvas;->restoreToCount(I)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v7, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    invoke-direct {v6, v7, v10, v11}, Landroid/support/v4/widget/SwipeProgressBar;->drawTrigger(Landroid/graphics/Canvas;II)V

    move v12, v0

    :cond_184
    iget-object v0, v6, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    iget-object v1, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, v6, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;IIII)V

    nop

    move/from16 v0, v24

    :cond_19c
    :goto_19c
    invoke-virtual {v7, v12}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method isRunning()Z
    .registers 5

    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-nez v0, :cond_f

    iget-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method setBounds(IIII)V
    .registers 6

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput p1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput p2, v0, Landroid/graphics/Rect;->top:I

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput p3, v0, Landroid/graphics/Rect;->right:I

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iput p4, v0, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method setColorScheme(IIII)V
    .registers 5

    iput p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor1:I

    iput p2, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor2:I

    iput p3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor3:I

    iput p4, p0, Landroid/support/v4/widget/SwipeProgressBar;->mColor4:I

    return-void
.end method

.method setTriggerPercentage(F)V
    .registers 7

    iput p1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    iget-object v1, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    iget-object v3, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    iget-object v4, p0, Landroid/support/v4/widget/SwipeProgressBar;->mBounds:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;IIII)V

    return-void
.end method

.method start()V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-nez v0, :cond_15

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mStartTime:J

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    :cond_15
    return-void
.end method

.method stop()V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    if-eqz v0, :cond_15

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mTriggerPercentage:F

    invoke-static {}, Landroid/view/animation/AnimationUtils;->currentAnimationTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mFinishTime:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mRunning:Z

    iget-object v0, p0, Landroid/support/v4/widget/SwipeProgressBar;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    :cond_15
    return-void
.end method
