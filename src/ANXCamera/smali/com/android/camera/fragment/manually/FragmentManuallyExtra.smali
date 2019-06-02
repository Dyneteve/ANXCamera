.class public Lcom/android/camera/fragment/manually/FragmentManuallyExtra;
.super Lcom/android/camera/fragment/BaseFragment;
.source "FragmentManuallyExtra.java"


# static fields
.field public static final FRAGMENT_INFO:I = 0xfe


# instance fields
.field private mCurrentTitle:I

.field private mData:Lcom/android/camera/data/data/ComponentData;

.field private mExtraList:Landroid/support/v7/widget/RecyclerView;

.field private mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

.field private mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

.field private mIsAnimateIng:Z

.field private mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

.field private mNeedAnimation:Z

.field private mTargetView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/android/camera/fragment/BaseFragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    return-void
.end method

.method static synthetic access$002(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mIsAnimateIng:Z

    return p1
.end method

.method private adjustViewBackground(Landroid/view/View;I)V
    .locals 1

    invoke-static {}, Lcom/android/camera/data/DataRepository;->dataItemRunning()Lcom/android/camera/data/data/runing/DataItemRunning;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/camera/data/data/runing/DataItemRunning;->getUiStyle()I

    move-result p2

    const/4 v0, 0x3

    if-eq p2, v0, :cond_0

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const p2, 0x7f0b004b

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_0
    :pswitch_1
    const p2, 0x7f0b004c

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private initAdapter(Lcom/android/camera/data/data/ComponentData;)V
    .locals 2

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result v0

    const v1, 0x7f09006b

    if-eq v0, v1, :cond_2

    const v1, 0x7f0900b1

    if-eq v0, v1, :cond_1

    const v1, 0x7f09013d

    if-eq v0, v1, :cond_1

    const v1, 0x7f090165

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initSlideFocusView(Lcom/android/camera/data/data/ComponentData;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initHorizontalListView(Lcom/android/camera/data/data/ComponentData;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initWBRecyclerView(Lcom/android/camera/data/data/ComponentData;)V

    nop

    :goto_0
    return-void
.end method

.method private initHorizontalListView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 3

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;

    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v0, p1, v1, v2}, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;-><init>(Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraHorizontalListAdapter;->getValuePosition()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setSelection(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setVisibility(I)V

    return-void
.end method

.method private initSlideFocusView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 4

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v3, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v0, v1, p1, v2, v3}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;-><init>(Landroid/content/Context;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;)V

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setOnItemSelectListener(Lcom/android/camera/ui/HorizontalSlideView$OnItemSelectListener;)V

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setDrawAdapter(Lcom/android/camera/ui/HorizontalSlideView$HorizontalDrawAdapter;)V

    iget v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-virtual {p1, v1}, Lcom/android/camera/data/data/ComponentData;->getComponentValue(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/android/camera/fragment/manually/adapter/ExtraSlideFocusAdapter;->mapFocusToIndex(I)I

    move-result p1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    invoke-virtual {v0, p1}, Lcom/android/camera/ui/HorizontalSlideView;->setSelection(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalSlideView;->setVisibility(I)V

    return-void
.end method

.method private initWBRecyclerView(Lcom/android/camera/data/data/ComponentData;)V
    .locals 7

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v0, v0

    const/high16 v1, 0x40b00000    # 5.5f

    div-float/2addr v0, v1

    float-to-int v0, v0

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    mul-int/2addr v1, v0

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    if-ge v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    div-int/2addr v0, v1

    :cond_1
    move v6, v0

    new-instance v0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$3;

    iget v4, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iget-object v5, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    invoke-direct/range {v1 .. v6}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$3;-><init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;Lcom/android/camera/data/data/ComponentData;ILcom/android/camera/fragment/manually/ManuallyListener;I)V

    new-instance p1, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "manually_extra_list"

    invoke-direct {p1, v1, v2}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/android/camera/fragment/beauty/LinearLayoutManagerWrapper;->setOrientation(I)V

    iget-object v2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraRecyclerViewAdapter;->getValuePosition()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public animateOut()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mIsAnimateIng:Z

    new-instance v0, Lcom/android/camera/animation/type/SlideOutOnSubscribe;

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getView()Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x50

    invoke-direct {v0, v1, v2}, Lcom/android/camera/animation/type/SlideOutOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {v0}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object v0

    new-instance v1, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;

    invoke-direct {v1, p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$2;-><init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public getCurrentTitle()I
    .locals 1

    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    return v0
.end method

.method public getFragmentInto()I
    .locals 1

    const/16 v0, 0xfe

    return v0
.end method

.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f04002b

    return v0
.end method

.method protected initView(Landroid/view/View;)V
    .locals 1

    const v0, 0x7f0d009f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    const v0, 0x7f0d00a0

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/HorizontalListView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    const v0, 0x7f0d00a1

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/android/camera/ui/HorizontalSlideView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mHorizontalSlideView:Lcom/android/camera/ui/HorizontalSlideView;

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-direct {p0, p1, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->adjustViewBackground(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    return-void
.end method

.method public isAnimateIng()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mIsAnimateIng:Z

    return v0
.end method

.method public notifyDataChanged(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->notifyDataChanged(II)V

    invoke-virtual {p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->getView()Landroid/view/View;

    move-result-object p1

    iget p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    invoke-direct {p0, p1, p2}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->adjustViewBackground(Landroid/view/View;I)V

    nop

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Lcom/android/camera/fragment/BaseFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-boolean p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    if-nez p2, :cond_0

    return-void

    :cond_0
    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mIsAnimateIng:Z

    new-instance p2, Lcom/android/camera/animation/type/SlideInOnSubscribe;

    const/16 v0, 0x50

    invoke-direct {p2, p1, v0}, Lcom/android/camera/animation/type/SlideInOnSubscribe;-><init>(Landroid/view/View;I)V

    invoke-static {p2}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    new-instance p2, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$1;

    invoke-direct {p2, p0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra$1;-><init>(Lcom/android/camera/fragment/manually/FragmentManuallyExtra;)V

    invoke-virtual {p1, p2}, Lio/reactivex/Completable;->subscribe(Lio/reactivex/functions/Action;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public provideAnimateElement(ILjava/util/List;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;I)V"
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Lcom/android/camera/fragment/BaseFragment;->provideAnimateElement(ILjava/util/List;I)V

    return-void
.end method

.method public resetData(Lcom/android/camera/data/data/ComponentData;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, p1}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-virtual {p1}, Lcom/android/camera/data/data/ComponentData;->getDisplayTitleString()I

    move-result p1

    iput p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentTitle:I

    return-void
.end method

.method public setComponentData(Lcom/android/camera/data/data/ComponentData;IZLcom/android/camera/fragment/manually/ManuallyListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    iput p2, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mCurrentMode:I

    iput-boolean p3, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mNeedAnimation:Z

    iput-object p4, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    return-void
.end method

.method public showCustomWB(Lcom/android/camera/data/data/config/ComponentManuallyWB;)V
    .locals 2

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    iput-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mTargetView:Landroid/view/View;

    new-instance v0, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;

    iget-object v1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mManuallyListener:Lcom/android/camera/fragment/manually/ManuallyListener;

    invoke-direct {v0, p1, v1}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;-><init>(Lcom/android/camera/data/data/config/ComponentManuallyWB;Lcom/android/camera/fragment/manually/ManuallyListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setOnItemSingleTapDownListener(Lcom/android/camera/ui/HorizontalListView$OnSingleTapDownListener;)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    invoke-virtual {v0}, Lcom/android/camera/fragment/manually/adapter/ExtraCustomWBListAdapter;->getValuePosition()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setSelection(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraListHorizontal:Lcom/android/camera/ui/HorizontalListView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/android/camera/ui/HorizontalListView;->setVisibility(I)V

    iget-object p1, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mExtraList:Landroid/support/v7/widget/RecyclerView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void
.end method

.method public updateData()V
    .locals 1

    iget-object v0, p0, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->mData:Lcom/android/camera/data/data/ComponentData;

    invoke-direct {p0, v0}, Lcom/android/camera/fragment/manually/FragmentManuallyExtra;->initAdapter(Lcom/android/camera/data/data/ComponentData;)V

    return-void
.end method
