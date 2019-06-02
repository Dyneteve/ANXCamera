.class public Lcom/android/camera/ui/HorizontalSlideView;
.super Landroid/view/View;
.source "HorizontalSlideView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;,
        Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;,
        Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;,
        Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HSlideView"


# instance fields
.field private mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

.field private mIsScrollingPerformed:Z

.field private mJustifyEnabled:Z

.field private mMaxX:I

.field private mMinX:I

.field private mNeedJustify:Z

.field private mOnItemSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;

.field private mOnPositionSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;

.field private mOnTabListener:Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;

.field protected mOriginX:F

.field protected mPositionX:I

.field protected mScroller:Landroid/widget/Scroller;

.field protected mSelectedItemIndex:I

.field private mTouchDown:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mJustifyEnabled:Z

    new-instance v0, Lcom/android/camera/ui/HorizontalSlideView$1;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/HorizontalSlideView$1;-><init>(Lcom/android/camera/ui/HorizontalSlideView;)V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mJustifyEnabled:Z

    new-instance p2, Lcom/android/camera/ui/HorizontalSlideView$1;

    invoke-direct {p2, p0}, Lcom/android/camera/ui/HorizontalSlideView$1;-><init>(Lcom/android/camera/ui/HorizontalSlideView;)V

    iput-object p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iput p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mJustifyEnabled:Z

    new-instance p2, Lcom/android/camera/ui/HorizontalSlideView$1;

    invoke-direct {p2, p0}, Lcom/android/camera/ui/HorizontalSlideView$1;-><init>(Lcom/android/camera/ui/HorizontalSlideView;)V

    iput-object p2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/ui/HorizontalSlideView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/ui/HorizontalSlideView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->scroll(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/ui/HorizontalSlideView;)Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnTabListener:Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;

    return-object p0
.end method

.method static synthetic access$302(Lcom/android/camera/ui/HorizontalSlideView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mIsScrollingPerformed:Z

    return p1
.end method

.method static synthetic access$400(Lcom/android/camera/ui/HorizontalSlideView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    return p0
.end method

.method static synthetic access$500(Lcom/android/camera/ui/HorizontalSlideView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/ui/HorizontalSlideView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->setPositionX(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/camera/ui/HorizontalSlideView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->flingX(I)V

    return-void
.end method

.method private calculateLength(II)F
    .locals 17

    move-object/from16 v0, p0

    nop

    nop

    iget v1, v0, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    nop

    nop

    iget-object v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    const/4 v3, 0x0

    if-eqz v2, :cond_b

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_0

    iget-object v6, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v6}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v6

    sub-int/2addr v6, v5

    goto :goto_0

    :cond_0
    move v6, v4

    :goto_0
    if-eqz v2, :cond_1

    move v7, v4

    goto :goto_1

    :cond_1
    iget-object v7, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v7}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v7

    sub-int/2addr v7, v5

    :goto_1
    if-eqz v2, :cond_2

    const/4 v2, -0x1

    goto :goto_2

    :cond_2
    move v2, v5

    :goto_2
    move v9, v3

    move v10, v9

    move v11, v10

    move v8, v4

    :goto_3
    iget-object v12, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v12}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v12

    if-ge v8, v12, :cond_a

    mul-int v12, v8, v2

    add-int/2addr v12, v6

    if-ne v12, v6, :cond_3

    move v13, v5

    goto :goto_4

    :cond_3
    nop

    move v13, v4

    :goto_4
    if-ne v12, v7, :cond_4

    move v14, v5

    goto :goto_5

    :cond_4
    nop

    move v14, v4

    :goto_5
    invoke-direct {v0, v12}, Lcom/android/camera/ui/HorizontalSlideView;->getItemWidth(I)F

    move-result v15

    const/high16 v16, 0x40000000    # 2.0f

    div-float v16, v15, v16

    if-eqz v13, :cond_5

    iget v11, v0, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    sub-float v11, v11, v16

    :cond_5
    if-eqz v13, :cond_6

    move v13, v1

    goto :goto_6

    :cond_6
    add-float v13, v11, v16

    :goto_6
    if-eqz v14, :cond_7

    move v14, v3

    goto :goto_7

    :cond_7
    invoke-direct {v0, v8}, Lcom/android/camera/ui/HorizontalSlideView;->getItemGap(I)F

    move-result v14

    add-float/2addr v14, v15

    :goto_7
    add-float/2addr v11, v14

    move/from16 v14, p1

    if-ne v12, v14, :cond_8

    nop

    move/from16 v15, p2

    move v9, v13

    goto :goto_8

    :cond_8
    move/from16 v15, p2

    if-ne v12, v15, :cond_9

    nop

    move v10, v13

    :cond_9
    :goto_8
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    :cond_a
    move v3, v10

    goto :goto_9

    :cond_b
    move v9, v3

    :goto_9
    sub-float/2addr v3, v9

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v0

    return v0
.end method

.method private flingX(I)V
    .locals 10

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mIsScrollingPerformed:Z

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    iget v2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget v6, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iget v7, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move v4, p1

    invoke-virtual/range {v1 .. v9}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method

.method private getItemGap(I)F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->measureGap(I)F

    move-result p1

    return p1
.end method

.method private getItemWidth(I)F
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->measureWidth(I)F

    move-result p1

    return p1
.end method

.method private scroll(I)V
    .locals 3

    if-eqz p1, :cond_2

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    add-int/2addr v0, p1

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    if-ge v0, v1, :cond_0

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    sub-int/2addr p1, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    add-int/2addr v0, p1

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    if-le v0, v1, :cond_1

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    sub-int/2addr p1, v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mIsScrollingPerformed:Z

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, v2}, Landroid/widget/Scroller;->startScroll(IIII)V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    :cond_2
    return-void
.end method

.method private select(I)V
    .locals 3

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "HSlideView"

    const-string v0, "is doing action, ignore select."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    if-ne v0, p1, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->isScrolling()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnItemSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnItemSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    invoke-interface {p1, p0, v0}, Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;->onItemSelect(Lcom/android/camera/ui/HorizontalSlideView;I)V

    :cond_2
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnPositionSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;

    if-eqz p1, :cond_4

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    int-to-float p1, p1

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr p1, v0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnPositionSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float p1, v2, p1

    :cond_3
    invoke-interface {v0, p0, v1, p1}, Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;->onPositionSelect(Lcom/android/camera/ui/HorizontalSlideView;IF)V

    :cond_4
    return-void
.end method

.method private setPositionX(I)V
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    if-ge p1, v0, :cond_0

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method


# virtual methods
.method public canPositionScroll()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getSelectedItemIndex()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    return v0
.end method

.method protected init(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v0, p1, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    return-void
.end method

.method public isScrolling()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mIsScrollingPerformed:Z

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->getCurrX()I

    move-result v2

    iput v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    :cond_0
    iget-object v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->isFinished()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    iget-boolean v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mTouchDown:Z

    if-nez v2, :cond_1

    iput-boolean v3, v0, Lcom/android/camera/ui/HorizontalSlideView;->mIsScrollingPerformed:Z

    :cond_1
    iget v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    iget v4, v0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    int-to-float v4, v4

    sub-float/2addr v2, v4

    nop

    nop

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    nop

    nop

    nop

    iget-object v6, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    const/4 v7, 0x0

    if-eqz v6, :cond_1a

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v6

    const/4 v8, 0x1

    if-eqz v6, :cond_2

    iget-object v9, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v9}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v9

    sub-int/2addr v9, v8

    goto :goto_0

    :cond_2
    move v9, v3

    :goto_0
    if-eqz v6, :cond_3

    move v10, v3

    goto :goto_1

    :cond_3
    iget-object v10, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v10}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v10

    sub-int/2addr v10, v8

    :goto_1
    if-eqz v6, :cond_4

    const/4 v6, -0x1

    goto :goto_2

    :cond_4
    move v6, v8

    :goto_2
    move v12, v2

    move v11, v3

    move v13, v7

    move v14, v13

    move/from16 v16, v14

    move v15, v8

    :goto_3
    iget-object v8, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v8}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v8

    if-ge v11, v8, :cond_f

    mul-int v8, v11, v6

    add-int/2addr v8, v9

    if-ne v8, v9, :cond_5

    const/4 v12, 0x1

    goto :goto_4

    :cond_5
    nop

    move v12, v3

    :goto_4
    if-ne v8, v10, :cond_6

    const/16 v17, 0x1

    goto :goto_5

    :cond_6
    nop

    move/from16 v17, v3

    :goto_5
    invoke-direct {v0, v8}, Lcom/android/camera/ui/HorizontalSlideView;->getItemWidth(I)F

    move-result v18

    div-float v19, v18, v5

    if-eqz v12, :cond_7

    move v13, v7

    :cond_7
    if-eqz v17, :cond_8

    move/from16 v20, v7

    goto :goto_6

    :cond_8
    invoke-direct {v0, v8}, Lcom/android/camera/ui/HorizontalSlideView;->getItemGap(I)F

    move-result v20

    div-float v20, v20, v5

    :goto_6
    if-eqz v12, :cond_9

    sub-float v14, v2, v19

    :cond_9
    if-eqz v12, :cond_a

    move v12, v2

    goto :goto_7

    :cond_a
    add-float v12, v14, v19

    :goto_7
    if-eqz v15, :cond_d

    iget v3, v0, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    sub-float v3, v12, v3

    cmpg-float v21, v3, v7

    if-gtz v21, :cond_b

    neg-float v5, v3

    add-float v21, v19, v20

    cmpg-float v5, v5, v21

    if-lez v5, :cond_c

    :cond_b
    cmpl-float v5, v3, v7

    if-lez v5, :cond_d

    add-float v19, v19, v13

    cmpg-float v5, v3, v19

    if-gtz v5, :cond_d

    :cond_c
    invoke-direct {v0, v8}, Lcom/android/camera/ui/HorizontalSlideView;->select(I)V

    nop

    nop

    move/from16 v16, v3

    const/4 v15, 0x0

    :cond_d
    if-eqz v17, :cond_e

    move v3, v7

    goto :goto_8

    :cond_e
    invoke-direct {v0, v8}, Lcom/android/camera/ui/HorizontalSlideView;->getItemGap(I)F

    move-result v3

    add-float v3, v18, v3

    :goto_8
    add-float/2addr v14, v3

    add-int/lit8 v11, v11, 0x1

    move/from16 v13, v20

    const/4 v3, 0x0

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v8, 0x1

    goto :goto_3

    :cond_f
    sub-float/2addr v12, v2

    float-to-int v3, v12

    iput v3, v0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    const/4 v3, 0x0

    :goto_9
    iget-object v5, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v5}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v5

    if-ge v3, v5, :cond_19

    mul-int v5, v3, v6

    add-int/2addr v5, v9

    if-ne v5, v9, :cond_10

    const/4 v8, 0x1

    goto :goto_a

    :cond_10
    nop

    const/4 v8, 0x0

    :goto_a
    if-ne v5, v10, :cond_11

    const/4 v11, 0x1

    goto :goto_b

    :cond_11
    nop

    const/4 v11, 0x0

    :goto_b
    invoke-direct {v0, v5}, Lcom/android/camera/ui/HorizontalSlideView;->getItemWidth(I)F

    move-result v12

    const/high16 v13, 0x40000000    # 2.0f

    div-float v15, v12, v13

    if-eqz v8, :cond_12

    sub-float v14, v2, v15

    :cond_12
    if-eqz v8, :cond_13

    move v8, v2

    goto :goto_c

    :cond_13
    add-float v8, v14, v15

    :goto_c
    add-float v15, v14, v12

    cmpl-float v17, v15, v7

    if-ltz v17, :cond_17

    invoke-virtual/range {p0 .. p0}, Lcom/android/camera/ui/HorizontalSlideView;->getWidth()I

    move-result v7

    int-to-float v7, v7

    cmpg-float v7, v14, v7

    if-gtz v7, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v7, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v7, v5}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v7

    sget-object v13, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    if-ne v7, v13, :cond_14

    invoke-virtual {v1, v14, v4}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_d

    :cond_14
    iget-object v7, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v7, v5}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getAlign(I)Landroid/graphics/Paint$Align;

    move-result-object v7

    sget-object v13, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    if-ne v7, v13, :cond_15

    invoke-virtual {v1, v8, v4}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_d

    :cond_15
    invoke-virtual {v1, v15, v4}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_d
    iget-object v7, v0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    iget v8, v0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    if-ne v8, v5, :cond_16

    const/4 v8, 0x1

    goto :goto_e

    :cond_16
    const/4 v8, 0x0

    :goto_e
    invoke-virtual {v7, v5, v1, v8}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->draw(ILandroid/graphics/Canvas;Z)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    :cond_17
    if-eqz v11, :cond_18

    const/4 v7, 0x0

    goto :goto_f

    :cond_18
    invoke-direct {v0, v5}, Lcom/android/camera/ui/HorizontalSlideView;->getItemGap(I)F

    move-result v5

    add-float v7, v12, v5

    :goto_f
    add-float/2addr v14, v7

    add-int/lit8 v3, v3, 0x1

    const/4 v7, 0x0

    goto :goto_9

    :cond_19
    move/from16 v1, v16

    goto :goto_10

    :cond_1a
    const/4 v1, 0x0

    :goto_10
    iget-boolean v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mJustifyEnabled:Z

    if-eqz v2, :cond_1b

    iget-boolean v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    if-eqz v2, :cond_1b

    iget-object v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v2}, Landroid/widget/Scroller;->isFinished()Z

    move-result v2

    if-eqz v2, :cond_1b

    const/4 v2, 0x0

    iput-boolean v2, v0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    float-to-int v1, v1

    invoke-direct {v0, v1}, Lcom/android/camera/ui/HorizontalSlideView;->scroll(I)V

    :cond_1b
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOriginX:F

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v1, 0x3

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq p1, v1, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput-boolean v3, p0, Lcom/android/camera/ui/HorizontalSlideView;->mTouchDown:Z

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->canPositionScroll()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "HSlideView"

    const-string v0, "cannot scroll, do not process the down event."

    invoke-static {p1, v0}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    :pswitch_1
    iput-boolean v2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mTouchDown:Z

    iput-boolean v3, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    :cond_1
    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V
    .locals 3

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v2}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-direct {p0, p1, v2}, Lcom/android/camera/ui/HorizontalSlideView;->calculateLength(II)F

    move-result p1

    float-to-int p1, p1

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    :cond_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method

.method public setJustifyEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mJustifyEnabled:Z

    return-void
.end method

.method public setOnItemSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnItemSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;

    return-void
.end method

.method public setOnPositionSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnPositionSelectListener:Lcom/android/camera/ui/HorizontalSlideView$OnPositionSelectListener;

    return-void
.end method

.method public setOnTabListener(Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mOnTabListener:Lcom/android/camera/ui/HorizontalSlideView$OnTabListener;

    return-void
.end method

.method public setSelection(F)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    if-eqz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p1, v0, p1

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    mul-float/2addr p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method

.method public setSelection(I)V
    .locals 3

    iget v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mSelectedItemIndex:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {v1}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result v1

    if-lt p1, v1, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mDrawAdapter:Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;

    invoke-virtual {p1}, Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;->getCount()I

    move-result p1

    sub-int/2addr p1, v2

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMaxX:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->calculateLength(II)F

    move-result v0

    float-to-int v0, v0

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    goto :goto_0

    :cond_2
    iget v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mMinX:I

    invoke-direct {p0, v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->calculateLength(II)F

    move-result v0

    float-to-int v0, v0

    add-int/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mPositionX:I

    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->select(I)V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method

.method public stopScroll()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalSlideView;->mNeedJustify:Z

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalSlideView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1, v0}, Landroid/widget/Scroller;->forceFinished(Z)V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalSlideView;->invalidate()V

    return-void
.end method
