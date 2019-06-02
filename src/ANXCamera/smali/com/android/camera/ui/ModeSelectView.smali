.class public Lcom/android/camera/ui/ModeSelectView;
.super Landroid/widget/LinearLayout;
.source "ModeSelectView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;
    }
.end annotation


# instance fields
.field private mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

.field private mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->initView()V

    return-void
.end method

.method private static final getChildMeasureWidth(Landroid/view/View;)I
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v1, v0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    if-lez v0, :cond_0

    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p0, v0, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    add-int/2addr p0, v1

    return p0
.end method

.method private scrollTo(ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    if-nez p2, :cond_0

    invoke-static {p0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->directSetResult(Landroid/view/View;I)V

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/android/camera/animation/type/TranslateXOnSubscribe;

    invoke-direct {v0, p0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;-><init>(Landroid/view/View;I)V

    const/16 p1, 0x12c

    invoke-virtual {v0, p1}, Lcom/android/camera/animation/type/TranslateXOnSubscribe;->setDurationTime(I)Lcom/android/camera/animation/type/BaseOnSubScribe;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Completable;->create(Lio/reactivex/CompletableOnSubscribe;)Lio/reactivex/Completable;

    move-result-object p1

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    return-void
.end method

.method private setSelection(ILjava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    invoke-virtual {v0, v1}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    const v2, 0x7f0d00bd

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    const v2, 0x7f0d0013

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/android/camera/ui/ColorActivateTextView;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setActivated(Z)V

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/camera/ui/ColorActivateTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0900f6

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setContentDescription(Ljava/lang/CharSequence;)V

    const/16 v3, 0x80

    invoke-virtual {v2, v3}, Lcom/android/camera/ui/ColorActivateTextView;->sendAccessibilityEvent(I)V

    :cond_2
    iput-object v2, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    nop

    move v2, v1

    :goto_0
    if-ge v1, p1, :cond_3

    invoke-virtual {p0, v1}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3}, Lcom/android/camera/Util;->getChildMeasureWidth(Landroid/view/View;)I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    invoke-static {v0}, Lcom/android/camera/ui/ModeSelectView;->getChildMeasureWidth(Landroid/view/View;)I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    add-int/2addr v2, p1

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p1, p1, 0x2

    sub-int/2addr p1, v2

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/android/camera/Util;->isLayoutRTL(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    neg-int p1, p1

    :cond_4
    invoke-direct {p0, p1, p2}, Lcom/android/camera/ui/ModeSelectView;->scrollTo(ILjava/util/List;)V

    return-void
.end method


# virtual methods
.method public init(Lcom/android/camera/data/data/global/ComponentModuleList;I)V
    .locals 8

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->removeAllViews()V

    invoke-virtual {p1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/camera/data/data/ComponentDataItem;

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v4

    const v5, 0x7f040032

    invoke-virtual {v4, v5, p0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewGroup;

    const v5, 0x7f0d0013

    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/android/camera/ui/ColorActivateTextView;

    invoke-virtual {v4, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v6, -0x66000001

    invoke-virtual {v5, v6}, Lcom/android/camera/ui/ColorActivateTextView;->setNormalCor(I)V

    iget-object v6, v2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    const/16 v7, 0xae

    if-eq v6, v7, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Lcom/android/camera/data/data/global/ComponentModuleList;->needShowLiveRedDot()Z

    move-result v7

    if-eqz v7, :cond_1

    const v7, 0x7f0d00bd

    invoke-virtual {v4, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, v3}, Landroid/view/View;->setVisibility(I)V

    const/4 v3, 0x1

    invoke-static {v3}, Lcom/android/camera/CameraSettings;->setTTLiveStickerNeedRedDot(Z)V

    :cond_1
    :goto_1
    const v3, -0xff5701

    invoke-virtual {v5, v3}, Lcom/android/camera/ui/ColorActivateTextView;->setActivateColor(I)V

    iget v2, v2, Lcom/android/camera/data/data/ComponentDataItem;->mDisplayNameRes:I

    invoke-virtual {v5, v2}, Lcom/android/camera/ui/ColorActivateTextView;->setText(I)V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v4}, Lcom/android/camera/ui/ModeSelectView;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_2
    invoke-static {p2}, Lcom/android/camera/data/data/global/ComponentModuleList;->getTransferredMode(I)I

    move-result p1

    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    if-ge v3, p2, :cond_4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/android/camera/data/data/ComponentDataItem;

    iget-object p2, p2, Lcom/android/camera/data/data/ComponentDataItem;->mValue:Ljava/lang/String;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    if-ne p2, p1, :cond_3

    const/4 p1, 0x0

    invoke-direct {p0, v3, p1}, Lcom/android/camera/ui/ModeSelectView;->setSelection(ILjava/util/List;)V

    goto :goto_3

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_4
    :goto_3
    return-void
.end method

.method public initView()V
    .locals 0

    return-void
.end method

.method public judgePosition(ILjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Lio/reactivex/Completable;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mLastActivateTextView:Lcom/android/camera/ui/ColorActivateTextView;

    invoke-virtual {v0}, Lcom/android/camera/ui/ColorActivateTextView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne v0, p1, :cond_1

    return-void

    :cond_1
    invoke-static {p1}, Lcom/android/camera/data/data/global/ComponentModuleList;->getTransferredMode(I)I

    move-result p1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_4

    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne p1, v1, :cond_2

    invoke-direct {p0, v0, p2}, Lcom/android/camera/ui/ModeSelectView;->setSelection(ILjava/util/List;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v0}, Lcom/android/camera/ui/ModeSelectView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f0d0013

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/android/camera/ui/ColorActivateTextView;

    invoke-static {}, Lcom/android/camera/Util;->isAccessible()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/android/camera/ui/ColorActivateTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/android/camera/ui/ColorActivateTextView;->setContentDescription(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Lcom/android/camera/ui/ModeSelectView;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const v1, 0x7f0d00bd

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x4

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    iget-object p1, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    invoke-interface {p1, v0}, Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;->onModeClicked(I)V

    :cond_2
    return-void
.end method

.method public setOnModeClickedListener(Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/android/camera/ui/ModeSelectView;->mOnModeClickedListener:Lcom/android/camera/ui/ModeSelectView$onModeClickedListener;

    return-void
.end method
