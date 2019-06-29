.class public Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;
.super Landroid/support/v4/app/Fragment;
.source "LiveBeautyFilterFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterStillItemHolder;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemHolder;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;,
        Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;
    }
.end annotation


# static fields
.field public static final LIVE_FILTER_NONE_ID:I

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private isAnimation:Z

.field private mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

.field private mCurrentIndex:I

.field private mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

.field private mFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;",
            ">;"
        }
    .end annotation
.end field

.field private mHolderWidth:I

.field private mLastIndex:I

.field private mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mTotalWidth:I

.field private mView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-class v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return-void
.end method

.method static synthetic access$000(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return p0
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    return p0
.end method

.method static synthetic access$300(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)I
    .locals 0

    iget p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    return p0
.end method

.method static synthetic access$400(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)Lmiui/view/animation/CubicEaseOutInterpolator;
    .locals 0

    iget-object p0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    return-object p0
.end method

.method private findIndex(I)I
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget v2, v2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->id:I

    if-ne v2, p1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method private initData()V
    .locals 2

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/camera/effect/EffectController;->getLiveFilterList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/camera/data/data/extra/DataItemLive;->getLiveFilter()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->findIndex(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    return-void
.end method

.method private initView()V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    const v1, 0x7f0e006b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCubicEaseOut:Lmiui/view/animation/CubicEaseOutInterpolator;

    new-instance v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    new-instance v0, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "effect_list"

    invoke-direct {v0, v1, v2}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getRecycledViewPool()Landroid/support/v7/widget/RecyclerView$RecycledViewPool;

    move-result-object v0

    invoke-static {}, Lcom/android/camera/effect/EffectController;->getInstance()Lcom/android/camera/effect/EffectController;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera/effect/EffectController;->getEffectCount(I)I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$EffectItemPadding;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$1;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$1;-><init>(Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    new-instance v0, Lcom/android/camera/fragment/DefaultItemAnimator;

    invoke-direct {v0}, Lcom/android/camera/fragment/DefaultItemAnimator;-><init>()V

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setChangeDuration(J)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setMoveDuration(J)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView$ItemAnimator;->setAddDuration(J)V

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mTotalWidth:I

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0009

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mHolderWidth:I

    return-void
.end method

.method private notifyItemChanged(II)V
    .locals 2

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {v1, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyItemChanged(I)V

    :cond_0
    if-le p2, v0, :cond_1

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p1, p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyItemChanged(I)V

    :cond_1
    return-void
.end method

.method private onItemSelected(IZ)V
    .locals 3

    sget-object v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onItemSelected: index = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", fromClick = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/android/camera/log/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object p2

    const/16 v0, 0xa4

    invoke-virtual {p2, v0}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object p2

    check-cast p2, Lcom/android/camera/protocol/ModeProtocol$ConfigChanges;

    if-nez p2, :cond_0

    sget-object p1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    const-string p2, "onItemSelected: configChanges = null"

    invoke-static {p1, p2}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->selectItem(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    sget-object p2, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid filter id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method private scrollIfNeed(I)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_2

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findFirstCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastVisibleItemPosition()I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {v0}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->findLastCompletelyVisibleItemPosition()I

    move-result v0

    if-ne p1, v0, :cond_3

    :cond_1
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    add-int/lit8 p1, p1, 0x1

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {v1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->getItemCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPosition(I)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    const/4 v1, 0x0

    add-int/lit8 p1, p1, -0x1

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPosition(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method private selectItem(I)V
    .locals 1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    iput v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    iput p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->scrollIfNeed(I)V

    iget p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLastIndex:I

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->notifyItemChanged(II)V

    :cond_0
    return-void
.end method

.method private showSelected(Landroid/widget/ImageView;I)V
    .locals 7

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0a0114

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0115

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    float-to-int v2, v0

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v4, Landroid/graphics/Paint;

    invoke-direct {v4}, Landroid/graphics/Paint;-><init>()V

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v5, Landroid/graphics/RectF;

    const/high16 v6, 0x40800000    # 4.0f

    invoke-direct {v5, v6, v6, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v3, v5, v1, v1, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    new-instance v2, Landroid/graphics/PorterDuffXfermode;

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v2, v5}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {v1, p2, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    const/4 p2, 0x0

    invoke-virtual {v3, p2}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v0

    const/16 v1, 0xa1

    invoke-virtual {v0, v1}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v0

    check-cast v0, Lcom/android/camera/protocol/ModeProtocol$CameraAction;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lcom/android/camera/protocol/ModeProtocol$CameraAction;->isDoingAction()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    if-ne v0, p1, :cond_2

    return-void

    :cond_2
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->isAnimation:Z

    invoke-static {}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getInstance()Lcom/android/camera/protocol/ModeCoordinatorImpl;

    move-result-object v1

    const/16 v2, 0xc9

    invoke-virtual {v1, v2}, Lcom/android/camera/protocol/ModeCoordinatorImpl;->getAttachProtocol(I)Lcom/android/camera/protocol/ModeProtocol$BaseProtocol;

    move-result-object v1

    check-cast v1, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    sget-object v3, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "filter_path:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v5, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget-object v5, v5, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/android/camera/log/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget-object v0, v0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->directoryName:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setFilter(ZLjava/lang/String;)V

    goto :goto_0

    :cond_3
    const/4 v3, 0x0

    invoke-interface {v1, v0, v3}, Lcom/android/camera/protocol/ModeProtocol$LiveConfigChanges;->setFilter(ZLjava/lang/String;)V

    :goto_0
    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemLive()Lcom/android/camera/data/data/extra/DataItemLive;

    move-result-object v0

    iget-object v1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilters:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;

    iget v1, v1, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$LiveFilterItem;->id:I

    invoke-virtual {v0, v1}, Lcom/android/camera/data/data/extra/DataItemLive;->setLiveFilter(I)V

    :cond_4
    invoke-direct {p0, p1, v2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->onItemSelected(IZ)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p3, 0x7f040047

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->initView()V

    invoke-direct {p0}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->initData()V

    :cond_0
    iget-object p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mView:Landroid/view/View;

    return-object p1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget p1, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mTotalWidth:I

    div-int/lit8 p1, p1, 0x2

    iget p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mHolderWidth:I

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, p2

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mFilterItemAdapter:Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;

    invoke-virtual {p2}, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment$FilterItemAdapter;->notifyDataSetChanged()V

    iget-object p2, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mLayoutManager:Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    iget v0, p0, Lcom/android/camera/fragment/beauty/LiveBeautyFilterFragment;->mCurrentIndex:I

    invoke-virtual {p2, v0, p1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->scrollToPositionWithOffset(II)V

    return-void
.end method
