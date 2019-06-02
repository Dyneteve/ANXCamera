.class public Landroid/support/v13/app/FragmentTabHost;
.super Landroid/widget/TabHost;
.source "FragmentTabHost.java"

# interfaces
.implements Landroid/widget/TabHost$OnTabChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v13/app/FragmentTabHost$SavedState;,
        Landroid/support/v13/app/FragmentTabHost$DummyTabFactory;,
        Landroid/support/v13/app/FragmentTabHost$TabInfo;
    }
.end annotation


# instance fields
.field private mAttached:Z

.field private mContainerId:I

.field private mContext:Landroid/content/Context;

.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

.field private mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

.field private mRealTabContent:Landroid/widget/FrameLayout;

.field private final mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v13/app/FragmentTabHost$TabInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Landroid/support/v13/app/FragmentTabHost;->initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Landroid/widget/TabHost;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-direct {p0, p1, p2}, Landroid/support/v13/app/FragmentTabHost;->initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private doTabChanged(Ljava/lang/String;Landroid/app/FragmentTransaction;)Landroid/app/FragmentTransaction;
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2
    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_20

    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v13/app/FragmentTabHost$TabInfo;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v2}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$200(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1d

    move-object v0, v2

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_20
    if-eqz v0, :cond_78

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    if-eq v1, v0, :cond_77

    if-nez p2, :cond_2e

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p2

    :cond_2e
    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    if-eqz v1, :cond_43

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v1

    if-eqz v1, :cond_43

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_43
    if-eqz v0, :cond_75

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v1

    if-nez v1, :cond_6e

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mContext:Landroid/content/Context;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->clss:Ljava/lang/Class;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$300(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->args:Landroid/os/Bundle;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$400(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/os/Bundle;

    move-result-object v3

    invoke-static {v1, v2, v3}, Landroid/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/app/Fragment;

    move-result-object v1

    # setter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v0, v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$102(Landroid/support/v13/app/FragmentTabHost$TabInfo;Landroid/app/Fragment;)Landroid/app/Fragment;

    iget v1, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v2

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$200(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v1, v2, v3}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    goto :goto_75

    :cond_6e
    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v0}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/app/FragmentTransaction;->attach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_75
    :goto_75
    iput-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    :cond_77
    return-object p2

    :cond_78
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No tab known for tag "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private ensureContent()V
    .registers 4

    iget-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    if-nez v0, :cond_2c

    iget v0, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    invoke-virtual {p0, v0}, Landroid/support/v13/app/FragmentTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    iget-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_13

    goto :goto_2c

    :cond_13
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No tab content FrameLayout found for id "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2c
    :goto_2c
    return-void
.end method

.method private ensureHierarchy(Landroid/content/Context;)V
    .registers 9

    const v0, 0x1020013

    invoke-virtual {p0, v0}, Landroid/support/v13/app/FragmentTabHost;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_5d

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v2, v3, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v2}, Landroid/support/v13/app/FragmentTabHost;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v2, Landroid/widget/TabWidget;

    invoke-direct {v2, p1}, Landroid/widget/TabWidget;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroid/widget/TabWidget;->setId(I)V

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroid/widget/TabWidget;->setOrientation(I)V

    new-instance v4, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v5, -0x2

    const/4 v6, 0x0

    invoke-direct {v4, v3, v5, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v2, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v5, 0x1020011

    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setId(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v0, v0, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v5, Landroid/widget/FrameLayout;

    invoke-direct {v5, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object v4, v5

    iput-object v5, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    iget-object v5, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    iget v6, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    invoke-virtual {v5, v6}, Landroid/widget/FrameLayout;->setId(I)V

    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-direct {v5, v3, v0, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    invoke-virtual {v1, v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5d
    return-void
.end method

.method private initFragmentTabHost(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100f3

    aput v2, v0, v1

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-super {p0, p0}, Landroid/widget/TabHost;->setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V

    return-void
.end method


# virtual methods
.method public addTab(Landroid/widget/TabHost$TabSpec;Ljava/lang/Class;Landroid/os/Bundle;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/TabHost$TabSpec;",
            "Ljava/lang/Class<",
            "*>;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    new-instance v0, Landroid/support/v13/app/FragmentTabHost$DummyTabFactory;

    iget-object v1, p0, Landroid/support/v13/app/FragmentTabHost;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/support/v13/app/FragmentTabHost$DummyTabFactory;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroid/widget/TabHost$TabSpec;->setContent(Landroid/widget/TabHost$TabContentFactory;)Landroid/widget/TabHost$TabSpec;

    invoke-virtual {p1}, Landroid/widget/TabHost$TabSpec;->getTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/support/v13/app/FragmentTabHost$TabInfo;

    invoke-direct {v1, v0, p2, p3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;-><init>(Ljava/lang/String;Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-boolean v2, p0, Landroid/support/v13/app/FragmentTabHost;->mAttached:Z

    if-eqz v2, :cond_40

    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v2, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v2

    # setter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1, v2}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$102(Landroid/support/v13/app/FragmentTabHost$TabInfo;Landroid/app/Fragment;)Landroid/app/Fragment;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v2

    if-eqz v2, :cond_40

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Fragment;->isDetached()Z

    move-result v2

    if-nez v2, :cond_40

    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v1}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    :cond_40
    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Landroid/support/v13/app/FragmentTabHost;->addTab(Landroid/widget/TabHost$TabSpec;)V

    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 7

    invoke-super {p0}, Landroid/widget/TabHost;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/support/v13/app/FragmentTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_9
    iget-object v3, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_55

    iget-object v3, p0, Landroid/support/v13/app/FragmentTabHost;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v13/app/FragmentTabHost$TabInfo;

    iget-object v4, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$200(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v4

    # setter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v3, v4}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$102(Landroid/support/v13/app/FragmentTabHost$TabInfo;Landroid/app/Fragment;)Landroid/app/Fragment;

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v4

    if-eqz v4, :cond_52

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Fragment;->isDetached()Z

    move-result v4

    if-nez v4, :cond_52

    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->tag:Ljava/lang/String;
    invoke-static {v3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$200(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_43

    iput-object v3, p0, Landroid/support/v13/app/FragmentTabHost;->mLastTab:Landroid/support/v13/app/FragmentTabHost$TabInfo;

    goto :goto_52

    :cond_43
    if-nez v1, :cond_4b

    iget-object v4, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v4}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    :cond_4b
    # getter for: Landroid/support/v13/app/FragmentTabHost$TabInfo;->fragment:Landroid/app/Fragment;
    invoke-static {v3}, Landroid/support/v13/app/FragmentTabHost$TabInfo;->access$100(Landroid/support/v13/app/FragmentTabHost$TabInfo;)Landroid/app/Fragment;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/FragmentTransaction;->detach(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    :cond_52
    :goto_52
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    :cond_55
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v13/app/FragmentTabHost;->mAttached:Z

    invoke-direct {p0, v0, v1}, Landroid/support/v13/app/FragmentTabHost;->doTabChanged(Ljava/lang/String;Landroid/app/FragmentTransaction;)Landroid/app/FragmentTransaction;

    move-result-object v1

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    iget-object v2, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-virtual {v2}, Landroid/app/FragmentManager;->executePendingTransactions()Z

    :cond_66
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/TabHost;->onDetachedFromWindow()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v13/app/FragmentTabHost;->mAttached:Z

    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .registers 4

    move-object v0, p1

    check-cast v0, Landroid/support/v13/app/FragmentTabHost$SavedState;

    invoke-virtual {v0}, Landroid/support/v13/app/FragmentTabHost$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, v1}, Landroid/widget/TabHost;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-object v1, v0, Landroid/support/v13/app/FragmentTabHost$SavedState;->curTab:Ljava/lang/String;

    invoke-virtual {p0, v1}, Landroid/support/v13/app/FragmentTabHost;->setCurrentTabByTag(Ljava/lang/String;)V

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .registers 4

    invoke-super {p0}, Landroid/widget/TabHost;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Landroid/support/v13/app/FragmentTabHost$SavedState;

    invoke-direct {v1, v0}, Landroid/support/v13/app/FragmentTabHost$SavedState;-><init>(Landroid/os/Parcelable;)V

    invoke-virtual {p0}, Landroid/support/v13/app/FragmentTabHost;->getCurrentTabTag()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Landroid/support/v13/app/FragmentTabHost$SavedState;->curTab:Ljava/lang/String;

    return-object v1
.end method

.method public onTabChanged(Ljava/lang/String;)V
    .registers 3

    iget-boolean v0, p0, Landroid/support/v13/app/FragmentTabHost;->mAttached:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v13/app/FragmentTabHost;->doTabChanged(Ljava/lang/String;Landroid/app/FragmentTransaction;)Landroid/app/FragmentTransaction;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    :cond_e
    iget-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    invoke-interface {v0, p1}, Landroid/widget/TabHost$OnTabChangeListener;->onTabChanged(Ljava/lang/String;)V

    :cond_17
    return-void
.end method

.method public setOnTabChangedListener(Landroid/widget/TabHost$OnTabChangeListener;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v13/app/FragmentTabHost;->mOnTabChangeListener:Landroid/widget/TabHost$OnTabChangeListener;

    return-void
.end method

.method public setup()V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Must call setup() that takes a Context and FragmentManager"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setup(Landroid/content/Context;Landroid/app/FragmentManager;)V
    .registers 3

    invoke-direct {p0, p1}, Landroid/support/v13/app/FragmentTabHost;->ensureHierarchy(Landroid/content/Context;)V

    invoke-super {p0}, Landroid/widget/TabHost;->setup()V

    iput-object p1, p0, Landroid/support/v13/app/FragmentTabHost;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    invoke-direct {p0}, Landroid/support/v13/app/FragmentTabHost;->ensureContent()V

    return-void
.end method

.method public setup(Landroid/content/Context;Landroid/app/FragmentManager;I)V
    .registers 6

    invoke-direct {p0, p1}, Landroid/support/v13/app/FragmentTabHost;->ensureHierarchy(Landroid/content/Context;)V

    invoke-super {p0}, Landroid/widget/TabHost;->setup()V

    iput-object p1, p0, Landroid/support/v13/app/FragmentTabHost;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/support/v13/app/FragmentTabHost;->mFragmentManager:Landroid/app/FragmentManager;

    iput p3, p0, Landroid/support/v13/app/FragmentTabHost;->mContainerId:I

    invoke-direct {p0}, Landroid/support/v13/app/FragmentTabHost;->ensureContent()V

    iget-object v0, p0, Landroid/support/v13/app/FragmentTabHost;->mRealTabContent:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p3}, Landroid/widget/FrameLayout;->setId(I)V

    invoke-virtual {p0}, Landroid/support/v13/app/FragmentTabHost;->getId()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_21

    const v0, 0x1020012

    invoke-virtual {p0, v0}, Landroid/support/v13/app/FragmentTabHost;->setId(I)V

    :cond_21
    return-void
.end method
