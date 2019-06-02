.class public Landroid/support/v7/widget/StaggeredGridLayoutManager;
.super Landroid/support/v7/widget/RecyclerView$LayoutManager;
.source "StaggeredGridLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;,
        Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field public static final GAP_HANDLING_LAZY:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS:I = 0x2

.field public static final GAP_HANDLING_NONE:I = 0x0

.field public static final HORIZONTAL:I = 0x0

.field private static final INVALID_OFFSET:I = -0x80000000

.field public static final TAG:Ljava/lang/String; = "StaggeredGridLayoutManager"

.field public static final VERTICAL:I = 0x1


# instance fields
.field private final mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

.field private final mCheckForGapsRunnable:Ljava/lang/Runnable;

.field private mFullSizeSpec:I

.field private mGapStrategy:I

.field private mHeightSpec:I

.field private mLaidOutInvalidFullSpan:Z

.field private mLastLayoutFromEnd:Z

.field private mLastLayoutRTL:Z

.field private mLayoutState:Landroid/support/v7/widget/LayoutState;

.field mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

.field private mOrientation:I

.field private mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

.field mPendingScrollPosition:I

.field mPendingScrollPositionOffset:I

.field mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field private mRemainingSpans:Ljava/util/BitSet;

.field private mReverseLayout:Z

.field mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

.field mShouldReverseLayout:Z

.field private mSizePerSpan:I

.field private mSmoothScrollbarEnabled:Z

.field private mSpanCount:I

.field private mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

.field private final mTmpRect:Landroid/graphics/Rect;

.field private mWidthSpec:I


# direct methods
.method public constructor <init>(II)V
    .registers 6

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setSpanCount(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 8

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v0, 0x2

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$1;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-static {p1, p2, p3, p4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getProperties(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;

    move-result-object v0

    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->orientation:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setOrientation(I)V

    iget v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->spanCount:I

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setSpanCount(I)V

    iget-boolean v1, v0, Landroid/support/v7/widget/RecyclerView$LayoutManager$Properties;->reverseLayout:Z

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setReverseLayout(Z)V

    return-void
.end method

.method static synthetic access$100(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z
    .registers 2

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Landroid/support/v7/widget/StaggeredGridLayoutManager;I)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$500(Landroid/support/v7/widget/StaggeredGridLayoutManager;)I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method static synthetic access$600(Landroid/support/v7/widget/StaggeredGridLayoutManager;)Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method private appendViewToAllSpans(Landroid/view/View;)V
    .registers 4

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v0, -0x1

    :goto_4
    if-ltz v0, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    :cond_10
    return-void
.end method

.method private applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-lez v0, :cond_50

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ne v0, v1, :cond_43

    const/4 v0, 0x0

    :goto_f
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_50

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aget v1, v1, v0

    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_39

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v2, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    if-eqz v2, :cond_32

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    goto :goto_39

    :cond_32
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    add-int/2addr v1, v2

    :cond_39
    :goto_39
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v0

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    :cond_43
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateSpanInfo()V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    :cond_50
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setReverseLayout(Z)V

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_74

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iput-boolean v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    goto :goto_78

    :cond_74
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    :goto_78
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_8f

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    :cond_8f
    return-void
.end method

.method private attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V
    .registers 6

    iget v0, p3, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_d

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->appendViewToAllSpans(Landroid/view/View;)V

    goto :goto_20

    :cond_d
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->appendToSpan(Landroid/view/View;)V

    goto :goto_20

    :cond_13
    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_1b

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->prependViewToAllSpans(Landroid/view/View;)V

    goto :goto_20

    :cond_1b
    iget-object v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    :goto_20
    return-void
.end method

.method private calculateScrollDirectionForPosition(I)I
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-nez v0, :cond_f

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_e

    move v1, v2

    nop

    :cond_e
    return v1

    :cond_f
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    if-ge p1, v0, :cond_17

    move v3, v2

    goto :goto_18

    :cond_17
    const/4 v3, 0x0

    :goto_18
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v3, v4, :cond_1d

    goto :goto_1e

    :cond_1d
    move v1, v2

    :goto_1e
    return v1
.end method

.method private checkForGaps()Z
    .registers 9

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7f

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-eqz v0, :cond_7f

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_12

    goto :goto_7f

    :cond_12
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_1f

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v0

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v2

    goto :goto_27

    :cond_1f
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v2

    :goto_27
    const/4 v3, 0x1

    if-nez v0, :cond_3c

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->hasGapsToFix()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_3c

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return v3

    :cond_3c
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-nez v4, :cond_41

    return v1

    :cond_41
    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v4, :cond_47

    const/4 v4, -0x1

    goto :goto_48

    :cond_47
    move v4, v3

    :goto_48
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v5, v0, v6, v4, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(IIIZ)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v5

    if-nez v5, :cond_5c

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/lit8 v6, v2, 0x1

    invoke-virtual {v3, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    return v1

    :cond_5c
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v6, v5, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    mul-int/lit8 v7, v4, -0x1

    invoke-virtual {v1, v0, v6, v7, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFirstFullSpanItemInRange(IIIZ)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    if-nez v1, :cond_70

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v5, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    goto :goto_78

    :cond_70
    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    add-int/2addr v7, v3

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->forceInvalidateAfter(I)I

    :goto_78
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestSimpleAnimationsInNextLayout()V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return v3

    :cond_7f
    :goto_7f
    return v1
.end method

.method private checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z
    .registers 5

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    if-ge v0, v2, :cond_1f

    return v1

    :cond_12
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    if-le v0, v2, :cond_1f

    return v1

    :cond_1f
    const/4 v0, 0x0

    return v0
.end method

.method private computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return v0

    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    return v0
.end method

.method private computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 10

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return v0

    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v7}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;ZZ)I

    move-result v0

    return v0
.end method

.method private computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 9

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return v0

    :cond_8
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    xor-int/2addr v0, v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSmoothScrollbarEnabled:Z

    move-object v1, p1

    move-object v5, p0

    invoke-static/range {v1 .. v6}, Landroid/support/v7/widget/ScrollbarHelper;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/OrientationHelper;Landroid/view/View;Landroid/view/View;Landroid/support/v7/widget/RecyclerView$LayoutManager;Z)I

    move-result v0

    return v0
.end method

.method private createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    const/4 v1, 0x0

    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_21

    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v3

    sub-int v3, p1, v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_21
    return-object v0
.end method

.method private createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    const/4 v1, 0x0

    :goto_c
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_20

    iget-object v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapPerSpan:[I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v3

    sub-int/2addr v3, p1

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_20
    return-object v0
.end method

.method private ensureOrientationHelper()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-nez v0, :cond_1d

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    rsub-int/lit8 v0, v0, 0x1

    invoke-static {p0, v0}, Landroid/support/v7/widget/OrientationHelper;->createOrientationHelper(Landroid/support/v7/widget/RecyclerView$LayoutManager;I)Landroid/support/v7/widget/OrientationHelper;

    move-result-object v0

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    new-instance v0, Landroid/support/v7/widget/LayoutState;

    invoke-direct {v0}, Landroid/support/v7/widget/LayoutState;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    :cond_1d
    return-void
.end method

.method private fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 27

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v0, v9, v1, v10}, Ljava/util/BitSet;->set(IIZ)V

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_19

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    add-int/2addr v0, v1

    goto :goto_1e

    :cond_19
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    sub-int/2addr v0, v1

    :goto_1e
    move v11, v0

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    iget-boolean v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_2f

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    goto :goto_35

    :cond_2f
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    :goto_35
    move v12, v0

    move v0, v9

    :goto_37
    move v13, v0

    invoke-virtual/range {p2 .. p3}, Landroid/support/v7/widget/LayoutState;->hasMore(Landroid/support/v7/widget/RecyclerView$State;)Z

    move-result v0

    const/4 v1, -0x1

    if-eqz v0, :cond_17c

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17c

    invoke-virtual {v8, v7}, Landroid/support/v7/widget/LayoutState;->next(Landroid/support/v7/widget/RecyclerView$Recycler;)Landroid/view/View;

    move-result-object v14

    invoke-virtual {v14}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v15, v0

    check-cast v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-virtual {v15}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getViewLayoutPosition()I

    move-result v5

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getSpan(I)I

    move-result v4

    if-ne v4, v1, :cond_60

    move v0, v10

    goto :goto_61

    :cond_60
    move v0, v9

    :goto_61
    move/from16 v16, v0

    if-eqz v16, :cond_78

    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_6e

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v0, v0, v9

    goto :goto_72

    :cond_6e
    invoke-direct {v6, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    move-result-object v0

    :goto_72
    iget-object v2, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v2, v5, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->setSpan(ILandroid/support/v7/widget/StaggeredGridLayoutManager$Span;)V

    goto :goto_7c

    :cond_78
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v0, v0, v4

    :goto_7c
    move-object v3, v0

    iput-object v3, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_87

    invoke-virtual {v6, v14}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;)V

    goto :goto_8a

    :cond_87
    invoke-virtual {v6, v14, v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->addView(Landroid/view/View;I)V

    :goto_8a
    invoke-direct {v6, v14, v15}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_bd

    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_9a

    invoke-direct {v6, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    goto :goto_9e

    :cond_9a
    invoke-virtual {v3, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    :goto_9e
    iget-object v2, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v2

    add-int/2addr v2, v0

    if-eqz v16, :cond_b9

    iget-boolean v9, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v9, :cond_b9

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromEnd(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v9

    iput v1, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    iput v5, v9, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, v9}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    nop

    :cond_b9
    move v9, v0

    move/from16 v19, v2

    goto :goto_e8

    :cond_bd
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_c6

    invoke-direct {v6, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    goto :goto_ca

    :cond_c6
    invoke-virtual {v3, v12}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    :goto_ca
    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    sub-int v1, v0, v1

    if-eqz v16, :cond_e5

    iget-boolean v2, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v2, :cond_e5

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->createFullSpanItemFromStart(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v2

    iput v10, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mGapDir:I

    iput v5, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mPosition:I

    iget-object v9, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v9, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->addFullSpanItem(Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    :cond_e5
    move/from16 v19, v0

    move v9, v1

    :goto_e8
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_113

    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_113

    if-eqz v16, :cond_f6

    iput-boolean v10, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    goto :goto_113

    :cond_f6
    iget v0, v8, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v10, :cond_100

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->areAllEndsEqual()Z

    move-result v0

    xor-int/2addr v0, v10

    goto :goto_105

    :cond_100
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->areAllStartsEqual()Z

    move-result v0

    xor-int/2addr v0, v10

    :goto_105
    if-eqz v0, :cond_113

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->getFullSpanItem(I)Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v1

    if-eqz v1, :cond_111

    iput-boolean v10, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->mHasUnwantedGapAfter:Z

    :cond_111
    iput-boolean v10, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    :cond_113
    :goto_113
    invoke-direct {v6, v14, v15, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->attachViewToSpans(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;Landroid/support/v7/widget/LayoutState;)V

    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_121

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    goto :goto_12d

    :cond_121
    iget v0, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    iget v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    mul-int/2addr v0, v1

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    add-int/2addr v0, v1

    :goto_12d
    move/from16 v18, v0

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0, v14}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v0

    add-int v20, v18, v0

    iget v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v10, :cond_14d

    move-object v0, v6

    move-object v1, v14

    move/from16 v2, v18

    move-object v10, v3

    move v3, v9

    move/from16 v21, v4

    move/from16 v4, v20

    move/from16 v22, v5

    move/from16 v5, v19

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    goto :goto_15e

    :cond_14d
    move-object v10, v3

    move/from16 v21, v4

    move/from16 v22, v5

    move-object v0, v6

    move-object v1, v14

    move v2, v9

    move/from16 v3, v18

    move/from16 v4, v19

    move/from16 v5, v20

    invoke-direct/range {v0 .. v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecoratedWithMargins(Landroid/view/View;IIII)V

    :goto_15e
    iget-boolean v0, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v0, :cond_16a

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAllRemainingSpans(II)V

    goto :goto_171

    :cond_16a
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {v6, v10, v0, v11}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    :goto_171
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {v6, v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V

    const/4 v0, 0x1

    nop

    const/4 v9, 0x0

    const/4 v10, 0x1

    goto/16 :goto_37

    :cond_17c
    if-nez v13, :cond_183

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {v6, v7, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V

    :cond_183
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v0, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_19c

    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    sub-int/2addr v1, v0

    goto :goto_1ae

    :cond_19c
    iget-object v0, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    invoke-direct {v6, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    iget-object v1, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    sub-int v1, v0, v1

    :goto_1ae
    move v0, v1

    if-lez v0, :cond_1ba

    iget v1, v8, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v9

    move/from16 v17, v9

    goto :goto_1bc

    :cond_1ba
    const/16 v17, 0x0

    :goto_1bc
    return v17
.end method

.method private findFirstReferenceChildPosition(I)I
    .registers 7

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_6
    if-ge v2, v0, :cond_18

    invoke-virtual {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    if-ltz v4, :cond_15

    if-ge v4, p1, :cond_15

    return v4

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_18
    return v1
.end method

.method private findLastReferenceChildPosition(I)I
    .registers 5

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_18

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    if-ltz v2, :cond_15

    if-ge v2, p1, :cond_15

    return v2

    :cond_15
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_18
    const/4 v0, 0x0

    return v0
.end method

.method private fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxEnd(I)I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    sub-int/2addr v1, v0

    if-lez v1, :cond_25

    neg-int v2, v1

    invoke-virtual {p0, v2, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    neg-int v2, v2

    nop

    sub-int/2addr v1, v2

    if-eqz p3, :cond_24

    if-lez v1, :cond_24

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    :cond_24
    return-void

    :cond_25
    return-void
.end method

.method private fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V
    .registers 9

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinStart(I)I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    sub-int v1, v0, v1

    if-lez v1, :cond_25

    invoke-virtual {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v2

    nop

    sub-int/2addr v1, v2

    if-eqz p3, :cond_24

    if-lez v1, :cond_24

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v4, v1

    invoke-virtual {v3, v4}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    :cond_24
    return-void

    :cond_25
    return-void
.end method

.method private getFirstChildPosition()I
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    goto :goto_10

    :cond_8
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_10
    return v1
.end method

.method private getLastChildPosition()I
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    goto :goto_12

    :cond_8
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_12
    return v1
.end method

.method private getMaxEnd(I)I
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    const/4 v1, 0x1

    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    if-le v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method private getMaxStart(I)I
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    const/4 v1, 0x1

    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    if-le v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method private getMinEnd(I)I
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    const/4 v1, 0x1

    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    if-ge v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method private getMinStart(I)I
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    const/4 v1, 0x1

    :goto_a
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_1c

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    if-ge v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method private getNextSpan(Landroid/support/v7/widget/LayoutState;)Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;
    .registers 12

    iget v0, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->preferLastSpan(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_f

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    sub-int/2addr v2, v1

    const/4 v3, -0x1

    const/4 v4, -0x1

    goto :goto_13

    :cond_f
    const/4 v2, 0x0

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    move v4, v1

    :goto_13
    iget v5, p1, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v5, v1, :cond_34

    const/4 v1, 0x0

    const v5, 0x7fffffff

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v6

    move-object v7, v1

    move v1, v2

    :goto_23
    if-eq v1, v3, :cond_33

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v8, v1

    invoke-virtual {v8, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v9

    if-ge v9, v5, :cond_31

    move-object v7, v8

    move v5, v9

    :cond_31
    add-int/2addr v1, v4

    goto :goto_23

    :cond_33
    return-object v7

    :cond_34
    const/4 v1, 0x0

    const/high16 v5, -0x80000000

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v6

    move-object v7, v1

    move v1, v2

    :goto_3f
    if-eq v1, v3, :cond_4f

    iget-object v8, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v8, v8, v1

    invoke-virtual {v8, v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v9

    if-le v9, v5, :cond_4d

    move-object v7, v8

    move v5, v9

    :cond_4d
    add-int/2addr v1, v4

    goto :goto_3f

    :cond_4f
    return-object v7
.end method

.method private getSpecForDimension(II)I
    .registers 4

    if-gez p1, :cond_3

    return p2

    :cond_3
    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    return v0
.end method

.method private handleUpdate(III)V
    .registers 9

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v0, :cond_9

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v0

    goto :goto_d

    :cond_9
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v0

    :goto_d
    const/4 v1, 0x3

    if-ne p3, v1, :cond_1a

    if-ge p1, p2, :cond_16

    add-int/lit8 v2, p2, 0x1

    move v3, p1

    :goto_15
    goto :goto_1d

    :cond_16
    add-int/lit8 v2, p1, 0x1

    move v3, p2

    goto :goto_15

    :cond_1a
    move v3, p1

    add-int v2, p1, p2

    :goto_1d
    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v4, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->invalidateAfter(I)I

    if-eq p3, v1, :cond_34

    packed-switch p3, :pswitch_data_56

    goto :goto_3f

    :pswitch_28
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    goto :goto_3f

    :pswitch_2e
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    goto :goto_3f

    :cond_34
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v4, 0x1

    invoke-virtual {v1, p1, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForRemoval(II)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, p2, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->offsetForAddition(II)V

    :goto_3f
    if-gt v2, v0, :cond_42

    return-void

    :cond_42
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_4b

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    goto :goto_4f

    :cond_4b
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    :goto_4f
    if-gt v3, v1, :cond_54

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    :cond_54
    return-void

    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_28
    .end packed-switch
.end method

.method private layoutDecoratedWithMargins(Landroid/view/View;IIII)V
    .registers 14

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    add-int v4, p2, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    add-int v5, p3, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    sub-int v6, p4, v1

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    sub-int v7, p5, v1

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->layoutDecorated(Landroid/view/View;IIII)V

    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;II)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateItemDecorationsForChild(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->leftMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->rightMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v3

    invoke-direct {p0, p2, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p2

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->topMargin:I

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iget v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->bottomMargin:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v2, v3

    invoke-direct {p0, p3, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateSpecWithExtra(III)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    return-void
.end method

.method private measureChildWithDecorationsAndMargin(Landroid/view/View;Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;)V
    .registers 6

    iget-boolean v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_25

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v1, :cond_17

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    iget v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    :cond_17
    iget v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    :cond_25
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne v0, v1, :cond_37

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    iget v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->height:I

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, v1, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v1

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    goto :goto_44

    :cond_37
    iget v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->width:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    invoke-direct {p0, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getSpecForDimension(II)I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-direct {p0, p1, v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->measureChildWithDecorationsAndMargin(Landroid/view/View;II)V

    :goto_44
    return-void
.end method

.method private preferLastSpan(I)Z
    .registers 6

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_13

    if-ne p1, v1, :cond_b

    move v0, v3

    goto :goto_c

    :cond_b
    move v0, v2

    :goto_c
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eq v0, v1, :cond_12

    move v2, v3

    nop

    :cond_12
    return v2

    :cond_13
    if-ne p1, v1, :cond_17

    move v0, v3

    goto :goto_18

    :cond_17
    move v0, v2

    :goto_18
    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ne v0, v1, :cond_1e

    move v0, v3

    goto :goto_1f

    :cond_1e
    move v0, v2

    :goto_1f
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    if-ne v0, v1, :cond_27

    move v2, v3

    nop

    :cond_27
    return v2
.end method

.method private prependViewToAllSpans(Landroid/view/View;)V
    .registers 4

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    add-int/lit8 v0, v0, -0x1

    :goto_4
    if-ltz v0, :cond_10

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->prependToSpan(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    :cond_10
    return-void
.end method

.method private recycle(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;)V
    .registers 6

    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    const/4 v1, -0x1

    if-nez v0, :cond_15

    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v1, :cond_f

    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4e

    :cond_f
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    invoke-direct {p0, p1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4e

    :cond_15
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    if-ne v0, v1, :cond_34

    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    invoke-direct {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMaxStart(I)I

    move-result v1

    sub-int/2addr v0, v1

    if-gez v0, :cond_27

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    goto :goto_30

    :cond_27
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    iget v2, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v1, v2

    :goto_30
    invoke-direct {p0, p1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    goto :goto_4e

    :cond_34
    iget v0, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getMinEnd(I)I

    move-result v0

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    sub-int/2addr v0, v1

    if-gez v0, :cond_42

    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    goto :goto_4b

    :cond_42
    iget v1, p2, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget v2, p2, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    add-int/2addr v1, v2

    :goto_4b
    invoke-direct {p0, p1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V

    :goto_4e
    return-void
.end method

.method private recycleFromEnd(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 11

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    add-int/lit8 v1, v0, -0x1

    :goto_6
    if-ltz v1, :cond_60

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v2}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    if-lt v3, p2, :cond_5f

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget-boolean v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v5, 0x1

    if-eqz v4, :cond_46

    const/4 v4, 0x0

    move v6, v4

    :goto_21
    iget v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v6, v7, :cond_37

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v7, v7, v6

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ne v7, v5, :cond_34

    return-void

    :cond_34
    add-int/lit8 v6, v6, 0x1

    goto :goto_21

    :cond_37
    nop

    :goto_38
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_58

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    add-int/lit8 v4, v4, 0x1

    goto :goto_38

    :cond_46
    iget-object v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v5, :cond_53

    return-void

    :cond_53
    iget-object v4, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popEnd()V

    :cond_58
    invoke-virtual {p0, v2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    nop

    add-int/lit8 v1, v1, -0x1

    goto :goto_6

    :cond_5f
    return-void

    :cond_60
    return-void
.end method

.method private recycleFromStart(Landroid/support/v7/widget/RecyclerView$Recycler;I)V
    .registers 9

    :goto_0
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-lez v0, :cond_5c

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v1}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    if-gt v2, p2, :cond_5b

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget-boolean v3, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_44

    move v3, v0

    :goto_1f
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v3, v5, :cond_35

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v3

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v4, :cond_32

    return-void

    :cond_32
    add-int/lit8 v3, v3, 0x1

    goto :goto_1f

    :cond_35
    nop

    :goto_36
    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v3, :cond_56

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v3, v3, v0

    invoke-virtual {v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_36

    :cond_44
    iget-object v0, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v4, :cond_51

    return-void

    :cond_51
    iget-object v0, v2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->popStart()V

    :cond_56
    invoke-virtual {p0, v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleView(Landroid/view/View;Landroid/support/v7/widget/RecyclerView$Recycler;)V

    nop

    goto :goto_0

    :cond_5b
    return-void

    :cond_5c
    return-void
.end method

.method private resolveShouldLayoutReverse()V
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_12

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_12

    :cond_c
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    goto :goto_16

    :cond_12
    :goto_12
    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    :goto_16
    return-void
.end method

.method private setLayoutStateDirection(I)V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LayoutState;->mLayoutDirection:I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-ne p1, v3, :cond_e

    move v4, v2

    goto :goto_f

    :cond_e
    const/4 v4, 0x0

    :goto_f
    if-ne v1, v4, :cond_12

    goto :goto_13

    :cond_12
    move v2, v3

    :goto_13
    iput v2, v0, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    return-void
.end method

.method private updateAllRemainingSpans(II)V
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    # getter for: Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mViews:Ljava/util/ArrayList;
    invoke-static {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->access$300(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_14

    goto :goto_1b

    :cond_14
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-direct {p0, v1, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V

    :goto_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1e
    return-void
.end method

.method private updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 4

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findLastReferenceChildPosition(I)I

    move-result v0

    goto :goto_15

    :cond_d
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstReferenceChildPosition(I)I

    move-result v0

    :goto_15
    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    const/high16 v0, -0x80000000

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    const/4 v0, 0x1

    return v0
.end method

.method private updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    const/4 v1, 0x0

    iput v1, v0, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput p1, v0, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    const/4 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isSmoothScrolling()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getTargetScrollPosition()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_2d

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-ge v3, p1, :cond_1e

    const/4 v1, 0x1

    nop

    :cond_1e
    if-ne v4, v1, :cond_27

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v2

    goto :goto_2d

    :cond_27
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    :cond_2d
    :goto_2d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getClipToPadding()Z

    move-result v1

    if-eqz v1, :cond_4a

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v4

    sub-int/2addr v4, v0

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v4

    add-int/2addr v4, v2

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    goto :goto_5a

    :cond_4a
    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v4}, Landroid/support/v7/widget/OrientationHelper;->getEnd()I

    move-result v4

    add-int/2addr v4, v2

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mEndLine:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    neg-int v4, v0

    iput v4, v3, Landroid/support/v7/widget/LayoutState;->mStartLine:I

    :goto_5a
    return-void
.end method

.method private updateRemainingSpans(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;II)V
    .registers 9

    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getDeletedSize()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p2, v2, :cond_18

    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine()I

    move-result v2

    add-int v3, v2, v0

    if-gt v3, p3, :cond_17

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v4, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->set(IZ)V

    :cond_17
    goto :goto_27

    :cond_18
    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine()I

    move-result v2

    sub-int v3, v2, v0

    if-lt v3, p3, :cond_27

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v4, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v3, v4, v1}, Ljava/util/BitSet;->set(IZ)V

    :cond_27
    :goto_27
    return-void
.end method

.method private updateSpecWithExtra(III)I
    .registers 6

    if-nez p2, :cond_5

    if-nez p3, :cond_5

    return p1

    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_13

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_12

    goto :goto_13

    :cond_12
    return p1

    :cond_13
    :goto_13
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    sub-int/2addr v1, p2

    sub-int/2addr v1, p3

    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    return v1
.end method


# virtual methods
.method areAllEndsEqual()Z
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v0

    const/4 v3, 0x1

    move v4, v3

    :goto_d
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_1f

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    return v1

    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_1f
    return v3
.end method

.method areAllStartsEqual()Z
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v0

    const/4 v3, 0x1

    move v4, v3

    :goto_d
    iget v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v4, v5, :cond_1f

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    return v1

    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_1f
    return v3
.end method

.method public assertNotInLayoutOrScroll(Ljava/lang/String;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_7

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method public canScrollHorizontally()Z
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public canScrollVertically()Z
    .registers 3

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public checkLayoutParams(Landroid/support/v7/widget/RecyclerView$LayoutParams;)Z
    .registers 3

    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    return v0
.end method

.method public computeHorizontalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeHorizontalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollExtent(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollOffset(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public computeVerticalScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->computeScrollRange(Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public findFirstCompletelyVisibleItemPositions([I)[I
    .registers 5

    if-nez p1, :cond_7

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    :goto_c
    const/4 v0, 0x0

    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1e
    return-object p1

    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;
    .registers 10

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    :goto_16
    if-ltz v3, :cond_3c

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5, v4}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v4}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v6

    if-le v6, v0, :cond_39

    if-lt v5, v1, :cond_2d

    goto :goto_39

    :cond_2d
    if-le v6, v1, :cond_38

    if-nez p1, :cond_32

    goto :goto_38

    :cond_32
    if-eqz p2, :cond_39

    if-nez v2, :cond_39

    move-object v2, v4

    goto :goto_39

    :cond_38
    :goto_38
    return-object v4

    :cond_39
    :goto_39
    add-int/lit8 v3, v3, -0x1

    goto :goto_16

    :cond_3c
    return-object v2
.end method

.method findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;
    .registers 11

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v0

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_15
    if-ge v4, v2, :cond_3b

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v6

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v7, v5}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v7

    if-le v7, v0, :cond_38

    if-lt v6, v1, :cond_2c

    goto :goto_38

    :cond_2c
    if-ge v6, v0, :cond_37

    if-nez p1, :cond_31

    goto :goto_37

    :cond_31
    if-eqz p2, :cond_38

    if-nez v3, :cond_38

    move-object v3, v5

    goto :goto_38

    :cond_37
    :goto_37
    return-object v5

    :cond_38
    :goto_38
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_3b
    return-object v3
.end method

.method findFirstVisibleItemPositionInt()I
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    invoke-virtual {p0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v0

    goto :goto_e

    :cond_a
    invoke-virtual {p0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v0

    :goto_e
    if-nez v0, :cond_12

    const/4 v1, -0x1

    goto :goto_16

    :cond_12
    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v1

    :goto_16
    return v1
.end method

.method public findFirstVisibleItemPositions([I)[I
    .registers 5

    if-nez p1, :cond_7

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    :goto_c
    const/4 v0, 0x0

    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findFirstVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1e
    return-object p1

    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findLastCompletelyVisibleItemPositions([I)[I
    .registers 5

    if-nez p1, :cond_7

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    :goto_c
    const/4 v0, 0x0

    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastCompletelyVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1e
    return-object p1

    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public findLastVisibleItemPositions([I)[I
    .registers 5

    if-nez p1, :cond_7

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array p1, v0, [I

    goto :goto_c

    :cond_7
    array-length v0, p1

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-lt v0, v1, :cond_1f

    :goto_c
    const/4 v0, 0x0

    :goto_d
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_1e

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->findLastVisibleItemPosition()I

    move-result v1

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_1e
    return-object p1

    :cond_1f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Provided int[]\'s size must be more than or equal to span count. Expected:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", array size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v2, p1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public generateDefaultLayoutParams()Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 3

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;
    .registers 4

    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_d

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    move-object v1, p1

    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    :cond_d
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0

    :cond_8
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getColumnCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public getGapStrategy()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    return v0
.end method

.method public getOrientation()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    return v0
.end method

.method public getReverseLayout()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    return v0
.end method

.method public getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 4

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-nez v0, :cond_7

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0

    :cond_7
    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getRowCountForAccessibility(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public getSpanCount()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    return v0
.end method

.method hasGapsToFix()Landroid/view/View;
    .registers 18

    move-object/from16 v0, p0

    const/4 v1, 0x0

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    new-instance v4, Ljava/util/BitSet;

    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-direct {v4, v5}, Ljava/util/BitSet;-><init>(I)V

    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    const/4 v6, 0x0

    invoke-virtual {v4, v6, v5, v3}, Ljava/util/BitSet;->set(IIZ)V

    iget v5, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v7, -0x1

    if-ne v5, v3, :cond_23

    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v5

    if-eqz v5, :cond_23

    move v5, v3

    goto :goto_24

    :cond_23
    move v5, v7

    :goto_24
    iget-boolean v8, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v8, :cond_2c

    move v8, v2

    add-int/lit8 v9, v1, -0x1

    goto :goto_2f

    :cond_2c
    move v8, v1

    add-int/lit8 v9, v2, 0x1

    :goto_2f
    if-ge v8, v9, :cond_33

    move v7, v3

    nop

    :cond_33
    move v10, v8

    :goto_34
    if-eq v10, v9, :cond_b7

    invoke-virtual {v0, v10}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v12

    check-cast v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v13, v13, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v4, v13}, Ljava/util/BitSet;->get(I)Z

    move-result v13

    if-eqz v13, :cond_5a

    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-direct {v0, v13}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkSpanForGap(Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;)Z

    move-result v13

    if-eqz v13, :cond_53

    return-object v11

    :cond_53
    iget-object v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v13, v13, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    invoke-virtual {v4, v13}, Ljava/util/BitSet;->clear(I)V

    :cond_5a
    iget-boolean v13, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v13, :cond_5f

    goto :goto_b2

    :cond_5f
    add-int v13, v10, v7

    if-eq v13, v9, :cond_b2

    add-int v13, v10, v7

    invoke-virtual {v0, v13}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    const/4 v14, 0x0

    iget-boolean v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v15, :cond_82

    iget-object v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v15

    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v3

    if-ge v15, v3, :cond_7d

    return-object v11

    :cond_7d
    if-ne v15, v3, :cond_81

    const/4 v3, 0x1

    move v14, v3

    :cond_81
    goto :goto_94

    :cond_82
    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3, v11}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v3

    iget-object v15, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v15, v13}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v15

    if-le v3, v15, :cond_91

    return-object v11

    :cond_91
    if-ne v3, v15, :cond_94

    const/4 v14, 0x1

    :cond_94
    :goto_94
    if-eqz v14, :cond_b2

    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget-object v15, v12, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v15, v15, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    iget-object v6, v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mSpan:Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iget v6, v6, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->mIndex:I

    sub-int/2addr v15, v6

    if-gez v15, :cond_a9

    const/4 v6, 0x1

    goto :goto_aa

    :cond_a9
    const/4 v6, 0x0

    :goto_aa
    if-gez v5, :cond_ae

    const/4 v15, 0x1

    goto :goto_af

    :cond_ae
    const/4 v15, 0x0

    :goto_af
    if-eq v6, v15, :cond_b2

    return-object v11

    :cond_b2
    :goto_b2
    add-int/2addr v10, v7

    const/4 v3, 0x1

    const/4 v6, 0x0

    goto/16 :goto_34

    :cond_b7
    const/4 v3, 0x0

    return-object v3
.end method

.method public invalidateSpanAssignments()V
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method isLayoutRTL()Z
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    return v1
.end method

.method public offsetChildrenHorizontal(I)V
    .registers 4

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenHorizontal(I)V

    const/4 v0, 0x0

    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_12
    return-void
.end method

.method public offsetChildrenVertical(I)V
    .registers 4

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->offsetChildrenVertical(I)V

    const/4 v0, 0x0

    :goto_4
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_12

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->onOffset(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_12
    return-void
.end method

.method public onDetachedFromWindow(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Recycler;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    :goto_6
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v0, v1, :cond_14

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_14
    return-void
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 7

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v0

    if-lez v0, :cond_35

    invoke-static {p1}, Landroid/support/v4/view/accessibility/AccessibilityEventCompat;->asRecord(Landroid/view/accessibility/AccessibilityEvent;)Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToStart(ZZ)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p0, v2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemClosestToEnd(ZZ)Landroid/view/View;

    move-result-object v1

    if-eqz v3, :cond_34

    if-nez v1, :cond_1c

    goto :goto_34

    :cond_1c
    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getPosition(Landroid/view/View;)I

    move-result v4

    if-ge v2, v4, :cond_2d

    invoke-virtual {v0, v2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    invoke-virtual {v0, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    goto :goto_35

    :cond_2d
    invoke-virtual {v0, v4}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setFromIndex(I)V

    invoke-virtual {v0, v2}, Landroid/support/v4/view/accessibility/AccessibilityRecordCompat;->setToIndex(I)V

    goto :goto_35

    :cond_34
    :goto_34
    return-void

    :cond_35
    :goto_35
    return-void
.end method

.method public onInitializeAccessibilityNodeInfoForItem(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V
    .registers 15

    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    if-nez v1, :cond_c

    invoke-super {p0, p3, p4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->onInitializeAccessibilityNodeInfoForItem(Landroid/view/View;Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;)V

    return-void

    :cond_c
    move-object v1, v0

    check-cast v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v3, 0x1

    if-nez v2, :cond_2e

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v4

    iget-boolean v2, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v2, :cond_20

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_1e
    move v5, v3

    goto :goto_21

    :cond_20
    goto :goto_1e

    :goto_21
    const/4 v6, -0x1

    const/4 v7, -0x1

    iget-boolean v8, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v9, 0x0

    invoke-static/range {v4 .. v9}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    goto :goto_48

    :cond_2e
    const/4 v2, -0x1

    const/4 v4, -0x1

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v5

    iget-boolean v6, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    if-eqz v6, :cond_3c

    iget v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    :goto_3a
    move v6, v3

    goto :goto_3d

    :cond_3c
    goto :goto_3a

    :goto_3d
    iget-boolean v7, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->mFullSpan:Z

    const/4 v8, 0x0

    move v3, v2

    invoke-static/range {v3 .. v8}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;->obtain(IIIIZZ)Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat$CollectionItemInfoCompat;

    move-result-object v2

    invoke-virtual {p4, v2}, Landroid/support/v4/view/accessibility/AccessibilityNodeInfoCompat;->setCollectionItemInfo(Ljava/lang/Object;)V

    :goto_48
    return-void
.end method

.method public onItemsAdded(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    return-void
.end method

.method public onItemsChanged(Landroid/support/v7/widget/RecyclerView;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public onItemsMoved(Landroid/support/v7/widget/RecyclerView;III)V
    .registers 6

    const/4 v0, 0x3

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    return-void
.end method

.method public onItemsRemoved(Landroid/support/v7/widget/RecyclerView;II)V
    .registers 5

    const/4 v0, 0x1

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    return-void
.end method

.method public onItemsUpdated(Landroid/support/v7/widget/RecyclerView;IILjava/lang/Object;)V
    .registers 6

    const/4 v0, 0x2

    invoke-direct {p0, p2, p3, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->handleUpdate(III)V

    return-void
.end method

.method public onLayoutChildren(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)V
    .registers 12

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mAnchorInfo:Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->reset()V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v2, -0x1

    if-nez v1, :cond_11

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    if-eq v1, v2, :cond_1b

    :cond_11
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v1

    if-nez v1, :cond_1b

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeAndRecycleAllViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    return-void

    :cond_1b
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v1, :cond_23

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->applyPendingSavedState(Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    goto :goto_2a

    :cond_23
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->resolveShouldLayoutReverse()V

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    :goto_2a
    invoke-virtual {p0, p2, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v3, 0x1

    if-nez v1, :cond_47

    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-ne v1, v4, :cond_40

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    iget-boolean v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    if-eq v1, v4, :cond_47

    :cond_40
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->clear()V

    iput-boolean v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    :cond_47
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    const/high16 v4, -0x80000000

    const/4 v5, 0x0

    if-lez v1, :cond_8d

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v1, :cond_5a

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v1, v3, :cond_8d

    :cond_5a
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    if-eqz v1, :cond_7a

    move v1, v5

    :goto_5f
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v6, :cond_8d

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    invoke-virtual {v6}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->clear()V

    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    if-eq v6, v4, :cond_77

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    iget v7, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v6, v7}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->setLine(I)V

    :cond_77
    add-int/lit8 v1, v1, 0x1

    goto :goto_5f

    :cond_7a
    move v1, v5

    :goto_7b
    iget v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v6, :cond_8d

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v6, v6, v1

    iget-boolean v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iget v8, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    invoke-virtual {v6, v7, v8}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->cacheReferenceLineAndClear(ZI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7b

    :cond_8d
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->detachAndScrapAttachedViews(Landroid/support/v7/widget/RecyclerView$Recycler;)V

    iput-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateMeasureSpecs()V

    iget v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V

    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v1, :cond_ba

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v7, v7, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v6, v7

    iput v6, v1, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    goto :goto_d5

    :cond_ba
    invoke-direct {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v6, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget-object v7, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v7, v7, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v6, v7

    iput v6, v1, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p1, v1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    :goto_d5
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_ec

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_e6

    invoke-direct {p0, p1, p2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    goto :goto_ec

    :cond_e6
    invoke-direct {p0, p1, p2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixStartGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    invoke-direct {p0, p1, p2, v5}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fixEndGap(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;Z)V

    :cond_ec
    :goto_ec
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v1

    if-nez v1, :cond_119

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-eqz v1, :cond_107

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_107

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLaidOutInvalidFullSpan:Z

    if-nez v1, :cond_106

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->hasGapsToFix()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_107

    :cond_106
    goto :goto_108

    :cond_107
    move v3, v5

    :goto_108
    move v1, v3

    if-eqz v1, :cond_115

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mCheckForGapsRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_115
    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v4, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    :cond_119
    iget-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->isLayoutRTL()Z

    move-result v1

    iput-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    const/4 v1, 0x0

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 3

    instance-of v0, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_c

    move-object v0, p1

    check-cast v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    :cond_c
    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_c

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;)V

    return-object v0

    :cond_c
    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;-><init>()V

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorLayoutFromEnd:Z

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutRTL:Z

    iput-boolean v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mLastLayoutRTL:Z

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v2, 0x0

    if-eqz v1, :cond_3a

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    if-eqz v1, :cond_3a

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mData:[I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    iget-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookup:[I

    array-length v1, v1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLazySpanLookup:Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, v1, Landroid/support/v7/widget/StaggeredGridLayoutManager$LazySpanLookup;->mFullSpanItems:Ljava/util/List;

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mFullSpanItems:Ljava/util/List;

    goto :goto_3c

    :cond_3a
    iput v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanLookupSize:I

    :goto_3c
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_9a

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    if-eqz v1, :cond_4e

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    goto :goto_52

    :cond_4e
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    :goto_52
    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findFirstVisibleItemPositionInt()I

    move-result v1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    nop

    :goto_65
    move v1, v2

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_a1

    iget-boolean v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    const/high16 v3, -0x80000000

    if-eqz v2, :cond_82

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getEndLine(I)I

    move-result v2

    if-eq v2, v3, :cond_93

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v3

    sub-int/2addr v2, v3

    goto :goto_93

    :cond_82
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    aget-object v2, v2, v1

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;->getStartLine(I)I

    move-result v2

    if-eq v2, v3, :cond_93

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v3}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v3

    sub-int/2addr v2, v3

    :cond_93
    :goto_93
    iget-object v3, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsets:[I

    aput v2, v3, v1

    add-int/lit8 v2, v1, 0x1

    goto :goto_65

    :cond_9a
    const/4 v1, -0x1

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    iput v1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mVisibleAnchorPosition:I

    iput v2, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    :cond_a1
    return-object v0
.end method

.method public onScrollStateChanged(I)V
    .registers 2

    if-nez p1, :cond_5

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->checkForGaps()Z

    :cond_5
    return-void
.end method

.method scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 11

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->ensureOrientationHelper()V

    if-lez p1, :cond_b

    const/4 v0, 0x1

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    goto :goto_10

    :cond_b
    const/4 v0, -0x1

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    :goto_10
    invoke-direct {p0, v1, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateLayoutState(ILandroid/support/v7/widget/RecyclerView$State;)V

    invoke-direct {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->setLayoutStateDirection(I)V

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iget v3, v3, Landroid/support/v7/widget/LayoutState;->mItemDirection:I

    add-int/2addr v3, v1

    iput v3, v2, Landroid/support/v7/widget/LayoutState;->mCurrentPosition:I

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    iput v2, v3, Landroid/support/v7/widget/LayoutState;->mAvailable:I

    iget-object v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLayoutState:Landroid/support/v7/widget/LayoutState;

    invoke-direct {p0, p2, v3, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->fill(Landroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/LayoutState;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v3

    if-ge v2, v3, :cond_31

    move v4, p1

    :goto_30
    goto :goto_36

    :cond_31
    if-gez p1, :cond_35

    neg-int v4, v3

    goto :goto_30

    :cond_35
    move v4, v3

    :goto_36
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    neg-int v6, v4

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/OrientationHelper;->offsetChildren(I)V

    iget-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    iput-boolean v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mLastLayoutFromEnd:Z

    return v4
.end method

.method public scrollHorizontallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public scrollToPosition(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v0, p1, :cond_f

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    :cond_f
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/high16 v0, -0x80000000

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    invoke-virtual {v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->invalidateAnchorPositionInfo()V

    :cond_9
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput p2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public scrollVerticallyBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I
    .registers 5

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->scrollBy(ILandroid/support/v7/widget/RecyclerView$Recycler;Landroid/support/v7/widget/RecyclerView$State;)I

    move-result v0

    return v0
.end method

.method public setGapStrategy(I)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    if-ne p1, v0, :cond_9

    return-void

    :cond_9
    if-eqz p1, :cond_17

    const/4 v0, 0x2

    if-ne p1, v0, :cond_f

    goto :goto_17

    :cond_f
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid gap strategy. Must be GAP_HANDLING_NONE or GAP_HANDLING_MOVE_ITEMS_BETWEEN_SPANS"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_17
    :goto_17
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mGapStrategy:I

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public setOrientation(I)V
    .registers 4

    if-eqz p1, :cond_e

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    goto :goto_e

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "invalid orientation."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e
    :goto_e
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    if-ne p1, v0, :cond_17

    return-void

    :cond_17
    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    iput-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    :cond_29
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public setReverseLayout(Z)V
    .registers 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    if-eq v0, p1, :cond_12

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iput-boolean p1, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mReverseLayout:Z

    :cond_12
    iput-boolean p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mReverseLayout:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    return-void
.end method

.method public setSpanCount(I)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->assertNotInLayoutOrScroll(Ljava/lang/String;)V

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-eq p1, v1, :cond_30

    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->invalidateSpanAssignments()V

    iput p1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-instance v1, Ljava/util/BitSet;

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    invoke-direct {v1, v2}, Ljava/util/BitSet;-><init>(I)V

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mRemainingSpans:Ljava/util/BitSet;

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    new-array v1, v1, [Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    iput-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    const/4 v1, 0x0

    :goto_1d
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    if-ge v1, v2, :cond_2d

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpans:[Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    new-instance v3, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;

    invoke-direct {v3, p0, v1, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager$Span;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;ILandroid/support/v7/widget/StaggeredGridLayoutManager$1;)V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1d

    :cond_2d
    invoke-virtual {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->requestLayout()V

    :cond_30
    return-void
.end method

.method public smoothScrollToPosition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;I)V
    .registers 6

    new-instance v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$2;-><init>(Landroid/support/v7/widget/StaggeredGridLayoutManager;Landroid/content/Context;)V

    invoke-virtual {v0, p3}, Landroid/support/v7/widget/LinearSmoothScroller;->setTargetPosition(I)V

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->startSmoothScroll(Landroid/support/v7/widget/RecyclerView$SmoothScroller;)V

    return-void
.end method

.method public supportsPredictiveItemAnimations()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z
    .registers 10

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->isPreLayout()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_ef

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    goto/16 :goto_ef

    :cond_e
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    const/high16 v3, -0x80000000

    if-ltz v0, :cond_ea

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$State;->getItemCount()I

    move-result v4

    if-lt v0, v4, :cond_1e

    goto/16 :goto_ea

    :cond_1e
    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v4, 0x1

    if-eqz v0, :cond_38

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mAnchorPosition:I

    if-eq v0, v2, :cond_38

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingSavedState:Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, v0, Landroid/support/v7/widget/StaggeredGridLayoutManager$SavedState;->mSpanOffsetsSize:I

    if-ge v0, v4, :cond_30

    goto :goto_38

    :cond_30
    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    goto/16 :goto_e9

    :cond_38
    :goto_38
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_c9

    iget-boolean v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mShouldReverseLayout:Z

    if-eqz v1, :cond_49

    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getLastChildPosition()I

    move-result v1

    goto :goto_4d

    :cond_49
    invoke-direct {p0}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getFirstChildPosition()I

    move-result v1

    :goto_4d
    iput v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-eq v1, v3, :cond_7f

    iget-boolean v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v1, :cond_6b

    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v2

    sub-int v2, v1, v2

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto :goto_7e

    :cond_6b
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v1

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    add-int/2addr v1, v2

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    sub-int v2, v1, v2

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    :goto_7e
    return v4

    :cond_7f
    iget-object v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedMeasurement(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v2

    if-le v1, v2, :cond_a1

    iget-boolean v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    if-eqz v2, :cond_98

    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v2

    goto :goto_9e

    :cond_98
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v2

    :goto_9e
    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    return v4

    :cond_a1
    iget-object v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedStart(Landroid/view/View;)I

    move-result v2

    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getStartAfterPadding()I

    move-result v5

    sub-int/2addr v2, v5

    if-gez v2, :cond_b4

    neg-int v3, v2

    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    return v4

    :cond_b4
    iget-object v5, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v5}, Landroid/support/v7/widget/OrientationHelper;->getEndAfterPadding()I

    move-result v5

    iget-object v6, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPrimaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v6, v0}, Landroid/support/v7/widget/OrientationHelper;->getDecoratedEnd(Landroid/view/View;)I

    move-result v6

    sub-int/2addr v5, v6

    if-gez v5, :cond_c6

    iput v5, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    return v4

    :cond_c6
    iput v3, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mOffset:I

    goto :goto_e8

    :cond_c9
    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    iget v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    if-ne v2, v3, :cond_e1

    iget v2, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    invoke-direct {p0, v2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->calculateScrollDirectionForPosition(I)I

    move-result v2

    if-ne v2, v4, :cond_db

    move v1, v4

    nop

    :cond_db
    iput-boolean v1, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mLayoutFromEnd:Z

    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    goto :goto_e6

    :cond_e1
    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    invoke-virtual {p2, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding(I)V

    :goto_e6
    iput-boolean v4, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mInvalidateOffsets:Z

    :goto_e8
    nop

    :goto_e9
    return v4

    :cond_ea
    :goto_ea
    iput v2, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPosition:I

    iput v3, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mPendingScrollPositionOffset:I

    return v1

    :cond_ef
    :goto_ef
    return v1
.end method

.method updateAnchorInfoForLayout(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)V
    .registers 4

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromPendingData(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-direct {p0, p1, p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->updateAnchorFromChildren(Landroid/support/v7/widget/RecyclerView$State;Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;)Z

    move-result v0

    if-eqz v0, :cond_e

    return-void

    :cond_e
    invoke-virtual {p2}, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->assignCoordinateFromPadding()V

    const/4 v0, 0x0

    iput v0, p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$AnchorInfo;->mPosition:I

    return-void
.end method

.method updateMeasureSpecs()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSpanCount:I

    div-int/2addr v0, v1

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    iget-object v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSecondaryOrientation:Landroid/support/v7/widget/OrientationHelper;

    invoke-virtual {v0}, Landroid/support/v7/widget/OrientationHelper;->getTotalSpace()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mFullSizeSpec:I

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mOrientation:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2e

    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    goto :goto_3c

    :cond_2e
    iget v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mSizePerSpan:I

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mHeightSpec:I

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    iput v0, p0, Landroid/support/v7/widget/StaggeredGridLayoutManager;->mWidthSpec:I

    :goto_3c
    return-void
.end method
