.class public Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "LightingAnimateDrawable.java"


# static fields
.field public static final CENTER_FOCUSING_BIG:F = 0.576f

.field public static final CENTER_FOCUSING_SMALL:F = 0.548f


# instance fields
.field private isShown:Z

.field private mAlphaAnimator:Landroid/animation/ValueAnimator;

.field private mAnimateFocusDoing:Z

.field private mCircleHeightRatio:F

.field private mCircleRatio:F

.field private mExitAnimator:Landroid/animation/ValueAnimator;

.field private mFocusingAnimator:Landroid/animation/ValueAnimator;

.field private mHeight:I

.field private mMiddleHorizontalY:F

.field private mMiddleVerticalY:F

.field private mMiddleX:F

.field private mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

.field private mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

.field private mStartAnimator:Landroid/animation/ValueAnimator;

.field private mTopMargin:I

.field private mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

.field private mWidth:I

.field private pendingState:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    iput v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleHeightRatio:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAnimateFocusDoing:Z

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    invoke-direct {v1, p1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    invoke-direct {v1, p1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    invoke-static {p1, v0}, Lcom/android/camera/Util;->getDisplayRect(Landroid/content/Context;I)Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mTopMargin:I

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    return-object p0
.end method

.method static synthetic access$100(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    return p0
.end method

.method static synthetic access$202(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAnimateFocusDoing:Z

    return p0
.end method

.method static synthetic access$302(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAnimateFocusDoing:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->animateFocusing()V

    return-void
.end method

.method static synthetic access$500(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->pendingState:I

    return p0
.end method

.method private animateFocusing()V
    .locals 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAnimateFocusDoing:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->pendingState:I

    iget-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    const/4 v1, 0x2

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v3, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v3, 0x258

    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    iget-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1, v0}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$7;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$7;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$8;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$8;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f0c49ba    # 0.548f
        0x3f1374bc    # 0.576f
    .end array-data
.end method

.method private animateMiddleChange(I)V
    .locals 7

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    const/high16 v0, 0x40000000    # 2.0f

    const v1, 0x3faa3d71    # 1.33f

    const/16 v2, 0x5a

    if-eq p1, v2, :cond_1

    const/16 v2, 0x10e

    if-ne p1, v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v1

    div-float/2addr v4, v0

    invoke-virtual {p1, v2, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setTargetMiddle(FFF)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v1

    div-float/2addr v4, v0

    invoke-virtual {p1, v2, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setTargetMiddle(FFF)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v1

    div-float/2addr v4, v0

    const v5, 0x3f933333    # 1.15f

    div-float/2addr v4, v5

    invoke-virtual {p1, v2, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setTargetMiddle(FFF)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    iget v2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v6, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v6, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v6

    mul-float/2addr v4, v1

    div-float/2addr v4, v0

    div-float/2addr v4, v5

    invoke-virtual {p1, v2, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setTargetMiddle(FFF)V

    :goto_1
    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Landroid/view/animation/PathInterpolator;

    const v1, 0x3dcccccd    # 0.1f

    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v3, 0x3e800000    # 0.25f

    invoke-direct {v0, v3, v1, v3, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$1;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$2;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private cancelAllAnimation()V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mFocusingAnimator:Landroid/animation/ValueAnimator;

    :cond_2
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    :cond_3
    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mUpdateDegreeAnimator:Landroid/animation/ValueAnimator;

    :cond_4
    return-void
.end method


# virtual methods
.method public animateAlphaIn()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setVisible(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const v2, 0x3f0c49ba    # 0.548f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    const/16 v1, 0xff

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$5;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$5;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$6;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$6;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAlphaAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateExit()V
    .locals 5

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setVisible(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    const/high16 v1, 0x3fc00000    # 1.5f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    const/16 v1, 0x72

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/PathInterpolator;

    const/high16 v2, 0x3e800000    # 0.25f

    const v3, 0x3dcccccd    # 0.1f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3, v2, v4}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$10;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$10;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$11;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$11;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mExitAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateStart()V
    .locals 5

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setVisible(I)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    const v2, 0x3f0c49ba    # 0.548f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    const/16 v2, 0x72

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setTargetAlpha(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v2, 0x17c

    invoke-virtual {v0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    new-instance v2, Landroid/view/animation/PathInterpolator;

    const/high16 v3, 0x3e800000    # 0.25f

    const v4, 0x3dcccccd    # 0.1f

    invoke-direct {v2, v3, v4, v3, v1}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$3;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$3;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$4;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$4;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mStartAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public animateSuccess()V
    .locals 3

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    const v1, -0xff5701

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetColor(I)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    const v1, 0x3f1374bc    # 0.576f

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    const v2, 0x3f0c49ba    # 0.548f

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    iget-object v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setCurrentWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/android/camera/ui/drawable/CameraPaintBase;->setTargetWidthPercent(F)Lcom/android/camera/ui/drawable/CameraPaintBase;

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$9;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable$9;-><init>(Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->cancelAllAnimation()V

    invoke-virtual {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->invalidateSelf()V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    return-void

    :cond_1
    const/4 v2, 0x0

    const/4 v3, 0x0

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    int-to-float v4, v0

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    int-to-float v5, v0

    const/4 v6, 0x0

    const/16 v7, 0x1f

    move-object v1, p1

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->drawCanvas(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    invoke-virtual {v1, p1}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->drawCanvas(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setCircleHeightRatio(F)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleHeightRatio:F

    return-void
.end method

.method public setCircleRatio(F)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .param p1    # Landroid/graphics/ColorFilter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public setWidthHeight(III)V
    .locals 2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iput p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float v0, p1, p2

    iput v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    const v0, 0x3faa3d71    # 1.33f

    mul-float/2addr p1, v0

    div-float/2addr p1, p2

    const v1, 0x3f4ccccd    # 0.8f

    mul-float/2addr p1, v1

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v1}, Lcom/android/camera/Util;->dpToPixel(F)I

    move-result v1

    int-to-float v1, v1

    add-float/2addr p1, v1

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, v0

    div-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleHeightRatio:F

    mul-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleHeightRatio:F

    mul-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p1

    sget-boolean p2, Lcom/android/camera/Util;->isLongRatioScreen:Z

    if-eqz p2, :cond_0

    const/4 p2, 0x3

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mTopMargin:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mTopMargin:I

    int-to-float p2, p2

    add-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    iget p2, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-virtual {p1, p2, v0}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setData(II)V

    invoke-virtual {p0, p3}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->updateMiddleValue(I)V

    return-void
.end method

.method public triggerFocusing()V
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mAnimateFocusDoing:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->animateFocusing()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public triggerSuccess()V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->pendingState:I

    return-void
.end method

.method public updateMiddleValue(I)V
    .locals 7

    iget-boolean v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->isShown:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->animateMiddleChange(I)V

    goto :goto_1

    :cond_0
    const/16 v0, 0x5a

    const/high16 v1, 0x40000000    # 2.0f

    const v2, 0x3faa3d71    # 1.33f

    if-eq p1, v0, :cond_2

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v2

    div-float/2addr v4, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setMiddle(FFF)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleVerticalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v2

    div-float/2addr v4, v1

    invoke-virtual {p1, v0, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setMiddle(FFF)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintMask:Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v5

    mul-float/2addr v4, v2

    div-float/2addr v4, v1

    const v5, 0x3f933333    # 1.15f

    div-float/2addr v4, v5

    invoke-virtual {p1, v0, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintMask;->setMiddle(FFF)V

    iget-object p1, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mPaintCircle:Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;

    iget v0, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleX:F

    iget v3, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mMiddleHorizontalY:F

    iget v4, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mWidth:I

    iget v6, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mHeight:I

    invoke-static {v4, v6}, Ljava/lang/Math;->min(II)I

    move-result v4

    int-to-float v4, v4

    iget v6, p0, Lcom/android/camera/ui/drawable/lighting/LightingAnimateDrawable;->mCircleRatio:F

    mul-float/2addr v4, v6

    mul-float/2addr v4, v2

    div-float/2addr v4, v1

    div-float/2addr v4, v5

    invoke-virtual {p1, v0, v3, v4}, Lcom/android/camera/ui/drawable/lighting/LightingPaintCircle;->setMiddle(FFF)V

    :goto_1
    return-void
.end method
