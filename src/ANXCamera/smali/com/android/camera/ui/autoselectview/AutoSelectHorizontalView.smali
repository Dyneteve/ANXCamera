.class public Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;
.super Landroid/support/v7/widget/RecyclerView;
.source "AutoSelectHorizontalView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;
    }
.end annotation


# instance fields
.field private isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private isFirstPositionChanged:Z

.field private isInit:Z

.field private isMoveFinished:Z

.field private mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

.field private mDeltaX:I

.field private mInitPosition:I

.field private mItemPageCount:I

.field private mLastMoveX:I

.field private mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private mScroller:Landroid/widget/Scroller;

.field private mSelectPosition:I

.field private mTempSelectPosition:I

.field private mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    iput v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iput v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mTempSelectPosition:I

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isFirstPositionChanged:Z

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    const/4 p2, 0x7

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mTempSelectPosition:I

    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isFirstPositionChanged:Z

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    const/4 p2, 0x7

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mTempSelectPosition:I

    new-instance p2, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {p2, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isFirstPositionChanged:Z

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isInit:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isInit:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    return p0
.end method

.method static synthetic access$102(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;I)I
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    return p1
.end method

.method static synthetic access$200(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isFirstPositionChanged:Z

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)Landroid/support/v7/widget/LinearLayoutManager;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    return-object p0
.end method

.method private calculateSelectedPos()V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result v0

    if-lez v0, :cond_1

    iget v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    div-int/2addr v1, v0

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    goto :goto_0

    :cond_0
    iget v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    div-int/2addr v2, v0

    add-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    :cond_1
    :goto_0
    return-void
.end method

.method private correctDeltax(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    iget v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    if-gt v0, v1, :cond_0

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    sub-int/2addr v2, p1

    add-int/lit8 v2, v2, 0x1

    mul-int/2addr v1, v2

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    :cond_0
    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->calculateSelectedPos()V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;

    invoke-direct {v1, p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$1;-><init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method private onDataAdd(I)V
    .locals 0

    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    return-void
.end method

.method private onDataChanged()V
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    return-void
.end method

.method private onDataRemove(I)V
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    if-gt p1, v0, :cond_0

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->correctDeltax(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    invoke-direct {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->correctDeltax(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 3

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView;->computeScroll()V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLastMoveX:I

    sub-int/2addr v0, v2

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLastMoveX:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLastMoveX:I

    invoke-virtual {p0, v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->scrollBy(II)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public moveMiddlePositionChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->onMoveMiddlePoisionChanged(I)V

    :cond_0
    return-void
.end method

.method public moveToPosition(I)V
    .locals 4

    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    invoke-virtual {v0}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->getItemCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLastMoveX:I

    iput-boolean v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isMoveFinished:Z

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    if-eq p1, v2, :cond_1

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    sub-int/2addr p1, v2

    mul-int/2addr p1, v1

    iget-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getScrollX()I

    move-result v2

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getScrollY()I

    move-result v3

    invoke-virtual {v1, v2, v3, p1, v0}, Landroid/widget/Scroller;->startScroll(IIII)V

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->postInvalidate()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    const-string p1, "View"

    const-string v0, "Your position should be from 0 to + (mAutoSelectAdapter.getItemCount() - 1)"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    invoke-super {p0}, Landroid/support/v7/widget/RecyclerView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-static {v0, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->access$602(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;Landroid/content/Context;)Landroid/content/Context;

    iput-object v1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    :cond_1
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 4

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->onScrollStateChanged(I)V

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result p1

    if-nez p1, :cond_1

    return-void

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    rem-int/2addr v0, p1

    const/4 v1, 0x0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v2

    div-int/lit8 v3, p1, 0x2

    if-gt v2, v3, :cond_3

    neg-int p1, v0

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->scrollBy(II)V

    goto :goto_0

    :cond_3
    if-lez v0, :cond_4

    sub-int/2addr p1, v0

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->scrollBy(II)V

    goto :goto_0

    :cond_4
    add-int/2addr p1, v0

    neg-int p1, p1

    invoke-virtual {p0, p1, v1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->scrollBy(II)V

    :goto_0
    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->calculateSelectedPos()V

    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->selectedPositionChanged(I)V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :cond_5
    return-void
.end method

.method public onScrolled(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->onScrolled(II)V

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mTempSelectPosition:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    add-int/2addr p2, p1

    iput p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    invoke-direct {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->calculateSelectedPos()V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isClickMove:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_1

    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mTempSelectPosition:I

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    if-eq p1, p2, :cond_1

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;->getItemWidth()I

    move-result p1

    iget p2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    iget v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    mul-int/2addr v0, p1

    sub-int/2addr p2, v0

    div-int/lit8 p1, p1, 0x2

    if-le p2, p1, :cond_0

    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->moveMiddlePositionChanged(I)V

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->moveMiddlePositionChanged(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public selectedPositionChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;->onSelectedPositionChanged(I)V

    :cond_0
    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 3

    instance-of v0, p1, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "mAutoSelectAdapter must extends AutoSelectAdapter<T extends SelectItemBean> "

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    move-object v0, p1

    check-cast v0, Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    new-instance v0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    invoke-direct {v0, p0, p1, v1, v2}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;-><init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;Landroid/support/v7/widget/RecyclerView$Adapter;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    new-instance v0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;

    invoke-direct {v0, p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$2;-><init>(Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;)V

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mDeltaX:I

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    if-nez v0, :cond_1

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mWrapAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView$WrapperAdapter;

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->isInit:Z

    return-void
.end method

.method public setInitPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    if-eqz v0, :cond_0

    const-string p1, "View"

    const-string v0, "This method should be called before setAdapter()!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mInitPosition:I

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mSelectPosition:I

    return-void
.end method

.method public setItemPageCount(I)V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mAutoSelectAdapter:Lcom/android/camera/ui/autoselectview/AutoSelectAdapter;

    if-eqz v0, :cond_0

    const-string p1, "View"

    const-string v0, "This method should be called before setAdapter()!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    rem-int/lit8 v0, p1, 0x2

    if-nez v0, :cond_1

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mItemPageCount:I

    :goto_0
    return-void
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .locals 1

    instance-of v0, p1, Landroid/support/v7/widget/LinearLayoutManager;

    if-nez v0, :cond_0

    const-string p1, "View"

    const-string v0, "The LayoutManager here must be LinearLayoutManager!"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    check-cast p1, Landroid/support/v7/widget/LinearLayoutManager;

    iput-object p1, p0, Lcom/android/camera/ui/autoselectview/AutoSelectHorizontalView;->mLinearLayoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    return-void
.end method
