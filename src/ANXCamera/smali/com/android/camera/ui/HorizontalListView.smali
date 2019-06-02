.class public Lcom/android/camera/ui/HorizontalListView;
.super Landroid/widget/AdapterView;
.source "HorizontalListView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;,
        Lcom/android/camera/ui/HorizontalListView$OnValueChangedListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/AdapterView<",
        "Landroid/widget/ListAdapter;",
        ">;"
    }
.end annotation


# static fields
.field private static final MIN_DELTA_FOR_SCROLLING:I = 0xa

.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected mAdapter:Landroid/widget/ListAdapter;

.field private mBlockNotification:Z

.field protected mCurrentX:I

.field private mDataChanged:Z

.field private mDataObserver:Landroid/database/DataSetObserver;

.field private mDisplayOffset:I

.field private mGesture:Landroid/view/GestureDetector;

.field private mIsScrollingPerformed:Z

.field private mItemWidth:I

.field private mLastSelectImageListItem:Landroid/view/View;

.field private mLeftViewIndex:I

.field private mMaxX:I

.field protected mNextX:I

.field private mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

.field private mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

.field private mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

.field private mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

.field private mPaddingWidth:I

.field private mPresetWidth:I

.field private mPreviousSelectViewIndex:I

.field private mRemovedViewQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mRightViewIndex:I

.field protected mScroller:Landroid/widget/Scroller;

.field private mSelectCenter:Z

.field private mSelectViewIndex:I

.field private mTouchDown:Z

.field private mTouchMoveEnable:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/ui/HorizontalListView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/AdapterView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 p1, 0x0

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    const p2, 0x7fffffff

    iput p2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    iput-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    const/16 p2, 0xb4

    iput p2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    new-instance p1, Lcom/android/camera/ui/HorizontalListView$1;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$1;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    new-instance p1, Lcom/android/camera/ui/HorizontalListView$4;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$4;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/camera/ui/HorizontalListView;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    return-void
.end method

.method static synthetic access$302(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return p1
.end method

.method static synthetic access$402(Lcom/android/camera/ui/HorizontalListView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/camera/ui/HorizontalListView;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    return p0
.end method

.method static synthetic access$600(Lcom/android/camera/ui/HorizontalListView;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemSelectedListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/android/camera/ui/HorizontalListView;)Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    return-object p0
.end method

.method static synthetic access$900(Lcom/android/camera/ui/HorizontalListView;)Landroid/widget/AdapterView$OnItemLongClickListener;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    return-object p0
.end method

.method private addAndMeasureChild(Landroid/view/View;I)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    :cond_0
    const/4 v1, 0x1

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/camera/ui/HorizontalListView;->addViewInLayout(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;Z)Z

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result p2

    const/high16 v0, -0x80000000

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v1

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method private cacheChildItem(Landroid/view/View;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    const/16 v1, 0xa

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method private fillList(I)V
    .locals 2

    nop

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getRight()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    invoke-direct {p0, v0, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListRight(II)V

    nop

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v1

    :cond_1
    invoke-direct {p0, v1, p1}, Lcom/android/camera/ui/HorizontalListView;->fillListLeft(II)V

    return-void
.end method

.method private fillListLeft(II)V
    .locals 5

    :goto_0
    add-int v0, p1, p2

    if-lez v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-ltz v0, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1, v0, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v1, v4, :cond_0

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    :goto_1
    invoke-direct {p0, v0, v2}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    sub-int/2addr p1, v0

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    goto :goto_0

    :cond_1
    return-void
.end method

.method private fillListRight(II)V
    .locals 5

    :goto_0
    add-int v0, p1, p2

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    invoke-direct {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v0

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {v1, v0, v2, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget v4, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v1, v4, :cond_0

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setActivated(Z)V

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setActivated(Z)V

    :goto_1
    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Lcom/android/camera/ui/HorizontalListView;->addAndMeasureChild(Landroid/view/View;I)V

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    add-int/2addr p1, v0

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    sub-int/2addr v1, v3

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v0, v0, 0x2

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v1

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v4}, Landroid/widget/ListAdapter;->getCount()I

    move-result v4

    mul-int/2addr v1, v4

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-gez v0, :cond_2

    iput v2, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/2addr v0, v3

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    goto :goto_0

    :cond_3
    return-void
.end method

.method private getChildWidth()I
    .locals 1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    return v0
.end method

.method private declared-synchronized initView()V
    .locals 4

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    const v1, 0x7fffffff

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iget-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    sub-int/2addr v1, v2

    div-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    goto :goto_0

    :cond_0
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    :goto_0
    new-instance v1, Landroid/widget/Scroller;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnGesture:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setActivated(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->loadCameraSound(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private justify()V
    .locals 4

    nop

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 v2, 0x1

    if-le v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr v0, v1

    sub-int/2addr v0, v2

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    move v2, v0

    :cond_1
    :goto_0
    if-nez v2, :cond_2

    return-void

    :cond_2
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    mul-int/2addr v1, v2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    mul-int/lit8 v1, v1, 0x2

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    mul-int/2addr v2, v3

    add-int/2addr v1, v2

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-le v0, v1, :cond_3

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    :cond_3
    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    if-eq v0, v1, :cond_5

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->scrollTo(I)V

    goto :goto_1

    :cond_4
    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    :cond_5
    :goto_1
    return-void
.end method

.method private loadItems()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private measureChildWidth()V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0xb4

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    nop

    const/4 v2, 0x0

    move v3, v0

    move v0, v2

    :goto_0
    if-ge v0, v1, :cond_2

    iget-object v4, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v5, 0x0

    invoke-interface {v4, v0, v5, p0}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    if-le v5, v3, :cond_1

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    return-void
.end method

.method private notifyItemSelect(Landroid/view/View;IJ)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_1
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    move-object v4, p0

    move-object v5, p1

    move v6, p2

    move-wide v7, p3

    invoke-interface/range {v3 .. v8}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_2
    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p2, v2}, Landroid/view/View;->setActivated(Z)V

    :cond_3
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setActivated(Z)V

    goto :goto_0

    :cond_4
    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, p3}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p3

    if-ne p2, p3, :cond_6

    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    if-eqz p2, :cond_5

    iget-object p2, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p2, v2}, Landroid/view/View;->setActivated(Z)V

    :cond_5
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mLastSelectImageListItem:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setActivated(Z)V

    :cond_6
    :goto_0
    return-void
.end method

.method private positionItems(I)V
    .locals 12

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_3

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    div-int/lit8 v2, v2, 0x2

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    const/4 v4, 0x1

    add-int/2addr v3, v4

    const/4 v5, 0x0

    move v6, v3

    move v3, p1

    move p1, v5

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v7

    if-ge p1, v7, :cond_3

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    if-ge v8, v2, :cond_0

    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    if-le v8, v2, :cond_0

    move v8, v4

    goto :goto_1

    :cond_0
    nop

    move v8, v5

    :goto_1
    add-int v9, v3, v0

    invoke-virtual {v7, v3, v5, v9, v1}, Landroid/view/View;->layout(IIII)V

    if-ge v3, v2, :cond_1

    if-le v9, v2, :cond_1

    move v3, v4

    goto :goto_2

    :cond_1
    nop

    move v3, v5

    :goto_2
    invoke-virtual {v7, v3}, Landroid/view/View;->setActivated(Z)V

    iget-boolean v10, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz v10, :cond_2

    if-eqz v3, :cond_2

    if-nez v8, :cond_2

    invoke-direct {p0, v6}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result v3

    iget-object v8, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v8, v3}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v10

    invoke-direct {p0, v7, v3, v10, v11}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    :cond_2
    add-int/lit8 v6, v6, 0x1

    nop

    add-int/lit8 p1, p1, 0x1

    move v3, v9

    goto :goto_0

    :cond_3
    return-void
.end method

.method private removeNonVisibleItems(I)V
    .locals 5

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    nop

    move v2, v0

    :goto_0
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v3

    add-int/2addr v3, p1

    if-gtz v3, :cond_0

    iget v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildWidth()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    invoke-direct {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_0

    :cond_0
    if-lez v2, :cond_1

    sub-int/2addr v2, v0

    invoke-virtual {p0, v0, v2}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    :cond_1
    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    nop

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    move v2, v0

    :goto_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v3

    add-int/2addr v3, p1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getWidth()I

    move-result v4

    if-lt v3, v4, :cond_2

    invoke-direct {p0, v1}, Lcom/android/camera/ui/HorizontalListView;->cacheChildItem(Landroid/view/View;)V

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {p0, v2}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    goto :goto_1

    :cond_2
    if-le v0, v2, :cond_3

    add-int/lit8 p1, v2, 0x1

    sub-int/2addr v0, v2

    invoke-virtual {p0, p1, v0}, Lcom/android/camera/ui/HorizontalListView;->removeViewsInLayout(II)V

    :cond_3
    return-void
.end method

.method private declared-synchronized reset()V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private toDataIndex(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    :cond_0
    return p1
.end method

.method private toViewIndex(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    sub-int/2addr v0, p1

    return v0

    :cond_0
    return p1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/AdapterView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v2, p0, Lcom/android/camera/ui/HorizontalListView;->mGesture:Landroid/view/GestureDetector;

    invoke-virtual {v2, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    or-int/2addr v0, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v2, 0x3

    if-eq p1, v2, :cond_1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mBlockNotification:Z

    goto :goto_0

    :cond_1
    :pswitch_1
    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_2

    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    :cond_2
    iput-boolean v1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    :goto_0
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic getAdapter()Landroid/widget/Adapter;
    .locals 1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getSelectedView()Landroid/view/View;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isScrolling()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    return v0
.end method

.method public isTouchMoveEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    return v0
.end method

.method protected onDown(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Scroller;->forceFinished(Z)V

    return v0
.end method

.method protected onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 9

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    const/4 v2, 0x0

    neg-float p1, p3

    float-to-int v3, p1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget v6, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/widget/Scroller;->fling(IIIIIIII)V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V

    const/4 p1, 0x1

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected declared-synchronized onLayout(ZIIII)V
    .locals 0

    monitor-enter p0

    :try_start_0
    invoke-super/range {p0 .. p5}, Landroid/widget/AdapterView;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    nop

    :try_start_1
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    const/4 p2, 0x1

    const/4 p3, 0x0

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->initView()V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->removeAllViewsInLayout()V

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iput-boolean p3, p0, Lcom/android/camera/ui/HorizontalListView;->mDataChanged:Z

    nop

    move p1, p2

    goto :goto_0

    :cond_1
    move p1, p3

    :goto_0
    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result p4

    if-eqz p4, :cond_2

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->getCurrX()I

    move-result p4

    iput p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    :cond_2
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    if-gtz p4, :cond_3

    iput p3, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    :cond_3
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    if-lt p4, p5, :cond_4

    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mMaxX:I

    iput p4, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    :cond_4
    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int/2addr p4, p5

    iget p5, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iput p5, p0, Lcom/android/camera/ui/HorizontalListView;->mCurrentX:I

    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->removeNonVisibleItems(I)V

    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->fillList(I)V

    invoke-direct {p0, p4}, Lcom/android/camera/ui/HorizontalListView;->positionItems(I)V

    iget-object p4, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p4}, Landroid/widget/Scroller;->isFinished()Z

    move-result p4

    if-eqz p4, :cond_8

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->loadItems()V

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    if-eqz p1, :cond_9

    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchDown:Z

    if-nez p1, :cond_9

    iput-boolean p3, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz p1, :cond_6

    new-instance p1, Lcom/android/camera/ui/HorizontalListView$3;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$3;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z

    :cond_6
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    if-eq p1, p3, :cond_9

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le p1, p3, :cond_7

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-gt p1, p3, :cond_7

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p1

    iget p3, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iget p4, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int/2addr p3, p4

    sub-int/2addr p3, p2

    invoke-virtual {p0, p3}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    iget-object p3, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p3, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide p3

    invoke-direct {p0, p2, p1, p3, p4}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    :cond_7
    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    goto :goto_2

    :cond_8
    :goto_1
    new-instance p1, Lcom/android/camera/ui/HorizontalListView$2;

    invoke-direct {p1, p0}, Lcom/android/camera/ui/HorizontalListView$2;-><init>(Lcom/android/camera/ui/HorizontalListView;)V

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->post(Ljava/lang/Runnable;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_9
    :goto_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized scrollTo(I)V
    .locals 3

    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mScroller:Landroid/widget/Scroller;

    iget v1, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    iget v2, p0, Lcom/android/camera/ui/HorizontalListView;->mNextX:I

    sub-int/2addr p1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p1, v2}, Landroid/widget/Scroller;->startScroll(IIII)V

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->requestLayout()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRemovedViewQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    :cond_0
    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->measureChildWidth()V

    iget-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v0, p0, Lcom/android/camera/ui/HorizontalListView;->mDataObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->reset()V

    return-void
.end method

.method public setItemWidth(I)V
    .locals 1

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectCenter:Z

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mItemWidth:I

    sub-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iget p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPaddingWidth:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mDisplayOffset:I

    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemClicked:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemLongClicked:Landroid/widget/AdapterView$OnItemLongClickListener;

    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSelected:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-void
.end method

.method public setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/HorizontalListView;->mOnItemSingleTapDowned:Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;

    return-void
.end method

.method public setPresetWidth(I)V
    .locals 0

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mPresetWidth:I

    return-void
.end method

.method public setSelection(I)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toViewIndex(I)I

    move-result p1

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    iput v0, p0, Lcom/android/camera/ui/HorizontalListView;->mPreviousSelectViewIndex:I

    iput p1, p0, Lcom/android/camera/ui/HorizontalListView;->mSelectViewIndex:I

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->isShown()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/ui/HorizontalListView;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ActivityBase;

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/camera/ActivityBase;->playCameraSound(I)V

    :cond_1
    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    if-le p1, v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mRightViewIndex:I

    if-ge p1, v0, :cond_2

    iget v0, p0, Lcom/android/camera/ui/HorizontalListView;->mLeftViewIndex:I

    sub-int v0, p1, v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/HorizontalListView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/android/camera/ui/HorizontalListView;->toDataIndex(I)I

    move-result p1

    iget-object v1, p0, Lcom/android/camera/ui/HorizontalListView;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-direct {p0, v0, p1, v1, v2}, Lcom/android/camera/ui/HorizontalListView;->notifyItemSelect(Landroid/view/View;IJ)V

    :cond_2
    iget-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mIsScrollingPerformed:Z

    if-nez p1, :cond_3

    invoke-direct {p0}, Lcom/android/camera/ui/HorizontalListView;->justify()V

    :cond_3
    return-void
.end method

.method public setTouchMoveEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/ui/HorizontalListView;->mTouchMoveEnable:Z

    return-void
.end method
